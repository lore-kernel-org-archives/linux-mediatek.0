Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EDCEC4725D
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Jan 2024 09:41:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eQxCOkiJPm7iwfjWyWSuO6zq1Afslf9Y7Ms3VqNGulg=; b=ey5pLxLLCTaGgULFVm1adqsYYw
	kl+OA7vk63IBXWaLqaqJilYYX+GohDZPc8Zs7PcD+aQaoKV/5/rYp8A+j72QXqxuy8z6fpTewH+pO
	UnoXpijpNFkrDsJc4d8fW2rnKxJiCMwZEZ72JvaGyvAeZUl38BCyI1mz09xEUd9ul7m1u2dvbNtfL
	QPjZfdfAqchbrGqJwXginRCdoAyKFFclzWhFGHcB9rmI/A2XsBIc9JjdFv5Y9WVU1MsIFUw27NvLO
	DVPIyZTkrYzBdGNKSFsHAeIbQjNvonYDYuIkRS6F4RK/3H5/JKrBabTgMMubk2sGfjHo/4NVHB/CY
	vyyxzgkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rQlNI-004zUr-0f;
	Fri, 19 Jan 2024 09:41:20 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rQlNC-004zT0-0Z;
	Fri, 19 Jan 2024 09:41:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1705657272;
	bh=h9uUY0ElHE1xPzVp2yObyryTAaJ1/QLLOx9ZjW31TdE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Qaf1uNM7ZnUmYSVUcKvWGgF5F05PjhQqk0WXXNVvw9pKdbaakpS2bQvUvQunYRpyL
	 P6/KX//n8V+IzCWiQvySCN0f5ivQKCwwr7jIRqt97C/bDA5607BJ7X2pSFrs/K1Spr
	 +b5pXsObiYIei8G+U0kSqucmSi6cJMLK/1q/5LEp8jNhMdBF3IHQW4SPEzN9Xcn41F
	 FUxc3mWSFkQq6Q80+TyhRrwkwZVbDQcuMD6CmsO1Z9pDMfeuMJ51xkKrCkGsgHvdmr
	 iztszn5SOuYz3f5PwEsFmnWzdMGML5IuUFc+lWZYsHQ3gtNTX3jOS9iY4xcFxnTAzy
	 45X0Nd+OykChg==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id B54243782081;
	Fri, 19 Jan 2024 09:41:11 +0000 (UTC)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunfeng.yun@mediatek.com
Cc: gregkh@linuxfoundation.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux@roeck-us.net,
	heikki.krogerus@linux.intel.com,
	cy_huang@richtek.com,
	linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] usb: typec: tcpci_mt6360: Retrieve interrupt by index
Date: Fri, 19 Jan 2024 10:41:05 +0100
Message-ID: <20240119094105.98312-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240119094105.98312-1-angelogioacchino.delregno@collabora.com>
References: <20240119094105.98312-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240119_014114_339702_3E4DD112 
X-CRM114-Status: GOOD (  11.34  )
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

This IP has only one interrupt and names are not needed in this case:
change to use platform_get_irq() instead, dropping the PD_IRQB name.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/usb/typec/tcpm/tcpci_mt6360.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/typec/tcpm/tcpci_mt6360.c b/drivers/usb/typec/tcpm/tcpci_mt6360.c
index 02b7fd302265..171592ae1bbe 100644
--- a/drivers/usb/typec/tcpm/tcpci_mt6360.c
+++ b/drivers/usb/typec/tcpm/tcpci_mt6360.c
@@ -153,7 +153,7 @@ static int mt6360_tcpc_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
-	mti->irq = platform_get_irq_byname(pdev, "PD_IRQB");
+	mti->irq = platform_get_irq(pdev, 0);
 	if (mti->irq < 0)
 		return mti->irq;
 
-- 
2.43.0


