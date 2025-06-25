Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CAEDC7EE2A
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Jun 2025 21:38:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WtFTJfF6gIKQ2nNjQqOnc55REx3wzdOuI73n1KphcxY=; b=e5kAqxNut+gA2K7fTE6C4Gy53V
	l3XrTaNPH5RxWB7wK9p/MtJFygEI0UG5IzLiWoxBb4Wt0ZC68PPg7o7X8lZRystrANlWFRTEre/PD
	Xbg+uAfKRhZL8abM/wBFk+f84dVQJmnA3g1wRdfW4LW0zSY0n5cXBWZgqEhYf4K9BxQdB8SkZhfIJ
	u+57eA2JPiic/jPPmzbew/+ar0vFn34+Fyd0rtAJ4UUigV4vZaMKE2DXZF6rehBFnXDsXb/iifBjH
	c4SCaeeYYAtqIG8JlMKbW4lckDP9PUNFakOGeDH8ahfTuF09ILGhmlRWZrP8xXlxwIT1mPmn9d+xK
	nj4+DPSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUXpa-00000009yjb-0rsO;
	Wed, 25 Jun 2025 21:38:58 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUWUo-00000009ol0-09tn;
	Wed, 25 Jun 2025 20:13:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 3B236A52E4F;
	Wed, 25 Jun 2025 20:13:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B437DC4CEEA;
	Wed, 25 Jun 2025 20:13:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750882404;
	bh=zPNkKYayJIxWTUaQnmIIX16h79rDQcRVFOg5N+6RMbY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uUguQlRutLZB2kKQ6PnH4vIkUeBzHe5x+mixpdSni6mitWR5mhUOUL2sySgP72aHB
	 L4dz6RNCtbVIMRri4m9+NCGom6RdOzRXwCf63a5zZSDItNxHTjpMh7xEPcVKhL8fZ3
	 4PaHLD9uOm0Jg/tZPKPL//MhqChA8KEeJqQYrZ5jR8/OmDdiz5rw6fP7uE1AVmPb5N
	 pQaTyh8wDHi8D7IUOPD89lr83ZJxqGmwBW2MHbONymszfIfkE0WR5XCKUZxE8vrlQH
	 2t/r9Rn2RPa0Rp1T3txmSJ3Oq2cRr/p/cZQTtYg+TnyAukV9AerUSDdLPrXI6wA4nw
	 pWSsZ7yIOBtlA==
Date: Wed, 25 Jun 2025 15:13:23 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: gregkh@linuxfoundation.org, linux-i2c@vger.kernel.org,
	jirislaby@kernel.org, linux-serial@vger.kernel.org,
	devicetree@vger.kernel.org, conor+dt@kernel.org,
	qii.wang@mediatek.com, andi.shyti@kernel.org, kernel@collabora.com,
	linux-arm-kernel@lists.infradead.org, krzk+dt@kernel.org,
	matthias.bgg@gmail.com, daniel.lezcano@linaro.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	tglx@linutronix.de
Subject: Re: [PATCH 1/3] dt-bindings: timer: mediatek,timer: Add MediaTek
 MT8196 compatible
Message-ID: <175088240336.2135179.14074379043587358741.robh@kernel.org>
References: <20250611110800.458164-1-angelogioacchino.delregno@collabora.com>
 <20250611110800.458164-2-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250611110800.458164-2-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_131326_145660_E56EA268 
X-CRM114-Status: UNSURE (   9.07  )
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


On Wed, 11 Jun 2025 13:07:58 +0200, AngeloGioacchino Del Regno wrote:
> Add a new compatible for the MediaTek MT8196 SoC, fully compatible
> with MT6765.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  Documentation/devicetree/bindings/timer/mediatek,timer.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


