Return-Path: <SRS0=ZThz=44=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27EC9C10F27
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Mar 2020 13:53:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F2B1321D56
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Mar 2020 13:53:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fsl1ur9o";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="fNiqoxvB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F2B1321D56
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=oracle.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0AEUUHiKhq0AqRjdoh7bsvIuBFPLCjY8+dh/GuopaSg=; b=fsl1ur9ocmBbKZ
	IGqQFVpPLyQCGJl5l8pXPvjAofuoDK5Dg1BETHAx+Q3+pXf6HOoTJBWCvxqEpPht4N6BVnIJvQSvs
	/sBCGigXa9asVwI144mKlmVuRVScxRL2r5oLZ8Z5Nmc3z8fchlYfmU4fRbqUVOzV6PX2bWBmK+dAw
	jEtmR3E+VbUVPIDOU4qW8Xedsq8m/GF+RbDvi+eRI5JainGPzKOn6xHIC0GrhJIiw28anDE9PBKQO
	34SyMoOFXl8Oy8wm07cXIUddVPIgLp+befIipTkB9HS8qZb2HatDJ4VK8UtdEDBrlPJgM3Ik8XNtJ
	3WAIH5JghRz1PCh1KUZw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jC1mz-0007Dn-Md; Wed, 11 Mar 2020 13:52:49 +0000
Received: from aserp2120.oracle.com ([141.146.126.78])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jC1mw-0007C9-Kk
 for linux-mediatek@lists.infradead.org; Wed, 11 Mar 2020 13:52:47 +0000
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 02BDmOEx164241;
 Wed, 11 Mar 2020 13:52:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=SBe9Kbu74oZCq4ntccHPVuFD0Y4+f3seyI6PfS0faYE=;
 b=fNiqoxvBD6Xjn6GyUb4fL4ggv7TMunlYWYdjCXehjZgJ0vEpmb5YWPe0DHDFg1yseIal
 3hkEr8GnTqJdjNC+pbGmU5LCV5dWMtTcbO3xd+HkRsSC+w2mfpdeTBdCePSEjMxhTspn
 DgVilGDUsG1Qb0xZru3n6peyHHRUq8S9CdcSdef142Ox9U3EQk7NZGBwo7ThSvFPrsVd
 4IWnsnKnde/q1PBnv6+GdJ3fgIh9Jjr4R4wW8UX5xbKkwXobdykoYoxWqezO9RgR4BxL
 AVrcHq+qwfnehkCTbq9DMPESv+wyRImkAxjG/0vwmYIYkqNTQpu/8rktUpUjcUzZOn0W Vg== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by aserp2120.oracle.com with ESMTP id 2yp9v66st4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 11 Mar 2020 13:52:39 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 02BDoJEi073447;
 Wed, 11 Mar 2020 13:52:38 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by aserp3030.oracle.com with ESMTP id 2yp8q02hk9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 11 Mar 2020 13:52:38 +0000
Received: from abhmp0011.oracle.com (abhmp0011.oracle.com [141.146.116.17])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 02BDqavN001379;
 Wed, 11 Mar 2020 13:52:36 GMT
Received: from mwanda (/41.57.98.10) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 11 Mar 2020 06:52:35 -0700
Date: Wed, 11 Mar 2020 16:52:27 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Felix Fietkau <nbd@nbd.name>, Ryder Lee <ryder.lee@mediatek.com>
Subject: [PATCH] mt76: mt7615: remove a stray if statement
Message-ID: <20200311135227.GA16505@mwanda>
MIME-Version: 1.0
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9556
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 malwarescore=0
 mlxlogscore=999 bulkscore=0 suspectscore=0 mlxscore=0 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2003110088
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9556
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 spamscore=0 mlxscore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 mlxlogscore=999
 phishscore=0 adultscore=0 clxscore=1011 impostorscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2001150001
 definitions=main-2003110088
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200311_065246_769940_1DD9AE7C 
X-CRM114-Status: GOOD (  12.25  )
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
Cc: kernel-janitors@vger.kernel.org, linux-wireless@vger.kernel.org,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org,
 Roy Luo <royluo@google.com>, Lorenzo Bianconi <lorenzo.bianconi83@gmail.com>,
 Kalle Valo <kvalo@codeaurora.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This if statement was supposed to be deleted, but it wasn't.  It means
that we sometimes don't set the sensitivity correctly.

Fixes: 2cad515ece8a ("mt76: mt7615: add missing settings for simultaneous dual-band support")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/net/wireless/mediatek/mt76/mt7615/mac.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mac.c b/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
index 145366dbc39b..64b6bc3c1e02 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
@@ -1630,7 +1630,6 @@ mt7615_mac_adjust_sensitivity(struct mt7615_phy *phy,
 				 MT_WF_PHY_PD_OFDM(ext_phy, val));
 		} else {
 			val = *sensitivity + 256;
-			if (!ext_phy)
 			mt76_rmw(dev, MT_WF_PHY_RXTD_CCK_PD(ext_phy),
 				 MT_WF_PHY_PD_CCK_MASK(ext_phy),
 				 MT_WF_PHY_PD_CCK(ext_phy, val));
-- 
2.20.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
