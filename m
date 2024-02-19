Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D30D6C54766
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Feb 2024 09:36:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IZ5kCpth54bGNWqN9eH9wLT+ZGwJ/cPlh5fKkrpDnZM=; b=iW7IDlzvnGu6+7jbH3RETwfk/g
	ddE7srj01IRVH0y0gc5WJiJAqNZVj6hHXglyiSujByCW5l/GJQrtWJH9PYYhVGY5/+RQtpFvrHJ/8
	UTF76sMF3MgrePZO6Sbzb445ERN3o+IjzDoJEGMGumspbDgAZgYojWR3ohxchmKFSHbfJZNbyB7IC
	odCb1nzBZ7Jpqs6pk34QEKLm2BPimY6V281gFtD4aW3kQZqwydvQCJ0aDc51cOIGbWhb89Z4coOWN
	jAG6gT4x017ud98GFM4N7oZtE/bmOYM1Gla9o8IppIdc6Iyth5BKJqDyIj+NfhPBZ9Gy7x6gvoINu
	pDhOtn6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rc04c-00000009qOE-3IDm;
	Mon, 19 Feb 2024 09:36:30 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rc04Z-00000009qM1-01Nj;
	Mon, 19 Feb 2024 09:36:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0E32860C2F;
	Mon, 19 Feb 2024 09:36:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A9F13C433F1;
	Mon, 19 Feb 2024 09:36:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708335385;
	bh=uIeslGUrMiIxBs3Hoekn0ZFqBZXLWeLXlSxJlmij2aA=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=ovNiocm6Kq7R4LaLhsLq/KTqT4WL9WMPEGi8i1KIRQzpN4KC97F9VRrR6CKQpmFF1
	 M1K4WeiK7phEk9O//9QpDA8p1u7FOhLt3RbEC6cRYGMQvdiLkHj1lbHUVLzHbjISWM
	 aW4abDBqPlzIJtbUCXhbkUyMaqq7MouHKrgp4w2+736lGAUzx1y00sHNZ1R6r/Yl2M
	 AN4fEhQDIRYKChx7GCzccAY2kLhM4WwCpjirYp1Op6wldbXA6Nk9Dn0dH3hG+BN72m
	 qaSKoHYXc78h4kgLma+Buk+yUN2F/v7RzEaugbM43UFKAhEfUAr/+kRNh+lZRFTIcO
	 8KXRTkAt5/R+Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8373CC54764;
	Mon, 19 Feb 2024 09:36:25 +0000 (UTC)
From: =?utf-8?b?QXLEsW7DpyDDnE5BTA==?= via B4 Relay
 <devnull+arinc.unal.arinc9.com@kernel.org>
Subject: [PATCH 0/2] Add port@5 as CPU port on certain MT7622 and MT7986
 boards
Date: Mon, 19 Feb 2024 12:36:12 +0300
Message-Id: <20240219-for-mediatek-v1-0-7078f23eab82@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAwh02UC/x3MQQqAIBBA0avIrBNUJLCrRAvLsYZIY4wIpLsnL
 d/i/woFmbDAICow3lQopwbdCVg2n1aUFJrBKGOV0U7GzPLAQP7CXfbOea3UjMFZaMnJGOn5d+P
 0vh8YuMC9XgAAAA==
To: Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: erkin.bozoglu@xeront.com, mithat.guner@xeront.com, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 =?utf-8?q?Ar=C4=B1n=C3=A7_=C3=9CNAL?= <arinc.unal@arinc9.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1708335384; l=788;
 i=arinc.unal@arinc9.com; s=arinc9-patatt; h=from:subject:message-id;
 bh=uIeslGUrMiIxBs3Hoekn0ZFqBZXLWeLXlSxJlmij2aA=;
 b=9uiTEjuJ0SLjCwgUYlLom+wD/ujYeEnWm/KJsVTE+Bh7pTohkdiTPePxKWgDoJVTjX+EIy7Z0
 bSBrioBNM6ZDlzzUI3u2/EnJYuC7kcnws6qJWI68ukjjY8GKNzaoiDn
X-Developer-Key: i=arinc.unal@arinc9.com; a=ed25519;
 pk=VmvgMWwm73yVIrlyJYvGtnXkQJy9CvbaeEqPQO9Z4kA=
X-Endpoint-Received: by B4 Relay for arinc.unal@arinc9.com/arinc9-patatt with auth_id=115
X-Original-From: =?utf-8?b?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240219_013627_119227_5EC47892 
X-CRM114-Status: UNSURE (   6.42  )
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

Hi.

This patch series adds port@5 as CPU port on certain MT7622 and MT7986
boards.

Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
---
Arınç ÜNAL (2):
      arm64: dts: mt7622: add port@5 as CPU port
      arm64: dts: mt7986: add port@5 as CPU port

 .../boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts  | 12 +++++++++++
 arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts       | 24 ++++++++++++++++++++++
 arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts       | 24 ++++++++++++++++++++++
 arch/arm64/boot/dts/mediatek/mt7986b-rfb.dts       | 24 ++++++++++++++++++++++
 4 files changed, 84 insertions(+)
---
base-commit: 5b6df373ec95cf051264f655be0dbe1d6caa173c
change-id: 20240219-for-mediatek-699a100bed94

Best regards,
-- 
Arınç ÜNAL <arinc.unal@arinc9.com>


