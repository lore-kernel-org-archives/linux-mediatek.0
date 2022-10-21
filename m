Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD1EAC433FE
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Oct 2022 08:48:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VDtPL7fkaCFAp3KfpjYgG/R3mid8Rw0WiVwoN+Pwb6M=; b=c/5ehQTWGA1LArqN5andpEsdre
	8tLurQlAO2Nt7Qu9sci590tw/Hs8ypFgFcut2HfTYz42mmdLSMY80hTL4DmWqGDqUsFluAnhXwTIo
	PxmQ1d8xPUttHxXm6ggTS6rXKlvJNclQrBsMaBbuXUTagp9IeNSCZcJRI3ivnXB7HxLCFKX74ipJ1
	whiJiC7fVMpkjmMaMDKv2TP6bd8DtFg6kaaZHfYGV1ZWT/RunY3cyaXioKAJJETogUMatvrIBw1wG
	O44petYGiciRmgCuyG3llQlWn/YvukXhV/KxeW5bf9TU6U+XOC8zaA5/m2T05ePI+g0oGix7WUX+Z
	Mw071uqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olnhu-006ViP-LY; Fri, 21 Oct 2022 08:48:46 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olnhA-006VKf-Ha
	for linux-mediatek@lists.infradead.org; Fri, 21 Oct 2022 08:48:04 +0000
Received: by mail-wr1-x434.google.com with SMTP id bp11so3433152wrb.9
        for <linux-mediatek@lists.infradead.org>; Fri, 21 Oct 2022 01:47:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VDtPL7fkaCFAp3KfpjYgG/R3mid8Rw0WiVwoN+Pwb6M=;
        b=SaC3/AqQNnhlmygAxmEsqoIpED788Sg1O1M4mwdd4LihqskwD53Z6+rBAQeyAnWRdj
         RQNg4nM9PBDydzEFc6h2iv/9blckNa10wbzhdMNXMkmC/RLGrSrtVuM5TWa0dqw+Rtnq
         3E2oGhW8JqFgXhYHhWM17+zM/RsRtsiv8CI6hWtgxGHFWRhwwfRSvdr9ApnTqI5AK8VI
         P658S8m8K7vDQu1YFxYPG6zDQ0d7XsYZNJvyw70S7wQbtvIL7/0y13uvNLDwmzucLJeQ
         m19AGGxUyJzLzfmVKhpMaOFTWsfjwwPeXUifg3fooY9nNUqJQhAFzNsv2/FmoymE/Jdh
         kOiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VDtPL7fkaCFAp3KfpjYgG/R3mid8Rw0WiVwoN+Pwb6M=;
        b=KaMAE+bZYP1PdaFNXFtBAZsHizWbZXRQ/ezETWcf7qO+D3gVMo4Qv7Dla8zzLzsfrt
         pkPIyCVAwPrMbRtlxaDMgMTNL8I4BLc1wM1uApxfGnn+HmhEHoJ0iIIa4AlmwMFnymjo
         NYMIB44gSXIMNNeH1tjPFIimJ6lMSPr5kUrOIwqW10BZNbJFdUZEq8pY3OouvOd4AYQE
         QKJMxI729XCLAoArUFNVzyW2UcjR+/bZuUvRNEu/AnAal8GUSErwTior3HfbkWdK+m70
         Vpq7rr1br/RTtISxSi6SrL6kgSBIJxZwsQXaWmzxoG5D7HphXWitymt8f7rOeCA7kv2l
         WXQw==
X-Gm-Message-State: ACrzQf0Fk4Y8mvfi0f9Gyto9+3hWakwRBEDnEiLz/vUBB3LVzFi/nOzN
	t4gOQowuEwz9912Uz6TlMxnYzg==
X-Google-Smtp-Source: AMsMyM7zvf0JLCBhMlobPuIA2iHhJ1o+FgclTU3OJG8WbwhWecxsKXKVKWubyy7f0Cz1XxndijfJaw==
X-Received: by 2002:a05:6000:1d82:b0:22c:ae77:c8dc with SMTP id bk2-20020a0560001d8200b0022cae77c8dcmr11751829wrb.413.1666342076824;
        Fri, 21 Oct 2022 01:47:56 -0700 (PDT)
Received: from localhost.localdomain (laubervilliers-657-1-248-155.w90-24.abo.wanadoo.fr. [90.24.137.155])
        by smtp.gmail.com with ESMTPSA id k5-20020a05600c0b4500b003c41144b3cfsm2040233wmr.20.2022.10.21.01.47.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Oct 2022 01:47:56 -0700 (PDT)
From: bchihi@baylibre.com
To: sean.wang@kernel.org,
	linus.walleij@linaro.org,
	matthias.bgg@gmail.com
Cc: linux-mediatek@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [v2, 1/2] pinctrl: mediatek: common: add mt8365_set_clr_mode() callback for broken SET/CLR modes
Date: Fri, 21 Oct 2022 10:47:07 +0200
Message-Id: <20221021084708.1109986-2-bchihi@baylibre.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221021084708.1109986-1-bchihi@baylibre.com>
References: <20221021084708.1109986-1-bchihi@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221021_014800_643459_803B1A50 
X-CRM114-Status: GOOD (  14.34  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Balsam CHIHI <bchihi@baylibre.com>

On MT8365, the SET/CLR of the mode is broken and some pin modes won't
be set correctly.
Add mt8365_set_clr_mode() callback for such SoCs, so that instead of
using the SET/CLR register, use the main R/W register to
read/update/write the modes.

Co-developed-by: Fabien Parent <fparent@baylibre.com>
Signed-off-by: Fabien Parent <fparent@baylibre.com>
Signed-off-by: Balsam CHIHI <bchihi@baylibre.com>
---
 drivers/pinctrl/mediatek/pinctrl-mtk-common.c | 15 +++++++++++++++
 drivers/pinctrl/mediatek/pinctrl-mtk-common.h |  8 +++++++-
 2 files changed, 22 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
index f25b3e09386b..076ae0b38e3d 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
@@ -330,6 +330,21 @@ static int mtk_pconf_set_pull_select(struct mtk_pinctrl *pctl,
 		return -EINVAL;
 	}
 
+	if (pctl->devdata->mt8365_set_clr_mode) {
+		bit = pin & pctl->devdata->mode_mask;
+		reg_pullen = mtk_get_port(pctl, pin) +
+			pctl->devdata->pullen_offset;
+		reg_pullsel = mtk_get_port(pctl, pin) +
+			pctl->devdata->pullsel_offset;
+		ret = pctl->devdata->mt8365_set_clr_mode(mtk_get_regmap(pctl, pin),
+			bit, reg_pullen, reg_pullsel,
+			enable, isup);
+		if (ret)
+			return -EINVAL;
+
+		return 0;
+	}
+
 	bit = BIT(pin & pctl->devdata->mode_mask);
 	if (enable)
 		reg_pullen = SET_ADDR(mtk_get_port(pctl, pin) +
diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common.h b/drivers/pinctrl/mediatek/pinctrl-mtk-common.h
index 6fe8564334c9..11afa12a96cb 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mtk-common.h
+++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common.h
@@ -216,7 +216,10 @@ struct mtk_eint_offsets {
  * @spec_dir_set: In very few SoCs, direction control registers are not
  * arranged continuously, they may be cut to parts. So they need special
  * dir setting.
-
+ * @mt8365_set_clr_mode: In mt8365, some pins won't set correcty because they
+ * need to use the main R/W register to read/update/write the modes instead of
+ * the SET/CLR register.
+ *
  * @dir_offset: The direction register offset.
  * @pullen_offset: The pull-up/pull-down enable register offset.
  * @pinmux_offset: The pinmux register offset.
@@ -252,6 +255,9 @@ struct mtk_pinctrl_devdata {
 	void (*spec_pinmux_set)(struct regmap *reg, unsigned int pin,
 			unsigned int mode);
 	void (*spec_dir_set)(unsigned int *reg_addr, unsigned int pin);
+	int (*mt8365_set_clr_mode)(struct regmap *regmap,
+			unsigned int bit, unsigned int reg_pullen, unsigned int reg_pullsel,
+			bool enable, bool isup);
 	unsigned int dir_offset;
 	unsigned int ies_offset;
 	unsigned int smt_offset;
-- 
2.34.1


