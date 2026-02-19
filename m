Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1E8DE9A02C
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Feb 2026 00:30:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ezdfd9Sxz6JvC4abwic4pb6waxE2hSCcwIyWlcw82j8=; b=Fmn8cmQUc9OY5BRzgaxG6x1We9
	429YHAyN6UWQy/XkR0STzTypdeQTVPlTbSRyzfWDbA5EnmRwap4IFDE1+ceZwkiGi/qCm6i3TR0SE
	wO/Rvdwb8zBD64qJvcroUG3EYVY7yEhO4aWE/zpmorT+8kNq/hj2W5MnalMlvjbYpMTUX/eyxRZqO
	F0w9XY3eBTp6UQNhKJpnPJVPmXCbmlSg75jXsO5I0bZPZyJIcfegQ0aPtfTbhCWkkpRvfe0W8OOyW
	chB7N40thF4INq/JtHz8wt3al1fxZ4Mq19MfEvL9qJtYCaB0VNZuQEpzuc6UiQKzWj1G6EYNqFIsC
	3eeRnzgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsrwK-0000000Ae65-0hgx;
	Thu, 19 Feb 2026 00:30:44 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsrwH-0000000Ae59-1WYP
	for linux-mediatek@lists.infradead.org;
	Thu, 19 Feb 2026 00:30:42 +0000
X-UUID: 3672ba720d2a11f1ad39f32c34db0b1c-20260218
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=ezdfd9Sxz6JvC4abwic4pb6waxE2hSCcwIyWlcw82j8=;
	b=M/jrC67gDZlyvyZhDQ4Z8TRbXGK7lpsJ4yTWSTLZmnfET9wJnjFknn6j352YYs9QAaCdzil/X8F8jZfUGgxJAnQZeqU9a4quKD8q/kPG0hATCKM3PIA9k0x6cTvgOvSx2GGlODEK/Pg+QrmGQYx2F+ynfdTsxTooEb21+vxry0k=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.11,REQID:6e26c41a-e2dd-44ca-bf2a-1ed207800dc9,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:89c9d04,CLOUDID:b218cbf0-16bd-4243-b4ca-b08ca08ab1d8,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|888|898,TC:-5,Content:
	0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI
	:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 3672ba720d2a11f1ad39f32c34db0b1c-20260218
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw02.mediatek.com
	(envelope-from <ryder.lee@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2061876554; Wed, 18 Feb 2026 17:30:37 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 19 Feb 2026 08:30:35 +0800
Received: from mussdccf250.eus.mediatek.inc (10.73.250.250) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Thu, 19 Feb 2026 08:30:34 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Rob Herring <robh@kernel.org>
CC: <devicetree@vger.kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, <linux-mediatek@lists.infradead.org>,
	<linux-wireless@vger.kernel.org>, Ryder Lee <ryder.lee@mediatek.com>
Subject: [PATCH v8 2/3] dt-bindings: net: wireless: mt76: add mt79 PCI devices
Date: Wed, 18 Feb 2026 16:30:28 -0800
Message-ID: <5022737c82052132702004ab0fdc073f5cf6df69.1771205424.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <8fa8ec500b3d4de7b1966c6887f1dfbe5c46a54c.1771205424.git.ryder.lee@mediatek.com>
References: <8fa8ec500b3d4de7b1966c6887f1dfbe5c46a54c.1771205424.git.ryder.lee@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260218_163041_402135_FE581996 
X-CRM114-Status: UNSURE (   8.56  )
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
Message-ID: <20260219003028.aIuyOAZCIVaJCOYTpzmOJZIG66tq6heqD4AHDxYzbs0@z>

Add mt79 series PCI compatibles. WiFi TX power settings must be provided
via the platform's DTS node. Different generations interpret these
settings differently, so we need to distinguish them using PCI IDs or
compatible strings in the documentation.

The following patches will further explain the differences in TX power
handling between generations.

Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
v7: add missing dts mailing list and maintainers
v8: revise commit message
---
 .../devicetree/bindings/net/wireless/mediatek,mt76.yaml      | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/wireless/mediatek,mt76.yaml b/Documentation/devicetree/bindings/net/wireless/mediatek,mt76.yaml
index ae6b97cdc..72cc30251 100644
--- a/Documentation/devicetree/bindings/net/wireless/mediatek,mt76.yaml
+++ b/Documentation/devicetree/bindings/net/wireless/mediatek,mt76.yaml
@@ -27,6 +27,11 @@ properties:
       - mediatek,mt7622-wmac
       - mediatek,mt7981-wmac
       - mediatek,mt7986-wmac
+      - pci14c3,7915  # mt7915
+      - pci14c3,7906  # mt7916
+      - pci14c3,7990  # mt7996
+      - pci14c3,7992  # mt7992
+      - pci14c3,7993  # mt7990
 
   reg:
     minItems: 1
-- 
2.45.2


