Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 718EDC54EE9
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Sep 2022 08:06:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dsBxBQlFj+ljJfuuF/fhKMVqSmrk9xITeLuG/WFMCaQ=; b=4sAyxBFlDu90gYp3tAO3DPOfjv
	Ou1gVSEY1H4i2NVNBLJRxmL7dOdMP/QdSz/G9zFDoONvvsV+Qv9XsHR10ghxSghzrj+NbwZM5TomE
	uIwM3FDBNpYS+I3Ea0DVC8foB7iFVPUwHJdOgmVVJIDoFLfCrQNhg4LgJ6YW0U7FyBMAPYUKrPxxP
	ngkKxtil/fhAvcibr3FE4RVQprWKDNke7wwxqXu+arQTDhaN6yyDrPcIQhYw9yXRpc2tGDg6JiHa0
	26kY7nqF9Ma56ipfcmnl1b7zxYWJqPv+H8Qtz1Fbw5JN5SdA6kPKdcQkmXtJ/b3k/n0eYx1F+hOYO
	+KLsJedQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaYH8-001bn4-HW; Tue, 20 Sep 2022 08:06:38 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaYGl-001bc5-Jy; Tue, 20 Sep 2022 08:06:17 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 721FF6601DE8;
	Tue, 20 Sep 2022 09:06:08 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1663661169;
	bh=E4xgn82nowPPg/tY31Ni/V7rLzv4IGvHVRj9gtDO5gE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=U6XrFV4nnDsjHfDBcBiGbEp2VWBpJhrMWvlYcdN4MjW9ZdHwJhV89KoyZuCw11sU2
	 j8Jmo5/6YUJ0p7DHxgppLqMIPG1rkn13zSMz78XsW6uchKqgDkzaJC6gtxNa0aB11u
	 0UiM4M1rYN1hx3AxyGfC/vHKxjzPXDz4sWFJKdl0VkLFTOz1t2ttgQu4MXWmAoH/4f
	 LlM1c63DwXyHjQkW5jIUQJDbNL/M6xJDyovgq/X1GqXvFWfQ4Ds/n33LEmC/t1CQ1t
	 aq2ARKq6odfL9zI5pSELMQsl266YfeZsHzj4MntQbH2t1nYo+Y5m9F1izclwibi/iD
	 7cByLZ5eyhMOQ==
Message-ID: <4c425cf8-f9ca-969c-f8ed-688410bfb922@collabora.com>
Date: Tue, 20 Sep 2022 10:06:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH 1/4] dt-bindings: pinctrl: Combine MediaTek MT67xx pinctrl
 binding docs
To: Yassine Oudjana <yassine.oudjana@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Sean Wang <sean.wang@kernel.org>,
 Andy Teng <andy.teng@mediatek.com>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>,
 linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20220919170115.94873-1-y.oudjana@protonmail.com>
 <20220919170115.94873-2-y.oudjana@protonmail.com>
Content-Language: en-US
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220919170115.94873-2-y.oudjana@protonmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220920_010615_913062_515441A2 
X-CRM114-Status: GOOD (  14.78  )
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

Il 19/09/22 19:01, Yassine Oudjana ha scritto:
> From: Yassine Oudjana <y.oudjana@protonmail.com>
> 
> Documents for MT6779, MT6795 and MT6797 that currently exist share
> most properties, and each one has slightly differently worded
> descriptions for those properties. Combine all three documents into
> one common document for all MT67xx SoC pin controllers, picking a few
> parts from each and accounting for differences such as items in reg
> and reg-names properties. Also document the MT6765 pin controller
> which currently has a driver but no DT binding documentation. It should
> be possible to also include bindings for MT8183 and MT8188, but these
> have some additional properties that might complicate things a bit,
> so they are left alone for now.
> 
> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
> ---
>   .../pinctrl/mediatek,mt6779-pinctrl.yaml      | 207 ------------------
>   .../pinctrl/mediatek,mt6797-pinctrl.yaml      | 176 ---------------
>   ...6795.yaml => mediatek,mt67xx-pinctrl.yaml} | 181 +++++++++++----

Hello Yassine,
nice cleanup over here!

There's a catch though: as far as I know, wildcards are not permitted... so you
should, at this point, merge all of these in mediatek,mt6779-pinctrl.yaml instead.

Before jumping to that, though... Krzysztof, can you please confirm (or deny)?

Regards,
Angelo

>   MAINTAINERS                                   |   2 +-
>   4 files changed, 135 insertions(+), 431 deletions(-)
>   delete mode 100644 Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
>   delete mode 100644 Documentation/devicetree/bindings/pinctrl/mediatek,mt6797-pinctrl.yaml
>   rename Documentation/devicetree/bindings/pinctrl/{mediatek,pinctrl-mt6795.yaml => mediatek,mt67xx-pinctrl.yaml} (65%)
> 


