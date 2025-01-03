Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3680DE77188
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Jan 2025 09:12:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r04OZrJXp6kd1rDCdCss3q2JDo1ncyfjGQuxvP7B3Wg=; b=QOwKMGtyiao542rwZdWIqF4Lx+
	vDTb22JiEDh8MDyq/6arjVnnl0HzM4VchlQUfjNTNZ7qaw4LSvS7xhwUBYNsBdZtnzixEUYFIQPdX
	f5mGOGS4GbYLfk4IPYcDdBSCP3VF0s+iSskuEqDjleKUVIOl8N+TXhVLo/JJtxWx7JLxEH4jsqTwm
	/n825DamtLfYzIV5h6vj2Pcs9+WhTBlgoP1y8R1V/cQMNGhTcimfSUADjZ4/Gk4Y52blJFv27RUWz
	xlt72PHhbcnLuw7M6IXqm7yqr3Uki8Z3Xb+2f6IiJVX0evplLBVBLAA0K/FfYK7B0SAmj5xpuIlHA
	BuTcAxQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTdj4-0000000CYkB-2KHS;
	Fri, 03 Jan 2025 09:12:15 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTdhq-0000000CYa6-2T5r;
	Fri, 03 Jan 2025 09:11:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 5A44BA404B1;
	Fri,  3 Jan 2025 09:09:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 733F8C4CECE;
	Fri,  3 Jan 2025 09:10:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735895457;
	bh=g4yapdXI+l0EgvPcvBnHQ+oGbw0TIJA2mVOnFMmAxL0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=POvx8f3xZItDhKn/eWkorSk5VxsPGdhFkStm07SKBO1ZFtBowKehMtVeUbpr96zhl
	 Wn7M8ABJeIYND0JJ7+acCuiqplpILMU9rLSMuaa2JXCt4z32u3EBEb0JQUax8f6e44
	 MSDRxSBegPG0V2D1M8AHBay+N9a/kaXw8uSi5znNLI1pbobpLVCe5UKRtp3I9mIG6s
	 eniJtKy26EetRbVpnto75BWoKs0x3X+zR2HhoWvqr3z2QFgGw2RbHuqqJWGNPtGdTj
	 A0fqozMcFDOjkkbLJfgRpH34ATxvAFpvPJVbnLKKikPfn5vubgqQAhFZ0Py8hHpcpU
	 u7r1XX4KBAM+w==
Date: Fri, 3 Jan 2025 10:10:53 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jianjun Wang <jianjun.wang@mediatek.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Ryder Lee <ryder.lee@mediatek.com>, linux-pci@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Xavier Chang <Xavier.Chang@mediatek.com>
Subject: Re: [PATCH 1/5] dt-bindings: PCI: mediatek-gen3: Add MT8196 support
Message-ID: <ndj6j2mmylipr7mxg42f3lcwgx55cvcjnuuofmlk6n6t5uz5pr@bxugolyfublc>
References: <20250103060035.30688-1-jianjun.wang@mediatek.com>
 <20250103060035.30688-2-jianjun.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250103060035.30688-2-jianjun.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250103_011058_691532_75B81F75 
X-CRM114-Status: UNSURE (   7.20  )
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

On Fri, Jan 03, 2025 at 02:00:11PM +0800, Jianjun Wang wrote:
> +        clock-names:
> +          items:
> +            - const: pl_250m
> +            - const: tl_26m
> +            - const: peri_26m
> +            - const: peri_mem
> +            - const: ahb_apb
> +            - const: low_power
> +
> +        resets:
> +          minItems: 1
> +          maxItems: 2
> +
> +        reset-names:
> +          minItems: 1
> +          maxItems: 2

Why resets are flexible?

Best regards,
Krzysztof


