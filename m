Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02D12D1D893
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Oct 2024 18:23:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=RAxPJw42cMpAsnPV42dMGiZ2vWqfpdtK8rf8Pyb/9GE=; b=ME7Jytu+m0YHpk
	41nnOSYQf/0ca1yuqbpCbH5SfXPHOeD6t0KJsffHEl7GpCi3Q6lLFM1YwIO3nGaeVm6zYTxwYQwYe
	flxyTnpSIfZiU44AmU28udIR0zBlW5zlToM0XHJ+UVCFjalLa4YtP99d94c/Q0+ZkaispZlbSSw55
	zucCa0VtNgggPyrvAb1rGDiUhZNCa4MrEx+X+SdpbgyvZaYnmFTP2EHvS/z/7OYkLlRftATg7HyvV
	icq64BoqJhquzMOlJCgz8O09j1L1juKDN7UcSPlFNU9MbQT/arIR5/ih2f4UaNC96QnP6PoPJHsTE
	Oa8GXIAG7iPwTm9v5VKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0mCF-00000009Aw8-0S6f;
	Tue, 15 Oct 2024 18:23:03 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0m9g-00000009AZA-3DSk;
	Tue, 15 Oct 2024 18:20:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1729016421;
	bh=xlJulwgFadsww1fxuY/kdqupOC+XrWysfnSRy7xGE1Q=;
	h=From:Subject:Date:To:Cc:From;
	b=Akl35Y1Nf6JAV23EHQ1lKZaz2LzFQPmujxrUcTdcGTTOaBPjJ8YCMZcR+C5u+ccCQ
	 pta/nIQ+eJPSQPO03pogjoFtXgeO7S5rStsaS+F4gu0BosaQp9iZAMLVh9Vb72NzOE
	 fx4sJ/G97bpMsQgchqabMQkeCDoThib27vDXb/IhacuIo07CLOa6tZo1MVIwewk5pV
	 RHAj/IKzk12H/0h2inkDyCQpPdH9S61r+OXw3l0IWs+filtdSLUAOZ6gUj3tZ6K4mi
	 nGIBf3Dwefwn+oCkzJI53nPKmoStF8h+LpjZ6tYKCiJubkwvRDWeCL5qfWA650pcZz
	 O3MWQ2fo6LomQ==
Received: from [192.168.1.206] (pool-100-2-116-133.nycmny.fios.verizon.net [100.2.116.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id DAFC417E3687;
	Tue, 15 Oct 2024 20:20:19 +0200 (CEST)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Subject: [PATCH 0/2] Enable Ethernet on the Genio 700 EVK board
Date: Tue, 15 Oct 2024 14:15:00 -0400
Message-Id: <20241015-genio700-eth-v1-0-16a1c9738cf4@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIACSxDmcC/x3MQQqAIBBA0avIrBNGK4WuEi3EJp2NhkYE4d2Tl
 m/x/wuVClOFRbxQ6ObKOXWoQYCPLgWSvHeDRj0pVLMMlDhbRElXlHrWI067s8Z46MlZ6ODn361
 bax/KJmqpXgAAAA==
X-Change-ID: 20241015-genio700-eth-252304da766c
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Richard Cochran <richardcochran@gmail.com>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>, 
 Jianguo Zhang <jianguo.zhang@mediatek.com>, 
 Macpaul Lin <macpaul.lin@mediatek.com>, 
 Hsuan-Yu Lin <shane.lin@canonical.com>, Pablo Sun <pablo.sun@mediatek.com>, 
 fanyi zhang <fanyi.zhang@mediatek.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241015_112024_991072_F0010EA6 
X-CRM114-Status: UNSURE (   6.22  )
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
Nícolas F. R. A. Prado (2):
      arm64: dts: mediatek: mt8188: Add ethernet node
      arm64: dts: mediatek: mt8390-genio-700-evk: Enable ethernet

 arch/arm64/boot/dts/mediatek/mt8188.dtsi           | 95 ++++++++++++++++++++++
 .../boot/dts/mediatek/mt8390-genio-700-evk.dts     | 25 ++++++
 2 files changed, 120 insertions(+)
---
base-commit: 7f773fd61baa9b136faa5c4e6555aa64c758d07c
change-id: 20241015-genio700-eth-252304da766c

Best regards,
-- 
Nícolas F. R. A. Prado <nfraprado@collabora.com>


