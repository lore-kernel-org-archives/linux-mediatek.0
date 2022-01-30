Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46239C433EF
	for <linux-mediatek@archiver.kernel.org>; Sun, 30 Jan 2022 14:55:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yAR7yVqFdCjozbz3SQ9l4Q37MmOxnzbY/XzJkEzdmXw=; b=tDER3amX8eyErK
	zxcfIzMGZbydd3NkgYOg5h5j0icS175djM4HUnXnTtc5vP6qITynE9eQW0BqaNBulO8P59Wo0uT8y
	n+81utP1fz2B4n0MVBmcAB/XcChgJIwGmLn84I3cLT5tFtRlIs6f3UVXRuWFHxfB0F7ZZw6r8Fztg
	BuhgHHJ01MSx5WHD4c/IPjUH4N6dZzWS/YLcujZykK75GMQAJTIH+ZJwqq+lzOAJCjsPMcmTSbTA+
	6M/DdnHaQD9S030dgao2K5Oz1JBl7bCRS/aX42WJan5C2Ao46+FMn63rZ67xYpgcmhR1E8dWLHhTd
	ZIfKJGfgrisIKkyPg5dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nEBbW-006krb-9e; Sun, 30 Jan 2022 14:54:58 +0000
Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nEBYG-006j35-7P; Sun, 30 Jan 2022 14:51:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
 s=20160729; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=rO6a7Hov1DT8YCZ0BC66z6nKE3NFtfTVucv70OUu+M0=; b=q96nErUZ3T934E6wic2bry1QA3
 yAMgnAaov/Z42N8o3z4D+qFaBW8mLaAKaYaIpHN4K7CtSaFt/55OQQvtnsZRgey8C1dpt1IqDpc8d
 38s+hYqT2yUp5od91BVxT232hlS+MfEnL+l5Y6QzulkpRdartylSULvjSWpxi0nuVE3I=;
Received: from p200300daa716f900d40f7dfd86c385e0.dip0.t-ipconnect.de
 ([2003:da:a716:f900:d40f:7dfd:86c3:85e0] helo=Maecks.lan)
 by ds12 with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <nbd@nbd.name>)
 id 1nEBYA-0002if-FS; Sun, 30 Jan 2022 15:51:30 +0100
From: Felix Fietkau <nbd@nbd.name>
To: Ryder Lee <ryder.lee@mediatek.com>,
 Jianjun Wang <jianjun.wang@mediatek.com>,
 Bjorn Helgaas <bhelgaas@google.com>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: soc@kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, john@phrozen.org,
 Rob Herring <robh@kernel.org>, linux-pci@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v9 08/13] dt-bindings: PCI: Add support for Airoha EN7532
Date: Sun, 30 Jan 2022 15:51:11 +0100
Message-Id: <20220130145116.88406-9-nbd@nbd.name>
X-Mailer: git-send-email 2.32.0 (Apple Git-132)
In-Reply-To: <20220130145116.88406-1-nbd@nbd.name>
References: <20220130145116.88406-1-nbd@nbd.name>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220130_065136_481253_14FEEE28 
X-CRM114-Status: UNSURE (   8.39  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: John Crispin <john@phrozen.org>

EN7532 is an ARM based platform SoC integrating the same PCIe IP as
MT7622, add a binding for it.

Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: John Crispin <john@phrozen.org>
Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
 Documentation/devicetree/bindings/pci/mediatek-pcie.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pci/mediatek-pcie.txt b/Documentation/devicetree/bindings/pci/mediatek-pcie.txt
index 57ae73462272..684227522267 100644
--- a/Documentation/devicetree/bindings/pci/mediatek-pcie.txt
+++ b/Documentation/devicetree/bindings/pci/mediatek-pcie.txt
@@ -7,6 +7,7 @@ Required properties:
 	"mediatek,mt7622-pcie"
 	"mediatek,mt7623-pcie"
 	"mediatek,mt7629-pcie"
+	"airoha,en7523-pcie"
 - device_type: Must be "pci"
 - reg: Base addresses and lengths of the root ports.
 - reg-names: Names of the above areas to use during resource lookup.
-- 
2.32.0 (Apple Git-132)


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
