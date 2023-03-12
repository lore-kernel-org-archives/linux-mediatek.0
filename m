Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCC15C6FA99
	for <linux-mediatek@archiver.kernel.org>; Sun, 12 Mar 2023 13:48:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=buQg6sc8yXPiuj0KpLg54vXnkMGR4QG/BKa5y0Xpa2Y=; b=w+kcAxWDDaF5eGSL3QpbZnzNZe
	uBu27r/otu114E3JZNTvMYdQ4SLmbhkIcuYkY1DpkyCzsWwfrypt+Fd3Diw2kpSAhwLrHawdBI8ba
	z5fuSzVu1ElcqKuHd/itL2YTKWidjvokzE+k7YhsV8wuEKjvBAVGVmBzzvI1ZFhjlYhoEfo95LtfU
	TPsbh9JRUkqqIt26s9Hjz+FvnbMVRbzstllPj5e2owIMrnA9UbTKKYpBkhb56CgSMPk/Y+DTefC5e
	3LZ0pqN96HUJNEb+moAlLSXSf/oqL+Em9x10N+NMc3MY01zlMCKPrnpfrJdRddtU1sdFwBElQomEE
	EQ1yVN3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbM3s-002XnA-HJ; Sun, 12 Mar 2023 13:48:32 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbM0s-002WDu-8M
	for linux-mediatek@bombadil.infradead.org; Sun, 12 Mar 2023 13:45:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=buQg6sc8yXPiuj0KpLg54vXnkMGR4QG/BKa5y0Xpa2Y=; b=B8zk4DAsFZx1BDRwHvrmOHVlxJ
	C0b/D8cLa+6HiTKL2/cZJN6/4wHiGd8jstF9vM/7JEtOTcmE3nKwHRGFhJiZlZNw0i0FCmh3Tp+J4
	/ar/TavQtyrkhrIINitIis2Ba76gJ67qQ9XIZWimyQCTKDAMjeGAgPiK5eK8FE933lAOi4eXcD0yz
	9mVeKpk0CUECiMPLUdMsdSMmi0Aw49f6aMxB/3D23WgPVKAlcFx8zKb6UJtRiF0Tg/06s5wxceies
	tN0uZuCNu4MQDf5F2ybiWTp/UbnpKBGjjVFRlIIzkiuqeoYniDv8QI0mBL+iw5uSM/GKRwRnTcXXK
	Qf3HUwDA==;
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pbLW7-0011Cz-01
	for linux-mediatek@lists.infradead.org;
	Sun, 12 Mar 2023 13:14:26 +0000
Received: by mail-ed1-x52c.google.com with SMTP id da10so38595886edb.3
        for <linux-mediatek@lists.infradead.org>; Sun, 12 Mar 2023 06:13:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678626815;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=buQg6sc8yXPiuj0KpLg54vXnkMGR4QG/BKa5y0Xpa2Y=;
        b=GnWL3jRt7rNHd4ypSq8umyqs1x7+0wYjNeYAKRv1DYI86Q1oa+IH8PWctC1Wn1hOy1
         y93TFuRwH5JaVlqiteoJQLpQ/TFWQauBKf6VIy3rgszMH7kuzi0S7xxTV/DUlNx6kGWz
         bHPb++v6s5Yugrzys+edgMF3SIe18dNXHurPcmVp+cQwX6OFWKlw6aENyrobhpJE+WzO
         oOjc55XzuJIQ+fjO7bGFVCQ9ieALrkOjivsIggJcLhUhMHqPqaqX/EMKpWTLFVuy6Hg8
         u77f9u6QLYp9a+86xO1rMpEyWn1T3CAZdJK+Kz82pdXVzRTthcPtlqhx5FyVWNv5poo/
         sGOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678626815;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=buQg6sc8yXPiuj0KpLg54vXnkMGR4QG/BKa5y0Xpa2Y=;
        b=NDhNdf2mwHzib2dzHgRwESd+KCtzbQtRV6zSlLuMgdPndbYDBsG4kA1IHMDyNV2qy/
         yo491VmidKhPdiw/s82TnWC3hzWfi7QVyqPoNkF3BH7+9zrXl4VyOzHYLfRz1MeigClK
         2sHflSj1Jj9sm9zySS+exW/LoZcHJ9V8VToacB1LtrCT3f/eMkRpBBR84l48wTjPYJBB
         khB6tl2t+De87v9TILLPwevVR73m9s3H1RgIAly86UR88VpqGX8rFrHj/htuQLl0wpbd
         fswyenennuGeV4ZTGKbMPu8Hq1yse9SL3bTIbmicCmkruLwIAEwfhjsG1fmA9sdRl5jl
         T9kA==
X-Gm-Message-State: AO0yUKX47fKD78AgZ7GlqwX361iqmCBKQTE8DPH7r3e8gM9h/blvx0ZZ
	vt7F2mWAmSE09FQbmniXI/jrkg==
X-Google-Smtp-Source: AK7set8WaF2rUwXzajL4x+ub2degb8HIZtrdNRoJNVJTVfKoaxigWqj4b6PT5ae6Lxjnr++xATWHbg==
X-Received: by 2002:a17:907:9806:b0:920:388c:7cb8 with SMTP id ji6-20020a170907980600b00920388c7cb8mr6643262ejc.40.1678626815715;
        Sun, 12 Mar 2023 06:13:35 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:d9f6:3e61:beeb:295a])
        by smtp.gmail.com with ESMTPSA id r19-20020a1709067fd300b008eddbd46d7esm2213279ejs.31.2023.03.12.06.13.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Mar 2023 06:13:35 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Joe Tessler <jrt@google.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Michael Tretter <m.tretter@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Jacopo Mondi <jacopo+renesas@jmondi.org>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Wenyou Yang <wenyou.yang@microchip.com>,
	Bin Liu <bin.liu@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
	Houlong Wei <houlong.wei@mediatek.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>,
	Jacek Anaszewski <jacek.anaszewski@gmail.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	Yong Deng <yong.deng@magewell.com>,
	Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	"Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Sean Young <sean@mess.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-tegra@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-rockchip@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 06/28] media: rc: ir-rx51: drop of_match_ptr for ID table
Date: Sun, 12 Mar 2023 14:12:56 +0100
Message-Id: <20230312131318.351173-6-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230312131318.351173-1-krzysztof.kozlowski@linaro.org>
References: <20230312131318.351173-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230312_131339_323861_F8E27F9B 
X-CRM114-Status: GOOD (  14.81  )
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

The driver can match only via the DT table so the table should be always
used and the of_match_ptr does not have any sense (this also allows ACPI
matching via PRP0001, even though it might not be relevant here).  This
also fixes !CONFIG_OF error:

  drivers/media/rc/ir-rx51.c:264:34: error: ‘ir_rx51_match’ defined but not used [-Werror=unused-const-variable=]

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/media/rc/ir-rx51.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/rc/ir-rx51.c b/drivers/media/rc/ir-rx51.c
index adbbe639a261..13e81bf8005d 100644
--- a/drivers/media/rc/ir-rx51.c
+++ b/drivers/media/rc/ir-rx51.c
@@ -275,7 +275,7 @@ static struct platform_driver ir_rx51_platform_driver = {
 	.resume		= ir_rx51_resume,
 	.driver		= {
 		.name	= KBUILD_MODNAME,
-		.of_match_table = of_match_ptr(ir_rx51_match),
+		.of_match_table = ir_rx51_match,
 	},
 };
 module_platform_driver(ir_rx51_platform_driver);
-- 
2.34.1


