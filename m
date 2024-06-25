Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14130C2BBCA
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Jun 2024 14:52:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X8Hpa8pV7B9zgyUeRg8pUneXILjmsCht4+wkidWxo7o=; b=LauBFNG2bmNH/bwRtgQb12KyVp
	KeF4mVPLq98jUR2V21V1AG8AjDpFqKbIhixAn6i5ephUzXsyn9vcmQHwo8HZtquIG3ANMUeWqmPzf
	9OzOjgk49gOrG1Ai/4PWqnsUOB5tlOVAaynvCypHWMP02ot0zCLpMOs8CTgw04uf8x4ir5bCaK1+u
	bowQhGE0uA28m/e+kZU6x8vhavl5Pq7d++nb/W3VxKEGu8V/NTDRvHKA88kCZ/9s2hXKxkPz1U/XD
	JB/7kNLiIOwMU1XuqcZL0eBHAB40h39RHOqE6vWdlCFKZBMRbOZDPBhuNfQoFZt3U/D4a5YwB0eaX
	FDHf/gJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sM7Wh-00000003GMH-1Wq4;
	Tue, 25 Jun 2024 14:52:07 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sM7Wb-00000003GJq-1aZm;
	Tue, 25 Jun 2024 14:52:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1719327117;
	bh=JoqWTqCrbpFahu8o+ed8C7pB2idzuicnlVb3Hvo7YX4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=LoFJl8+tL0lnXDqDz4HvwTijUuSmkbuE+NLkZOjaOi7VCLcqq1y1re+8CKRDG5Vki
	 DhuuTw/Kaz5ZFRYJ7slLQuLySI8MjReLJRnXO5nyNsFKrjU3wbEUoL1oPCvEwNgfFG
	 zk1gCqU/OoINZd+/aIsXoND5uV/R8VxawnV7zcS3eDbbjPbpY3giTsPgfoPRVlDarU
	 Sla29TKwdhxp63FRJpRWq1BZVRSij5eC1lP8YvVd2+7L5W0A/8NOjDVfxMb3pSK0pz
	 4spRjEPVpDyOAySNtu0kLVoDiZrpGQvoQDKb02Zo8a1K1BdBIXsrwPJ8f6tcgFQLXW
	 hDfGLOzIKCk4w==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id A18A7378219B;
	Tue, 25 Jun 2024 14:51:56 +0000 (UTC)
Message-ID: <f855f6ec-f0f7-467a-9823-d19706574408@collabora.com>
Date: Tue, 25 Jun 2024 16:51:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/7] MediaTek DVFSRC Bus Bandwidth and Regulator knobs
To: Mark Brown <broonie@kernel.org>
Cc: robh@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com, lgirdwood@gmail.com, keescook@chromium.org,
 gustavoars@kernel.org, henryc.chen@mediatek.com, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 kernel@collabora.com, wenst@chromium.org, amergnat@baylibre.com,
 djakov@kernel.org
References: <20240610085735.147134-1-angelogioacchino.delregno@collabora.com>
 <f7b4cd98-1acf-4f6b-a7e0-57419abadba1@collabora.com>
 <57cf8f9f-4320-4c55-a9f8-a4c1facabfe8@sirena.org.uk>
 <39ed7b8c-b19a-40de-9b30-a731ac83ad20@collabora.com>
 <2e8a9cf2-2bc0-45d8-b6c1-e3a9441d5641@sirena.org.uk>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <2e8a9cf2-2bc0-45d8-b6c1-e3a9441d5641@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240625_075201_800890_03D37E7B 
X-CRM114-Status: GOOD (  13.30  )
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

Il 25/06/24 14:50, Mark Brown ha scritto:
> On Tue, Jun 25, 2024 at 01:58:57PM +0200, AngeloGioacchino Del Regno wrote:
>> Il 25/06/24 12:25, Mark Brown ha scritto:
>>> On Tue, Jun 25, 2024 at 10:32:30AM +0200, AngeloGioacchino Del Regno wrote:
> 
>>>> The main issue here is that the main soc/mediatek dvfsrc binding
>>>> dt-bindings: soc: mediatek: Add DVFSRC bindings for MT8183 and MT8195
>>>> does use the others, so I can't pick this one without the others being present
>>>> or the validation obviously fails.
> 
>>> I can't tell what you want from me here.
> 
>> I'm asking you to pick the regulator patches :-)
> 
>>     dt-bindings: regulator: Add bindings for MediaTek DVFSRC Regulators
>>     regulator: Remove mtk-dvfsrc-regulator.c
>>     regulator: Add refactored mtk-dvfsrc-regulator driver
> 
> Is there no interdependency with the rest of the series?  There was in
> some earlier version at least I think.  If I reviewed the patches it's
> because I wasn't expecting to apply them.

The interdependency is for soc/mediatek commits, which depend on:
  - Interconnect commits (which Georgi picked already); and
  - Regulator commits

And... you reviewed the patch in the previous merge window :-)

Cheers

