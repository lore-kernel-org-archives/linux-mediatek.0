Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC785CCD1B9
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Oct 2025 19:33:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gFUK3/M2/OMRE/7w/JqieZkjZV+2HO5R7PJSBTyxlH0=; b=4tzfM+V0sTHLAaRwTN+EwaU/lP
	6J8fELEQrWJr6rJrLvMkeF/qSRBncVLJxUP+EDcfPj4I8xny+0OLzof4tiESm8iCp1GkofZX+5rz1
	5RVf1vSfrxCPjpYe4ZtMkM9lEZH+zB4mtGn5hOFcuAClWQMRr1vEqeQG2opEbECuS1jODsmrSFSmS
	E+oHKGcFKR7KCtK1ExQVi+P/djcvmGOuIGF4aA9s1VmcHurEewjRDFm00KBs4kHC0kjvzmDpRYh3x
	LF7fN6hHOrqEB4H76JfHpNKX0hWgK9DD4qP7IerHOvYTfpakDAv8zrmhdjAYx1u71GCAxlCE4/0lh
	oFds1WCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBI6z-00000000V2H-0Oex;
	Tue, 21 Oct 2025 19:33:37 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBI6q-00000000Uxv-4037
	for linux-mediatek@lists.infradead.org;
	Tue, 21 Oct 2025 19:33:31 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4711f156326so46478395e9.1
        for <linux-mediatek@lists.infradead.org>; Tue, 21 Oct 2025 12:33:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761075207; x=1761680007; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gFUK3/M2/OMRE/7w/JqieZkjZV+2HO5R7PJSBTyxlH0=;
        b=REuR8xuRA/chjGHgOj8SLGfOFftXwF1f4R7gdWwoXEGwlSc0AO/63DWMCeLf0TT82Z
         VQbhdujIvZHodk9UCH/La8Ph2s8f4daoRQpjuHWw/c8VtzaJOUTvn1ROfchePk3TgzqH
         nvtfjkl4sqKJ+1vQMQyeRv+w3P7Ab4tl0NWyUStG0siwi9j0iozp3aHOhDZRhm93Koyg
         OKEYpoJdw/aSbN3rUEAtX+F5Q4Y3NckJ/JJGyht7UNMIp23cMQKeEGqPq+I4vqtIVJnC
         CJ71JOJEqS3v61EG0763C7JwbHC6bSvz8fukcw/cjMkdlK00xbd4DZkI1pd9ljZLtZdX
         g2Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761075207; x=1761680007;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gFUK3/M2/OMRE/7w/JqieZkjZV+2HO5R7PJSBTyxlH0=;
        b=h7GzM74BfxqBPyn9vvipUSUVDIHGJxLXmIDxqlxxqoXVVWP54kwomFawBiQkDJhn0V
         xcD9Ho0A1QB1LwLSFe0vvkhQtferF5AAcKFfXinRreXZ7ifceoXCSaXjKhBaYAFKIqvQ
         9OCQdbvQqv8VfADNKEABR0CWLlyXi1cmfI7/q24OdtJpuUS21tQgfWxuM0c48BdwcRZ7
         K3xZ8NJrc0MuMV3mpp32aKaP87o1vZNJjzx/Is2HYcehiLl5x/w/0FpKT7TuYXPgaGe+
         k2teAY3oOvyfYyr6SFq50HnA4ylyHcowM1XSXNW+DfPC40iZeio/1VpH71+9NwGIudv7
         BhCw==
X-Forwarded-Encrypted: i=1; AJvYcCU31wEnx+3xkLbIqsRKOWAKRuZSnRbt8Y28sWXY2XxekZja0lckSRkpMsK486uBi4LBVauT+9Zf5chYk7Cx/Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YygyRgTGm1eaq4aLFiKtE254rjB6ewCtsoTk74eXEmauCsZT5Oo
	jAqBnArxgbmgID52CcLX+jeLCWQsQwzkVq3/soqOAcL1uYi57hKxrMedkJchyA==
X-Gm-Gg: ASbGnct/NVuIH8etSZleLAggtoy927oeIcYAKrdRaeLCLEwiqWBxsHxLQFIWF+5Cobr
	Er68gGWWGe4iM6/gHZHubQDKP3kzFvc3dHtdnsjxTKkVpM3f2eURnskH52gmjpxbHnu7MOVsLKz
	8lpdvBw1shwpFkLCgunKqwCLbGF5UTyACgrs9QDKN1rEzJiJf0mXobaD8mwIAG+ZGAsGF+yD/el
	kpUIpCrm/5nP8TCvKjNxejCt28Ymt0ue+HKAr7O6OQWZB2AKgzuwwtQ3vVtspa+d+k/I/ILHJa2
	99lAvhSL4OCRTcVaaKuPDeu+jMEGX0ZWIeZBSAS/eOIRTHdqBMYTkb+FaD6kRdEFv55GOJj/x9+
	2ndJ8Q3oD9B6tZOeWASIHYqnLLGe3NQgpdFwIKZL1y48QQKt5uaCY6stSjJWkNqd0lU7SoFSz7p
	/HqvPcbsahCXKfQPTKlq1C/SXMwzrD8p1f
X-Google-Smtp-Source: AGHT+IH2bGg1MypnCbkNL1KvMQcoGo9pVkFOJRpGUB8Vak6PvFEbE3s2pNvi9PmCY/UqdtGimE4Phg==
X-Received: by 2002:a05:600c:3f08:b0:470:ffd1:782d with SMTP id 5b1f17b1804b1-47117876a19mr152001025e9.6.1761075206980;
        Tue, 21 Oct 2025 12:33:26 -0700 (PDT)
Received: from Ansuel-XPS24 (93-34-92-177.ip49.fastwebnet.it. [93.34.92.177])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-427f00b97f8sm21327187f8f.36.2025.10.21.12.33.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 12:33:26 -0700 (PDT)
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
Subject: [net-next PATCH 1/2] net: airoha: use device_set_node helper to setup GDM node
Date: Tue, 21 Oct 2025 21:33:11 +0200
Message-ID: <20251021193315.2192359-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251021193315.2192359-1-ansuelsmth@gmail.com>
References: <20251021193315.2192359-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_123329_018338_0007D2F4 
X-CRM114-Status: GOOD (  12.05  )
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


