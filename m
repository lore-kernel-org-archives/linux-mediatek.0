Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFEB7C433FE
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Nov 2021 11:22:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dePpTfe2XvxZp8XSvry6hQvcBFlRHnd8TSIS6XeC8LU=; b=tbFEr8D0o1aMns
	JawtB2zVpmBOt/2sBcItaCzC/Clb8x55bgHXTPCyxfV/q08JpscqaHuxN4vOPrDYyo3Pmm/e6T4dt
	ymB+Tj04QYC8lrULAYj6Tv3Fi9BYbRgGHrqOkz5sjmzuMI4PYh2bY2vJdlgtMDQbmXVEqSV5d3W+t
	iBA3yVTsHFN8eA4no0zFv5XQw2ZyoBmuF4fQlKrR+AwbQT6wViqvKRQlhjhHQN22FmBHLRiV0xroX
	7iEHz+UmfpTcqoY02R/t4BX4am2t1o9FhLsEBhf6cqHHUS/NKXobTAW2dRURk5FNfTVzX6GO8YUOZ
	GYM1VRGwnupC35GGMj5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mpTsJ-001sQA-IU; Tue, 23 Nov 2021 11:22:11 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mpTrQ-001s4V-N6
 for linux-mediatek@lists.infradead.org; Tue, 23 Nov 2021 11:21:19 +0000
Received: by mail-pf1-x436.google.com with SMTP id o4so19112643pfp.13
 for <linux-mediatek@lists.infradead.org>; Tue, 23 Nov 2021 03:21:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=z+/tM6AGO8qVa/0Ves95KRNhzSUdOxRaqnGgKB5D++M=;
 b=XpXqNAebRwgXhworSNtt028SsP5KTorBtVnPQ2NDJ5AqE0w8IT8BOg6T3ewnDOxn0x
 QaNyBlTudA5wA6HUsP3tTtdlTWjvrE8GuQPbTwT1fW+w1gEOlQN/lkvuxJNQ4SJKqEYn
 we3ePUFjfo44/HkRFeRMoGLKvp+vx0wcGlvTA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=z+/tM6AGO8qVa/0Ves95KRNhzSUdOxRaqnGgKB5D++M=;
 b=IcJ5+jh7KTjY/vFg+v20kJIcmMeoTXGAcRb7woRNxttQ8uYwCCqgmiUlvZElVyVd3x
 tr/PVfE3A5RuK1VaL1eA9wkAScPpt6c9trtCfNV4EOPLOaajhVPuT+J1lQYlj6JISBSv
 iYnds/nc09OIZOlyum84UczI9cqrTHnR38R4GgiAW7xySv0+f4RiOf/4veE/xJGNxw7W
 2Lu9oom+lCbdl0c02FuBIA49LFU4fRwLaUuWeFVMTAL+CJ2Ci/bvAeck1fKI5rUYkci3
 GuVjN/fknfW9zIqTlfv8TbRQX99JZ0oKvZ0mcSRcYqYrIYJAauk4UEQmLULh3F5+m5r8
 euPA==
X-Gm-Message-State: AOAM531ZHZCLc2CF/iFPRfjSY+TNq8PzEktZngNzxFRIJkmsxbNFJD0t
 qZhl0m/9jQdQztccd7zxmFW48w==
X-Google-Smtp-Source: ABdhPJxETkQVjZ/TElThsyh1V0RdLsnWog1QFLXL9SdSSg23n2Tff5mZqtPLZT8Oh2DPEEUzXXmy1w==
X-Received: by 2002:a63:f64:: with SMTP id 36mr3117696pgp.464.1637666475417;
 Tue, 23 Nov 2021 03:21:15 -0800 (PST)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:d1ae:c331:ed2a:15e9])
 by smtp.gmail.com with ESMTPSA id 63sm11093914pfz.119.2021.11.23.03.21.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Nov 2021 03:21:15 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Christoph Hellwig <hch@infradead.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>,
 Robin Murphy <robin.murphy@arm.com>, iommu@lists.linux-foundation.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Maxime Ripard <maxime@cerno.tech>, - <devicetree-spec@vger.kernel.org>,
 devicetree@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 senozhatsky@chromium.org, tfiga@chromium.org
Subject: [PATCH 2/3] dt-bindings: Add io-tlb-segsize property for
 restricted-dma-pool
Date: Tue, 23 Nov 2021 19:21:03 +0800
Message-Id: <20211123112104.3530135-3-hsinyi@chromium.org>
X-Mailer: git-send-email 2.34.0.rc2.393.gf8c9666880-goog
In-Reply-To: <20211123112104.3530135-1-hsinyi@chromium.org>
References: <20211123112104.3530135-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211123_032116_854168_E11E792B 
X-CRM114-Status: GOOD (  12.21  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add a io-tlb-segsize property that each restricted-dma-pool can set its
own io_tlb_segsize since some use cases require slabs larger than default
value (128).

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
 .../bindings/reserved-memory/shared-dma-pool.yaml         | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/reserved-memory/shared-dma-pool.yaml b/Documentation/devicetree/bindings/reserved-memory/shared-dma-pool.yaml
index a4bf757d6881de..6198bf6b76f0b2 100644
--- a/Documentation/devicetree/bindings/reserved-memory/shared-dma-pool.yaml
+++ b/Documentation/devicetree/bindings/reserved-memory/shared-dma-pool.yaml
@@ -56,6 +56,14 @@ properties:
       If this property is present, then Linux will use the region for
       the default pool of the consistent DMA allocator.
 
+  io-tlb-segsize:
+    type: u32
+    description: >
+      Each restricted-dma-pool can use this property to set its own
+      io_tlb_segsize. If not set, it will use the default value
+      IO_TLB_SEGSIZE defined in include/linux/swiotlb.h. The value has
+      to be a power of 2, otherwise it will fall back to IO_TLB_SEGSIZE.
+
 unevaluatedProperties: false
 
 examples:
-- 
2.34.0.rc2.393.gf8c9666880-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
