Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 645FDEB64DD
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Jul 2023 19:30:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k3mlRz7gktaWpRdrv06g72Yt1MD5uxYRKr++3Evm7ZM=; b=ssHv+sGDdD9Ltv8tD/NbbMpFE6
	7iFmoNSK2s6qftjH1todwN6Z2WxFkyuBvYpjHyN629Dmhby+T3g/qjKzTEIJKggAbcByMnDq7Mn9g
	l7ah5992F0teifVE8XmyiyyMdP/AaUlaEQ5+qYSnUe2U/+iu/XJXdgWTSu3y0jDMaH/kLeMXOYmtt
	nJp2ml4AyPdaEVoBmEMV7ceCQYeb7L6qmj2zu+kN+t6AVVLn+BO3+iFj0mwqVEmbMlmKjkFEAc6Sm
	J66LVcqEZPiOI8H+op9oDtlSpvwQun+uudOscZIVhLPzR2qq/fYmA28vwnfyoFFtOarntgNhOSO9T
	5iDjYx5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qH8DC-00Gu9h-2c;
	Wed, 05 Jul 2023 19:30:50 +0000
Received: from mail-io1-f45.google.com ([209.85.166.45])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qH8D9-00Gu8F-21;
	Wed, 05 Jul 2023 19:30:48 +0000
Received: by mail-io1-f45.google.com with SMTP id ca18e2360f4ac-785cbc5bfd2so334380939f.2;
        Wed, 05 Jul 2023 12:30:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688585447; x=1691177447;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k3mlRz7gktaWpRdrv06g72Yt1MD5uxYRKr++3Evm7ZM=;
        b=UZg+yi5eAT/awc4TgFuqxJmBUC3AmkjjpFcqRM3wSodSm6hF19cEUazBxtQRmDErLQ
         WizWq9nBHaJqHeVrdpgByPX1pUbwBF0JOey0guywcp570S5DWTjOzVjqkunVYFa7qx82
         y10GQ7quG4ZAry3dHtNr9atqQ/IGTPF9gAFt6nlM24xTOiEsXt1LJeWQkqt1bnKi4EVE
         GceDpEg1HJDHpXu7faalwgwWUIjqvlW2QAwGfbuTdHega4m11oo867PPT6rkUcoMr5bD
         4siTJgVMOsWwZWpoxupkBalWCo/i2AAC1mS7fSUOXg2j63bR/GAiyaOS+T+kvRIZ3nY5
         5XJA==
X-Gm-Message-State: ABy/qLZrKdig7iA+jrzHzpYnR5LlBeGsN/+/5CtcncIbu/wJlRkD+EpU
	KB0ndSROyIY5wBFUxlQcdg==
X-Google-Smtp-Source: APBJJlEzFhLmGb+irBzIwS0P0x8xQEA1wCS7orNzq6bNP8zuCZeppl8Ds3njMNRfclsij6AuH8FhOQ==
X-Received: by 2002:a5e:c916:0:b0:783:6526:a1a0 with SMTP id z22-20020a5ec916000000b007836526a1a0mr41501iol.15.1688585446834;
        Wed, 05 Jul 2023 12:30:46 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id t4-20020a02c904000000b004266b4a05afsm7981950jao.39.2023.07.05.12.30.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jul 2023 12:30:46 -0700 (PDT)
Received: (nullmailer pid 1702773 invoked by uid 1000);
	Wed, 05 Jul 2023 19:30:43 -0000
Date: Wed, 5 Jul 2023 13:30:43 -0600
From: Rob Herring <robh@kernel.org>
To: Jason-ch Chen <jason-ch.chen@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Conor Dooley <conor+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, jason-ch chen <Jason-ch.Chen@mediatek.com>, linux-mediatek@lists.infradead.org, =?iso-8859-1?Q?N=EDcolas_F_=2E_R_=2E_A_=2E?= Prado <nfraprado@collabora.com>, Rob Herring <robh+dt@kernel.org>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Project_Global_Chrome_Upstream_Group@mediatek.com, Chen-Yu Tsai <wenst@chromium.org>
Subject: Re: [PATCH 2/3] dt-bindings: arm: mediatek: Add mt8188 pericfg
 compatible
Message-ID: <168858544290.1702735.16154973553045477437.robh@kernel.org>
References: <20230705065744.25848-1-jason-ch.chen@mediatek.com>
 <20230705065744.25848-3-jason-ch.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230705065744.25848-3-jason-ch.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230705_123047_663397_C67F20BB 
X-CRM114-Status: UNSURE (   9.88  )
X-CRM114-Notice: Please train this message.
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


On Wed, 05 Jul 2023 14:57:43 +0800, Jason-ch Chen wrote:
> From: jason-ch chen <Jason-ch.Chen@mediatek.com>
> 
> Add mt8188 pericfg compatible to binding document.
> 
> Signed-off-by: jason-ch chen <Jason-ch.Chen@mediatek.com>
> ---
>  .../devicetree/bindings/arm/mediatek/mediatek,pericfg.yaml       | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>


