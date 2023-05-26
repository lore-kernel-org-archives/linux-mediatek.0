Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 649D1C7EE23
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 May 2023 13:11:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qUgyOJE/fY9rPq1bfWp/7kanNPXwLMVS2yyeFGQX14Q=; b=gqhEUNAb76KPZjpTCx1UTYWTy2
	K7tsGrfKkFVCdPItrahGrb4/GW6sc6FMQdp/qb2AAV9mq8kRKc7aI4ngK3ujqJMmjdVeJsPkquMjd
	F0JIzOGXbKliEWDgKCZfghQmOIhs5Fo5jt8H4w0Fg51WiPeO78oQRGaAHJ08giro81Zv9m5wC/O+t
	Ch3ZmtJETTF7phlORx/8nVTygbnGID5ywfspEf3kk/k2hSekxnH0+1ua1pHaylS4cpTjzj1WGba8y
	Liv9WEDCVX2zC3tiXIsbYPy9E8rTvmVtsFgsc5gtw58rHDQ1nxPpFVCJzqTLkw+IxCg+JzF5Cb98n
	P8cY1Q1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q2XDf-002anZ-33;
	Fri, 26 May 2023 13:10:59 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q2XDd-002amC-0u
	for linux-mediatek@lists.infradead.org;
	Fri, 26 May 2023 13:10:58 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-30a95ec7744so669972f8f.3
        for <linux-mediatek@lists.infradead.org>; Fri, 26 May 2023 06:10:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1685106653; x=1687698653;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qUgyOJE/fY9rPq1bfWp/7kanNPXwLMVS2yyeFGQX14Q=;
        b=eCrzoaMcswIXrpTB8ZOJvW0FMKiuKwGrf6nkttwQ4o0CvaU8RK012buSZdZ1unMmf3
         AtcN5cYqsvlig1lqNV6BekpEbeL/ZKhZZ1z//ICQAY/EgdtF3yvuxLnQp1Ty5tzvBiNQ
         EPglEm5CjzpzoYhjCIHcL93/gxLXhpf8ztPcSMj17/xm/FcSKIF2cJOF88Vvie9NfBjy
         F/CAyoc1GE88HwjHSeXy1y60rrkhUNZxDoda76Yw0gXK9giqihDib9lkJzMGjYxGzXmq
         mqaTJ71uRVeTnsmZAnGUN4NnMXO8Buq4cA79wzaCLTclc9Dc4MSL9DQL9j0EgbvweuRv
         2yDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685106653; x=1687698653;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qUgyOJE/fY9rPq1bfWp/7kanNPXwLMVS2yyeFGQX14Q=;
        b=Gt3JuCL1UnnOMV2iWXVRP6dd8yynrC/T0VddXrg3UVnsdefd9NDqSD6q+ntG6lCEXg
         dTNd8zW09EXx63/g26NRv2caSIri7ED8C5BhLJAINSOISghZ0O7pu5XesdM/qrBC1ecY
         vxk415TYujqJxsOgExAKDJqlqIY2Jy0gpZ++hteK7FzV3DYXP6YVsHbiowdOazcLwyxd
         hlomUPrKyQnVI6TjZil0nkZRjNYMIEC2l9Bcdew+elaoR41Ds6SPBx/bftshWDIW6jvt
         R3RiwmeNp4wKYkUYlPf2PKF9sCjSsP/Md7KPbI44sw2jqpg0xUUprjJeBwPr42QgCVRp
         yk9g==
X-Gm-Message-State: AC+VfDzyglUna7CfkYtlMZv1Fq0zQyj2QQUdQD3SIajJ/DRJiSyyr7N7
	Vv5tN0ASh4SMnsHlknfzg6amhg==
X-Google-Smtp-Source: ACHHUZ7bGqw/6PQTuYiTLRKRQpn0q1K0BUEvQeNZpODRlxvVYoNcEP/w+AzfHrQMMMd0VWSrn5Hy7w==
X-Received: by 2002:a5d:4a8b:0:b0:309:51ff:a77a with SMTP id o11-20020a5d4a8b000000b0030951ffa77amr1388066wrq.10.1685106653450;
        Fri, 26 May 2023 06:10:53 -0700 (PDT)
Received: from [127.0.1.1] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id o12-20020adfe80c000000b002fe13ec49fasm5010587wrm.98.2023.05.26.06.10.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 May 2023 06:10:52 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Fri, 26 May 2023 15:10:43 +0200
Subject: [PATCH v3] clk: mediatek: mt8365: Fix index issue
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230517-fix-clk-index-v3-1-be4df46065c4@baylibre.com>
X-B4-Tracking: v=1; b=H4sIANKvcGQC/32Oy27CMBBFfwV5zRA/Ept21f9ALDxmQkZAEtmpB
 UL599rsWqksz5XO0X2KRJEpic/NU0TKnHgaC5jtRoTBj2cCPhUWWmojO+Wg5zuE6wV4PNEdPqx
 sDfredkiiOOgTAUY/hqFa33OT7a6FGFSzTDOH5rbsje2aX5UqzpHK9jpyOBYeOC1TfLx+ZVXX/
 y5kBRJUq6VzXjmj8Qv948oYaRemm6ixrN8GdA2g3dtAfUBHfwLruv4AJQLa3ScBAAA=
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Chen-Yu Tsai <wenst@chromium.org>
Cc: Conor Dooley <conor.dooley@microchip.com>, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4771; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=s9ktG6EMZDgpIOSQmeRBQyxInHPyLL6rYL7iN6uRfXE=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBkcK/coUhPBZM0NAJVX8FieOT3nCN+slKpZTWjfoPT
 pl/E0R6JAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZHCv3AAKCRArRkmdfjHURZ0NEA
 CQX7CxAKFArV5C9+fkjK//dSNLEXu7FlKTnE+YdqaCObcffYXvZP6Ya2cvZOh2i+6p7gO5YnIBUjmu
 gUbV8GXpj81IuQX8stw6iFE3ZHiYaceE7E8QIs93lEsfOPaHDwZTA/eJQDKXQtMvSOQyS7YVn3UAZ0
 htqQdx2RGy8i0UB05+ScCVD8hRjS2xj5F/C+NaH0X1qVvD8C7D7swzuCBHL0DKExqpTsVbnGJJlgtb
 Ul4nTyCrh1POLS09VxC0hy9bUxSO8yrFncZS3nHhvT80uDxYmb2tbQoKDRJsSsXKVBJWO+IlqW7AM5
 ohPYMDBnZLBXRYcqTZraeRdDpnal0VVXME5KjFyc8b20CEvUzhMK0PxSdbWa8UZD+8inPJjA9Nod9b
 Zsq4beLUVzfeCLtOhzUU/yp61DqWgOcSEaMPpa0miDKV4pEFrAK+Uvuum+Jiolpqtw2ZqbpC9Af+//
 +yOoCKrGbnryoV5TBVrafsmUQ8LNTrH9ve/OU9CYAiHtq4OLID7K/CbTRCe4359KBRRt2zDw9KhOVt
 ED1zQCTOvhX2n2s1dcFTYRZgIPirkfdy9aBknnnG6n/3oXVSE6oB0XEdkg7ggSU0XDsNfmDYCN4cTm
 ZwuSzxTmVdIL7Oi8drYGx3G/AVrYyQ1mSDhQAp+R0D5fWKL+QNwUDkH6ewOQ==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230526_061057_321288_04A58085 
X-CRM114-Status: GOOD (  16.88  )
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

Before the patch [1], the clock probe was done directly in the
clk-mt8365 driver. In this probe function, the array which stores the
data clocks is sized using the higher defined numbers (*_NR_CLOCK) in
the clock lists [2]. Currently, with the patch [1], the specific
clk-mt8365 probe function is replaced by the mtk generic one [3], which
size the clock data array by adding all the clock descriptor array size
provided by the clk-mt8365 driver.

Actually, all clock indexes come from the header file [2], that mean, if
there are more clock (then more index) in the header file [2] than the
number of clock declared in the clock descriptor arrays (which is the
case currently), the clock data array will be undersized and then the
generic probe function will overflow when it will try to write in
"clk_data[CLK_INDEX]". Actually, instead of crashing at boot, the probe
function returns an error in the log which looks like:
"of_clk_hw_onecell_get: invalid index 135", then this clock isn't
enabled.

Solve this issue by adding in the driver the missing clocks declared in
the header clock file [2].

[1]: Commit ffe91cb28f6a ("clk: mediatek: mt8365: Convert to
     mtk_clk_simple_{probe,remove}()")
[2]: include/dt-bindings/clock/mediatek,mt8365-clk.h
[3]: drivers/clk/mediatek/clk-mtk.c

Fixes: ffe91cb28f6a ("clk: mediatek: mt8365: Convert to mtk_clk_simple_{probe,remove}()")

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
Fix a regression which prevent the initialization of the
latest indexed clocks. The regression is introduced with [1].

[1]: Commit ffe91cb28f6a ("clk: mediatek: mt8365: Convert to
     mtk_clk_simple_{probe,remove}()")
---
Changes in v3:
- Remove all binding changes.
- Link to v2: https://lore.kernel.org/r/20230517-fix-clk-index-v2-0-1b686cefcb7e@baylibre.com

Changes in v2:
- Add the missing clocks in the mt8365 clock driver.
- Revert all change in binding file except for one clock.
- Link to v1: https://lore.kernel.org/r/20230517-fix-clk-index-v1-0-142077a1732b@baylibre.com
---
 drivers/clk/mediatek/clk-mt8365.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/clk/mediatek/clk-mt8365.c b/drivers/clk/mediatek/clk-mt8365.c
index 6b4e193f648d..c366ac1611e6 100644
--- a/drivers/clk/mediatek/clk-mt8365.c
+++ b/drivers/clk/mediatek/clk-mt8365.c
@@ -23,6 +23,7 @@
 static DEFINE_SPINLOCK(mt8365_clk_lock);
 
 static const struct mtk_fixed_clk top_fixed_clks[] = {
+	FIXED_CLK(CLK_TOP_CLK_NULL, "clk_null", NULL, 0),
 	FIXED_CLK(CLK_TOP_I2S0_BCK, "i2s0_bck", NULL, 26000000),
 	FIXED_CLK(CLK_TOP_DSI0_LNTC_DSICK, "dsi0_lntc_dsick", "clk26m",
 		  75000000),
@@ -559,6 +560,14 @@ static const struct mtk_clk_divider top_adj_divs[] = {
 		  0x324, 16, 8, CLK_DIVIDER_ROUND_CLOSEST),
 	DIV_ADJ_F(CLK_TOP_APLL12_CK_DIV3, "apll12_ck_div3", "apll_i2s3_sel",
 		  0x324, 24, 8, CLK_DIVIDER_ROUND_CLOSEST),
+	DIV_ADJ_F(CLK_TOP_APLL12_CK_DIV4, "apll12_ck_div4", "apll_tdmout_sel",
+		  0x328, 0, 8, CLK_DIVIDER_ROUND_CLOSEST),
+	DIV_ADJ_F(CLK_TOP_APLL12_CK_DIV4B, "apll12_ck_div4b", "apll_tdmout_sel",
+		  0x328, 8, 8, CLK_DIVIDER_ROUND_CLOSEST),
+	DIV_ADJ_F(CLK_TOP_APLL12_CK_DIV5, "apll12_ck_div5", "apll_tdmin_sel",
+		  0x328, 16, 8, CLK_DIVIDER_ROUND_CLOSEST),
+	DIV_ADJ_F(CLK_TOP_APLL12_CK_DIV5B, "apll12_ck_div5b", "apll_tdmin_sel",
+		  0x328, 24, 8, CLK_DIVIDER_ROUND_CLOSEST),
 	DIV_ADJ_F(CLK_TOP_APLL12_CK_DIV6, "apll12_ck_div6", "apll_spdif_sel",
 		  0x32c, 0, 8, CLK_DIVIDER_ROUND_CLOSEST),
 };
@@ -696,6 +705,7 @@ static const struct mtk_gate ifr_clks[] = {
 	GATE_IFR3(CLK_IFR_GCPU, "ifr_gcpu", "axi_sel", 8),
 	GATE_IFR3(CLK_IFR_TRNG, "ifr_trng", "axi_sel", 9),
 	GATE_IFR3(CLK_IFR_AUXADC, "ifr_auxadc", "clk26m", 10),
+	GATE_IFR3(CLK_IFR_CPUM, "ifr_cpum", "clk26m", 11),
 	GATE_IFR3(CLK_IFR_AUXADC_MD, "ifr_auxadc_md", "clk26m", 14),
 	GATE_IFR3(CLK_IFR_AP_DMA, "ifr_ap_dma", "axi_sel", 18),
 	GATE_IFR3(CLK_IFR_DEBUGSYS, "ifr_debugsys", "axi_sel", 24),
@@ -717,6 +727,8 @@ static const struct mtk_gate ifr_clks[] = {
 	GATE_IFR5(CLK_IFR_PWRAP_TMR, "ifr_pwrap_tmr", "clk26m", 12),
 	GATE_IFR5(CLK_IFR_PWRAP_SPI, "ifr_pwrap_spi", "clk26m", 13),
 	GATE_IFR5(CLK_IFR_PWRAP_SYS, "ifr_pwrap_sys", "clk26m", 14),
+	GATE_MTK_FLAGS(CLK_IFR_MCU_PM_BK, "ifr_mcu_pm_bk", NULL, &ifr5_cg_regs,
+			17, &mtk_clk_gate_ops_setclr, CLK_IGNORE_UNUSED),
 	GATE_IFR5(CLK_IFR_IRRX_26M, "ifr_irrx_26m", "clk26m", 22),
 	GATE_IFR5(CLK_IFR_IRRX_32K, "ifr_irrx_32k", "clk32k", 23),
 	GATE_IFR5(CLK_IFR_I2C0_AXI, "ifr_i2c0_axi", "i2c_sel", 24),

---
base-commit: ac9a78681b921877518763ba0e89202254349d1b
change-id: 20230517-fix-clk-index-96043baf65be

Best regards,
-- 
Alexandre Mergnat <amergnat@baylibre.com>


