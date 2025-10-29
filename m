Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C36D4CCD1BF
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Oct 2025 07:23:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=w7WzjBbcIkMp9vE4EpjCxo/Q8IBE8WxTrpS4XkHUl5o=; b=JiXqqVfSqScxgWtVDfNnUuyRKT
	IXRMXJZ6Rykv4q64q8kNrXgBHlBdkg3Kobs3xLbceKLTENwpehIZtly+WUbMoEEHqmRTFAAEcwmLb
	rNPiQn0oTeq2lEi3pqh1ahursjv0vB8T/4E0bihJD6fQZdjd9ChbwOppQ959eH7VfUsMdQVb12BHg
	pdvgb5rn4qeN6uWeQR+1oX78OSbz9PuZSWEYdMGYGSBlD5z5X/PjcJuqyE1qcVJTB0ZtnX92rAsHo
	sU160cCOZhicU6GZ+UbccKQjQ/TCz0IBeTG0ociLmCPAv8p75D9M6doRsWrsm2KkpUmo+uMiMsL7K
	dmQ5I9WA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE0Wm-0000000052L-1q8v;
	Wed, 29 Oct 2025 07:23:28 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE0Wj-0000000050h-0Hx4
	for linux-mediatek@lists.infradead.org;
	Wed, 29 Oct 2025 07:23:26 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-7a27ab05a2dso5983267b3a.2
        for <linux-mediatek@lists.infradead.org>; Wed, 29 Oct 2025 00:23:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761722604; x=1762327404; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=w7WzjBbcIkMp9vE4EpjCxo/Q8IBE8WxTrpS4XkHUl5o=;
        b=D9JwBumHmP+uXHswieDa6HDMsC6YKmkBH13GDgXwdQG/pc9vJx3eY3DPAnXVNLX3KL
         z0h66BdnpqI/VSf3iOwQ0HMaRTkwV3frvm/6GpOefNHO016YW5RAnTOADLjmIItHJrgL
         ydQ5I9w/N6fqy7MdEVy0TDyAMfbTQuqn5cm/YLH1fVfQdYX/3sswCfybPdEfI689sEKE
         846fOBYByNxKyp7Y24guWVQ3F5u8LDQDR3tnAvx97H5QQWWpqodA+5+iD6C4wXV53Q8R
         yKaYHwaX4RPGPR9DztmxebymYc8RO+ARI2pDb+1Ck+2ARqKUlu80o/p9luA6nqHCHO/+
         O0qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761722604; x=1762327404;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w7WzjBbcIkMp9vE4EpjCxo/Q8IBE8WxTrpS4XkHUl5o=;
        b=Ptu/fa0MXs5/VUR8xm0NjZz8z9IpZQNfWGh1WTK8iiTXNeI1UmcBKJk/c4dVnzbNI9
         d/OX0zLkrxgqY/37xSa9j6l2/mEG2sGglW9E/U2T+wdX/BiWNFL64dpqcoxLs4Q742Wc
         oBprHmdKooIn/1dlITorWt0BKsVViJsIw1CiDR9hMMZilR/vDDb1k/eNgH7KvClL5blD
         42UA32AK4agtuQ+EJcQYdgqBsFUUpmKAf7oZoJIoSoxlWRilsNqYYuUUSOQPYEM2kszX
         60jzakqCHpyOvo6vzCsSs6sLmQHaWgWV/X8ijyUr3Pq9fmJD4ca4Mg2XDDg4OSrQ7bZ8
         g3ew==
X-Forwarded-Encrypted: i=1; AJvYcCU/XXBwBxnLT2rsAaUn/UGcNYCxapS6vytXxErfYjXSwYiLDawyN/xSk5rAvwfk1F/iIGSu+lEli/0Rd4wv3w==@lists.infradead.org
X-Gm-Message-State: AOJu0YyEjQKn1R06RbozGGfRzN2fJtA9sY7u2gPYZXqcra64yhGFESld
	HEqDrnXz2hx/TKosE5R0I45FKawqPkp0GUJH23FU4dmy25zVmT94Q+DP
X-Gm-Gg: ASbGncv4zX5RXSXSNrWzqIoiVmUkh0+DXVnxXGltAoKl2zJVAJuSpR3WxKgj3kBvCz7
	LscnAJ93tdi+5Wbs0tZVcwpyrMBY1uHfb7fH7DJ9+ZfAObUiPg8vFPthMlNPEwPb45eu6dlXpMG
	6rXyncL+10Q1rVVEierwlS8MKF/IvZOlNbyLll6b6l6hMjlkOcITD6q/zuET3bdT7caIysa4GHo
	24NWbTUVyCwZqH3zoltuESe7amZo34PD4qkFR0PeA1iJhK1WWEa+KQJvCbtloceJyCQl2p9HXuK
	P4MGe5dApr3w4WQimxOU5ptt/XhJESsNcDiHv70TZpSEadHG1ohF3Ume5jy9MJS1HFpnQnJ2ulp
	erpkfioAYDiE4z/WHOwIZp3ZZS6rbjApeJqYVK6IID/olWuz4y869bp2DSlKHw1yx4Z1nB3Gz7W
	8/2u7c2SdF0SE+SLR6nVIueg==
X-Google-Smtp-Source: AGHT+IFyoTqxEaHdHcYwG2j5PoXFVoRtIyJkYmXJKSPfYslsy5ZMiSdta/UGyBhYN4fJfCWD+fCbVA==
X-Received: by 2002:a05:6300:218c:b0:341:6c8a:5218 with SMTP id adf61e73a8af0-34655401460mr2197446637.56.1761722603774;
        Wed, 29 Oct 2025 00:23:23 -0700 (PDT)
Received: from localhost.localdomain ([124.77.218.104])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-b71268bdb2dsm13021005a12.5.2025.10.29.00.23.20
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 29 Oct 2025 00:23:23 -0700 (PDT)
From: Miaoqian Lin <linmq006@gmail.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Markus Schneider-Pargmann <msp@baylibre.com>,
	CK Hu <ck.hu@mediatek.com>,
	Dmitry Osipenko <dmitry.osipenko@collabora.com>,
	Guillaume Ranquet <granquet@baylibre.com>,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: linmq006@gmail.com,
	stable@vger.kernel.org
Subject: [PATCH] drm/mediatek: Fix device node reference leak in mtk_dp_dt_parse()
Date: Wed, 29 Oct 2025 15:23:06 +0800
Message-Id: <20251029072307.10955-1-linmq006@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_002325_107626_AE536D97 
X-CRM114-Status: GOOD (  10.42  )
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

The function mtk_dp_dt_parse() calls of_graph_get_endpoint_by_regs()
to get the endpoint device node, but fails to call of_node_put() to release
the reference when the function returns. This results in a device node
reference leak.

Fix this by adding the missing of_node_put() call before returning from
the function.

Found via static analysis and code review.

Fixes: f70ac097a2cf ("drm/mediatek: Add MT8195 Embedded DisplayPort driver")
Cc: stable@vger.kernel.org
Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
---
 drivers/gpu/drm/mediatek/mtk_dp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek/mtk_dp.c
index bef6eeb30d3e..b0b1e158600f 100644
--- a/drivers/gpu/drm/mediatek/mtk_dp.c
+++ b/drivers/gpu/drm/mediatek/mtk_dp.c
@@ -2087,6 +2087,7 @@ static int mtk_dp_dt_parse(struct mtk_dp *mtk_dp,
 	endpoint = of_graph_get_endpoint_by_regs(pdev->dev.of_node, 1, -1);
 	len = of_property_count_elems_of_size(endpoint,
 					      "data-lanes", sizeof(u32));
+	of_node_put(endpoint);
 	if (len < 0 || len > 4 || len == 3) {
 		dev_err(dev, "invalid data lane size: %d\n", len);
 		return -EINVAL;
-- 
2.39.5 (Apple Git-154)


