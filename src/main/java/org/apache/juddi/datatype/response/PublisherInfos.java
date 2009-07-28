/*
 * Copyright 2001-2004 The Apache Software Foundation.
 * 
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 * 
 *      http://www.apache.org/licenses/LICENSE-2.0
 * 
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package org.apache.juddi.datatype.response;

import java.util.Vector;

import org.apache.juddi.datatype.RegistryObject;

/**
 * @author Steve Viens (sviens@apache.org)
 */
public class PublisherInfos implements RegistryObject
{
  Vector publisherInfoVector;

  /**
   * default constructor
   */
  public PublisherInfos()
  {
  }

  /**
   *
   */
  public PublisherInfos(int size)
  {
    this.publisherInfoVector = new Vector(size);
  }

  /**
   *
   */
  public void addPublisherInfo(PublisherInfo info)
  {
    // if info is null then simply return, nothing to add
    if (info == null)
      return;

    if (this.publisherInfoVector == null)
      this.publisherInfoVector = new Vector();
    this.publisherInfoVector.add(info);
  }

  /**
   *
   */
  public void setPublisherInfoVector(Vector infos)
  {
    this.publisherInfoVector = infos;
  }

  /**
   *
   */
  public Vector getPublisherInfoVector()
  {
    return this.publisherInfoVector;
  }

  /**
   *
   */
  public String toString()
  {
    StringBuffer buffer = new StringBuffer();

    if (this.publisherInfoVector != null)
      for (int i=0; i<this.publisherInfoVector.size(); i++)
        buffer.append(this.publisherInfoVector.elementAt(i));

    return buffer.toString();
  }
}