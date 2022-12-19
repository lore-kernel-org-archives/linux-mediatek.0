Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21121C4332F
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Dec 2022 16:52:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:Subject:From:References:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SE2wnLe1zQwpUgdkaV82HIeqF7pshRKC4WnQ2bpJY/k=; b=KRrW8rYCXCxaXv2Wnpy7lPRXtE
	MWEbl3EZSWA8jI9dDZ5+gCTeJOYSL3cZTBXdB2QvySz3T/OwPEuf7pIfFI1N9YyXSzFC+PGymXJ0F
	RJirQ0s/OPvf3829cvEiW9Y4qx/0U/2E8Tw68RV5bGGBCB0nSnSxyZOMMS6LgGqmrtNljo3+Si5EX
	L1MJIV9DZMVaMU9btb5n2oUdGSrUHkLP3/OBZ7CJFej73/zyqOLhjgTSVZmEE/773PPk8jRg+FT7N
	GIhSRKYBU73fBtkxOt6UixD+2ufR0zEcrLEuqPyfnJMlU6LixKmHzuEGRGACEyca0O3SGmpbe+5kq
	3/IEDWdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7JNG-00GL64-JN; Mon, 19 Dec 2022 16:52:22 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7HtG-00FFh5-Ry; Mon, 19 Dec 2022 15:17:20 +0000
Received: by mail-wm1-x32f.google.com with SMTP id c65-20020a1c3544000000b003cfffd00fc0so9084079wma.1;
        Mon, 19 Dec 2022 07:17:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:content-language
         :references:cc:to:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SE2wnLe1zQwpUgdkaV82HIeqF7pshRKC4WnQ2bpJY/k=;
        b=CF+6cPb7SiTANsjqBYJPCXXmWE/kQImVInxzbTAqvBeyI6Xg3uMHdrbFE38oCVdRyu
         2ZTEDDFuoh8KU67Z7wodP+Z7Yub7qASqMFpnwNsLjkKvm4ROBO3TAw1mtFXT/Grp1VKQ
         WfBJva0ShpnhqTG/NAgDdiPGBy54qt5RQDrqnVuTMR6FMP/TzTPjLdOvomyy3gJaDf8T
         pj96Sgz33JCX1R9Kd/XzGyZPimUsIBMF6UpIgeSiat0N9/ZpF8fGhnjXVdDRUh1EFU7p
         LhyL4welxMQW4AGgJa2XxU/ZRZ7A4T+w6aDearyl8CUYyMokqw5S55U3ZK2KAf/Kw2uS
         80Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:content-language
         :references:cc:to:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SE2wnLe1zQwpUgdkaV82HIeqF7pshRKC4WnQ2bpJY/k=;
        b=IvdrRXpmapol5X8mrpM2skNKoEgzU9mv7NJmIk1dnWvaeMNxi6rGbPLS0VBU0Q4qFu
         D50JLJXQhkfiM3fv/1j1WkK646qQ3JmmkICkupegwVoNdq16rwEpEqKoMFh6dhmWzLhy
         R1bvH4kdzLyZUINrFucjArUSL2C95htciEGfPXj4INhTg/kzUr2EU2yjLz/rMixT0Izj
         J6Nv5ZI1fWm+R4myGUcDaDrNTUGvhNBNIoIHGVlp7iEO46L9EJPxwYq6IUtXe4fzzmVy
         5fd2NYp6ZQWSAIg0fzPz+siPKEzLJGIZ/bxAXFoAarfEGVP/R1TaKlViQa9oD5rB824V
         cYvg==
X-Gm-Message-State: AFqh2kqX9e/sdv6RIOOYwHa9BUi1uWFFTjHhEfRct0EWx68p8Q6F7uzn
	QtdaUrDOC8rnKMmk0yfY+u0=
X-Google-Smtp-Source: AMrXdXuH6Zq5ZzI7Dwg/UowK+RUEcQgPwybSI7MWtJprY0o3lhEbsd07Wa6X+KcEVK3Iic5PLouPyg==
X-Received: by 2002:a7b:c856:0:b0:3d3:4406:8a2e with SMTP id c22-20020a7bc856000000b003d344068a2emr8931252wml.15.1671463031555;
        Mon, 19 Dec 2022 07:17:11 -0800 (PST)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id bg2-20020a05600c3c8200b003b47e75b401sm23545595wmb.37.2022.12.19.07.17.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Dec 2022 07:17:11 -0800 (PST)
Message-ID: <ba8ce731-2d9c-901f-e208-deafe589b723@gmail.com>
Date: Mon, 19 Dec 2022 16:17:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
To: Rob Herring <robh+dt@kernel.org>, Moudy Ho <moudy.ho@mediatek.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20221207094921.15450-1-moudy.ho@mediatek.com>
 <20221207094921.15450-2-moudy.ho@mediatek.com>
 <CAL_JsqKdaVmGKSwR0yiYGKc6Kp6jki632GA6CBOOjGzUmvSRWA@mail.gmail.com>
Content-Language: en-US
From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH v4 1/8] dt-bindings: arm: mediatek: mmsys: Add support for
 MT8195 VPPSYS
In-Reply-To: <CAL_JsqKdaVmGKSwR0yiYGKc6Kp6jki632GA6CBOOjGzUmvSRWA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221219_071719_093909_2A149EBD 
X-CRM114-Status: GOOD (  17.68  )
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



On 19/12/2022 14:44, Rob Herring wrote:
> On Wed, Dec 7, 2022 at 3:49 AM Moudy Ho <moudy.ho@mediatek.com> wrote:
>>
>> For MT8195, VPPSYS0 and VPPSYS1 are 2 display pipes with
>> hardware differences in power domains, clocks and subsystem counts,
>> which should be determined by compatible names.
>>
>> Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
>> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> ---
>>   .../devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml     | 5 ++++-
>>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> This landed in today's linux-next causing the following binding
> warnings. Is this a fix? Only fixes for 6.2 should be added during the
> merge window.
> 

No it's not a fix, it's queued for the next -rc phase. I didn't know of the 
limitation of linux-next only allowing fixes in the merge window.

Actually the patch is wrong. It shouldn't include "mediatek,mt8195-mmsys" as 
fallback for mediatek,mt8195-vppsys[0,1].

I'll revert the whole series from v6.2-tmp/dts64 and v6.2-tmp/soc

Regards,
Matthias

> /builds/robherring/linux-dt/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8195-clock.example.dtb:
> clock-controller@14000000: $nodename:0: 'clock-controller@14000000'
> does not match '^syscon@[0-9a-f]+$'
>          From schema:
> /builds/robherring/linux-dt/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
> /builds/robherring/linux-dt/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8195-clock.example.dtb:
> clock-controller@14000000: compatible: 'oneOf' conditional failed, one
> must be fixed:
>          ['mediatek,mt8195-vppsys0'] is too short
>          'mediatek,mt8195-vppsys0' is not one of
> ['mediatek,mt2701-mmsys', 'mediatek,mt2712-mmsys',
> 'mediatek,mt6765-mmsys', 'mediatek,mt6779-mmsys',
> 'mediatek,mt6795-mmsys', 'mediatek,mt6797-mmsys',
> 'mediatek,mt8167-mmsys', 'mediatek,mt8173-mmsys',
> 'mediatek,mt8183-mmsys', 'mediatek,mt8186-mmsys',
> 'mediatek,mt8188-vdosys0', 'mediatek,mt8192-mmsys',
> 'mediatek,mt8365-mmsys']
>          'mediatek,mt8195-mmsys' was expected
>          'mediatek,mt7623-mmsys' was expected
>          From schema:
> /builds/robherring/linux-dt/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml

