Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB277C55167
	for <linux-mediatek@archiver.kernel.org>; Fri, 31 Jul 2026 07:12:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=p/zSUWBhbluccRh5Y+3PaEaBGuhqo6tGCiQ6G7WtFxk=; b=spjaO+qxU2E/CCbARbgHWTqtEE
	8oO8BtH0g5F57P5Hp2f61/btagQS9Rbe1XFF2dg0lxMKiYbhSjbHyJyiZSD+cuWHVPH2WeBk5gpRU
	wkGDqEt6kvUJE4ox8eTD7sorm7PCrfvYlLj9+d3g2Tmtz3htFYyS/P7KsnfzdwBnquHO/AoV6BLEG
	pHfmhBRe3OwuQ4w9lkFg6XCxkmIkYutVOh1I34gDvRVtHKrOMr8aU++5p+4kB8buVqPCa9LlbcK89
	6sume5b2QkHiXTfv0wcTPg4dMmpcc7mzr+wK4u5Nn+WK7nHLwJCDegN6g5idoupG+hWOqIDojW6wc
	5N+DaBGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wphPX-0000000Bvy8-1pKR;
	Fri, 31 Jul 2026 07:12:03 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wphPU-0000000BvxO-46Cp
	for linux-mediatek@lists.infradead.org;
	Fri, 31 Jul 2026 07:12:02 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-38e3617ba36so749109a91.3
        for <linux-mediatek@lists.infradead.org>; Fri, 31 Jul 2026 00:11:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785481919; x=1786086719; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=p/zSUWBhbluccRh5Y+3PaEaBGuhqo6tGCiQ6G7WtFxk=;
        b=jwBTvpO0XG0DiJPJVYSmokIOkaaOITY/Xd91xMzsJqPtClIAAC9SrIZVXu4cwr6BNH
         Q6/76Hn1dlU6sc1cHqcha4mk6YseiWGIJoO7Ru5VecLKS/Xp172Xp1DVlqUbZC65Hkj4
         SfFj2x3/dzNm8nIAQpi0V1+hbnUkglo7quyoKSlY1mMkLeDKvvTMMRdKBIlXzo8FKnXg
         REHYsm3YbbQ3DPb4h4hOwXTb7hNS5tCV10GqI9QZE3NHZYXOzlw2ask+ePGz+FCLXB3I
         JJy0ybfEhAlgS4+xSdDxCI19BL8IAma7uzeKBBmDfWOu7ntPlp0BECKAQ/hUR8+Smbiz
         zCHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785481919; x=1786086719;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p/zSUWBhbluccRh5Y+3PaEaBGuhqo6tGCiQ6G7WtFxk=;
        b=lLLUaQ5hZU0btgPi8W1nDvB34lhMsGLvpwrJHmTxgNs7gwyNbnqMAXnVi4EZL0JD2G
         Fdb7baUhEiqqFKgBuYe+ixvUR8Vk+i/An7uhSRb9KsL1UsQ+PRNWRUUvTd9ylZKk1vbl
         uxpuh8u4GkdOJemOOp64C0zCXAWKfcFM13L5LzheyVioi8aaxSswQLZk7q4ajtq+2VkT
         LMxppxIHRmtb4XIlhMcZ0/FOHSuiA2yHu7grA6ESCg7LrBS7noumPsmMjIvC0pjLXaxE
         64DOVvrxY9706w9DawELkl4xDFpJnOA/Mt21W5+uqUWRF5L9TENk7oQNRhj9vZ9gwvll
         vwJQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr1x3LFRrk1zRvOB/3XkQD9E02PuQZcHfAt//WmOwsdXQ+OFIT1hAAIMyhkPpiqXRfZRL0a4giP/QJV6OSPog==@lists.infradead.org
X-Gm-Message-State: AOJu0YxDyN5WD70ylayfFO7IiJ/qKpKVY9ECEvmpHvOV3rK1OnmxjMRC
	Ou//WVUEFOFGIMpabATO+lXQHs4LvqHEG6d15itVwQKdoqa/5RMWm9A7
X-Gm-Gg: AR+sD13kBqQauNTGV9MwP51SKEU82h6vqrM2lEECwzHTVf2kFSX19+Zz+z6tho1rove
	0qCHVdHPaTBzzwvcoEjzLw8U9Admxp35yoJaDat7Yqktj+wBbNvke8sORwiZG8tIILL2RKnrABa
	6RY3w6wITEJViX4EbL/tOIsCiVr9NH4ao/euis1ORNZsS5ZR5V6vfIAxY9K/NyGr/GN9VdP4kGW
	nduX7s/wbiY0MWY2qpiNcVFeZijVc8RILRf7xPYTmw1XRFkJOjYtKqlumPzYpEoyiHBMe4IEi/C
	YXUM9JzbmdEqJk14LkQUC1LtoARsnae51m2ZU0PKK5mGV6ehmUW2cky+gStxuLX7SsYiEV370Yb
	qREnNmqB6snJv+qcYlQa7Djm0Va5Y9x4f5NWIuK0b6VvEFzkT99N/eqJGqA7WJw5SBmSyX8yG94
	Wo3ZfQxX2XL6v4Fn5i0mURCiCIna7fku1EO/SKxur5qzdUlOCE6MzjroIeBc7Cjgz4pM34/5ySe
	zK+ZeqzJ1Wz6DD5aoh1CQ2mHhQ=
X-Received: by 2002:a05:6a20:4308:b0:3c3:a1ed:3c36 with SMTP id adf61e73a8af0-3c91b266a96mr892351637.24.1785481918740;
        Fri, 31 Jul 2026 00:11:58 -0700 (PDT)
Received: from KRHW1CJW23.bytedance.net ([203.208.189.11])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153dd4f0f0sm2308226eec.2.2026.07.31.00.11.52
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 31 Jul 2026 00:11:58 -0700 (PDT)
From: Zhao Li <enderaoelyther@gmail.com>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>
Cc: Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	JB Tsai <jb.tsai@mediatek.com>,
	Leon Yen <leon.yen@mediatek.com>,
	Quan Zhou <quan.zhou@mediatek.com>,
	Ming Yen Hsieh <mingyen.hsieh@mediatek.com>,
	Deren Wu <deren.wu@mediatek.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	stable@vger.kernel.org
Subject: [PATCH] wifi: mt76: mt7921: validate CLC indices
Date: Fri, 31 Jul 2026 15:11:48 +0800
Message-ID: <20260731071148.74484-1-enderaoelyther@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260731_001201_027757_0DDB7079 
X-CRM114-Status: GOOD (  11.09  )
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

mt7921_load_clc() indexes phy->clc[] with the index stored in each CLC
record from the firmware image, but does not validate that index before
its first array access.

The equivalent mt7925 parser added the same validation for a potential
array-index out-of-bounds issue and later corrected the comparison from
> to >=. mt7921 never received either change; see the linked commits.

A malformed CLC region can therefore read or write past phy->clc[] while
the driver is starting.

Stop parsing the CLC region when a record has an out-of-range index,
matching the corrected mt7925 parser.

Fixes: 23bdc5d8cadf ("wifi: mt76: mt7921: introduce Country Location Control support")
Link: https://git.kernel.org/linus/9679ca7326e52282cc923c4d71d81c999cb6cd55
Link: https://git.kernel.org/linus/08fa656c91fd5fdf47ba393795b9c0d1e97539ed
Cc: stable@vger.kernel.org
Assisted-by: Codex:gpt-5.6-sol
Signed-off-by: Zhao Li <enderaoelyther@gmail.com>
---
 drivers/net/wireless/mediatek/mt76/mt7921/mcu.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
index 25b9437250f7..1c99645b8122 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
@@ -467,6 +467,9 @@ static int mt7921_load_clc(struct mt792x_dev *dev, const char *fw_name)
 	for (offset = 0; offset < len; offset += le32_to_cpu(clc->len)) {
 		clc = (const struct mt7921_clc *)(clc_base + offset);
 
+		if (clc->idx >= ARRAY_SIZE(phy->clc))
+			break;
+
 		/* do not init buf again if chip reset triggered */
 		if (phy->clc[clc->idx])
 			continue;

base-commit: 4a0bd262df757b25fc4e2a53c947317c119ced4e
-- 
2.50.1 (Apple Git-155)


