Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC160D30016
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Oct 2024 15:22:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Yg31Iqi1tiALTw0EmtZYWjPcISm1ItpTooNuUAfPO6A=; b=qN84jd/uOOCDbB
	ImkMNo6Up/FZsHpojtdiCJ3pBGi7+0DbJbCwaVR3JYaDlMSplrCtinS84cWshtSvAB3voR7d3UPjf
	O+i+ECjCRwQHNaEp5V68EaAayA7UjE7UqB27cRahXBu2hhdTTBBDLOm22m2GZtdxwvYEbjZ2aX21c
	SbEIojcfsgh/2tP4eA+7MyIjDZTENsVlHyNqaBYF0TCTTn/oS3X1PQM1H/uoHrkOM0j2TEyo48EZv
	ZMY9n5Uyj8lGB7vGBZoxrpU5DxENADt3bpNkGzG6JwoN2z126jJ77Rpr6o5IptZHpK88HMy1clBDI
	Gf9+pc+iOj1VNzwy7pNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t1ont-00000001B61-2sxa;
	Fri, 18 Oct 2024 15:22:13 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1okx-00000001AR0-0m2K;
	Fri, 18 Oct 2024 15:19:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1729264746;
	bh=UwPMKCaQO5+n3ciIjqo+WINUTZDFj4k3xLL2XjGRbos=;
	h=From:Subject:Date:To:Cc:From;
	b=BiQHe7IpC/W859WGSqcVMCN+JhALi2oC/xaRLcHyMyChZv/CZfybHqHs1NWRhtFVB
	 sGhV1+PFan29sig7N9qI9T+URF6PA3CVby+Po1CNB88AixI89bso8fR2gPsnnyAGAf
	 kyBYHiO5fu7c41By8SWRxnSMF7LPccxkz3sX+/Im/iArhNxYlU3q8vVVGzq2iyNqLA
	 nAmtD7TUSIsxPSwjg2s4/2ST1iFXAAWQ8j5RlVAfvcqLsAMOyeF8FWgVdOSEjYJzBQ
	 ERHksr5zQ/OJihw4ufVGFGO6n00bvhi87z3G2m/EOxsgggBDD2lwVr3OSExHHQ4DFF
	 /RuELhFsBc6Jw==
Received: from [192.168.1.218] (pool-100-2-116-133.nycmny.fios.verizon.net [100.2.116.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5DF1117E361A;
	Fri, 18 Oct 2024 17:19:04 +0200 (CEST)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Subject: [PATCH v2 0/2] Enable Ethernet on the Genio 700 EVK board
Date: Fri, 18 Oct 2024 11:19:01 -0400
Message-Id: <20241018-genio700-eth-v2-0-f3c73b85507b@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAGV8EmcC/3XMQQ7CIBCF4as0sxYDlIK68h6mC6TTMkmFBppG0
 3B3sXuX/0vet0PGRJjh1uyQcKNMMdSQpwact2FCRkNtkFwqwUXHJgwUDecMV89kJ1uuBmu0dlA
 vS8KR3gf36Gt7ymtMn0PfxG/9A22CcSa0Fe5q2osb1d3FebbPmOzZxRf0pZQviR7OJ6wAAAA=
X-Change-ID: 20241015-genio700-eth-252304da766c
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Richard Cochran <richardcochran@gmail.com>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, 
 Andrew Lunn <andrew@lunn.ch>, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>, 
 Jianguo Zhang <jianguo.zhang@mediatek.com>, 
 Macpaul Lin <macpaul.lin@mediatek.com>, 
 Hsuan-Yu Lin <shane.lin@canonical.com>, Pablo Sun <pablo.sun@mediatek.com>, 
 fanyi zhang <fanyi.zhang@mediatek.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241018_081911_395856_CBA33DB4 
X-CRM114-Status: UNSURE (   7.40  )
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

The patches in this series add the ethernet node on mt8188 and enable it
on the Genio 700 EVK board.

The changes were picked up from the downstream branch at
https://git.launchpad.net/~canonical-kernel/ubuntu/+source/linux-mtk/+git/jammy,
cleaned up and split into two commits.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
Changes in v2:
- Moved mdio bus to mt8188.dtsi
- Changed phy-mode: rgmii-rxid -> rgmii-id
- Removed mediatek,tx-delay-ps
- style: Reordered vendor properties alphabetically 
- style: Used fewer lines for clock-names
- Fixed typo in commit message: 1000 Gbps -> 1000 Mbps
- Link to v1: https://lore.kernel.org/r/20241015-genio700-eth-v1-0-16a1c9738cf4@collabora.com

---
Nícolas F. R. A. Prado (2):
      arm64: dts: mediatek: mt8188: Add ethernet node
      arm64: dts: mediatek: mt8390-genio-700-evk: Enable ethernet

 arch/arm64/boot/dts/mediatek/mt8188.dtsi           | 97 ++++++++++++++++++++++
 .../boot/dts/mediatek/mt8390-genio-700-evk.dts     | 20 +++++
 2 files changed, 117 insertions(+)
---
base-commit: 7f773fd61baa9b136faa5c4e6555aa64c758d07c
change-id: 20241015-genio700-eth-252304da766c

Best regards,
-- 
Nícolas F. R. A. Prado <nfraprado@collabora.com>


