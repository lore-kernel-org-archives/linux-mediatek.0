Return-Path: <SRS0=WaF/=KA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2F69C433ED
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 May 2021 08:07:11 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 65E14610A5
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 May 2021 08:07:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 65E14610A5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=kpQuK/1HxKCJ/XPK6330dovtjtAhTq9G0IWHg8274Js=; b=kike2gtZC1HnOW3DNwg7m2nP3
	cKBV88tNglbeeQlRhLdSuj/2u2w0Uss0NHX3/aaxmLoa7jIQdnefGEBD/qS+H+16czIe/fHL9n92S
	vMcn1O1E9RzEm96712U13YOdS6w3erbj+6h8JJbEXiz+O7pYPQTadiV8ppqyW6Enf4exjOaTDMNMK
	FNvnquTNjtJGQ++0j4avKEG06zmbiRVSnr+Vbh31vGxcxGgQW2R/yOYEnMrIklbPEL0gNdaOnZkfr
	KgrRi8xeurJCzIKGVadzaJErt8I7GdC/JnLlTJKLzbGVv00rA/NihpGYPG4S3YcRvWQbUs/X25ACl
	DKUGTME5A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1leCYN-000bMm-ON; Wed, 05 May 2021 08:06:44 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leCYL-000bM0-1c; Wed, 05 May 2021 08:06:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
 To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=HpFFAA7D7YLKW/xr0/02UbHBDzZwW06dnz24tC2b6k4=; b=QC7y28rfSB4/WZ4yjveuSwDv84
 WULdPgcU1BSwpfMG77VaJwxVXdU+D8vXZUkxRhoueJomI6jRUkP+NlCHCfzF7yUO6gJJfQSVjrd4Z
 seFDtPov44x6Svv32bkHhnYuQQSEkFQzFeWdbcMV/XgfZnQLng9XzbFJgvoBsHjLqvSximCc91dqm
 XQKueGZDumk7qZ73Xn6E5UTVNl1VyEzX81aIwiFkQnH/En9FfWMpMvmGsk8jKkZxHy4ShnTa8CTUD
 Y7whZXyBcptzEJmpfAy8YEd9DpCArA7nWlXFrAVM5mUZ/FhWxzTFcJZ0wM1Y/0H1LlINhRder7LRJ
 H4ZqZ25A==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leCYG-004YQb-6k; Wed, 05 May 2021 08:06:39 +0000
X-UUID: f42266eb38bb452ca9652a2d9c89d231-20210505
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=HpFFAA7D7YLKW/xr0/02UbHBDzZwW06dnz24tC2b6k4=; 
 b=b+ARAJda6E/jDuhYkZWw7lbwyJhGR+6tuo5uvGCxbQddhDKn9jrYTeaBqU/MNSvm3Y7Ct6rtv+VOQrhMRaaQxYewIjWMn2x+qWZlGoStQ6uQQmPJmRrVzlLd7M4m2/YjEjqkxar798cmuiREtUIsMJgUwvh6UQN9BLeQW2aIKK4=;
X-UUID: f42266eb38bb452ca9652a2d9c89d231-20210505
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <louis.kuo@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1734903121; Wed, 05 May 2021 01:06:32 -0700
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 5 May 2021 01:06:31 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 5 May 2021 16:06:29 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 5 May 2021 16:06:29 +0800
From: Louis Kuo <louis.kuo@mediatek.com>
To: <sakari.ailus@linux.intel.com>, <laurent.pinchart@ideasonboard.com>,
 <mchehab@kernel.org>, <matthias.bgg@gmail.com>, <hverkuil-cisco@xs4all.nl>,
 <arnd@arndb.de>, <louis.kuo@mediatek.com>, <sergey.senozhatsky@gmail.com>,
 <helen.koike@collabora.com>, <niklas.soderlund+renesas@ragnatech.se>,
 <yepeilin.cs@gmail.com>
CC: <frederic.chen@mediatek.com>, <linux-media@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>
Subject: [RFC PATCH V0 2/4] media: subdev: support which in
 v4l2_subdev_frame_interval
Date: Wed, 5 May 2021 16:06:24 +0800
Message-ID: <20210505080626.15432-3-louis.kuo@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210505080626.15432-1-louis.kuo@mediatek.com>
References: <20210505080626.15432-1-louis.kuo@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210505_010637_675876_78F00FEB 
X-CRM114-Status: GOOD (  12.41  )
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

This patch is to support try or set of VIDIOC_SUBDEV_ENUM_FRAME_INTERVAL
through which parameter.
This behavior is already supported in some similar V4L2 IOCTLs such as
VIDIOC_SUBDEV_ENUM_FRAME_SIZE for the same reason.

Signed-off-by: Louis Kuo <louis.kuo@mediatek.com>
---
 include/uapi/linux/v4l2-subdev.h | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/include/uapi/linux/v4l2-subdev.h b/include/uapi/linux/v4l2-subdev.h
index d6ffd5981c68..9d64feaa693b 100644
--- a/include/uapi/linux/v4l2-subdev.h
+++ b/include/uapi/linux/v4l2-subdev.h
@@ -120,12 +120,13 @@ struct v4l2_subdev_frame_size_enum {
  * struct v4l2_subdev_frame_interval - Pad-level frame rate
  * @pad: pad number, as reported by the media API
  * @interval: frame interval in seconds
- * @reserved: drivers and applications must zero this array
+ * @which: format type (from enum v4l2_subdev_format_whence)
  */
 struct v4l2_subdev_frame_interval {
 	__u32 pad;
 	struct v4l2_fract interval;
-	__u32 reserved[9];
+	__u32 which;
+	__u32 reserved[8];
 };
 
 /**
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
