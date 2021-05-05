Return-Path: <SRS0=WaF/=KA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E5ADC433B4
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 May 2021 08:07:39 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F3BE6613C4
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 May 2021 08:07:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F3BE6613C4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=4IU938wDcw65UopeIEtZ1XdQxQUxWtVIBuZJgTgAQRg=; b=Gwt7Kk3/E6lvUVqk0jyygz7Qg
	n+P3bihu2mp7Z2ZdBwTRV1yGw5eTv85zf5qkb/S80Ovd2TU5Sixh1vwXzF/mN2Wuea0/qoFzcT3m2
	iiiah2knYJWay+5PDbSGQuo+WMhf+uYwdTP4Ls1vtaDUmbYB84VH5uTp5Ui8QHaRoeHX8SO1d/3zK
	hcX6uvQO3xiclGvIJmGSZXoy8orjuv+1stkcAo853/1C8a19DC44wXvGEGshNTwZMELCAgzlR9W3+
	cJqUkgiOoPcYsIH3yJYlSegBp9StRBMj+gfTdK6/NS4ZW/oEKYofTSHcmTqw7DY/r+tjo7APD/hj7
	VaRvnyr0A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1leCYx-000bRn-38; Wed, 05 May 2021 08:07:19 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leCYM-000bMh-TB; Wed, 05 May 2021 08:06:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
 To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=vvi4gD5QVU5mw4EzZdkOTVn1sikh2ecV1uHlBS2C5uw=; b=wV96GsClUrXyIL0my2ik2p4iUc
 TN15iAy/lEHPqdQbEXsl9Lm0QpvGi/GcLQlDMvc/t/aaeU4ly2S7DZH8CFPTQyB/wlTie004usw9V
 Kjd0t2KB2VL1EzvgQIbjdmUfEbmRtC/0US0ekClR+CulesLzLfv5nsZJfEVi+bjNCrZ0voLu0kmfJ
 ZNEX4d8hh6DKixdKZk/9JuXBMgvRdibfTqKnZvqxqOOrauyXRr+1HWjdVaS17bSfAndnO4SWAyt1j
 XqwGxr818c6ckTw9RSPNiUO98MC8PM1K7oE93U14W7vaQgo7YNDWnW8bQdiT+h+QO+C9W2anjknKa
 lsi9SyCA==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leCYK-004YRq-Cf; Wed, 05 May 2021 08:06:41 +0000
X-UUID: 3aad135296cd4627895fc69c96a4d97f-20210505
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=vvi4gD5QVU5mw4EzZdkOTVn1sikh2ecV1uHlBS2C5uw=; 
 b=iXLNhTF22+P6Lc/SLo5//kLMu/BUvFXJN9BC19aBNbLN5PoFDtM26mVfCvr9goZsYYysKH06+pNctwX+lJ9vYoaato2rc82WhGzZfbaoc4gmMP5PilPY1zPD6B9ZTUoMs8l4UF3E501glShOygGX6WCCsgALpRjuXDO9FZrVELc=;
X-UUID: 3aad135296cd4627895fc69c96a4d97f-20210505
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <louis.kuo@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1706638356; Wed, 05 May 2021 01:06:33 -0700
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 5 May 2021 01:06:32 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
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
Subject: [RFC PATCH V0 3/4] media: v4l2-ctrl: Add ISP Camsys user control
Date: Wed, 5 May 2021 16:06:25 +0800
Message-ID: <20210505080626.15432-4-louis.kuo@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210505080626.15432-1-louis.kuo@mediatek.com>
References: <20210505080626.15432-1-louis.kuo@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 2AD440AB152DF74CCB18EBD6FA67A0AF2586E335DB4BE4A90D62AE7605D4D11E2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210505_010640_475478_695E5E94 
X-CRM114-Status: GOOD (  10.74  )
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
features. For example, we have some hits from users to let drivers select
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
