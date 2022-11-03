Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85C70C433FE
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Nov 2022 09:24:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f13YrIXF3nPk5ucE+cLo6TRaXJT7UIlS45UGoNwokAI=; b=Dq5TInGS9ZP/7e1MjTabB50H/Z
	lux/C1azJb/IKGhU9JdNBtYle4VwXvzHZNOEHj1crcV3drCE07Fo29xYbbeiUQ0ktQLR8x/aixj7F
	77EHMf8Vp/Lrf33F7PZh3mi5v0sXnNHBXs1Je4B5ZvylKi8gqlT/DjJNxyOKfXNq69PycODlg8GEd
	UueSV4ozR0acyBe/aktoPqbGnJkVCyS9eEGJ8gL/Q5GbWWt1jBOU5wQIpCq0dDI5gYlYGulIE6R/T
	0UU9YyXKEXLCvg/lgg1BgL0v83cKwMmwoYwon8ZTMk/n5BJ1eHYuieSQMzEaeAH+agLOBgwydgRSM
	BZiGfVkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqWSk-00Gu0F-Tt; Thu, 03 Nov 2022 09:24:39 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqWNc-00Gs4f-2z; Thu, 03 Nov 2022 09:19:21 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id E63B766028F8;
	Thu,  3 Nov 2022 09:19:17 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1667467158;
	bh=M5O9/BCrWTrkOySMMphlKg4mAjD2Nfo1FUdwjlTecWk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=CncGJbw++/sDS5qmxAD4+iJ2XknKwtwxKT01wNdwIGnaX6LlNI9tChQ8S3Wle5Iqh
	 y/Jgy/GTy0ZZqJ0oTFP3NyNCdvWKnW1Uckq8zXrigY5ep8h3Nja60dK2zsKQ2Onzmz
	 JuMXfz/i26ZGrFDwXcq30uQwrfS1mAVG+qUYfu+HUJa4rksaB7ivdmlQ1QbMaIUDCQ
	 EYY0zXzn9WvEdC6s4dK3dnhRtKTYqocRoci+mn3WDLdk1YxAdohefJMvxvLxn8bnZF
	 mER16CqRSHK41KD36Qh/+ioNec47BjMqtkWh2SKxx5eiGa0GphJpf3iYEzrL1lgDII
	 npWttR9BR5QiA==
Message-ID: <cbeb2bdc-4a36-1f9a-e28f-842773b6a161@collabora.com>
Date: Thu, 3 Nov 2022 10:19:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH] docs: dt: writing-schema: Document usage of CHECK_DTBS
 make flag
Content-Language: en-US
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Rob Herring <robh+dt@kernel.org>
Cc: kernel@collabora.com,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org
References: <20221102214300.309347-1-nfraprado@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221102214300.309347-1-nfraprado@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221103_021920_299045_414169D7 
X-CRM114-Status: GOOD (  17.66  )
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

Il 02/11/22 22:43, Nícolas F. R. A. Prado ha scritto:
> It is possible to run checks on a Devicetree by passing the CHECK_DTBS
> flag when building. This is a useful shortcut to the dtbs_check make
> target since it avoids checking unrelated Devicetrees, which can take
> some time and is unnecessary if no bindings were modified. Document it.
> 
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
>  > ---
> 
>   Documentation/devicetree/bindings/writing-schema.rst | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/writing-schema.rst b/Documentation/devicetree/bindings/writing-schema.rst
> index 4a381d20f2b4..55ad556472b4 100644
> --- a/Documentation/devicetree/bindings/writing-schema.rst
> +++ b/Documentation/devicetree/bindings/writing-schema.rst
> @@ -167,6 +167,13 @@ setting the ``DT_SCHEMA_FILES`` variable to a specific schema file or pattern.
>       make dt_binding_check DT_SCHEMA_FILES=/gpio/
>       make dtbs_check DT_SCHEMA_FILES=trivial-devices.yaml
>   
> +Note that ``make dtbs_check`` will validate every DT source file that is

"Note that xxxx" looks a bit repeated... read:

Note that ``dtbs_check`` will skip any binding schema files with errors.
(etc etc)

Note that ``make dtbs_check`` will validate every DT source file ...
(etc etc)

Perhaps we can change the first paragraph saying
"In order to perform validation of DT source files, use..."
to something like:

In order to perform validation of all DT source files, use the ``dtbs_check``
target, or set the ``CHECK_DTBS`` variable to ``y`` when building specific DTs::

::

     make dtbs_check
     make CHECK_DTBS=y mediatek/mt8192-evb.dtb

Any opinion?

Cheers,
Angelo

