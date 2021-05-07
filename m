Return-Path: <SRS0=vvwr=KC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8333EC433B4
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 May 2021 07:46:48 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 22EE761019
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 May 2021 07:46:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 22EE761019
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=wz++u6RT2b4MPmft0kHOIimjSZoE4A0vm3CxPIyVA7s=; b=mMtlxUeug7B5BqIcTM635WPt+
	uMCZcqJGGN4nSHRelWSsECjb8W4X/1lxN2MT8R/BE0YEGkEljxWO9yV0IRl6+EZjkHgqVmZ/TMMYL
	flYJMVvrwAdU3nonqVK7AiyQT0k6dHHb1ubHJnOzXhLaspKJz9PHUykqhHONBrfEd6aVZpMoUo3tF
	lYy9vXx33B/8ZIwIEFgJJgZUs6RY0m4lRqOVTWzvzF7J9tBE1Vcy5aNetEEhTFW0UFaaWtW6iGtz4
	t7LO8wO1kkPnrO+W39GSBUxzhtDeb9FOux59jK54PfXk4SOg2AYmV1Tto8I0kg91YZmnuCH/lmA7N
	/6iWito8w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1levBu-006PzX-PM; Fri, 07 May 2021 07:46:31 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1levBp-006Pxe-9c; Fri, 07 May 2021 07:46:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
 To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=nq22+gWwcmKMv5WSbTh6PmbcQeaBas8aQfnLYMcStYI=; b=oK/f/ptJEH1Z33p1g7hitkExtG
 hp0Rlq6yHuSj5m/p7UiyCMnhYYDY6nASihrOuC9Mkye+ylYTET+s1AXY6UwKo7pmk+njUSkT1EDKJ
 nuelwPa2FHa9XyFP6NanGex4mui0Q+hkMPx+HpHoejXKtBo6WFlF3Mt0Vl9u3VcOydtSL35k+I1Db
 z8i4dzOromrO3uBunK3ebwKi4XCSCCp2aL9IjwS09JxlkWjT1i0c2eZNcKwkJ5MZArXJXycp/ex8l
 kWtmVqwgVJTHbvjH1jI+v7Bq6uXmaukhfT1ZrAgyeZRFSzy3zfPha6Hjk6Uk4muRdfgi9sw7J1NaB
 dSwt6Vwg==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1levBm-006f9V-Ml; Fri, 07 May 2021 07:46:24 +0000
X-UUID: cfd30ed0117748628f7e6a39e87b14a3-20210507
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=nq22+gWwcmKMv5WSbTh6PmbcQeaBas8aQfnLYMcStYI=; 
 b=fC5/waCwAYlOAPAMIyR3TJ56cOmSlILpKfclzsAqlS6PVNDBvoqgR8sDRChATYmRTDY6HuUOOU8sQOPTbZQTQdz7ZfKLywqoz62cr2XY+iw03moK+dwAUwHerrNqKRUzMOjmVwWE/fRGbob+kcUwpUJXBL88pur2gb5zW46IUd4=;
X-UUID: cfd30ed0117748628f7e6a39e87b14a3-20210507
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <louis.kuo@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1266612406; Fri, 07 May 2021 00:46:15 -0700
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 7 May 2021 00:46:14 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 7 May 2021 15:46:11 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 7 May 2021 15:46:11 +0800
From: Louis Kuo <louis.kuo@mediatek.com>
To: <sakari.ailus@linux.intel.com>, <laurent.pinchart@ideasonboard.com>,
 <mchehab@kernel.org>, <matthias.bgg@gmail.com>, <hverkuil-cisco@xs4all.nl>,
 <arnd@arndb.de>, <louis.kuo@mediatek.com>, <sergey.senozhatsky@gmail.com>,
 <helen.koike@collabora.com>, <niklas.soderlund+renesas@ragnatech.se>,
 <yepeilin.cs@gmail.com>
CC: <frederic.chen@mediatek.com>, <linux-media@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>
Subject: [RESENT PATCH V0 3/4] media: v4l2-ctrl: Add ISP Camsys user control
Date: Fri, 7 May 2021 15:46:03 +0800
Message-ID: <20210507074604.15079-4-louis.kuo@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210507074604.15079-1-louis.kuo@mediatek.com>
References: <20210507074604.15079-1-louis.kuo@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 6BA450B502D3B2C084112B9B12478CCC6F63A90150F67F045AFBCA2C6778DB472000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210507_004622_769428_7CB9FBCD 
X-CRM114-Status: GOOD (  10.31  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This patch is to add V4L2_CID_USER_MTK_CAM_BASE for Mediatek ISP-only
features. For example, we have some hits from user to let driver select
internal path and resource usage.
(e.g. use multiple engine or bining the image or use higher clk and power).

Signed-off-by: Louis Kuo <louis.kuo@mediatek.com>
---
 include/uapi/linux/v4l2-controls.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
index d43bec5f1afd..5f664b98fc58 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -194,6 +194,10 @@ enum v4l2_colorfx {
  * We reserve 16 controls for this driver. */
 #define V4L2_CID_USER_IMX_BASE			(V4L2_CID_USER_BASE + 0x10b0)
 
+/* The base for the mediatek camsys driver controls */
+/* We reserve 48 controls for this driver. */
+#define V4L2_CID_USER_MTK_CAM_BASE		(V4L2_CID_USER_BASE + 0x10d0)
+
 /*
  * The base for the atmel isc driver controls.
  * We reserve 32 controls for this driver.
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
