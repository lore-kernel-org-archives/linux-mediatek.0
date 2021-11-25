Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFAB8C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Nov 2021 11:11:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YpmKjdduR+YZDDBPuyJWexq+SVvXY5YmzJiciz/5e2Q=; b=WhH0FC03qccNqR
	L6vBeTIeS7IGPg3yeFHQ+U9kDAbhP5zdXHAlLsKbnQJmq5a5UunhelX5ohP1gNV9OqhtMUz7v8IYu
	Yt0wt97K/AXL2o+3Nim9NdaQzQlRxSBW7s/sa6dHncDN5LLMGDCmaw2uary4CbHFFI5S8zAgbK6/3
	iwVuxitPcVO77Zgm3+lnB9qqhXJ3uy586wa4omgTICPUcXkIqQBBYXuUGQTKOUdcL0kuTwKtUUYeU
	WiKUimjET2o8BWF1h7x5egqTtnIyl4EvGXLeEQb/XRnDRI3/Q6v3htuiMdd/mb66IzA4xO4EJtbez
	fM+vyXxifN9FpY70Cpuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mqCeb-007BLM-RN; Thu, 25 Nov 2021 11:11:01 +0000
Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mqCbd-007A5Q-25; Thu, 25 Nov 2021 11:07:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
 s=20160729; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=1ACYVeMYhOaHpY/+Z00ouN+vPwmm4WZknRFL8sAaImk=; b=DHAwGEK/8TltcSJVn6subOG2rv
 HmmUdM1UuvKQ722nKQU7uT3/BZWPh7IW9iA1+ePtbsinCa5DYYtIo7zpb2V9VRv59AuwuI0f898Hx
 T0kR0v7zgInHCs+8eQxKDNk/kc5KCcbrv6bTOuVQ5jzTxMtNdphQ1aCV+kYuV/dRncms=;
Received: from p54ae9f3f.dip0.t-ipconnect.de ([84.174.159.63]
 helo=localhost.localdomain)
 by ds12 with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <nbd@nbd.name>)
 id 1mqCbU-0002ws-TG; Thu, 25 Nov 2021 12:07:48 +0100
From: Felix Fietkau <nbd@nbd.name>
To: linux-arm-kernel@lists.infradead.org, Ryder Lee <ryder.lee@mediatek.com>,
 Jianjun Wang <jianjun.wang@mediatek.com>,
 Bjorn Helgaas <bhelgaas@google.com>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: john@phrozen.org, linux-pci@vger.kernel.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v4 08/12] dt-bindings: PCI: Add support for Airoha EN7532
Date: Thu, 25 Nov 2021 12:07:34 +0100
Message-Id: <20211125110738.41028-9-nbd@nbd.name>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20211125110738.41028-1-nbd@nbd.name>
References: <20211125110738.41028-1-nbd@nbd.name>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211125_030757_301155_419FC335 
X-CRM114-Status: UNSURE (   9.27  )
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

Signed-off-by: John Crispin <john@phrozen.org>
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
2.30.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
