Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43956C4345F
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Apr 2024 11:36:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e3rpvx8CewU927cy2VDrV6y53+rbNznsqtOfYN+rLXQ=; b=LEFyc3bOZ+ZNDgHxoLoKEOKyGQ
	WifTG1OlWnUDZqhWlXxINwV7f8+7a6WV6aNJZ3NBwYWtcJtUXOmV06KkMtVykViPdFhWxBSlb0ysc
	OqKmKQQyyeWQK7TGKS29TLPNXuac3agI83anwx1cnThZAeI+I+hXbOkEb+XarUnBOUZbiCkFCdoW2
	NG2eZ2/EaMSRjau1F2Z8tFdjlMXFPK3w+AyJpkvLm5mp80S+ZUuogs2SNU8+ele05QD8rE7dz3vHs
	kjDnTxE1gYWwJP4yVRBWHU1mNZNHqFi6rmye8iE7FcRduQTI0WHlhnE8G1duIUX4IQxIEWMQ7H9xs
	PjZp89ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvFCU-0000000GxPv-0M6O;
	Fri, 12 Apr 2024 11:36:10 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvFCN-0000000GxKq-2WK0;
	Fri, 12 Apr 2024 11:36:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C1BA2621F2;
	Fri, 12 Apr 2024 11:36:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA4EFC113CC;
	Fri, 12 Apr 2024 11:35:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712921762;
	bh=45cFDE/PDUHtIcaaHwj8IYsNzYdpntdj2aCgK/pRFXs=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=BFBr7Ba1JN9wm3zN/q42MzXb7lkG1Tjv67VUZoc5X7TxPXH3hGhtOPL+oDr47vi06
	 PYHtlu2K9ePQpbT5GKyjlwUfUq6z2qcJB3djc05XmWyvBdIKWsp1mKY3XkH9aFeYVP
	 EomH/3KWPfY5ZaqJx9UtaSxulfqCk7GVOszL5mE6xOFazlUaqmqNE8LuDfv0FDWUQS
	 ueFpNmul0aKJXQpxmreVXZMNuXch9wEoq3EziFkVClRdsC9oYDnGQm/AXYkn2AJYsk
	 GPrppQX0zjmwyANJ/TZoHEN8l/531YISlEmc6z40A0imi8VD5QYufedjZxund5HdDE
	 2ZOEPVi/KGlYA==
From: Vinod Koul <vkoul@kernel.org>
To: Bc-bocun Chen <bc-bocun.chen@mediatek.com>, 
 Steven Liu <steven.liu@mediatek.com>, John Crispin <john@phrozen.org>, 
 Chunfeng Yun <chunfeng.yun@mediatek.com>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Qingfang Deng <dqfext@gmail.com>, 
 SkyLake Huang <SkyLake.Huang@mediatek.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
 Daniel Golle <daniel@makrotopia.org>
In-Reply-To: <745f8b46f676e94c1a396df8c46aefe0e8b4771c.1707530671.git.daniel@makrotopia.org>
References: <745f8b46f676e94c1a396df8c46aefe0e8b4771c.1707530671.git.daniel@makrotopia.org>
Subject: Re: [PATCH v3 1/2] dt-bindings: phy: mediatek,mt7988-xfi-tphy: add
 new bindings
Message-Id: <171292175438.599803.12725341666567867086.b4-ty@kernel.org>
Date: Fri, 12 Apr 2024 17:05:54 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240412_043603_818782_AF32F0E3 
X-CRM114-Status: UNSURE (   5.77  )
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


On Sat, 10 Feb 2024 02:10:08 +0000, Daniel Golle wrote:
> Add bindings for the MediaTek XFI Ethernet SerDes T-PHY found in the
> MediaTek MT7988 SoC which can operate at various interfaces modes:
> 
> via USXGMII PCS:
>  * USXGMII
>  * 10GBase-R
>  * 5GBase-R
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: phy: mediatek,mt7988-xfi-tphy: add new bindings
      commit: f482f76c9d0933b91f32f170fbc421a4d0ebaf56
[2/2] phy: add driver for MediaTek XFI T-PHY
      commit: ac4aa9dbc702329c447d968325b055af84ae1b59

Best regards,
-- 
~Vinod



