Return-Path: <SRS0=Nu0C=6Z=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B655EC54E8D
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 May 2020 15:10:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8DB3120643
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 May 2020 15:10:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sYlH+Kbg";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bgdev-pl.20150623.gappssmtp.com header.i=@bgdev-pl.20150623.gappssmtp.com header.b="lGEfjqd/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8DB3120643
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5Ep4sdF1mfVb5oauY9Yco/RuaD5U3XF45aosT0tS5ks=; b=sYlH+Kbg9p9Mqj
	yAnqC/ezwlW/853YEnh+38Ws3fqUPgZP5rhCbpGTlkBFHxdhAjvW2QDfYmN0SD5dVO77ZdN5+0sva
	6LU0JjaMMwNazfJxjLLhORDH7MxxB5/YdKED6efOVHgyjZF9lM8OilIdXXli1vft4fNUz5MPXMPxJ
	SD86gS08dvuXqHCRDSA+teCVz5xD6FPImkNPdYdbuhtFkl0U9+7zF4hTO3JzY0+X0TY6+Dq0emHy5
	zi9hppa1Hl3asF0pGWDiP3bxqV6t545t0JN31rqrTj3eOIFLGlLqsSXMg2FZ05pMpE7Wtopoc87U2
	bnewOvqduAn1yS2jdH5A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jYA4S-0006ZA-LS; Mon, 11 May 2020 15:10:20 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jYA2e-0002UV-76
 for linux-mediatek@lists.infradead.org; Mon, 11 May 2020 15:08:29 +0000
Received: by mail-wr1-x443.google.com with SMTP id l11so5512631wru.0
 for <linux-mediatek@lists.infradead.org>; Mon, 11 May 2020 08:08:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TLMq2XwRgUC25FFpg44rE1jATuYcYABivRm1tKC5XTM=;
 b=lGEfjqd/Aqo91nNbYHQC/XXhvPNRro/VrpfSU0EKrgUiO5UJ0lZXxyaNjy0vwymwSb
 uxwP22CTUu7BkW2bIoeK3qhHOwvoFsYhIhZngMUlHLW4GZlrj2EaI2Od7rJuyEum2hPJ
 mOOddMd5+KhA4BsHVTsFc1TO02ZsDR/PDJsjrmcYeCSNntHIyaYLDAKJYR4kDyHYUkdo
 fa8cnqPq4/GDF/sZDgDOT2ZTLehxieagSqPBErq+zM756mvMYXQKGiraMxfd2vT4/Pq4
 A/Z1mAM/jRHFEXGLC9eB34BPWmePWBU9/Ou4b7W0qT+98gs2/rruU5IXXYcZJR3Y5Amy
 Dh+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TLMq2XwRgUC25FFpg44rE1jATuYcYABivRm1tKC5XTM=;
 b=GuvX+x/1lHYFI3+lJi11iO9o8m1Mvk1KY0ngIePNsX26N998gXTdHb2F22UyiQ6MYo
 KYH4bUowsT3u7hgkqmC83wlZ3j3cAbn2BEWFtmen75ol3WFxwP4OQmB7SDad4XQl/7Eg
 +ZATuWDJe/SWn1G77XbO1xRWx/y5nDKl8gLEBlxmhan0/6W799Sy8slwzd5xWWm18Jpv
 4V9Y78DD7bre50hhvR9f3h5llOjomx4OH0XvRNN5xO8D8unFqPJRJUZ02WrnPUSN5yfX
 VL2EUx7nSDefe60e22q9sF53W6RkaqqPnIE4uSYBioy4JMe90t0rvG0+DlwLtK2lgN6L
 l7aQ==
X-Gm-Message-State: AGi0PubU7G5SLyK6W14HsOFxDyI0LWtaFbw6UBaahNsBX6MSiBk7vzLK
 ULV5dt1Qz6YyIzUzqC4/z4TokA==
X-Google-Smtp-Source: APiQypLrstV08k3pPp3S+tVHPnE3B6GnlgxYC6jtUQXLXJtg4uaQOjgd0DZV0NaM/PAy80Q8A9SMbg==
X-Received: by 2002:a5d:4801:: with SMTP id l1mr18746418wrq.235.1589209706975; 
 Mon, 11 May 2020 08:08:26 -0700 (PDT)
Received: from localhost.localdomain (lfbn-nic-1-65-232.w2-15.abo.wanadoo.fr.
 [2.15.156.232])
 by smtp.gmail.com with ESMTPSA id 94sm3514792wrf.74.2020.05.11.08.08.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 May 2020 08:08:26 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Rob Herring <robh+dt@kernel.org>, "David S . Miller" <davem@davemloft.net>,
 Matthias Brugger <matthias.bgg@gmail.com>, John Crispin <john@phrozen.org>,
 Sean Wang <sean.wang@mediatek.com>, Mark Lee <Mark-MC.Lee@mediatek.com>,
 Jakub Kicinski <kuba@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Fabien Parent <fparent@baylibre.com>,
 Heiner Kallweit <hkallweit1@gmail.com>,
 Edwin Peer <edwin.peer@broadcom.com>
Subject: [PATCH v2 05/14] net: core: provide priv_to_netdev()
Date: Mon, 11 May 2020 17:07:50 +0200
Message-Id: <20200511150759.18766-6-brgl@bgdev.pl>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200511150759.18766-1-brgl@bgdev.pl>
References: <20200511150759.18766-1-brgl@bgdev.pl>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200511_080828_316445_D34DEDF7 
X-CRM114-Status: GOOD (  10.61  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org,
 Stephane Le Provost <stephane.leprovost@mediatek.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 linux-mediatek@lists.infradead.org,
 Andrew Perepech <andrew.perepech@mediatek.com>,
 Pedro Tsai <pedro.tsai@mediatek.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Appropriate amount of extra memory for private data is allocated at
the end of struct net_device. We have a helper - netdev_priv() - that
returns its address but we don't have the reverse: a function which
given the address of the private data, returns the address of struct
net_device.

This has caused many drivers to store the pointer to net_device in
the private data structure, which basically means storing the pointer
to a structure in this very structure.

This patch proposes to add priv_to_netdev() - a helper which converts
the address of the private data to the address of the associated
net_device.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 include/linux/netdevice.h | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/include/linux/netdevice.h b/include/linux/netdevice.h
index 130a668049ab..933c6808a87f 100644
--- a/include/linux/netdevice.h
+++ b/include/linux/netdevice.h
@@ -2249,6 +2249,18 @@ static inline void *netdev_priv(const struct net_device *dev)
 	return (char *)dev + ALIGN(sizeof(struct net_device), NETDEV_ALIGN);
 }
 
+/**
+ *	priv_to_netdev - get the net_device from private data
+ *	@priv: net_device private data
+ *
+ * Get the address of network device associated with this private data.
+ */
+static inline struct net_device *priv_to_netdev(void *priv)
+{
+	priv = (char *)priv - ALIGN(sizeof(struct net_device), NETDEV_ALIGN);
+	return (struct net_device *)priv;
+}
+
 /* Set the sysfs physical device reference for the network logical device
  * if set prior to registration will cause a symlink during initialization.
  */
-- 
2.25.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
