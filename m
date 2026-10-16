Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2BDCCCA462
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Oct 2026 09:13:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3K54IdL4RZByTjgnEb8ZCDinU/s/KfGgM+FAnEVJz+c=; b=N8WoxyRPBBU+dpSMCJFhwsrAqt
	OVwB66+89lScDvTZ9hDIK8EUkPXBIALcnMaVfzX7FkhBX8kGWlWqgp2054FbhGm9C5AGyxO4jDw5d
	szPO//Z3ofWkL18edIl3sT7rYUEU+Wg7R5M4Q1rV3WRYGLmZAq2iDSz2RCtI7Yw0bgrBdqrbEZgp7
	luyEbwMrgFGASZhtnsPCr2q1zOJlJu7XmBXHO+8p/S4CZpJe7Pz9D0KJQSi/XHXPEvN/eW7s56+Av
	L9mDvPnpA7OwHYsOjPHozvMw7S8vd2bjb1Q4A2KOrei/Dkf1ASUFBQ0ay/7pH5uV0pxi8Z5bQWGNW
	bJupLcew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHdzz-00000002RRM-0FPR;
	Fri, 16 Oct 2026 09:13:11 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHdzr-00000002RKw-1N72
	for linux-mediatek@lists.infradead.org;
	Fri, 16 Oct 2026 09:13:04 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-3a0aaa0fd13so4691166a91.2
        for <linux-mediatek@lists.infradead.org>; Fri, 16 Oct 2026 02:13:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792141982; x=1792746782; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3K54IdL4RZByTjgnEb8ZCDinU/s/KfGgM+FAnEVJz+c=;
        b=VUVJ676ZXq/IJnFfnEotpZVpC8NhalwDCMfcf362FDRcbYmCSGsW8F9eR/EOsvh9jv
         ualMd5oeuiNmzwap5CDZ9Zr7QCQXiPrCOXq0XQQW0QnVGn0lT/qFkfYC7599Bu5IK3uO
         fGVjdmHton3nhrT+Q0gdsn1gi6sJfs4ZCQRN/It7NBhRCkMWopoXRJUH6uIOHIpXccxB
         zRPtB5vafdVBOuV3GBsEhvIiQG+F+ufsJlK3GxnMmltivzrYKRL/LZ/RlVf/SKfaaw+Y
         CT5hJaNEfeZg79oXODS2Fwj/3O8jIaZKAvpye+0xvpzi2sdBJ6Fto8YdlkI4iLpmkq/A
         urTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792141982; x=1792746782;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3K54IdL4RZByTjgnEb8ZCDinU/s/KfGgM+FAnEVJz+c=;
        b=XQh4NVaJrgtnCmbhyvhL+xZZsEBQKIvcJI+3VqRW4bzqnM1Q2VctE7vQkL/JkTO8zG
         GkaHGVZoiuqO9+BRjAPs0XQnph6T8DyVZrAbwqHevN5QDjd4IbOTczpwQbCec+R4YMQD
         QpwwqlftoBkWYfT6NElUBKDoKc0Q6t+sW0Y/z8qlr+LgUyxtzmFuJOLoaGd095md87ft
         Yj6j7VOSzUgJxu44rCkLbSngCQIijSLZ3vEwCjTP428USB7g8SgYMcEE5zhpA07alxMl
         0VI3ARjVLXteblJeFQkdl/BnidsE+nw+pJ2vf4rzPpfyK4HQgebeXtFS1B6vCqlGSZIv
         8RSQ==
X-Forwarded-Encrypted: i=1; AKwUvBz5XyDJE7zFjbHPaPQUsdzB3Fs8MtaMyUIq15HSj2Yd2iJEV2LzwC5gXqjpEk/+HZZsi+AeF59FRr2pToLWZw==@lists.infradead.org
X-Gm-Message-State: AFq9FYJmBDZuMD2Nn2waZXWNJCQ1UblK5P2HZUczO4Z1EHw28U39nv/R
	q2Yt3O8dGUvryYwebb1jeOEx+Av5MQBrzV7tqFwrikz4BnJr0dRJPICY+kqZB2iKpdY=
X-Gm-Gg: AYBFou3Y/+2tLGVgwIOpeS9bHheb7m7IU4BIpKAM9dashUp7IUv1H1rSIm885un/63u
	p4xb6KStD46Ngl+Wif9cHpv69YI6B0GuPdBMa3ToKJQsySSNRfyAvjeN0+dUDuu6FJBJm15nYDX
	IGG+JH4Y/N+zYk/VQRx+xM0QRi3BZu56k0dYbtlBEZrK2rniSnWVXF33Uy2PQYcjk0WmQQLbuUL
	A7E2ejNwht8HjYY/A920Y2GM62LBEdish/aVTmDMKSCVGVI/Ssid5MyFgqFvp9cCHLvqZBMz8H9
	mKa5tuCccGK3drIo4F37T5lnM0mF+ee1gb9lsQL3ZLh5vbFxeM62DdDai8TdqMAWms8kypNrUwI
	5iKonAkAqPLZHAEGC85iu8ZLQSxB/LaT10vEEz3/7CCE9ZBNKYE5k+9Q8/HFq49tJZXGRuwUTqv
	g9J4vGmSWCSxkFQGp45pvMPSxzAEEqHbi7SPqg3wBj6h+HvvSIRmBP4xzR+qAlc+zzld5Ik7RCU
	H3S5RcYtLsiqvKK8/jMwsIa+Oh9xWPFTc1Cdo/4xqUiafQlfg==
X-Received: by 2002:a17:90b:4d10:b0:3ab:e789:ce84 with SMTP id 98e67ed59e1d1-3abe789df31mr14032439a91.65.1792141982237;
        Fri, 16 Oct 2026 02:13:02 -0700 (PDT)
Received: from DESKTOP-VNSSJ2S.localdomain (59-127-145-64.hinet-ip.hinet.net. [59.127.145.64])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd65497e28esm767274a12.7.2026.10.16.02.12.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 02:13:01 -0700 (PDT)
From: Zhi-Jun You <hujy652@gmail.com>
Date: Fri, 16 Oct 2026 17:12:34 +0800
Subject: [PATCH net v5 2/5] net: ethernet: mtk_wed: fix reset condition for
 rx wdma
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-wedfix-v5-2-8b02e78fd34f@gmail.com>
References: <20261016-wedfix-v5-0-8b02e78fd34f@gmail.com>
In-Reply-To: <20261016-wedfix-v5-0-8b02e78fd34f@gmail.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sujuan Chen <sujuan.chen@mediatek.com>, Rex Lu <rex.lu@mediatek.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Zhi-Jun You <hujy652@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792141973; l=911;
 i=hujy652@gmail.com; s=20261016; h=from:subject:message-id;
 bh=ef7Fw6tWRmoS7SAlJ88r6e3K75+WCUkomH/n+4D5raw=;
 b=+PQFTR5s+TTWwx7Z6oJWtXxCv8fvB1yIrErU3O65A0x/ZCM9asxgNMV5LpBxXawCXZOXvZ+QF
 sEZym+shfFOBc3c8pjPDBrbFSHIHqiTE/3NTqOrXjEhY1KjtJmVMjZJ
X-Developer-Key: i=hujy652@gmail.com; a=ed25519;
 pk=AYHrGhtLNb9z7JIsGOOYWmKKIoVPH7ZZgT+CLIDMuEM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_021303_375553_7660BA5A 
X-CRM114-Status: GOOD (  11.47  )
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

In mtk_wdma_rx_reset, only the wdma rings that weren't allocated are
reset which is wrong.

Fix this by inverting the reset condition so allocated rings will be
reset.

Fixes: 4c5de09eb0d0 ("net: ethernet: mtk_wed: add configure wed wo support")
Signed-off-by: Zhi-Jun You <hujy652@gmail.com>
---
 drivers/net/ethernet/mediatek/mtk_wed.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_wed.c b/drivers/net/ethernet/mediatek/mtk_wed.c
index d55042ccaff1..3f0be70c3f14 100644
--- a/drivers/net/ethernet/mediatek/mtk_wed.c
+++ b/drivers/net/ethernet/mediatek/mtk_wed.c
@@ -257,7 +257,7 @@ mtk_wdma_rx_reset(struct mtk_wed_device *dev)
 	wdma_w32(dev, MTK_WDMA_RESET_IDX, 0);
 
 	for (i = 0; i < ARRAY_SIZE(dev->rx_wdma); i++) {
-		if (dev->rx_wdma[i].desc)
+		if (!dev->rx_wdma[i].desc)
 			continue;
 
 		wdma_w32(dev,

-- 
2.47.3


