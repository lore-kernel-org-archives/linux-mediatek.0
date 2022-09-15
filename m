Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35976ECAAA1
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Sep 2022 16:15:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v2ge41u1gkNzSONdXiyudp7Lzl9Dg/unbQXBLoKq9hU=; b=njTgSovaR+eQgDb4PAYDEubBwQ
	eGAMr0PuVr1SNBm62MFOxcZFnRQcBcKkBZRWU/kT5K2kYWJUs7kD8TCT+PbCM7TdccBgGnQf7hwem
	c1lFNtkGd/TZxqHOaBhwlH/P9VLEW5uelcb/BSGxnYs+y04lWPFL0Yu/ClWRfJfER/XGWSfRMmZpz
	EInTXLt/qZ3s+Iw78Yri04FGoKGtMEXYKqGs9JQr1Wu2/NczcZOQVtNjR6LLMbVS5QVl0haXmB4k0
	yFoi2iSn2TX/IYksl4sk6qfCUxIHNm/CfW8ZNzYWvD4lci3pFy/0F2DlOj+YCpw2jj59LAhiVus+9
	oBzKWVjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYrWE-00DDUM-JR; Thu, 15 Sep 2022 16:15:14 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYrWB-00DDJL-Qb; Thu, 15 Sep 2022 16:15:13 +0000
Received: by mail-ej1-x631.google.com with SMTP id y17so38248139ejo.6;
        Thu, 15 Sep 2022 09:15:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=v2ge41u1gkNzSONdXiyudp7Lzl9Dg/unbQXBLoKq9hU=;
        b=iTCO8J125qCrTxA0iFg+H1CARAxPJgyE9NsRJLpA9r9D8bUaWWeCK6S9k7gqxcj3Nm
         Mu7zY/+rEaZgFvF3wjEs/FobHCbKxmsrSWVf9uhjW17ucx/0cyp/Q1ib2FTk8xzczHyY
         ywJAEAqZ07B2QbbqEHtOqHcHlhepNzIDpIuWqG5sVY/6MsZdOJTd9iu6/71j0DNuiYCD
         enZgampz2rDAFbxE+wZj6ogxF96aNxELSuA1qe30H78lJ2taZaCIVIZS+CG8+ggfmQc1
         cyqx6sWFRvF8/8pLFsW8rTlRDV9dcEw+dm2byuljsDKAO+PVEInoQ4LjchdJHhRI/ul9
         ktjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=v2ge41u1gkNzSONdXiyudp7Lzl9Dg/unbQXBLoKq9hU=;
        b=41PXMlOrScQVF4fWmVlMZ3XbF5nZJ1ehAD+F6nBYnhIE8uQgzJlr4N5A2/sgyyTfxd
         gNBPFF4P67QSYsniDgS4qrJ5y1T/QLcj80DiEKnEhqvyPeKJSfCxm2u5wZP27lPu+lL4
         ilu0KJ0JdBwLl11XFlgcdJI5tqa4biPtpsEx4rxHgxYhrTp8cVZNjXTGXTineEAl+ckg
         8AiwoB7/oEwkVhbzzACs0vGe2JrWU9Pb9+GCnF0nA8rpQO8OfogaCKqN+xlsEpDL39x5
         Y5MhhizKL07J+C7CncAmVfUWQdRioSd17hCWUuGFk9WRJ2fxzSH07WlZsKlvDih21xHI
         yZvA==
X-Gm-Message-State: ACrzQf3n+avdhqliGyfKKoXHItkwyS1MfmHE7sEaLkIwIW4sJOyy7iWp
	D2tpglx2l5zy+R4QuMKuuF5jUmI4Pr4=
X-Google-Smtp-Source: AMsMyM5GrGz4GNx2hR374vuxPTyGV4EiiDxDSFGeIzTW/B5ABJzPFHP6RC1/GJ37AU08z/DjL8FVuA==
X-Received: by 2002:a17:907:3e89:b0:779:4869:b799 with SMTP id hs9-20020a1709073e8900b007794869b799mr467545ejc.91.1663258507015;
        Thu, 15 Sep 2022 09:15:07 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id r9-20020a1709061ba900b007413360a48fsm9224878ejg.50.2022.09.15.09.15.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Sep 2022 09:15:05 -0700 (PDT)
Message-ID: <1fd48fa0-66eb-5af9-6168-d1df602216a5@gmail.com>
Date: Thu, 15 Sep 2022 18:15:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH 4/5] arm64: dts: change compatible of vdosys0 and vdosys1
 for mt8195
Content-Language: en-US
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: CK Hu <ck.hu@mediatek.com>, Rex-BC Chen <rex-bc.chen@mediatek.com>,
 Singo Chang <singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220914182331.20515-1-jason-jh.lin@mediatek.com>
 <20220914182331.20515-5-jason-jh.lin@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20220914182331.20515-5-jason-jh.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220915_091511_891350_F346AABC 
X-CRM114-Status: GOOD (  22.25  )
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



On 14/09/2022 20:23, Jason-JH.Lin wrote:
> For previous MediaTek SoCs, such as MT8173, there are 2 display HW
> pipelines binding to 1 mmsys with the same power domain, the same
> clock driver and the same mediatek-drm driver.
> 
> For MT8195, VDOSYS0 and VDOSYS1 are 2 display HW pipelines binding to
> 2 different power domains, different clock drivers and different
> mediatek-drm drivers.
> 
> Moreover, Hardware pipeline of VDOSYS0 has these components: COLOR,
> CCORR, AAL, GAMMA, DITHER. They are related to the PQ (Picture Quality)
> and they makes VDOSYS0 supports PQ function while they are not
> including in VDOSYS1.
> 
> Hardware pipeline of VDOSYS1 has the component ETHDR (HDR related
> component). It makes VDOSYS1 supports the HDR function while it's not
> including in VDOSYS0.
> 
> To summarize0:
> Only VDOSYS0 can support PQ adjustment.
> Only VDOSYS1 can support HDR adjustment.
> 
> Therefore, we need to separate these two different mmsys hardwares to
> 2 different compatibles for MT8195.
> 
> Fixes: b852ee68fd72 ("arm64: dts: mt8195: Add display node for vdosys0")

No fixes tag needed, there is no runtime bug.

Regards,
Matthias

> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
> ---
>   arch/arm64/boot/dts/mediatek/mt8195.dtsi | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> index 905d1a90b406..6ec6d59a16ec 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> @@ -1966,7 +1966,7 @@
>   		};
>   
>   		vdosys0: syscon@1c01a000 {
> -			compatible = "mediatek,mt8195-mmsys", "syscon";
> +			compatible = "mediatek,mt8195-vdosys0", "syscon";
>   			reg = <0 0x1c01a000 0 0x1000>;
>   			mboxes = <&gce0 0 CMDQ_THR_PRIO_4>;
>   			#clock-cells = <1>;
> @@ -2101,7 +2101,7 @@
>   		};
>   
>   		vdosys1: syscon@1c100000 {
> -			compatible = "mediatek,mt8195-mmsys", "syscon";
> +			compatible = "mediatek,mt8195-vdosys1", "syscon";
>   			reg = <0 0x1c100000 0 0x1000>;
>   			#clock-cells = <1>;
>   		};

