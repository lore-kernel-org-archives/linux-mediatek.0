Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17270CD3442
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 May 2026 17:01:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=oDyvw0L8OYXJ6cX888dTXA0t+K6akFsCVQtR50QGsSw=; b=Z3tebUA6fFzdvzjsIsgEZl2/zs
	aV7CqyooG0v/Rq9Vd3alTjSZcjzF/l1i0h6qH4BXbmLz7kBj2XVRl+4KeNHxbjfddCiZTKloi/lnh
	VGBuEjNF5e+s1Om9fJww0HRSW/MoiiJpwyDc+7UqLLhaVcj9cEruLAxfKNhtF7kmpNRa8Lgvek4Pv
	TpNYonkWKFqWhM+CWW9CLezthiS32apC/xNhC/Y+aAHKrLD9oUotlV42oBGCjVe1e1Lv5mflI+dXU
	oCp7v4u+6NJp/sMyWG1VUKfx+b4EFiloVhu5hjvFU1E6lcqHeNQzkcTZFhqNuf+3sBkzS24pp2y2n
	3i5mzNPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wL26H-00000004Q08-1jyJ;
	Thu, 07 May 2026 17:01:25 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wL26E-00000004Pyp-26oD
	for linux-mediatek@lists.infradead.org;
	Thu, 07 May 2026 17:01:23 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4852a9c6309so9609285e9.0
        for <linux-mediatek@lists.infradead.org>; Thu, 07 May 2026 10:01:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778173280; x=1778778080; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oDyvw0L8OYXJ6cX888dTXA0t+K6akFsCVQtR50QGsSw=;
        b=PPN01Ny75y84TUM5AtZT7xx5KVRWO+tibcRrVg+w33c31xGErAplhGFnkuu5dEbT5+
         jF8EaSaThKPqQGn5cOtz1WyM/0E851SroAeclASuAGlz+WTFbgYbFMmnZLR1vhOTzXrl
         mGb6hs0URlReyCKkghW5Y2eqBBzOnIRumxuweqzazJZtsoPabdoRX0P4jMi7bwquIvS1
         lNxFstJBue7I/qqwUwxXLrKKw8dyCo9FnWBoAtMS7m1tMYutUIhwokN8zKdmOmThqrQ2
         Pmg/4iQfz9gaJYpXQH1kxgGeUQZno2/JctixTWmpEziJihBvCaU92U+PTuktYzjVyekf
         ESiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778173280; x=1778778080;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oDyvw0L8OYXJ6cX888dTXA0t+K6akFsCVQtR50QGsSw=;
        b=JxiwowacKBVAqDcT+B0zZGdraz9Q3C7kScsEw+OEJgRUsMcr8k0eyRXeSjlS41EufG
         jpIJbg/zFtCOmWTNy5SwIA0Ada5b1BPPRMtzWTnVrJG5yjR7l2t9XEXwJX0rpY3CPluJ
         Qk1yLr8miwbjfkEJz+alOAjqZQUcXu6fhx+Q7e7zVVwHG2y0AsZaJYWg4pedJA/AMit7
         s9AnkN2ccK9j8Rk80OwlBXtXOPWl3qI+PXN4SOuos0KPWMzKWpdLvII7PKLdEvGd+KWU
         3lTnTI4gukk4BLeCmTL3LE69nNJd1z/MW3gwLqPJm7xu1HFw2mfKD5OfhDgnfylJMITe
         6mNQ==
X-Gm-Message-State: AOJu0YwMOSLbB621kPfsiP4SQog7CAdsGKVoXVCay2ENNglerQxSQ98l
	elq7LysEYbknEdVdIptf1pqztvgipnDMSiP4NxzxrzKCAilgv57UeMN0t79CdDhx
X-Gm-Gg: AeBDieuEOftKFArnOS1VokoG9IYyaCyLTEPt76s6jQSFFUrF5EWwUtUqVqgHVVsZz9S
	pZIwTbzRVIrL9RNedXa5i7uJcO8z0V8prXPH8+9EyunG/6jiiPvjqA1irFhW8GysSJjuEdZ04Gt
	ZoppOe/YYDZjBtb3LZJRy/TMWKaRIuQaLrjz9qULuXGqQNgdTSAriR4RHoS7pEyN1bCOsHdACbz
	xewE0F3zFIzGf47qvRJG2LQvbQYpge4qCkOa8GFQiGOrfx3WUviNLnXi9GU6alRZqgpDOMGTa/Z
	MHSWDKjDYEQfBTBmLjWMD5uzMKTd9VQZPzw9i985haSAaVqM6hEbgAMlww3n1eQO6uY2acMIGsc
	GKEOsUUtdF/XJU8rXjMn0Jr6jcj3z263M4vXGb85qZ4NNTEWUCB+bZSspiDh+znPTOJhopJenZF
	ifPJ2GlvPkil/IG5roQm9Av+9Krce/Xg==
X-Received: by 2002:a05:600c:8485:b0:489:ecee:c4ef with SMTP id 5b1f17b1804b1-48e51f2f874mr149807555e9.13.1778173279572;
        Thu, 07 May 2026 10:01:19 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e538c4ae1sm131912545e9.12.2026.05.07.10.01.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 10:01:18 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] clk: mediatek: mt8167: Fix orphaned mm_hdmi_pll clock
Date: Thu,  7 May 2026 18:00:46 +0100
Message-ID: <20260507170107.88248-1-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260507_100122_540973_FB407253 
X-CRM114-Status: UNSURE (   8.58  )
X-CRM114-Notice: Please train this message.
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

Clock hdmtx_dig_cts, parent of mm_hdmi_pll, is missing from the clock
hierarchy. Add its declaration with values coming from the Android
sources of Lenovo Smart Clock 2. Tested on Xiaomi Mi Smart Clock x04g.

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
 drivers/clk/mediatek/clk-mt8167.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/mediatek/clk-mt8167.c b/drivers/clk/mediatek/clk-mt8167.c
index c64d918c37de..df9f9dd1bfd6 100644
--- a/drivers/clk/mediatek/clk-mt8167.c
+++ b/drivers/clk/mediatek/clk-mt8167.c
@@ -27,6 +27,7 @@ static const struct mtk_fixed_clk fixed_clks[] = {
 	FIXED_CLK(CLK_TOP_DSI0_LNTC_DSICK, "dsi0_lntc_dsick", "clk26m", 75000000),
 	FIXED_CLK(CLK_TOP_VPLL_DPIX, "vpll_dpix", "clk26m", 75000000),
 	FIXED_CLK(CLK_TOP_LVDSTX_CLKDIG_CTS, "lvdstx_dig_cts", "clk26m", 52500000),
+	FIXED_CLK(CLK_TOP_HDMTX_CLKDIG_CTS, "hdmtx_dig_cts", "clk26m", 75000000),
 };
 
 static const struct mtk_fixed_factor top_divs[] = {
-- 
2.43.0


