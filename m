Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8706FEED600
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Sep 2023 14:56:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G+FmSK4OYiySI/RAsatat8eRVjHemVZDoDWFFkjY3y8=; b=lgkUoZ974bRtncNo6UhR3M+tUv
	+WphpILtUeMDq4QQ5rSHFpg3P+DrP4fvDukBMBlRzemkdk4CFyNuu2KQ1WSjyQauiGofne4GBse2D
	p2Rjq08642ObTxAibQNFlh2AfMvEYy29P7Tbstt85N7ZidPnY+iFr0gJsoOrFoWHbsQuqEigL4E04
	dRCVHlv67mHFqksbEnvRyux4AePYL8fTCU6oxAhFya3UATvaJNZY5bjicK5YgMRF11VFVF+fDCZxT
	uHKPU1w178LY41G4Pcg2kA3+hcHY/geQdmeAZL0IVlGVXwQdFhbC0sZeWOqevLFAcu+xesJOTmhuy
	fpJch45g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qhAFa-00AvaS-1O;
	Fri, 15 Sep 2023 14:56:54 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qhAFY-00AvaB-0R
	for linux-mediatek@lists.infradead.org;
	Fri, 15 Sep 2023 14:56:53 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 6EBC9B82DDC;
	Fri, 15 Sep 2023 14:56:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6887AC433C8;
	Fri, 15 Sep 2023 14:56:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694789809;
	bh=LoCrUjxTrM7KusHCy4cbH8DfNMI1fL9H5DnYG6fNdi0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V0KLM/HvwHgWJagNlleEId/qTHItTQcLgUjqmRIUWFwbpSNtAajZHhTirtm2YRtNd
	 KP8/FkhR9iGhCq/W3AfwJyEIt0Fmdb+GQxBRvDaCa7ifOMtC6SRr44ZQG0SL4UhHk7
	 pH0noXC24PxdZGB2StaHYe/jHxFzDtINdDaLP/LYp0HYknWY6fgt6onpONjbkXOnuC
	 lJheMIcVCVhrM29q5YhiHPkFmZqFFCSb1J7oHQvddiKEyOycSeFwDoi7sVucq+gUpg
	 C6GysGmaLlROOy7NhV8SfMAiBX+1kCrqB3ZKh1Onc4KT8lSQOu2lvmrQOLyLwYblVk
	 kYeoa2VixiImg==
Received: (nullmailer pid 3715285 invoked by uid 1000);
	Fri, 15 Sep 2023 14:56:46 -0000
Date: Fri, 15 Sep 2023 09:56:46 -0500
From: Rob Herring <robh@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: linux-mediatek@lists.infradead.org, robh+dt@kernel.org, Mark-MC.Lee@mediatek.com, daniel@makrotopia.org, pabeni@redhat.com, krzysztof.kozlowski+dt@linaro.org, kuba@kernel.org, john@phrozen.org, sujuan.chen@mediatek.com, netdev@vger.kernel.org, edumazet@google.com, lorenzo.bianconi@redhat.com, sean.wang@mediatek.com, devicetree@vger.kernel.org, nbd@nbd.name, davem@davemloft.net
Subject: Re: [PATCH net-next 01/15] dt-bindings: soc: mediatek:
 mt7986-wo-ccif: add binding for MT7988 SoC
Message-ID: <169478980538.3715231.16721383974701805812.robh@kernel.org>
References: <cover.1694701767.git.lorenzo@kernel.org>
 <148f4f9ff2ec891955f9e9292aff9595f07beded.1694701767.git.lorenzo@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <148f4f9ff2ec891955f9e9292aff9595f07beded.1694701767.git.lorenzo@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230915_075652_344763_12065035 
X-CRM114-Status: UNSURE (   8.55  )
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


On Thu, 14 Sep 2023 16:38:06 +0200, Lorenzo Bianconi wrote:
> Introduce MT7988 SoC compatibility string in mt7986-wo-ccif binding.
> 
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> ---
>  .../bindings/soc/mediatek/mediatek,mt7986-wo-ccif.yaml           | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>


