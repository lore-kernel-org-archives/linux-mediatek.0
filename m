Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAB32606A329
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Nov 2026 18:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rR+C4V+w;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=W872M/3/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=/AVctQ+aR6nnVUb3bzlRRJ+51PbpL8MX28yvtpVethA=; b=rR+C4V+wh4+6B4
	MvDpDaPKaZ/iOGmIf7CS5JQ6KB6V0DsjFp0ob/wbNvSwHj4Ae4PdcA3UcZKj3Zq6ST2Dbmll3Wqxk
	A5v3jCS6TYmbUVPb1mrR7sYgnjgTS+SVdb83GCUBT+Z2W3UeStYVjt0uLkAxu9QyzBMl6ET7+6uSk
	ylCBYWisPfysmvNzmmTXUxVqYw9w/JJ9tgNN9WyQLORqp1us/ux2ttxQnBu0e1m36O84P6qiS67fP
	k4d5JST4C/L+DSKX3CqzQIEZlYnn+PwDdprP2PnlixO6lYcJmS2C8FrhhxMJplF011FsD0rrDmUXO
	B2EbW/Vd5+YHv3H/eXTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT1jB-00000003dPK-2g9z;
	Mon, 16 Nov 2026 18:46:53 +0000
Received: from mail-oa2-x09.google.com ([2607:f8b0:4864:30::9])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT1j2-00000003dJu-2jZK
	for linux-mediatek@lists.infradead.org;
	Mon, 16 Nov 2026 18:46:46 +0000
Received: by mail-oa2-x09.google.com with SMTP id 586e51a60fabf-4abbe52a747so1408820fac.1
        for <linux-mediatek@lists.infradead.org>; Mon, 16 Nov 2026 10:46:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794854803; x=1795459603; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/AVctQ+aR6nnVUb3bzlRRJ+51PbpL8MX28yvtpVethA=;
        b=W872M/3/TcyD1Bq6SpE+FB2KrCqfmq67pTI1wrECfbQFg23ahjFHNLGhAHH3uZ4e3M
         TdYKSu/opCqhhUdqSsftqaJacu4U1+LuurswDupawN1oeKjYR4Zf4vf9zumvaJCVMKTK
         OPErs/zy9CrJslB3qbZEHXZzrpOwTlA9WeqIyX5dDZi4CgJ8GZYeHz4bH87yA/Jl2h6R
         iy90Mdk3SWyncgFNcZJo+FOd5Cqz244remZ5SCb4KS4Oc99c5Wr7lDOmXLnaHAXJ8398
         y+h1UGCMKEzJvMPUmT7NwZi4mpTuLBhpyorMLNGFwolGPGfwPPRpO+Bq/mN7gjAIl6nm
         6YjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794854803; x=1795459603;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/AVctQ+aR6nnVUb3bzlRRJ+51PbpL8MX28yvtpVethA=;
        b=Nh2Pqnazlejngs7YRoOzjRS7J7B7TkWGkGLvJNFFSwB+EjKl2mhdtSduD0en1xWttY
         bF5eHRcwmiDeU+o8q8o72zj0YIU7/sPZ5cDzJLE7Zmv65U9CXroZVncI/qkGvvbimmq5
         2ZGspn1w73U9rYpUyBtkI0sFbi8WV2tSqPtFZ8L1yUJBcPdM6wT+VL1Bi0ZaT7+kfdrV
         bNb9Mk2Y/fPFh2/g6QrgPJ5GwacdNBA6UMTmQlnx+dpssNyvPBV4lELw8RykWatcUSWR
         A3pPknHRlOWOXJTjJPOmlUAbglxd1Ky2gsKfvQOcFwNDBX+IXTpSjCJuVNyOXovfPb+O
         b9+w==
X-Forwarded-Encrypted: i=1; AL+hErHk+Y5hf2Ei5GKmOT/4Dv6kRHvHmEPS0/PBb862Ro7hxoJuoUEvP/9cD6n8CWPRT/ufE/RQHqdO7dXQiIAtAg==@lists.infradead.org
X-Gm-Message-State: APuU4Z+eDE9rbM6w79jDzQ+x0m9xpn8PnQ4Yetsxu5tGPnx0b6Wa2/hq
	O9lbYIFCnupr6tra4L52LiiQAJzYN10qgfVWYY6le63M551V4ISjfx0CDWw/BuplZ6OXhA==
X-Gm-Gg: AYBFou0D6Y5DL0LIXr0FtP2Gq/k+3CQWDlnFuDvBYEE//2ckE+tFA9nKzC+M4CFSot3
	m+m5A4SpVtAuy041NwuuM8b+ERYrvdZXvb73So4nDL/WQI6Z7SQYUKmkZSHqMu2RMYJKwk1Dr7o
	6WXyhJehRu/dKIvlXaa5EwKWRfutWVdxukJ9cMR3CakNYaJl2LaAelDB5Rv9uG2RpnwdzIfaQzR
	wC96U7U0yrIMtRLwkNH8/Oy0R3Kr+xuwsaQZUtQS65H+qFp6J7ln5qoqG7XWcKE7SwlbXcBKsUg
	CHvEkUC/mJBPN2j6ytNM7nem4pbTjuMsTHNMbtlOZb7wdI7N7rJZhFwnYEF2w2+FmgT6wYFKgwF
	5UmOyMl8faZt71WEddL9zy+uSz7rnlKWyf4vxuisp9kSm9365qhTEKTHZOndq2iDHM77F8WDpRC
	lL41lGP+3IK+sOYs9+Eu4oKoNwUtGspEwbybUKkQxuU6XTlRycoED4dIW1Vr6MVjANiqNf2tBGJ
	uFgAwOIYqfjOQN9B7aCUoI67YDfokJA+fJKMSBWCBiLChFvn6wWo/f0/kAUP7SFnOFnRmNS8Ouh
	pbKSW3SEx51YFjjzdtwfjasevTlIsq++/vWtiGFv/Ve+SmFVoTyXsGdXu1ykY5I3QGlRaII51Jv
	GXDjDdiKg6MAlcnY3iSQ=
X-Received: by 2002:a05:6870:1794:b0:448:c946:9ae1 with SMTP id 586e51a60fabf-4afdf492de7mr9534453fac.18.1794854803469;
        Mon, 16 Nov 2026 10:46:43 -0800 (PST)
Received: from [10.10.18.223] (wsip-64-207-253-118.tu.ok.cox.net. [64.207.253.118])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4afe242b670sm7210735fac.17.2026.11.16.10.46.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 10:46:42 -0800 (PST)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Mon, 16 Nov 2026 12:46:34 -0600
Subject: [PATCH v3 2/2] rtc: mt6397: provide the 32 kHz output as a clock
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261116-rbrue-suez-upstreaming-mt6397-rtc-32k-v3-2-179145eb7e89@gmail.com>
References: <20261116-rbrue-suez-upstreaming-mt6397-rtc-32k-v3-0-179145eb7e89@gmail.com>
In-Reply-To: <20261116-rbrue-suez-upstreaming-mt6397-rtc-32k-v3-0-179145eb7e89@gmail.com>
To: Sen Chu <sen.chu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Macpaul Lin <macpaul.lin@mediatek.com>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Eddie Huang <eddie.huang@mediatek.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-pm@vger.kernel.org, mfd@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-rtc@vger.kernel.org, Ryan Brue <ryanbrue.dev@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794854794; l=4985;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=5Ww9Gje6b1XRBnVHPbGKqTnDhZK8UEbEzy3EbOlGhe8=;
 b=0RKmfCD3eY+/9AN9a1rhsVOFhEDM/PpOvKN0oMv1Ca3hnbVA3HFzfLgmOVAArB7TAbJEd394l
 xnjgKaYm14uBsCI5inKdYxKpwUyUOaFw96x0xaydSQa3fLA0llXYaqC
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_104644_739346_26FD898F 
X-CRM114-Status: GOOD (  19.67  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The RTC's 32 kHz output is gated by RTC_CON.F32KOB, which the vendor
kernel clears before it powers the Wi-Fi/Bluetooth combo chip. Mainline
never touches it, so on a board whose bootloader leaves it set, such a
chip has no sleep clock and does not come up.

Register the output as a clock when the RTC node has #clock-cells, so
the chip's power sequence can enable it.

Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
 drivers/rtc/rtc-mt6397.c       | 88 ++++++++++++++++++++++++++++++++++++++++++
 include/linux/mfd/mt6397/rtc.h |  6 +++
 2 files changed, 94 insertions(+)

diff --git a/drivers/rtc/rtc-mt6397.c b/drivers/rtc/rtc-mt6397.c
index 5afdb707a5b5..d24f0ccc132c 100644
--- a/drivers/rtc/rtc-mt6397.c
+++ b/drivers/rtc/rtc-mt6397.c
@@ -6,6 +6,7 @@
 
 #include <linux/array_size.h>
 #include <linux/bitfield.h>
+#include <linux/clk-provider.h>
 #include <linux/err.h>
 #include <linux/interrupt.h>
 #include <linux/mfd/mt6397/core.h>
@@ -318,6 +319,87 @@ static int mtk_rtc_nvram_write(void *priv, unsigned int offset, void *val,
 	return ret;
 }
 
+#ifdef CONFIG_COMMON_CLK
+static int mtk_rtc_clkout_set(struct clk_hw *hw, bool on)
+{
+	struct mt6397_rtc *rtc = container_of(hw, struct mt6397_rtc, clkout);
+	int ret;
+
+	mutex_lock(&rtc->lock);
+	ret = regmap_update_bits(rtc->regmap,
+				 rtc->addr_base + rtc->data->control_reg,
+				 RTC_CON_F32KOB, on ? 0 : RTC_CON_F32KOB);
+	if (!ret)
+		ret = mtk_rtc_write_trigger(rtc);
+	mutex_unlock(&rtc->lock);
+
+	return ret;
+}
+
+static int mtk_rtc_clkout_prepare(struct clk_hw *hw)
+{
+	return mtk_rtc_clkout_set(hw, true);
+}
+
+static void mtk_rtc_clkout_unprepare(struct clk_hw *hw)
+{
+	mtk_rtc_clkout_set(hw, false);
+}
+
+static int mtk_rtc_clkout_is_prepared(struct clk_hw *hw)
+{
+	struct mt6397_rtc *rtc = container_of(hw, struct mt6397_rtc, clkout);
+	u32 control;
+
+	if (regmap_read(rtc->regmap, rtc->addr_base + rtc->data->control_reg,
+			&control))
+		return 0;
+
+	return !(control & RTC_CON_F32KOB);
+}
+
+static unsigned long mtk_rtc_clkout_recalc_rate(struct clk_hw *hw,
+						unsigned long parent_rate)
+{
+	return 32768;
+}
+
+static const struct clk_ops mtk_rtc_clkout_ops = {
+	.prepare = mtk_rtc_clkout_prepare,
+	.unprepare = mtk_rtc_clkout_unprepare,
+	.is_prepared = mtk_rtc_clkout_is_prepared,
+	.recalc_rate = mtk_rtc_clkout_recalc_rate,
+};
+
+/* The 32 kHz output the PMIC drives to other chips, such as a combo chip */
+static int mtk_rtc_register_clkout(struct device *dev, struct mt6397_rtc *rtc)
+{
+	struct clk_init_data init = {
+		.name = "mt6397-rtc-32k",
+		.ops = &mtk_rtc_clkout_ops,
+	};
+	int ret;
+
+	if (!of_property_present(dev->of_node, "#clock-cells") ||
+	    !rtc->data->control_reg)
+		return 0;
+
+	rtc->clkout.init = &init;
+
+	ret = devm_clk_hw_register(dev, &rtc->clkout);
+	if (ret)
+		return ret;
+
+	return devm_of_clk_add_hw_provider(dev, of_clk_hw_simple_get,
+					   &rtc->clkout);
+}
+#else
+static int mtk_rtc_register_clkout(struct device *dev, struct mt6397_rtc *rtc)
+{
+	return 0;
+}
+#endif
+
 static int mtk_rtc_probe(struct platform_device *pdev)
 {
 	struct resource *res;
@@ -381,6 +463,11 @@ static int mtk_rtc_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	ret = mtk_rtc_register_clkout(&pdev->dev, rtc);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret,
+				     "failed to register the 32k clock\n");
+
 	nvmem_cfg.priv = rtc;
 
 	return devm_rtc_nvmem_register(rtc->rtc_dev, &nvmem_cfg);
@@ -417,6 +504,7 @@ static const struct mtk_rtc_data mt6358_rtc_data = {
 
 static const struct mtk_rtc_data mt6397_rtc_data = {
 	.write_trigger_reg = RTC_WRTGR_MT6397,
+	.control_reg = RTC_CON_MT6397,
 };
 
 static const struct of_device_id mt6397_rtc_of_match[] = {
diff --git a/include/linux/mfd/mt6397/rtc.h b/include/linux/mfd/mt6397/rtc.h
index 44d2b2cb1ff7..986b3aaaeb35 100644
--- a/include/linux/mfd/mt6397/rtc.h
+++ b/include/linux/mfd/mt6397/rtc.h
@@ -9,6 +9,7 @@
 #ifndef _LINUX_MFD_MT6397_RTC_H_
 #define _LINUX_MFD_MT6397_RTC_H_
 
+#include <linux/clk-provider.h>
 #include <linux/jiffies.h>
 #include <linux/mutex.h>
 #include <linux/regmap.h>
@@ -22,6 +23,9 @@
 #define RTC_WRTGR_MT6397       0x003c
 #define RTC_WRTGR_MT6323       RTC_WRTGR_MT6397
 
+#define RTC_CON_MT6397         0x003e
+#define RTC_CON_F32KOB         BIT(5)
+
 #define RTC_IRQ_STA            0x0002
 #define RTC_IRQ_STA_AL         BIT(0)
 #define RTC_IRQ_STA_LP         BIT(3)
@@ -72,6 +76,7 @@
 
 struct mtk_rtc_data {
 	u32                     write_trigger_reg;
+	u32                     control_reg;
 };
 
 struct mt6397_rtc {
@@ -83,6 +88,7 @@ struct mt6397_rtc {
 	int                     irq;
 	u32                     addr_base;
 	const struct mtk_rtc_data *data;
+	struct clk_hw           clkout;
 };
 
 #endif /* _LINUX_MFD_MT6397_RTC_H_ */

-- 
2.56.0


