Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF624CD98C5
	for <linux-mediatek@archiver.kernel.org>; Sat, 13 Jun 2026 23:33:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Date:From:
	Message-ID:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=AG/JEc/L0uDc2VwHJweRU+2vbGpFb8TCmkW2psEcnQY=; b=nVYzfxo7SlmiyHP8Ao40kozRel
	2aBGhge9eP3QfbBDfQV7seJNgsrIcwwf8OQCQbKgElcI5wny5YufzgJfpe99g5txZhaXIoogHCEfM
	Gf6TYc9hf/zh5VMnLWvl8vKOQT0+RMybjNXv/hS5L5anGzcVk8pVUcrmCK8dnbJrLNO6OmQnwfkjS
	vCjLMnLQmuMRtU5piWi4L+lHbdZf3Zk0LbXPYDQNQfCetNXrC2BArG8jkK0ZWP6GhD0NsLAJfU4T3
	LFlVl5LxqYd/cYs3Qhj5GAXk9BnvK8IBatgt3YYXvK9J/ni8w+jKUNIazz5fMwcoCbGxxlnIFyCpt
	WmaluG4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYXqz-0000000Cc4k-0l5L;
	Sat, 13 Jun 2026 23:33:29 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYXqw-0000000Cc49-3W1n
	for linux-mediatek@lists.infradead.org;
	Sat, 13 Jun 2026 23:33:28 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-36bdb11bf8bso1225308a91.0
        for <linux-mediatek@lists.infradead.org>; Sat, 13 Jun 2026 16:33:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781393606; x=1781998406; darn=lists.infradead.org;
        h=cc:to:subject:date:from:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AG/JEc/L0uDc2VwHJweRU+2vbGpFb8TCmkW2psEcnQY=;
        b=U5pgXpu9slrZ8m7AaJvQchkWepdYFhvYck/o2D5XZyAs8wQuDmrwBszunyGb0jyVv9
         HB67Jg35Jc6iR7EwJ687Lj0iANSaa8oqwUC+GoI1dkYCMB9lPXwa5AAeVdxkjMR6fhBi
         iut9MlhN2lXWWFXpqcs+dYAjVi3+krLKY7BHMfPKrb7FM7sQci/YLQ8ESseUgpGya0NC
         65LGfxEeS93iemXeVtasH+KMsJo6Yn3S8YCtkaea3hsa4eohr10YiinAJs7KQolpgEOX
         oZkWeCP5alzHOik3+5qkoA/dUc1jgMfEamoTk1G2aJEA5kR77RA8Ws9xamR4YdflcAM6
         WsRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781393606; x=1781998406;
        h=cc:to:subject:date:from:message-id:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AG/JEc/L0uDc2VwHJweRU+2vbGpFb8TCmkW2psEcnQY=;
        b=BccW8rTn5yQ26lOzj9b48eOiEC7C79kwW9ABwVmoFGpDMGJzRetRDzTAoMuivUanp+
         9xJJjDr+NpTQEESRZcWe7+mr2AUoIvolnAyHjjim14zgo4olA27X/ZxwiY/FzwKtIT/8
         l6RlFfm/NYrQqkytbEyaeg/jNlx8bKqmI5eiLuoyc5kS6OynfHooZcNhLMgMfZo7HVZg
         R6zkFKvbAYOb1r+LtPzKgvG0BRRbfAwiA99R4J/lJIdVXnTYmvDDNM4xDWO2ZtGybCvb
         BRwEumIn8Lyzzptw3fWsXTEjS1PXU2DxWfraaRU73fjUGa9O27PtvHqrgsC4W56llxpB
         hzMA==
X-Forwarded-Encrypted: i=1; AFNElJ8VUBjl/RmBuJSgKgAl7lIBg7hLkw6fwYYv17hAdKRrBX00Do6mo+88P3mJlbq+2rmfoqxth6bYpZsIL8IAtg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwcPf6NTczeNM6iJ4X60v3X/dJgKUQ2SrKQvUqRf5W476queiEQ
	sVKwvi3vBr8lSLFpXDBIKAolK0ohg+n5bj7Yt1VsRTA2yFBpEtz7Ohfp
X-Gm-Gg: Acq92OHGnIv7S2xzMPmeC00B8fkB59HUQ1thsnbY+bkKetb7hYJL8fxLt+ybzk+zKKo
	YAtLAmpOL1Qek15kNtmddw/z+w/RVuKl/bMqCx7tz0+mkviU6bjvK30jVbUVZB6N8Ch8Nu4mmOD
	VJw5p6xwAHiKYXFRbRy+dwOdNB0yeb3pEEANrdYCz5gGRSH0S4ibP3csoIP1e30OD9L0jmC89tg
	tviOC4kyETojEqVqSa9Z8MnJQWA3m0cJE35Ga5qJdYldhTOK/tiRuS/UucIacjyNNcGgPdRZizn
	WEJbamF3ZkE+Y445d59ql7+7WIwDp4MjPR6tHPZnpFLcjSRl92v4gJuSwg3UkUQ7aVWpgNn0D/H
	IKqwzaTONVhB3AC4vkc7wPRSpveks12KHxT9BQzqJmRI9WnufXeCz+K38SkRB6dyUh0L5xei/UM
	ONs3/NQFRHY3vu7S8Y
X-Received: by 2002:a05:6a21:1519:b0:3b4:b26e:bab2 with SMTP id adf61e73a8af0-3b783b22db0mr9105274637.2.1781393605822;
        Sat, 13 Jun 2026 16:33:25 -0700 (PDT)
Received: from [127.0.1.1] ([47.253.114.73])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c866519f88bsm5126208a12.27.2026.06.13.16.33.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2026 16:33:25 -0700 (PDT)
Message-ID: <6a2de8c5.2c570c9e.53b1a.0e1b@mx.google.com>
From: "Wayen.Yan" <win847@gmail.com>
Date: Sun, 14 Jun 2026 07:30:54 +0800
Subject: [PATCH] net: airoha: Fix skb->priority underflow in
 airoha_dev_select_queue()
To: netdev@vger.kernel.org
Cc: lorenzo@kernel.org, horms@kernel.org, pabeni@redhat.com, kuba@kernel.org, edumazet@google.com, andrew+netdev@lunn.ch, angelogioacchino.delregno@collabora.com, matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260613_163326_881292_E0050C86 
X-CRM114-Status: UNSURE (   8.59  )
X-CRM114-Notice: Please train this message.
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

Fix by guarding the subtraction: when priority is 0, map to queue 0
(lowest priority), otherwise apply the original (priority - 1) % 8
mapping.

Fixes: 2b288b81560b ("net: airoha: Introduce ndo_select_queue callback")
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



