Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87B3DCD1284
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Apr 2024 11:50:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mzV7bmg3PRLALaaFv1RRGYLnCVfom7cRGx1C8pOQ9QY=; b=BMHPBVBrmA/nQvXQcpUtVtZLdW
	p1mIQff2AsD+Wueuqe2lJ+52tFhU23KRy2awSfym+whsbVYuIjdZB6+pQDAxQeWFdaK3HTrECgYvQ
	457ZwKKBHIsIqG7gEa40xjc83ij3b/Eu6p9Rs95Gc00p1hTyzTyVDa3CY7+m+5ewFOMh5GEXuXE5+
	eNLPLPArPwKlPSvGjA3B4hzpfc05I8XOZpOpCC3Dc4aXLEX1O1E6qbyhOuNQLGxN8oeoQezCGDfgA
	oAmvoLJ4i9otkODf3C7FoMbUx0KUIy1dfIqyeHsPcKrqlWLxMskSTnN1VBFvzgoB+IDplVdY9nIK/
	yTvJ1IRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsLbi-00000002RVm-3oJK;
	Thu, 04 Apr 2024 11:50:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsLbW-00000002ROq-0ea6;
	Thu, 04 Apr 2024 11:50:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=mzV7bmg3PRLALaaFv1RRGYLnCVfom7cRGx1C8pOQ9QY=; b=rFfG6KtoPOk9ADiG887dmX7YxP
	KXqHRe4zzEBJZDTt0yvgE1mJa1EDbMUrR6IB+1VPWxyZNe5uOe8vgapUqX+H5AwZKDl0GY0eGwfKr
	y8P0tpOfs780iBlxJpSJS2srHXB2REbQepE6JOCNJUQ3d23G38K7Y3I5pDX1peY036aGVzRummZ31
	Hu7iz2qCszOTg3V/Lw/SyhQONQyzfmKj2IE7x1T4PcxTfTdE6oSLpqUSWh9ZNCh1pQwNFLhgsHrCP
	MUVkOJpeCyrIgUKadIKz+8m5IDkqOW/bqoaRXG1LXnD/UZAxfvg0gyNKdtENbm8JF+rPUVDtqwhH2
	HfFkrYXg==;
Received: from mail-ej1-f49.google.com ([209.85.218.49])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsLbQ-0000000503v-1WAC;
	Thu, 04 Apr 2024 11:50:00 +0000
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a44f2d894b7so119421266b.1;
        Thu, 04 Apr 2024 04:49:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712231393; x=1712836193;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mzV7bmg3PRLALaaFv1RRGYLnCVfom7cRGx1C8pOQ9QY=;
        b=BhytfXx9GG0e50tnKJfRON8u4aPsZ8NkE95QCeYrmBkv+3l37q+5IXHldeJV6NhJwd
         h6Okje4ynZ0WexB3PsTbX7Y1xwSFsNztOdSSslehQZbCAlSgSAbmiyYC+XxHwjXsi32H
         o5QyUl6Hk6nO6v6ld1mX+QGEuWA/EQuQVTX60kJn+wp9vVqx4TIbNk9l/BeI8MrwXSwN
         yd4+kQfUXYfxL1b9FYYI74D+Scy+5nlgFkp8dCu6RfOPMFBwzHIjl5KGOcWhhqI1XfCR
         z58pMQEC9E0UQuYKaR2rQ4N4J6TGyudJtljLmi6kE7cBpYxOCEukGxuqeXey+p7M5tBX
         oD1w==
X-Forwarded-Encrypted: i=1; AJvYcCXXrcnoTzGJdF/EghOY+AVG0UNwr3XGc9zhVR9hhKwFcAc65BrfOrNBZpO6liImR+aS0d2IB99QK6nsMX4YYezzLWIiYLL1gHodIdoSoq2VsjH/myrvGzyvy1vYBJ37vhiZgyIAPPHMy240N0uGYJO2fVOTuVHyDHY=
X-Gm-Message-State: AOJu0YykghbMSsLatuBNnbgNCjYFaIDQd/b6/sLQn60VQ5F7RCVOaYUJ
	lTBG4+E1Qe0ljWZ+HDZ1oBsC3XKzbxmhoirWz0V94XsQNiPxu3Mc
X-Google-Smtp-Source: AGHT+IFRwr8UkzCF3v1iCbSD58Cp7LdwDT3piXnSVvqDLYvXsgnwdp2m56Bo2luANSx21b/6GTr9Pw==
X-Received: by 2002:a17:906:3017:b0:a4e:23a1:9ede with SMTP id 23-20020a170906301700b00a4e23a19edemr1357499ejz.36.1712231392669;
        Thu, 04 Apr 2024 04:49:52 -0700 (PDT)
Received: from localhost (fwdproxy-lla-004.fbsv.net. [2a03:2880:30ff:4::face:b00c])
        by smtp.gmail.com with ESMTPSA id i3-20020a170906a28300b00a4e2f966196sm7943347ejz.86.2024.04.04.04.49.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Apr 2024 04:49:52 -0700 (PDT)
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
	Jiri Pirko <jiri@resnulli.us>,
	Simon Horman <horms@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: [PATCH net-next v3 1/5] net: create a dummy net_device allocator
Date: Thu,  4 Apr 2024 04:48:41 -0700
Message-ID: <20240404114854.2498663-2-leitao@debian.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240404114854.2498663-1-leitao@debian.org>
References: <20240404114854.2498663-1-leitao@debian.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240404_124957_824723_93FD6F43 
X-CRM114-Status: GOOD (  19.10  )
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

It is impossible to use init_dummy_netdev together with alloc_netdev()
as the 'setup' argument.

This is because alloc_netdev() initializes some fields in the net_device
structure, and later init_dummy_netdev() memzero them all. This causes
some problems as reported here:

	https://lore.kernel.org/all/20240322082336.49f110cc@kernel.org/

Split the init_dummy_netdev() function in two. Create a new function called
init_dummy_netdev_core() that does not memzero the net_device structure.
Then have init_dummy_netdev() memzero-ing and calling
init_dummy_netdev_core(), keeping the old behaviour.

init_dummy_netdev_core() is the new function that could be called as an
argument for alloc_netdev().

Also, create a helper to allocate and initialize dummy net devices,
leveraging init_dummy_netdev_core() as the setup argument. This function
basically simplify the allocation of dummy devices, by allocating and
initializing it. Freeing the device continue to be done through
free_netdev()

Suggested-by: Jakub Kicinski <kuba@kernel.org>
Signed-off-by: Breno Leitao <leitao@debian.org>
---
 include/linux/netdevice.h |  3 +++
 net/core/dev.c            | 54 ++++++++++++++++++++++++++-------------
 2 files changed, 39 insertions(+), 18 deletions(-)

diff --git a/include/linux/netdevice.h b/include/linux/netdevice.h
index 0c198620ac93..544767d218c0 100644
--- a/include/linux/netdevice.h
+++ b/include/linux/netdevice.h
@@ -4517,6 +4517,9 @@ static inline void netif_addr_unlock_bh(struct net_device *dev)
 
 void ether_setup(struct net_device *dev);
 
+/* Allocate dummy net_device */
+struct net_device *alloc_netdev_dummy(int sizeof_priv);
+
 /* Support for loadable net-drivers */
 struct net_device *alloc_netdev_mqs(int sizeof_priv, const char *name,
 				    unsigned char name_assign_type,
diff --git a/net/core/dev.c b/net/core/dev.c
index 818699dea9d7..4d0109f2fe80 100644
--- a/net/core/dev.c
+++ b/net/core/dev.c
@@ -10412,25 +10412,12 @@ int register_netdevice(struct net_device *dev)
 }
 EXPORT_SYMBOL(register_netdevice);
 
-/**
- *	init_dummy_netdev	- init a dummy network device for NAPI
- *	@dev: device to init
- *
- *	This takes a network device structure and initialize the minimum
- *	amount of fields so it can be used to schedule NAPI polls without
- *	registering a full blown interface. This is to be used by drivers
- *	that need to tie several hardware interfaces to a single NAPI
- *	poll scheduler due to HW limitations.
+/* Initialize the core of a dummy net device.
+ * This is useful if you are calling this function after alloc_netdev(),
+ * since it does not memset the net_device fields.
  */
-void init_dummy_netdev(struct net_device *dev)
+static void init_dummy_netdev_core(struct net_device *dev)
 {
-	/* Clear everything. Note we don't initialize spinlocks
-	 * are they aren't supposed to be taken by any of the
-	 * NAPI code and this dummy netdev is supposed to be
-	 * only ever used for NAPI polls
-	 */
-	memset(dev, 0, sizeof(struct net_device));
-
 	/* make sure we BUG if trying to hit standard
 	 * register/unregister code path
 	 */
@@ -10451,8 +10438,28 @@ void init_dummy_netdev(struct net_device *dev)
 	 * its refcount.
 	 */
 }
-EXPORT_SYMBOL_GPL(init_dummy_netdev);
 
+/**
+ *	init_dummy_netdev	- init a dummy network device for NAPI
+ *	@dev: device to init
+ *
+ *	This takes a network device structure and initialize the minimum
+ *	amount of fields so it can be used to schedule NAPI polls without
+ *	registering a full blown interface. This is to be used by drivers
+ *	that need to tie several hardware interfaces to a single NAPI
+ *	poll scheduler due to HW limitations.
+ */
+void init_dummy_netdev(struct net_device *dev)
+{
+	/* Clear everything. Note we don't initialize spinlocks
+	 * are they aren't supposed to be taken by any of the
+	 * NAPI code and this dummy netdev is supposed to be
+	 * only ever used for NAPI polls
+	 */
+	memset(dev, 0, sizeof(struct net_device));
+	init_dummy_netdev_core(dev);
+}
+EXPORT_SYMBOL_GPL(init_dummy_netdev);
 
 /**
  *	register_netdev	- register a network device
@@ -11063,6 +11070,17 @@ void free_netdev(struct net_device *dev)
 }
 EXPORT_SYMBOL(free_netdev);
 
+/**
+ * alloc_netdev_dummy - Allocate and initialize a dummy net device.
+ * @sizeof_priv: size of private data to allocate space for
+ */
+struct net_device *alloc_netdev_dummy(int sizeof_priv)
+{
+	return alloc_netdev(sizeof_priv, "dummy#", NET_NAME_UNKNOWN,
+			    init_dummy_netdev_core);
+}
+EXPORT_SYMBOL_GPL(alloc_netdev_dummy);
+
 /**
  *	synchronize_net -  Synchronize with packet receive processing
  *
-- 
2.43.0


