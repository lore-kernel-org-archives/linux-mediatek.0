Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 431C5C4345F
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Apr 2024 20:36:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2oI9vTqf4D8hwy89KX6s24mObHr3f5c1vw23YcZOUnw=; b=bTXRrJwsSc3WPRMQ708590vDBc
	5OFtTI3oCHjTubGGjfMW91IHMVqaMx93SNN10msb5YAAr//1C1x6hSQpcEqxFzDXGhRBeU8FJMXW8
	/dDFPTGbEkhwajeDJLgPkRZHGF0rjHcOVmvm6PZdWZfu6RUqZzlLrXEfxnFJGD+PcLaOl1ohk8zAm
	hR9TxM6B+2RJNgN63rsuENKV+IDqet4NuWjFu87vbCPk3wpkzWbgKLYn/G2m/UTILefIVfcVsfNVH
	U4mf/6F5vy2Z012jL1Z+J84qkQfhAsqAnFP7yyMxf06qgEDehCVjWx0EHFJDNY6n9oPle+84EuAMK
	tyXbkHhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1uCp-00000007sU8-2tYr;
	Tue, 30 Apr 2024 20:36:03 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1uCm-00000007sT5-3mgY;
	Tue, 30 Apr 2024 20:36:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 168BA6166F;
	Tue, 30 Apr 2024 20:36:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CBC6C2BBFC;
	Tue, 30 Apr 2024 20:35:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714509359;
	bh=ZrTYOUt0FA8RjqCveMWIjHR3nc9J5/OM3ty8hfTg9GI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jrQPMK4hLHPa87bL2k3flGO/gsvssdliaH1YPOAemAm7HEAwwCqNtpaBbpe3M7TGn
	 lcJKx4gcihQA1LfwzLjMNH68CgI3ke/4jfH2s2qJXatuyhl5okeJajk1q1D99pH4DC
	 QBTav2x+XoHBZWNInVxieteVzcIuCuYSxWRwkiayIN8TY3VomEmTKRjv4RGT+VAzNo
	 XaVpiHwP/cq7/cIBPfo7cPzfy1swy+iLreQ668eNS0qy80wzhNHh39ysxNJ6pXeb2H
	 JWQ++KlFbdLuX5dZSycckNntGspE8lku0q3lcUPO24UpZ2p+l1hdWOAq0iqNYm5476
	 P1FD+rTDavcyg==
Date: Tue, 30 Apr 2024 15:35:58 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, devicetree@vger.kernel.org,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-mediatek@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] dt-bindings: interrupt-controller:
 mediatek,mt6577-sysirq: Drop unnecessary quotes
Message-ID: <171450933497.1152845.17182769192054572844.robh@kernel.org>
References: <20240426195404.2771046-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240426195404.2771046-1-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240430_133601_011957_04D267E9 
X-CRM114-Status: GOOD (  11.07  )
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


On Fri, 26 Apr 2024 14:54:04 -0500, Rob Herring (Arm) wrote:
> Drop unnecessary quotes which aren't needed in yaml. This is checked by
> yamllint, but this case was excluded due to the comma and yamllint's
> mishandling of some cases with commas. That's now fixed in yamllint
> 1.34.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  .../bindings/interrupt-controller/mediatek,mt6577-sysirq.yaml   | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Applied, thanks!


