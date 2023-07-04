Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59EB8EB64DD
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Jul 2023 10:27:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N5ScATbDm/hn/+Z0tXfuLQIjop218U/sV6dmT8ee0rs=; b=TxE1peMIMKtfMm+RpjcV8WZM5u
	Km2hif4lOmNP0WActpeh/0mByn3I1PGZDjUiqTIqpH5T1CKM2avpPfr2lALEvoQagtX5A3ZQ1ZVFK
	iaA5WVhJPGf8pqikv+IJ7jyC0Brp2mcmbfZBVffEvtLsEo5bCqzloO0sZy01o3IRXgsxkSr8tRGFH
	wRQn4ttk6M1r5qVgBLS8bFimbztIERGDCCne/ZWRhDGBw3rbcRZynkJFN7GEjZxb3wMt/TgbP+a92
	gBV5u9XcmAJ+8mZlWIOY9IJPRIvgo50rI6qnVVDGNXq2OqCkNBul3ZRHTPLFs76cwWuVvAIGiLCSA
	1hFO+H5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGdFb-00CsXj-16;
	Tue, 04 Jul 2023 10:27:15 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGdFY-00CsWB-0m;
	Tue, 04 Jul 2023 10:27:13 +0000
Received: from [IPV6:2001:b07:2ed:14ed:c5f8:7372:f042:90a2] (unknown [IPv6:2001:b07:2ed:14ed:c5f8:7372:f042:90a2])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 433636606FA4;
	Tue,  4 Jul 2023 11:27:10 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1688466431;
	bh=xo231CNcuC2FkqsWHh5xD0ZSPl+ptrgtwj19pWAl14k=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=iV8K8cjG+hZqKPxJguIYnxx6N9xe35IrMtEK/fGD9AiZWnEaWeeB+fS9VusNO/TwI
	 eeXnGulI6rbQKBJ2UIv3zhgMrrIHNP7OCFNQ/FeIOgWOStqWke1fBAoWOKjcn3oaGY
	 ll4FnTPyczknABlgg/HamhAUqd5bJwyt4MlSzigY7wfG+g/v2uhOz72UwYUD0Z15g/
	 r3NeQ37idJ8StDKXxciT/7LhPQlLfo5qtgyxOr1DStTszYEvTSFWcqqxo8nOQAq7Fz
	 bpa2G8Bn+1QWGjq/wyiyOa0NKoGa6cqHlQGDIaNdFuizm8W6D8rZ4iPx8eP6qP2LVm
	 hkwWXlcFOSbnw==
Message-ID: <8f1136b6-7c93-73eb-545d-bbdb0ff6f0b1@collabora.com>
Date: Tue, 4 Jul 2023 12:27:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v6 6/8] soc: mediatek: Add support for WAY_EN operations
Content-Language: en-US
To: Markus Schneider-Pargmann <msp@baylibre.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Tinghan Shen <tinghan.shen@mediatek.com>, Fabien Parent
 <parent.f@gmail.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Alexandre Bailon <abailon@baylibre.com>,
 Fabien Parent <fparent@baylibre.com>
References: <20230627131040.3418538-1-msp@baylibre.com>
 <20230627131040.3418538-7-msp@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230627131040.3418538-7-msp@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230704_032712_416023_84AD6BA5 
X-CRM114-Status: GOOD (  12.84  )
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

Il 27/06/23 15:10, Markus Schneider-Pargmann ha scritto:
> From: Alexandre Bailon <abailon@baylibre.com>
> 
> This updates the power domain to support WAY_EN operations. WAY_EN
> operations on mt8365 are using a different component to check for the
> acknowledgment, namely the infracfg-nao component. Also to enable a way
> it the bit needs to be cleared while disabling a way needs a bit to be
> set. To support these two operations two flags are added,
> BUS_PROT_INVERTED and BUS_PROT_STA_COMPONENT_INFRA_NAO. Additionally
> another regmap is created if the INFRA_NAO capability is set.
> 
> This operation is required by the mt8365 for the MM power domain.
> 
> Signed-off-by: Alexandre Bailon <abailon@baylibre.com>
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>


Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



