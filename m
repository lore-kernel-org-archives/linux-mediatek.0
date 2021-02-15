Return-Path: <SRS0=c1Sc=HR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F8D3C433E0
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Feb 2021 08:49:11 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8A31D64D79
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Feb 2021 08:49:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8A31D64D79
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=oracle.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=XGwkOb0ylVLITm2l50f+42rzTfcLWRCXe9bCHh72QXo=; b=KeU4f1g8o+O5W3R3HxhrnK6evM
	iLOQxtp2a+6gBDmGUhVkDfOwV48z1FriLL6in8qOP6SdBSzQ0UHta7fGWWlNywB06TMfj2YmZfNhy
	2Y0qeKb3E9KL3XpAJynaZcv+tlorizKqVmsQsr0dXzvPQIV2KBUT8XwbTDwS3EdA4CVdg8pcEtCzL
	yB+UM9MFqh9uxTP37HbsjUahKKmJks+cDIqGr4FXn0Kiq2WpfrVQxtq96NTtmhdL0kkY3vNuZ6EXe
	EzKqgaZthsl0ViabKaKd6LtknhbinxIQMDNm+M4+qwpIpVfi/vh6HIiwdEszS4LXfY1ODnnPh9nSL
	YjfL/Wsw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lBZYz-0005CR-KY; Mon, 15 Feb 2021 08:49:01 +0000
Received: from userp2130.oracle.com ([156.151.31.86])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lBZYx-0005Bm-Kj; Mon, 15 Feb 2021 08:49:00 +0000
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 11F8ivLR178433;
 Mon, 15 Feb 2021 08:48:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=Xfhey/bo90jfmBPbM+2E163w24r9+9IZ7tWGd58E4+4=;
 b=Nypnlw8SzegJJe9yx4VtUfEZDJIrTeLmKvDFIdY3Ww1WmMK2E1wYE1u/H5lVdHhYMZmA
 xSW6iS1o8ftGeewUIEGwWu0AAy9ZciOgRV9HNkKXRS3+S3DU5CDMHbecZ1tuK92xioLW
 9V6gAY6udj2Z0gYVkjhY5imhTj86RZZimF7Ay27juB32YcAFkLCdpuL/7sJcXDxs7Ie+
 CX2rfKeeYoy8QZ4f0ich63BWfUQp91Wg+HcxxZ7PkqPqWvJn5ZEj0+f+UTRaoiYxrJ3l
 YkI9iMH/MO6sYoK5zVNxHVd7GJI2EQbgXE17xKAd3wES/4LvKoHmdESZgYJylDMsC4aq 0A== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by userp2130.oracle.com with ESMTP id 36p66qu9bj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 15 Feb 2021 08:48:49 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 11F8jt0P091335;
 Mon, 15 Feb 2021 08:48:48 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by userp3030.oracle.com with ESMTP id 36prpvb0ff-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 15 Feb 2021 08:48:47 +0000
Received: from abhmp0017.oracle.com (abhmp0017.oracle.com [141.146.116.23])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 11F8mf3X019195;
 Mon, 15 Feb 2021 08:48:45 GMT
Received: from mwanda (/102.36.221.92) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 15 Feb 2021 00:48:41 -0800
Date: Mon, 15 Feb 2021 11:48:35 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: enric.balletbo@collabora.com
Subject: [bug report] soc: mediatek: pm-domains: Don't print an error if
 child domain is deferred
Message-ID: <YCo1Y6oA0BDzgk3o@mwanda>
MIME-Version: 1.0
Content-Disposition: inline
X-Proofpoint-IMR: 1
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9895
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 mlxlogscore=999
 phishscore=0 adultscore=0 mlxscore=0 suspectscore=0 malwarescore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102150074
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9895
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 lowpriorityscore=0 suspectscore=0
 impostorscore=0 priorityscore=1501 clxscore=1011 spamscore=0 mlxscore=0
 phishscore=0 malwarescore=0 bulkscore=0 adultscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2102150074
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210215_034859_828926_9183D572 
X-CRM114-Status: GOOD (  14.82  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hello Enric Balletbo i Serra,

The patch dd65030295e2: "soc: mediatek: pm-domains: Don't print an
error if child domain is deferred" from Jan 13, 2021, leads to the
following static checker warning:

	drivers/soc/mediatek/mtk-pm-domains.c:492 scpsys_add_subdomain()
	warn: missing error code here? 'IS_ERR()' failed. 'ret' = '0'

drivers/soc/mediatek/mtk-pm-domains.c
   485  
   486                  parent_pd = scpsys->pd_data.domains[id];
   487  
   488                  child_pd = scpsys_add_one_domain(scpsys, child);
   489                  if (IS_ERR(child_pd)) {
   490                          dev_err_probe(scpsys->dev, PTR_ERR(child_pd),
   491                                        "%pOF: failed to get child domain id\n", child);
   492                          goto err_put_node;

The patch was trying to return success if PTR_ERR(child_pd) == -EPROBE_DEFER
but instead it always returns success.  Shouldn't it just be something
like:
				ret = PTR_ERR(child_pd);
				if (ret == -EPROBE_DEFER)
					ret = 0;

   493                  }
   494  
   495                  ret = pm_genpd_add_subdomain(parent_pd, child_pd);
   496                  if (ret) {
   497                          dev_err(scpsys->dev, "failed to add %s subdomain to parent %s\n",
   498                                  child_pd->name, parent_pd->name);
   499                          goto err_put_node;
   500                  } else {
   501                          dev_dbg(scpsys->dev, "%s add subdomain: %s\n", parent_pd->name,
   502                                  child_pd->name);
   503                  }
   504  
   505                  /* recursive call to add all subdomains */
   506                  ret = scpsys_add_subdomain(scpsys, child);
   507                  if (ret)
   508                          goto err_put_node;
   509          }
   510  
   511          return 0;
   512  
   513  err_put_node:
   514          of_node_put(child);
   515          return ret;
   516  }

regards,
dan carpenter

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
