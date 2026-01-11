Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40BC1D2502E
	for <linux-mediatek@archiver.kernel.org>; Sun, 11 Jan 2026 09:57:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AB3v7OgmGAFXgsD5TNTtmR8HIva3gfSgg42d7+KBJoQ=; b=xM4mLGu2u3uaGoS/+GSnRyraZB
	aDHtTBTUIPMyk1FXRuj7dyb4wYj6RwvM7oudEz8juJau2WgJ4MozlPIHyOupM8CyYHX/Am9Lp4ZnO
	y4RwsSpmLmB5FMZcZvz9igmyMHzWkRRAJPA248aYEt55aLD7RfVvb6UKvVpjYtIX/Ei3Q93/57CZn
	B5MNsD14edI0H8Z7QJy94puFXaOOMHe051hXd+xJEdbLD6vE+gAvbuoiHkQ+BlSI7gFFWZvvAaO/o
	NMvflki8ZcStmA8VEVqr4dtmDsB2Eoh4B/yJlfGSaL2e9xtwLCz+LYYOseIwX6qmWLbI1Po2LzuAm
	Gbc7cnYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vesCU-000000046eN-2quM;
	Sun, 11 Jan 2026 09:57:34 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vesCS-000000046dU-1Ejd;
	Sun, 11 Jan 2026 09:57:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9807E404DB;
	Sun, 11 Jan 2026 09:57:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAC93C4CEF7;
	Sun, 11 Jan 2026 09:57:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768125451;
	bh=LcuRu7QBMVQ2NhCxvzk3SrGkmWCbJuuznLmrWMirm6U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nryXIcz/zs/Ou0XiVWVTj9+U+2Owemv+Bs1AENv376qAXdoh5hMBCvQESHkzASTU2
	 FNEdvOjZs1Figt8SpVT0Jk38x6fE40lym6uH0Czcw/13+/nOt2z0FVPrAGOSqiCvrn
	 Y3v7XVNX0XnhcxTpSmBaJOlVV7gP6V5TeaWdz1JfmGcO/EAevCrQPs4JdtqAribTWR
	 aBVQn0tzVvAzUkH8APmUYZF9zZZSQOrC5koXRdXNoOfsCyBOqDtanyLldhIt2KP3I2
	 D3FwaVFgpeVnEVj8HjGB2nUEyhQPjSbK47pmWfrnngvfnIMoIcfyFCaEf2QAVZUjLV
	 Exu9gvjg7h1ZA==
Date: Sun, 11 Jan 2026 10:57:28 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: lee@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, matthias.bgg@gmail.com, sjoerd@collabora.com, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, kernel@collabora.com
Subject: Re: [PATCH] dt-bindings: mfd: syscon: Allow syscon compatible for
 mediatek,mt7981-topmisc
Message-ID: <20260111-screeching-bullmastiff-of-resistance-ae7db9@quoll>
References: <20260109114356.36454-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260109114356.36454-1-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260111_015732_402275_6033D023 
X-CRM114-Status: GOOD (  12.43  )
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

On Fri, Jan 09, 2026 at 12:43:56PM +0100, AngeloGioacchino Del Regno wrote:
> Commit a95419ff9f21 ("dt-bindings: mfd: syscon: Add mt7981-topmisc")
> added the mediatek,mt7981-topmisc compatible to the `select` block
> which is used only for compatibility with older dtschema, but did
> not add it in the actual block allowing to specify the "syscon"
> fallback compatible, which is required for such node to do anything
> meaningful in the end.
> 
> Add the mediatek,mt7981-topmisc compatible in the right list to
> allow specifing compatible = "mediatek,mt7981-topmisc", "syscon"
> in the relevant devicetree node.
> 
> Fixes: a95419ff9f21 ("dt-bindings: mfd: syscon: Add mt7981-topmisc")

I don't think original work was tested anyhow on DTS because it should
report unmatched device nodes...

Thanks for fixing this.


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


