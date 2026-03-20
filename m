Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 783A6108B8E2
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Mar 2026 09:43:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MeYQRWtpyoz4pJi30E77WFExzgm8N7NsrkcrHIJmdr4=; b=rezYG21a/ZnBXTelN6S8Usvmxc
	vROKxLotAtPUnxlHZkWjwm8bfWf8L48mQ2ncznawqWIArGtKieUNt2bB79OZQljGzEWAtCLdLWwXg
	VOGz7/mQe1sojIbfc5FdJjOms+xCXlrmmCMlMMrQaExpNw/IDyEnZrqMY0m5FdxwVveA+Zlqlzbu0
	ubLT6sZkyt1XF3bGDacAidbD3pdJfuEz9rlkpk5sIiJfFjJ1SLhIE2Hc+od0MFkRPiIrMEngF2r17
	lZm0MtKqCwxZmUY43jtl45NL/ISd2NMqreGmX5XNCCt/zGSOrZexD/C6aLOgEbniY9u5QL9nin8xF
	B1Ck9GWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3WO9-0000000CVWU-2XZT;
	Fri, 20 Mar 2026 09:43:29 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3WO6-0000000CVUJ-1N5s
	for linux-mediatek@lists.infradead.org;
	Fri, 20 Mar 2026 09:43:27 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-667cc4ec065so2710513a12.1
        for <linux-mediatek@lists.infradead.org>; Fri, 20 Mar 2026 02:43:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773999804; x=1774604604; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MeYQRWtpyoz4pJi30E77WFExzgm8N7NsrkcrHIJmdr4=;
        b=miYWAArHo3rRHzFW9Sgo4Q2r/93GhGfvLkENDhLHN97Mdt3W5tSxOn5p3SppVMihSO
         sxca83HPYiY/uA/h7SdWfzMEIoIWJ9el11XYE8x3N3p0cyLtOAWY7PEJaqPmUt/J9cFn
         g7GZgZmBCPL/G5AJvUrE/ZOdKAx8DENLYf7fo2TEbMM6uPOk6dnEeuwWcBFz5VduqaQU
         hZMI88sTRFR75/O0vMSL9xYp7Ja+fQWnny3wEo4sVpI0+M1RvoMgHla1WmNI0+t7VexV
         pbfjfoVM6SHaQF/W2IVtRHo2HTScXkwcgbhRTpx3H7SwF9eU+oxlX4AKyRf3BS9FQQTs
         4SnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773999804; x=1774604604;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MeYQRWtpyoz4pJi30E77WFExzgm8N7NsrkcrHIJmdr4=;
        b=ZTljhFik9V9hz+ORyxlAAQwblrQZ9/WblRwgfVplAnZo5Ylb3HVsxDRHR7l08A6u8Y
         sFGpYrnu6AJgKH00NSrMwyB9KO+vWWHhp4AKNyGCrbvaWKoKKigfWkSF7KB9Kt8qH9Pk
         1YhAQJFEZr6bhkPxwOIeVBBupV66NuqQbvax3E5riBLpqTZ7kpx0z+ayk9YtH35BhQuk
         M1ctGN774gboqGjP8ZNk2pBB6tf5ZZo748+Drsn7ioBaQyKdD06/AUaz7MbPG5vG+3cW
         OVvhloCoZ5fTP874U+bIsniI4Kk4WtA8kg3HgEYjnKOuAMVlIX3z5z9cB41RMKHDgajh
         EGpQ==
X-Forwarded-Encrypted: i=1; AJvYcCWEc7jwjSERsZV7lIDTqnr+YfiIBEG4Fe4N/PqqsDiaghexNL9/Dx36M+NajUX0E+JSuhQbd0VGUJMXOcC5DQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzS8BBtvEeM6tOfa6dVnagauNZAEghwC0DCNrNCdgDQm1/Fl+i6
	nYoN+BiFnruoMOLLYCRRMzDaXMHU6HO8tpJRAX1ChYJZuY/pXRYIW3XT
X-Gm-Gg: ATEYQzxQnE6NfZ9Ffys+pqD4n1SOEolOuLpKac40soEvThFd27WlO+ytVXlpRLJ5Qz3
	JZr72GvQDLWRxp2Gbh1kssFYbzhmRMeR5dwMbVCNLX/66QDR6RbNdnZgpQWDmsT8S+eyo93+T39
	N3yvfwRjNJQW8+pjIRaDsmn+fI7+uJwnnqIZXm0ZphLmmO0kaJKTBXihuTHYZ43tKtzKSgobZBk
	zW5cn5YqMIFQsErMSEVmsChdikepSY5SJuMRGS4Gi1wPt1OMZkvtcx5tZ2XN1fJb1KnkGZykAR/
	tGqOK3Qfbve8B8eWdmyOkQiXclLRefqp6W8/1hq6ic0BwyuUQ94tjLZsUO4tTJQkH1HdJhjgIji
	o9qNSTgcadjBUHkLuTmPeeefDKN0QAWP8/yO0XWsE+rph//CWRIn9aW0rMDG3+taS1NuoxlzOqt
	wxmhWyDjoCBqG5zg==
X-Received: by 2002:a17:906:7fd0:b0:b98:1425:2977 with SMTP id a640c23a62f3a-b982f39bba4mr150387866b.49.1773999803776;
        Fri, 20 Mar 2026 02:43:23 -0700 (PDT)
Received: from gmail.com ([2a09:bac5:4e21:2e3c::49b:47])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9832f8dff5sm131318366b.24.2026.03.20.02.43.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 02:43:23 -0700 (PDT)
From: Qingfang Deng <dqfext@gmail.com>
To: Lorenzo Bianconi <lorenzo@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Pablo Neira Ayuso <pablo@netfilter.org>,
	Simon Horman <horms@kernel.org>
Subject: [PATCH net v2] net: airoha: add RCU lock around dev_fill_forward_path
Date: Fri, 20 Mar 2026 17:43:15 +0800
Message-ID: <20260320094315.525126-1-dqfext@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_024326_366849_9ADEE01D 
X-CRM114-Status: GOOD (  10.02  )
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

Since 0417adf367a0 ("ppp: fix race conditions in ppp_fill_forward_path")
dev_fill_forward_path() should be called with RCU read lock held. This
fix was applied to net, while the Airoha flowtable commit was applied to
net-next, so it hadn't been an issue until net was merged into net-next.

Fixes: a8bdd935d1dd ("net: airoha: Add wlan flowtable TX offload")
Signed-off-by: Qingfang Deng <dqfext@gmail.com>
---
v2: update fixes tag to the flowtable commit
  - https://lore.kernel.org/netdev/20260319032649.337812-1-dqfext@gmail.com/

 drivers/net/ethernet/airoha/airoha_ppe.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/ethernet/airoha/airoha_ppe.c b/drivers/net/ethernet/airoha/airoha_ppe.c
index ec5ce41dad80..02deb739a1c7 100644
--- a/drivers/net/ethernet/airoha/airoha_ppe.c
+++ b/drivers/net/ethernet/airoha/airoha_ppe.c
@@ -227,7 +227,9 @@ static int airoha_ppe_get_wdma_info(struct net_device *dev, const u8 *addr,
 	if (!dev)
 		return -ENODEV;
 
+	rcu_read_lock();
 	err = dev_fill_forward_path(dev, addr, &stack);
+	rcu_read_unlock();
 	if (err)
 		return err;
 
-- 
2.43.0


