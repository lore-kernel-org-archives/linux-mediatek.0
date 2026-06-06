Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9778CD6E75
	for <linux-mediatek@archiver.kernel.org>; Sat,  6 Jun 2026 04:07:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1rjS832aE1oA+NWR2plR5pJJ8WRs2Vb19cfZDQa4g2Y=; b=S9ykIJNGoF4pMAY8ojuZCG2n2Y
	qDvQuRCZxMQBoNMt2h3lOmu1HBY3MSok/OQjZriIcqt4IajpaSd7DSpUB2AeNBtjippNsxBWlklZg
	JxzxoaJNIoe7Htmqt8pEdfhkdUbLsSbF81XByx/fiRzE+OVhOIuz/CAiKcVTxL4iHAYZa6hZ/7LIt
	k4OkPvkU6g7D45akqcCPL4/V6gXUQnWWkI3j4GLfkvE+UtrvTRJIS0WXpullZBHgt3LG7dE+M8yGN
	fzLJI84AUszBI3qtbW5Nz56A1DYxm3GQL0/iYAH/Pt/zsPmUCtimzAni5FJFoR10ZzHvVC5F3UMqp
	HUHIaIdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wViJa-00000001R0d-2vUX;
	Sat, 06 Jun 2026 04:07:18 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wViJY-00000001Qzm-1keT
	for linux-mediatek@lists.infradead.org;
	Sat, 06 Jun 2026 04:07:17 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2bf18c30bb2so17861165ad.0
        for <linux-mediatek@lists.infradead.org>; Fri, 05 Jun 2026 21:07:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780718835; x=1781323635; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1rjS832aE1oA+NWR2plR5pJJ8WRs2Vb19cfZDQa4g2Y=;
        b=CFi8GXERi4nu1UU2jNdSlBHaLXHgGY6EzGnJ1HBSYqcI7Bj9xB9PRjAeYbeSpGZMat
         /5R+sEj/8un5XAuEtDCBpzqcj1gf5UzuP1GvS+t/XbpI3aSVwLoOZWtfD4lwLDD/ZjHH
         uaMuSlnDxWkroynzqsrJToLIeDXQ5oolcYf2/qd8L031O7Tg3Q8wQcyMZ0XWUian6SYT
         d2MeDGhm76yGGkm6SpIE0zN8WlR4aYu6RPK2XiljKfTvxxtroU8EtKr/zeqXylBzguTn
         UCd/EzdHEbcT43jg0UzX3HTZ4h83gFyE/ORgmXs8b+8WbDFhCdz/81OeN5sqcg2oDq7D
         BVZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780718835; x=1781323635;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1rjS832aE1oA+NWR2plR5pJJ8WRs2Vb19cfZDQa4g2Y=;
        b=WhMXkuTr0ln5EczNTZGjcV8nMirl23ClWpQdZbcXYsyr7LJu/+JztevmJT3iNvW+Ul
         uqyjgxp+106T1PEC2eTb4e0S3VdetPn3GIlL2EtvHPwB3ZFmzuEKnmDAQXTSG+6ldUbT
         uFlrFNz9NVHyGFqPvhwKZt1XXxA+8U73wPNL/AjW9n+AHTEM723GFaZJ9pKrQfCPdGz+
         vBmF+yP41G3x3w7TGkzS+RVVwJTwX9saP9eB0XAmHIqkcu3ohTVYByinHuEUwbecPvvw
         qUIYl7Udu/0ealy+G0b2xv7uVSiPByXBNLj/ytnohBNsczGF14vmtVFw870jNTW0Ox9H
         1gDQ==
X-Forwarded-Encrypted: i=1; AFNElJ/3QNid/4s8w3K5CUFQ8wp2fWq3HLhK07BeSrVmdQ23LJp6xqBVMs4DwQCC29daAo2cWAGDzuVx3Gw7DUXq9w==@lists.infradead.org
X-Gm-Message-State: AOJu0YzezH9UdI7Ixcux44BF/9zMmdgOYw49xhHYOCxA/k25t+d/Gg5X
	MGy0mDg27Vie1IjlJPVruulc9HmQNATsS+vYIkbxqCtJ6UDYxGesmtmU
X-Gm-Gg: Acq92OHRSBYmt3LXJfNgsdC60Ol95P9+FGoUI3HZKrZEeLDLHfGsoeH1QLfcdEyCuo5
	Dh10lCI+Z3n/BPT4O/6od9EaDsCY3ZNPWGcTZhm6VUuy3pkZh37KPm5sDDhF/n+FRifekqfgi/N
	EApc9jQnAmnuxMVukHeWPt6ZMaaWtmYLR0tpVVqMFyBVYHacgHDq6dt+g5DPWW8RVKV4+ycMWVX
	pEaz4ZpFnNTPETVZ67ayXOsc/BM+r7RZCCyn3AHlYVQwZTQigq0SUb4MobQpApsEEuhpL5lZ/XA
	GXQnWRJtFCVEp8gnrL7KnTLEGkNcTF4qjZSEsVpSXn16dD/AXf9hK/3aYPelAGaWPnbXORY1UXz
	wu4FgEmbHh6zIfeNISl0cHAnmcsit83j4P/nx2sNgNLTggs0Nq0yeCOpjOeKRK39BylOmt9FlPL
	Kr9wZXUHr1bwzPsL+RJ2LsuuCpCN4oBXF62gyyLuR7bNotZ9U6e+K1Ww==
X-Received: by 2002:a17:902:e78f:b0:2c0:a373:89bf with SMTP id d9443c01a7336-2c1e80f9975mr70654185ad.1.1780718835009;
        Fri, 05 Jun 2026 21:07:15 -0700 (PDT)
Received: from haichao.tail057a43.ts.net ([2001:da8:e000:1206:967f:7ce4:ec98:f08b])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f84335sm107056905ad.19.2026.06.05.21.07.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 21:07:14 -0700 (PDT)
From: Ruoyu Wang <ruoyuw560@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>
Cc: Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Ruoyu Wang <ruoyuw560@gmail.com>
Subject: [PATCH] ASoC: mediatek: mt8365: check suspend backup allocation
Date: Sat,  6 Jun 2026 12:07:08 +0800
Message-ID: <20260606040708.13-1-ruoyuw560@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260605_210716_456924_8813CE37 
X-CRM114-Status: GOOD (  10.91  )
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

mt8365_afe_suspend() lazily allocates the register backup array and then
stores register values into it. If devm_kcalloc() fails, the suspend path
dereferences afe->reg_back_up in the backup loop.

Check the allocation result before using the array. Disable the main
clock before returning so the error path balances the clock enable at the
start of suspend.

Signed-off-by: Ruoyu Wang <ruoyuw560@gmail.com>
---
 sound/soc/mediatek/mt8365/mt8365-afe-pcm.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/soc/mediatek/mt8365/mt8365-afe-pcm.c b/sound/soc/mediatek/mt8365/mt8365-afe-pcm.c
index d01793394f225..74e4f53b31605 100644
--- a/sound/soc/mediatek/mt8365/mt8365-afe-pcm.c
+++ b/sound/soc/mediatek/mt8365/mt8365-afe-pcm.c
@@ -1978,6 +1978,10 @@ static int mt8365_afe_suspend(struct device *dev)
 		afe->reg_back_up =
 			devm_kcalloc(dev, afe->reg_back_up_list_num,
 				     sizeof(unsigned int), GFP_KERNEL);
+	if (!afe->reg_back_up) {
+		mt8365_afe_disable_main_clk(afe);
+		return -ENOMEM;
+	}
 
 	for (i = 0; i < afe->reg_back_up_list_num; i++)
 		regmap_read(regmap, afe->reg_back_up_list[i],
-- 
2.34.1


