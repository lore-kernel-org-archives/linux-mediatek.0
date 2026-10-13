Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 358E1CC6B0E
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Oct 2026 15:18:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mtzOa1NC8kzjOt9xbG2RWY9BgPG84LDft99j4Hfp8TU=; b=Fja1aQFmB82ngG+2ddZ9NSu8nL
	glHhEYCLNqhCgPLg4OmMWddoY5kUadS5YcnsEXyuOVLA8+NRTs6E9lX9RSHBDeGFpaxsmSslCX16s
	+gQlMiyufA7U9scNqVk1mutDnVHIlz66373gunFCKkoMzzFHZziP3Ud7aslYXzlZ/vPYZIC3+HND7
	TC6anCGsIyHgUiTGn/rIQEgh8G8Fl0zaCte86SaUOplB1NXy5MnFyzkHRl5zjPx+gerR/Ed14YTu4
	FgOrnTN61C313rf5tSXYrKA8WhFqK22HUta3yrBTrz8B0R4wal4cnOsfmXjaVGYg4L855egqvlRXv
	alKefAdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGeHC-0000000DGSw-376z;
	Tue, 13 Oct 2026 15:18:50 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGeH5-0000000DGMf-3arn
	for linux-mediatek@lists.infradead.org;
	Tue, 13 Oct 2026 15:18:46 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-887a58523e6so850732b3a.3
        for <linux-mediatek@lists.infradead.org>; Tue, 13 Oct 2026 08:18:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791904723; x=1792509523; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mtzOa1NC8kzjOt9xbG2RWY9BgPG84LDft99j4Hfp8TU=;
        b=Z4Blhqj5OJ5yeZslzuHODU6xdxR+MkCptG74IwNrNG+mAS4NPa7SgslobhH9wx3+ZN
         tKBnOgMdxOSpRND1pY03v/kLuEbYZjHAI2PzNGTKoytM8bH5p5ew9pTY5m0AqlTCRW8B
         e3hO3MwoEdsCJdpVE7Tf/RTM45fzvCc1ixDVWkyJicZ8XDUW11PPUyGDEIm0pUuxEn5M
         nzlzjyUePoUj6dgkbSWRjVC9O7EOdP6swHY8ukTcmDQ7TRKBwLVQRcWaHkiBP5QTNU46
         w/9OQPSi9+kFsyLY8DWS02xEFE0TC4ygWUahE2n8/ibPOFuFbLrjzUyBqAfV9uyvnPFS
         IYKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791904723; x=1792509523;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mtzOa1NC8kzjOt9xbG2RWY9BgPG84LDft99j4Hfp8TU=;
        b=KmM7VCcCKyzT1jF1AwJcZFytEcdCWhd7LfkuC9SZOxU+mJDQ0iRKDZ3HHmXyTxNdKE
         NyWTYo2KHPCaz3ar3H1r18dMUw7xyGFpM+kH5kWZMqrYDE7AoqeNPh4Xw5c9bwGJQW0g
         35B7VTuK8M72mxLfXQTujYlEGkaOB55rbNsGHgHAXCpgFjrWrHhwJpF1KO8itAj0i1l+
         HlsQpN9PPH8W69w7NGG1G5vbb5DeSBLTNZDnIbF2BDY93+iQ8OBxNiEjS6HNE1zFD6RL
         rpL/x4SnSxd92iM0cubg816Sh6eIbGIxYQDTGAMXj1tAd704pfsWqeEdsB86y5xt0VDb
         2YoA==
X-Forwarded-Encrypted: i=1; AKwUvBzg5V+xz6/+PJ6Estvxmk9jPoH/LHTYG6B49BoBbF59F3LqCFjsqo0E1xp40uo2ALFIDg2d7gn87XpUIBzHsA==@lists.infradead.org
X-Gm-Message-State: AFq9FYLWRjJyWIZZl10+6hzGDjbmZuFEGtL8K/Fr8Zp89ZQvSlrnxsgy
	dP6O1Krf3w4BPsiSIUs+x504R+hb+b9tMg5l8IVyLsPm93ICvaiTgtzf
X-Gm-Gg: AYBFou3HrKJzisDVAsuvWJ3wDztVsRJrIdal7Td3VEahms1iOVAjmepaUQWmyEsJnL6
	bB0iUmMfWde4MHWM2haWlvBJZ2+ouLXxyzFy1BImt+IV1DOhzoZA2XZdfGFOmk/I+3ChI3yDixC
	6ee30ImRLjZcztAJajEGzVGSPxiRz35y3Ugb1SenBaGLHP+CCD0/i3Wx8YUHLulZRv7IvmvqJmw
	wdD3cR8IrRkRdmkWBCRubpjchbPBLUOyvykx2GpNv6XvS74SZicmyEUdWski+ppih3vafF4yDI6
	vSpRoJDtPDvjW/412hzHbtB2GTLWRjpuLhZPFDqqtjXBkU7FUN7npeIyEp7Fm7F7iMWUAO7F68g
	awZ4oQFb4InCDMQYdEE6a1U5fI6IicCD3ad484tpOYOriAI/L9Sf2B+zC3DWX5DRFuo/g+aXLGL
	43QnguZYtlZHHkpd694XQsZnohiXs7fKs+Q0nZiKqB9RcnHp7uI+bPGmmgM3RVbWTmLse0meX1q
	Spgk8CjAB3AxtirW307PB/1+uy5
X-Received: by 2002:a05:6a21:4eac:b0:3dd:a00a:7ac8 with SMTP id adf61e73a8af0-3e16bebfd96mr10253819637.53.1791904723172;
        Tue, 13 Oct 2026 08:18:43 -0700 (PDT)
Received: from buffalo-ssd.taila54753.ts.net ([240b:253:4760:f400:1ebf:ceff:fe7f:5e0b])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd3da04596dsm5759888a12.29.2026.10.13.08.18.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 08:18:41 -0700 (PDT)
From: Akari Tsuyukusa <akkun11.open@gmail.com>
To: Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Yassine Oudjana <y.oudjana@protonmail.com>,
	Richard Cochran <richardcochran@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Kees Cook <kees@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Haotian Zhang <vulab@iscas.ac.cn>,
	Miles Chen <miles.chen@mediatek.com>,
	Sam Shih <sam.shih@mediatek.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Chun-Jie Chen <chun-jie.chen@mediatek.com>,
	Laura Nao <laura.nao@collabora.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK),
	linux-kernel@vger.kernel.org (open list),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	Akari Tsuyukusa <akkun11.open@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v2 08/35] clk: mediatek: mt7988-apmixed: Add missing MODULE_DEVICE_TABLE()
Date: Wed, 14 Oct 2026 00:17:07 +0900
Message-ID: <20261013151734.3177690-9-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261013151734.3177690-1-akkun11.open@gmail.com>
References: <20261013151734.3177690-1-akkun11.open@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_081845_627415_E3E3B6AE 
X-CRM114-Status: GOOD (  12.25  )
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

Add MODULE_DEVICE_TABLE() to the MT7988 apmixedsys clock driver to
export the Device Tree matching tables.
This is required so that the clock drivers can be automatically loaded
when built as modules.

Fixes: 4b4719437d85 ("clk: mediatek: add drivers for MT7988 SoC")
Cc: stable@vger.kernel.org
Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
---
No changes in v2.
---
 drivers/clk/mediatek/clk-mt7988-apmixed.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/mediatek/clk-mt7988-apmixed.c b/drivers/clk/mediatek/clk-mt7988-apmixed.c
index 416a4b88d100..24f4e7b87a31 100644
--- a/drivers/clk/mediatek/clk-mt7988-apmixed.c
+++ b/drivers/clk/mediatek/clk-mt7988-apmixed.c
@@ -75,6 +75,7 @@ static const struct of_device_id of_match_clk_mt7988_apmixed[] = {
 	{ .compatible = "mediatek,mt7988-apmixedsys" },
 	{ /* sentinel */ }
 };
+MODULE_DEVICE_TABLE(of, of_match_clk_mt7988_apmixed);
 
 static int clk_mt7988_apmixed_probe(struct platform_device *pdev)
 {
-- 
2.56.0


