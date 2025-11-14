Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14536CE8D5C
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Nov 2025 16:54:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1m9nLXhYlMrvlKNG2+wG+g956IXYnkkF+1lH0Nb/twY=; b=11ASuoaPciu3aPsQ0A2bqt20oQ
	vhHM+JM1XaDHI3pz/pnP2pWpSQQMK+IDA6zUhlJKCdcgf+giYXe1nPy8Fs5DWjVOWhxMNB1zQ1Y0F
	vf71vQDyR5gSE+uKGRL2yEYSKSkO73eYh9+frWDGqUd9ZmjyGDFM4xNq2JwfFL7n5eEuptDpP3wMi
	SNbtGdiwMGiSHgQH5rlJOxP8ABYFM4iA5fYBFxmVxg6gL+Hp6Kn9d1RTkm3/qkkGdAC6e0d8yga93
	JhkWaRh1Aptad9XX/3vkdVFUYkWOqEjDiTgpvIgwG6j43VWxX0se8/sjkJI272IoXqvMzRn2Yvnnz
	OXoJUVJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJx4V-0000000CmDW-1B9I;
	Fri, 14 Nov 2025 16:54:51 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJx4S-0000000Cm9W-0Z1e;
	Fri, 14 Nov 2025 16:54:49 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1763139280; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=aWox+0/dpxSiwxOr/KBKbzSwWASbf366rjLPxqtdLHpiIzadQoqL5VZpgT5Sqab8DlCwYhus7B1k1zpkWpVDd7/AobTdoMYkubFcOvgZekFECT7ou38aEKJK8l+PV2Col/4Sl9cStzN0T2iIC5hvlfXOILbSwAto0kVKTQHC0SA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1763139280; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=1m9nLXhYlMrvlKNG2+wG+g956IXYnkkF+1lH0Nb/twY=; 
	b=muDXdH6zKIKIDg0z9LzCAQqPmp3V+NllIb/i2pxLflBH/HJnPIw79kw3oAo/TrhEtLbptpjTJrkZ+6Z/TmukX6/iGfFhXNZqE1GMaKRthrmp9rUwqVepwr1m62TAUL2M5IJ0iz3G+KU2G+1WNsFpWZ/h7RsRUwqhBwwSz9Nv/X8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1763139280;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=1m9nLXhYlMrvlKNG2+wG+g956IXYnkkF+1lH0Nb/twY=;
	b=X1hJA4li0w6zqNmZBRWzA7uq2zthzTnVrXIOLDBRdFplzgr0aS29LW+EfS1Y3t60
	pu4JTgSIm+qmLDlYVgnivvKBBtkTcNsAhuqBykkJAwxyZfQX59zneTpr9gj09o4LdkN
	lD3vAE6ESToZVYbW+Y7H4/Ci11ngYIzxXSx8sYaI=
Received: by mx.zohomail.com with SMTPS id 1763139278832560.3899297951552;
	Fri, 14 Nov 2025 08:54:38 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Fri, 14 Nov 2025 17:54:03 +0100
Subject: [PATCH 09/13] soc: mediatek: mtk-dvfsrc: Get and Enable DVFSRC
 clock
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251114-mt8196-dvfsrc-v1-9-b956d4631468@collabora.com>
References: <20251114-mt8196-dvfsrc-v1-0-b956d4631468@collabora.com>
In-Reply-To: <20251114-mt8196-dvfsrc-v1-0-b956d4631468@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Henry Chen <henryc.chen@mediatek.com>, Georgi Djakov <djakov@kernel.org>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-pm@vger.kernel.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_085448_252203_E199A79C 
X-CRM114-Status: GOOD (  11.64  )
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

The DVFSRC has a clock on all platforms.

Get and enable it in the probe function, so that Linux's common clock
framework knows we're a user of it.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/soc/mediatek/mtk-dvfsrc.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/soc/mediatek/mtk-dvfsrc.c b/drivers/soc/mediatek/mtk-dvfsrc.c
index 3a83fd4baf54..a43d6f913914 100644
--- a/drivers/soc/mediatek/mtk-dvfsrc.c
+++ b/drivers/soc/mediatek/mtk-dvfsrc.c
@@ -7,6 +7,7 @@
 
 #include <linux/arm-smccc.h>
 #include <linux/bitfield.h>
+#include <linux/clk.h>
 #include <linux/iopoll.h>
 #include <linux/module.h>
 #include <linux/of.h>
@@ -83,6 +84,7 @@ struct dvfsrc_opp_desc {
 struct dvfsrc_soc_data;
 struct mtk_dvfsrc {
 	struct device *dev;
+	struct clk *clk;
 	struct platform_device *icc;
 	struct platform_device *regulator;
 	const struct dvfsrc_soc_data *dvd;
@@ -650,6 +652,11 @@ static int mtk_dvfsrc_probe(struct platform_device *pdev)
 	if (IS_ERR(dvfsrc->regs))
 		return PTR_ERR(dvfsrc->regs);
 
+	dvfsrc->clk = devm_clk_get_enabled(&pdev->dev, NULL);
+	if (IS_ERR(dvfsrc->clk))
+		return dev_err_probe(&pdev->dev, PTR_ERR(dvfsrc->clk),
+				     "Couldn't get and enable DVFSRC clock\n");
+
 	arm_smccc_smc(MTK_SIP_DVFSRC_VCOREFS_CONTROL, MTK_SIP_DVFSRC_INIT,
 		      0, 0, 0, 0, 0, 0, &ares);
 	if (ares.a0)

-- 
2.51.2


