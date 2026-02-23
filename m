Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE445EC1105
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Feb 2026 16:26:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GsX5I8ekieUXCqSFWWV9OWjKFqWSLur0ZuBiwFVR/2E=; b=taBfmGV8q/4rYwBpdPNn9VmBM1
	Y2JA8QJa8JVUfLBH4+lzSbHXnnfaHhuK9kwk8gQxXZnO1L1IW4ndyT6NRBdlfJ2KawUh+4eEl2qnR
	RqTXhSqj1Q/lzX39BrFwSTsLldoBs3QggZ9DdpKyPCcNoKbAPhcact2NXHXzXphwzh/64/qMMDHGn
	3Athxa2lCUSxUSj/uW6118Lo6rLJdrJH6PzAX8Zv9OfCCeu9hvZXqkqCxwkcNybmOrZO5sWHdbTpi
	Rhvs8PfSvJ5UIf6k2ypBUvP0L8b82aaJb2B/8sJRg/eR59Rd+57cqQ4O1xOgsgvErDquriqEnD2AO
	MIdTR9fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuYlr-00000000g16-2Ivq;
	Mon, 23 Feb 2026 16:26:55 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuYlm-00000000fuT-2Ab4
	for linux-mediatek@bombadil.infradead.org;
	Mon, 23 Feb 2026 16:26:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=GsX5I8ekieUXCqSFWWV9OWjKFqWSLur0ZuBiwFVR/2E=; b=nP4IMWcchX4HeUMyfgz/CoXXbm
	ZL7vFSLCa09weF/hW6RxCouDullmBx+QvxY8pT50gFBAieSd17pSphWlI6AKUVZJ9UZ5LDQHojpK+
	HYkX5LYmn8z6M+hoD2TqhxcutVx1DGQVSXgrbKLgPzyWwwekKn/mjCSdIw/W1ISBDpz7rSbCoZFYU
	dK1cDXOUG6gMFH2JzXkSU+baVIsrpeQVAtpl202fNMEOW7n2udZLFFzp3RT+jpG7f8HR08m4JpRvM
	lFfvk8Ke+R1SlSeN5pAfN2ykUGMjHt2KiOrxWNLB0yxdRWCVnRvnEQAnSr7OPK3sQZOASTgkePp90
	jTF/DQNw==;
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuYlj-00000005TBi-25pK
	for linux-mediatek@lists.infradead.org;
	Mon, 23 Feb 2026 16:26:49 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-4362507f0bcso3223574f8f.0
        for <linux-mediatek@lists.infradead.org>; Mon, 23 Feb 2026 08:26:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771864005; x=1772468805; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GsX5I8ekieUXCqSFWWV9OWjKFqWSLur0ZuBiwFVR/2E=;
        b=jzJW0dZQtBnnOvqGWM7pM6b4kzMOdHbpK+FGaGgvk0KuiL/vk5nHWXc0tf+BJIFE2V
         8FiyFA1vpXJo7cS8C/DbCosKaM5tli1YNUwd3YMzKqjk4m3unqM3uXp4oT25Dtw6aUt7
         9NdynY7bfCsp0zKIUz6LtmWesqAiWT1HHhNkhviMqBUUkHTIAmf4aJhmYZsjuYm73WcH
         qo2A6+wYTGoRy2HGjuSAnSqPfskcNGTY5Uhwtxrbs+1UP4nk0lA0Hu922QT9EEmGs96R
         QAVF33gRNVh77s6A36r/Sh9UBjUMJ4MVA7V86M/AJLtCD78esOsPgLbR5juNmkfMyQHl
         ETTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771864005; x=1772468805;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GsX5I8ekieUXCqSFWWV9OWjKFqWSLur0ZuBiwFVR/2E=;
        b=LssfbddmXyxQNzy2aarJ+SoSqRifl5FqUzIO1y/0M1R1LPurgLVuCq5mU6UlMf52B6
         hKBi1Zw2LRi3FkSvuFgcBjqyiVYNzhTjY5OgQaHyABOUBNzSqUyhgvuZyJm/FKYRbnPb
         JsLqRk0fO9XlG1jtnobuTokxhYAUAIqF5URAB//SpauF9Lyop87aBcgsAcvCwYoWJtrU
         xI+0J7YhMJVK8tlfIOwfXcML+lactpkOvYYNFZ0SOrjO+wSReAv/N7/WLCMcAgZ1VZFp
         MNLOr0fW84o1mpMrkPIb4h4/om2qjenBT+iLxGhnLEsEg2/uyOXTtYgAE/r6NuYg5eRb
         5yEQ==
X-Gm-Message-State: AOJu0YxHK6yWq5HLBOecHQwOk2ehKXfC+kpmcNhH0zCAibYWqlxQzKbh
	O1QmZIOZ+xxI8CDB4FojQhzJRisO5M1E7GSYTm9ZUKobqB4T8w5CM5R+QB8eCg==
X-Gm-Gg: ATEYQzw1nhS4WUSSCo98pLDLD5gDiMc8OuK+DmIy6RceivT0tfmfFcdKlwvPy7/snzn
	DEiI+n1NjcAmno9GuzZMDG8INdNzih/gskDBFZ5Rj3b8itgod/cRj8QClIfpO+siycs0YFwr88g
	eAraI7uUpMCwgxsmattP2jap00IoB0fxd0sUF1aUpysr/NICvirtOtdK4OVASRqmwttHIWHYPLr
	ueI2HxzkpHB9FoPQfPVuUKnmMgQOOfyTDo+RLRWB6KU+Cscf58vicH4Q2MBeKn9NMPpXri2hZTQ
	Ktg+QozExA+/ed7XR0tktcawerl186Kg2YCHLemQo4gifgH4BbyliR7Tadw1P4EdIByFPwj98HB
	Ux3hbhYxIsnnLJDWbSxdvvBvujT7fWgaSGu5+h/eanMOSIX+QwSZs0+BH9GcycsCYx4O/ReGdGt
	3WtWMvFHkJWMCYKU7j/cU=
X-Received: by 2002:a5d:5886:0:b0:435:92c6:d556 with SMTP id ffacd0b85a97d-4396ffc46bfmr17665504f8f.16.1771864005236;
        Mon, 23 Feb 2026 08:26:45 -0800 (PST)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970d5463dsm19120357f8f.34.2026.02.23.08.26.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 08:26:44 -0800 (PST)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org
Subject: [PATCH v3 5/6] drm/mediatek: dsi: Add compatible for mt8167-dsi
Date: Mon, 23 Feb 2026 16:22:49 +0000
Message-ID: <2fbf179c03c61f527e2583f9df4f97f6aaf3297a.1771863641.git.l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1771863641.git.l.scorcia@gmail.com>
References: <cover.1771863641.git.l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_162647_694699_095B1CF5 
X-CRM114-Status: GOOD (  10.19  )
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

The mt8167 DSI controller is fully compatible with the one found in
mt2701. Device tree documentation is already present upstream.

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
 drivers/gpu/drm/mediatek/mtk_dsi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index af4871de9e4c..ad10e86b161d 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -1301,6 +1301,7 @@ static const struct mtk_dsi_driver_data mt8188_dsi_driver_data = {
 
 static const struct of_device_id mtk_dsi_of_match[] = {
 	{ .compatible = "mediatek,mt2701-dsi", .data = &mt2701_dsi_driver_data },
+	{ .compatible = "mediatek,mt8167-dsi", .data = &mt2701_dsi_driver_data },
 	{ .compatible = "mediatek,mt8173-dsi", .data = &mt8173_dsi_driver_data },
 	{ .compatible = "mediatek,mt8183-dsi", .data = &mt8183_dsi_driver_data },
 	{ .compatible = "mediatek,mt8186-dsi", .data = &mt8186_dsi_driver_data },
-- 
2.43.0


