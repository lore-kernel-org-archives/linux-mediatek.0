Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7909D1093180
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Mar 2026 07:23:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DNOjcTvj4j7Sb7uRKbeUh7QO1/N1P457msM++fZ/8k0=; b=xTMy2VF1G2siKeuEqKknJ7sV7Y
	AJlTt1biHAxNlYBeGn4ppWe2Qe/V76CmmHWYsrTCc8ggQ1snL5WZvisC3L3YNaaPNpckDl1Yfgg1Y
	F3FdVRd0qXqqVAfBZmFmKKljg71odMnWlrKPv/U6IEb7T6itkpDj+j3X9qAgfF4K70kxTM0+zTgLg
	OHevve7PS+p2AdQNTl2nwsAALOXlOPEdG+f8lrcuGCm+mg6nTRgBlm8s1O+espmgvN+PFSYNn2FTc
	blyrwlnr0zLx7tV4v7xRSxWsVyWw9pFe02axqmWW2RUHcXTmsnRdj2naJvQk1XdqXZzTa8NJy5HyG
	Qb68jWWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3UCX-0000000CF31-3h8N;
	Fri, 20 Mar 2026 07:23:21 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3UCU-0000000CEzO-1xfd
	for linux-mediatek@lists.infradead.org;
	Fri, 20 Mar 2026 07:23:20 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-3567e2b4159so1164492a91.0
        for <linux-mediatek@lists.infradead.org>; Fri, 20 Mar 2026 00:23:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1773991397; x=1774596197; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DNOjcTvj4j7Sb7uRKbeUh7QO1/N1P457msM++fZ/8k0=;
        b=L41PKltFpcp6w/8ll3nRf7x/N74YliTtz9L1rZEHERkbICDZOKf/ZrCtq/kapLcCoB
         t23lpqVIFtG4gn9LaTKyz3LsT9ixqspfZaQsBto74ELbDb+XaKhN939ehx3rzd6zmoD6
         Nmrlm7Qri0WPn32kWcF1tHtXB2ysCjFuauEXQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773991397; x=1774596197;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DNOjcTvj4j7Sb7uRKbeUh7QO1/N1P457msM++fZ/8k0=;
        b=CG9vRysYRvlAc7rVyiukZ0pyhWqRsZqvr4hduxRz/U4VU6SpqLQQiZAwiyQGz/fy9Z
         6EvYYj6XjOyWPhfwPYEBWAZBWMnMjTfRGAdywTPzJihhJv/ZHigynkYbZJBazqjf9YDq
         R+XMSTfPBnogd2ttf6Sn1Y34PCrzBveq/2HhSEFcTO7XNyvsFKsfsUy6D6gaAk6UaDgA
         mHF1oTLgWzOcxcEKQgxL3/3RSFaXlRvpqdzRI1OSF1iHK0Y18guLI5ZNGxCEkkAJG0t/
         xCzxRrIPEqO5+GKazSH+wJi7wKIf3LiJnNUhrPT7A1nVzZAy9eTp2j/bc6gNCQcpO761
         WK+w==
X-Forwarded-Encrypted: i=1; AJvYcCXTXDceXjPasgbujn+YPBpwEZrLALnjJTZKPP9nkigq66DpmVh7u+KyGkrYW1q0r+a1M4lVFLxJClQ8pZgLWg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx3RL8KIaW8pw7RmMG6zhrwxm9HQZLjewplw4crWGkOB80pbgo8
	iXxzRtioyxNDN5oW4hO9Qb53rXB4aWoqKQZuuxIFJscKD1RBNrfdBLIDMcT9v4JDGQ==
X-Gm-Gg: ATEYQzwFYNLUPm8lboZqav35QzkITOKkzj+tZ1S6RX2nLThkiiZyW4jAkyNZJcTkneN
	DXLZLwIscwYTWnTs/oGZbYSnTG4QhFFmuFhcyyNlGVaoTD4Tc61xXjpXFt5pVJxvcooNU1MR1HG
	IhfZO9AK+BUblU22PXGI1RoW2jCgdiugA9gi0HEb454eYtmgo1lRd/L+SxPhP8s21kNToccC3UF
	GOfca02imCpFrKDDtMMt6i3yT9k2eJkCX/H6YL3l+M34xAopksquUO7/cMGKzZTAphc86APxqRJ
	4xAof1V8rFaqUzojaIHYsCRBH4WAUWAhMgGzEmU3HC9zIXK7qz5KLpD+6TIxqI+THtiL59QCN5B
	F8vcpYqD4R7O07/FAMGMUJzjZODgzy5StPHLypTDLx08a1LCTHMp4/4UV0zp4MQ/zCAJ+I9PmXa
	Otf408UNyHuk7zV0GZlsqph0IQIXlPJvh7a7BCx/QoAGUc84xjZA/fPmswT/QLjT/T+fBAtVi5e
	9KaamWL
X-Received: by 2002:a17:902:f709:b0:2b0:4eeb:f80a with SMTP id d9443c01a7336-2b082769c57mr17180045ad.29.1773991397165;
        Fri, 20 Mar 2026 00:23:17 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:9cdf:e932:6f2f:c654])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b083516b96sm16728365ad.7.2026.03.20.00.23.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 00:23:16 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [PATCH 2/2] regulator: mt6315: Add regulator supplies
Date: Fri, 20 Mar 2026 15:23:01 +0800
Message-ID: <20260320072302.2402489-3-wenst@chromium.org>
X-Mailer: git-send-email 2.53.0.959.g497ff81fa9-goog
In-Reply-To: <20260320072302.2402489-1-wenst@chromium.org>
References: <20260320072302.2402489-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_002318_524545_91AB9B5A 
X-CRM114-Status: GOOD (  11.41  )
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

The MT6315 family of PMICs has 4 buck regulators. Each regulator has a
separate supply.

Add these supplies to the driver.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/regulator/mt6315-regulator.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/regulator/mt6315-regulator.c b/drivers/regulator/mt6315-regulator.c
index d3f93aae0fc5..231e64fb0596 100644
--- a/drivers/regulator/mt6315-regulator.c
+++ b/drivers/regulator/mt6315-regulator.c
@@ -31,10 +31,11 @@ struct mt6315_chip {
 	struct regmap *regmap;
 };
 
-#define MT_BUCK(_name, _bid, _vsel)				\
+#define MT_BUCK(_name, _bid, _supply, _vsel)			\
 [_bid] = {							\
 	.desc = {						\
 		.name = _name,					\
+		.supply_name = _supply,				\
 		.of_match = of_match_ptr(_name),		\
 		.regulators_node = "regulators",		\
 		.ops = &mt6315_volt_range_ops,			\
@@ -190,10 +191,10 @@ static const struct regulator_ops mt6315_volt_range_ops = {
 };
 
 static const struct mt6315_regulator_info mt6315_regulators[MT6315_VBUCK_MAX] = {
-	MT_BUCK("vbuck1", MT6315_VBUCK1, MT6315_BUCK_TOP_ELR0),
-	MT_BUCK("vbuck2", MT6315_VBUCK2, MT6315_BUCK_TOP_ELR2),
-	MT_BUCK("vbuck3", MT6315_VBUCK3, MT6315_BUCK_TOP_ELR4),
-	MT_BUCK("vbuck4", MT6315_VBUCK4, MT6315_BUCK_TOP_ELR6),
+	MT_BUCK("vbuck1", MT6315_VBUCK1, "pvdd1", MT6315_BUCK_TOP_ELR0),
+	MT_BUCK("vbuck2", MT6315_VBUCK2, "pvdd2", MT6315_BUCK_TOP_ELR2),
+	MT_BUCK("vbuck3", MT6315_VBUCK3, "pvdd3", MT6315_BUCK_TOP_ELR4),
+	MT_BUCK("vbuck4", MT6315_VBUCK4, "pvdd4", MT6315_BUCK_TOP_ELR6),
 };
 
 static const struct regmap_config mt6315_regmap_config = {
-- 
2.53.0.959.g497ff81fa9-goog


