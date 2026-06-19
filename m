Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0194CD98F8
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Jun 2026 07:55:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+x0Q9vKRabtFjaGXApa4amcI6ZA0EEYg48FTUvCHSCM=; b=r2arfhbWxfFk/sVC3gQvFq47Ub
	wGryy1gIH0ocmWbXEoBV91FpyPVvDJlF/Ws+6/X4k6au+8w2UIQYKBxirUPZTi/mTIjXVwIYV9A+2
	XHxh4slcmxwQpe6TJXqtWElTeBnOOdObvlE4Ijaf6vd2LzOVfhxWDpvQgPGu71uBtfCFYiZKU4IcP
	P2azZ6vpXgxynRZLQ2qJaQCAWIsxzZQgrwJi+1vQ5xBkc+N26Oxq6KHQ3gqjpoK3hmnVDgZ6z0LnB
	qJahUcDsLzR8RFUG92IfNkaQR+U3OMZIyzdZ/mjK6T/BrnNyFNy3xQW8M4pELbIlyHAhhNo4CLFxx
	tf4S9fCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waU4h-000000028Jw-2jaT;
	Fri, 19 Jun 2026 07:55:39 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waU4f-000000028JC-1yEJ
	for linux-mediatek@lists.infradead.org;
	Fri, 19 Jun 2026 07:55:38 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2c6be9cd7afso8413975ad.1
        for <linux-mediatek@lists.infradead.org>; Fri, 19 Jun 2026 00:55:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781855736; x=1782460536; darn=lists.infradead.org;
        h=mime-version:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=+x0Q9vKRabtFjaGXApa4amcI6ZA0EEYg48FTUvCHSCM=;
        b=jAbeC8VFR8DvhcjXfh4ypQlTMjGHIcT/Qp0bnaFAg7cE3TY/rhfYFfJm9C59sxO3ch
         1/NF4k7fGzJBt+1B90L7E/H4rX9elP6YrlILvSXSgkLePsQcnwWfG5Ebl6Iddvsnl25w
         I3F3qE5jntFs7/nghSeQxdSNMjwZ2qlngifZOEWZsLtPRC4sQS4+acnGHeBt9Zyzm1Rc
         ynMXEiFfuWsTZdcM6pnaBVoON/yVy6VZiAGVI9tHYu61SvWj6VQhrCskS7cjkyVeV2v6
         hwKOwXj2W5M6tabmG3rfzomkZPQ9rWAe1gOq2Tje4pNY3XT2YkzEPQF1yrr6Dajussfd
         KYKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781855736; x=1782460536;
        h=mime-version:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+x0Q9vKRabtFjaGXApa4amcI6ZA0EEYg48FTUvCHSCM=;
        b=YTDrxR51Ix4IZlA0LunG1NWfkXOp/Rdejgol8uAatXcoZSxEA150ua2k48S5jiPsFp
         fZ75nuSNlZ3GdMCk0+wR7Rt2qtw7xKnxRrfMM9M6kwjl+z79YjSZx80SILlbW6O9Q01T
         qI9i2ENIfO+swbAwjii2k/nlIcuRY/gnk838oJMn/Fn3VY0/2MpyQqOe2lKEDiqecNt4
         MNPQYCEGnZJsDoA13Zj8LR7YthAzSXWXXf3RxgXh/zEOccAONqJic66/37b8BA7NIlZ3
         tTDN/ptxHhEc3YNB82ysMKg7GIlbjDas3RYhCC9biwlMvMPdB28Cb0tr6KBUbguEvRIb
         C1Pw==
X-Forwarded-Encrypted: i=1; AFNElJ8QN9u7Uuwe7wO5eS8jfle0o83P3Yq5NPh+aMPO2FfbrKkr9xNF8Drmd3i/1R96SjFZQrKgOBJM7ldzxTYShA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzJAp2FTBx0vaZ5meOqrMRM5pQUCJPENL9sxINbvh1X62JLJaNK
	dRFpkol74i/jbeXo1hJ1zP/irdHK4A3KALpl/ZJ3rr8WiiK2qfJ0Zefb
X-Gm-Gg: AfdE7ckB2ZDA7kak/qd/sdNTFIBXHavVF6ABfa9kw9oaCpn+Q48MWmnwUZHYURHvc+r
	Ki5lAgQkEQRIiT4pZEnqX8v/GBH6GJ7BYmWLtMXVLiTsGaVlwhnfAxYrZRu7+xWcyZkQhobcqq7
	YyXE79muiRhtv+kbiE59QfL9YdA6P8Z8A/GOveo3ALtO80G6jfS9XrgkNsDX9QW334CibKFwpMh
	DOBv6UxjiGXxM2dkvhHHR+jP7VgzcfZ8cAh+rKt+ZnRXPE6e+6njWh5ag5APz7oADbxcgbKyTf3
	Gk80VuDnLVSkYdraOCyFtzM+eA+XhGBrfjgc7Hefi/ktIcVOwwIlORrq81a6w2jioxVPmDrnoc3
	rh3e5x007FNR0XtvrdxmIib8KFushm+yra+CgiPndk+6tzrHeAt2hLOLlcUbNe0HBxHgt9CHst7
	TbGVhaSGsdxJ48+YMs
X-Received: by 2002:a17:902:cf06:b0:2c0:e5ee:f56c with SMTP id d9443c01a7336-2c718fe25a3mr28777415ad.20.1781855736340;
        Fri, 19 Jun 2026 00:55:36 -0700 (PDT)
Received: from [127.0.1.1] ([47.253.114.73])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7209bc296sm15297755ad.49.2026.06.19.00.55.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jun 2026 00:55:36 -0700 (PDT)
From: Wayen Yan <win847@gmail.com>
To: netdev@vger.kernel.org
Cc: lorenzo@kernel.org, horms@kernel.org, pabeni@redhat.com, kuba@kernel.org, edumazet@google.com, andrew+netdev@lunn.ch, angelogioacchino.delregno@collabora.com, matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: [PATCH net v4] net: airoha: Fix skb->priority underflow in airoha_dev_select_queue()
Date: Fri, 19 Jun 2026 15:50:16 +0800
Message-ID: <178185573207.2378135.3729126358670287878@gmail.com>
Content-Type: text/plain; charset=utf-8
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260619_005537_511950_2D66E719 
X-CRM114-Status: GOOD (  10.09  )
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

In airoha_dev_select_queue(), the expression:

  queue = (skb->priority - 1) % AIROHA_NUM_QOS_QUEUES;

implicitly converts to unsigned arithmetic: when skb->priority is 0
(the default for unclassified traffic), (0u - 1u) wraps to UINT_MAX,
and UINT_MAX % 8 = 7, routing default best-effort packets to the
highest-priority QoS queue. This causes QoS inversion where the
majority of traffic on a PON gateway starves actual high-priority
flows (VoIP, gaming, etc.).

The "- 1" offset was a leftover from the ETS offload implementation
that has since been removed. The correct mapping is a direct modulo:

  queue = skb->priority % AIROHA_NUM_QOS_QUEUES;

This maps priority 0 → queue 0 (lowest), priority 7 → queue 7
(highest), with higher priorities wrapping around. This is the
standard Linux sk_prio → HW queue mapping used by other drivers.

Fixes: 2b288b81560b ("net: airoha: Introduce ndo_select_queue callback")
Acked-by: Lorenzo Bianconi <lorenzo@kernel.org>
Reviewed-by: Joe Damato <joe@dama.to>
Signed-off-by: Wayen Yan <win847@gmail.com>
---
Changes in v4:
- Remove the "- 1" offset entirely as suggested by Lorenzo and Jakub.
  The offset was an ETS offload leftover; the correct mapping is a
  direct modulo of skb->priority to AIROHA_NUM_QOS_QUEUES, matching
  the standard Linux sk_prio → HW queue convention. (v3 used a
  ternary guard which addressed the underflow but kept the unneeded
  offset.)

Link: https://lore.kernel.org/netdev/20260617164448.31e189bc@kernel.org/
Link: https://lore.kernel.org/netdev/ajPCgH7E_ke6Fdur@lore-desk/

 drivers/net/ethernet/airoha/airoha_eth.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
index d0c0c0ec8a..9ec3f22754 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.c
+++ b/drivers/net/ethernet/airoha/airoha_eth.c
@@ -1928,7 +1928,7 @@ static u16 airoha_dev_select_queue(struct net_device *dev, struct sk_buff *skb,
 	 */
 	channel = netdev_uses_dsa(dev) ? skb_get_queue_mapping(skb) : port->id;
 	channel = channel % AIROHA_NUM_QOS_CHANNELS;
-	queue = (skb->priority - 1) % AIROHA_NUM_QOS_QUEUES; /* QoS queue */
+	queue = skb->priority % AIROHA_NUM_QOS_QUEUES;
 	queue = channel * AIROHA_NUM_QOS_QUEUES + queue;

 	return queue < dev->num_tx_queues ? queue : 0;
--
2.51.0


