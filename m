Return-Path: <SRS0=SHoq=2V=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 148ACC2D0C2
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 Dec 2019 13:52:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DF846205ED
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 Dec 2019 13:52:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="biMfez5U";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="pFSxLtfC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DF846205ED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0yGH8DwxH+oidxQod0stysomPafnA2El2LV/NekU0VM=; b=biMfez5UusV1/Y
	5GkwzUtEVqMWjYZgHD5ZFwPfexzFDQR4fKkwejVI4vpUjHnVxl+34Hyk93BO1U2sV0HmSN5+UlnjE
	qg7uMG8F/p28jCz3TGUysIB7nDzjyjSsGsA4KTTtl5hG2DsHIDXSi0wKEPvEEE+srOLEAWJuAcIbm
	aMZHrxa9qmwINmqrjeWgTwlZZw3Kioqk7pFCJboI2aeGsJwHdWhFqmhWKRS4A5c4M8We/C+z7jUn1
	USKqRedjH/4g9n4MTh6xyDtPJXZ3WESRk2hFiMKt7GJ1QeaZpnTMzVsnGMGcoS8nZ2zSAcWAUAAcm
	DT0j6MD/njWKgzclMF9A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1imHwI-0006bq-M9; Tue, 31 Dec 2019 13:52:02 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1imHwE-0006Xd-M6
 for linux-mediatek@lists.infradead.org; Tue, 31 Dec 2019 13:52:00 +0000
X-UUID: a38b132b5a7b4262a43b9bff89ab2295-20191231
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=NLtkQQyY/v3TFNS8jAK/8vskPM99kmaO4X9cQGAedV0=; 
 b=pFSxLtfCyOvLV7n30H6OXdiOAxAAIp35FkVaKASUBKKoAJX1hBrF/mu65eZtDgSn32G03EEkAHE8vviscGOU95FW9FCDdUgOgdbhZ0VlJfG0iCiNbwIEPrG91szXIsNNanNqLtpfm5URGiMjp5OZkb6hOQN85pi9hrypVKI5n3I=;
X-UUID: a38b132b5a7b4262a43b9bff89ab2295-20191231
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <light.hsieh@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1956492801; Tue, 31 Dec 2019 05:51:53 -0800
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 31 Dec 2019 05:42:21 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 31 Dec 2019 21:41:01 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Tue, 31 Dec 2019 21:41:16 +0800
From: Light Hsieh <light.hsieh@mediatek.com>
To: <linus.walleij@linaro.org>
Subject: [PATCH v7 2/6] Supporting driving setting without mapping current to
 register value
Date: Tue, 31 Dec 2019 21:41:43 +0800
Message-ID: <1577799707-11855-2-git-send-email-light.hsieh@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1577799707-11855-1-git-send-email-light.hsieh@mediatek.com>
References: <1577799707-11855-1-git-send-email-light.hsieh@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191231_055158_737905_6B263B7B 
X-CRM114-Status: UNSURE (   8.75  )
X-CRM114-Notice: Please train this message.
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
Cc: sean.wang@kernel.org, kuohong.wang@mediatek.com,
 linux-kernel@vger.kernel.org, Light Hsieh <light.hsieh@mediatek.com>,
 linux-gpio@vger.kernel.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

MediaTek's smarphone project actual usage does need to know current value
(in mA) in procedure of finding the best driving setting.
The steps in the procedure is like as follow:

1. set driving setting field in setting register as 0, measure waveform,
   perform test, and etc.
2. set driving setting field in setting register as 1, measure waveform,
   perform test, and etc.
...
n. set driving setting field in setting register as n-1, measure
   waveform, perform test, and etc.
Check the results of steps 1~n and adopt the setting that get best result.

This procedure does need to know the mapping between current to register
value.
Therefore, setting driving without mapping current is more practical for
MediaTek's smartphone usage.

Change-Id: I8bd6a2cecc0af650923704589b5b90097b0ff77e
---
 drivers/pinctrl/mediatek/pinctrl-mt6765.c        |  4 ++--
 drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c | 12 ++++++++++++
 drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h |  5 +++++
 3 files changed, 19 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-mt6765.c b/drivers/pinctrl/mediatek/pinctrl-mt6765.c
index 32451e8..1212264 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mt6765.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mt6765.c
@@ -1077,8 +1077,8 @@
 	.bias_disable_get = mtk_pinconf_bias_disable_get,
 	.bias_set = mtk_pinconf_bias_set,
 	.bias_get = mtk_pinconf_bias_get,
-	.drive_set = mtk_pinconf_drive_set_rev1,
-	.drive_get = mtk_pinconf_drive_get_rev1,
+	.drive_set = mtk_pinconf_drive_set_raw,
+	.drive_get = mtk_pinconf_drive_get_raw,
 	.adv_pull_get = mtk_pinconf_adv_pull_get,
 	.adv_pull_set = mtk_pinconf_adv_pull_set,
 };
diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
index d63e05e..2247eae 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
@@ -608,6 +608,18 @@ int mtk_pinconf_drive_get_rev1(struct mtk_pinctrl *hw,
 	return 0;
 }
 
+int mtk_pinconf_drive_set_raw(struct mtk_pinctrl *hw,
+			       const struct mtk_pin_desc *desc, u32 arg)
+{
+	return mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_DRV, arg);
+}
+
+int mtk_pinconf_drive_get_raw(struct mtk_pinctrl *hw,
+			       const struct mtk_pin_desc *desc, int *val)
+{
+	return mtk_hw_get_value(hw, desc, PINCTRL_PIN_REG_DRV, val);
+}
+
 int mtk_pinconf_adv_pull_set(struct mtk_pinctrl *hw,
 			     const struct mtk_pin_desc *desc, bool pullup,
 			     u32 arg)
diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h
index 1b7da42..75d0e07 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h
+++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h
@@ -288,6 +288,11 @@ int mtk_pinconf_drive_set_rev1(struct mtk_pinctrl *hw,
 int mtk_pinconf_drive_get_rev1(struct mtk_pinctrl *hw,
 			       const struct mtk_pin_desc *desc, int *val);
 
+int mtk_pinconf_drive_set_raw(struct mtk_pinctrl *hw,
+			       const struct mtk_pin_desc *desc, u32 arg);
+int mtk_pinconf_drive_get_raw(struct mtk_pinctrl *hw,
+			       const struct mtk_pin_desc *desc, int *val);
+
 int mtk_pinconf_adv_pull_set(struct mtk_pinctrl *hw,
 			     const struct mtk_pin_desc *desc, bool pullup,
 			     u32 arg);
-- 
1.8.1.1.dirty
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
