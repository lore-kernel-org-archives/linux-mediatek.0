Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A5F4C3271E
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Jul 2024 06:10:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hbgeEFeW1rvJhEB4MfgZ6aOvwNGbhGVs1MY4OIv8ZiI=; b=kZDoWFFGnVxor7cq8Ygx3RJVJX
	lboYPH+fdT7m7Yd2KQyKaoIxw5nuT/xSb3HO0pw6nkW+gvdLGsY1YTy3TT7tZGjS9XTbvajFOMvAu
	LFPjJoWU6z4o3Oh1RbieIBv7eVpwABbUBG/Jn6gSVbzksEu10yPWrBGsm5RoSJL8aQq30YarOn/5B
	LRFR26kTiYltJAtx9cL7s4ksiNT6A2fmjGhRmatrqLrh5e0qyLUFlxMkKW/euxJgW3kXO58mdcxwC
	3t/2l6u7ZPFDnkQIqqEkzvcU5R9ee1SscJ4jDIwd17nvVYLcMKv64jBEFRj5z6p2URJKPi8AZA6ez
	E6VbMl2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRn0s-0000000CrKW-42TE;
	Thu, 11 Jul 2024 06:10:42 +0000
Received: from mail-ot1-x332.google.com ([2607:f8b0:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRn0b-0000000CrDz-0fx7;
	Thu, 11 Jul 2024 06:10:26 +0000
Received: by mail-ot1-x332.google.com with SMTP id 46e09a7af769-703d5b29e06so226184a34.2;
        Wed, 10 Jul 2024 23:10:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720678224; x=1721283024; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hbgeEFeW1rvJhEB4MfgZ6aOvwNGbhGVs1MY4OIv8ZiI=;
        b=KDKc+wil77EBe8uYXY4mCEunOPQ+U471oQyp0lLvtRek7kJVSKTnQozSFgYVNvbBck
         BK9YRimxXjRPxL5OoCMENHFxXjki19h3gap107jQ+U2PmIVrmu2cq25X9+Y3SYW00MtN
         D5LBwxKgw0vy0Rs9mPisYys3/6kTIUlzcLFofYr5bgpAaS/quc7Zpk79EC2nTa3wOoNX
         blQuVn1PT4J9p3kTnyMEuJh7jULFK1jLRlas9WHai3iskgvP+zUJ3PkRKGcHuutpSvi7
         oPkM3i8WAhCzo0VtZPPBZPY8X41wjJtV8BfRjL17lU9E+Lx/asZvcB6BvCmVLbfYAX9t
         0t6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720678224; x=1721283024;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hbgeEFeW1rvJhEB4MfgZ6aOvwNGbhGVs1MY4OIv8ZiI=;
        b=FkAHpXqM0vgDPYu3O1XKn12OAWZr9IXCkV8aofUzWiiD4tqOoPOileAaj94ua2d5c7
         B0sQmgT30ZCFbhIx/bOTa8H7GhwH877plB+O8V16ElbamBmFT6ODOAtUrI/ebpcoBg45
         YmLqqKzXIOn1fDS28XspAQx4vL9KNglE2n1Byb4HAPTpd1Q2JBJnnwY9GJ7yLHfManZT
         gFwYNvl+6kYuIw8m23953wu9/XbdmN8oDblN6BmmHTD3Zbpm5k69vphdYT+FWgnjNJis
         6j9OUUCfQQCZyLwuPA4jcDBtmJ4PZUDma7WEaqjSJkfUBywgUWLqHT1GbKE/qv0DPiIf
         QgSw==
X-Forwarded-Encrypted: i=1; AJvYcCVTZLryYiWRcwA9vH3cmj9RPB2BXoFrJbucCZ+Ei3HZfzi6L9XYSo5uyvriLM8oK2taua+mU2z1mdbZ3O+t0H1kf5HHdiEpGpDKlBo1PiKnZdgsdaIB528N/96jgijPUb03Gb9BtSW4+YRnsvpLKFiq7EivteH3ZFM=
X-Gm-Message-State: AOJu0Ywd7LVhbDEfBb/LNTj7GLPrvQdbWlXkA2Z2iEB3yav3Cuz0JKfV
	zq6N4+zF2i/2CK2rllBsCr466yb7DX9DHO+ZR+NMlLXtIsvQZ8hY
X-Google-Smtp-Source: AGHT+IHn7/BN32F1Wd/dNunrw0sPOK/6A9cLFCDhJ6SjGFWn05IcdDp6Pq4LFVhKiBy2QShFZ2/XQg==
X-Received: by 2002:a05:6830:5:b0:704:494e:fa1c with SMTP id 46e09a7af769-704494efaa6mr5108601a34.5.1720678223595;
        Wed, 10 Jul 2024 23:10:23 -0700 (PDT)
Received: from localhost ([2402:7500:477:cd01:80d2:d16c:b02e:82fd])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-77d66cb5359sm3165325a12.70.2024.07.10.23.10.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jul 2024 23:10:23 -0700 (PDT)
From: wojackbb@gmail.com
To: netdev@vger.kernel.org
Cc: chandrashekar.devegowda@intel.com,
	chiranjeevi.rapolu@linux.intel.com,
	haijun.liu@mediatek.com,
	m.chetan.kumar@linux.intel.com,
	ricardo.martinez@linux.intel.com,
	loic.poulain@linaro.org,
	ryazanov.s.a@gmail.com,
	johannes@sipsolutions.net,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	linux-arm-kernel@lists.infradead.org,
	angelogioacchino.delregno@collabora.com,
	linux-mediatek@lists.infradead.org,
	matthias.bgg@gmail.com,
	jackbb_wu <wojackbb@gmail.com>
Subject: [PATCH] [net,v2] net: wwan: t7xx: add support for Dell DW5933e
Date: Thu, 11 Jul 2024 14:09:59 +0800
Message-Id: <20240711060959.61908-1-wojackbb@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240710_231025_222428_DDA29AB0 
X-CRM114-Status: UNSURE (   9.17  )
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

From: jackbb_wu <wojackbb@gmail.com>

add support for Dell DW5933e (0x14c0, 0x4d75)

Signed-off-by: Jack Wu <wojackbb@gmail.com>
---
 drivers/net/wwan/t7xx/t7xx_pci.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wwan/t7xx/t7xx_pci.c b/drivers/net/wwan/t7xx/t7xx_pci.c
index e0b1e7a616ca..10a8c1080b10 100644
--- a/drivers/net/wwan/t7xx/t7xx_pci.c
+++ b/drivers/net/wwan/t7xx/t7xx_pci.c
@@ -852,6 +852,7 @@ static void t7xx_pci_remove(struct pci_dev *pdev)
 
 static const struct pci_device_id t7xx_pci_table[] = {
 	{ PCI_DEVICE(PCI_VENDOR_ID_MEDIATEK, 0x4d75) },
+	{ PCI_DEVICE(0x14c0, 0x4d75) }, // Dell DW5933e
 	{ }
 };
 MODULE_DEVICE_TABLE(pci, t7xx_pci_table);
-- 
2.34.1


