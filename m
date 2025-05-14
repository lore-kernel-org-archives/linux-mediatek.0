Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEEE5C3ABD8
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 May 2025 21:19:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LymtCL8q0wRLYA9Oqi89Yhj+qqgH6V3m3EvonFhSdBU=; b=dLFQeMqanHsqbV7S860z87KPc0
	1RdIJDXbx9lMTekf+POSTSNX2EuVsthEMASyoWymECzZcWSAQlHfrUoMvxoMmXUYFtMVXWWIPc3cK
	RluBfjtENhjcn6exo7ocNk+R80vawybtC61fp4wYrx5yEYewi3GxnAmhKVUV5rsuAjMDZ8LHhDVR9
	R5MtRstiSBH5uayFHDHZOAUux8byUVYYyZGGlUDghpoP+xPUOQGP0ANFMnk2N8rGomUHPVyZcRZwe
	frp9yaDp9LTOJYNID9awjIRsXQFXszfVrfeMbM/rG26LoeKxjxMZqT0eOdyFXNJ4YU8jATMcQYvx2
	4oWvYVlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFJVL-0000000GMaw-3WMn;
	Wed, 14 May 2025 21:19:07 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFJTK-0000000GMQ1-3Nr6;
	Wed, 14 May 2025 21:17:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 04D1C629E4;
	Wed, 14 May 2025 21:17:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B9DDC4CEE3;
	Wed, 14 May 2025 21:17:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747257420;
	bh=XqD9mQcmolD6PXXgJ20Lz/AYkecGTq+N8Hzsb17sSuc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=N8XT4RXFeMXxkFHhN3G5e7D+3lR2DVv7JoPlyoJ0CDr/gZSQsN4veiaikN/aQXCUk
	 R5PdppjlHSo0+Tn10FEYSUrcIZugSoP+ge/6AUju3208V4eJlxt8c4pdXJhblvvnPB
	 A5CV6eTdz14sxq+tHjMSI6CK/rk1dKpdiW3g4PFECTlpX37rn53iU7mqRb+pLWpA1K
	 giJr4dPDJpL6JU7f3CUuByPCGFzhII/CYeL7t+VQ5oT4tFgZSkWIcVw9lLzpRs3Ko7
	 ekXrit+GrBtevtHy8Sllrbow88oCXVQHubtKMH3fSznRWXXDMeg+FvxWco6vEcvGRV
	 C2INWW2po70pg==
Date: Wed, 14 May 2025 16:16:58 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Frank Wunderlich <linux@fw-web.de>
Subject: Re: [PATCH v1 02/14] dt-bindings: net: dsa: mediatek,mt7530: add
 dsa-port definition for mt7988
Message-ID: <174725741810.3051350.2895104132991545164.robh@kernel.org>
References: <20250511141942.10284-1-linux@fw-web.de>
 <20250511141942.10284-3-linux@fw-web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250511141942.10284-3-linux@fw-web.de>
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
Cc: Andrew Lunn <andrew@lunn.ch>, Landen Chao <Landen.Chao@mediatek.com>, Daniel Golle <daniel@makrotopia.org>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Lorenzo Bianconi <lorenzo@kernel.org>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Sean Wang <sean.wang@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>, Felix Fietkau <nbd@nbd.name>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


On Sun, 11 May 2025 16:19:18 +0200, Frank Wunderlich wrote:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> Add own dsa-port binding for SoC with internal switch where only phy-mode
> 'internal' is valid.
> 
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> ---
>  .../bindings/net/dsa/mediatek,mt7530.yaml          | 14 +++++++++++++-
>  1 file changed, 13 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


