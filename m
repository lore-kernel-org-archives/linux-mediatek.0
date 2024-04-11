Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF9D7CD1297
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Apr 2024 06:47:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=phGhLZFh5d5/nVHomI8iBHZJwlJ+uxi20iTG5vYNjcE=; b=Bue2BVuplTpjaj0nQ3VqQgS13i
	CJ+fDomn1x4CrfAavZnU3fLOVCzL04GfhNRbPcVsiyyW2p3L1Mmt4RFFJTUG5nOWleqNuIemjDoed
	6XWo2ZEVRaRWAcQMvolKuynKeD0CNMVZZNYrAgu103RpjE1Ks+hSxjomWCR2Lsi3J0Q5fdKB1X+YF
	w3jjrSj6Petc4GZ/acXTdMvsxslHW0fLdMti2k32OAQGVClP0TPZvFpIX0Y12c0u6HjXyCVHh3zJL
	+haaSYQGucy2mJZR3HMR8gOTAzXygJe5y6yTaeszIOquDuxInwDyHicGVzwo3G+SZfkIkcN9fjJYD
	/GzETKnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruoD8-0000000AenH-0Vws;
	Thu, 11 Apr 2024 06:47:02 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruoD1-0000000Aeiu-0XaK;
	Thu, 11 Apr 2024 06:46:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 86B3061FAA;
	Thu, 11 Apr 2024 06:46:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3F91C43390;
	Thu, 11 Apr 2024 06:46:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712818014;
	bh=saPqICVhCGR/yOaqVsxnFMPKByX7RX+rEnct888M6xY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=U0GyO2FL9vi7BGaiTFI/pHzFJusV4ihtgOSiDp8X1zfDRNDFgSi4O/5nbtmos5GCE
	 Kt+d0ZlQr+UhKv883e1MThO4g/glomoIx8NAdMKn1WoXHRRwnKj0NsjgimkVPclrcc
	 KG5FJQ2l4MJVOgwnZ3EI+VBSDJma+HNbjt2uxSe4njgvYCtaf1E9vQWU1Rt0OqgUhm
	 gyjRRmG1kB9aHESZTpKJKSHYNM44+ycP4BLcubHdbhh5U2QQU/1mPKfhxEuDpRjuyF
	 ImMANFtsng8KIM6g2A9GFDamV0zK/V0UUxlSSosEBdS27lMcztD/doX7DyjUplMHfz
	 VfPQUyCEEZVBA==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dong Aisheng <aisheng.dong@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Jacky Bai <ping.bai@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Linus Walleij <linus.walleij@linaro.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Sean Wang <sean.wang@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	zhanghongchen <zhanghongchen@loongson.cn>,
	Yinbo Zhu <zhuyinbo@loongson.cn>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	linux-gpio@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-msm@vger.kernel.org
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH v2 4/5] pinctrl: qcom: sm7150: fix module autoloading
Date: Thu, 11 Apr 2024 08:46:13 +0200
Message-Id: <20240411064614.7409-4-krzk@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240411064614.7409-1-krzk@kernel.org>
References: <20240411064614.7409-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_234655_284622_1EB68B24 
X-CRM114-Status: GOOD (  10.05  )
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

Add MODULE_DEVICE_TABLE(), so the module could be properly autoloaded
based on the alias from of_device_id table.  Pin controllers are
considered core components, so usually they are built-in, however these
can be built and used as modules on some generic kernel.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

---

Changes in v2:
1. Add ack
---
 drivers/pinctrl/qcom/pinctrl-sm7150.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/qcom/pinctrl-sm7150.c b/drivers/pinctrl/qcom/pinctrl-sm7150.c
index c25357ca1963..c542f9bc6bcd 100644
--- a/drivers/pinctrl/qcom/pinctrl-sm7150.c
+++ b/drivers/pinctrl/qcom/pinctrl-sm7150.c
@@ -1246,6 +1246,7 @@ static const struct of_device_id sm7150_tlmm_of_match[] = {
 	{ .compatible = "qcom,sm7150-tlmm", },
 	{ },
 };
+MODULE_DEVICE_TABLE(of, sm7150_tlmm_of_match);
 
 static struct platform_driver sm7150_tlmm_driver = {
 	.driver = {
-- 
2.34.1


