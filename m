Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28651C54E67
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Mar 2024 12:20:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1JOJevBznZDHv+rPPkI/kfMerMLWh3uWQP5q1ueWffU=; b=b4RxO4+XDKR5aFRBYU0JFXcpdr
	ITL0K1QobRdUcoCMSbRhv9rVuu+6GPqazeUKs/JHDpCXiepDJjWpA61t84EtACQuylA0ozGs2kcA8
	wvCRXYV20cT2ezMyt31AJnvSXph+VPGjYIAWVa0zn1naGY7iCyUiHIRVQ3/l9SRY5CM7aXAnIQL61
	82iJ5hlL4/K6GjsQZk7QY/3coaUnLppPxv9/IWhoBJ6tX0TCiJZLFEPZrQenMKEyBBAQ6Mb3T7/wc
	xJEeA3pnHLYbmpqGkMPN1C7fPVabunFoRkw9oi+1YHagg4vBoCGgni5NAMhUrkSp3VU+mu3ckP0uF
	+KHMrmUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkk4n-0000000EDUW-3Ae8;
	Thu, 14 Mar 2024 12:20:49 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkk4a-0000000EDLT-0hsF;
	Thu, 14 Mar 2024 12:20:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 24630CE1DA3;
	Thu, 14 Mar 2024 12:20:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5DF3CC433C7;
	Thu, 14 Mar 2024 12:20:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710418833;
	bh=Lrp2iOUWubwRXDT8fn4ZYwC2hYGdTr2JrwFF4kKzDM8=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=bva8kgpVNnYUfFN8DdvzjJ54ErkDSTrnQ4BLOKrEHjkOIz0fsn/iNB8P58nbFLZ4m
	 yMd6i8c1BAs0eXh+yGWiZobX1Q+PISdpTK/tMDZhQzVeniYN9qnuU3gBeIi0rejTpl
	 zMhL8appR/uQfszGC1L6StWxbL9p/KdxtXIushnMcA/7cP5F/1NNU8/Gx5CejWwZNz
	 S3BvmqIy9lCn5lHRI5JDzm02pBUnXK6MjH36eUF972K4luk0AIMvSqxSKyZpRCijw9
	 fAeVDpDfnmZ/hJiskz4CBSK9/0ssKoU/7VgV1Ljolueeqc4n1pq84qUklX/BQB/cAK
	 WVrC0GbguLddg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D51FC5475B;
	Thu, 14 Mar 2024 12:20:33 +0000 (UTC)
From: =?utf-8?b?QXLEsW7DpyDDnE5BTA==?= via B4 Relay
 <devnull+arinc.unal.arinc9.com@kernel.org>
Subject: [PATCH 0/2] Set PHY address of MT7531 switch to 0x1f on MediaTek
 arm64 boards
Date: Thu, 14 Mar 2024 15:20:03 +0300
Message-Id: <20240314-for-mediatek-mt7531-phy-address-v1-0-52f58db01acd@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAHPr8mUC/x3NTQqDMBBA4avIrDuQxBRpr1K6SDMTHYo/zIgo4
 t0buvw2751grMIGz+YE5U1M5qnC3xrIQ5p6RqFqCC5E1/qIZVYcmSSt/MVx7e6tx2U4MBEpm+G
 D3CfmwjkFD7WyKBfZ/4fX+7p+k3d7onEAAAA=
To: Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: mithat.guner@xeront.com, erkin.bozoglu@xeront.com, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 =?utf-8?q?Ar=C4=B1n=C3=A7_=C3=9CNAL?= <arinc.unal@arinc9.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1710418818; l=938;
 i=arinc.unal@arinc9.com; s=arinc9-patatt; h=from:subject:message-id;
 bh=Lrp2iOUWubwRXDT8fn4ZYwC2hYGdTr2JrwFF4kKzDM8=;
 b=cZgt4TQjE+rDWx2SQqBS405Ixkn/oDpThaOqJKxN8BxUVkJNynIapl7jq/9Qm+A+fsgw7lThl
 P0tFBRvHLvjAa/EUuhPdhovNPfzqDO5V/Jc75hGFx9ZKfr0m5Gd/nXl
X-Developer-Key: i=arinc.unal@arinc9.com; a=ed25519;
 pk=VmvgMWwm73yVIrlyJYvGtnXkQJy9CvbaeEqPQO9Z4kA=
X-Endpoint-Received: by B4 Relay for arinc.unal@arinc9.com/arinc9-patatt with auth_id=115
X-Original-From: =?utf-8?b?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240314_052036_436061_8D2710CF 
X-CRM114-Status: UNSURE (   7.15  )
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
Reply-To: arinc.unal@arinc9.com
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hello.

This is a small patch series setting the PHY address of MT7531 to 0x1f on
all boards that have the switch.

Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
---
Arınç ÜNAL (2):
      arm64: dts: mediatek: mt7622: set PHY address of MT7531 switch to 0x1f
      arm64: dts: mediatek: mt7986: set PHY address of MT7531 switch to 0x1f

 arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts | 4 ++--
 arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts             | 4 ++--
 arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts | 4 ++--
 arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts             | 4 ++--
 arch/arm64/boot/dts/mediatek/mt7986b-rfb.dts             | 4 ++--
 5 files changed, 10 insertions(+), 10 deletions(-)
---
base-commit: ba90af39ba57b3fe3ecfdba0c87a80d20c7b788d
change-id: 20240314-for-mediatek-mt7531-phy-address-9d0b4cfeca21

Best regards,
-- 
Arınç ÜNAL <arinc.unal@arinc9.com>


