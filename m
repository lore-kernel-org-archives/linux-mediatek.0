Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 125ECC982D3
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Sep 2026 07:33:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4ZtxE85SUNNEIuSfNKFpqtTDqNqWYeLZ2eG0PlOjjZ4=; b=YM8Yrw8HV5+oFVQ2MYSwKWvM4O
	w8doptX3l3ohmtEcgkeUCZ5Q36/34Zc/nhOt6guLiW+O9DwcEhBh1Ztn1teVOsH4WieuAmnOoC3jJ
	lAwLq9vQ8/U5iRK0KFoE/s960u4lUXDpF60TRH4r6sUfnc3zleae8WH5Q4irn6Rgj0ugwBq3hqZIa
	N0QFbtJOJRypahaK15rlgBY2aZoeg2PzrgAiISGJ9tzvVQs078djw5JD2DQ27q/bzrrq59dDyRxcn
	lLZWQedbQrCV8kWC/XybHrL2rPqaPJ/njmmtxnSbgH9C4Drcxt3+GEA817eKDV1fO3+hId0FGjpML
	Rp2pl+4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x76cN-0000000Am4B-3flb;
	Thu, 17 Sep 2026 07:33:15 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x76cF-0000000Am1d-3Eem;
	Thu, 17 Sep 2026 07:33:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E505C447E8;
	Thu, 17 Sep 2026 07:33:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BE6A9C4AF09;
	Thu, 17 Sep 2026 07:33:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1789630386;
	bh=JrjRFAUJd/zKp8SmrRTAcUjwzpaGVf1ntLXPFqXwwe4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=vGgRgECWMIguvYAMzrwyxnRf3KTLYOdBWb/akuzm8x4PjAurTKNm+NfIlVHSSSLsa
	 OOVYBvNwJRk1RnGzMwr4xP3rDERJulIX7dIknHiPdFLQdB271oW0jRQ8Xr3ffffCCV
	 G3gfmx8RgfBPjUfc6uaEcAyit//Y7ezV1lvSJJkRbQbCdMkYDXETEQAjLchLCrEUSa
	 agUr1swO0GsPWiuWa+2fT4uxWsdlfXkvrfknRHoKWUKXxuLY9O+Zs61OIzs6Pt+gT3
	 HiWwAtcXAgZqUKcM39DfJ7fcSxvx+KshMZ3T/xsotYLGEEk2uZrshg1ClpO4G2iPm3
	 Fikj4fJYCPUIw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4FB6C982D3;
	Thu, 17 Sep 2026 07:33:06 +0000 (UTC)
From: Roman Vivchar via B4 Relay <devnull+rva333.protonmail.com@kernel.org>
Date: Thu, 17 Sep 2026 10:32:08 +0300
Subject: [PATCH 3/3] usb: mtu3: add mt6595 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-6595-mtu3-v1-3-a2ba7c230d68@protonmail.com>
References: <20260917-6595-mtu3-v1-0-a2ba7c230d68@protonmail.com>
In-Reply-To: <20260917-6595-mtu3-v1-0-a2ba7c230d68@protonmail.com>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Roman Vivchar <rva333@protonmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789630384; l=1062;
 i=rva333@protonmail.com; s=20260510; h=from:subject:message-id;
 bh=sZViwWtqWfFRXSefwZIoIPpxQbOgrFtCVXkoQ8L9Uwg=;
 b=D5uVFPYcautf7sRmVtTQmFT4QBspLwRkRzybP2kgv6vzIGe75Tfjl0r8/u2BdrHCyoP8mDVxj
 V8/PXosevVhCNc3Kn5GOvQmHDjr3VQUmnA26HWY8NdjPNTfaB/Z0n2/
X-Developer-Key: i=rva333@protonmail.com; a=ed25519;
 pk=zww/nWjBGoQ4POXCG0BV6fx2iuXK6jx77rsKPA5YK5Y=
X-Endpoint-Received: by B4 Relay for rva333@protonmail.com/20260510 with
 auth_id=777
X-Original-From: Roman Vivchar <rva333@protonmail.com>
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
Reply-To: rva333@protonmail.com
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Roman Vivchar <rva333@protonmail.com>

Add a platform data for the MediaTek mt6595 SoC MTU3 IP block with a
quirk for single FIFO slot.

Signed-off-by: Roman Vivchar <rva333@protonmail.com>
---
 drivers/usb/mtu3/mtu3_plat.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/usb/mtu3/mtu3_plat.c b/drivers/usb/mtu3/mtu3_plat.c
index bc65acdfb0de..c29778b3f009 100644
--- a/drivers/usb/mtu3/mtu3_plat.c
+++ b/drivers/usb/mtu3/mtu3_plat.c
@@ -611,11 +611,16 @@ static const struct dev_pm_ops mtu3_pm_ops = {
 
 #define DEV_PM_OPS (IS_ENABLED(CONFIG_PM) ? &mtu3_pm_ops : NULL)
 
+static const struct mtu3_platform_data mt6595_platform_data = {
+	.single_slot = true,
+};
+
 static const struct mtu3_platform_data mt8173_platform_data = {
 	.single_slot = false,
 };
 
 static const struct of_device_id mtu3_of_match[] = {
+	{ .compatible = "mediatek,mt6595-mtu3", .data = &mt6595_platform_data },
 	{ .compatible = "mediatek,mt8173-mtu3", .data = &mt8173_platform_data },
 	{ .compatible = "mediatek,mtu3", .data = &mt8173_platform_data },
 	{},

-- 
2.55.0



