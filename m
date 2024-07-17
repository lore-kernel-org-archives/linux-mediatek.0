Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D043CC3DA4B
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Jul 2024 11:59:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=kcTlzdSbCPYBa7vAri6YqB9ZoXDHn//E8DaLgVTWQzY=; b=ytHdKr/0o/OZim
	yHh5c4AOhrYJQ4Qe9uEzmTG7ThQYDJkr+lVbdmsRu2v4C4YymW6sTkul/ipNocjy7U8Ijt39VHM+Q
	X884jmZe7tJ3rsLXz/wE+XgJckYwLuiO4fEcM+6MAc+00JE5SlCj1hw7hdHLUnjDD3RhqI0HLTsa8
	X7ZsMhEZWPEID9uwUXL/K/wyqcqJ4FfO2EmbCfjzwS87FKptMNmPn9NZnloGMfCpvUPYx9OH2ecLi
	/lsv9tuPs9jOXq6ndtKCA/SweK3fUcOnkXvLwKm+OLuSdZLqBbtRGBTnr8XZOhrEKeHmZOf2b6xM5
	Ko+J9P4FEeou4pVemulw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sU3Jh-0000000Dgxm-3mvX;
	Wed, 17 Jul 2024 11:59:29 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sU3Jf-0000000Dgws-0pOL
	for linux-mediatek@lists.infradead.org;
	Wed, 17 Jul 2024 11:59:29 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-2cb4c4de4cbso456432a91.1
        for <linux-mediatek@lists.infradead.org>; Wed, 17 Jul 2024 04:59:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1721217565; x=1721822365; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kcTlzdSbCPYBa7vAri6YqB9ZoXDHn//E8DaLgVTWQzY=;
        b=nnRvwnNwpgLKPTQPNYeyUw0U63c8xYYumhdIkejd6ycTuud6LIURmKpAk7ROfbG257
         YKe8oNA/hjOFd8+XDsJtHs6jdoknp9guPT9w9bLMNTp0UbyNxIWwhfE916D1Aewz5o/S
         aI8U+QXLQUULV5s6ZjxCPGvBnndLeqFh3dyek=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721217565; x=1721822365;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kcTlzdSbCPYBa7vAri6YqB9ZoXDHn//E8DaLgVTWQzY=;
        b=WkCuKUNiNbXA3mHV3y+gDVfF1Gui3zR8prNagpMZ93GSquIR+g1M0c5RxZHDeVRAti
         veUL7gE3SXaDzlt8aDMXUGO9i7k/Hj4+CXsPgAQa416+4e3znk+Iy3SfgSJV1RnuxRtH
         jY4iL6mwSsTBPZh9/Op7h9lxD2MwXnYTTHFkg9vmOC5+ZN5dcAbnRhNGrohVhlEhxiv9
         bquJ13URrDMJOD2Uu/EaXt9XgEqP6xwcklnt4OIHpAtJGbDe21jZQD34yigPBiFsqUDb
         Y/56VaVpZdOrJjZcX97niYX9pGpN8I7aJouy657Zazgv5vw+mMhhQwwnfd2hKE/VxOhu
         c2hw==
X-Forwarded-Encrypted: i=1; AJvYcCUh/cdUp3C3/BqAPJCWZIPc8qPteBd0mVFhvgtt7CoLZ4teuiHIbZruWRF8MfofleMlAulBPmxze8QRXzVFzKUWP1wUprEv2wxcg5supzePqujH
X-Gm-Message-State: AOJu0YxO//v+rwDAk3YJ6sboS7su6PGIjdrGCs1KmSzwb0IV/u2QHTQ/
	0LPZlygcrpKREQxg8vlsI0r+E9nMCUV7V7vBSQLMyDy1JG61iTOqW0/qH5BRrQ==
X-Google-Smtp-Source: AGHT+IE8xpZ5IZDUMHdNrgUQW2/WR8g1HkPeRhtTiLALcp2Xt/UQv21YSG9GEN31UQfbsAOI8lOinw==
X-Received: by 2002:a17:90a:c7d1:b0:2cb:5654:8367 with SMTP id 98e67ed59e1d1-2cb56548442mr722546a91.26.1721217565184;
        Wed, 17 Jul 2024 04:59:25 -0700 (PDT)
Received: from fshao-p620.tpe.corp.google.com ([2401:fa00:1:10:97dd:ecf:8796:54cd])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2cacd41a01asm10006858a91.32.2024.07.17.04.59.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jul 2024 04:59:24 -0700 (PDT)
From: Fei Shao <fshao@chromium.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Stephen Boyd <sboyd@kernel.org>
Subject: [PATCH] clk: mediatek: reset: Return regmap's error code
Date: Wed, 17 Jul 2024 19:58:52 +0800
Message-ID: <20240717115919.975474-1-fshao@chromium.org>
X-Mailer: git-send-email 2.45.2.993.g49e7a77208-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240717_045927_269286_9FB43E1A 
X-CRM114-Status: GOOD (  10.33  )
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
Cc: Michael Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

device_node_to_regmap() can return different errors, and it's better
practice to pass them to callers.

Clean up the hardcoded -EINVAL and use PTR_ERR(regmap) instead.

Signed-off-by: Fei Shao <fshao@chromium.org>
---

 drivers/clk/mediatek/reset.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/mediatek/reset.c b/drivers/clk/mediatek/reset.c
index 290ceda84ce4..f8c0fd031512 100644
--- a/drivers/clk/mediatek/reset.c
+++ b/drivers/clk/mediatek/reset.c
@@ -138,7 +138,7 @@ int mtk_register_reset_controller(struct device_node *np,
 	regmap = device_node_to_regmap(np);
 	if (IS_ERR(regmap)) {
 		pr_err("Cannot find regmap for %pOF: %pe\n", np, regmap);
-		return -EINVAL;
+		return PTR_ERR(regmap);
 	}
 
 	data = kzalloc(sizeof(*data), GFP_KERNEL);
@@ -198,7 +198,7 @@ int mtk_register_reset_controller_with_dev(struct device *dev,
 	regmap = device_node_to_regmap(np);
 	if (IS_ERR(regmap)) {
 		dev_err(dev, "Cannot find regmap %pe\n", regmap);
-		return -EINVAL;
+		return PTR_ERR(regmap);
 	}
 
 	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
-- 
2.45.2.993.g49e7a77208-goog


