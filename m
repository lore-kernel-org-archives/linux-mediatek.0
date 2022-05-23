Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A796DC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 May 2022 10:04:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DqoAq+8Yzd9Xir1iIFoFZrw3bg2vQLL8st2R+juKhlY=; b=weC7hzRlIM8uh0
	9/9YJtXHp6eZBkyOzfJLQ5U00tlr+2erew0u9RXDcxbNWZ1o24MTZC6dOEBU2cH6AhBBM66g5flcx
	fV0J4/UCKyVqqJ8gEJTllr2gJFChB8hzuGd7RIRxMRrOzKQQp7DxAzGaUQFtA45b0J9jp/UKGKNeH
	8cqcLbglqhvsWGxvkiR97RGr1tWr8wIzpOCpUY4sU3H3RupnkWwiMqzoy9zF7YFMeKbuIsqD7OQVf
	k9u3Vbb5Uahbh5bik6+itlDaGyL0XUmu1jitbnTwo6FZXd0j3RzS4EMlEf7Pj5ykKhV31GmDTYHKX
	w+YQxEpllW7ED39NRUXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nt4up-0034s6-Oq; Mon, 23 May 2022 10:03:55 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nt3ui-002dmT-CQ
 for linux-mediatek@lists.infradead.org; Mon, 23 May 2022 08:59:46 +0000
Received: by mail-pf1-x432.google.com with SMTP id w200so13087708pfc.10
 for <linux-mediatek@lists.infradead.org>; Mon, 23 May 2022 01:59:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=b4toybDv1M53GirTn8tpXa0Kt2GdamhkRh4OIAgDtc4=;
 b=LugNNq9A1jRao45gwpaFfRD7S7nswT5/bN9+qs88iy9ir1JqkfveP2C+MySEfYAzuT
 mKzKAUZYqsijwo9LBHKKSONhsZWlCsheFWJWw8pZj7p1XZ1w/RX5nroUBXBpJdPidTen
 t6o43jxZtOQ2qPp0yLK3E02PfSxGjfxM864AE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=b4toybDv1M53GirTn8tpXa0Kt2GdamhkRh4OIAgDtc4=;
 b=BVADpI0k5Jh/eccU1Vu8T9jCAK1MkranbIm51KRhrGulh3zqfvhYEv2qGOoUVFxfl/
 PhBSZ1wHZhsiESMqr1T+m5HNHGly7evf/Ww2FDn4WcEzgRn+ZTCEMQBkV2FTFLxbrvDL
 zVDxiN1lr9+MZsFBvHxfIs5BxB3PJOXTS6tRqhm+b3joaD7Ux1v2FQ4EKHERCKKyZOL9
 E/fXCavmrvrOGoIks4SLEWSDK6ix45brfN4NZOBrdqih8Rr/3kDAVU1ljx7jXdLqmrki
 YMpt6KFEnoED56CbIju6EUiHWWbsthpOMkADmJCOnFx3vb8cW+1t7L6rKyyFMoj1GaRl
 cGTw==
X-Gm-Message-State: AOAM531fEcqoNTnOpvUJ3KhBvSI45q2v7s2J0IPlGtypWCy0MJ9pZr2W
 BguiCNfhpYvkLV++JJHL/9f1NixK+sib7A==
X-Google-Smtp-Source: ABdhPJyzzCmYWZva4xngidgLFHgwZkMLeSN/5IngSAyroT2BA0b9QiJFbU1J1oNzacQ2caYizNg6gw==
X-Received: by 2002:a65:6cc3:0:b0:3f6:26e9:5c1 with SMTP id
 g3-20020a656cc3000000b003f626e905c1mr19125032pgw.28.1653296383341; 
 Mon, 23 May 2022 01:59:43 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com
 ([2401:fa00:1:10:1b8:7eae:9793:ff95])
 by smtp.gmail.com with ESMTPSA id
 e11-20020a170902cf4b00b0015e8d4eb22csm4524719plg.118.2022.05.23.01.59.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 May 2022 01:59:42 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Miles Chen <miles.chen@mediatek.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/4] clk: mediatek: mt8183: mfgcfg: Propagate rate changes
 to parent
Date: Mon, 23 May 2022 16:59:21 +0800
Message-Id: <20220523085923.1430470-3-wenst@chromium.org>
X-Mailer: git-send-email 2.36.1.124.g0e6072fb45-goog
In-Reply-To: <20220523085923.1430470-1-wenst@chromium.org>
References: <20220523085923.1430470-1-wenst@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220523_015944_499563_63C477E2 
X-CRM114-Status: GOOD (  11.57  )
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

The only clock in the MT8183 MFGCFG block feeds the GPU. Propagate its
rate change requests to its parent, so that DVFS for the GPU can work
properly.

Fixes: acddfc2c261b ("clk: mediatek: Add MT8183 clock support")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/clk/mediatek/clk-mt8183-mfgcfg.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt8183-mfgcfg.c b/drivers/clk/mediatek/clk-mt8183-mfgcfg.c
index d774edaf760b..230299728859 100644
--- a/drivers/clk/mediatek/clk-mt8183-mfgcfg.c
+++ b/drivers/clk/mediatek/clk-mt8183-mfgcfg.c
@@ -18,9 +18,9 @@ static const struct mtk_gate_regs mfg_cg_regs = {
 	.sta_ofs = 0x0,
 };
 
-#define GATE_MFG(_id, _name, _parent, _shift)			\
-	GATE_MTK(_id, _name, _parent, &mfg_cg_regs, _shift,	\
-		&mtk_clk_gate_ops_setclr)
+#define GATE_MFG(_id, _name, _parent, _shift)				\
+	GATE_MTK_FLAGS(_id, _name, _parent, &mfg_cg_regs, _shift,	\
+		       &mtk_clk_gate_ops_setclr, CLK_SET_RATE_PARENT)
 
 static const struct mtk_gate mfg_clks[] = {
 	GATE_MFG(CLK_MFG_BG3D, "mfg_bg3d", "mfg_sel", 0)
-- 
2.36.1.124.g0e6072fb45-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
