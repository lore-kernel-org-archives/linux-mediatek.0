Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48FD5CD1284
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Apr 2024 13:04:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6rK4LbBslMJoYxe1V0vNkJlOAiQK9SERrvEQRmx4wfo=; b=qOzEVhoH0s/OQeLSNHr21p0cCK
	o+7u/GRGhk1l+9AwtxxuvI9TPAY/AX1Ws4YUuuzPMQeKXw410SfLB2i6ms8FG2L0ivsyXvYDzVmHP
	v3Ig6RB9M3hz/zkR4S5XsQ9Eu+tYm+t4Oe550dcjhsJ+uQOMbg3Z5egni6Rpv4/W+I687d/N2IE7o
	sNE+7TNuQmYqQE/QhELqrSd72400Tb2ABInUyKdWEhFb2tCpoeFfrzlooTJvFXmK7KhQ5OEKajcK0
	TS6IJv5faKKCdS51xvwLA6qNRI1OYV/MU8ZebbcgII6NtqKF6d8fe7VZ2ha8UIS/aq8cPVi1K9E4r
	npvSKtxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsMlj-00000002ksd-3YtE;
	Thu, 04 Apr 2024 13:04:39 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsLbV-00000002ROe-3DD8;
	Thu, 04 Apr 2024 11:50:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=6rK4LbBslMJoYxe1V0vNkJlOAiQK9SERrvEQRmx4wfo=; b=mvPGWvJZKSlWgH6OKngbhHM28Z
	pZLYfLSmyE9LcWkpUPLFd/FhV1vq24gZpLcIxo5l3T0KdV5QGiEQ0B01oAqJIs6r4tTYbIwA9jUKU
	V4oQY8u+4Fz5nfszOVhHkOt7nkZIz81ucUPO0WoqKsEzMPoOY6+DHoecYdh6N2bZx+8qifzruuyE7
	NMKPNdDI3lerVHgozwnay6+Zh5vNAwe8QpL9D/sJfDcI2VJ3sD0zXDzFNfHo+g4l+pZLBvgwIUUwA
	D0UaZjcK1CGvGrNzNMljalgb52YmR40X5fVQeKQF1Sazdcbs5AVRAdCoIU6BiGX548KwTU/0w64qb
	+MJj+Yxw==;
Received: from mail-ej1-f45.google.com ([209.85.218.45])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsLbR-0000000504G-0A5U;
	Thu, 04 Apr 2024 11:50:00 +0000
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a5193f56986so33048266b.0;
        Thu, 04 Apr 2024 04:49:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712231395; x=1712836195;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6rK4LbBslMJoYxe1V0vNkJlOAiQK9SERrvEQRmx4wfo=;
        b=Blq++injDubdNyC1aoCl6JSXmxE3O6gpUPChGQClmZZh8+QuVOS0ISdLVX0rypGQBK
         +sdwfoiEJkW6yOmYksD7/ULLlfD/4iFj/n+qDzvRSofVV8mEtkqucFmP/HIEzkngIh5p
         siX4dbvDjUa4v3d8MU5YuaKoW/3YtBIc8pRPRpRajZYNE0KM87vPrEmdk5E25MUVtK4m
         cNRD1AI5mAkBgC4JqEj6vPpYQEf56bIHJgbCqYHFrIXpI7EX5+arUuHrYrxWSCNVDYER
         PCLBW6/ghPGKT3O399s9HzQnHWLsa1yXArw84cRI/rpLyTl5m8ruYSNp/5n6pkGEVc9+
         eL1g==
X-Forwarded-Encrypted: i=1; AJvYcCXdo3UwBkKnzOJxbBnca0t6BK+Ch6rd1vl/lm2URaMPIBZAvLiegR2WJYBVlY8iK4zkN1vpqxZtj04TKejUmUFcz3fjjkNnWOPGVI6DpIgrhRfAwEXSJbykHNto9JLIEvLzTdFNu0Kwz7s6TOZBAKZ/4AXD1aJ+E6M=
X-Gm-Message-State: AOJu0YxkZs/g3IRl7QsEQ1k1X2ZCjDsxAkkitcxm3MJ/ntICIZKP/2b2
	IN5vxaNeN/NHqVcvgiz1lnDJPuVORKBeAe4ZqsN/d/uPSMUohPpB
X-Google-Smtp-Source: AGHT+IFiS9SjmfSMSBb39k+37Klq9CVWs+kxx7A6ljynarXFtE2kNTHt2mNLj4dlY5GiGWVD+iOD9w==
X-Received: by 2002:a17:906:f859:b0:a4e:8a80:92ed with SMTP id ks25-20020a170906f85900b00a4e8a8092edmr1450248ejb.39.1712231394724;
        Thu, 04 Apr 2024 04:49:54 -0700 (PDT)
Received: from localhost (fwdproxy-lla-008.fbsv.net. [2a03:2880:30ff:8::face:b00c])
        by smtp.gmail.com with ESMTPSA id wg8-20020a17090705c800b00a4722439646sm8893849ejb.117.2024.04.04.04.49.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Apr 2024 04:49:54 -0700 (PDT)
From: Breno Leitao <leitao@debian.org>
To: aleksander.lobakin@intel.com,
	kuba@kernel.org,
	davem@davemloft.net,
	pabeni@redhat.com,
	edumazet@google.com,
	elder@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	nbd@nbd.name,
	sean.wang@mediatek.com,
	Mark-MC.Lee@mediatek.com,
	lorenzo@kernel.org,
	taras.chornyi@plvision.eu
Cc: quic_jjohnson@quicinc.com,
	kvalo@kernel.org,
	leon@kernel.org,
	dennis.dalessandro@cornelisnetworks.com,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	bpf@vger.kernel.org
Subject: [PATCH net-next v3 2/5] net: marvell: prestera: allocate dummy net_device dynamically
Date: Thu,  4 Apr 2024 04:48:42 -0700
Message-ID: <20240404114854.2498663-3-leitao@debian.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240404114854.2498663-1-leitao@debian.org>
References: <20240404114854.2498663-1-leitao@debian.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240404_124957_861428_81BCBB29 
X-CRM114-Status: GOOD (  11.70  )
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

Embedding net_device into structures prohibits the usage of flexible
arrays in the net_device structure. For more details, see the discussion
at [1].

Un-embed the net_device from the private struct by converting it
into a pointer. Then use the leverage the new alloc_netdev_dummy()
helper to allocate and initialize dummy devices.

[1] https://lore.kernel.org/all/20240229225910.79e224cf@kernel.org/

Signed-off-by: Breno Leitao <leitao@debian.org>
---
 .../net/ethernet/marvell/prestera/prestera_rxtx.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/marvell/prestera/prestera_rxtx.c b/drivers/net/ethernet/marvell/prestera/prestera_rxtx.c
index cc2a9ae794be..39d9bf82c115 100644
--- a/drivers/net/ethernet/marvell/prestera/prestera_rxtx.c
+++ b/drivers/net/ethernet/marvell/prestera/prestera_rxtx.c
@@ -96,7 +96,7 @@ struct prestera_sdma {
 	struct dma_pool *desc_pool;
 	struct work_struct tx_work;
 	struct napi_struct rx_napi;
-	struct net_device napi_dev;
+	struct net_device *napi_dev;
 	u32 map_addr;
 	u64 dma_mask;
 	/* protect SDMA with concurrent access from multiple CPUs */
@@ -654,13 +654,21 @@ static int prestera_sdma_switch_init(struct prestera_switch *sw)
 	if (err)
 		goto err_evt_register;
 
-	init_dummy_netdev(&sdma->napi_dev);
+	sdma->napi_dev = alloc_netdev_dummy(0);
+	if (!sdma->napi_dev) {
+		dev_err(dev, "not able to initialize dummy device\n");
+		err = -ENOMEM;
+		goto err_alloc_dummy;
+	}
 
-	netif_napi_add(&sdma->napi_dev, &sdma->rx_napi, prestera_sdma_rx_poll);
+	netif_napi_add(sdma->napi_dev, &sdma->rx_napi, prestera_sdma_rx_poll);
 	napi_enable(&sdma->rx_napi);
 
 	return 0;
 
+err_alloc_dummy:
+	prestera_hw_event_handler_unregister(sw, PRESTERA_EVENT_TYPE_RXTX,
+					     prestera_rxtx_handle_event);
 err_evt_register:
 err_tx_init:
 	prestera_sdma_tx_fini(sdma);
@@ -677,6 +685,7 @@ static void prestera_sdma_switch_fini(struct prestera_switch *sw)
 
 	napi_disable(&sdma->rx_napi);
 	netif_napi_del(&sdma->rx_napi);
+	free_netdev(sdma->napi_dev);
 	prestera_hw_event_handler_unregister(sw, PRESTERA_EVENT_TYPE_RXTX,
 					     prestera_rxtx_handle_event);
 	prestera_sdma_tx_fini(sdma);
-- 
2.43.0


