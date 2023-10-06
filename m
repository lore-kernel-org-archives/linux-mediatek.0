Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B672E94114
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Oct 2023 20:17:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=44cFvtKqMAZFN6/2W4HaH3hNmYSsLMnAgOIOpwVomfM=; b=tehZCF2Dxi7U1xi/yamxW32EzI
	d0Rtt20+/gYejX7nTbUy/tSrZ2dsHMOPae3m3C7foCOjY6fflI+2ImfLKo6Q9YqDhvL6T9zglhd4o
	KNxNkhj+0N0BpBrAIRZf/VBUn0kvIhVn2cwpJ3dpcvixxmXt9OSWDmxphzeScYox7IKYC169pDxma
	znG5wk+ZnJB38Sx0/mrqLvWQWiAjFrBjIOxJVA7MysGXVfIpbrU5pFYOt/WQNuC95+6xYTvBD35pA
	+qxxEjq0w1+SPW8N5/yC16qfrGEITXGRBY6xV8zAtolN//+wNWgl7xRXYVef9ZNm+WBE5QUOoJvjf
	UaQC5stw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qorGT-006RJe-36;
	Fri, 06 Oct 2023 20:17:37 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qorGQ-006RHW-1v
	for linux-mediatek@lists.infradead.org;
	Fri, 06 Oct 2023 20:17:36 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-2776d882214so1907762a91.2
        for <linux-mediatek@lists.infradead.org>; Fri, 06 Oct 2023 13:17:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1696623451; x=1697228251; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=44cFvtKqMAZFN6/2W4HaH3hNmYSsLMnAgOIOpwVomfM=;
        b=BPOqYWmkcymDmJDHY2z5blxSP/Ql4X5eMnAQSLwu9+DcLe9xN8xaI+DmzQp5Ym3HIM
         yRqi9ecAflL5T7d0APnOlFQqWPXOmj6K7hPpKmz5M7mCPKMHvkHY4914RS7wae0Iz0tf
         W3UbuavF1yiFnJ2IzTVCqR/v6U/ZQP+mKtcUo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696623451; x=1697228251;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=44cFvtKqMAZFN6/2W4HaH3hNmYSsLMnAgOIOpwVomfM=;
        b=BlL6ssk6Y7ZJ5XohCNlIsiFZcHjqlGx98lld4aq1xaLJH7UEpY5jw5VgnHVKcphmnh
         06t9dH09EPR+FXlgR3tEz1zBU01UzYjQnHjccJ5KyN6d0RsTXd/gtFSm+Z2Ualnvi24t
         0W+TZ35c1ptrWImP21agLkUYZQhpfKjAMObxx+ke0y/90nEmioj5e1KVF0X6suhdJt5O
         p+N6h+2X0pi2aPwsi2z5D70j0QHnTFMoY6CND3zNyc5W2M0RuOLws6tlFFpP+E1P3lB/
         jgdS4RFaFOKCQBUb8ouXyR07f/PIHqGn5dSQQfPXCB8kG8mM/fpZSv107Hjk5wYYPEry
         JgRQ==
X-Gm-Message-State: AOJu0YzWdVZaLV8aRd7dsOT9hOms4NOxcmWpHtjYpQzAos1M4lYCD3Ed
	UjsXZCBuu51v2lhieffsssBR6g==
X-Google-Smtp-Source: AGHT+IE8lO1ha8XBa5ezgrgQtzWsAVLftgkmKffd4oVNSVoxQYbXsRdlq6o27BW5+g4zJ9hXC4kqeA==
X-Received: by 2002:a17:90a:e98c:b0:268:414c:ff3 with SMTP id v12-20020a17090ae98c00b00268414c0ff3mr9383030pjy.23.1696623450927;
        Fri, 06 Oct 2023 13:17:30 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id rm10-20020a17090b3eca00b0026d214a2b33sm5865157pjb.7.2023.10.06.13.17.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Oct 2023 13:17:30 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Kees Cook <keescook@chromium.org>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Thierry Reding <treding@nvidia.com>,
	Roger Quadros <rogerq@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Cai Huoqing <cai.huoqing@linux.dev>,
	Chuanhong Guo <gch981213@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Li Zetao <lizetao1@huawei.com>,
	linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-hardening@vger.kernel.org,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH] mtd: rawnand: Annotate struct mtk_nfc_nand_chip with __counted_by
Date: Fri,  6 Oct 2023 13:17:28 -0700
Message-Id: <20231006201728.work.750-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1866; i=keescook@chromium.org;
 h=from:subject:message-id; bh=wj52WE7CwlsQ2BB8Uem6TW+tv4z8geFWBQTRgq+pZr0=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBlIGtYrtnPKsIg2iO4Dd3ybiJdrRew0N9KKrFWo
 eR191/wOjuJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCZSBrWAAKCRCJcvTf3G3A
 JjxZEACEq9RQuj5y0ShuaIfEUoej7S27zHMK5VDww5pUKfNkAzMupLwYOh2Yk6q7ltkpvX6IuWW
 ROopZqHz/SA0ETIcIKxfWi6DKM+3eaNFCK84JR573dTGlnCvAQEuzLRPoHp7gYUAc1voMXNV4Eb
 onEUUeNpgaVY1gO+a5QuSTDx1ZFLJpzhHf9AyuEJ1j4o4W7ftzF5ZOrXwh3m2AEcdNudTDX8sdt
 TZ2xWMWVUU96nOJ351JSEB2DYIQc9B6G2zPFUxsa5FcaCAn76Tll91uRAEcrn8ZIJUwEGFlZccG
 XWqPoVBzHp4HNxPVdE800NRDNHXVtIZ/7j43uOZPXxRzgdoIcKqScm6sbIAbXp0R1EmfwoYAwfW
 Nu4VRs3Ar1aLm0xV82hvR3gW6mSSiRLFzRxzj/fl415Q98XkwErnfKjkEmrFO0ox6U9JjwMM4Om
 gXE59HAKzBYeWuaGTg8Prfd706WGU9dX+bcmHkGhSjZi9/s5cjyliCYIlKW3SZ5/r8eVDT7U5eM
 Ul6QML+ml7X3z4kkuuJ+h/wDqoXcal+zei2gPVUMcumoxLw1LIC01d6WE/KJ3P8ubWfTWyLJmjp
 13WmQW8lobfY1U0km8vVLpbpnjq3XkQP3rmrzLF282/rrCfukJH1zYa43nf6BLyjap2Bi6hSY66
 4Z3lS7/ Aj1sqFAQ==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231006_131734_636562_77EC3ECF 
X-CRM114-Status: GOOD (  13.11  )
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

Prepare for the coming implementation by GCC and Clang of the __counted_by
attribute. Flexible array members annotated with __counted_by can have
their accesses bounds-checked at run-time via CONFIG_UBSAN_BOUNDS (for
array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
functions).

As found with Coccinelle[1], add __counted_by for struct
mtk_nfc_nand_chip.

Cc: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>
Cc: Vignesh Raghavendra <vigneshr@ti.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: Heiko Stuebner <heiko@sntech.de>
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Thierry Reding <treding@nvidia.com>
Cc: Roger Quadros <rogerq@kernel.org>
Cc: "Uwe Kleine-König" <u.kleine-koenig@pengutronix.de>
Cc: Cai Huoqing <cai.huoqing@linux.dev>
Cc: Chuanhong Guo <gch981213@gmail.com>
Cc: Rob Herring <robh@kernel.org>
Cc: Li Zetao <lizetao1@huawei.com>
Cc: linux-mtd@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-mediatek@lists.infradead.org
Cc: linux-hardening@vger.kernel.org
Link: https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci [1]
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/mtd/nand/raw/mtk_nand.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/mtk_nand.c b/drivers/mtd/nand/raw/mtk_nand.c
index 29c8bddde67f..60198e33d2d5 100644
--- a/drivers/mtd/nand/raw/mtk_nand.c
+++ b/drivers/mtd/nand/raw/mtk_nand.c
@@ -130,7 +130,7 @@ struct mtk_nfc_nand_chip {
 	u32 spare_per_sector;
 
 	int nsels;
-	u8 sels[];
+	u8 sels[] __counted_by(nsels);
 	/* nothing after this field */
 };
 
-- 
2.34.1


