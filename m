Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CA5FC369DC
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Apr 2025 21:45:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pI1fP3SU9RDRfMl978btmIIMu2VXIi0IDq22V71qH48=; b=zDzz1wgKz3NPRKcPntP+Cx8OMv
	wMGkxicpUJ4vTE4zJ5ofWAO5HahVo5UCdE5LDNa/do45YKRH2gKZnYvWMWrDY3/rvTS3GK5ui50tm
	a8YyeCM2EOjja2zKXi4hkgN5HrMea0k0OSmWRmWNHgy1N9nJQ2v2MUVNRYTCPNAaBb/y/72OanSwP
	cm//WqIZbA7/sFSQXV4Gd9/sOsQ61soDdeFodAxHXdzCNpfKRHMdg2RRZgZVeari280BHrpKGk5Sg
	LBORQ5S6ZcIefqFtp3gmWvv7rH/fnKdpZpc9wDUUymZgm2iB+0u34oNJU4Oq2l1kiKPy5JT+lA5gE
	sS5ul7Tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9slD-0000000AtSi-263U;
	Tue, 29 Apr 2025 21:45:03 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9sic-0000000At8w-2peb;
	Tue, 29 Apr 2025 21:42:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B5E9744FCC;
	Tue, 29 Apr 2025 21:42:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C0DFC4CEE3;
	Tue, 29 Apr 2025 21:42:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745962941;
	bh=ZcjOsmCvWQ9kEExyzI58z4KQxafFY5Y4gSQ0njQDjII=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=udVGbX89zU8DeYmtFGU+gzWJlcMtURBcxIH4Psb+cVWjOfnZupIH1yPFYAcfS2wpH
	 8vxF5+/cJtINC7hRKLxvR8VVewkoJjKdxjFpi/3OFf+rs43TeGnIo72DrUTimtSMEP
	 NWnq94MKjTZvke7TabGqu/VEfkZZ1Dgb8JUPz5r5gyKaNClUv3kHTP7BI84oaSRpLR
	 uHZlXnMon8R4kZjlXXXlwPxWCQ3qI1E8cuPwEBWJXYNeVMP6na6Ne5cgbE3hG1IpK0
	 p+CAet7cAUBatY9HTflZ3Lm4C22ZXKusib7ZZ6WvnspIt8R7UK2u1tK/snOxJ2lgBQ
	 A6YG+6b3YwIsA==
Date: Tue, 29 Apr 2025 14:42:20 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Daniel Golle <daniel@makrotopia.org>
Cc: Chad Monroe <chad@monroe.io>, Felix Fietkau <nbd@nbd.name>, Bc-Bocun
 Chen <bc-bocun.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net v2] net: ethernet: mtk_eth_soc: fix SER panic with
 4GB+ RAM
Message-ID: <20250429144220.5d22fc1f@kernel.org>
In-Reply-To: <4adc2aaeb0fb1b9cdc56bf21cf8e7fa328daa345.1745715843.git.daniel@makrotopia.org>
References: <4adc2aaeb0fb1b9cdc56bf21cf8e7fa328daa345.1745715843.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_144222_732674_DC2655B7 
X-CRM114-Status: UNSURE (   9.51  )
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

On Sun, 27 Apr 2025 02:05:44 +0100 Daniel Golle wrote:
> +		if (MTK_HAS_CAPS(eth->soc->caps, MTK_36BIT_DMA)) {
> +			if (unlikely(dma_addr =3D=3D DMA_MAPPING_ERROR))
> +				addr64 =3D FIELD_GET(RX_DMA_ADDR64_MASK,
> +						   rxd->rxd2);
> +			else
> +				addr64 =3D RX_DMA_PREP_ADDR64(dma_addr);

I guess it's correct but FWIW it reads slightly weird that in one
branch we use FIELD_GET() and in the other "PREP". I get that the
macros are a bit complicated but to the reader its not obvious whether
the value stored in addr64 is expected to be shifted or not =F0=9F=A4=B7=EF=
=B8=8F

> + rxd->rxd2 =3D RX_DMA_PREP_PLEN0(ring->buf_size) | addr64;=20

