Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8490C54EED
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Jan 2023 10:30:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h/rwlLDEtbW36VfCqW0mnDyKREjKUOT7fxTwKpedSJQ=; b=l2PkzR5irBXJt+NF137pGW+Xvt
	Q1dK0LPgQ3vYHbzZw56p741DOHsDL3RdI6rmXm7o+3lRJf6JO+z534woi1HapnuAqUwCdTYQtcZ/A
	rg/RghpbUwQMydjIQ/5SlbUXVwVDIpn8GfkYfnFmkyHqLTG9hpS2ywOm3aN5JkszEmCSl/cu4Avg0
	Btj+xCLPA5YTaG2kMywnh7iX83BLdF1qSSssGp7Cvlx4yL7ORaLXp1ps7iYtHtrJ4XibPf9NjKFyv
	23f+NHDsZG0SCckX1N8sp23wxgO6lHTiSSP4oZKtC5bs3iUoqeu4wVb16s34btzTG12/iSTKybx6U
	BFqFQ7UA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMRQQ-0037tt-FZ; Mon, 30 Jan 2023 10:30:10 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMRN1-0037Ns-P5
	for linux-mediatek@lists.infradead.org; Mon, 30 Jan 2023 10:26:41 +0000
Received: by mail-wr1-x42f.google.com with SMTP id t7so2204826wrp.5
        for <linux-mediatek@lists.infradead.org>; Mon, 30 Jan 2023 02:26:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h/rwlLDEtbW36VfCqW0mnDyKREjKUOT7fxTwKpedSJQ=;
        b=3E0zkA2gqTmqoeeFb3Q+vnT07aKxFwrUH34EgWo4WmsznGFTb6oc/GlWxTb3M5RUud
         UpNd0oOfSg9RHk2rK4Qtmk3soyvhnU8HOmBmEKP3nwmU3dlqRPt2zGLETL3HRegddjlw
         GMBvu07lIEFQjUx+90/7IwQ9Vf0kjB7AQhdWVa3SPuLup8G6jeOQa2sFj8MzYy4l+cAq
         j5vZgqbDnzOhOGRLq5GC+J8jqaJMkwz2FTQK7Q5eFL6tXwU3wKLq0HkrAn9m+l4Wx1ff
         NOUX31pnVurLmnDzXn/SttucqBwkn4mJ4IjYBq0um87+eUw7KmIB72WmryhMVtgR4zwq
         Rd4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h/rwlLDEtbW36VfCqW0mnDyKREjKUOT7fxTwKpedSJQ=;
        b=d0LPJZhlHmRRy+/AFt6aQEoQKqWolT40Xj9Z8VFShz5/VLX2KmeVuxPoixkTboAseU
         A6p2FUDvbQViJjxxhg7YI3A+a290JzZ4kxt4J2cB0eaAeTV896NIGPRhN8/M1mh9Ifps
         XdC9RHOROSRca6t1laMU/gyB5wWymENKkCxFPbRDOqyavjSe1Kl6TQqQtMkEABO+HiOW
         sd5AXCKh+tDeRwyGQRyaZ5eLS1qio94tpNX2PLUmDqdNcdEBGSEqbmhOi4hZxOD15Jgv
         F5MCEsHN/QVBmF6RXFwLIl0jKhIsv6kk6kKI/fnOHTV3iJZZC658guwzlaSNKbuTbP2s
         Cw2Q==
X-Gm-Message-State: AFqh2krLOsq6Lr4VtmlGj9z29C129dK3ZRfT6Iw4HLoPiAp5ykBgapue
	iS8vbq19SR9jdvgiaWqd4i92Lg==
X-Google-Smtp-Source: AMrXdXtCiNfSdUuMkTNChaAYiBD0oXk/tcW8F7bQQHQBjcoe+x26vkfwvHt6Gpl6NHBhKdyyS31KtA==
X-Received: by 2002:a5d:46c2:0:b0:2bf:9468:340 with SMTP id g2-20020a5d46c2000000b002bf94680340mr29633671wrs.19.1675074397479;
        Mon, 30 Jan 2023 02:26:37 -0800 (PST)
Received: from alex-T14.baylibre (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id s5-20020a5d5105000000b002bdfcd8c77csm11426785wrt.101.2023.01.30.02.26.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jan 2023 02:26:37 -0800 (PST)
From: Alexandre Bailon <abailon@baylibre.com>
To: yong.wu@mediatek.com,
	joro@8bytes.org,
	will@kernel.org
Cc: robin.murphy@arm.com,
	matthias.bgg@gmail.com,
	krzysztof.kozlowski@linaro.org,
	robh+dt@kernel.org,
	iommu@lists.linux.dev,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Alexandre Bailon <abailon@baylibre.com>
Subject: [PATCH 1/3] dt-bindings: memory: mediatek: Add support of unmanaged iommu domain
Date: Mon, 30 Jan 2023 11:27:20 +0100
Message-Id: <20230130102722.133271-2-abailon@baylibre.com>
X-Mailer: git-send-email 2.38.2
In-Reply-To: <20230130102722.133271-1-abailon@baylibre.com>
References: <20230130102722.133271-1-abailon@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230130_022639_820578_259A9562 
X-CRM114-Status: GOOD (  10.20  )
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

Currently, the only way to have an unmanaged domain for a device
is having a dedicated iova region or bank.
This adds a new bit to MTK_M4U_ID that allows defining devices
that needs unmanaged iommu domain.

Signed-off-by: Alexandre Bailon <abailon@baylibre.com>
---
 include/dt-bindings/memory/mtk-memory-port.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/dt-bindings/memory/mtk-memory-port.h b/include/dt-bindings/memory/mtk-memory-port.h
index 2f68a0511a257..86896c776691a 100644
--- a/include/dt-bindings/memory/mtk-memory-port.h
+++ b/include/dt-bindings/memory/mtk-memory-port.h
@@ -7,11 +7,14 @@
 #define __DT_BINDINGS_MEMORY_MTK_MEMORY_PORT_H_
 
 #define MTK_LARB_NR_MAX			32
+#define MTK_UNMANAGED_DEVICE            (1 << 31)
 
 #define MTK_M4U_ID(larb, port)		(((larb) << 5) | (port))
 #define MTK_M4U_TO_LARB(id)		(((id) >> 5) & 0x1f)
 #define MTK_M4U_TO_PORT(id)		((id) & 0x1f)
+#define MTK_M4U_UNMANAGED(id)		((id) & MTK_UNMANAGED_DEVICE)
 
 #define MTK_IFAIOMMU_PERI_ID(port)	MTK_M4U_ID(0, port)
+#define MTK_M4U_UNMANAGED_ID(larb, port) (MTK_M4U_ID(larb, port) | MTK_UNMANAGED_DEVICE)
 
 #endif
-- 
2.38.2


