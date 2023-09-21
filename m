Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F9FDE7D0A7
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Sep 2023 19:28:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qhFda07Eo+JhAQAACXr7n7to50ItTosGgo10Du+RGvo=; b=cVQcXfKAVBORpS
	X2FfUzeXN1/L5QYzjdKVvi9FiR3IvqbDhaXJJOuCeYIF7Kx+UhOnIa1S0YU/Yr+3iDggbA233Njbq
	4SJjMsmhLSJ6lAVHJJY3aSfd+QuT/SABshvYfqZban2qzugwzdRdCTCrakZBfo4qd5EBydAWG/3uW
	B+TMgU9d1UQxF2G1gPqjyUALBWTb3IMKMhFkNqt9HFujiTx/cTeoCdLbGjG72SFOQd1z5ag6s+URB
	y5rVYUqPNas777qAkIi+7WuamkrRrfhp2HqU+rEjO3t9hpSuQkDI5QGRDM6ZSUbzBLda4J+qR8e7R
	xnbqISto9PkNRQqOleoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjPLi-006y3b-0q;
	Thu, 21 Sep 2023 19:28:30 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjPLe-006y0t-00
	for linux-mediatek@lists.infradead.org;
	Thu, 21 Sep 2023 19:28:27 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-1c453379020so11153615ad.1
        for <linux-mediatek@lists.infradead.org>; Thu, 21 Sep 2023 12:28:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1695324503; x=1695929303; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qhFda07Eo+JhAQAACXr7n7to50ItTosGgo10Du+RGvo=;
        b=jSvVrEbQvvc678lzm4VNLfrOdKsvMPspuFMbY160F8IZNajO66HsWHb4SXofOVXlch
         14vIJtWs51yorlPhMCOIysmZY2DgpA3VABmhH7PC69DF/m/q+SfbVRhiHEt1P32mJK7p
         41FD+sKYZwARSxNO9eAptmfLKIGTxhwPw+nXE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695324503; x=1695929303;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qhFda07Eo+JhAQAACXr7n7to50ItTosGgo10Du+RGvo=;
        b=LQbgNNxn9HhBD5W/pWVVFMpye0oLF+yFvpW4GXR2sWNVRQTG4k5wrGFvesmHXepujQ
         GrrB60HK3QFTSIc1lIYlnPNlWtIICZ8HY2uWbqnjPd3AYob7scapbDBMrssJGRo0OQkT
         wlB+KNGKCthjExBYkvUwyh9FvKyEYdcq1xCuyERBfI3UxtjP/k77MKliXK5FHSePovb7
         12pXikvVkqipZtcSrQ22AkQ7rj1jS1+3jFZU83jrHrN/jtgdFrH3yEOI74BNJadfn7Nj
         02BLqOAfKi0bCSaxgp9w48X6P1n66oIpnAx33WAN2/19jCjgzBtFE0luAV+lt7zBnz25
         LqIg==
X-Gm-Message-State: AOJu0YzTGOPEtD5kZqEFUKHSP7k6uVuNXJ+8iEUzr18P7uM9C+SwW4XD
	4g3nd0zG44VglY4B2T2/5s4upg==
X-Google-Smtp-Source: AGHT+IH0nh1V6SVusdyeEYE29qugLYksEX+ehkYFjSjdH7aYyfOGlzf+vImX/ZKutU0AaIJ59ga9tA==
X-Received: by 2002:a17:902:f80a:b0:1c5:deaa:d72e with SMTP id ix10-20020a170902f80a00b001c5deaad72emr1042601plb.30.1695324503552;
        Thu, 21 Sep 2023 12:28:23 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:9d:2:e6ed:6d49:f262:8041])
        by smtp.gmail.com with ESMTPSA id w8-20020a1709029a8800b001b9f032bb3dsm1892875plp.3.2023.09.21.12.28.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Sep 2023 12:28:22 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org,
	Maxime Ripard <mripard@kernel.org>
Subject: [RFT PATCH v2 03/12] drm/mediatek: Call drm_atomic_helper_shutdown() at shutdown time
Date: Thu, 21 Sep 2023 12:26:46 -0700
Message-ID: <20230921122641.RFT.v2.3.I2b014f90afc4729b6ecc7b5ddd1f6dedcea4625b@changeid>
X-Mailer: git-send-email 2.42.0.515.g380fc7ccd1-goog
In-Reply-To: <20230921192749.1542462-1-dianders@chromium.org>
References: <20230921192749.1542462-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230921_122826_041406_18A227C2 
X-CRM114-Status: GOOD (  18.75  )
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
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, Douglas Anderson <dianders@chromium.org>, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, daniel@ffwll.ch, matthias.bgg@gmail.com, airlied@gmail.com, linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Based on grepping through the source code this driver appears to be
missing a call to drm_atomic_helper_shutdown() at system shutdown
time. Among other things, this means that if a panel is in use that it
won't be cleanly powered off at system shutdown time.

The fact that we should call drm_atomic_helper_shutdown() in the case
of OS shutdown/restart comes straight out of the kernel doc "driver
instance overview" in drm_drv.c.

This driver users the component model and shutdown happens in the base
driver. The "drvdata" for this driver will always be valid if
shutdown() is called and we know that if the "drm" pointer in our
private data is non-NULL then we need to call
drm_atomic_helper_shutdown(). Technically with a previous patch,
("drm/atomic-helper: drm_atomic_helper_shutdown(NULL) should be a
noop"), we don't actually need to check to see if our "drm" pointer is
NULL before calling drm_atomic_helper_shutdown(). We'll leave the "if"
test in, though, so that this patch can land without any
dependencies. It could potentially be removed later.

Suggested-by: Maxime Ripard <mripard@kernel.org>
Reviewed-by: Maxime Ripard <mripard@kernel.org>
Reviewed-by: Fei Shao <fshao@chromium.org>
Tested-by: Fei Shao <fshao@chromium.org>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v2:
- Rebased and resolved conflicts.

 drivers/gpu/drm/mediatek/mtk_drm_drv.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index d16cc8219105..6bab360c0c1a 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -919,6 +919,14 @@ static void mtk_drm_remove(struct platform_device *pdev)
 		of_node_put(private->comp_node[i]);
 }
 
+static void mtk_drm_shutdown(struct platform_device *pdev)
+{
+	struct mtk_drm_private *private = platform_get_drvdata(pdev);
+
+	if (private->drm)
+		drm_atomic_helper_shutdown(private->drm);
+}
+
 static int mtk_drm_sys_prepare(struct device *dev)
 {
 	struct mtk_drm_private *private = dev_get_drvdata(dev);
@@ -950,6 +958,7 @@ static const struct dev_pm_ops mtk_drm_pm_ops = {
 static struct platform_driver mtk_drm_platform_driver = {
 	.probe	= mtk_drm_probe,
 	.remove_new = mtk_drm_remove,
+	.shutdown = mtk_drm_shutdown,
 	.driver	= {
 		.name	= "mediatek-drm",
 		.pm     = &mtk_drm_pm_ops,
-- 
2.42.0.515.g380fc7ccd1-goog


