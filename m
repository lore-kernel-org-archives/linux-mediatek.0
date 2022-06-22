Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D0A9C43334
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Jun 2022 15:26:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iUzY4nbnMghL5U5lbC9orjTiyOqHbnNJpaguJ2BvQ0I=; b=swljnLt6/owdg92MeEvcb5b1l2
	1t0EkbAEmBrB7rgp+xo1RGX6ca2XVzXtAWE6EAYBgmnOIJQuyEgN9/U6L6sPoCyN/B2oYTcapehAB
	HmBf/sIAfPnrhS30NynA3O+ogiiIvX2bPCNpDu5HED0soz33cCLM7TLutad+iiRWQKw8WXt0jIeXG
	jE9wQuN789THDwlHgBNaRDXxCjbTpVNUdnsU9REJdyZG0BzqQUERtrlA1a8FAjOq9xs8FlxRUBpIG
	OEVFMLGh36UYkyAyfq61XRdobF6SU62dqSxzDCRP7bQNJ9O9WbJSNDe6OHYsIm8OUzzN/0y/0On8W
	KIAAFO6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o42FS-00BBHd-1X; Wed, 22 Jun 2022 15:26:30 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o42FB-00BBBK-Vu; Wed, 22 Jun 2022 15:26:15 +0000
Received: by mail-ed1-x533.google.com with SMTP id eo8so24458699edb.0;
        Wed, 22 Jun 2022 08:26:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=iUzY4nbnMghL5U5lbC9orjTiyOqHbnNJpaguJ2BvQ0I=;
        b=AEoeVrOdTGpW8f5/WdP1QJAyvtpZm3Rcmw/2pg+2BxRLGzEojWTu72Nhl8OIUZA6ru
         flVFlEbrYE/DcKVLppgHHckPgzgR9oQ2UPcRWuOg31W3w/7nD3LHRB44VyloGTUigePI
         Qkjdl3z98ZLPlb8kHaXW97f90vPmQvnREWKb7ae8TQGQGnYP1T3aDPLA7zSkV6kCJ5m0
         aWV2UuYVWT0nh5GX9cWFwNCcEJIWrUjLiMWSD9Km8S26cSBVh0Z6mhE+FlO9q4bAp15h
         0AJzCPpCiw8UxLo+OkoR1DvNr1on0LycHZ3wquvsxBXWxKcxggF4UmnPK65I1nbZqgRu
         qu5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=iUzY4nbnMghL5U5lbC9orjTiyOqHbnNJpaguJ2BvQ0I=;
        b=kkVIur+PdYqFH4x9BtzZMeZHFfQib8bJyOuHDIGn+xpEehrKhHIfYibQ+6aEywrPpr
         7uyM7wyUIlOz6LlefZmFDrA6C2Kh7At90u7x5A5StoMo+BAOwpZKkIpXibXgdOazL5HA
         osJBaOu6FhN6h7VgBVFKp+XmhNvgyYcovXQqvEyjOHckDww4CMmavfOTOXJIj5Jx/uUe
         HQkz20fcHOKUw5dESrDTAoJKGdIMQcGNPeT6MyQwHqAJL2v2BohCluzM57/r+YVYJZyg
         IkBQAw35E20pV9J/BWg1FqMRlGrfRyLAvNtbCrp14EY0SkhZtaLYKhvqkDiub0uXe/FI
         vj3A==
X-Gm-Message-State: AJIora80nFhyWULOJonL9ULrfJ+ikpM7bnh1WKUpDW3jMALWXuHkcjWl
	rd9k8Frc+sATqgDgvRYNqqY=
X-Google-Smtp-Source: AGRyM1vgpTRl9gQqy9pZt2ocx7au56m3oMlaDtHNIMEQagwDUpJU7dK3BCZgg8DRywhG7QCBvmtPPQ==
X-Received: by 2002:a05:6402:414c:b0:435:1e2a:2c7f with SMTP id x12-20020a056402414c00b004351e2a2c7fmr4719527eda.132.1655911566341;
        Wed, 22 Jun 2022 08:26:06 -0700 (PDT)
Received: from [192.168.0.16] ([37.223.148.38])
        by smtp.gmail.com with ESMTPSA id e7-20020a50ec87000000b0043561e0c9adsm12665751edr.52.2022.06.22.08.26.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jun 2022 08:26:05 -0700 (PDT)
Message-ID: <d1dcedbb-413e-48ee-fdbc-e4d77465b62c@gmail.com>
Date: Wed, 22 Jun 2022 17:26:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v2 00/10] MediaTek Helio X10 MT6795 - Devicetree, part 1
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 robh+dt@kernel.org
Cc: krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, konrad.dybcio@somainline.org,
 marijn.suijten@somainline.org, martin.botka@somainline.org,
 ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 paul.bouchara@somainline.org, kernel@collabora.com
References: <20220609112303.117928-1-angelogioacchino.delregno@collabora.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20220609112303.117928-1-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220622_082614_080644_F851EF5A 
X-CRM114-Status: GOOD (  17.91  )
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



On 09/06/2022 13:22, AngeloGioacchino Del Regno wrote:
> In an effort to give some love to the apparently forgotten MT6795 SoC,
> I am upstreaming more components that are necessary to support platforms
> powered by this one apart from a simple boot to serial console.
> 
> This series modernizes the devicetree of the MT6795 SoC and adds a
> couple of nodes that are supported by this SoC.
> 
> In my local tree I have much more than that (including the dts for
> that Xperia M5 smartphone that I always mention...), but I decided
> to push the devicetree commits in multiple parts, as to get these
> in sooner than later because that reduces my delta, and this makes
> upstreaming a bit easier, especially when having to rebase things
> around, which happens a lot.
> 
> So, this series *does NOT* depends on any of the other series that
> I've pushed and is mergeable in parallel.

Applied, thanks!

> 
> Tested on a MT6795 Sony Xperia M5 (codename "Holly") smartphone.
> 
> Changes in v2:
>   - Split fixed-clocks addition/removal patch for readability
>   - Added patches for pinctrl controller node and vGIC interrupt
> 
> AngeloGioacchino Del Regno (10):
>    arm64: dts: mediatek: mt6795: Create soc bus node and move mmio
>      devices
>    arm64: dts: mediatek: mt6795: Add cpu-map and L2 cache
>    arm64: dts: mediatek: mt6795: Add Cortex A53 PMU nodes
>    arm64: dts: mediatek: mt6795: Add watchdog node to avoid timeouts
>    arm64: dts: mediatek: mt6795: Add fixed clocks for 32kHz and 26MHz XOs
>    arm64: dts: mediatek: mt6795: Remove incorrect fixed-clocks
>    arm64: dts: mediatek: mt6795: Add general purpose timer node
>    arm64: dts: mediatek: mt6795: Add ARM CCI-400 node and assign to CPUs
>    arm64: dts: mediatek: mt6795: Add pinctrl controller node
>    arm64: dts: mediatek: mt6795: Specify interrupts for vGIC
> 
>   arch/arm64/boot/dts/mediatek/mt6795.dtsi | 260 ++++++++++++++++++-----
>   1 file changed, 205 insertions(+), 55 deletions(-)
> 

