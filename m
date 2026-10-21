Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78C55606A31D
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Oct 2026 10:53:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nLcgNkX3;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=hSVqUpKE;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=r0M0YdrG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DcCZ++LfjibxMYCGx+YpvA8XnStwxpnU2ZVwc+ej5jY=; b=nLcgNkX31k4lfJKwhpxdKcrXjc
	qHrm38/7pZc2p8/V40vp60r84udBud5/EAbqqwhjIhskLnrwX046N9ct7RWQCyG+7CytIX7GcLKzs
	/FwDUAgSucyEzzTV363yMp5c99VGpaPRIwxl4OkTv5nLDnGrfHa+T12XGmANMymw4WxQko0g0J6jQ
	ZgOyfHza19PCyE2saF3xQfEwX0LoXrbAUbAyvdIb2HKP+M17GutCmsT68TN94RxI/A92jEJ/C07JY
	PyK1pFT4uk7+bh+8xIRU0pTa4IFywDBiklVgkibiQTynNveeREzVpswrB6JaDn+pbjUiuqPPWKX6W
	sKEUWEOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJTwy-0000000Bfa2-2j2T;
	Wed, 21 Oct 2026 10:53:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJTwx-0000000BfZ4-3COz
	for linux-mediatek@bombadil.infradead.org;
	Wed, 21 Oct 2026 10:53:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=DcCZ++LfjibxMYCGx+YpvA8XnStwxpnU2ZVwc+ej5jY=; b=hSVqUpKE3Q8oKdZIPMMTDOPP4E
	GLtW9ooyaRsg+8Fn7s8RwtLFlujVeKFHhKUSllRRUyiV/7kBmZlgllMO+N1aLIWaCvm5KKFs7Ahnk
	2ZQLJeanDvqc20ROE1/dpYllqpa/QEPWi9Tvbxnr97gIorv2SsvNLe4tw8s4Kqk84YZMcl2EX9T81
	DOW28GNHknJQThJO6X1Kvy7vzFFVywG2pEe0LT8KGNgUQt3TpBo70D4hySGTjRuqTJRDhVgBuQl+E
	9jxDi5oEp8IT5BkbvZd5f77hEKHLNRYhVIP3kwztV6UBxoicsxtMLQ1CqtKc/J/APBvn7Fw8XsSGm
	dVC086NA==;
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xJTwv-00000005iw2-08Cg
	for linux-mediatek@lists.infradead.org;
	Wed, 21 Oct 2026 10:53:38 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-48dfaa3fa12so1129778f8f.0
        for <linux-mediatek@lists.infradead.org>; Wed, 21 Oct 2026 03:53:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792580015; x=1793184815; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DcCZ++LfjibxMYCGx+YpvA8XnStwxpnU2ZVwc+ej5jY=;
        b=r0M0YdrGh/bVNLrPGa2m+T2WHpMvhzd4Jf1OS3psQmd42+ujoglJzfBZv8Mz2o6b+v
         G9SEmp4P+L6oSuRpfdDVwj7HAYyc3RQczFAiCNM5cTXFE9G2ro8bQdXtrmT/Zx2rHhnK
         X5TShCMVTkeMAWxVz0CxoUiuR+x0DXbhSVAv+Zcd2okcul4CD+I4bMOqE2z+yqwOzfZW
         WwsCu2sb+XGJxJyYOOS/Digt/JmOkI+mnvJ3cDVHBu9AUP7anhcboj3GPK9gGQogbbpo
         ewqMmYVnRmLYNRwn/4162ZXQ4Zgyc2R0Yig8ysi1ncKaGQ0FSsjArVELl+65CGxApKoM
         pojA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792580015; x=1793184815;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DcCZ++LfjibxMYCGx+YpvA8XnStwxpnU2ZVwc+ej5jY=;
        b=aR6sQ/xX4akCBCqAtErMSdXgbC9AV2UwLmCagojiYzZMNwyChD9Q0CCjVdgoiz59rq
         qlR816MTHJNPY04eGkt2kVNA4BG1qEAN/Nvak2fqytSTqnu+Pnwbs/mTH/spmsSV73kR
         4Ky3EnZsg7p1e/G56YypdPMMsfox3/TTVbMd6XVSSU8ffc+lSUeHBEGK0vTbx0nc+Ao8
         3mxcwXTz2xT+P6rpNdtKhgCLela+8fbmNzgS/gLrf7g+2K8CrYHTLaDVxZ7XaaneJP8e
         oOewQ1ZXlXW9FOzBvUNI3VRcCYNUtEzJkikvxRYXvCshP80/+FjPsaS9nvlTi9pd7KIq
         Fv2Q==
X-Gm-Message-State: AFq9FYK2LqEwzNwpnHNR5jByVc/pgQA6XoM1tPANQ/vHdS61MtYz2pHh
	8dHcynlOUHG/tgoV6TSQLKuJ4BYqfJ4SPO3cb6xR8ojWLttyTd1o8Eebyn1O/ybm
X-Gm-Gg: AYBFou3P63mbyAggBSIOrbyxYz0SB7OoWlqjjACOtWckGWUTwnUxGsynyDTeRMQpxxn
	uOX0XhzbQ/e5mskyrq9RrNQU8rGJffkIkp6jeeGP2JCbnCLN6vuQVfbryMyqe0xmHf5oSxs7/mz
	yGSfWt4EHzUuO9aFaFIt5eEdDY5T0PeovwO90so3xrIuJxOaOUIdtbPjwxbJuvHfqt1dpmIVnKn
	czqQLBm4/5mXSZyGLtrpA2oNqHDNnFSbeOLc4Mceuv9pkREhrX1D7TOmXLfzJGs3JWVEmh2aGYw
	lyHQkczhgQ5ciJRrQ8LyHXmU7PBCHk0p67KqPy6cMDyo1pu8kb0xA/c9ti4daWiGgT8WlZPLDBg
	M3kpKKHLpuxwQFAGONObHVUr/HtrdJrCTDoiHgKMp3CzeptImUKTz0FPLujp2OWNLK1vywpOYl7
	fF4OSyd5FGLnf6hyT+3he7bIaMU/Vhkwtp0PqLCov5Bg5Y6mP0eJsnmvyeIWj09RB47mq8gJtNI
	rLYKiPB8iEv360C9iB+UqcPqbsi8K/YduW4fF0S2Uw4B6x6su5z
X-Received: by 2002:a05:600c:3f0d:b0:4a0:34a:588c with SMTP id 5b1f17b1804b1-4a1fdd29c19mr35588045e9.14.1792580015036;
        Wed, 21 Oct 2026 03:53:35 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f2d6e2dbsm153388305e9.13.2026.10.21.03.53.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 03:53:34 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Val Packett <val@packett.cool>,
	Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sen Chu <sen.chu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>,
	Lee Jones <lee@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Fabien Parent <parent.f@gmail.com>,
	Akari Tsuyukusa <akkun11.open@gmail.com>,
	Chen Zhong <chen.zhong@mediatek.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	mfd@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH v11 6/9] input: keyboard: mtk-pmic-keys: Add MT6392 support
Date: Wed, 21 Oct 2026 12:47:24 +0200
Message-ID: <20261021105109.199886-7-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261021105109.199886-1-l.scorcia@gmail.com>
References: <20261021105109.199886-1-l.scorcia@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_115337_183639_A6BB53C5 
X-CRM114-Status: GOOD (  12.74  )
X-Spam-Score: -0.2 (/)
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

From: Val Packett <val@packett.cool>

Add support for the MT6392 PMIC to the keys driver.

Signed-off-by: Val Packett <val@packett.cool>
Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/keyboard/mtk-pmic-keys.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/input/keyboard/mtk-pmic-keys.c b/drivers/input/keyboard/mtk-pmic-keys.c
index c78d9f6d97c4..d758c7743f6a 100644
--- a/drivers/input/keyboard/mtk-pmic-keys.c
+++ b/drivers/input/keyboard/mtk-pmic-keys.c
@@ -13,6 +13,7 @@
 #include <linux/mfd/mt6357/registers.h>
 #include <linux/mfd/mt6358/registers.h>
 #include <linux/mfd/mt6359/registers.h>
+#include <linux/mfd/mt6392/registers.h>
 #include <linux/mfd/mt6397/core.h>
 #include <linux/mfd/mt6397/registers.h>
 #include <linux/module.h>
@@ -69,6 +70,20 @@ static const struct mtk_pmic_regs mt6397_regs = {
 	.rst_lprst_mask = MTK_PMIC_RST_DU_MASK,
 };
 
+static const struct mtk_pmic_regs mt6392_regs = {
+	.keys_regs[MTK_PMIC_PWRKEY_INDEX] =
+		MTK_PMIC_KEYS_REGS(MT6392_CHRSTATUS, 0x2,
+				   MT6392_INT_MISC_CON, 0x10,
+				   MTK_PMIC_PWRKEY_RST),
+	.keys_regs[MTK_PMIC_HOMEKEY_INDEX] =
+		MTK_PMIC_KEYS_REGS(MT6392_CHRSTATUS, 0x4,
+				   MT6392_INT_MISC_CON, 0x8,
+				   MTK_PMIC_HOMEKEY_RST),
+	.pmic_rst_reg = MT6392_TOP_RST_MISC,
+	.rst_lprst_mask = MTK_PMIC_RST_DU_MASK,
+	.key_release_irq = true,
+};
+
 static const struct mtk_pmic_regs mt6323_regs = {
 	.keys_regs[MTK_PMIC_PWRKEY_INDEX] =
 		MTK_PMIC_KEYS_REGS(MT6323_CHRSTATUS,
@@ -301,6 +316,9 @@ static const struct of_device_id of_mtk_pmic_keys_match_tbl[] = {
 	{
 		.compatible = "mediatek,mt6397-keys",
 		.data = &mt6397_regs,
+	}, {
+		.compatible = "mediatek,mt6392-keys",
+		.data = &mt6392_regs,
 	}, {
 		.compatible = "mediatek,mt6323-keys",
 		.data = &mt6323_regs,
-- 
2.43.0


