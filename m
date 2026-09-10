Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BAF8C79FB9
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Sep 2026 12:58:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bKdmUJYxYgq8tpbG7VT9pIxvv5zd6VcFqq2QVmbg6wI=; b=1hIqY2X3z0zDJNdlTKAiVmXlvM
	4a41GT+eGpq2xCR5t1/UpOi0UTzcd8VZPqyY3KST9FR5yOa4xDues2/FF+xRbrydo2kY93+aq2XKM
	4NlVX2qFVUL03AWpY5+DYpb/v1RdLt4bPAXKjvUpSoeLsPxxpcAg5EfmkwJ7OVQ7HiGGXQGFNX7hM
	rtAHmzb2Y1TG8YJKFSH93IwyDc+CaAr8DwzoenEINaJoZD2SN/ABSW8aK6nD3N0NfZMOioGFedoh9
	8vkKodPsuWay7c9ttQLGAhEFe+2pSTxVzCfeQn27fkpcXSMbmE2n9nYUvXNvKNRVYGuPKPJfzFQaS
	YCvPAvEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4eMD-0000000EOY6-0ZoQ;
	Thu, 10 Sep 2026 12:58:25 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4eMC-0000000EOXN-0yzi
	for linux-mediatek@bombadil.infradead.org;
	Thu, 10 Sep 2026 12:58:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=bKdmUJYxYgq8tpbG7VT9pIxvv5zd6VcFqq2QVmbg6wI=; b=IPi0WVgM1UAaJBhu5n8AeRev11
	RwchzqQICUqDMK/hSmZIVBtpM1eEtCQiDCL7pLcqfd/1B0PHlWJ2sKyfiqnKU6Xo9EpwRWbbRmOZm
	GgjCc44ccJXCPusoIMB212l6zM+EK3KEJUTB8+KpOLP+GEYySc7OUmM2XemMJ6RM4adLPaYrqC5TP
	bCkh8/91S1jMwb8Kmzu1Dp0fyEQb5sZ64LcoV3mGbGvvpeKhx6iqlKHTmHAi3nGqL17fjP3Z8yP6S
	j3J58Jk8Megr68e7HMBy0CsRFACSKDr2O/CobYiuJhSUHpnc8+nlIuMb7FcVN8iHRnoq031De1cNu
	EhLLT5ZA==;
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x4eM9-00000002Uyi-2Bvb
	for linux-mediatek@lists.infradead.org;
	Thu, 10 Sep 2026 12:58:23 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-38759bcd877so7552880a91.2
        for <linux-mediatek@lists.infradead.org>; Thu, 10 Sep 2026 05:58:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789045099; x=1789649899; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bKdmUJYxYgq8tpbG7VT9pIxvv5zd6VcFqq2QVmbg6wI=;
        b=pVErvkUQLtXiON6yH2ST4mfEGNFHu5fmfcOVFXdi4ePpsnDjQIrfV9UsGAF7+dHjRK
         b86Rockea2R7PcBckJXKBz8dQzKpYEdNsPh26Ar5IdYHBrF77ypuQuXbYIYfjCTMSuqo
         /Ug8XwV+Lr7dRnotGFyhIzUMJPqhtCCUSQ4GafikvCi+EVEhLF5tMbf59urX1uTtsxnJ
         GtfKu78crQzkvpxXLuGaQgZ/M2UyDfB/DvqZ9yJBkojIfna8D8kGTC0FTx6EwL6k6Yhd
         uCFUBOBNt4lTeSGKqwtMB5wu4Vh4QzxfUmf+XOChEbw+t77C97b9MnR/8e7N64MT60Ws
         O2Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789045099; x=1789649899;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bKdmUJYxYgq8tpbG7VT9pIxvv5zd6VcFqq2QVmbg6wI=;
        b=fFmt7jHvj+s8SZHuj2DTcDgj7tySUZSrjP1dlvkoHAnHT3upo9IiNdzbR2r8ov3+BL
         P3KXz953bUGZVHSVposRaiW8IKC1Q/DiYiQ143HCRxie1HzgDJjIltHUQmFRVVmBQpO8
         W71hZsQZTlK+Sc42uaoXJbsLEPHkaI2IOJ9f0uRjxfhJRkj20w7n3zSy49e/G/eMhqgB
         n2kBO3fC0/oQME99XjOd9XN+gta+ZbY1hKgwYlY5+xH0pa7fX/WJ3xHWXe3588GPNETP
         XSZa//mBwBcNvyvcAk0gwgGl62pzEG5lfCX7jjK19hYDJKsls7IeqErJ0NXYcLu1kAYZ
         RjCg==
X-Forwarded-Encrypted: i=1; AKwUvBwp0FTDYyzQf+9R/h/PZLqKUJBl+gDjyaKQkKEqiELYiVtrSSGrLc4URbM48Wl/pdrXvN7z6ffYjwciupsthg==@lists.infradead.org
X-Gm-Message-State: AFuF++kw1b5P/SzT29fw8d9E5RueYSg1gu6ZRpZ3rBLUKXpIjvFmjqTX
	ekSHbGq3N0wSkaufwpUAHPU/bNdYJAiSgcNSC72BpOKYYCxQEl7Y+jgz
X-Gm-Gg: AYBFou0UREiZF2DWHE3ZG76fttKWWuqDuRvuiF11SvZ4VY8tbDwckR8z+eqynzQXjvx
	J+KebxnToLJscNsQv3tRU398uLwEBeLjJG+EmjjNNFNWxzIxiglocFVHcLEP7srtc+5arNY8TqR
	xv5AKh1bpqadm1tIAoCJrFL88eQRhzYt9tslujdMFrQHBZeF6LsKjFcHHb64TvCdb2AznltiQVj
	93jppJ1wUYG8XLmAG+c5MagYjSP5DjSUXWNZMTYY3PnXo/9Yh7KOp3pz2YyQnMx1liDaxg6DwB+
	tEIxrSOR0LvTTc8Rp2bUGD2w+N8DRkoCkAa8fdInMPQPvuLkJmwzVl3HIZm7lZ61o0xQfZ3195l
	xY5dAcWeI6UGTRTC6bVN15OTscp4RWY3yQ4/qOWm9C9xeq3BvE3SzduvkTxO+EIChcV5uHz8nah
	54SkINu4VOuJixzUVyKpIPxBtzXVkvg4mldLqnrm3yfHef+YYaJJ94ZYo7mTC9qEIEDZoIUayRe
	YKhO0WOVR+WvAzPAOE7KXz2Y9kTEs8LmC2QWZtxGFx7jyxtlOAGrys4bJgL+WoQZ6FKFuIqla40
	q3AJJNa7mqbBrz8=
X-Received: by 2002:a17:90a:fc47:b0:398:9c0c:7c72 with SMTP id 98e67ed59e1d1-39b2627fe24mr58655781a91.25.1789045099266;
        Thu, 10 Sep 2026 05:58:19 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d7e77b1afsm4891592a91.5.2026.09.10.05.58.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 05:58:18 -0700 (PDT)
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
Subject: [PATCH 04/13] ASoC: mediatek: mt8189: Validate MCK ID
Date: Thu, 10 Sep 2026 19:57:33 +0700
Message-ID: <20260910125742.150902-5-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260910125742.150902-1-phucduc.bui@gmail.com>
References: <20260910125742.150902-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_135821_681857_0F9F3259 
X-CRM114-Status: GOOD (  10.94  )
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
index 933179f2a5ba..88f15a9c2513 100644
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


