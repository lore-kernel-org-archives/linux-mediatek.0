Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB75360A4AFA
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Oct 2026 17:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gvrONDYk;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=cSpwTsOe
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DcCZ++LfjibxMYCGx+YpvA8XnStwxpnU2ZVwc+ej5jY=; b=gvrONDYkMHvxuh/X99PanY0xSa
	Qo0i0ehR2B1YrlLqmZkNCxgfEw180uOw90oEiZ+3Xd++XjRdPs8r/iENt7TBtDdR9HFVH0zPsvj68
	o0NvlPNFTW5jSo0HgKFjIQJ1aSE6fwuUU45J78oX1jCUwzSR17weSE11NgaBkHhGac88/1T7GQ15d
	Zcg2fDBzUJ+MVG+bSvxDAmU0e4cgbBZegGuPzvWKfNjSWSOCaIMiNA8WvYFcIXZm8L0afRWQboufA
	JGFMS9al0SABFhiwu3RXr+3FmQyNTE4dFy3i7CrBrR6puJuz4ZPxX5evpUk/QLrjR9vfghcOCE9nu
	DiHrpDnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJDmd-0000000AMYm-2yGb;
	Tue, 20 Oct 2026 17:37:55 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJDmZ-0000000AMUg-2cuG
	for linux-mediatek@lists.infradead.org;
	Tue, 20 Oct 2026 17:37:54 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4a01933b584so25058595e9.0
        for <linux-mediatek@lists.infradead.org>; Tue, 20 Oct 2026 10:37:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792517870; x=1793122670; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DcCZ++LfjibxMYCGx+YpvA8XnStwxpnU2ZVwc+ej5jY=;
        b=cSpwTsOebQelrrTy7/Ij6QhP8G2Iu8WWW/lNXj+Mw8re0HmaQNemE80MsOlzq+GG5X
         fagiJqzPv5HRVb2K/LOkxbQHbsfut2DRhkyIReTwmhgnAMH8zPPFXaofjfptose9k/QU
         OT7+n8I840I3KwMto3a6uVqgh3LLVfO0JiHALoj/dMHDPMNsKFXD3fJzzeug10BREpnI
         3acuYzPOFCuh47vSApon1CSLGqZzGHIqNK1Zil6JHbqXa69ogOVrwzcKsGtMIW5Rb8+M
         Renjx4XU3rtuLYTvtar9sV9DxbL4LwcYx+V6GgISA8R8U0g93KevXyCeW4mvCDokRul8
         CFBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792517870; x=1793122670;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DcCZ++LfjibxMYCGx+YpvA8XnStwxpnU2ZVwc+ej5jY=;
        b=nY5rKG5utY9xqKQ/vAK1Apl8RX1O+IlZnoD5QH7y7UyjwmXn5OQzmwSLsW7I40aJx4
         ugfDeSRx+ljTiIQinOglhFe/4J1svds80krxR0zEPNbKGlKJroiDtzrfoucSNr1ASj68
         zoPVgC4DgPPgijoeDMl0swX4QIgZXLEkgNbxgUnxDU1mi5WxFlwmrOfiq9sm0q3IqbtH
         F8LSiMeu2McgvZJkfUvsuatE4konLEjnuWP5h7Txs3Fy6eZeif9r15iLKCXtBRhokVIu
         6tYTEKfDKVCuwCV5yv2W5aqWzlfjqgAx7hW0yG1dHDXP/PpbqTjWUh2qZrSA4yYx90u8
         QZXA==
X-Gm-Message-State: AFq9FYKePrIYcgXW7AGEmaKHPBli1WCLFC7hYi+/LY8P+c54WVSom9C0
	yptQRXcgEFVNsLFk2/P1oymtlFoq/DvxuOTEjnvIgTi4jhpIjYLzNYLSWPcfrqqf
X-Gm-Gg: AYBFou0TszV1YRvMsiPHLm9d5jRlbR/4C9zjKGQBT89IcN38lONm60U6FI922whMQOQ
	xk77s/srV13mDRc3C3mknbGjjt4aE7MEG/xUZEMnHQYSUOZucGUJAxrXAT8FAkKbldt/5zbO1Ew
	qZpW5fS8WCxCLpYWRbBUid7jazgSSurl/RrBIKT9Gd2gNDiLiwL26iYjh8GqeHPM/m6DVClvdh2
	1lRwciuUkwRwBmTciTpfnVgRkUd9NdTCqiKpQ5IPBwALM2I6ZF2AsqJoKH58EMAcO/ZIDfoNLXw
	ndFzQ76OIIdbiw2g6hnWIZI6ErG8FToGFhYJqDSpiT1WpcNJbcJsoyID/jOdix6VlpQUbtRt2wS
	p6IhPNX7ATqwaSAN+CaTRIZd4cqMVA/1LK2+OHLbSKaxKHGCzdP0xo1Zkqu24yqj2RB0Rclf1DE
	sG7e34X/zeFH5UNycQ9IKTs8Upcc1/gCgdAIkliLwk9MdBuXPAHJG/mI9/t6oMKHCTJj6Xt5CzZ
	1A0
X-Received: by 2002:a05:600c:8706:b0:4a1:946c:953f with SMTP id 5b1f17b1804b1-4a1d7601873mr254696305e9.20.1792517869433;
        Tue, 20 Oct 2026 10:37:49 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f8016c93sm52505235e9.5.2026.10.20.10.37.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 10:37:48 -0700 (PDT)
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
Subject: [PATCH RESEND v10 6/9] input: keyboard: mtk-pmic-keys: Add MT6392 support
Date: Tue, 20 Oct 2026 19:33:27 +0200
Message-ID: <20261020173556.632798-7-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261020173556.632798-1-l.scorcia@gmail.com>
References: <20261020173556.632798-1-l.scorcia@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_103752_438918_400D5C26 
X-CRM114-Status: GOOD (  11.97  )
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


