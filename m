Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4799CC44500
	for <linux-mediatek@archiver.kernel.org>; Sat,  4 Jul 2026 17:44:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=z6ud/EPfqlMZplwdn/5Y4rUm6oDx99RAJ6/NlqJ75W8=; b=N01rpWBtgO5QPrC/noZIhWJqhh
	ow5ii4GbjVOzYgFr07/HGExpJRmqtSRJurvpydybNJ8oIGFeb6hk9ZGL+x3tP145FtWeOl3clsOox
	xoXoOy45TzaoT0jhzCWACkyo9aZ0PGTjSDfi6JPdCdsdDmg8PhGHsRzalNr2KyF9zydouOUMHj1Mj
	jaLoOPgFK41vaI6SMVqz8s2dELUWZ7Angna92FTohmYB3CcF3EJphQ/5gLbbYWD8qIUB4cw2lklTG
	bOtdaArouwQQTPQR7iV2AAidKiqTYksl7GbKlUpkDdDMKeFyL6o9iMFURbxxGJ7lXJtdLN8sYNont
	G1/YAz0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wg4Ps-00000008dXn-1E1C;
	Sat, 04 Jul 2026 17:44:36 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wg4Pq-00000008dX5-1mdH
	for linux-mediatek@lists.infradead.org;
	Sat, 04 Jul 2026 17:44:35 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2c7cfa17fedso15603935ad.3
        for <linux-mediatek@lists.infradead.org>; Sat, 04 Jul 2026 10:44:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783187073; x=1783791873; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=z6ud/EPfqlMZplwdn/5Y4rUm6oDx99RAJ6/NlqJ75W8=;
        b=pqofVxZ/LJlY27y5Unh9TBcquDA6Z/cmqDuD4LKO3YZ/qgVeQcs1rRgwtuF/zU+mzv
         XR21dxtp/r17fq4cI28Qsps3u1gGnmKqyLpaSBCzDriBJeX+cXIBLrNqCC4JggbCMt3R
         JSbDvwHnxP2lAdiMXpjXclCzh681jZRTAIU8AkAOk38C88n6poxYWs8snaRNFWiFhJ+T
         L9Ge2spmkpMcyOntr1T/dqh5tD+PcujlBLU2XZarvwaXUbjMGbBjc5ZyX9/qXCaPk8w6
         Ug4Gq32c5MfKcLhgcU/AGuwgwDoHYiNz7IqKIKaH6s0aElQpv8tuODNvSP5OG/O/FOCr
         7dEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783187073; x=1783791873;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z6ud/EPfqlMZplwdn/5Y4rUm6oDx99RAJ6/NlqJ75W8=;
        b=qcMHzmkmGHn+97sT+qE2VP0yfJtV3Q37VciW9MAq8bLkIgnZA5XPlZAUiNVO5BO03q
         QNwkLzFXCzLwElHbi2fX1+q/3gbcZ125xAESUqRCFHS0VpsxEyj5ubRAzuOuGYHfeA7P
         9sO4BHnIJnRoC7Cir8kALiNdC0t/VPsjkq/FbRdewkZ6Xlic5aqzwy1DJbZBKqnrPrE9
         cViwIwxyDqkpMG9dRyoYRyslIevXDf91WAUivVz2GHhzi5XHq0RlvuorllR84ZMjgREO
         +oSvnQmVYFzFBj/n/Otcvtu5ZHt5XmW8XJkBI5Iv39PwpVKg9dSzlTcgQs1cPsWhXvCq
         9xGg==
X-Forwarded-Encrypted: i=1; AHgh+RqhDW6wE6OuCIH9PbYvP5P1ePNgGcVJIkMz0adJ5Zk5CaOmkkybgwU3ZB2g8rcrrpSwsKvGlbJQBLgxK+feYA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxzlQmNJ63anfWUU0h6copJl/IfZOaB7dnLb6U23Oj2eXRHhWCU
	M1/9ZAZZNyhJaLhJJk//AK3DgX5lk5uxYizDJhwZCygB8MpwiqFLFXEW
X-Gm-Gg: AfdE7ckSMtZ/Xl/3cvPwwbnhzfGUKZ4uxv2e8KfqTwGM4kNmi6d1buYoZoWrS7B6frj
	X6p/x0wzdhch5yhfZ5AuOE0VRx3pY/LPCsKQ1KXqHHsK9M4t8LwjMYtXo8D4KOWGalEPQMdmWw9
	qVlennzLUdp1YRrspSXBI8ItuXq33GDk3qolWGfh1ykvW6e08zvT4XSyxD4i3WRs2GC4p3ycriq
	pxmv1UpDvoWgIQh1XZYzplGv3ANkp0QZZw6gL3hbSFVYHe/pq0fukj+57uNRnHIUr999LYfT7vd
	5z2Sm2zplH4gCsST/nwDJ/ytPg8qP/c5A9l7saoLOj84FppRpL7HH06ibdcmMgoeQHKJW0NCmKh
	MZspuACnTPVZ35kvte4GqeD53DcB1CZDVQv6ScacE8FKGwvsohN9v7garhq6PIsyTW8u2Z7k=
X-Received: by 2002:a17:903:32cb:b0:2c9:b01a:fbd4 with SMTP id d9443c01a7336-2cbb7511bd4mr37563465ad.16.1783187073499;
        Sat, 04 Jul 2026 10:44:33 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1000::f280])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cad78a3e76sm24836105ad.82.2026.07.04.10.44.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jul 2026 10:44:33 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Johan Hovold <johan@kernel.org>,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>
Subject: [PATCH] drm/mediatek: mtk_hdmi: Fix DDC adapter double put in v2
Date: Sun,  5 Jul 2026 01:41:13 +0800
Message-ID: <20260704174113.255485-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260704_104434_517031_EFDD3811 
X-CRM114-Status: GOOD (  10.52  )
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

mtk_hdmi_common_probe() gets the DDC adapter with
of_find_i2c_adapter_by_node() and registers a devm action to release the
adapter device reference with put_device().

The HDMI v2 remove callback also calls i2c_put_adapter() on the same DDC
adapter. This is not paired with the find helper and it drops the adapter
device reference before the devm action drops it again.

Remove the extra i2c_put_adapter() call from the HDMI v2 remove callback
and let the common devm action release the adapter device reference.

Fixes: 9545bae5c8ac ("drm/mediatek: mtk_hdmi: Fix probe device leaks")
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/gpu/drm/mediatek/mtk_hdmi_v2.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi_v2.c b/drivers/gpu/drm/mediatek/mtk_hdmi_v2.c
index 7bbf463056c9..e668506daf67 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi_v2.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi_v2.c
@@ -1501,9 +1501,6 @@ static int mtk_hdmi_v2_probe(struct platform_device *pdev)
 
 static void mtk_hdmi_v2_remove(struct platform_device *pdev)
 {
-	struct mtk_hdmi *hdmi = platform_get_drvdata(pdev);
-
-	i2c_put_adapter(hdmi->ddc_adpt);
 }
 
 static const struct of_device_id mtk_drm_hdmi_v2_of_ids[] = {
-- 
2.43.0


