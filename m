Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 215C0C282EC
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Mar 2025 01:25:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hlQ8zGSiXC2UMWrLxIq5J480S5wYp1oqhkE9P9/QTxY=; b=QIRaUO61JCE8Kodsn+2DiFyU3A
	f/XHQZMsbW2aH2aXIonkkUHx4tOClfFhNRobnI9oReG6cnKimDX8z4KFlEW0xGkOhAeogA8QNEQt2
	0SJXPbypC6+IX0ros4tTto5G4Z+y1JyAk02NaHAit6WSxn5Hc/5Dydx7ryoVX7WrifWwPWnre7Ebz
	VrkIkUbDiv8esdi/6PKWLf8aR0hC88WqfGB9HKoMiaKT9o3WDaIsCfJPv8pYxmvvQ/GVb/pxRUEIL
	/y20Z/pbYA3SKzrwUEL3WE5h4gFWq7rzV+6G4RcWCYo1VweTyFQWMifmnElSyo9Y07l0oACH40HNW
	luiFWwZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsAqf-00000007JXS-1b3O;
	Wed, 12 Mar 2025 01:25:29 +0000
Received: from mail-oi1-f173.google.com ([209.85.167.173])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsAqd-00000007JWy-2s2w
	for linux-mediatek@lists.infradead.org;
	Wed, 12 Mar 2025 01:25:28 +0000
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-3f6a92f2328so218487b6e.0
        for <linux-mediatek@lists.infradead.org>; Tue, 11 Mar 2025 18:25:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741742726; x=1742347526;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hlQ8zGSiXC2UMWrLxIq5J480S5wYp1oqhkE9P9/QTxY=;
        b=SQxAv7WEtpmB1p1ypKmVV2iRR/X7btOrHFCU9YvddLK0sDk52LkFzSehp/vxM9vCD3
         MeH2VqoqSPn7H03kg+KpyVhVQft4mFY9puaSpvkgjcir7I4FsLfUSfc4g7cB/o3h1Pum
         DBfI8iHR3Y54Ul4mwBSAv3ohHe93TlcZg+lzlwsBafUYscGZv4gZ/dDZEqxjPVJ02TGk
         en/JwE3Lq3BIcbMcwKEXnv3Lu+bIisoLkKH0jlJ5qY3vPsF6ZQ2WmnbBRDUG0TMck0IV
         z7lEMlCRMXgWmx8JUa41Hf1pRyHeHZuPr7rezKPEI8TEUDhqdtH5HbpHsBiX8CR7mhWD
         EJFQ==
X-Forwarded-Encrypted: i=1; AJvYcCWocYCQx5SHnoLTZXVToFIwBW40PIxMyAMIBwURzptKyoUcFMed3VzQGbn+1hPCZI3VUOqM/QgAiZtfvqVobQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwJZEMO6FhNgTa/py8XUsKdK2Et95DlkAgDC1RjaETBGbGTXRSR
	kc/kKYeOalc9i4wMnXEYvoDlu9UbwGRbXCoFH1VzuS9cq3elyO/G4/K3Rw==
X-Gm-Gg: ASbGnctYpJ4lKzV8KagRx6XBYRvjh+ivHEH71J80itHYAV9SHQK50y4xhBTIENGfwMw
	Wf0Jl6tCDm8orUNNao+Ci1Lt9xge1XGVcpoiPBv8il9y7Fc6YbNhXq1y07mluWEt/ddRgcT/Uqe
	uqkVzxqbl+/DrG05UMbrbloiqHxmP1lgggqDT6iQDiyqHiMIqmHcVRx1wy8PxWl1p6ynZscxun0
	lKQndhq1QnW7/QxsqCL0J55omtpAwVDvFR/chmImTOxKo+LVvCwW1kJLXlhAF395pVoqrpu3KcR
	Fys8kxOq4s/QNcK7mygMva9SWRnJaXpKxBpDQqvMzJNqXyJg3TsEzz12+MhSOA==
X-Google-Smtp-Source: AGHT+IHUHVqGRHi1FiHDLSZpilZtJwCnpP7CO+C8rk9WvHyA0Y80iswmxtal4O25p0GjBlCr+YNcJw==
X-Received: by 2002:a05:6808:38c6:b0:3f8:7727:88cd with SMTP id 5614622812f47-3fa2b7eda13mr3313051b6e.7.1741742726566;
        Tue, 11 Mar 2025 18:25:26 -0700 (PDT)
Received: from sean-ThinkPad-T450s.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3f9ff1c6696sm650888b6e.42.2025.03.11.18.25.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Mar 2025 18:25:25 -0700 (PDT)
From: sean.wang@kernel.org
To: marcel@holtmann.org,
	johan.hedberg@gmail.com,
	luiz.dentz@gmail.com
Cc: linux-bluetooth@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Sean Wang <sean.wang@mediatek.com>,
	Pedro Tsai <pedro.tsai@mediatek.com>,
	Felix Freimann <felix.freimann@mediatek.com>
Subject: [PATCH] Bluetooth: btmtksdio: Prevent enabling interrupts after IRQ handler removal
Date: Tue, 11 Mar 2025 18:25:22 -0700
Message-Id: <20250312012522.53604-1-sean.wang@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_182527_723549_4B63627B 
X-CRM114-Status: UNSURE (   9.15  )
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

From: Sean Wang <sean.wang@mediatek.com>

Ensure interrupts are not re-enabled when the IRQ handler has already been
removed. This prevents unexpected IRQ handler execution due to stale or
unhandled interrupts.

Modify btmtksdio_txrx_work to check if bdev->func->irq_handler exists
before calling sdio_writel to enable interrupts.

Co-developed-by: Pedro Tsai <pedro.tsai@mediatek.com>
Signed-off-by: Pedro Tsai <pedro.tsai@mediatek.com>
Co-developed-by: Felix Freimann <felix.freimann@mediatek.com>
Signed-off-by: Felix Freimann <felix.freimann@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/bluetooth/btmtksdio.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/bluetooth/btmtksdio.c b/drivers/bluetooth/btmtksdio.c
index bd5464bde174..edd5eead1e93 100644
--- a/drivers/bluetooth/btmtksdio.c
+++ b/drivers/bluetooth/btmtksdio.c
@@ -610,7 +610,8 @@ static void btmtksdio_txrx_work(struct work_struct *work)
 	} while (int_status || time_is_before_jiffies(txrx_timeout));
 
 	/* Enable interrupt */
-	sdio_writel(bdev->func, C_INT_EN_SET, MTK_REG_CHLPCR, NULL);
+	if (bdev->func->irq_handler)
+		sdio_writel(bdev->func, C_INT_EN_SET, MTK_REG_CHLPCR, NULL);
 
 	sdio_release_host(bdev->func);
 
-- 
2.25.1


