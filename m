Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BCADCD1296
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Apr 2024 11:50:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ui1DJxKv+GCSubTCimqVqNTb9BwhV0yVlSdcCwIQq1A=; b=IE+mbTwtn8KaDmRxFL+9Zjfrbg
	x7IeUcpjLM7VVCuIIGWfMC0Hv7tS77EyXht/Y/oJK6xkwOfcvPM/x0LkFGFx9PyOxNAo9nqCTe22C
	WDe8glh0HZqiSAJ/1gO1SXdZQXKDTIzi2uxRjda5KUXzCcyk8Sdy1sR8O/pKTNKVKhQpxCHvPP5Le
	0ich9jXLT8ssK0eFJmSnRuTzU6z6uKBVKur9tUA6oY6/8DdPieqgdsaJHDxrEZ2e5dmGtgetEFd18
	5ViKO9xqUGHQOxGcimUfEProZccR7Hm3rxXrlR1+X26s0jsC8alitVibivG9WD7avLzEk3SN+XUTM
	TlzqVUtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsLbm-00000002RYA-1q4l;
	Thu, 04 Apr 2024 11:50:18 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsLbY-00000002RQq-1rRG;
	Thu, 04 Apr 2024 11:50:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=Ui1DJxKv+GCSubTCimqVqNTb9BwhV0yVlSdcCwIQq1A=; b=AnkMn9PuQY2oSFnGDGyESWVl5j
	3OKKj/T0vZA9GgV0weG7ZorZ5noSsL6QVikrXCpXkwTCCp388i3RdbZgFCGslJLjhFOqTaGNJr/NS
	gM79c05E35xiFjyzvurkbyBGlfnPkt5pyp00/G9aLqPDFHiqP16d5jXTKu7879Zt1QyyKapFbXfJv
	A+R9QNoLxgmoxKxZ5zFoVw37KLmoRePlIkTiDVKTSr9kPeQLhAygRz4/1PIcWazKBRvWbxJhHAxbm
	aa0CxJe2UI9wM0sdxeBtFyarkB132f99WX+DvcOrKrTBH5HWOUChnSFuqk2ZZ1f4yAhSjHvK1GkBR
	Q3i6vmZg==;
Received: from mail-ed1-f46.google.com ([209.85.208.46])
	by casper.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsLbU-00000007xHW-3NOv;
	Thu, 04 Apr 2024 11:50:03 +0000
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-565c6cf4819so3550687a12.1;
        Thu, 04 Apr 2024 04:49:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712231398; x=1712836198;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ui1DJxKv+GCSubTCimqVqNTb9BwhV0yVlSdcCwIQq1A=;
        b=JLia5ir6NyvBvVjyCULqTq8Xz6rkNWtGaHmFGx1EY4ZvIECKCWU4F+ZRh2OVCXNexP
         u0F/nR2rmtY5NdAYVNk2lHWjTx7LdrPCeG+RMR4UcdzESrrkHaPmkVhSZ/Vt/AeYIttZ
         T0EFsbZ7EQGyENx3rqEXWS1zAwVKkUo046eIQDSeDQU9ufoEnhCax79NDdgMEMl/ElY7
         zFvoeUsKPhEyvdgx220bLhS0K3DETfEPcmNCDT7ixVlXnnXDAq0piRQN5sCZWQzNI54C
         jyRv0c/ZwIeiO7+rt0htHHtOPhvhaKPy4t3XbCdgq8SfZn0ZVnDEoA37QuujcOetg1fD
         M4nQ==
X-Forwarded-Encrypted: i=1; AJvYcCUipFX0epa9XLs2kGPtP4kipm/Qo5p2g6eF00exy1VMoKxVBlLv0Irs9z3x0fbemZ7czIbOfPQfu3W1SeTSS8Zdokkjy11lJtbcSctkcunrqBVjAfjFjI0SHGgpylHFpSq+ZS5+Y/CqypCXbT9U0ebY+Tsd1urBxTY=
X-Gm-Message-State: AOJu0YxSOszm1Uoo4xwMcAwVmrfXC1R1wM6bnY4NlZT9DvNfXURdRqsA
	hhRoNFI0alBJwcLABI2AJULm1JiFuZyb0SqOYF4stxasc8qlJOhSZaMm7MNY
X-Google-Smtp-Source: AGHT+IGR/2cl7VV3Nm0oPydh1R3stQjygMPvAFpJJaxHSUjjTaaXgqGOaWjKnswlTpZmIr4PxMZ4eA==
X-Received: by 2002:a17:906:d9c5:b0:a51:964f:c3e4 with SMTP id qk5-20020a170906d9c500b00a51964fc3e4mr178315ejb.5.1712231398570;
        Thu, 04 Apr 2024 04:49:58 -0700 (PDT)
Received: from localhost (fwdproxy-lla-116.fbsv.net. [2a03:2880:30ff:74::face:b00c])
        by smtp.gmail.com with ESMTPSA id wk8-20020a170907054800b00a4e2d7dd2d8sm8166265ejb.182.2024.04.04.04.49.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Apr 2024 04:49:58 -0700 (PDT)
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
Subject: [PATCH net-next v3 4/5] net: ipa: allocate dummy net_device dynamically
Date: Thu,  4 Apr 2024 04:48:44 -0700
Message-ID: <20240404114854.2498663-5-leitao@debian.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240404114854.2498663-1-leitao@debian.org>
References: <20240404114854.2498663-1-leitao@debian.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240404_125000_863281_2A6FB03D 
X-CRM114-Status: GOOD (  12.97  )
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
 drivers/net/ipa/gsi.c | 12 ++++++++----
 drivers/net/ipa/gsi.h |  2 +-
 2 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ipa/gsi.c b/drivers/net/ipa/gsi.c
index 9a0b1fe4a93a..d70be15e95a6 100644
--- a/drivers/net/ipa/gsi.c
+++ b/drivers/net/ipa/gsi.c
@@ -1730,10 +1730,10 @@ static int gsi_channel_setup_one(struct gsi *gsi, u32 channel_id)
 	gsi_channel_program(channel, true);
 
 	if (channel->toward_ipa)
-		netif_napi_add_tx(&gsi->dummy_dev, &channel->napi,
+		netif_napi_add_tx(gsi->dummy_dev, &channel->napi,
 				  gsi_channel_poll);
 	else
-		netif_napi_add(&gsi->dummy_dev, &channel->napi,
+		netif_napi_add(gsi->dummy_dev, &channel->napi,
 			       gsi_channel_poll);
 
 	return 0;
@@ -2369,12 +2369,14 @@ int gsi_init(struct gsi *gsi, struct platform_device *pdev,
 	/* GSI uses NAPI on all channels.  Create a dummy network device
 	 * for the channel NAPI contexts to be associated with.
 	 */
-	init_dummy_netdev(&gsi->dummy_dev);
+	gsi->dummy_dev = alloc_netdev_dummy(0);
+	if (!gsi->dummy_dev)
+		return -ENOMEM;
 	init_completion(&gsi->completion);
 
 	ret = gsi_reg_init(gsi, pdev);
 	if (ret)
-		return ret;
+		goto err_reg_exit;
 
 	ret = gsi_irq_init(gsi, pdev);	/* No matching exit required */
 	if (ret)
@@ -2389,6 +2391,7 @@ int gsi_init(struct gsi *gsi, struct platform_device *pdev,
 	return 0;
 
 err_reg_exit:
+	free_netdev(gsi->dummy_dev);
 	gsi_reg_exit(gsi);
 
 	return ret;
@@ -2399,6 +2402,7 @@ void gsi_exit(struct gsi *gsi)
 {
 	mutex_destroy(&gsi->mutex);
 	gsi_channel_exit(gsi);
+	free_netdev(gsi->dummy_dev);
 	gsi_reg_exit(gsi);
 }
 
diff --git a/drivers/net/ipa/gsi.h b/drivers/net/ipa/gsi.h
index 42063b227c18..6b7ec2a39676 100644
--- a/drivers/net/ipa/gsi.h
+++ b/drivers/net/ipa/gsi.h
@@ -155,7 +155,7 @@ struct gsi {
 	struct mutex mutex;		/* protects commands, programming */
 	struct gsi_channel channel[GSI_CHANNEL_COUNT_MAX];
 	struct gsi_evt_ring evt_ring[GSI_EVT_RING_COUNT_MAX];
-	struct net_device dummy_dev;	/* needed for NAPI */
+	struct net_device *dummy_dev;	/* needed for NAPI */
 };
 
 /**
-- 
2.43.0


