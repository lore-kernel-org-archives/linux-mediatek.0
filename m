Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C34FEC433FE
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Apr 2022 15:32:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s4j3jvzysn6WGENFnI25/n9sVzv8gJRqGOipVG0+b2g=; b=OPaWx+OC9mBBFG
	dCouffysBZe1J41hfxawvfydJaHNJE3WOosXLTHcodz/LeHVzQmo6+VbduhhoDaEwrrEyyYagFh4C
	ANEIjzLxeVptuY3ue9nO76UXuk8lF4381YjTHT2biDAmLMekPXFSnfWgDAmt30ipEJIJay3GKBS4a
	Zdes9dyvWpxTO4qImu/k7lepgIC/ptA1UT6nvC+TXCRNzdAGAvjfFCO6HYomex8oAg2aYOZoFS1tH
	/T+VBYjru8HONpL57zT5MBdbwWHlr7ZHMiM0XfDSAtnCfItEPMTB90Ckby/S2h392H+IMiR9h41EU
	TLhxDuEMxUgOQfrnQ7iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ngpqC-004gTg-5X; Tue, 19 Apr 2022 15:32:32 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ngpIh-004SVV-JZ; Tue, 19 Apr 2022 14:57:58 +0000
Received: by mail-wm1-x32e.google.com with SMTP id x3so10838823wmj.5;
 Tue, 19 Apr 2022 07:57:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=VSfNNxCMPbot3TUeMFQDYDmYhnDExeycdgTmMkPBSiw=;
 b=K89+PXfaCFu09OY7bsgh+7qQX9SHhTwwKvG8GnMvsy4nm507xqyK3sHZ67MuOBouWK
 4rkUK91/51WwE/E/BbtbqNlYpk2W+/m+3Chgf1DgQ/4ZxSP0s1wqpSXNl7+UdgoWj+Xs
 DJy4bCzYn6/vlOL+ZNY9yNQOs/kv50OdjLzRncPuI5wSrw+ftTvwxvHd1FHSO3Lksu+l
 gBhsZjxwGFJya6sN2Lt1XOMX7olBrNleXGG5RLgiKeUMjp6130k6KNYzjV95UMRI84s7
 H+NLnzuto2Whpp86h7jTvQ96wMZQqVnrQDa2fWzSRA2L9LVCV6/K5Tlwf7tuM/Cl+x+g
 jazw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=VSfNNxCMPbot3TUeMFQDYDmYhnDExeycdgTmMkPBSiw=;
 b=mKHmY0PYS2hkylf5JuoOJMQMW06XkW5tqNbYax6eVAGIfFtKz+kro/AyqFQLEZHhv8
 /10N1BaOb8pO42H5IW0CGEJwH/tt9u2WNtahkrAoDQuitWElYmLs0mVRL5065EyUML7x
 b+ECeiAZ2ODbTtqhGWHO1Cql/77Z/h84KEt7RGsanQFC7g6mF2ZO3oTamvtG/PrnATJP
 B9qgnGNYsTJvi4jllarnSThPEUaV1Yq+1KfoVWSd614OEXMXZxcembFRwkc3NtMxjyJg
 Jprj9PpFND9r4qB+CYxwtbi+LC9zAg07D9LIq0RYdUVPVxyG1SS6GynfGavfh2RninHU
 WxYw==
X-Gm-Message-State: AOAM533SHcPM6X7vbs+BWi4dZfPhEijk/L9YEGwc2DX/6eZAWALReXNE
 AfoJFnfq08DrqXISjG/fryI=
X-Google-Smtp-Source: ABdhPJwGtnkzLvabPxjsO/IdFw1I83x6czWqIQw5VNsuYzxUmENRbL2f1OWVQ5C8fTTybXwA29UdQg==
X-Received: by 2002:a05:600c:2197:b0:38e:b80c:526a with SMTP id
 e23-20020a05600c219700b0038eb80c526amr19889290wme.76.1650380272642; 
 Tue, 19 Apr 2022 07:57:52 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
 by smtp.gmail.com with ESMTPSA id
 o10-20020a5d47ca000000b0020a992ce36esm4933973wrc.1.2022.04.19.07.57.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Apr 2022 07:57:51 -0700 (PDT)
Message-ID: <db521557-09ea-2c34-24e5-3bf71961b4fe@gmail.com>
Date: Tue, 19 Apr 2022 16:57:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 2/5] dt-bindings: arm: mediatek: mmsys: add mt8195 SoC
 binding
Content-Language: en-US
To: Rex-BC Chen <rex-bc.chen@mediatek.com>, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, chunkuang.hu@kernel.org,
 p.zabel@pengutronix.de
Cc: airlied@linux.ie, angelogioacchino.delregno@collabora.com,
 jason-jh.lin@mediatek.com, nancy.lin@mediatek.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220419033237.23405-1-rex-bc.chen@mediatek.com>
 <20220419033237.23405-3-rex-bc.chen@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20220419033237.23405-3-rex-bc.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220419_075755_715946_75994DFE 
X-CRM114-Status: GOOD (  15.39  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 19/04/2022 05:32, Rex-BC Chen wrote:
> From: "jason-jh.lin" <jason-jh.lin@mediatek.com>
> 
> In the SoC before, such as mt8173, it has 2 pipelines binding to one
> mmsys with the same clock driver and the same power domain.
> 
> In mt8195, there are 4 pipelines binding to 4 different mmsys, such as
> vdosys0, vdosys1, vppsys0 and vppsys1.
> Each mmsys uses different clock drivers and different power domain.
> 
> Since each mmsys has its own mmio base address, they could be identified
> by their different address during probe time.
> 
> Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
> Reviewed-by: CK Hu <ck.hu@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Applied, thanks

> ---
>   .../devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml         | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
> index 6c2c3edcd443..6ad023eec193 100644
> --- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
> +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
> @@ -31,6 +31,7 @@ properties:
>                 - mediatek,mt8183-mmsys
>                 - mediatek,mt8186-mmsys
>                 - mediatek,mt8192-mmsys
> +              - mediatek,mt8195-mmsys
>                 - mediatek,mt8365-mmsys
>             - const: syscon
>         - items:

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
