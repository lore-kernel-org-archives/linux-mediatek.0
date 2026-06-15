Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96D7FCD98C5
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Jun 2026 12:48:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Date:Cc:To:From:
	Content-Transfer-Encoding:MIME-Version:Content-Type:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=an+NyJhpdAxSbgwZ0j7wPX1XyTG7T96Feh4LnwHfKms=; b=WoisblPIXZLVXkYFMSkS5aWIGP
	+3twY8kYvD7MhLw75als1VBnmsU+QryqONGor6XM4OOnQkG1NxmKTG9kY9FNTW5EVBluM/iO+Kyr0
	EBq9GdD9YK2P0MthP+rJUEv/MBuQr/bCzWV5fSr+6Q2rPTByO+g0E71JgdUr3UjG3/Rzh+9KhUlWR
	PeA7CaUCqnnqIyg9XwexxNn5EsW5WDDq7vvaw4ZuiUrINvs3/ZRrmh88KQgYhRu+pPlSTanzQY8pM
	3Z4/vffaFccjG6gH1rzzEhO6peGPwH9ZCPDdVfv+g3f+Fz9ZVzVy56MC7f3V7qs0OThcKoSukFtE8
	6l5T+7Eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ6jm-0000000EEYL-48oy;
	Mon, 15 Jun 2026 12:48:23 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ6jk-0000000EEXb-3Jmv
	for linux-mediatek@lists.infradead.org;
	Mon, 15 Jun 2026 12:48:21 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-84229481d44so1557409b3a.0
        for <linux-mediatek@lists.infradead.org>; Mon, 15 Jun 2026 05:48:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781527699; x=1782132499; darn=lists.infradead.org;
        h=subject:date:cc:to:from:content-transfer-encoding:mime-version
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=an+NyJhpdAxSbgwZ0j7wPX1XyTG7T96Feh4LnwHfKms=;
        b=l4kBEL8nYbwz+q50OknIdGCvYb6wD3NLiuVYrLjiklRLDHIIPSs8HZ+OA43M6SWOG5
         TAtE4QTI/KtlNTIRFGwYSrjQxxyazw69duVAS/Gs9sWLCf0KKWuh7wn+EFZxA8O1x+G0
         jHkJL32yhCsgzFxalukBD/a+5JvBsP7LYwUXOUQzSbgNJp9SKHp13+byScME+eEZ9hrP
         HWHobqkmRl4xeQS8OuEQbkv4tU+3QSUw6G0Fq7LgU1LWOyvkO+XN4rRLc2KUWeQ9ee45
         UJHs5faY/fX+Ph0muBc4nP5EdKKTk6R692Y4UsdfYi32JBehMc/yEgQOHtFS3KpVvNeZ
         uLKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781527699; x=1782132499;
        h=subject:date:cc:to:from:content-transfer-encoding:mime-version
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=an+NyJhpdAxSbgwZ0j7wPX1XyTG7T96Feh4LnwHfKms=;
        b=W/OuBOuu7NPpFTqNr0efK+wTK1ePwnzSVmImOSdFbUdHZXE7VSgAEZsMsJtmwI6Qxp
         YEM16gQy6GTT6IhVeCjDo6R4JpP204zhL3o9JwwoyoLnGfFo0jUZouEu/uSzb6SsY4vx
         Y8IoYozgXd7M/nctkRYMZssm035ETscy5k59gHwBHRdKpdKS6+w7IwxJfeNMG89EYUsv
         ffuKVd/sq4dDDDdiGQMh70WXdwR6cgNWdeB0gD74WBqPPxXc9WVmr33YYZ4HXMhFumYy
         y1AUz332/+h2uw6hjBqOE149S3qcsTr+fmp47vOevgrv75Mkp5d71JAqdfDqztCg7gUS
         kVaA==
X-Forwarded-Encrypted: i=1; AFNElJ8+rIdXlhPyz0MA+2el0yI+8tQfbtmtEJQOhBEqZokDoloUOIpbL4Nqlocg1oOgFQ4jQxhYBVfhbUBpRQxpdA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw3jkej/Tsyg/IPEEzzVXjvJU30SKuAg3IThWQvH8iB6u1JfV0W
	ZpQpOg7JcQvy3H6W33nwM1my9KL8a/1QLKeOCBN75idQ7oxwC8N9C2Vl
X-Gm-Gg: Acq92OH5fN6jUteeKco4mXlnF62KFMti2yPDTymYcwCn+PZExur/+bYknCt5F8y8gnk
	U8oE6Tu7h/qkzRkuT3SNFkgCx0H1AqozEK8/gqgB9Wxn9yPGbc9OGsDm7I40PQlesParYYW9ekH
	p2r1lzroIXoAvIeWe6ZI0yZe8LO191MesuhNGBZuEg5pZaK1xSzLIDlAUdbTuCl9FZlTVdPnHeH
	MRkB0ShkCQSti/4fagrYfITG2Eu93JpoOOYWsoe0389UXMTtfgt/iJHYyKSf0oWn16aPCvVeFx+
	CW6sOWaDnyMQeDRLBajngDDrsc56qVUGASYedbU+tZIor8kOw/zyZvBCO3JYl1baJxszsTkFr1N
	Zkt+ORZRIPgrDRi7wZWKwA4cJBO1VndWwZn5qSucWPPS2evxUbg42hg5Dean6HZrOow/3GkZC2V
	YogqkK9YLek+8FYhUTEXE=
X-Received: by 2002:a05:6a00:23d4:b0:842:2419:6bfe with SMTP id d2e1a72fcca58-844e193a3aamr10771235b3a.7.1781527699379;
        Mon, 15 Jun 2026 05:48:19 -0700 (PDT)
Received: from [127.0.1.1] ([58.240.122.156])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434acffd04sm9949954b3a.26.2026.06.15.05.48.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 05:48:19 -0700 (PDT)
Message-ID: <6a2ff493.5934d26d.389ef4.d16d@mx.google.com>
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Wayen Yan <win847@gmail.com>
To: netdev@vger.kernel.org
Cc: lorenzo@kernel.org, horms@kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Date: Mon, 15 Jun 2026 20:48:13 +0800
Subject: [PATCH net v2] net: airoha: Fix skb->priority underflow in
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_054820_832626_D913200A 
X-CRM114-Status: GOOD (  10.51  )
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

From b894fc031e307f1b6756ea9fcac98e82e23815e1 Mon Sep 17 00:00:00 2001
From: "Wayen.Yan" <win847@gmail.com>
Date: Sun, 14 Jun 2026 07:30:54 +0800
Subject: [PATCH net v2] net: airoha: Fix skb->priority underflow in
 airoha_dev_select_queue()

In airoha_dev_select_queue(), the expression:

  queue = (skb->priority - 1) % AIROHA_NUM_QOS_QUEUES;

implicitly converts to unsigned arithmetic: when skb->priority is 0
(the default for unclassified traffic), (0u - 1u) wraps to UINT_MAX,
and UINT_MAX % 8 = 7, routing default best-effort packets to the
highest-priority QoS queue. This causes QoS inversion where the
majority of traffic on a PON gateway starves actual high-priority
flows (VoIP, gaming, etc.).

Fix by guarding the subtraction: when priority is 0, map to queue 0
(lowest priority), otherwise apply the original (priority - 1) % 8
mapping.

Fixes: 2b288b81560b ("net: airoha: Introduce ndo_select_queue callback")
Acked-by: Lorenzo Bianconi <lorenzo@kernel.org>
Signed-off-by: Wayen <win847@gmail.com>
---
 drivers/net/ethernet/airoha/airoha_eth.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
index 31cdb11cd7..d476ef83c3 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.c
+++ b/drivers/net/ethernet/airoha/airoha_eth.c
@@ -1933,7 +1933,7 @@ static u16 airoha_dev_select_queue(struct net_device *dev, struct sk_buff *skb,
 	 */
 	channel = netdev_uses_dsa(dev) ? skb_get_queue_mapping(skb) : port->id;
 	channel = channel % AIROHA_NUM_QOS_CHANNELS;
-	queue = (skb->priority - 1) % AIROHA_NUM_QOS_QUEUES; /* QoS queue */
+	queue = skb->priority ? (skb->priority - 1) % AIROHA_NUM_QOS_QUEUES : 0;
 	queue = channel * AIROHA_NUM_QOS_QUEUES + queue;
 
 	return queue < dev->num_tx_queues ? queue : 0;
-- 
2.51.0


