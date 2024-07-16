Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18799C3DA59
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Jul 2024 02:49:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=POQeuwFqxPs3c9WInVyLeovx7yI2dSQuf14N8K8wNFs=; b=q6kqUhRKEo48ACCV+FbtNFe42m
	wcWdv7xmrUuh00zDv1VaQ8Cq6PYIWxbJG+anY9Msuk9lhCr4BGBXbm4MpBUVdQgW3RvrTrELgZN0Y
	CTVnyWWQjSaZVQe6ap5QeN4j9OnJsXnZtvkpKaeGLH3yfGOFQH1tcdTzX0f5+kbx1opX0m6xWp0V9
	38apdaHrU0s6ii8R5iOgwdq1FDmVD5aEehxpa5iKW+3fFtGmgBf2bx8WgsvmekhKnTNuCiibA9Vpi
	ES8mtDmf90CnO6vaMZbcSXBjKugzPGj/U6C0flEZnxVDGAPiEi+UyXxIfwXifShNxU5r+M9l99rk6
	4lsfl0MA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTYG6-000000096Pg-0x0U;
	Tue, 16 Jul 2024 02:49:42 +0000
Received: from mail-il1-x129.google.com ([2607:f8b0:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTYFl-000000096KA-2QMc;
	Tue, 16 Jul 2024 02:49:23 +0000
Received: by mail-il1-x129.google.com with SMTP id e9e14a558f8ab-38713b03039so18744935ab.0;
        Mon, 15 Jul 2024 19:49:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721098160; x=1721702960; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=POQeuwFqxPs3c9WInVyLeovx7yI2dSQuf14N8K8wNFs=;
        b=bIvAdqUyGc2z7oXQzVLI/2SV7cQset6CX+yiCymRO3ix0zDNPFwCjphfG/XMeSeNeP
         lwrItdISg80wL2En80ySsdt44y4Cyth1b294cwDrqpFZ8MSakMU+QXx2egcEb38pJe1a
         1K3KXyueLOUElj3D9lCXThgsk2wRIYnEvylzQAmKdwKSzrEz38NRy/F0vk/8BMnve172
         FtNlDa0cN8so4vBl9tV7GK1z7niBzJ513T+wy4fWCZ3NK39fwCIfuPLL/AnrU1dArstq
         2XbfzBH8vGX1x2BwwzNIpxado1QSucWLS+tlsOw+ctFOK1wFU2zGOZYFgtjTb1e5IGHT
         Qp3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721098160; x=1721702960;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=POQeuwFqxPs3c9WInVyLeovx7yI2dSQuf14N8K8wNFs=;
        b=KEgTNeflNeIHiV4douY3HOCRxXoplGPu9+MRrO8vyrumZ75RuqP5Xeh2kJNd6DZ5j3
         gZ8V7amO73vu90FCaE2miesU1cuid91bUFxKQKvBcrew44gLThz+UJ7ZAkc6d1hjNTEc
         jKAeW91bP4NJEK12lfq13LTN9Sf11Ge1ZZxp6h5aZ5CK6oROaRkdDGMB3824GzPLlLyb
         7PBISR4k65h+o8IkaWfwZ1aSkR2bUxXkpz/4Vl1TO+qgUgIJSZC2HUsGBD3GI37oDOuU
         2wR/xo1cPUe9+7yY8Hk90xz2akvp45bLGo406sURPFNm6PG/mdS16wWfLG2tyqzn2/zX
         YNyg==
X-Forwarded-Encrypted: i=1; AJvYcCW4j1RIhUW1gN90QB5btzLyL1cibRBDlBwIyWAsK3XLNvfUMuJfQjnZYhauvWrKi1dvJiXwUN+k7pQxLGDPlMobqL/sHSDqG6pfm+X/nynz3UfaRmKS94jd27RqVfNtjWi+n6SrzVN4aLIkOs4QekzG5zMhl9kDxXo=
X-Gm-Message-State: AOJu0YxqaSbGk6kxfvM+gymA9h9NQ8sUrfJ30yR4AOI9iYiAU1p4VHuS
	rqv25LKomcCWucDbE3RULCIf5lfRMrhMfz4Gt2fr9/38+bZ072ct
X-Google-Smtp-Source: AGHT+IEjyb2mtrY+P1BKzg6tpcnIJiYfWOfgztUKFB9E4H8vnox3uKWlhBvsBEdFsXQlUyfoLpunmw==
X-Received: by 2002:a05:6e02:1c49:b0:383:71d5:347 with SMTP id e9e14a558f8ab-393d0e2461bmr12484475ab.6.1721098160143;
        Mon, 15 Jul 2024 19:49:20 -0700 (PDT)
Received: from localhost ([2402:7500:577:906:e634:edb:c059:7bd2])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70b7ecc948asm5092078b3a.197.2024.07.15.19.49.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jul 2024 19:49:19 -0700 (PDT)
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
	Jack Wu <wojackbb@gmail.com>
Subject: [PATCH] [net,v3] net: wwan: t7xx: add support for Dell DW5933e
Date: Tue, 16 Jul 2024 10:49:02 +0800
Message-Id: <20240716024902.16054-1-wojackbb@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240715_194921_640510_93CB6E29 
X-CRM114-Status: UNSURE (   9.11  )
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

From: Jack Wu <wojackbb@gmail.com>

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


