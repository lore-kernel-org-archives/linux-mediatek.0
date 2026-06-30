Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF490C43458
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Jun 2026 11:08:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6bh4jBEphMG7ihkZ16kaaoOAnDIWxUT6Wo00wnq5q+E=; b=IRFV0gi6QokqCq9b9kHx65SWyn
	6EBXCx7Aqu7uu06BvGZiru3zCDGWbZCTY2BVllyDbAGZMDzAbhNus+YbsGrOxyhOwmf6ORsZ1tKBm
	6KbE41NaAvTpLsSKO6C7RkiXQD5hIGbD5vKp9lZV8ERtj1IWKMfVlrYHxlcyZX3BplU1f8Gs15Q8g
	o2eb2RddIxBoMSiwMq9AjOvsXMyg6hDRUmUc2WhfmWVhynlD76kAIzIB9jH99AgxbOFPl1ki4O/m8
	YD83QxHMT/jA9D+63cOBM2HpG+wwDLdrIGAwB3V2ngEj31iGrbHMC9sc8j95jzqh1KebdH8YeZsFJ
	1Uv1T9gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weWKK-0000000GnXH-44Wc;
	Tue, 30 Jun 2026 11:08:28 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weWKI-0000000GnW2-0ogt
	for linux-mediatek@lists.infradead.org;
	Tue, 30 Jun 2026 11:08:27 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-37f816d01e3so3003430a91.2
        for <linux-mediatek@lists.infradead.org>; Tue, 30 Jun 2026 04:08:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782817705; x=1783422505; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6bh4jBEphMG7ihkZ16kaaoOAnDIWxUT6Wo00wnq5q+E=;
        b=ohdN5ItcHvxSc5IcUajxcN7Myrotg/sPPJVgt5lTDMXBNY6DoI2ZfOnxucGsx/4dfE
         unAZLWgC18zSUKk9Adv5yYCgQX7Ftaa21yD+vaPZoYdoj4zJpm8FCVfxECWpC38XC8XO
         YVLglrdDnTiLSA7R5LsrH9BHag79KbQLtew6cmWtYPYj7ta6Vzbflj/wWQI79H3pNeKa
         LbJfs5S4pnCq80RDRRTB/vX1E+UfQNRplA7sndp1u6eI34fXNIzwVfyZKXrFNuEhyK2a
         aDbzG4M+P0Rfrny/RjgXrDTMSwiCXgaLg3+tU4wLtA4vorZtpXgT9BvzVyH+UrZ1IoIr
         2vMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782817705; x=1783422505;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6bh4jBEphMG7ihkZ16kaaoOAnDIWxUT6Wo00wnq5q+E=;
        b=U3wWmI0+emsLIhouL9zhuvzfpqlzeFn5Av/KCzL7IJYiXv8eF4ocWJZfr5UpZtXmVd
         0BqbVFL7OfqtF9KHwWbeQkjLGrsNcOxOi0cuBKzVk4T4VnY9yLuIah+x4Svd6qLfreYi
         9W4NW5jOYPIHMYsulTwL/hF0fagy3rUluF5MbCcLyQvuhK1pixs1i2zq+ErJx29ZBOCw
         TzzadNesH/ivXUfHkBqftoEGuWCn044zBFCT0W4fUuNvpwtdEGcDyMkG7vArVuTWGeNb
         HgMuc2rK6v+ifxccD6pMJ6PtaysNWnmKJQYj/1fzpaB/ctGL9bDa4ShvlqVU371VuU98
         ElLg==
X-Forwarded-Encrypted: i=1; AHgh+RqDpQlVwZdMzk/Mm32Qp616cYvatmZbk/sLB1gOym6UCG9GGu7AdWGiA9yvuswGqAuNNZYPS0QsLvX+XbB4MQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyX+QVrq6D/lieQ60vtbRAbWwz/4Dj2oro83UDqAGDWtkC3ARco
	M7AOfxUjWfCRHZoFXUjJXxGHFIFyK5DHAwMHpzIDjqCusj45FF/N2HMB
X-Gm-Gg: AfdE7ckyDdYPAGet/GpbWmMKXK+H4WIAZgbBH/MkXfPUqpYfWFy+1iNClDw17C2rCGQ
	9KzW/gE0die6Xrmve0xmJuBd/efQkxTu9UNKsZxSLWVi2U0lzaMMPjQ0EN79M9wkzwNoZld0XjH
	ARTa7UOMa+hl2WBnWYZhzu8AkTQHN4S9PTrDl8GKIq6mCxtnTLrXEMS78biR3BM6dC1YnQOzDAr
	FkQkwoaU5c1bbAK6bAKPQZYiMT4AVonJAPemrKscWa84kI7PZ9POMvneekdkbnsYK3QG3AEgeKf
	iXjeLfqiCeaSOzU7/uxwqOAvRHhtp5kNNZjJGFsqT1yosOvf5q/ich0YLvokDPNkLx27tGqqK20
	/MAQhTaUP1mclrCnUJHT+GvsVllew9hwsjVhWLm03atVgAbi9jVtyeDjuFTGqnP9CQvh0qL7eKi
	n1n9+qGwozzjynlQ26qPXgkciP4b13lACe5ArNEp5JM+hnUpk4x3WusShdOA==
X-Received: by 2002:a17:90b:3bc7:b0:37c:6505:e7c3 with SMTP id 98e67ed59e1d1-3805273970amr2295663a91.22.1782817705202;
        Tue, 30 Jun 2026 04:08:25 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-380532b020fsm1501738a91.1.2026.06.30.04.08.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 04:08:24 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Stefan Roese <sr@denx.de>,
	Andi Shyti <andi.shyti@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH] i2c: mt7621: Use dev_err_probe() for clock acquisition failures
Date: Tue, 30 Jun 2026 18:08:09 +0700
Message-ID: <20260630110809.559134-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_040826_236844_87F6A494 
X-CRM114-Status: UNSURE (   9.28  )
X-CRM114-Notice: Please train this message.
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

From: bui duc phuc <phucduc.bui@gmail.com>

Use dev_err_probe() when devm_clk_get_enabled() fails. This correctly
handles -EPROBE_DEFER while simplifying the error handling.

No functional change intended.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 drivers/i2c/busses/i2c-mt7621.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-mt7621.c b/drivers/i2c/busses/i2c-mt7621.c
index 0a288c998419..8b0407d70c4c 100644
--- a/drivers/i2c/busses/i2c-mt7621.c
+++ b/drivers/i2c/busses/i2c-mt7621.c
@@ -280,10 +280,8 @@ static int mtk_i2c_probe(struct platform_device *pdev)
 		return PTR_ERR(i2c->base);
 
 	i2c->clk = devm_clk_get_enabled(&pdev->dev, NULL);
-	if (IS_ERR(i2c->clk)) {
-		dev_err(&pdev->dev, "Failed to enable clock\n");
-		return PTR_ERR(i2c->clk);
-	}
+	if (IS_ERR(i2c->clk))
+		dev_err_probe(&pdev->dev, PTR_ERR(i2c->clk), "Failed to enable clock\n");
 
 	i2c->dev = &pdev->dev;
 
-- 
2.43.0


