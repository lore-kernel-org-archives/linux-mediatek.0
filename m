Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2C8DC43334
	for <linux-mediatek@archiver.kernel.org>; Sat, 16 Jul 2022 21:47:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=epB7rlrzw6XyEr2+HEifgpL7PVvDrusi3GoURdV5q2k=; b=CxmUuRaEUw3KtNvHS4/QavEsZw
	d2BO28GGv7XXGxXtU/P7hiZk0+PTG7wfDpVB5rcUMvqQ66bhhs6hatCObIn+N5zLF+h7ukrt6EyOQ
	hPUdL87+RonejK+kVhEhHZ65PldANh/N+oa9lh8FRC7wGowqHSgPRzmoPYUM+h9g0rtWY/Ju4wsGz
	R/MTFtbmdrZlh8V3Zq7CfdHTQv/9zxzsN7i8210CnH2jwPp7AvCaZEZ0dQqZl96HYVPUI1I/f8iHI
	Dny/hguf4waU7IzQvl9We7eH8iBe0tDoLkwTvr+Xi7hLnDAJOZr1xwc8sv/wkVjPrGw/PW4XRmRv1
	DtHmgS8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCpcy-000of5-Bg; Sat, 16 Jul 2022 21:47:08 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCpcv-000odH-42
	for linux-mediatek@lists.infradead.org; Sat, 16 Jul 2022 21:47:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1658008020;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=epB7rlrzw6XyEr2+HEifgpL7PVvDrusi3GoURdV5q2k=;
	b=LvkxiRDCfF89BwExC+722hks9pkTzm85AZYVlcfzyl7XLlFueho97/sBIoJ7xGBr1WmuSr
	7qvas7WIxJyembU9I9yORBSV4LT+niTy2zGcqEbN1JHz2fChmIblIkiFL8BugzBIMYSFhv
	Bjw1LNIPU2oUDuatJkJos+0YbJdgqfU=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-8-iCZbI0B1OHmwXU37I6duow-1; Sat, 16 Jul 2022 17:46:59 -0400
X-MC-Unique: iCZbI0B1OHmwXU37I6duow-1
Received: by mail-qk1-f199.google.com with SMTP id e128-20020a376986000000b006af6adf035cso6232174qkc.8
        for <linux-mediatek@lists.infradead.org>; Sat, 16 Jul 2022 14:46:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=epB7rlrzw6XyEr2+HEifgpL7PVvDrusi3GoURdV5q2k=;
        b=R3vmcSpeL3i4qXVs6rFvWXRYH1AFOmJOgzXq6X+Sn9oDfMIxu4uDadRxmQ5RwMtQ+L
         qyMKqwNcyl+sAASBgwvSVPpAhk7epXQ3/Pu4tiH8B+o6e+lLOcDK67vSk6NwBR/6bn8E
         sU5vw5dHKb0V+LX2FpEtG2VkPJUXlxGYisQaQX69fIYFCZH6w7R9+AZ2WFoa26MJHiEd
         6o6IXkTI5eAVa4ub18Vo47CmlU9rJ+iVM7lU7oBRI8mT4xx5/NE8xL2nYb7f1PlqEu4O
         r1RL5YcHb+GM+hmrGGHfo9J3hu8OtVxK5lxHfG8Ar9MonpFfBI4EyB3HY8XJUhKv4J51
         EM2w==
X-Gm-Message-State: AJIora9Z6uNVXPfTDvR/wQZWqISB5FVnKMDpgi3GyHlmcSGF1FMbXKPq
	14I4P/++6BPNXmueFD/kMtevlTwTS7nEdA4+in38FvA9RcQXWc3BpFP3laq6KHe0GWd95BN4isk
	9+s+QrEC0p5jva6zWSib1MBdicFNPJqaY
X-Received: by 2002:a37:2f44:0:b0:6b5:b10d:6f1 with SMTP id v65-20020a372f44000000b006b5b10d06f1mr13314483qkh.519.1658008018874;
        Sat, 16 Jul 2022 14:46:58 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sCWMb1HpZpVkq7nYKBH6ZxTcvmV5ifECAsHhu9bjCZGadDxzE/B/vvdUPRDZA6qJClbqRJjg==
X-Received: by 2002:a37:2f44:0:b0:6b5:b10d:6f1 with SMTP id v65-20020a372f44000000b006b5b10d06f1mr13314475qkh.519.1658008018680;
        Sat, 16 Jul 2022 14:46:58 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com (nat-pool-bos-t.redhat.com. [66.187.233.206])
        by smtp.gmail.com with ESMTPSA id o21-20020a05620a2a1500b006b5cdbbfccfsm5742503qkp.79.2022.07.16.14.46.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Jul 2022 14:46:58 -0700 (PDT)
From: Tom Rix <trix@redhat.com>
To: nbd@nbd.name,
	john@phrozen.org,
	sean.wang@mediatek.com,
	Mark-MC.Lee@mediatek.com,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	matthias.bgg@gmail.com
Cc: netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Tom Rix <trix@redhat.com>
Subject: [PATCH] net: ethernet: mtk_eth_soc: fix off by one check of ARRAY_SIZE
Date: Sat, 16 Jul 2022 17:46:54 -0400
Message-Id: <20220716214654.1540240-1-trix@redhat.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=trix@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220716_144705_259773_AA790BC4 
X-CRM114-Status: GOOD (  10.55  )
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

In mtk_wed_tx_ring_setup(.., int idx, ..), idx is used as an index here
  struct mtk_wed_ring *ring = &dev->tx_ring[idx];

The bounds of idx are checked here
  BUG_ON(idx > ARRAY_SIZE(dev->tx_ring));

If idx is the size of the array, it will pass this check and overflow.
So change the check to >= .

Fixes: 804775dfc288 ("net: ethernet: mtk_eth_soc: add support for Wireless Ethernet Dispatch (WED)")
Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/net/ethernet/mediatek/mtk_wed.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_wed.c b/drivers/net/ethernet/mediatek/mtk_wed.c
index 8f0cd3196aac..29be2fcafea3 100644
--- a/drivers/net/ethernet/mediatek/mtk_wed.c
+++ b/drivers/net/ethernet/mediatek/mtk_wed.c
@@ -651,7 +651,7 @@ mtk_wed_tx_ring_setup(struct mtk_wed_device *dev, int idx, void __iomem *regs)
 	 * WDMA RX.
 	 */
 
-	BUG_ON(idx > ARRAY_SIZE(dev->tx_ring));
+	BUG_ON(idx >= ARRAY_SIZE(dev->tx_ring));
 
 	if (mtk_wed_ring_alloc(dev, ring, MTK_WED_TX_RING_SIZE))
 		return -ENOMEM;
-- 
2.27.0


