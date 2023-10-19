Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57060CDB465
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Oct 2023 12:47:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=naO0ArV+Rq86QocR3tMDAsTcPVQkObJXSWE2h8O75mE=; b=CpyB768XngohKCWDCwMRcwOVy7
	U6oL1yVXMs2jwZ7D1d6kD/WvAP8SKtPXht/lC0xB7xAPcL+scumpx6s0Kx9e8zvmzaVWbHSlsmDL2
	zsJuzjZLDQ3Qonrqz1tp3stw1l37mP6WJPCCDZQstYYcau38NrF4UKYYz4gPEwH8CI3I3w3tGMtk8
	swkL0ejp57lhGsgf55Y9wZFDoPP6pC3HHw3drFXLMehWGNuDVxU5FagSx4x+z2gBOjNACziaXaAvB
	pCazpzEqlNQKT84DLJiNPb7uGK+gRMayamIwxCCUipMqZvyfU0e2LnPL+jKZsxNkq1mswqBfh7hNx
	RXPziSUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtSQZ-00HMWG-0g;
	Thu, 19 Oct 2023 12:47:03 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtSQS-00HMRq-0z
	for linux-mediatek@lists.infradead.org;
	Thu, 19 Oct 2023 12:46:57 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4083dbc43cfso13030945e9.3
        for <linux-mediatek@lists.infradead.org>; Thu, 19 Oct 2023 05:46:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1697719612; x=1698324412; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=naO0ArV+Rq86QocR3tMDAsTcPVQkObJXSWE2h8O75mE=;
        b=gC2XmQPg0j+GSqAngnvDScQMyeziTg5IaMLmdrZ2HiuZxU109fMxc4b9RH2JL+MrjT
         jCONJkbF+/Za6ydN+1BeX/9LStkPQMkdj37ruqMByHOS2H2Ym3ZXcBzNkhJqrdaTfvCi
         tLFwwnzp6+QWAwFDKJ2XGkuMQ8XgITmh0LHcsosDtLs5oZf6MC4AzGFgB1fhrB2+0kxT
         oWW6+MT77UsJKblhQTERp/knwLywJHsLI88FEscrNj6AE1Xna0YnwLp6l+LCO2wemQ+/
         xgSWkOdw8JNw6Hq/46FrQAqcJt6Wt9S2KmkGfzO+y3y1bKRqnDjst9uxfdgCIaIxLcrW
         JtTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697719612; x=1698324412;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=naO0ArV+Rq86QocR3tMDAsTcPVQkObJXSWE2h8O75mE=;
        b=Eh56K+Dd6CirV3sNpwCt3LSt956dZyNUSMYdqSPHtADVyC+zZ1Q5r7H/Azq+qjIE83
         Auj5ZBjJlymzU4N16dzleT2tzMM6HY3DZ4liTrH4JNLumnbmv2mZVVeNe4XwPWd7RyMv
         3UClb6a1HraH7Oo9TN41tyIP7sPaJOI634JSoJlRiLGta7H6dQ4EFtXZHOJzlZjzrwmV
         w+1KCdsfIWRNra2+skd6aSVTmlil8r+5wp48BywR95WPcdE3P3SSdrEc9yKPuX0tlqxS
         bxWnSctEc/K/4377VT4AIIBy0/iroh/lf04zyV/+rYYVSCJATKnjFIZawtXxVfXI7Sjh
         Ikdg==
X-Gm-Message-State: AOJu0Yzj0BZYxAzs9m76OMUeCr3jPVaXvuP4PG1JLG3TPi/N5yRwr/MR
	yn201lOC4c4l33yFsOsJ6Agp7w==
X-Google-Smtp-Source: AGHT+IEww6Zn2OArX7FoTzmoLU1HGPD7xbs5yK+OIFpoRrGazQCxszROKhxnLYgi/b2b2bUJfLhwtA==
X-Received: by 2002:a05:600c:4591:b0:406:8465:d299 with SMTP id r17-20020a05600c459100b004068465d299mr1797890wmo.7.1697719611910;
        Thu, 19 Oct 2023 05:46:51 -0700 (PDT)
Received: from [10.1.5.76] (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id r4-20020a05600c35c400b0040531f5c51asm4476866wmq.5.2023.10.19.05.46.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Oct 2023 05:46:51 -0700 (PDT)
Message-ID: <68bb1c4b-da47-44ec-88b7-9ec18d607f7a@baylibre.com>
Date: Thu, 19 Oct 2023 14:46:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/3] dt-bindings: arm64: dts: mediatek: Add
 ologic,pumpkin-i350 board
Content-Language: en-US
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-mediatek@lists.infradead.org
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Paul Elder <paul.elder@ideasonboard.com>,
 Fabien Parent <fabien.parent@linaro.org>,
 Julien Stephan <jstephan@baylibre.com>,
 Suhrid Subramaniam <suhrid.subramaniam@mediatek.com>,
 Ted Larson <ted@ologicinc.com>
References: <20231016215123.30343-1-laurent.pinchart@ideasonboard.com>
 <20231016215123.30343-3-laurent.pinchart@ideasonboard.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20231016215123.30343-3-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231019_054656_351415_1FB44FFA 
X-CRM114-Status: GOOD (  12.19  )
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

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

On 16/10/2023 23:51, Laurent Pinchart wrote:
> Add a compatible string for the Pumpkin i350 board, an MT8365-based
> board developed by OLogic.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>   Documentation/devicetree/bindings/arm/mediatek.yaml | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
> index ae12b1cab9fb..dc34e62c6756 100644
> --- a/Documentation/devicetree/bindings/arm/mediatek.yaml
> +++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
> @@ -247,6 +247,7 @@ properties:
>         - items:
>             - enum:
>                 - mediatek,mt8365-evk
> +              - ologic,pumpkin-i350
>             - const: mediatek,mt8365
>         - items:
>             - enum:

-- 
Regards,
Alexandre

