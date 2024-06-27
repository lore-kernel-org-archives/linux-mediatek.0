Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AF03C2BD09
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Jun 2024 20:05:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=78r12OoBM4UWi382FFwcHcIC1FEZtJRx8b5B9X2haFE=; b=Emff5HGoUM+v1ZjvRirAy/Fi49
	5lzb3e5AfYznYiGCv6DCdMkvNLzHvrKSuzoVm9XMRO+/6BiZsns+S5JRugM+BnWxAlCjRIxEMbOt5
	cwpekUJtUgHZ4DvsTGwqrwjA9jw2L3tv9qWqnNHenFrET52vhva05vxpb5guqGC+ETpwXfrnTu5dc
	Y24+HCY6nvtnhKf5Krf3iMMSBXPzE+xyqmrj6iiRVWFODZrctoUT5KCw8GkafYGM3dt90lzqCOjkg
	chsW9j+rXo5HEzup0LiywtQqnDY99r7m23kaZXBAeuIeGtXttC0vQfP4FSMTi4gOe3YDwi0MdF+2b
	bBKHSWQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMvNT-0000000BZyk-3m4T;
	Thu, 27 Jun 2024 20:05:55 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMvNJ-0000000BZwr-3lpg;
	Thu, 27 Jun 2024 20:05:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 34E2C61E6F;
	Thu, 27 Jun 2024 20:05:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94157C2BBFC;
	Thu, 27 Jun 2024 20:05:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719518744;
	bh=FE5LwB4HXBRsoGB9+h+mvR30T3AMRQyyiUCPx6AJibA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Tec+vNI4sG/7Ti1RLprvNypZGPCnZzbOElovxV8ey0vBaoA25bDO8+Sdev08E7LqF
	 tulhYfqmL4+QD3GGENY2J4+RtUiB67WaEDA/CKwNNJp7lwlU7kmdS19OcHnt3DhJn2
	 Ir2osxCYd/WoCsLCXfHVxSBYA1UKb+v45IlR5XQsMbSm4slNgKPjgtNd0J0L1GS51v
	 CJAzCQjQhGrs9f3RQPcfqpLIaCEBQQ0eg9uiflzHCiuDezYQrRCgpaeUv0RM6+D1N+
	 rsxH6wTx0oaKBrCmHtZuXDkbHJJcmN11Isfvs/gjCqegEA0JwxBWB2kEbw88wyfEeQ
	 clzt1q3VRAhPw==
Date: Thu, 27 Jun 2024 14:05:43 -0600
From: Rob Herring <robh@kernel.org>
To: Kartik Agarwala <agarwala.kartik@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Lee Jones <lee@kernel.org>, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2 3/3] dt-bindings: mfd: mt6397: Add reference for
 mediatek,mt6358-sound
Message-ID: <20240627200543.GA439514-robh@kernel.org>
References: <20240617-mt6358-v2-0-5d9f0e99941e@gmail.com>
 <20240617-mt6358-v2-3-5d9f0e99941e@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240617-mt6358-v2-3-5d9f0e99941e@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240627_130546_012671_0FA5A427 
X-CRM114-Status: GOOD (  13.90  )
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

On Mon, Jun 17, 2024 at 05:58:26PM +0530, Kartik Agarwala wrote:
> Add reference for mediatek,mt6358-sound
> ---
>  Documentation/devicetree/bindings/mfd/mt6397.txt | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/mfd/mt6397.txt b/Documentation/devicetree/bindings/mfd/mt6397.txt
> index 10540aa7a..cf7fcc402 100644
> --- a/Documentation/devicetree/bindings/mfd/mt6397.txt
> +++ b/Documentation/devicetree/bindings/mfd/mt6397.txt
> @@ -48,6 +48,7 @@ Optional subnodes:
>  - codec
>  	Required properties:
>  		- compatible: "mediatek,mt6397-codec" or "mediatek,mt6358-sound"
> +	see ../sound/mediatek,mt6358.yaml

No point in adding this as this file should get converted.

Rob

