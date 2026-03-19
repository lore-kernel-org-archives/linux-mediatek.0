Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 828761088E70
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Mar 2026 03:27:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LJa0hR/irIUiusrwe3oMLmqKlCXFbsoEt4pwhDPj6/4=; b=YpZEBa2X5YzjHJ0SoqR6DS3VZP
	YmIZEL2dWo0Vku0r0CdmgixwcadcN+ViH/LYCJoZ+yfiCfg41/bAaqwtJL4zDtQ4nQYKkY0ECK2xi
	CV33Ftd3u2e0XvID2PkanMkd4gtugQyJM5KY1VXp1e1rgHmFzE7ZRkQDYZeu6u66gIoMY8x9zzLdd
	pxJSvLiyeSj64q6O6Xxj1LFF6MsEPJl3RJeykwJ6Z+MkS89rWI0oe5hOUXbWEqZbi8jt4H1G3zG/m
	bEv7sakvcBeUluKkjo6Ms/k3TtQ52/PNb6c7E206dfKR07/4qqv7qVEOcH8cl2eK7qQx3tCdJWFbq
	tetQQ5aQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w342H-00000009pkn-0jx4;
	Thu, 19 Mar 2026 03:27:01 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w342E-00000009pjj-3Ruq
	for linux-mediatek@lists.infradead.org;
	Thu, 19 Mar 2026 03:27:00 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-666ee394529so294578a12.1
        for <linux-mediatek@lists.infradead.org>; Wed, 18 Mar 2026 20:26:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773890817; x=1774495617; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LJa0hR/irIUiusrwe3oMLmqKlCXFbsoEt4pwhDPj6/4=;
        b=S8kW2+2q3GHkxehe/bG3ivTL0hyOYB+fkruNLAIAnqq3rpehfodlwCyhqFD55fepBL
         QF+yOIvZDuWMB7cNdb29ziVzDjA0+sqGGXCAzv+rq+NXiS0QeoCwYAnMzBqgkYkiJBx/
         btDnQGUvKszGqRDROZG7kLdZHH/AfD4aFESsdkPYifbrKkzIetw5cDodLglsgqT52Hc4
         nfHeX+35rvUEtgS/4bMUmjLrF6fQaorewljq7bpTan8xR4w1P2k3YZgOyoWZsnps754o
         UqsVUoal7+rjVBWSG0sQsqoPsfDc9g1tX06YeBE/5O/YeSnpP6p6hsUqloPn4YgaAmVN
         neOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773890817; x=1774495617;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LJa0hR/irIUiusrwe3oMLmqKlCXFbsoEt4pwhDPj6/4=;
        b=bv+4Q2uutMCc+3P4jV7DRTZz1lEFN5ehINhdVb8dYEhcbbALmoHzl/KfuNobg97f5b
         W36W2y9WRIHu8VLmBUFvYJ84lSGvaaTcrN/7mXiqnmL1S2iHP4n/14VMoDz8qmV1KDus
         jNIzU7KhvvpWw7ORcjZ2QYWjdu5/G0N/+qGclAB2fmXw7n3+nrVtlWoGLpAtUyFSDKns
         rISMIvnELAUiE90fygIn2d67MisN2aT2sZ3lF7b+Mtpu025T1i1RghdEK1Z0eIYmEj2z
         FyTz0yk1UPupcrU+FpqmG/c8pNbWjdo71coSrVqULel1Bj5gTUs3/egQYuWXVfjWt2L/
         qXTg==
X-Forwarded-Encrypted: i=1; AJvYcCUXt9Yo4WK+Mjf2b3U2iXuLK3yXCjGd2j59EThSMZAehjjC//QrbT/X4GDKtajS4Q7e43fT2+ZO7YLnti44Rw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyokn1yvGEAMYyrokotlqJ2nQYS0GCvqs+weu2KBVlINLW75vho
	c3xuNUt2UmAvqMKPk2shi9dnUy3IThVJ0DyzfXp/bXfaQEuuwMbmUKns
X-Gm-Gg: ATEYQzw330zn8AzmBE+9KFMzeMGFStvO3fPmPOyn4DquQpJ+keXHeEtEyX40Q9zOxv+
	PzKAlIcW6rWFQONKj8en+3qsBcAtN+NnACPxByfOAczZQwPlp5J0PkxTrvuOQZkwS5NHPsXOAQf
	dOBN+NgXVPSwmpAQBGFKnKNKf1X/D9ewfJqE7RaGjn4gCFMomK5sowBqaU53EyDE0rMgSxRMhhg
	XQ7qn61C5xe3vJhWmaLM/ruByT4YFBq2RZvlFdax+biihJ6G7ZbdkgYvrUJ4V/0MktaNaqrU+Iy
	nBXbUYMW3PPnhC2jgtWLgjuLhQ/QhTbNMx7x/Zq/Tutvn4XBfWV+7v8pmvL3YML+E3ZeX57n6S8
	74SjSm+t8tGHIeo263+tdMp4jrJMnTb8/PhAhe27awykie5hpXxz5myJCIku6tf+fZUD8WK4ONr
	+6U7w=
X-Received: by 2002:a05:6402:5cd:b0:65b:edef:40b6 with SMTP id 4fb4d7f45d1cf-667b1880976mr3907686a12.6.1773890816443;
        Wed, 18 Mar 2026 20:26:56 -0700 (PDT)
Received: from gmail.com ([2a09:bac5:4e22:2e3c::49b:45])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-667af38d891sm3059684a12.9.2026.03.18.20.26.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 20:26:55 -0700 (PDT)
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
Cc: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: [PATCH net] net: airoha: add RCU lock around dev_fill_forward_path
Date: Thu, 19 Mar 2026 11:26:49 +0800
Message-ID: <20260319032649.337812-1-dqfext@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_202658_862737_593F9FB7 
X-CRM114-Status: GOOD (  10.44  )
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

Fixes: a9af709fda7e ("Merge git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net")
Signed-off-by: Qingfang Deng <dqfext@gmail.com>
---
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


