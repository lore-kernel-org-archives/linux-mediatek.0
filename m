Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32011C5DF82
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Aug 2026 09:00:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fzpmYFmR3xRBQWp75KCP75aMVcwBSxfqQwzCsWsaceU=; b=TVnynQZNTRZWWNcT9aZAzR230n
	K7AnoOfqgt090rtkgGvu5MfiJqJ9/3OoA9bW1ylMTEREBmEKG2PRAqoGd5d1ofQ627zY5IQXhY0jX
	eDDh4pG0Vr+vTfSO5rs0fkT9Nc3YDf9KmuXEpEOlUCVZfJymsgHCT01unp8URFys7IOqduNiekZNt
	LZf1u328sEEE0qzvnOPecjsTQrWV0Rn7lDu+J++NgWCbI88ciLk0FR3Ahbo7q2INrBtTnqvpuvlGM
	ClgoapVRCCQFeDnEMs/QozsmsdlXlHn+6nNfZAuufXZ8od2JgTXbe2Cw58+V2BuLPm5avQDynAFf5
	jhR57fOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwyd3-0000000BD7O-3etx;
	Thu, 20 Aug 2026 09:00:05 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwyd1-0000000BD5u-2BYw
	for linux-mediatek@lists.infradead.org;
	Thu, 20 Aug 2026 09:00:04 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4956242332dso20463205e9.2
        for <linux-mediatek@lists.infradead.org>; Thu, 20 Aug 2026 02:00:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787216401; x=1787821201; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fzpmYFmR3xRBQWp75KCP75aMVcwBSxfqQwzCsWsaceU=;
        b=ims6RbZ7ZpY8hVxez1zhZHhom3Ld00Mcj2N96Uk2T3N8TMXg/m2WMGBLfvnraxxG48
         TqT8xBmruiYDJvzsDPdgERTDdjDmMoF6LiV26gW2tJdlk852Mro51Nnx9cdgshNNWqZh
         Ny6TmWNLqXJJJUu4nVCcnRyEQs7ipF0rmNDc9a4AoPnFi6xCxJ88usNqMEXCQMp2myD7
         wm02e9SbXau3lD7hn2Qa/Rl6GXn1YW8pytvVXvELsYtbHkXra7+3LGulFdU2vQ97P1N0
         xycYeslQZ8+DK5U+JTHwf2l2gDE6XLviTaW5TYFqLhrY0tKy11v+1gMHjaf78qTKIpM3
         MeEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787216401; x=1787821201;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fzpmYFmR3xRBQWp75KCP75aMVcwBSxfqQwzCsWsaceU=;
        b=q4DDKcDrNSNp1lM+l500ZtpKagjsQAcmpF2LwUEBscLR7kUIbd6tPzOBYVpTn7z+9C
         5sY+gY5vN9iZy46YZG8CgumLV3D23prYAnPvMePvurXGhVZW94XWrGdpiwUV19ZRoW+P
         K+6/5MGwFPgimZw7k6zZORRCry4eZIxRY/unYNyREO1otC0z7q9QjGxL+ip5UtrhGQzq
         a4hLkMUxz5xvwMNp0ZSN30pl1wDCUan1iyA7gGvt8Sezc75AnvdHYdTOdKrLzzvpqwNZ
         bOQPu/PvjVse2l/Y+TOZt5wIxHM2NBZaWTq5konxnRQZBMue1J2WO3YIumHMyiaYcbqn
         QDJg==
X-Gm-Message-State: AOJu0YyxiNueJVQcj8n+YN2VZw0Gu0wClSQsTPs3VpX7mt6W5xAyHSzG
	XCcxOSAAfzv55lOOEW1ypRP7Otx+u0qJN6f+/pMDyzUQuptv8TljDBj8
X-Gm-Gg: AR+sD12dxwrA0h6Jjt5UgSJu4gGKLucIpL2OmOMPCnOUK1+RmD5AeAabbkWPENYUCVU
	T2LUyUg2ZUIRToL3LiTh8zq3HimtuQEWVN+/ztKmIaNEjFoTxYi/ou+mchosy3L2Lm5OOMKIMVY
	e1C38djlECGwULMTG0YpY30tyd7I1pD2RI7ZBUZQ8o4YaLNi4PJndTlZnIsu+VQvvZVm2dQnlLZ
	22RdAm9rKj0L5xahx4qCvS7E5eG5/Kubn/3aHB/MCT3C7yiAbdKgZLbMeF1w3C8dEalOE8KNFFm
	vpBV9l5SvkOYBqLkDOCRViiTOCcO1CmySlI68G0hYg28IjXu1PG77W/mQvtynWDz4l23aBAcYj9
	Khkw4vdeBHrRWdT4Gk6pBiV1AFDq5YJINze5I3toTzQMq+F89nTLqvuRMJNmG/UwRgB+XAHusPQ
	Gzit8ztHAVM8U9RUSV1UQ1/2DkFIAHr/rRdSPDj0bf9fGgUNrEHQsWT5qj6xke9CXgOcnASA2Qz
	tvADlIThz3uJkl3eZ0h8F+OZDDqJ95Nh20yGI71XL8=
X-Received: by 2002:a05:600c:a30f:b0:499:b01e:911c with SMTP id 5b1f17b1804b1-499b01e9125mr80109845e9.2.1787216401010;
        Thu, 20 Aug 2026 02:00:01 -0700 (PDT)
Received: from fedora ([46.205.218.68])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499aa1111b2sm176837215e9.5.2026.08.20.01.59.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 02:00:00 -0700 (PDT)
From: Daniel Pawlik <pawlik.dan@gmail.com>
To: netdev@vger.kernel.org
Cc: linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	kuba@kernel.org,
	lorenzo@kernel.org,
	nbd@nbd.name,
	sean.wang@mediatek.com,
	Mark-MC.Lee@mediatek.com,
	davem@davemloft.net,
	edumazet@google.com,
	pabeni@redhat.com,
	andrew+netdev@lunn.ch,
	yangshiji66@outlook.com,
	Daniel Pawlik <pawlik.dan@gmail.com>
Subject: [PATCH v10 1/2] net: airoha: npu: fix missing streaming DMA mask
Date: Thu, 20 Aug 2026 10:59:40 +0200
Message-ID: <20260820085941.380401-1-pawlik.dan@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_020003_561407_B78BCACF 
X-CRM114-Status: GOOD (  12.62  )
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

The driver calls dma_set_coherent_mask() but never dma_set_mask(),
leaving the streaming DMA mask at the bus default. On the non-coherent
EN7581 platform (Cortex-A53), this causes the NPU mailbox to hang
after approximately 41 calls when using streaming DMA mappings.

Replace dma_set_coherent_mask() with dma_set_mask_and_coherent() to
set both the streaming and coherent DMA masks, matching standard
driver practice.

Fixes: 6f884eb87a79 ("net: airoha: Fix DMA direction for NPU mailbox buffer")
Link: https://patchwork.kernel.org/project/linux-mediatek/patch/20260814110017.2795022-1-pawlik.dan@gmail.com/
Link: https://patchwork.kernel.org/project/linux-mediatek/patch/20260809152813.585797-1-pawlik.dan@gmail.com/
Link: https://patchwork.kernel.org/project/linux-mediatek/patch/20260805070851.2885888-1-pawlik.dan@gmail.com/
Assisted-by: Claude:claude-opus-4-6
Signed-off-by: Daniel Pawlik <pawlik.dan@gmail.com>
---
 drivers/net/ethernet/airoha/airoha_npu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/airoha/airoha_npu.c b/drivers/net/ethernet/airoha/airoha_npu.c
index b679bed952de..4045d1eb93ea 100644
--- a/drivers/net/ethernet/airoha/airoha_npu.c
+++ b/drivers/net/ethernet/airoha/airoha_npu.c
@@ -766,7 +766,7 @@ static int airoha_npu_probe(struct platform_device *pdev)
 		npu->irqs[i] = irq;
 	}
 
-	err = dma_set_coherent_mask(dev, DMA_BIT_MASK(32));
+	err = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(32));
 	if (err)
 		return err;
 
-- 
2.55.0


