Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9EECC5321D
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Aug 2024 10:14:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LJH7gzL1aTMd1FSl3D4skxiHp7HFb4KrCiWKLzsaldQ=; b=Ia0NyofE607UUo72tQG1qwsujY
	vceejCPlezalSzoOKCyaHdZw0gB2RR8LopgJa8tKDAdKR30/rxmpYRoKnQJXos+G4hMbg9obP38Fd
	OqDjiP/iSrUl2qlq08bXK3doQH5gGAACzY7FGwI0wd6q41u00hTUffwuziUvME4Xr828N6zlvOlIX
	qWwBbWg+yi7SUvT7BdAWOaXHKMW32U6Fvn10ga5oGL70PJfi7X8RvLgjIyo5A6ASv7q0X8VFzopVT
	iBQgzNEDbJ4zefhdUzHbXhFU4NJgytfE4CoeTXVQrqbw7ptfBErJskN/hM+SzPGo/fcjddr+NJhP0
	EpjKmzFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siWkQ-00000006sYG-0tyN;
	Mon, 26 Aug 2024 10:14:54 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siWda-00000006qjM-3LLx
	for linux-mediatek@bombadil.infradead.org;
	Mon, 26 Aug 2024 10:07:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=LJH7gzL1aTMd1FSl3D4skxiHp7HFb4KrCiWKLzsaldQ=; b=aQrxcWZphI1AsJ0QOXbRoXdhu/
	HKaKWdXML55UdWA+u1kG+Za79/swCHCPls2sLwlGGv2Uo0Tutu6blQu4XpsXfqsLVKd5dtOhV+akp
	40ryvZKFzDsJ/M8PK0nowtUJQvRAekznossFz4hpkULLDLpxyEr4K7jJJTJJLUq409Wx95qStFwyz
	J1ZH4TFSwASD/w6dge1nNh60j8yv/tgrAfrhvhe+RJlhmtxX2tvC9+fJpVCgSGY2Z1OyGTpyXyHpK
	VYV072a9E86GYS3QG60T1IVfZ+W0sQ32O2DDRAyB8jXyQU0pMnExSeVef1QuFUn402LG4EoK/P9th
	FbSJK90g==;
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siWdV-0000000AdAM-3AgG
	for linux-mediatek@lists.infradead.org;
	Mon, 26 Aug 2024 10:07:48 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-42802ddfaa6so4597065e9.1
        for <linux-mediatek@lists.infradead.org>; Mon, 26 Aug 2024 03:07:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724666864; x=1725271664; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LJH7gzL1aTMd1FSl3D4skxiHp7HFb4KrCiWKLzsaldQ=;
        b=OGg7FZ29TeF7LXJf+T+CZ4uiX4tQSVYB2Y+ZrJ91d+dlqG2n1erf3vV2Ijt0kMcsuN
         6CXOdRAPXASwJbTPrWDdfjL6TIVasD/AwjRCYXDDzeSNeNz5dv7LbZ4uThUNE3kEpqd/
         lnFn0EZCJIcqtlmI5aDboIKihCy6RW798SKPkktKeIDonb9TcLzEfw99z+2Itjqb9Ez4
         gLDr9PGwKKNmmXRs3jlE4FZak9QRFFwP7Ts56TCYPt3A/xm8bq34/jAWwDE1RDI7O0K0
         GYJKqIO2QGnuXPgt3NxJTSYkuqGsF/K6fggsFxEbw2YEU13ScFjcgjjSboJ3g/uRaPFF
         SV4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724666864; x=1725271664;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LJH7gzL1aTMd1FSl3D4skxiHp7HFb4KrCiWKLzsaldQ=;
        b=QhmFBJh5gRxsEkQO642x/nHOyZPOvKLEiASPHD2gcOkPN7FAfU9hmqCrFd8HNGwWrG
         LEXU/MTb0z77dMufLWheEWNB9oCPoWbeHFNYTX7IpFOFDrZFv8Pm2JiNjvoM4gHYI+nM
         Ms71MVEbQuSMtF1x06aB9Q2VhF9K/cYpLHROwkrg31qwgrRJ3l7JqaNEdzQ+Bnq3HifJ
         yNR5oWMYqmxitFf/0mJ0ZyDIxpBteHYGwQWo/jkOO4QQ7GXXJO1YgmTWcz8qgdRcesnP
         FpClzpSTFCANoL/J6Y2G+unthsbGDzYYahcWBcqRAeko60F90q+FGJtqQYCvmljzgsfa
         Y/Xg==
X-Forwarded-Encrypted: i=1; AJvYcCXOAyQoi7u1Ziljf0MeuZa7rCY6MftoT23zieFLtnt/I9Dp993to58Sp48A+R5zS0g9n8zySambu/ATkymi0w==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywavp2st6y1Pc1yNHeACQW5jfp2+Ih5/2l/yEMrGNiuS5xizxwi
	10ZzKlnB+5UC6qUtm9SfHVY2ltasMvRwgM0dd+4lpkb1c+kcUvpe5zDeQ3TVhdg=
X-Google-Smtp-Source: AGHT+IE7gdrYrwOwPxXE//4QC856859teFRpRbc14X0LTKkOSDn4Vd45gs5Ik+WW2PRPGPps93azfw==
X-Received: by 2002:a5d:6d05:0:b0:367:9495:9016 with SMTP id ffacd0b85a97d-373118e9996mr3690028f8f.6.1724666864363;
        Mon, 26 Aug 2024 03:07:44 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.222.82])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37308110009sm10324821f8f.18.2024.08.26.03.07.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Aug 2024 03:07:43 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 26 Aug 2024 12:07:24 +0200
Subject: [PATCH 08/11] phy: ti: am654-serdes: Use scoped device node
 handling to simplify error paths
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240826-phy-of-node-scope-v1-8-5b4d82582644@linaro.org>
References: <20240826-phy-of-node-scope-v1-0-5b4d82582644@linaro.org>
In-Reply-To: <20240826-phy-of-node-scope-v1-0-5b4d82582644@linaro.org>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Ray Jui <rjui@broadcom.com>, 
 Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Chunfeng Yun <chunfeng.yun@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=3499;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=q84FqGekrYD8KTQs5gy+VU5Crg5qXmyLk1XObeFSfeo=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmzFPftx77rNEmy2lKEvE6nmjyeiGM/8vxfHVk3
 1Qxt9hxkm6JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZsxT3wAKCRDBN2bmhouD
 17VdEACDE8+ajTSInapKgMwIRqo7PrspygrbulFRV7MG7gYQuFB9ZYxJChAIKilDS3tY/vSm+mm
 zka8Y2ZfUndSHX5z1j9a0k9HqItYyRBcF15JckSJS39yViVxdnO2So3JwRhp9ohH5RcBNLCgWXi
 oAXJD/xxYm8NoZluxZwpKr/P+e1DxZ/iTxE36qxsdmc0i5K1Lyv2MrhIccKiE5GNghuU21Qlmon
 pjYkvu95DSOsN4sCjuZ6mLJcHSJqSBMd+nTvI7o5AzdlCw32ewr/agT640du/9fH193lr4/juHX
 7I9KUOrV85awMCb205jQ9OkoqUV6T6Z6UjBzZgmfXUjW/AF/fIv4rwgpzTPwQq7FHLWhwmlSmMj
 O5s0De/VhSO0k8dVIg3Yj8JfcgA1eQ0JiMQFWsD358pPj/Cyx5IPK+rGGImuSWRwtuNVhQg2mDB
 tE2t9r3u+tYrCEA2qG8TnKtaj6PXKYOnFKzf01e3TWiDxsfmOE8Zrwrqbt2ctFhMNWRiUBPq14v
 UEnylJsz6b9bx/vDX3iMxSKEspCoL2hXH/uh3PTBa0BxgKi/Wc34u84+oxNf9A2BetAzxMFu3E+
 e1Ixc5zUX13AWl2KIQKnaC3M6hN8dT8k/BSTRE2enP0v6cWf41IzSjaNnlu4SyqhTbjuV7gKNdX
 eHb/19T7Mf/oiQg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240826_110746_188446_231CAC07 
X-CRM114-Status: GOOD (  14.69  )
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

Obtain the device node reference with scoped/cleanup.h to reduce error
handling and make the code a bit simpler.

Unlike in other typical of_node_get+syscon_node_to_regmap cases, the
reference cannot be dropped immediately after syscon_node_to_regmap(),
because further part of probe() uses it.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/phy/ti/phy-am654-serdes.c | 50 +++++++++++++--------------------------
 1 file changed, 17 insertions(+), 33 deletions(-)

diff --git a/drivers/phy/ti/phy-am654-serdes.c b/drivers/phy/ti/phy-am654-serdes.c
index 673449607c02..3bf3aff4b1c7 100644
--- a/drivers/phy/ti/phy-am654-serdes.c
+++ b/drivers/phy/ti/phy-am654-serdes.c
@@ -7,6 +7,7 @@
  */
 
 #include <dt-bindings/phy/phy.h>
+#include <linux/cleanup.h>
 #include <linux/clk.h>
 #include <linux/clk-provider.h>
 #include <linux/delay.h>
@@ -644,7 +645,6 @@ static int serdes_am654_clk_register(struct serdes_am654 *am654_phy,
 	struct device_node *node = am654_phy->of_node;
 	struct device *dev = am654_phy->dev;
 	struct serdes_am654_clk_mux *mux;
-	struct device_node *regmap_node;
 	const char **parent_names;
 	struct clk_init_data *init;
 	unsigned int num_parents;
@@ -652,7 +652,6 @@ static int serdes_am654_clk_register(struct serdes_am654 *am654_phy,
 	const __be32 *addr;
 	unsigned int reg;
 	struct clk *clk;
-	int ret = 0;
 
 	mux = devm_kzalloc(dev, sizeof(*mux), GFP_KERNEL);
 	if (!mux)
@@ -660,41 +659,30 @@ static int serdes_am654_clk_register(struct serdes_am654 *am654_phy,
 
 	init = &mux->clk_data;
 
-	regmap_node = of_parse_phandle(node, "ti,serdes-clk", 0);
-	if (!regmap_node) {
-		dev_err(dev, "Fail to get serdes-clk node\n");
-		ret = -ENODEV;
-		goto out_put_node;
-	}
+	struct device_node *regmap_node __free(device_node) =
+		of_parse_phandle(node, "ti,serdes-clk", 0);
+	if (!regmap_node)
+		return dev_err_probe(dev, -ENODEV, "Fail to get serdes-clk node\n");
 
 	regmap = syscon_node_to_regmap(regmap_node->parent);
-	if (IS_ERR(regmap)) {
-		dev_err(dev, "Fail to get Syscon regmap\n");
-		ret = PTR_ERR(regmap);
-		goto out_put_node;
-	}
+	if (IS_ERR(regmap))
+		return dev_err_probe(dev, PTR_ERR(regmap),
+				     "Fail to get Syscon regmap\n");
 
 	num_parents = of_clk_get_parent_count(node);
-	if (num_parents < 2) {
-		dev_err(dev, "SERDES clock must have parents\n");
-		ret = -EINVAL;
-		goto out_put_node;
-	}
+	if (num_parents < 2)
+		return dev_err_probe(dev, -EINVAL, "SERDES clock must have parents\n");
 
 	parent_names = devm_kzalloc(dev, (sizeof(char *) * num_parents),
 				    GFP_KERNEL);
-	if (!parent_names) {
-		ret = -ENOMEM;
-		goto out_put_node;
-	}
+	if (!parent_names)
+		return -ENOMEM;
 
 	of_clk_parent_fill(node, parent_names, num_parents);
 
 	addr = of_get_address(regmap_node, 0, NULL, NULL);
-	if (!addr) {
-		ret = -EINVAL;
-		goto out_put_node;
-	}
+	if (!addr)
+		return -EINVAL;
 
 	reg = be32_to_cpu(*addr);
 
@@ -710,16 +698,12 @@ static int serdes_am654_clk_register(struct serdes_am654 *am654_phy,
 	mux->hw.init = init;
 
 	clk = devm_clk_register(dev, &mux->hw);
-	if (IS_ERR(clk)) {
-		ret = PTR_ERR(clk);
-		goto out_put_node;
-	}
+	if (IS_ERR(clk))
+		return PTR_ERR(clk);
 
 	am654_phy->clks[clock_num] = clk;
 
-out_put_node:
-	of_node_put(regmap_node);
-	return ret;
+	return 0;
 }
 
 static const struct of_device_id serdes_am654_id_table[] = {

-- 
2.43.0


