Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 127A3C83F17
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Jul 2025 23:15:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=k0CRRO8Zw5SYMNCeis2H0ecNCwZ1xJBBe/YWgqbP+9k=; b=jV/gMkz/i4C9vQCc4k+nhy+7u4
	HiUe79h2lclMlz5OgOFqV6ypA2RcSWruwl2jGXtnbUeSc2NfcuDOSNls4MeiL0QV7VBbOQvE1UADN
	OKNVlVr1DP3W3jShMTvw2JG4ZnOFzFoyTxEH9f/v2ZAacsb+ECJNe1R3k7fvLX8EM+xPBSehd3c59
	uf47387ifhceL3mQU3Bus4zQlejEmmbWHbYEnqy5kDP1Hq7zzrHbUlDmtgewnIezLidX3HdnQTaYC
	t/0y8pz4rFa07HiEnia4ge4uX9tULPYsjMVuqWpTMOGzLc9Bpy97+I6epyWJGdtRd1nlrTaZ40h6e
	uE14oofg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uborc-00000006NsB-0VtI;
	Tue, 15 Jul 2025 23:15:08 +0000
Received: from mail-oi1-x232.google.com ([2607:f8b0:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uboeJ-00000006MoC-3jLZ
	for linux-mediatek@lists.infradead.org;
	Tue, 15 Jul 2025 23:01:24 +0000
Received: by mail-oi1-x232.google.com with SMTP id 5614622812f47-40a4de175a3so3078597b6e.0
        for <linux-mediatek@lists.infradead.org>; Tue, 15 Jul 2025 16:01:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752620483; x=1753225283; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=k0CRRO8Zw5SYMNCeis2H0ecNCwZ1xJBBe/YWgqbP+9k=;
        b=fR5Pw5OPm7LMCLVPrPrVPThQtmvo1DogcKqKqmM2DbhpG5Yt7mZdFOvaenfQBVfHzy
         vrsrOSckqzDb/W4lfrEi8LJE56z+D55nm3C31I8+mKE6VeGeW1htxtKeDUwTTqSV7A0U
         sIxMOdWCoZ9VlWYHxhwFcv0rbwVwwu1JNevCS+vNrKKZswQsG+G/6rxwWhHq7/3hVdNC
         4HVSx9KUqljeJn3WFNQpDGekrMCIIzqNUyh/0fKzRhQ/x8LO+aAsuBxI5c3hy/GcUYy5
         YD6/pUfoheRdpFXMC9TrNjO830sUV2uBOOeSqXEE3Y9XULfKfFyn9nLQoSqK142pq77L
         HbcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752620483; x=1753225283;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=k0CRRO8Zw5SYMNCeis2H0ecNCwZ1xJBBe/YWgqbP+9k=;
        b=VMdAfusSXDfGOUHYVdqoFGd1RM8pabekrMwI6INceaVT2V4BTKMH7Ie0bnszCJiuOp
         Ax2RNey8bFSkVwaaL4He4zGEWpxheIwBW8aTFlqzDRSYpLbt/ZK2s9GpPmIk3K+UmRT1
         N0ern5iy9TACpNfVOi1DMqGVf3xOcdxPuIp/lVlrch3Bv2UumkTEh3OVPki1clWgtk36
         GcQ+KDpOR1TulyGR9FgBYjxb8OnOiKRtw8o7FwZjS0vPFsvJ0H+IQBNTyfnnepjpXZa5
         Dat5jBvfn5oJP7zvueoWdC0yG/+zVUiExw2WkRGeZ2i/qO0p1Bqse5Mj0dpA7I3Kr8jj
         xUMA==
X-Forwarded-Encrypted: i=1; AJvYcCUzuNPQIlB/MBoLaLdVm0MN+wtf3fzrBkOM9+IZKfQVPiTeiMeC8IDm1PBMWwL2ubZbESJJQmgCdxoHoqG2yA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx752OlxQOuzFKeO/tYKL0dsmh592MMA/+iewi2nnQFvEPBFpA2
	xSmKk8uuh5T/pI8enfGE2kW1AR9MA3FyFjuKWetbqn3EZsNuNj9U/8VbJvtIWW3ns3M=
X-Gm-Gg: ASbGncuGCl/2rNtHWcTMC1GsP1kOVwulzRIoCbVCEnfb/3BHBb1NgZixFVHfXNlJhL7
	xHrlqSRK1JHnoxJbx8rP2QAMi2hJt1r+22cmqepYhbQhWbaibMuPigcs9kYsFUhVBrFldgLM6vU
	WLoxLX9P1AgstyZ5l0Vi4WPkLu4FV018lUpvT+XU2/oguZVZJjJvpZPBMQ2vdnrwztOrX9OEtLy
	clQ+RIA7svJboFXAP1hs6cBEdR4JcXqqql1jylvOe9ETsDMAjIWvVHuBX7bkpHqt4HA8vgYZJ4y
	VTkcFttT9mCgtFy8EDs8FWJ8AhNWYyTu/mtNBPdaS2tPDMyXRoXMYgnroZK1F81nYVUOa5YWiUQ
	uP9nRHscPpOvHoqq8io5LSjxNLUYd
X-Google-Smtp-Source: AGHT+IGQtllmBc9kuXNMSNrT8BdEoXm/J1sAHyCL8mClXy5PmdAT8mA8+MNoRfXMLo08tASsstG21g==
X-Received: by 2002:a05:6808:199f:b0:41b:75ca:b104 with SMTP id 5614622812f47-41d05d37a1emr470408b6e.39.1752620482690;
        Tue, 15 Jul 2025 16:01:22 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:9b4e:9dd8:875d:d59])
        by smtp.gmail.com with UTF8SMTPSA id 5614622812f47-41418c0ae9bsm2349086b6e.6.2025.07.15.16.01.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 16:01:22 -0700 (PDT)
Date: Tue, 15 Jul 2025 18:01:19 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Rob Herring <robh@kernel.org>
Cc: Felix Fietkau <nbd@nbd.name>, Sean Wang <sean.wang@mediatek.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, kernel-janitors@vger.kernel.org
Subject: [PATCH net-next] net: ethernet: mtk_wed: Fix NULL vs IS_ERR() bug in
 mtk_wed_get_memory_region()
Message-ID: <87c10dbd-df86-4971-b4f5-40ba02c076fb@sabinyo.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_160123_928186_732979C1 
X-CRM114-Status: GOOD (  12.32  )
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

We recently changed this from using devm_ioremap() to using
devm_ioremap_resource() and unfortunately the former returns NULL while
the latter returns error pointers.  The check for errors needs to be
updated as well.

Fixes: e27dba1951ce ("net: Use of_reserved_mem_region_to_resource{_byname}() for "memory-region"")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/net/ethernet/mediatek/mtk_wed_mcu.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_wed_mcu.c b/drivers/net/ethernet/mediatek/mtk_wed_mcu.c
index 8498b35ec7a6..fa6b21603416 100644
--- a/drivers/net/ethernet/mediatek/mtk_wed_mcu.c
+++ b/drivers/net/ethernet/mediatek/mtk_wed_mcu.c
@@ -247,8 +247,10 @@ mtk_wed_get_memory_region(struct mtk_wed_hw *hw, const char *name,
 	region->phy_addr = res.start;
 	region->size = resource_size(&res);
 	region->addr = devm_ioremap_resource(hw->dev, &res);
+	if (IS_ERR(region->addr))
+		return PTR_ERR(region->addr);
 
-	return !region->addr ? -EINVAL : 0;
+	return 0;
 }
 
 static int
-- 
2.47.2


