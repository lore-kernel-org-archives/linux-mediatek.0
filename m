Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA084C4332F
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Nov 2023 09:55:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VLokDDeUmqYRRJWiE6rl7SGUQtXK/4RB+bpLxyFfC4Y=; b=pdrRoKnkhAiQG7+GUQx7iT9xXq
	JleMAKKnJ+r+4G0m6/4w/lzMMaupWMyNJDE1GX0HbV9jEwrQTFDxFsyhbK5sGjvjK4KkCZnoNQbge
	+lw6+Anuf+wx61z0XYRqkbvKWcRmdZni8JiPTn7NDUk5bjycYyqk4nfPe4XWqvUy3gMA2dzcfwbFU
	HsAfNdtXGjrFImWdlgHL2udmvGVcWfRshneiajaXkl2DXq2cMa+ddIdCZvdi0/J72DrE2ko89ZZYi
	c0yVddQADQ1VBBAyHnrhm7ON0AKIMtier3pOWIui9oWdgK4hyuC6R9XY2V40N3DLbqJqpf7fBMimV
	c6jNzLlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qy7wq-006zcO-2w;
	Wed, 01 Nov 2023 09:55:40 +0000
Received: from mail-lf1-f43.google.com ([209.85.167.43])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qy7wn-006zbl-0E;
	Wed, 01 Nov 2023 09:55:38 +0000
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-507a29c7eefso9433197e87.1;
        Wed, 01 Nov 2023 02:55:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698832534; x=1699437334;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VLokDDeUmqYRRJWiE6rl7SGUQtXK/4RB+bpLxyFfC4Y=;
        b=gQD0U8qoK5/B6f27+Oj1r0Yxx189B8sVXY5HTGFeWcNZy4MsFz4G8d7zS+eMjxPlgg
         bPvDiaUtTfBu9WzT+zrYhGwo+QHY+gyfnzx5P1B1jRCHt4KaU/Q1RY/53enEkxygima+
         yp7OB7gzMeBvEzmnIeBzGabPtU+YY5EX8U9sB9taK27OsQI6obUgGl1IJeh/RLcjU6dD
         AVwYKLN/lw8ysxOKYurlK3Kzz0yevIHMioAEM4zPwyGGLH0y3OKamLeAYXtmiHLhB49a
         kHAxN+Iu1FaRLUMMlkBiDaJAcDYomMZGxK1+U8vUcwtAWqDZ+7UtQSK7Uq9eBu18zDGn
         WABA==
X-Gm-Message-State: AOJu0YwSE1mYDWCAjzhB/tqtibgKEfstwzHDKYJhmp3YCpqdbmNSr9+4
	Wv8oqPS+2pQOog02DzX/F9/Bm42th4t0DQ==
X-Google-Smtp-Source: AGHT+IG9dIQGWQj/99HHkunl3VNNLt6J/GTKRcX+Vc0XmliTPanSMBlSHaGQwMaxqaA0wqC+H4+DVA==
X-Received: by 2002:a05:6512:ba7:b0:509:2b82:385c with SMTP id b39-20020a0565120ba700b005092b82385cmr5894208lfv.61.1698832534082;
        Wed, 01 Nov 2023 02:55:34 -0700 (PDT)
Received: from redmibookpro.tendawifi.com ([217.155.96.227])
        by smtp.googlemail.com with ESMTPSA id a18-20020a5d5092000000b0032db8f7f378sm3723707wrt.71.2023.11.01.02.55.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Nov 2023 02:55:33 -0700 (PDT)
From: Tom Waldron <tom@baremetal.dev>
To: linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Tom Waldron <tom@baremetal.dev>
Subject: [PATCH 1/1] wifi: mt76: mt7921: Add a new VID/PID 0b48/7922 for MT7922
Date: Wed,  1 Nov 2023 09:55:33 +0000
Message-ID: <20231101095533.45258-1-tom@baremetal.dev>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231101_025537_114161_3A01B105 
X-CRM114-Status: UNSURE (   9.94  )
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

Add VID/PID 0b48/7922 for MediaTek MT7922 wifi chip.
Change tested on Redmi Book Pro 15 2023 (Fedora 38).

Signed-off-by: Tom Waldron <tom@baremetal.dev>
---
 drivers/net/wireless/mediatek/mt76/mt7921/pci.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/pci.c b/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
index 3dda84a93..ba805cb02 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
@@ -21,6 +21,8 @@ static const struct pci_device_id mt7921_pci_device_table[] = {
 		.driver_data = (kernel_ulong_t)MT7921_FIRMWARE_WM },
 	{ PCI_DEVICE(PCI_VENDOR_ID_MEDIATEK, 0x0616),
 		.driver_data = (kernel_ulong_t)MT7922_FIRMWARE_WM },
+	{ PCI_DEVICE(0x0b48, 0x7922),
+		.driver_data = (kernel_ulong_t)MT7922_FIRMWARE_WM },
 	{ },
 };
 
-- 
2.41.0


