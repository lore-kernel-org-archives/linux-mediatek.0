Return-Path: <SRS0=SHoq=2V=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D478C2D0C2
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 Dec 2019 13:52:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C1BCF205ED
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 Dec 2019 13:52:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VVzbd+Bi";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="SuPrK7A2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C1BCF205ED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AunU0r+dLJBXXcjKtbfP7agFX7zk7ZsdG0VQAUBvofM=; b=VVzbd+BiBz/QbN
	+AYimu0VM58/zflIzXsTOT8yeSTD0gA1CCs9TknFMu5pOKnZXJ1Xd8APV02lJJ+OY2og+2ITdL5t8
	UfTLvRtt40zu2h3Qw5ybh5hHPVjw+jRyj2a134hVoIpktiI/1CNKb1lI9pyrkkg3qvU1tjV8hAq5c
	8k5PhSzOKHzw2KYJaYsPjHOPy8DTYZJBgT89wPS5sP4LsugcP1/El6gtqI9gKURTwEfDq6uz1NZLm
	gTgJ9O1ixv9/2dYdC8YRdUN9whhxw69s4SSlVCNM/KS0OwjjXtxg5uICw19+9iCt576IUSU7kFai7
	DcI+bAGoP6AFZ0e+carw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1imHwG-0006Zn-2R; Tue, 31 Dec 2019 13:52:00 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1imHwC-0006Xp-SH
 for linux-mediatek@lists.infradead.org; Tue, 31 Dec 2019 13:51:58 +0000
X-UUID: 20eeb316e7504e7ba85f05ee0d1c5807-20191231
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=z3pZFT+6t8ylWCp7AMGBvI067vp4npjbNdsiLxU09zM=; 
 b=SuPrK7A2wsSKEWknPVXkflkhacOSI812EAZI2Kh6yIHY+5xTpgeK1eUTUUgYrz9PA2Lcem1yvryAcst20y2Ndc4zPOwe/I1mniO/JhUfO0Zv2oE689ulPiS5AB7CKLzKeozMCGrkvEyVTlugDsR08a4vvSRZGE51Qw3ogCAaImM=;
X-UUID: 20eeb316e7504e7ba85f05ee0d1c5807-20191231
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <light.hsieh@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1126686280; Tue, 31 Dec 2019 05:51:53 -0800
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 31 Dec 2019 05:42:10 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 31 Dec 2019 21:41:05 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Tue, 31 Dec 2019 21:41:17 +0800
From: Light Hsieh <light.hsieh@mediatek.com>
To: <linus.walleij@linaro.org>
Subject: [PATCH v7 6/6] Add support for pin configuration dump via debugfs.
Date: Tue, 31 Dec 2019 21:41:47 +0800
Message-ID: <1577799707-11855-6-git-send-email-light.hsieh@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1577799707-11855-1-git-send-email-light.hsieh@mediatek.com>
References: <1577799707-11855-1-git-send-email-light.hsieh@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 32219F344A537A986D604800AECCF3AE49384A06C2C055A05C0A4F98DFB81C412000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191231_055156_924175_FD0F213B 
X-CRM114-Status: GOOD (  11.79  )
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

Add support for pin configuration dump via catting
/sys/kernel/debug/pinctrl/$platform_dependent_path/pinconf-pins.
pinctrl framework had already support such dump. This patch implement the
operation function pointer to fullfill this dump.

Change-Id: I823642561adaedb847e77f9a8baea182913d6163
---
 drivers/pinctrl/mediatek/pinctrl-paris.c | 109 +++++++++++++++++++++++++++++++
 drivers/pinctrl/mediatek/pinctrl-paris.h |   3 +
 2 files changed, 112 insertions(+)

diff --git a/drivers/pinctrl/mediatek/pinctrl-paris.c b/drivers/pinctrl/mediatek/pinctrl-paris.c
index 115ebc1..83bf29c 100644
--- a/drivers/pinctrl/mediatek/pinctrl-paris.c
+++ b/drivers/pinctrl/mediatek/pinctrl-paris.c
@@ -539,12 +539,120 @@ static int mtk_pctrl_get_group_pins(struct pinctrl_dev *pctldev,
 	return 0;
 }
 
+static int mtk_hw_get_value_wrap(struct mtk_pinctrl *hw, unsigned int gpio, int field)
+{
+	const struct mtk_pin_desc *desc;
+	int value, err;
+
+	if (gpio > hw->soc->npins)
+		return -EINVAL;
+
+	desc = (const struct mtk_pin_desc *)&hw->soc->pins[gpio];
+
+	err = mtk_hw_get_value(hw, desc, field, &value);
+	if (err)
+		return err;
+
+	return value;
+}
+
+#define mtk_pctrl_get_pinmux(hw, gpio)			\
+	mtk_hw_get_value_wrap(hw, gpio, PINCTRL_PIN_REG_MODE)
+
+#define mtk_pctrl_get_direction(hw, gpio)		\
+	mtk_hw_get_value_wrap(hw, gpio, PINCTRL_PIN_REG_DIR)
+
+#define mtk_pctrl_get_out(hw, gpio)			\
+	mtk_hw_get_value_wrap(hw, gpio, PINCTRL_PIN_REG_DO)
+
+#define mtk_pctrl_get_in(hw, gpio)			\
+	mtk_hw_get_value_wrap(hw, gpio, PINCTRL_PIN_REG_DI)
+
+#define mtk_pctrl_get_smt(hw, gpio)			\
+	mtk_hw_get_value_wrap(hw, gpio, PINCTRL_PIN_REG_SMT)
+
+#define mtk_pctrl_get_ies(hw, gpio)			\
+	mtk_hw_get_value_wrap(hw, gpio, PINCTRL_PIN_REG_IES)
+
+#define mtk_pctrl_get_driving(hw, gpio)			\
+	mtk_hw_get_value_wrap(hw, gpio, PINCTRL_PIN_REG_DRV)
+
+ssize_t mtk_pctrl_show_one_pin(struct mtk_pinctrl *hw,
+	unsigned int gpio, char *buf, unsigned int bufLen)
+{
+	int pinmux, pullup, pullen, len = 0, r1 = -1, r0 = -1;
+	const struct mtk_pin_desc *desc;
+
+	if (gpio > hw->soc->npins)
+		return -EINVAL;
+
+	desc = (const struct mtk_pin_desc *)&hw->soc->pins[gpio];
+	pinmux = mtk_pctrl_get_pinmux(hw, gpio);
+	if (pinmux >= hw->soc->nfuncs)
+		pinmux -= hw->soc->nfuncs;
+
+	mtk_pinconf_bias_get_combo(hw, desc, &pullup, &pullen);
+	if (pullen == MTK_PUPD_SET_R1R0_00) {
+		pullen = 0;
+		r1 = 0;
+		r0 = 0;
+	} else if (pullen == MTK_PUPD_SET_R1R0_01) {
+		pullen = 1;
+		r1 = 0;
+		r0 = 1;
+	} else if (pullen == MTK_PUPD_SET_R1R0_10) {
+		pullen = 1;
+		r1 = 1;
+		r0 = 0;
+	} else if (pullen == MTK_PUPD_SET_R1R0_11) {
+		pullen = 1;
+		r1 = 1;
+		r0 = 1;
+	} else if (pullen != MTK_DISABLE && pullen != MTK_ENABLE) {
+		pullen = 0;
+	}
+	len += snprintf(buf + len, bufLen - len,
+			"%03d: %1d%1d%1d%1d%02d%1d%1d%1d%1d",
+			gpio,
+			pinmux,
+			mtk_pctrl_get_direction(hw, gpio),
+			mtk_pctrl_get_out(hw, gpio),
+			mtk_pctrl_get_in(hw, gpio),
+			mtk_pctrl_get_driving(hw, gpio),
+			mtk_pctrl_get_smt(hw, gpio),
+			mtk_pctrl_get_ies(hw, gpio),
+			pullen,
+			pullup);
+
+	if (r1 != -1) {
+		len += snprintf(buf + len, bufLen - len, " (%1d %1d)\n",
+			r1, r0);
+	} else {
+		len += snprintf(buf + len, bufLen - len, "\n");
+	}
+
+	return len;
+}
+
+#define PIN_DBG_BUF_SZ 96
+static void mtk_pctrl_dbg_show(struct pinctrl_dev *pctldev, struct seq_file *s,
+			  unsigned int gpio)
+{
+	struct mtk_pinctrl *hw = pinctrl_dev_get_drvdata(pctldev);
+	char buf[PIN_DBG_BUF_SZ];
+
+	(void)mtk_pctrl_show_one_pin(hw, gpio, buf, PIN_DBG_BUF_SZ);
+
+	seq_printf(s, "%s", buf);
+}
+
 static const struct pinctrl_ops mtk_pctlops = {
 	.dt_node_to_map		= mtk_pctrl_dt_node_to_map,
 	.dt_free_map		= pinctrl_utils_free_map,
 	.get_groups_count	= mtk_pctrl_get_groups_count,
 	.get_group_name		= mtk_pctrl_get_group_name,
 	.get_group_pins		= mtk_pctrl_get_group_pins,
+	.pin_dbg_show           = mtk_pctrl_dbg_show,
 };
 
 static int mtk_pmx_get_funcs_cnt(struct pinctrl_dev *pctldev)
@@ -641,6 +749,7 @@ static int mtk_pconf_group_set(struct pinctrl_dev *pctldev, unsigned group,
 	.pin_config_get = mtk_pinconf_get,
 	.pin_config_group_get	= mtk_pconf_group_get,
 	.pin_config_group_set	= mtk_pconf_group_set,
+	.is_generic = true,
 };
 
 static struct pinctrl_desc mtk_desc = {
diff --git a/drivers/pinctrl/mediatek/pinctrl-paris.h b/drivers/pinctrl/mediatek/pinctrl-paris.h
index 3d43771..afb7650 100644
--- a/drivers/pinctrl/mediatek/pinctrl-paris.h
+++ b/drivers/pinctrl/mediatek/pinctrl-paris.h
@@ -60,6 +60,9 @@
 int mtk_paris_pinctrl_probe(struct platform_device *pdev,
 			    const struct mtk_pin_soc *soc);
 
+ssize_t mtk_pctrl_show_one_pin(struct mtk_pinctrl *hw,
+	unsigned int gpio, char *buf, unsigned int bufLen);
+
 extern const struct dev_pm_ops mtk_paris_pinctrl_pm_ops;
 
 #endif /* __PINCTRL_PARIS_H */
-- 
1.8.1.1.dirty
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
