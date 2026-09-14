Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B67D9C88E6B
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Sep 2026 07:29:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GJYLAFpdT1QOF/hJAkr/62fvY6NkBt3I3B5rin4YsLo=; b=gDQEdXhdo/dRvGwR0HCd27vOrx
	6Cxa07DhRrTZN/49xdBw4Lvrab3tnh9TVzU2Fxexe0ooFELYFohZXuE+ep3T/XCTV8+9cgvC7Ua4y
	etxCm7P68crx5LLrz+5DowH/U9AznJoVTxsRik/QEPfraTnoZ3o3rz/QLO15iTL9BexkjGOJCjCD8
	3rQml+0EEWubyyTLZXCfKU5nSVtmG0Fz4hXz/dMPuk3N4/4uN+TzxBvZAMKLfy5FMQ61QtWqpf4Fd
	/GJRCgoW4HF10QIze0/y9Jar3EINTnudmD5YDI6yt/LDG6z/ftwftZ53BKDE/uEjHdlOW6mHZq+va
	wcX470pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x617u-00000002YIn-33BM;
	Mon, 14 Sep 2026 07:29:18 +0000
Received: from mail-pj2-x10.google.com ([2607:f8b0:4864:39::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x617s-00000002YFL-11wn
	for linux-mediatek@lists.infradead.org;
	Mon, 14 Sep 2026 07:29:17 +0000
Received: by mail-pj2-x10.google.com with SMTP id 98e67ed59e1d1-398c066106cso1337075a91.1
        for <linux-mediatek@lists.infradead.org>; Mon, 14 Sep 2026 00:29:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789370956; x=1789975756; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GJYLAFpdT1QOF/hJAkr/62fvY6NkBt3I3B5rin4YsLo=;
        b=F08u6rtLui6GRHdBgGweYBtDEcE8TBD/MV8xcHdNx2MLgmmt8q9ISs3lO5XbmhMzHi
         +E96c+VK/3El0I4q4aqj4phAkbeKFkKL7ikSf7F91eyWcIu65Naj30G9XKGq9m6n5I6L
         tJgDrIhLY7rZHeCRzmGFPUAIlwPyfOG5TNXmzxkxvJjAdYx9DZ/QIUSryci1ZEdqRANz
         v0FdPLV67jloDBL5z4XTANruq2GHs5LBKFlhfOlAjukobPcWJe4EgCKNpqovIGicPEh9
         B66DCMoexKrui/bcrWUhiJ7hhJVlmaCY3a1TXmrkdNhgXp+++NHNmtG84mGQr5hk3Hj7
         rhpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789370956; x=1789975756;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GJYLAFpdT1QOF/hJAkr/62fvY6NkBt3I3B5rin4YsLo=;
        b=PM+YUb0DA/0z0F0axXDdwjT3lhaRSjQNyjIcQoth4/vVlF5WnwTRsdMpi/flBkTkPZ
         CVwwKWfAPwO7neFshE2sFxttRVa4eq8/H1z3t6LLI+k9vKtBED/qs+7ZLLh9BG08WXf1
         6fkbdCA2CvTz/hpdOxs9AskYrqclvYzMJTqzyPNs/EfVUfYQoA/J/qTjZB1VpRuef31X
         sB34FpKLVoXOsfCA7DaoQWnS8C3UD5DkA65E2c81kaHYQqkZboPp7IqPvudnTxXhl3tN
         D/x5zuF3TNpp8wxTkRdUb0R3oxere8MYcMtQzXnOOZmLbZ8Wo4tNlrBtXNnWAjLtdx7s
         ENEw==
X-Forwarded-Encrypted: i=1; AKwUvBxYgyqP02QqsEkLKiTE1ZlwB0Rn50gDXLm0yXfn6IQ8XmBiZRcaEj3sY1+SJ8hG937nvsKfiNIRskraxSBfbQ==@lists.infradead.org
X-Gm-Message-State: AFuF++lkdiWO4hxewjwnW/koJte5UchRfGSbInDWGv49dSnoluqceP/G
	4B46imy1MQ9Pj4fDiUQ4k+Rjx1DCCkGJWLA+3IvbMxxahrabVfkmxmCn
X-Gm-Gg: AYBFou08k+jyBgEzkah/7ga24C4nsvF39cOQRAAvHFRwlca/fyefs5K/pqBxs1Ltxd+
	qRPtSja8BvUEpuqFFIh65w8kCR1Fn9coDiA/ao8tXWZa9d+bkymEQjguSE21vE6CfhzhesfSO1N
	tQq2ZqoDEVCnk98/NIQzg2w3sr/uPfoykZ6ODADWwYhny4hVeycLKogz3UB7Kk16JYV8K3WBu82
	h30ku4RwWjCUzgTG5JtfP/jEHCldfco57evH3WtYfYuZkgrOiHwa7lAXDfuVkb8BLBUt7hzkpxs
	6UgZYtnwdu7KRyiGYuZKn+kosVEC3ULj19ThZCmgvDWWq54hC4rfDeFr8bTYuFPNFP7UlqOg7HP
	m85gilk+ggJp1YrR24wF6mMsFmiEb37TcJT49Xa6HBTOMpTJHM9FXQcgcAp/8Y1P+Q9XM7KlBCQ
	XEE+UsUlWu5IqkqnqSt34SHvyMCs/moDp22+IsYy04faGOTsEhlDSZQ0B9C1OUR3w4BVpnexO1Q
	/M+mcoOBNjNu4HiNANDfNjPuTFkX1zHlfEt2cVWbrz1VCcwYX/CeJqFxuPr5ZflF20nXck/Poc6
	pYg1zplmtMgdaqA=
X-Received: by 2002:a17:90b:2885:b0:398:b46d:48c0 with SMTP id 98e67ed59e1d1-39dec0849e5mr3489837a91.18.1789370955702;
        Mon, 14 Sep 2026 00:29:15 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d957131f9sm19598245a91.12.2026.09.14.00.29.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 00:29:15 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Cyril Chao <Cyril.Chao@mediatek.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Dan Carpenter <error27@gmail.com>,
	cassiogabrielcontato@gmail.com,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 04/13] ASoC: mediatek: mt8189: Validate MCK ID
Date: Mon, 14 Sep 2026 14:28:33 +0700
Message-ID: <20260914072842.24420-5-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260914072842.24420-1-phucduc.bui@gmail.com>
References: <20260914072842.24420-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_002916_355296_70BDE38E 
X-CRM114-Status: GOOD (  11.03  )
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

mt8189_mck_disable() only checks for negative MCK IDs.
Reject IDs outside the valid MCK range as well.

Fixes: dc637ffeed6c ("ASoC: mediatek: mt8189: support audio clock control")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8189/mt8189-afe-clk.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/mediatek/mt8189/mt8189-afe-clk.c b/sound/soc/mediatek/mt8189/mt8189-afe-clk.c
index 8f6241d47a65..69aa3715c19e 100644
--- a/sound/soc/mediatek/mt8189/mt8189-afe-clk.c
+++ b/sound/soc/mediatek/mt8189/mt8189-afe-clk.c
@@ -675,8 +675,8 @@ int mt8189_mck_disable(struct mtk_base_afe *afe, int mck_id)
 
 	dev_dbg(afe->dev, "mck_id: %d.\n", mck_id);
 
-	if (mck_id < 0) {
-		dev_err(afe->dev, "mck_id = %d < 0\n", mck_id);
+	if (mck_id >= MT8189_MCK_NUM || mck_id < 0) {
+		dev_err(afe->dev, "mck_id = %d\n", mck_id);
 		return -EINVAL;
 	}
 
-- 
2.43.0


