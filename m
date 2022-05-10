Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09577C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 May 2022 11:29:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8Im0UYQlj7Ejigsr/VcCZjlFxkS4n4MkpEClGLXbDcM=; b=OO4Vw3qiKLN4gp
	7lezyZ/BCMv21KN6cGjp2yXhbpFjYTvjBjTrGEgufe45KoMHMoqqL9Rvqmcja24CzfFcTUxwCLQtL
	lQixUN3ittymZDDE0hUw0KY5dYDBG0U2e/vmexzLivFWzxanKFQBbr+jLlhfgpZrC9/kipvPsnN0p
	7D4D/kfY6qbRus9r7mcgrYP0yixpskKnRbULaPvqkIWJ0dKijng7CkBQYYGw9LpLlLXwap+IVSihC
	g7DJdsRebiMSsMpQQabau+zrQKAgl8XU4ztB48rXNZ7oNTmIDk6BRz4GaKQTer0hLuX9Ep9etpcCN
	wXpLy08GAhM6GcZdU5Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1noO3i-001Z7j-Fp; Tue, 10 May 2022 11:29:42 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1noO2N-001YRL-7S
 for linux-mediatek@bombadil.infradead.org; Tue, 10 May 2022 11:28:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=tzF3zMl148ythS9iGSJQp8oXHfarSiI1rX+VL1jsG+s=; b=OqVa61uSyG0RAOrsojglRBSTnV
 weM3HsPs2xYlHixIeg3dEgCzT38hF+e6NslJvRLYTiSUlGdvaLd7y+Mg3dAR25/Kn1Y231nhbWU+K
 muXKqDZICn+gIydhZc++SOS1g4Lews7FwPqz3D3uMfrS3BcyRSF3xjP6VqNSd5jTJsZkb6byk8AgE
 oqLOECNvtIsFSxtKoaKjK0puTEcHhIyucNIExi+OTzqgh6A8f7QYBSIZWrDqFPqje41hHxS/zcUOE
 97vrPBSJHg0f4k+JvqshPUcZxnQSnUa8LkQaXV549UFFoSj1l9DusQ6MqEVNJNN3se78+sS9L4Jy7
 waSL+e0w==;
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1noNPy-00CouF-N2
 for linux-mediatek@lists.infradead.org; Tue, 10 May 2022 10:48:41 +0000
Received: by mail-pj1-x1035.google.com with SMTP id
 a15-20020a17090ad80f00b001dc2e23ad84so1687985pjv.4
 for <linux-mediatek@lists.infradead.org>; Tue, 10 May 2022 03:48:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tzF3zMl148ythS9iGSJQp8oXHfarSiI1rX+VL1jsG+s=;
 b=jZeTzcOZnlADgIFe3NUqIMmSuY7M9pUwvK8p5IFeb+DvxZI0dXmBftEtJP7l2z2uTM
 jrX/MFC9DnVK2rqlNU7fBXgMeTJvT9Zh6VT8+eTUpzxMhn+00+HdsQzDXCt6qcZs6420
 2f9cKqvtuMDNR+89Bqpks7OFnVk4YzwNfuDN4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tzF3zMl148ythS9iGSJQp8oXHfarSiI1rX+VL1jsG+s=;
 b=ZNjF5Q+RUspsJ9F3Sfh/uAHDb6NmRXA245UZXs0FAW9vZ83wS3ssqMmzV4xR/zdtk5
 baREqZ6SxPncCO1FT+wI4XIKQBYqExPAE+nALGJh0GAKnlQfd/+HQSe9qHNqGEhfNYu/
 giDRlKw7nYnnql2yQAC20RhGjDnWbQTz901n244qAhHP6SYUXAEwwwA4wHcyzMzGCDaJ
 AYX3xhijI1Q34wXssWg16o7lkfrzGOvMKss3Ilh/Kd4EpW9zOmeMRFVTiqwF0EPkZF0v
 YqAeFvi+plzzfe35FOD4UPWFIGh3G2cBxrph7+RM3to8QducSjnWrSsC+PN/7k2i44+k
 x0Zw==
X-Gm-Message-State: AOAM530bZUL877TE8J62ykkw7qlUqCWPsjJppZhTOsOH4r6mmPlPQDPE
 D+0XP8m40jd/2xFaOkktRwekPw==
X-Google-Smtp-Source: ABdhPJzg4hcOpMXUhbbguk4wcBkfp9MKOzQzpx82C9nBakbzVvlhEej4m/INwNRulsfCiSpL4GziVA==
X-Received: by 2002:a17:90b:2250:b0:1dc:6437:8b10 with SMTP id
 hk16-20020a17090b225000b001dc64378b10mr22474118pjb.119.1652179715683; 
 Tue, 10 May 2022 03:48:35 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com
 ([2401:fa00:1:10:6dcd:8578:55cf:2b12])
 by smtp.gmail.com with ESMTPSA id
 q9-20020a170902e30900b0015e8d4eb21esm1659691plc.104.2022.05.10.03.48.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 May 2022 03:48:35 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Miles Chen <miles.chen@mediatek.com>,
 Rex-BC Chen <rex-bc.chen@mediatek.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-clk@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 10/11] clk: mediatek: mt8173: Fix usage of
 mtk_clk_register_ref2usb_tx()
Date: Tue, 10 May 2022 18:48:03 +0800
Message-Id: <20220510104804.544597-11-wenst@chromium.org>
X-Mailer: git-send-email 2.36.0.512.ge40c2bad7a-goog
In-Reply-To: <20220510104804.544597-1-wenst@chromium.org>
References: <20220510104804.544597-1-wenst@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220510_114839_213520_8426AF45 
X-CRM114-Status: GOOD (  17.74  )
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

As part of the effort to improve the MediaTek clk drivers, the next step
is to switch from the old 'struct clk' clk prodivder APIs to the new
'struct clk_hw' ones.

The apmixed clk library contains one special clk type that doesn't fit
any of the generic clk types. This type is currently used only on the
MT8173 SoC. The code for this clk type was converted by the coccinelle
script from the previous patch, but the call site was not.

Fix the return variable type for mtk_clk_register_ref2usb_tx() in the
MT8173 clk driver.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/clk/mediatek/clk-mt8173.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt8173.c b/drivers/clk/mediatek/clk-mt8173.c
index 511b4da9e727..68d3a9749316 100644
--- a/drivers/clk/mediatek/clk-mt8173.c
+++ b/drivers/clk/mediatek/clk-mt8173.c
@@ -993,6 +993,7 @@ static void __init mtk_apmixedsys_init(struct device_node *node)
 {
 	struct clk_hw_onecell_data *clk_data;
 	void __iomem *base;
+	struct clk_hw *hw;
 	struct clk *clk;
 	int r, i;
 
@@ -1013,16 +1014,13 @@ static void __init mtk_apmixedsys_init(struct device_node *node)
 	for (i = 0; i < ARRAY_SIZE(apmixed_usb); i++) {
 		const struct mtk_clk_usb *cku = &apmixed_usb[i];
 
-		clk = mtk_clk_register_ref2usb_tx(cku->name, cku->parent,
-					base + cku->reg_ofs);
-
-		if (IS_ERR(clk)) {
-			pr_err("Failed to register clk %s: %ld\n", cku->name,
-					PTR_ERR(clk));
+		hw = mtk_clk_register_ref2usb_tx(cku->name, cku->parent, base + cku->reg_ofs);
+		if (IS_ERR(hw)) {
+			pr_err("Failed to register clk %s: %ld\n", cku->name, PTR_ERR(hw));
 			continue;
 		}
 
-		clk_data->hws[cku->id] = __clk_get_hw(clk);
+		clk_data->hws[cku->id] = hw;
 	}
 
 	clk = clk_register_divider(NULL, "hdmi_ref", "tvdpll_594m", 0,
-- 
2.36.0.512.ge40c2bad7a-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
