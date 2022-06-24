Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7544CC43334
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Jun 2022 09:23:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F2m7ah4ntAnKl0oynZtdOfbCtCaDCItOyCmYz+9IdxM=; b=O7pQBfCfiyqbb3cMS4SiTsHVLQ
	toEoqRgoJrLWxGGNJwnmTjkyUSdrmhfcnrSrt7em2FrS9IxJc3Hc/Tew1gQXzSZV358w8eK/uKuye
	F4iqF8k55GXR8q27v7R8qcWa+1nQeNtMQfZVnWdKZ6F/B2Zvy1JQ9dyyF4naBdEgXPE3CwySFR/8e
	kF0a7flJp0uSxvgU+JaDlWXDIFwGJuUtKK1WHE1CftyomQw2mM0T1ta8wq+laXMb6JdLhzS6HjaS0
	fhxeI4ghY5qvaXwHthofMftOlpz1jDikMO5ijAYEa58o5yZhRzqjiXmW/9gooOLRXtUDbwKSS9G8f
	CZ31wxSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4fWy-001Nql-Vr; Fri, 24 Jun 2022 09:23:13 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4fWn-001Np8-K9; Fri, 24 Jun 2022 09:23:02 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 3B5AC66017FA;
	Fri, 24 Jun 2022 10:22:59 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1656062579;
	bh=9Soc6n0CqFUw5ZJ1qMew3TiS4i4OwU3mvCqAavwe5wg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=nZIokHZdtJm1ECwVKvDQBwV3vTQoam56MCQ88jG9j5oK+852SDX86EZmXOFd0MyFM
	 aoOE3XTvgjpadKYCkxndt1Fas9058NPUY8vNw3kHZOMiuHXGccY9f2ZTQYYdAx6r/T
	 J2JMHnSOU6z96e42d6BHK+l0SK/zlsDiktujVK2C7O8qom6vUZasdBNbl8FOK+aFgo
	 L5WtM+UGHO1v54ID07R6DN4hoVSg32VC1bt5mOYZAWIqvgbBYEwJH4FDvU40sPK0hv
	 bJSDok7cdWaGlT0XXmEJLpP2aydZ2bBXIn50iJrGg3WO8N9ivD+y65P+hB+7uvKfoO
	 c90owLut6DaDw==
Message-ID: <26ff5b3e-00f6-783e-04ec-b4fcd600175e@collabora.com>
Date: Fri, 24 Jun 2022 11:22:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 0/2] MediaTek Helio X10 MT6795 - power domains
Content-Language: en-US
To: robh+dt@kernel.org
Cc: krzysztof.kozlowski+dt@linaro.org, krzysztof.kozlowski@linaro.org,
 matthias.bgg@gmail.com, chun-jie.chen@mediatek.com, weiyi.lu@mediatek.com,
 mbrugger@suse.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 kernel@collabora.com, nfraprado@collabora.com
References: <20220503141441.125852-1-angelogioacchino.delregno@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220503141441.125852-1-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220624_022301_839108_F55805C3 
X-CRM114-Status: GOOD (  14.01  )
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

Il 03/05/22 16:14, AngeloGioacchino Del Regno ha scritto:
> In an effort to give some love to the apparently forgotten MT6795 SoC,
> I am upstreaming more components that are necessary to support platforms
> powered by this one apart from a simple boot to serial console.
> 
> This series introduces support for the MTCMOS power domains found on
> the Helio X10.
> 
> Tested on a Sony Xperia M5 (codename "Holly") smartphone.
> 
> Changes in v2:
>   - Changed license header for mt6795-power.h binding as per
>     Krzysztof's review.
> 
> AngeloGioacchino Del Regno (2):
>    dt-bindings: power: Add MediaTek Helio X10 MT6795 power domains
>    soc: mediatek: pm-domains: Add support for Helio X10 MT6795
> 
>   .../power/mediatek,power-controller.yaml      |   2 +
>   drivers/soc/mediatek/mt6795-pm-domains.h      | 112 ++++++++++++++++++
>   drivers/soc/mediatek/mtk-pm-domains.c         |   5 +
>   include/dt-bindings/power/mt6795-power.h      |  16 +++
>   4 files changed, 135 insertions(+)
>   create mode 100644 drivers/soc/mediatek/mt6795-pm-domains.h
>   create mode 100644 include/dt-bindings/power/mt6795-power.h
> 


Gentle ping for this series...

I've verified it still applies cleanly on next-20220624.. can we please
get it merged in?

Thanks,
Angelo

