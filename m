Return-Path: <SRS0=vvwr=KC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7E73C433ED
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 May 2021 07:49:41 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4FB95613C2
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 May 2021 07:49:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4FB95613C2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=kpQuK/1HxKCJ/XPK6330dovtjtAhTq9G0IWHg8274Js=; b=NdPXICgkrloio/yWM06iJ7/Gi
	qSEC1xLYAJATvXkR5K/gJiI5glNzcTBFlbn1HYjm5Db4xc5nWdfGI5GNaJ+/aUg8zyJ1UEFlMZD2g
	8hZR4qes5KJb5ce61p8YMjUgZEGiTmwBNX2ukLEnwbARAvYnAYyro7pl3P1YgWO9Yl9vEoHAh83q9
	GQ6Z1Mju/L5O0rCHzxirg9aIP+ATanBF0TdVdv3vyxrRxwgHJM6EsRC372po3kbaOtYN3NYmeX7PG
	CdmJGIhaMawh01v43Dk9jIN7xetjmYMcEcWLpdjF7gZYX77beCS9v1kq1dIWaWQNTmzm7GXWvg3Wh
	hWjvD/CKA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1levEq-006Qic-0H; Fri, 07 May 2021 07:49:32 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1levEo-006Qi4-3r; Fri, 07 May 2021 07:49:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
 To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=HpFFAA7D7YLKW/xr0/02UbHBDzZwW06dnz24tC2b6k4=; b=0Riz8PLvTFqITsjMUt7D0NE+6J
 H6jFOFmxTqbGGR8wsNkNxyFChB1JAp68yG44wsx6/F4oXS+lr90w/D+7Xw0JnR60VHMcZKu80xw1H
 hcjMuaLMe8HUjyZaqG7QLj5qshqzKfd9j0yDL3CV6bec/z1NkngdWJsa/XGmYKOb4hgl0CnePHzZp
 rjWX5MW7iPA5grnVybmZXcHMOVE7GwMNejdP4APbt3FA5ADvUhjf3kjodlepMeDKTMFT1/iykSHJA
 mZOnIZaS3YLh3J7bAnpCD8QJkH1G/A8lRwEQ1RKbnzmDGtfxn/3VXgJHxqOli1lM0aT/fd0gWu5Aq
 rvrEUZ2A==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1levEk-006fJK-VX; Fri, 07 May 2021 07:49:28 +0000
X-UUID: 8a24c3ea048242c59ba8ac61854e812b-20210507
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=HpFFAA7D7YLKW/xr0/02UbHBDzZwW06dnz24tC2b6k4=; 
 b=qa1jQMQFQduAGpzaSczp3nL05KYnrZsrAyMxgiSv4wDXiO7RepR/kWcMxHJvwC+Z7u6WoaLYOji46TqpXdec1ba7Z0UraDz4Etv9TG49hGYU4rF82z3M+m/9xcY5I+hk9tYH+qDMSs1R3oYUZnDhF00wkzANovv6/UX+nLyL2I0=;
X-UUID: 8a24c3ea048242c59ba8ac61854e812b-20210507
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <louis.kuo@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1898311543; Fri, 07 May 2021 00:49:25 -0700
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 7 May 2021 00:46:13 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
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
Subject: [RESENT PATCH V0 2/4] media: subdev: support which in
 v4l2_subdev_frame_interval
Date: Fri, 7 May 2021 15:46:02 +0800
Message-ID: <20210507074604.15079-3-louis.kuo@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210507074604.15079-1-louis.kuo@mediatek.com>
References: <20210507074604.15079-1-louis.kuo@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210507_004927_039975_F4B64717 
X-CRM114-Status: GOOD (  12.04  )
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
