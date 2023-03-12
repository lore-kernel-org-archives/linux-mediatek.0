Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB780C6FD19
	for <linux-mediatek@archiver.kernel.org>; Sun, 12 Mar 2023 13:52:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bfEjbOEBC8Ag5735P/rqZiEX/nqcdTDOC9PYAPQl5HY=; b=hIs7JVbjPqhmbg19L4wryXPKkR
	lP7rjvjdEPvnq6AJnDf1ROfDhNyNwH+2wlFpQScoh6Xef6Ad35L2KWXK7MIpFkTIxMOAkVsUqhEpk
	kJMg25khw3CsNcnfxmEi+Na58hTTI5b0nwXMZrc/KG/ey/EIOcIvzrSzcdY5gKyvarUYQgRmeD0mh
	Khy6TrkzUY2eoW2yh3jsqLNptJR63O/x0pMSmOSjrxsP3Z6w1ZWIsy8oyrzAjz11sPVo2j3h4n9W8
	DG+iIuhxHFCJLQtJPFD3WpXXU/B/6w2ULdcukYzCMqTsdc31hj91qiIRK+ZaBqyhJJ/8loJS5N9kK
	E6hGoxBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbM7w-002Zvv-6B; Sun, 12 Mar 2023 13:52:44 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbM1i-002Wg6-Tb
	for linux-mediatek@bombadil.infradead.org; Sun, 12 Mar 2023 13:46:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=bfEjbOEBC8Ag5735P/rqZiEX/nqcdTDOC9PYAPQl5HY=; b=pMc3Q2lOfs78TqfQ+XflGqg0Fv
	tK6Ljp1Isua5ZAXUN5/tXRzoo+Z3LMhgTTqqJQXFbsUPQgtlS0cRy5evue8AEziRNc6CL+uFxksyE
	A5RruchViyh/QxW52KgIganeP8L8Ev84WD+IPdH9gcmwqCA+9LgmvDGoSPVbrGVYYXzKpJeP0Pxj5
	AroHaQFJiNypuM4dmDhBtLu2Z1M1L5FOCUc7VejoKBDgDBJd5Pbf1REerBQflqOUUey1KyE8GXBAJ
	eIKsIwSHg+IgjeTbzpEVdDXOJfxNkewRCBQ/DUE1BWH2W8tJpleldxz31hh/e2FCGPGcJXjo8iS1g
	3pRfwu1Q==;
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pbLWU-0011Iq-2D
	for linux-mediatek@lists.infradead.org;
	Sun, 12 Mar 2023 13:14:07 +0000
Received: by mail-ed1-x536.google.com with SMTP id er25so10371230edb.5
        for <linux-mediatek@lists.infradead.org>; Sun, 12 Mar 2023 06:14:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678626841;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bfEjbOEBC8Ag5735P/rqZiEX/nqcdTDOC9PYAPQl5HY=;
        b=uissALC9Qm6G3yTfi85yX5AZcJ4Dc0T+ZSTTKU0wpK9U2V+VDFH343iZjKC5N4s8V8
         Qp9COEJvlzCvWlb23mcYWEdcMc9pbjSuLJ33+tz+X+jWMZtcLKOcvkPj2fJY7WdI8v6P
         qeowegW6LOAq8GiD1h+HIkQ+puCRyyQWHwdYCcrlPZ6Vh93gluUCiol9RzZfw0oufC3G
         DKN/V59iphzKV7hQP5j1PbiPzW0aKpCKWusOS+ijCjSjX2qXzgzuwPhhxcj5tD8u+jqy
         gwla21lfQPZJNhCA9eIisu6WuJeZDVUE+4YaZsUYsp+KLTLS/bKPYcuYJMrZOeTcl/iv
         stDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678626841;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bfEjbOEBC8Ag5735P/rqZiEX/nqcdTDOC9PYAPQl5HY=;
        b=7H5gCrXczuU66BZNZ6bY2AT7tXlKHn0nxIAo5pezgZgMZc6hY6iqVABroAtCbN9FjZ
         FYDIw8DrynOXeOszukGu8E62GLY5FMSskywXLCXpwjhZgGi7lY2YkFfOZc/TT3Mblm+i
         KiWHKq1Dg7V/I1N83XWOnPuq0OUX6BHjrFePhiZ4X5JCLapAgJ4V1qzBL3DuYWGms92D
         giX8ZLzGoHFaad2yqGfNL6k8mHh6cdLUIuCelkshDszZ+h/Cx2vZnH/iXRBtYMi6Y6Ek
         4/O6BRAt/igr5MDBGEWGkhEukWiD4wG6Rm4TgYs353JGSxVD8nyRlss/TI4MQ7VunPAV
         PucA==
X-Gm-Message-State: AO0yUKU3/KgsOIilDyD4kHCXslAFnO7RB7OH5mYNxZMFfXeiTBB18h/t
	zmiZM59UejiJhrHq22jDYTjGaA==
X-Google-Smtp-Source: AK7set/qUd+AuzKeWJtvFJW5YvrmY0+P99WMaVJpgFheOKbbtpLVYddA6FcuMGTWaLuCaaa5fxGzrQ==
X-Received: by 2002:a17:907:7e87:b0:8b2:e81:df2b with SMTP id qb7-20020a1709077e8700b008b20e81df2bmr38467057ejc.44.1678626841335;
        Sun, 12 Mar 2023 06:14:01 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:d9f6:3e61:beeb:295a])
        by smtp.gmail.com with ESMTPSA id r19-20020a1709067fd300b008eddbd46d7esm2213279ejs.31.2023.03.12.06.13.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Mar 2023 06:14:01 -0700 (PDT)
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
Subject: [PATCH 19/28] media: platform: mdp: mark OF related data as maybe unused
Date: Sun, 12 Mar 2023 14:13:09 +0100
Message-Id: <20230312131318.351173-19-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230312131318.351173-1-krzysztof.kozlowski@linaro.org>
References: <20230312131318.351173-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230312_131403_155200_EA0680F1 
X-CRM114-Status: GOOD (  11.87  )
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

The driver can be compile tested with !CONFIG_OF making certain data
unused:

  drivers/media/platform/mediatek/mdp/mtk_mdp_core.c:31:34: error: ‘mtk_mdp_comp_dt_ids’ defined but not used [-Werror=unused-const-variable=]

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/media/platform/mediatek/mdp/mtk_mdp_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/mediatek/mdp/mtk_mdp_core.c b/drivers/media/platform/mediatek/mdp/mtk_mdp_core.c
index d83c4964eaf9..37f2dd08ecec 100644
--- a/drivers/media/platform/mediatek/mdp/mtk_mdp_core.c
+++ b/drivers/media/platform/mediatek/mdp/mtk_mdp_core.c
@@ -28,7 +28,7 @@ EXPORT_SYMBOL(mtk_mdp_dbg_level);
 
 module_param(mtk_mdp_dbg_level, int, 0644);
 
-static const struct of_device_id mtk_mdp_comp_dt_ids[] = {
+static const struct of_device_id mtk_mdp_comp_dt_ids[] __maybe_unused = {
 	{
 		.compatible = "mediatek,mt8173-mdp-rdma",
 		.data = (void *)MTK_MDP_RDMA
-- 
2.34.1


