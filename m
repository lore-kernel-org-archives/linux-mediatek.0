Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C35C8C25B78
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 May 2024 21:02:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VhpruWxb09+al00bGpM9A5Ywv9FhHLsJlQLSu3+dYms=; b=NUIgRkJ6DCQrtP7BWNkjjKRWLD
	qal+qE//rzEKrgj14q1ukwlmUGqoMnARRhMYi3TkqCBGxjZs1DHg4PG5fFZoVWfMvOouXbN+14dug
	7+7G/0bN3vOkRfbAtf4MCMsUbsueT8DrPYFjopgNG4A6owfgPPPaqMPiiqqHtzfHfj2DoBYKj0MIc
	fcGQMpe9qiJxRWPjVHJ9GGElVsk4D26riZFeytk6Z+nICVndYaGdz3DG1YOkkHq3ZxIQ0dQ+XcyyY
	Jl7EhCIZuwrNPfch/MBIxRKb+y5QuhTP4jXJK1bEIZsNnLUKV6J/I27FGg7VfN9KyWQDike+on3XV
	Ky44Fmkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9A9O-0000000FXnm-1cDR;
	Mon, 20 May 2024 21:02:30 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9A9L-0000000FXmn-1IM3;
	Mon, 20 May 2024 21:02:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 30F00CE0BD3;
	Mon, 20 May 2024 21:02:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41301C2BD10;
	Mon, 20 May 2024 21:02:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716238944;
	bh=5q5CJe3cUTof/pZ8TF7USfHcDrM0ecb8vNHWkTDfkZg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=d+5tbO7XWyVTROzUUI+GqcfH3xJV8WnqEx7V2KkcTNCBTGJoXqVLoa/OKSOU6y3Rn
	 eccIE2eRkzFUiELI0lXxFF4DqznBSnRPhZYf/FHh4A+d1mxuHHu6V19OLZTPEEXPJd
	 lkfp6iK02cHVtK1/wjx/jtO+zHKLKUw/EXN1wkVwkKt1AaE6eI9n9isI4ONBnQ72tA
	 HuhEUtHfQawg97AMNp2reCIhXP9LVjfMAj+W88b5xJbo8B/uvV13reHmvvDPRYdt2H
	 OPJB5I67/LjG1g7zWZvf9/oOpFRIAPKNGzQgqGm9Zqrnjy9cQ40eSwb0QUjeByFL4x
	 wjt6Y65CI6nGw==
Date: Mon, 20 May 2024 16:02:23 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	MandyJH Liu <mandyjh.liu@mediatek.com>, devicetree@vger.kernel.org,
	Lee Jones <lee@kernel.org>, linux-mediatek@lists.infradead.org,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH 1/4] dt-bindings: mfd: mediatek,mt8195-scpsys: add
 mediatek,mt8365-scpsys
Message-ID: <171623893985.1474490.13998302237975026770.robh@kernel.org>
References: <20240518211159.142920-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240518211159.142920-1-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240520_140227_640033_94897F95 
X-CRM114-Status: GOOD (  10.28  )
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


On Sat, 18 May 2024 23:11:56 +0200, Krzysztof Kozlowski wrote:
> Add a new mediatek,mt8365-scpsys compatible, for the SCPSYS syscon block
> having power controller.  Previously the DTS was re-using SYSCFG
> compatible, but that does not seem right, because SYSCFG does not have
> children.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../devicetree/bindings/mfd/mediatek,mt8195-scpsys.yaml          | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


