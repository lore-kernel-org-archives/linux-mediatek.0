Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25F38C369D5
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Apr 2025 21:37:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dhe+SbYbJp5claNB2JYrTv7+Uu5yfGVCEgLDmkNyFUo=; b=KNCoMIpnayK6kcKwBnIpKfTlml
	ejjZb59uY0frSc/UdwZtluC6vx8EMuJnVpDNMEXdOO3uz8dk0HmrbFKrNE+nN55I1fLF9DLTMeu0N
	Sz0RrudkrerVyATZA65IHu+Uel07V/GNQZfrxGVEnXR5B98x5DLbh1XEFyGixDCI9r639MrFi+rKh
	JDW6DAbwPJpuoE6gRnNubLc3DhBZX3Ee/6rAvYnDh5Q0Ax3PXRXWlCimdA9JVmPu0A/2sWZqZD2Qm
	rYbPOS0eiLHZVjthxLsMETSaTVd4Xtf62FNEgt4RvQ+cMco/5vIJTXAedX9CK94S9g90zY4I9slv/
	iPaQDbMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6ypo-00000005C2I-11q3;
	Mon, 21 Apr 2025 21:37:48 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6ylW-00000005Bas-2SQh;
	Mon, 21 Apr 2025 21:33:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 751F261364;
	Mon, 21 Apr 2025 21:33:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33F67C4CEE4;
	Mon, 21 Apr 2025 21:33:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745271201;
	bh=Xx+6cpWE1kjaraijDBvdCNjbdF2zjzXih7eBRZD0yvs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=k9pGxRxH/UgCZOvI4Zk6EjYMfXppgkIHmHzfoJwkNRNCrBdMyStejGKUfMBX+5fXq
	 VCpxF1jSKykmzz5K0Sw/qysXNVzGRoVelDA2CKPHMsLuRCYCsJDEFBYmY5hEMGDKHJ
	 lfk3nbi3MlnvM5TEPX0r1HD3EYwCGB6xKz/PiFTb92bS0JbC2+XrnKwv7ZUCyHJ8Xq
	 0DDSU9KzunyA34JF8VqV9MI+jgg0yEQ4pky0afnTTCpZ1lCv8/rif5RTpByyHlaXaN
	 3+7hq2j/kuLyBTqIeL0dT3vSLJOYAWUG/0thc9ZM8VH1mjFLEUtqm/JuZ3R34VlAIk
	 Y4rXO++chZKyg==
Date: Mon, 21 Apr 2025 16:33:19 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: krzk+dt@kernel.org, devicetree@vger.kernel.org, kishon@kernel.org,
	matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org,
	vkoul@kernel.org, linux-phy@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel@collabora.com, p.zabel@pengutronix.de,
	chunkuang.hu@kernel.org, conor+dt@kernel.org,
	chunfeng.yun@mediatek.com
Subject: Re: [PATCH 2/2] dt-bindings: phy: mediatek,tphy: Add support for
 MT6893
Message-ID: <174527119912.2965252.1352584821821232964.robh@kernel.org>
References: <20250416120220.147798-1-angelogioacchino.delregno@collabora.com>
 <20250416120220.147798-2-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250416120220.147798-2-angelogioacchino.delregno@collabora.com>
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


On Wed, 16 Apr 2025 14:02:20 +0200, AngeloGioacchino Del Regno wrote:
> Add a compatible string for the MediaTek Dimensity 1200 (MT6893)
> SoC: this chip integrates a MediaTek generic T-PHY version 2.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  Documentation/devicetree/bindings/phy/mediatek,tphy.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


