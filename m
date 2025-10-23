Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5DACCCD1BC
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Oct 2025 14:59:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gFUK3/M2/OMRE/7w/JqieZkjZV+2HO5R7PJSBTyxlH0=; b=fKZahJF9BtANco89Sj9gom66fC
	4ZbdBdQOraHX05vCOt2QTq9aO1TTNWCYyyChnR1vvnVWlWzhnqRd6FMLKidIRITvrAc/VmKW/qZz6
	q4Bzjq8W7G0W6vq53ybJ0TG2xFbhnKi77XlwGxv4LA4rrgPx82aIfZ+dZH4cIT4hTk/TQqT+fUNql
	Y2WyAUUoQ5G0KeGYgIHMdEZQ9x/hxwRZEWTpboFmDLQFxZ9+tS3KqW2UhqxhW7b36HfWP5/snKEyO
	C+llxe+WIyZsYeiNi60lj9cdm2IS3zrvL14nfZCIZs3hn1JXj6+R7ax3DHeLV7kmr86v0av83dRQz
	yULPQBZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBwmY-00000006faj-45Nv;
	Thu, 23 Oct 2025 14:59:14 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBwmR-00000006fVH-1ikR
	for linux-mediatek@lists.infradead.org;
	Thu, 23 Oct 2025 14:59:09 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4711825a02bso7710695e9.2
        for <linux-mediatek@lists.infradead.org>; Thu, 23 Oct 2025 07:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761231545; x=1761836345; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gFUK3/M2/OMRE/7w/JqieZkjZV+2HO5R7PJSBTyxlH0=;
        b=cvUM+hNp7w/q9hr2vJHx7WQytP6AF0z8bNXm5a2X+M12x/BXaphi/fv1vCGqf+tI/9
         W8suYBhBIm0VjDgOGcXAy7FVWtVRqK9EwrQAMl56S6mnFaCVJ1P89Wdw4/Xx8qNMBoAd
         8ZwNCNdfueHWodbeBeQN+MFrFJwAR0A7hJU3MQdWleax1DnezuPtyD30XMViqQTfmrvV
         k84ulurdhc9GfnBxA4I/l7J4tKbcJ9yFSfokFIkS37+T2G8RZG17ahJSoPUboIvpGu4Y
         T70HnVoS7EWg49YfMBw+n3BFfaqUH3D89uGOPACSG+JusCQNFluqfXWwTqVr8yqVjhzK
         etqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761231545; x=1761836345;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gFUK3/M2/OMRE/7w/JqieZkjZV+2HO5R7PJSBTyxlH0=;
        b=Nvvdr8UO04RpIHCLoWRj0NCw810yxIoYabV4aOFgFBpBerCUINLmKrGVbKSU6stJ4y
         TvWf+JsUcQtRjMNnwv2kYpplU9SN7NnZQm4p4yRfekQONKDgnEm5eV0iNXgiJdZVJKyO
         OrmmdAop8+kU5oNXAfrdlW7+9rh01jCgQ/zFvUXMWTYFllRNW47h9WJjpBx+5jzAJg+y
         BUbI3lzdMw7gmYw13XY0mkdWSqpnduTxb5xrPCrWmiD3ExMh9x5IEXl6InQIM098Jane
         D0yCXeY+0KpDuUsd3sUSy6doCkCHPL74qq4QUvEBJvOR7P7DxegJruRbhv5l4BGBVty/
         A/Bg==
X-Forwarded-Encrypted: i=1; AJvYcCUi1B2t/qBS/8JcMatCyzJH3xQ1WItLJdK20CXLeVTQ0Z2ztFvg21PLftpkcKjE5VsplmlCtl14DL/TPbt+TA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzit+q604AI+iN5IxsKyf4wdpS5Du0dL6NbfTX2rmaJVWwHiwal
	rwxgm3rhanxbm5/o8IgOgNiRk5hZ+tULxT7D5kYBlEP8y6UooHjPJSPb
X-Gm-Gg: ASbGncvRyt1MZ+1aQ11gkAL3B7DAMfgG6FZMM0NdGOwjq+r1A0guquqNExM8MQr44Wx
	B/+px2LSyMWV8DIsMben7kLl094jqTLI3tANY4FW+3Dl0ZN8OV9oVrA5/meqvLdmJwapDzZVyNb
	JHL4P8Di69O05QKXRq+OOLPNvL62XHwuTsIxmTWUNpmQqiS8tSE8AJQ4tgukbWIfO+a6Y7AzEr5
	cbBJJsZjCyRbgtHIK0xTliuHHf31yMEKBOpbS/8lC9PDlWT6Dw5nzxSBJwTkaQM7oPNcfh44Rqe
	dU6lvaGFbB3T5E95yb8huyw323ocfqpSpPvNQx8yObeupyLcZ0tCXD1FQ2AZSkIa7XjWtw5uQBz
	esk5KvY5nlCQD8/RCl/i1237SD+UCLoqBr6SxzMIhmlAxDLYj+9zjqp/3ff9D8wcY3FjqNBU8sS
	LtmR2k45/pEJrQWGVWHNuo5ke657QWDg==
X-Google-Smtp-Source: AGHT+IGQzECuos+RCLjKO2dAeV8045JWlHC0U32i9kQFj54vECVk7KXnDT+AfzmBCj2mf9NTLyFiIg==
X-Received: by 2002:a05:600c:3494:b0:46e:4744:add7 with SMTP id 5b1f17b1804b1-47117870715mr200630635e9.7.1761231545275;
        Thu, 23 Oct 2025 07:59:05 -0700 (PDT)
Received: from Ansuel-XPS24 (93-34-90-37.ip49.fastwebnet.it. [93.34.90.37])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-475cae9f292sm39822325e9.5.2025.10.23.07.59.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 07:59:04 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Lorenzo Bianconi <lorenzo@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Russell King <linux@armlinux.org.uk>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [net-next PATCH v2 1/2] net: airoha: use device_set_node helper to setup GDM node
Date: Thu, 23 Oct 2025 16:58:48 +0200
Message-ID: <20251023145850.28459-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251023145850.28459-1-ansuelsmth@gmail.com>
References: <20251023145850.28459-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_075907_463907_8B000397 
X-CRM114-Status: GOOD (  11.72  )
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

Use device_set_node helper to setup GDM node instead of manually setting
the dev.of_node to also fill the fwnode entry.

This is to address some API that use fwnode instead of of_node (for
example phylink_create)

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/ethernet/airoha/airoha_eth.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
index 8483ea02603e..ce6d13b10e27 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.c
+++ b/drivers/net/ethernet/airoha/airoha_eth.c
@@ -2904,7 +2904,7 @@ static int airoha_alloc_gdm_port(struct airoha_eth *eth,
 			   NETIF_F_HW_TC;
 	dev->features |= dev->hw_features;
 	dev->vlan_features = dev->hw_features;
-	dev->dev.of_node = np;
+	device_set_node(&dev->dev, of_fwnode_handle(np));
 	dev->irq = qdma->irq_banks[0].irq;
 	SET_NETDEV_DEV(dev, eth->dev);
 
-- 
2.51.0


