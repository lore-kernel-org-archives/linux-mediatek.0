Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24871CD98DA
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Jun 2026 12:06:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2mnBr3tjwuDiPitMGmjjZXJEZ7evFYqDmAUAvxZYdi0=; b=sWaxKrVyT+dyzbMEigPWpC8fim
	RbhjLNpwubgJXetS/2OA+Kj0fyOBhkr27V6Gv/PcniN17fhTLqP6DMhh0RD+5hlcPuko+JVQ0WlBp
	4R3SasndP+kSI8nrC5T2eCumksLcLTDm4zJLIlEcezJgLNa3oZ/r7wp10wtsheP9P5pPwJgPdb4Dg
	Sxe0XXlGsj2+Ut3YO57EoT0uJin/v0wds9oMLnfGfBFirWvCxAX1OgcjFrncmlYLFYVXq7YJoATB9
	4umf2/FLqH3DNoUE2Hn5vAEFtmfwtKgE17hjrkY1WAA6DLfe5ffzunRcFShVrbVbkwOXRurhAhRAJ
	qKhqh50w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZSZ9-0000000FkB2-268y;
	Tue, 16 Jun 2026 12:06:51 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZSZ5-0000000Fk9l-36g8
	for linux-mediatek@lists.infradead.org;
	Tue, 16 Jun 2026 12:06:49 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2c0c2a68d01so28220705ad.1
        for <linux-mediatek@lists.infradead.org>; Tue, 16 Jun 2026 05:06:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781611607; x=1782216407; darn=lists.infradead.org;
        h=mime-version:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=2mnBr3tjwuDiPitMGmjjZXJEZ7evFYqDmAUAvxZYdi0=;
        b=VNUyIpHAoaS7x5k8IsvtyZldWxF2yvdGaBJiPWYESLppKcVGp5t2bNtH9IyNxf0D97
         tVAuU5E3QlybKvtZyQqzckwdWzYZa6UOlR10jsMfSAEccU5JIh3b/0wlkUweADQWXCOh
         //y5+DzQFd8NbTVlhNHWh2o2uLIc3zObwzbOxlc+z3PyIA/zyDoG9UolAM8SMafJmsuw
         R2Oxl032WcdDsxAU7djr0kYVsRDzG3kmPdsrVGyWFGfKzUlXEfAqTDSpG6oBBrkybtow
         NkPj15DOnZ+RCDMHYKDRQQ7J63/ePT5IZc2mFf3dWCn66EfIUe7qScvomIFbrSmoTpWE
         CxrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781611607; x=1782216407;
        h=mime-version:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2mnBr3tjwuDiPitMGmjjZXJEZ7evFYqDmAUAvxZYdi0=;
        b=MVNxX+lHWd7floWyY1LhrQ7P5KANSkfy3Qmd8c7IJvJD3X3jXjOTlKAVWegxhqucO3
         sGGaD8fk2MHRhO98ZXoKD1/hbSQSJzcVrgZcugrFwlLXGelBOgA2rBhbZb04Q0D8SFPF
         JkZhAP+GT07nQZo3KonPRtnrMVKcpSTo/59Fo1SeBl+yZo2vyZU3Fbztnp/hEwEjh51X
         F2dwOQrl6KTJH0SqflAiOinUV7+GtFcNSZN0IyMO14eIlMLk3znWlzsHvxAg1VK+E1Mp
         z02evtUJCjQ9UYrgVB07EPaK0HXoq1at7wxpkUq1p7yBvuVlRPlFhhgyVZyKqpxrEnjw
         dwHA==
X-Forwarded-Encrypted: i=1; AFNElJ9tzqqx0nSWSYhIm13Z9CCSkrIL+Ol7iDmHFDbgwxn0bpvdrytTwVPr2BaHtpOZvNBYzT7jwT8YOVGrFN15lQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz3cnva6NH7H7iB8yX9uRIhNxLiyHw6K3eqiDD2/5/Sb88X6LJ4
	pw6v7RIkkSTuNjS1E8sfXAGK4x6yumMn0mlLv44TEYcK0TjA4qCIGU8P
X-Gm-Gg: Acq92OHkLamkuMzESQxRCaPTyLevdhuFy1TKvIRyS0wyOCNsHzDi+lPoPbblsqKD5/4
	mYxtHQqphOIFBgTeDqPO1rL4kSejV/GAPulJhGAQ3x2uVK85QUOBp7ERfCLcOUqsAWvimYIXU66
	cXyoN1ifWX/Co5t3tOR82LTg/7sx1Yg7kp7Skg5z+fPwbwWCveEB3fwNmM6achW12zUoFjaRFoC
	DixHk3EAFECGmRGgJPmsyajYXNe3yy6CVkaNOzJ6UVkWHs5cb66VjWr2s6RUz2Fcxtth6lnVQnq
	5vHVpUkbDvoV2cdTxHUXSQiKqi6JBiyt2KjFRJL6v6vtXAnRwvtXcBfg7Qe8hZq947WfzcxNiJA
	N4MuGrkfw5tq/KybMeblC/e6HkkOGw+Zc5MHDdOBST/Z1QeCl22zgSvtp15yIKsQK8TxYN8LvoD
	sA2z0AwTKSzJ4en8Rj
X-Received: by 2002:a17:902:f549:b0:2c6:96f3:96a6 with SMTP id d9443c01a7336-2c69a1d15f8mr33933655ad.37.1781611606918;
        Tue, 16 Jun 2026 05:06:46 -0700 (PDT)
Received: from [127.0.1.1] ([47.253.114.73])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c4328abe7bsm126562735ad.49.2026.06.16.05.06.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 05:06:46 -0700 (PDT)
From: Wayen Yan <win847@gmail.com>
To: netdev@vger.kernel.org
Cc: lorenzo@kernel.org, horms@kernel.org, pabeni@redhat.com, kuba@kernel.org, edumazet@google.com, andrew+netdev@lunn.ch, angelogioacchino.delregno@collabora.com, matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: [PATCH v2] [net] net: airoha: Clean up RX queues in airoha_dev_stop
Date: Tue, 16 Jun 2026 18:50:48 +0800
Message-ID: <178161160256.2165161.14322392784449633554@gmail.com>
Content-Type: text/plain; charset=utf-8
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260616_050647_844046_855D6A56 
X-CRM114-Status: UNSURE (   9.74  )
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

When the last port is stopped, airoha_dev_stop() clears TX queues
but neglects to clean up RX queues. This can lead to:
- RX ring buffer descriptors remaining valid after device close
- Potential DMA synchronization issues on device reopen
- Risk of use-after-free if pages are freed while DMA is still active

Add cleanup loop for RX queues to mirror the TX queue cleanup,
ensuring symmetric resource management.

Fixes: 23020f049327 ("net: airoha: Introduce ethernet support for EN7581 SoC")
Signed-off-by: Wayen Yan <win847@gmail.com>
---
 drivers/net/ethernet/airoha/airoha_eth.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
index 31cdb11cd7..9ca5bbf64d 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.c
+++ b/drivers/net/ethernet/airoha/airoha_eth.c
@@ -1771,6 +1771,13 @@ static int airoha_dev_stop(struct net_device *dev)
 
 			airoha_qdma_cleanup_tx_queue(&qdma->q_tx[i]);
 		}
+
+		for (i = 0; i < ARRAY_SIZE(qdma->q_rx); i++) {
+			if (!qdma->q_rx[i].ndesc)
+				continue;
+
+			airoha_qdma_cleanup_rx_queue(&qdma->q_rx[i]);
+		}
 	}
 
 	return 0;
-- 
2.51.0



