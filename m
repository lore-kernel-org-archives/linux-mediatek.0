Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C643EE0217
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Sep 2024 08:26:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2p4Q52cDvvZYvMhMLehI/BxIvk1yd4QnTafRJLeGvy8=; b=0cQaGhcq9bXoeoDlqNxH/EKnKs
	0dfuJ2wdUg/M8zLz2C5wLRl8k4pNQGOli/eY8UXYi0JDohYSH2Tgs1da8SFRMK8Ap+30YSVEH5Zg3
	Rp6ss1kfRwGbSLemY1bpZ+gMuLyOWYB2aM7wgGBmqM8GFriSBsGHfXV76fls30mgWMsGjNAghHZu2
	GwFAwHLtM/aE2SWkO+8xiu5JcqbsWa/yXqZytah7zuTBuxZ4AWhksd0mWEuNeggJ3CgNCHQGBDoci
	TJNYgWFrzkhh+yV2OCb0TojC1GXQ/kcskAmmHn/fIrhXCwik5ND9n+0aV5da9/JTT+7IIJ+8ES303
	FiHXS7xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soIgV-00000008dxA-27Re;
	Wed, 11 Sep 2024 08:26:43 +0000
Received: from a7-31.smtp-out.eu-west-1.amazonses.com ([54.240.7.31])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soIeN-00000008dIz-2tcC;
	Wed, 11 Sep 2024 08:24:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=4232tfv5ebdrjdwkr5zzm7kytdkokgug; d=collabora.com; t=1726043067;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=698wQpzFq84To+s/WCVIOmpSbbSmg4VSicihqf9qw34=;
	b=adGKKc5NT2ZFSl95Fm2PZ6Z+//DbP/dttZO00kj4pks97lOTKrjysIAfeVjB0z/h
	nys7hYP1QKJeIcJXZIPtyA825I4f36sC3Rzmg6S+8cZnmd/gbiejjPRABEs7amxUoSC
	7cUrYC+dHyTFgIDHPnHmL7gt6BgThMdCapdaRKizjD92YeOpfeQump11KKcWh9DUZqi
	bSRDSvHJ+RHxIycBUyPpVtHbb+iX2PBGWG2+HbaDxI2O5NtEoe3rvFz9nUr0dQO5mNH
	shZcEDzJ0Smxa0DgKcLHNTjyRyokFp7lbltK25Bm/uoH01DRwFoG02p2jGP1gObbr50
	WIVAS5L32g==
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=uku4taia5b5tsbglxyj6zym32efj7xqv; d=amazonses.com; t=1726043067;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Feedback-ID;
	bh=698wQpzFq84To+s/WCVIOmpSbbSmg4VSicihqf9qw34=;
	b=U9Qi49xifLwDGMtHMpHh2nQqpgp5SGgpN7gJmQ8YVGnWUcEoKm1ZpGPrQYfbgWYy
	eUQ37fgpjVj6Xg+k/agsrJXYVvIphsuPGMQiyPYJxOnEFYj004w0aGIaRp271uLAAD7
	/QLaO3RjCZ4qLnu6VrXrVHkY4lGTZJOUnGQHH4TM=
Message-ID: <01020191e02f1538-47c02c52-c508-4cf3-ba84-fc339b55047c-000000@eu-west-1.amazonses.com>
Date: Wed, 11 Sep 2024 08:24:27 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: clock: mediatek: Drop duplicate
 mediatek,mt6795-sys-clock.yaml
To: "Rob Herring (Arm)" <robh@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
References: <20240910234238.1028422-1-robh@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240910234238.1028422-1-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Feedback-ID: ::1.eu-west-1.YpP9ZbxnARFfy3Cb5pfsLd/pdsXBCNK0KEM7HforL4k=:AmazonSES
X-SES-Outgoing: 2024.09.11-54.240.7.31
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240911_012431_972915_57156F33 
X-CRM114-Status: UNSURE (   7.67  )
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

Il 11/09/24 01:42, Rob Herring (Arm) ha scritto:
> The compatible strings for mt6795 clocks are also documented in other
> schemas:
> 
> "mediatek,mt6795-apmixedsys" in clock/mediatek,apmixedsys.yaml
> "mediatek,mt6795-topckgen" in clock/mediatek,topckgen.yaml
> "mediatek,mt6795-pericfg" in clock/mediatek,pericfg.yaml
> "mediatek,mt6795-infracfg" in clock/mediatek,infracfg.yaml
> 
> The only difference is #reset-cells is not allowed in some of these,
> but that aligns with actual users in .dts files.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



