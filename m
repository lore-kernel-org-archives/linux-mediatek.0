Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44BFB106F2F4
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Mar 2026 08:11:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CC10WFWDdAyN+TFjNPYY2y7LqaKz7gtKkshZ6FuGwXQ=; b=kncoujq8gWROgdrOysFewjfvyH
	b7BUUjjeLvhasYQiZJcrdZrQYO2Wb4CcNoYL3KW4ZJmwmZZ7bjVF+W2r4Lh6HlnUdO865X7mAGEps
	P+YH//9f4T5nqE/5OoTg6Sw2wkHh9Lf44J9FD4utUOK51OFIEOX3jyFqlv3u1PXYORPONoZDfdSSY
	JLvTB92015nJVjNXL/0cFRXFjtge9pSdrJ7CW2lTyJSSnzEecZqemG87JyMELVUeTPPQumifqn24I
	8+G6B4465ytdc1IGfU2AhipSDHWswNsLMEeLMlw13BAYcn8F6bY3BvY5tlp3E9dH5euS4K7Ls3z/F
	CBUE6kwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5foK-00000004zZZ-3UUM;
	Thu, 26 Mar 2026 08:11:24 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5foD-00000004zWk-3Eei
	for linux-mediatek@lists.infradead.org;
	Thu, 26 Mar 2026 08:11:20 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-35a094cc3e9so454358a91.3
        for <linux-mediatek@lists.infradead.org>; Thu, 26 Mar 2026 01:11:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1774512677; x=1775117477; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CC10WFWDdAyN+TFjNPYY2y7LqaKz7gtKkshZ6FuGwXQ=;
        b=TaCi7aPt7DbSc4FCz8ZuwcDW6PPXI4XPaCB4iAHqmASq87yljk1ASZzVGeqhB8oDWK
         iWTzr+e5Z2QQeUoYbioo/XIomM94bDUAb0qxJ6mPztUY0U3Fiy9Dg+4bqRM9tl+9Q2AJ
         LMr55V/5bg/5AEqN6wPs0wnHU1fICY+xxfb7M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774512677; x=1775117477;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CC10WFWDdAyN+TFjNPYY2y7LqaKz7gtKkshZ6FuGwXQ=;
        b=KXt7his4/EqvmTThDtVwvahF5BM87AqwRcIe8TUQ4geiADwsihoPCXjRlxdpFqYNdI
         l6aJcN1t1rz6rbiUsk0ecB2Anwx5dKxW3KI8qpJ5oUzIZAwhN3im2mwPfJm9FRbsBUay
         kVIieDq/tgBBMwNuMxfkx5nTzooNJx9Ts1Ps7gPxdLf7BsGtPCgKQgcpa6eY6L3bNvWu
         YFNdVq1pEE/T1znRY1PBNg5BjEjLmwejHKjcYWzxNS7zRxzrybrvvmOvuvoNrzDlGSAU
         LqRJz1GvJRrqBpOaNSeduABlzlA0JiniRRexAescBemiF79RSf8XY0seFocC49rL/3fW
         PYIQ==
X-Forwarded-Encrypted: i=1; AJvYcCU3F/tzkS/1bHEQ+dE5+hFEiNHqYi8N1wSL8VP86YaADCb7k4W599/2d9HdgDqjO0GTLb9sGN8uI4kompD3Tg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzMMr2LX5L/VubZZ41U1XJA0uCigXLROMiw78E6MihsvldbzyIJ
	28OidTWcCV0FSm8E4kdSxtuLKoOMNTqeuePtuSnwCaSLbvLxskJ9m8GmKq4dDWS/Ng==
X-Gm-Gg: ATEYQzy3utiFYfkNKA8rjaC4vPb4yWJCv3ZEA+elw40c97Pfsbuv8D5qWakMDjlQQCy
	ndB15SIPclnFcRZmPpL8C9p+T5SllSeuQg4/NCgcvoxtjQgfBgeQx/JedkKWmiwkIsLTyvy1/Ym
	LdWKY1zymQ+HmiFJUBahGqy9RQdpcDfwhrF+9WJZsl8Q0bfVUHPQRdD16ATrLTpuMvIW14ltDKu
	wyvSm6k+6cn3sc1h9kMcAiZR3oBLtCF/RK9rneeAX6hEpYB69S/2xpPZf7ITQJo5t7Mnk9HmGA9
	nKsnarYZAz9FtyfctvY1NIgqaJ3CHmRlNCWeZjJvuAMT99fpLfh5NDKtc37wiLAOcA/gn+GCOyY
	nD85/+rlzkho725BdVuFL4naTfeYhEIXf9GVbtnRJbjmHUCZMCDR66mWTcC1uR/SQIxrb/MAc+E
	UYCewjArZKxB6yAPUka6OwSI+CCC6BPU31eMoOnM/KpOTjNyURPTCDq2nawQQjnQkkEfGfTlrJs
	hQ1unDV
X-Received: by 2002:a17:90b:2645:b0:359:ff8a:ee44 with SMTP id 98e67ed59e1d1-35c0dc8ee2bmr6266111a91.2.1774512677238;
        Thu, 26 Mar 2026 01:11:17 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:3ed5:7e63:b37c:a7d7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35c22d09573sm823452a91.16.2026.03.26.01.11.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 01:11:16 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-kernel@vger.kernel.org,
	Chen-Yu Tsai <wenst@chromium.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 2/2] regulator: mt6315: Add regulator supplies
Date: Thu, 26 Mar 2026 16:10:49 +0800
Message-ID: <20260326081050.1115201-3-wenst@chromium.org>
X-Mailer: git-send-email 2.53.0.1018.g2bb0e51243-goog
In-Reply-To: <20260326081050.1115201-1-wenst@chromium.org>
References: <20260326081050.1115201-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_011118_928399_04A386D7 
X-CRM114-Status: GOOD (  11.84  )
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
2.53.0.1018.g2bb0e51243-goog


