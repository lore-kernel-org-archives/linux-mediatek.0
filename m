Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA8BBCD1292
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Apr 2024 11:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CsBGQlMm+F00sLCL/qlkhF4TnT6nst/CdHn7pOQlov8=; b=wNziIsI+P9WxBjw5s7jwxxzPd/
	9xbQEWAGj4uO3J83wT3vE0p76AVdFHGdHnTlWuq+OTsqVTxK+/le6oukaqfNyHx8tVGxrr60fm85d
	1h0FtHj9UIAIMOOqYJETLQXCyw4LnbC6UwGIixIuv/glrGZ/lRJixpsma7T34HMYtX+mxAOrYFugL
	mbYcx3jIDTzNlSUxCKT//U1IqNra9ddv59Fuo2LnjKVHL8waxrCrXJIkNLG0nGPVdrSoj0HBJvjr3
	iTRUKoET7lBD8AQ5YMTDzSk8Osbvm00IPdr27u+frmT6CBz3EFNkZmh/5xKnWDXWl0lM7694I/+Zu
	iy8wHkfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsLbz-00000002RjE-1Ve2;
	Thu, 04 Apr 2024 11:50:31 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsLbm-00000002RXO-0F1K;
	Thu, 04 Apr 2024 11:50:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=CsBGQlMm+F00sLCL/qlkhF4TnT6nst/CdHn7pOQlov8=; b=j84fBuYSvCAW68x0F800Qs+QMu
	NLsl49UE1tUmPYbhG14lW2w6EdmBA72SXzh6LDFFw5Bj0HV0a/ClVatzpxUcpbJVp8Etp+8HIWf5m
	PWLNVcPOiQh+0L6QMdX3bIfvxYGLZXPwlYXVnWx03JogAapuz0Z4tvLUju+HpJwyesiKlWpory3Si
	H4i5AWSUPqkHB6jGJJcr2yndT8gsDuCVGU9gS2RT/dOAKfGjE4+kwXilhkxDjsmF39Q2VwovCOz/L
	Mj6SBMMbu40a8OJHUwnpjjWROWBzcpR+2SSvSOPwqJeiElUVLEpX1UKn2+imrIxVxtl9LLc8Az/iT
	7oWTdgKg==;
Received: from mail-ej1-f50.google.com ([209.85.218.50])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsLbZ-00000005081-1Ann;
	Thu, 04 Apr 2024 11:50:07 +0000
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a51969e780eso12639066b.3;
        Thu, 04 Apr 2024 04:50:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712231404; x=1712836204;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CsBGQlMm+F00sLCL/qlkhF4TnT6nst/CdHn7pOQlov8=;
        b=C3AwvcFcjzLQNY63Rb016s180GtNhO5bNr5d7NCuS7hvLqkq8M16Mm/sTM+ekbMdi2
         6gJ29OjomAjsMviKLpB7OiU8EmSASqfS7yt2dC0HtDuL/vtUEjI22Fs6Ep2KmQzf5+xr
         DnVT2OCyMS5h0TQCmXaclzrpHZ93xjlYq1zBYRF5+l8mmX5dzZ3IPH7e3f9dYlrcCRwN
         dWVW1BdUoi5IJ7C3fz6w0zC0p67ptPChX0TyxMdl6aNJJD2iSSLr/Kc3YPIEuoG88Kqf
         07ScG/lfZ/WS5u6CLiFUr34S7RRfbLOvg2XvXFKUsReScZ8XFtD0PXvoGPxrukg/LVMe
         6tOQ==
X-Forwarded-Encrypted: i=1; AJvYcCVJJggslAsRAORaQQTS2hCKa46WrgMeWdcJls9hCJWlaGnfJNnzEEiBFxAddEBdvD5snNr9Q9zOxeb9QFfc2NfNzgQeQqFgvq4f7PRRQ+nm9jPZGTJYn4txaMhCX+CqAGe4OvjCTj0HB30+Dr8umsHCXXyaPezE1MU=
X-Gm-Message-State: AOJu0YwOyjB8SqCCeUxJuL1SuwCE60tVknMBOWudpj6xui8Bv8nNukh8
	i2xLnSHAoa0Kx1N5TTEbE9GicSrMXRyXKBjrX9Cypw+IxCjxgniA
X-Google-Smtp-Source: AGHT+IHFg0zyk2NS23/A1etHV8JcM7ibRi4errBqUEIZrG9N7OZjtPtXrBCEmEH5SFyOsilQGUWU4Q==
X-Received: by 2002:a17:906:22d6:b0:a51:9449:6fa1 with SMTP id q22-20020a17090622d600b00a5194496fa1mr328854eja.15.1712231404025;
        Thu, 04 Apr 2024 04:50:04 -0700 (PDT)
Received: from localhost (fwdproxy-lla-119.fbsv.net. [2a03:2880:30ff:77::face:b00c])
        by smtp.gmail.com with ESMTPSA id wz5-20020a170906fe4500b00a4e7a0a1c04sm4030319ejb.110.2024.04.04.04.50.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Apr 2024 04:50:03 -0700 (PDT)
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
	bpf@vger.kernel.org,
	Simon Horman <horms@kernel.org>,
	Rob Herring <robh@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH net-next v3 5/5] net: ibm/emac: allocate dummy net_device dynamically
Date: Thu,  4 Apr 2024 04:48:45 -0700
Message-ID: <20240404114854.2498663-6-leitao@debian.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240404114854.2498663-1-leitao@debian.org>
References: <20240404114854.2498663-1-leitao@debian.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240404_125005_856887_67F5037F 
X-CRM114-Status: GOOD (  13.23  )
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
 drivers/net/ethernet/ibm/emac/mal.c | 14 +++++++++++---
 drivers/net/ethernet/ibm/emac/mal.h |  2 +-
 2 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/ibm/emac/mal.c b/drivers/net/ethernet/ibm/emac/mal.c
index 2439f7e96e05..d92dd9c83031 100644
--- a/drivers/net/ethernet/ibm/emac/mal.c
+++ b/drivers/net/ethernet/ibm/emac/mal.c
@@ -605,9 +605,13 @@ static int mal_probe(struct platform_device *ofdev)
 	INIT_LIST_HEAD(&mal->list);
 	spin_lock_init(&mal->lock);
 
-	init_dummy_netdev(&mal->dummy_dev);
+	mal->dummy_dev = alloc_netdev_dummy(0);
+	if (!mal->dummy_dev) {
+		err = -ENOMEM;
+		goto fail_unmap;
+	}
 
-	netif_napi_add_weight(&mal->dummy_dev, &mal->napi, mal_poll,
+	netif_napi_add_weight(mal->dummy_dev, &mal->napi, mal_poll,
 			      CONFIG_IBM_EMAC_POLL_WEIGHT);
 
 	/* Load power-on reset defaults */
@@ -637,7 +641,7 @@ static int mal_probe(struct platform_device *ofdev)
 					  GFP_KERNEL);
 	if (mal->bd_virt == NULL) {
 		err = -ENOMEM;
-		goto fail_unmap;
+		goto fail_dummy;
 	}
 
 	for (i = 0; i < mal->num_tx_chans; ++i)
@@ -703,6 +707,8 @@ static int mal_probe(struct platform_device *ofdev)
 	free_irq(mal->serr_irq, mal);
  fail2:
 	dma_free_coherent(&ofdev->dev, bd_size, mal->bd_virt, mal->bd_dma);
+ fail_dummy:
+	free_netdev(mal->dummy_dev);
  fail_unmap:
 	dcr_unmap(mal->dcr_host, 0x100);
  fail:
@@ -734,6 +740,8 @@ static void mal_remove(struct platform_device *ofdev)
 
 	mal_reset(mal);
 
+	free_netdev(mal->dummy_dev);
+
 	dma_free_coherent(&ofdev->dev,
 			  sizeof(struct mal_descriptor) *
 			  (NUM_TX_BUFF * mal->num_tx_chans +
diff --git a/drivers/net/ethernet/ibm/emac/mal.h b/drivers/net/ethernet/ibm/emac/mal.h
index d212373a72e7..e0ddc41186a2 100644
--- a/drivers/net/ethernet/ibm/emac/mal.h
+++ b/drivers/net/ethernet/ibm/emac/mal.h
@@ -205,7 +205,7 @@ struct mal_instance {
 	int			index;
 	spinlock_t		lock;
 
-	struct net_device	dummy_dev;
+	struct net_device	*dummy_dev;
 
 	unsigned int features;
 };
-- 
2.43.0


