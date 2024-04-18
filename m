Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34E5EC04FF8
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Apr 2024 14:18:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h3otSZuiUA0RBdwKSB/5nO1/TIttSyxWSp9sd21V3FQ=; b=FyJM4gg4tl048exEomfegVz8/7
	m72MlDrygGqSpI7evEql+vwh8s5hjDkSy2ZoDxVuSmq0mRrO2SzjDJUPNYZWkLR7GkZE/OHnENARM
	lH8Vldn5w53yvzZcUda32KJ9jQhdCfBUoHeM1jtVlzjJ4kA++q7a7YB0csg83Ds4f0aS1l8tzQDTJ
	uR36OwujWTuESjQuD+gxMoQdScsChycy5T22lrpGWtkPifA7+9Rf6elB5ijrqYfECnV/vatPD+u8T
	QYy2S9mN2X4aDbjrSxOdiJrhvnTYiMKE0pCwxA3p2+PWeo0DpnMYWNayqn0NeueGo972PwTSsysQb
	OR0uIBqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxSbI-00000002ZY4-0MvI;
	Thu, 18 Apr 2024 14:18:56 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxSaA-00000002YrB-13rK
	for linux-mediatek@bombadil.infradead.org;
	Thu, 18 Apr 2024 14:17:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=h3otSZuiUA0RBdwKSB/5nO1/TIttSyxWSp9sd21V3FQ=; b=TlFmwY8c0fenvTbnTlCguTZocR
	TLBKF7+gIRzBpgQO4QhPlEos6Z+4ejRMYnSw5zFqN1fDr+CdAleZAlkz48lPvE4g2GZk7Yogyavjg
	FZhH5sx3uZewljzrBVTYn/EpYQZB0LIzsSio6ZjxJ+Kf2XkFPNl34UowjDutlZdnNI0DoQORxncSu
	q3f8cjXRYW7essNkbR0gy72YxQ2NyJIXjRhhlyej+C1SxOa6gnnfZ1ax1OgMMN2wAPTiz4cY19K30
	f82PNczon2/q2h4GgTLb2kQkblclva8i/g/5M7yrLHTwPKVW8vvoBZGRaYtyiFNqPX3EAE7hUj9xo
	KiVVVqhQ==;
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxSZv-0000000C29N-3JRg
	for linux-mediatek@lists.infradead.org;
	Thu, 18 Apr 2024 14:17:44 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-418def30e50so5734295e9.1
        for <linux-mediatek@lists.infradead.org>; Thu, 18 Apr 2024 07:17:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1713449850; x=1714054650; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h3otSZuiUA0RBdwKSB/5nO1/TIttSyxWSp9sd21V3FQ=;
        b=oPrvHmKklC04e3WaOFmML/ETccHPGM2fVowlLxmvYu4TkXiWB3qqYevy27GRZQ47FT
         h1/jCC3gSRJNGqJRDvo984BXLHOJRGALShv5ifRu+O/JRIq/vdSMG7QoW5FZTuyRZssL
         tE/IgbCm9JFC0CTDFKRNK+M3aPE3DV5m/+CPLDwt6lBt0KjX6iERyxMfk8gqWnA1DqAW
         GZENCGRitUa3w/tLRRtoRyanFjXoKhbDJDW06oeVqhCoi/77THXoa69y4JoFE216ZYb5
         Q5jytqTfJXiZJOLbMvQ2YzVecYvnqJzrlLWUK5aorygaoblVL4/JoP44zf28zdjdPd5D
         Ea0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713449850; x=1714054650;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h3otSZuiUA0RBdwKSB/5nO1/TIttSyxWSp9sd21V3FQ=;
        b=KspjH7+c3xsa1X8Elc3BWSV4OPmavkE1ihYw83N5krsrIrZ4Q8rRwZnuSuEKetmKx9
         DX4NOKwKBDQ0twVC/KRVPViXdIJ5G9SIPrLF9/lrVygdmYhWdbCE1vU3zs9yoZdAWXfM
         vGuHlVAU7No22PPoN0frIsaNSq00GezhGCVN8SRyzeLVlaEUae2WkXopnE4toKPj48RH
         fqYsBKrv4YzRrdyFaPUwDRvVoSQ0kqe/xOwDTYWE3/ZTE+Pkt+kU4YIwdwckKpxkInhs
         oSmfQPX0mlD5LNaXga27SobWJjKTgYbEsKote+hdQmaJu9WhT5rA8JYEXs6j43/+P4Ya
         TVSA==
X-Forwarded-Encrypted: i=1; AJvYcCVv/PPVY6Whn/KCVcuu3+PcIWi0c3Dcd5reDMhvXbZKtdAXIaEq0IT0eUyA2qnSWd7OnkknoHs0/omfrtCgvWgdiJKkUjLoPQYJVJt+DeWwNOGu
X-Gm-Message-State: AOJu0YznIWsdA0o59OTBKDC00JYVo+GDPTBkq4wbnZmmCzaEOJeWlM/J
	wzDPa3HXEfqVkbp9J1gFqEUWcIxCi75lwU7fO9DX7LiT2PhqIa7yL1QHvuHMPMc=
X-Google-Smtp-Source: AGHT+IEiQUufXTv7FJcYkp/QB82CY+QyZl0A6G8qICn/+gCfoWDUcq8617KoBHtq/0X/7mU0hAwvqg==
X-Received: by 2002:a05:600c:4ed1:b0:418:d2c5:5c65 with SMTP id g17-20020a05600c4ed100b00418d2c55c65mr2438790wmq.37.1713449849699;
        Thu, 18 Apr 2024 07:17:29 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id i9-20020a05600c354900b004180c6a26b4sm6267510wmq.1.2024.04.18.07.17.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Apr 2024 07:17:29 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Thu, 18 Apr 2024 16:17:00 +0200
Subject: [PATCH v3 12/17] clk: mediatek: mt8365-mm: fix DPI0 parent
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231023-display-support-v3-12-53388f3ed34b@baylibre.com>
References: <20231023-display-support-v3-0-53388f3ed34b@baylibre.com>
In-Reply-To: <20231023-display-support-v3-0-53388f3ed34b@baylibre.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Jitao Shi <jitao.shi@mediatek.com>, CK Hu <ck.hu@mediatek.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Fabien Parent <fparent@baylibre.com>, 
 Markus Schneider-Pargmann <msp@baylibre.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-pwm@vger.kernel.org, 
 linux-clk@vger.kernel.org, Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1471; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=CxkLUlifqvxz1G/Eho8b8T4Is6DgFjTZfGPXl6VYPH4=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBmIStjTlVje5tb59O8ee6DHe2YEYRuzYS3qUOt1aEr
 ArPtZJaJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZiErYwAKCRArRkmdfjHURQqNEA
 CYVXzwd+84f6xIO7EyRZqTIThqTCaSd0BOLeBN/VzpJk8gHezkxoYZHgiCRin94aHkjaR7VSMB/Quk
 qBq+TiWTMhA1/zaXb41ylAI+Dyew3JUPmpZ2M5T8yDYNnbEjiOAmGrAM9/+9bsp18Y72CDZgcRkkT3
 +VyS01NGZZsojIayz9SpoHYeJfa/MUxZ3tUyle4MMHJYbvkMs9MNQ619sgiQTWiE2+Q41Fv9dY9VoF
 mbVjtEs7R3f79z7ueli540F92j2WQZ4oJZ6LuQ0fGsXezsTGv/qfuoTmBHIVXRVY8p/9ciqrrnl8BP
 LVfYA2WXi8SJBZxYMYEOspJ2EYlIQyIZ03FG/bPJsvB7CYsuC0f4yqlwA8ARd2T6uoG0xHT3VeKS6Q
 sLNan3y/BScJLyDClVjWhMQXRW2CjNcSRVeM32pj6Ja37+B3RfnaAE9k4jf5pfbRkWxvsk7QPDCrCu
 IvPTDwRJhuyrC7BFmfac8T3JAUirPF00v1tjMXILiYfeA3K+Gm2K4SVmd+9EWgjEJcbf6ucCjlQU/p
 Mz7gTttZFPwcSGfcOzz67IGjCR6OlEXErvSLeC7em/u4Sq1gQIleQ5ecPpwKcZ2V5k4TcHwQn1/IyQ
 AREJ37OCcknpY2fMYZGW6FkM6el89Lz6S94SzjFiEJxeyBPQeCxEds2+saJg==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240418_151732_315339_94FBB0EC 
X-CRM114-Status: GOOD (  12.33  )
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

To have a working display through DPI, a workaround has been
implemented downstream to add "mm_dpi0_dpi0" and "dpi0_sel" to
the DPI node. Shortly, that add an extra clock.

It seems consistent to have the "dpi0_sel" as parent.
Additionnaly, "vpll_dpix" isn't used/managed.

Then, set the "mm_dpi0_dpi0" parent clock to "dpi0_sel".

The new clock tree is:

clk26m
  lvdspll
    lvdspll_X (2, 4, 8, 16)
      dpi0_sel
        mm_dpi0_dpi0

Fixes: d46adccb7966 ("clk: mediatek: add driver for MT8365 SoC")
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 drivers/clk/mediatek/clk-mt8365-mm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/mediatek/clk-mt8365-mm.c b/drivers/clk/mediatek/clk-mt8365-mm.c
index 01a2ef8f594e..3f62ec750733 100644
--- a/drivers/clk/mediatek/clk-mt8365-mm.c
+++ b/drivers/clk/mediatek/clk-mt8365-mm.c
@@ -53,7 +53,7 @@ static const struct mtk_gate mm_clks[] = {
 	GATE_MM0(CLK_MM_MM_DSI0, "mm_dsi0", "mm_sel", 17),
 	GATE_MM0(CLK_MM_MM_DISP_RDMA1, "mm_disp_rdma1", "mm_sel", 18),
 	GATE_MM0(CLK_MM_MM_MDP_RDMA1, "mm_mdp_rdma1", "mm_sel", 19),
-	GATE_MM0(CLK_MM_DPI0_DPI0, "mm_dpi0_dpi0", "vpll_dpix", 20),
+	GATE_MM0(CLK_MM_DPI0_DPI0, "mm_dpi0_dpi0", "dpi0_sel", 20),
 	GATE_MM0(CLK_MM_MM_FAKE, "mm_fake", "mm_sel", 21),
 	GATE_MM0(CLK_MM_MM_SMI_COMMON, "mm_smi_common", "mm_sel", 22),
 	GATE_MM0(CLK_MM_MM_SMI_LARB0, "mm_smi_larb0", "mm_sel", 23),

-- 
2.25.1


