Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36FB6C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Feb 2022 10:39:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SO3boTcFhHQ6o2QYYqkmqByHQDdpm5gG1mOG3QfRnCA=; b=spqeuYQbCNrRfZ
	A0+oaGLKzAkFt8m5a9qZ8pbDZaVF92oQfW6njipXlKxjIn+WrOXyQWGjw5t5mwYe2TpD93hF/k0Dj
	otc0IoLWKIjscWiOT6n5UCXNzG18q6aQK+i/nHTo+X6Cxo7hur79j/f7W7nD8mGVof3cJrrfyF2eu
	tzkT557UcD1ZOK0101Sej2APuIGJIcHvTPMdOxpVcIsB77jOGsGu1mtkLutj9ism5nnPVoNDfuVwX
	XspdgEhI52h3NRPVzyyx1qZfbLhJ3ErK54Cb5NzMOTtfldANrKKuHM8wfzbXr+2qAIM+DwI4SAe2K
	UunLVzHicYx4TrDe3c+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nITL7-006c9g-W1; Fri, 11 Feb 2022 10:39:46 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nITJx-006blf-Gv; Fri, 11 Feb 2022 10:38:36 +0000
X-UUID: 5870b32a09534c6f80133b3e09b5eb83-20220211
X-UUID: 5870b32a09534c6f80133b3e09b5eb83-20220211
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <jiaxin.yu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1557676913; Fri, 11 Feb 2022 03:38:26 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 11 Feb 2022 02:38:25 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 11 Feb 2022 18:38:23 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 11 Feb 2022 18:38:23 +0800
From: Jiaxin Yu <jiaxin.yu@mediatek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>, <tiwai@suse.com>,
 <robh+dt@kernel.org>, <matthias.bgg@gmail.com>, <perex@perex.cz>,
 <p.zabel@pengutronix.de>, <geert+renesas@glider.be>
CC: <trevor.wu@mediatek.com>, <tzungbi@google.com>, <zhangqilong3@huawei.com>, 
 <alsa-devel@alsa-project.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, Jiaxin Yu
 <jiaxin.yu@mediatek.corp-partner.google.com>, Jiaxin Yu
 <jiaxin.yu@mediatek.com>
Subject: [PATCH 01/15] ASoC: mediatek: mt6366: add codec driver
Date: Fri, 11 Feb 2022 18:38:04 +0800
Message-ID: <20220211103818.8266-2-jiaxin.yu@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220211103818.8266-1-jiaxin.yu@mediatek.com>
References: <20220211103818.8266-1-jiaxin.yu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220211_023833_632665_86036062 
X-CRM114-Status: UNSURE (   9.53  )
X-CRM114-Notice: Please train this message.
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

From: Jiaxin Yu <jiaxin.yu@mediatek.corp-partner.google.com>

Mt6366 is a new version of mt6358, and they are same about audio part.
So we can reuse the driver of mt6358.

Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>
---
 sound/soc/codecs/Kconfig  | 8 ++++++++
 sound/soc/codecs/Makefile | 2 ++
 2 files changed, 10 insertions(+)

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index 8fa24783ce01..6631094678f5 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -132,6 +132,7 @@ config SND_SOC_ALL_CODECS
 	imply SND_SOC_MT6351
 	imply SND_SOC_MT6358
 	imply SND_SOC_MT6359
+	imply SND_SOC_MT6366
 	imply SND_SOC_MT6660
 	imply SND_SOC_NAU8315
 	imply SND_SOC_NAU8540
@@ -1888,6 +1889,13 @@ config SND_SOC_MT6359_ACCDET
 	  for ASoC codec soc-jack detection mechanism.
 	  Select N if you don't have jack on board.
 
+config SND_SOC_MT6366
+	tristate "MediaTek MT6366 Codec"
+	depends on MTK_PMIC_WRAP
+	help
+	  Enable support for the platform which uses MT6366 as
+	  external codec device.
+
 config SND_SOC_MT6660
 	tristate "Mediatek MT6660 Speaker Amplifier"
 	depends on I2C
diff --git a/sound/soc/codecs/Makefile b/sound/soc/codecs/Makefile
index 42d00aa4ee46..df6518306cd4 100644
--- a/sound/soc/codecs/Makefile
+++ b/sound/soc/codecs/Makefile
@@ -137,6 +137,7 @@ snd-soc-mt6351-objs := mt6351.o
 snd-soc-mt6358-objs := mt6358.o
 snd-soc-mt6359-objs := mt6359.o
 snd-soc-mt6359-accdet-objs := mt6359-accdet.o
+snd-soc-mt6366-objs := mt6358.o
 snd-soc-mt6660-objs := mt6660.o
 snd-soc-nau8315-objs := nau8315.o
 snd-soc-nau8540-objs := nau8540.o
@@ -465,6 +466,7 @@ obj-$(CONFIG_SND_SOC_MT6351)	+= snd-soc-mt6351.o
 obj-$(CONFIG_SND_SOC_MT6358)	+= snd-soc-mt6358.o
 obj-$(CONFIG_SND_SOC_MT6359)	+= snd-soc-mt6359.o
 obj-$(CONFIG_SND_SOC_MT6359_ACCDET) += mt6359-accdet.o
+obj-$(CONFIG_SND_SOC_MT6366)	+= snd-soc-mt6366.o
 obj-$(CONFIG_SND_SOC_MT6660)	+= snd-soc-mt6660.o
 obj-$(CONFIG_SND_SOC_NAU8315)   += snd-soc-nau8315.o
 obj-$(CONFIG_SND_SOC_NAU8540)   += snd-soc-nau8540.o
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
