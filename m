Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4083AC76196
	for <linux-mediatek@archiver.kernel.org>; Sat,  1 Apr 2023 20:52:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1aMiCXujIGmUVuB4Z9vXOtvJHa7Wx4/lUo7wVgjnPeg=; b=VEaatpRgDHMK1Sq5t6LEBaVtvS
	roNTGh5IQixU5qawh6LUIjw4wPbewj+pjO8fkwl+oqOOb2oODI696ESGuL4SfRc4BSIpn646N2MhF
	um+KmJR8u7waV9EQ/EDx9E/Y5FZCiTBpUorK5+FL7zDLu9fRDpgfGcSm0sPy6oMhg/Oenzae3Z0YL
	4cUn+Q83MYNraZy1yIz7O4bNaltBkE+xt4FOIA4n/0rLxaoYqB8XadmxbsHg5f1v8brEbxTF0FnP1
	y5mdnNMm4hlq71V7D8qMEu3TkWzSyGTfaVven8TQHCPirlUaJ1s/+Qw9dWdWGswCTH0lAgujpKdni
	JS6WIF+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1piiD4-00BIVX-2o;
	Sat, 01 Apr 2023 20:52:26 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1piiD1-00BIU0-2u
	for linux-mediatek@lists.infradead.org;
	Sat, 01 Apr 2023 20:52:25 +0000
Received: by mail-wm1-x32e.google.com with SMTP id p34so14879683wms.3
        for <linux-mediatek@lists.infradead.org>; Sat, 01 Apr 2023 13:52:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680382342;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1aMiCXujIGmUVuB4Z9vXOtvJHa7Wx4/lUo7wVgjnPeg=;
        b=vkuiN9rvjWBpooAyCLyDu+pjg0gt4cQLzaQb6t8Lx2ghlnL1XUcUlNlQioyiBt4CFw
         c9dnPmYQpp0ZZKZpdqml0vE/NrIwn9/G9HN+nSfzXg0Aepd4laDCrsQrhD9XVG3ae+tu
         wOJ1jwlr9c4zSpX6j6xp6GIb6iFq5v2Fz/8KuVYuE6rhKeH1CSiAFjFSKkOqJSe+3+4D
         p6DoeVJNisJrNKXPXCpsaen7XhiV4tP0OI98w80iwSha9b8qyWlPbMPXQxt62gZ87sVs
         wvotEHObh3upaIs7GWjOvzINb47RR27Jg56v/x+X4x9OEtuUbvC/NXHMk8VBw51vEF/z
         o/WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680382342;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1aMiCXujIGmUVuB4Z9vXOtvJHa7Wx4/lUo7wVgjnPeg=;
        b=H1mFSHL9vLVIz5Z2nVfsOYVvnuUsch/mDaivD+ohI+BtdP/0dHOwCv3rpASUwqtomy
         yHW7RDSVFPov2N5QyELoYfH5oO9yyYESJqWm1JMLpI0aYU7yCE2JK6rKV4iIUDqU6JP9
         AGZ6+/opGHj8b3W3C03z7D/JuGyCJORwl4vGhuyjRKVZ+vsZvh3zwybOKafjrWJGy33/
         +fjrNtVjVSPLYjp8VLIBsxw+M9SW6dkq9ffrVD6cM4mw0G1Qw7HRitaZuvHglrliHQwz
         g8P3yyX0fDozlFj1+eO/Pabynl5EWFStJA/llR7xCAjJhYtggoTSkU6GJdLP2G8MXInX
         Y8/w==
X-Gm-Message-State: AO0yUKVAXcqUtPLz73sySwuaAk1qqONEEBsJtsuP8Y2vAnW7DWQ6Ypla
	nHw0byrfBEy0MuWKAINHmuYi+A==
X-Google-Smtp-Source: AK7set8fNgOTJJlP0UI0D+ubIU86sAui89uX/69r3P64DFMyWqZcOx1w0KXFIYt4ZdZw4qR7lGMNPg==
X-Received: by 2002:a7b:cd97:0:b0:3ed:ce50:435a with SMTP id y23-20020a7bcd97000000b003edce50435amr23171291wmj.10.1680382342508;
        Sat, 01 Apr 2023 13:52:22 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:b36a:1186:309c:1f9a? ([2a05:6e02:1041:c10:b36a:1186:309c:1f9a])
        by smtp.googlemail.com with ESMTPSA id c3-20020a05600c0ac300b003edf2dc7ca3sm7116174wmr.34.2023.04.01.13.52.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 01 Apr 2023 13:52:22 -0700 (PDT)
Message-ID: <32ff359d-ebdb-cacd-9237-e33eb9d9cdb0@linaro.org>
Date: Sat, 1 Apr 2023 22:52:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 0/4] Add LVTS's AP thermal domain support for mt8195
Content-Language: en-US
To: bchihi@baylibre.com, angelogioacchino.delregno@collabora.com,
 rafael@kernel.org, amitk@kernel.org, rui.zhang@intel.com,
 matthias.bgg@gmail.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, rdunlap@infradead.org,
 ye.xingchen@zte.com.cn, p.zabel@pengutronix.de
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, khilman@baylibre.com, james.lo@mediatek.com,
 rex-bc.chen@mediatek.com
References: <20230307154524.118541-1-bchihi@baylibre.com>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20230307154524.118541-1-bchihi@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230401_135223_944630_20BDAEA5 
X-CRM114-Status: GOOD (  12.85  )
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

On 07/03/2023 16:45, bchihi@baylibre.com wrote:
> From: Balsam CHIHI <bchihi@baylibre.com>
> 
> Add AP thermal domain support to LVTS Driver for MediaTek MT8195 SoC.
> 
> This series is a continuation of the original series "Add LVTS Thermal Architecture" v14 :
>      https://patchwork.kernel.org/project/linux-pm/cover/20230209105628.50294-1-bchihi@baylibre.com/
> 
> Based on top of thermal/linux-next :
>      base-commit: 6828e402d06f7c574430b61c05db784cd847b19f
> 
> Depends on these patches as they are not yet applyied to thermal/linux-next branch :
>      [v14,3/6] arm64: dts: mt8195: Add efuse node to mt8195 (already included in linux master branch)
>      https://patchwork.kernel.org/project/linux-pm/patch/20230209105628.50294-4-bchihi@baylibre.com/
>      [v14,5/6] arm64: dts: mediatek: mt8195: Add thermal zones and thermal nodes
>      https://patchwork.kernel.org/project/linux-pm/patch/20230209105628.50294-6-bchihi@baylibre.com/
>      [v14,6/6] arm64: dts: mediatek: mt8195: Add temperature mitigation threshold
>      https://patchwork.kernel.org/project/linux-pm/patch/20230209105628.50294-7-bchihi@baylibre.com/
> 
> Balsam CHIHI (4):
>    dt-bindings: thermal: mediatek: Add AP domain to LVTS thermal
>      controllers for mt8195
>    thermal/drivers/mediatek/lvts_thermal: Add AP domain for mt8195
>    arm64: dts: mediatek: mt8195: Add AP domain thermal zones
>    arm64: dts: mediatek: mt8195: Add AP domain temperature thresholds
> 
>   arch/arm64/boot/dts/mediatek/mt8195.dtsi      | 180 ++++++++++++++++++
>   drivers/thermal/mediatek/lvts_thermal.c       |  94 +++++++--
>   .../thermal/mediatek,lvts-thermal.h           |  10 +
>   3 files changed, 264 insertions(+), 20 deletions(-)
> 

Applied, patch 1 & 2

-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog


