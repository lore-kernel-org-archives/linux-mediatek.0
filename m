Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9BDBCD98F2
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Jun 2026 06:46:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yx01qzHYL7zapV7JT7OmgAtxcHhwEqISMkYtU1aw3M4=; b=26UQTtWUZkUAExlx4F+zVxRDWx
	OceG8RcbsX7sHqkll8WnJF3/KSyyS6glnlI6xz7KtT1crIweYPxK0xkqWSu196SxWuh2h8n72dR9T
	KPDyT7/0NFcuRc4VpEX+TSYnyVciFWwf3419dX5mBTxQr9RAtsx6eemDAnNgd0EPwF2utao2QTUp1
	Z6uudVJwRL8uKsJq2GN/5UmO45zOSv6kv1OV/z18Tapiy2rSKw9zeeKsOKeuaQnVo97wc2KzJvdI+
	prE/L8rBGquh1txqkt6pQtbHvVJFM2hJrOWcFmMb3L0mmjrjHr91w9U+XEhEvXBr2KQTmrQRloLQD
	pKoCtZkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZk2C-0000000GjZP-2zUw;
	Wed, 17 Jun 2026 06:46:00 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZk28-0000000GjWy-479t
	for linux-mediatek@lists.infradead.org;
	Wed, 17 Jun 2026 06:45:58 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2c0aa420401so39822135ad.3
        for <linux-mediatek@lists.infradead.org>; Tue, 16 Jun 2026 23:45:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1781678756; x=1782283556; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yx01qzHYL7zapV7JT7OmgAtxcHhwEqISMkYtU1aw3M4=;
        b=b2s05HOinOFEUELEsbMGUm/7mocwB2N64LyJI1fpEsKfdWaQQ3b5O1Y50qH91E4tws
         Kbsk3q7W8m6SJVeeRShq7dUYTdwEiPBLKZnzSLkrYNgzlIa0h4iAVAc6qYikxOM25irp
         fWr59Qgom6u5wJJwUceLkCWel9ZpO73BHUBTM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781678756; x=1782283556;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yx01qzHYL7zapV7JT7OmgAtxcHhwEqISMkYtU1aw3M4=;
        b=M+KaFziyb7VvTI028TE6iUfZoTJQFKS/3AnLvi8RRq9rXJBnxE8EHV64tVNuMpbRFc
         +3ScrMOE8Pk+hFvmOrJoLr9HzULZTfJgFd6mzKFqMMUNohjifwrKSDmJw6LjQHIRAANI
         J3ZaZDNyYiDcLNx7BO3z/AnUW3Y7pdcmj4DuDxOZJrkZCcvZgmAyw5HNG0jmVIU/uZjV
         LCRPQXmJJzdy6UkLIJHaoaSFYEuoDenQ+5EFOqrrhQdrY+kY+uY5omhx2IDBAEvNDMH0
         qda6BcYIooNviPcXqIxGo8CifieSn1xiWQHINWSOXFbDAYY8/jsY5CADnj+mEvTq0hR+
         pAkA==
X-Forwarded-Encrypted: i=1; AFNElJ/nAvvnb36RaQbf9sTTQEgf2EArn6/aDNutqqbwqyrMsXJj4KD13yag7KCC3SzMMz0iTpQUmelayHp0UL7zRw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxKfJ0VCkjSZWXgvpKkbewjfdVxMdunhNUeC8l4Ca60OlgN6N+Y
	P8SmE8SjOppdpkgvcXu7A9lJMS13jkSVaeDNmESVuIUk227SFD/I3DfIAO6iH7Cr8w==
X-Gm-Gg: AfdE7cmDLZ+mGQFsgup09EhZNe8v5yhWS2dGG7+SJgN0id/WrxxghFDeiRUozcvWhUF
	aCipxpPkGeCm/0wupIjH4CDdH2ilTI2C6YymmcQuLPyFL0omETFDI4CmK1V+UbaIeTeV2VH8Yt5
	nOLKaO7yYTwZHqH+gA7QS38VYR6dO+VRa7yulb3eJVKlaxp0vf+tjF/9yb8tQGpRSgM5FgzJUWa
	yDbNrgRgPPL2LD2l2FRfeLV9VPcIKBSGk2m5XxrRC3LxCfaOKqohh0psA39ULWDIxg/89Bz/49b
	G0mCd+34Mgg5Cen091ZCDQzcSt7sxVW0hQ4eLw4qAz3b11IhnPxK4pj4KjoNkHFGqcJ8e99ubyH
	Z2+wlUKzAB+FhXqDigcD8FWl1cpDFwrAKaxt4sCHzX+3vqLkXI/20ggf/BhvxlGKdfB7+C0qJjs
	7CaynTziV3bH1xH9u7Qup3rYBgINg9/xWDQ2okdRtqvftY4d3h/wqVzEW00NTIJtFJa3SN7Kmak
	Oo=
X-Received: by 2002:a17:903:32d1:b0:2bc:f1ef:2e64 with SMTP id d9443c01a7336-2c6bc0c8905mr27041175ad.12.1781678756057;
        Tue, 16 Jun 2026 23:45:56 -0700 (PDT)
Received: from tigerii.tok.corp.google.com ([2a00:79e0:2031:6:20ef:efdb:f2c9:836f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c6af931f19sm24365675ad.74.2026.06.16.23.45.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 23:45:55 -0700 (PDT)
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Mark-yw Chen <mark-yw.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>
Cc: Tomasz Figa <tfiga@chromium.org>,
	linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	stable@vger.kernel.org
Subject: [PATCH v3 1/2] Bluetooth: btmtksdio: test for BUS IO errors in btmtksdio_txrx_work()
Date: Wed, 17 Jun 2026 15:45:31 +0900
Message-ID: <20260617064543.574704-2-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.54.0.1136.gdb2ca164c4-goog
In-Reply-To: <20260617064543.574704-1-senozhatsky@chromium.org>
References: <20260617064543.574704-1-senozhatsky@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260616_234557_017865_89A8787D 
X-CRM114-Status: GOOD (  10.45  )
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

btmtksdio_txrx_work() loop termination condition checks for
int_status being non-zero, however, this evaluates to true
even when sdio_readl() encounters BUS I/O error (in which
case int_status is 0xffffffff).  Break out of the loop if
sdio_readl() errors out.

Fixes: 26270bc189ea4 ("Bluetooth: btmtksdio: move interrupt service to work")
Cc: stable@vger.kernel.org
Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
---
 drivers/bluetooth/btmtksdio.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/bluetooth/btmtksdio.c b/drivers/bluetooth/btmtksdio.c
index c6f80c419e90..d8c8d2857527 100644
--- a/drivers/bluetooth/btmtksdio.c
+++ b/drivers/bluetooth/btmtksdio.c
@@ -574,7 +574,9 @@ static void btmtksdio_txrx_work(struct work_struct *work)
 	txrx_timeout = jiffies + 5 * HZ;
 
 	do {
-		int_status = sdio_readl(bdev->func, MTK_REG_CHISR, NULL);
+		int_status = sdio_readl(bdev->func, MTK_REG_CHISR, &err);
+		if (err < 0 || int_status == 0xffffffff)
+			break;
 
 		/* Ack an interrupt as soon as possible before any operation on
 		 * hardware.
-- 
2.54.0.1136.gdb2ca164c4-goog


