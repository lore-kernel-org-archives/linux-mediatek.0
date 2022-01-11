Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25651C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Jan 2022 21:53:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WbXZvv8EjR9jzLrjMRUnLVRloPM52TG6YxaQe8Kmzbw=; b=pNFapLGR5VgbW0
	jvWxg6bBsQ8VKw1Tsqtqf1R0ano9p9fUDeLW2HlHyrJSkiFXNJm2PJF1JgQJlYw+4QE3ytDkxvMPp
	eO/OnpJGwY+pG7B4iGpfyIQGESE9NIplxIk9NPP+18h1jmiAPhafd3DXXkrsBy+W8Qb7trnSw+8JP
	8Nl7n5j8LGDx00lRkgLtJpkO7xe8Hcdjqq0YcRxcv2EGUrJImH2w9WpZgMKqo8Z4iDOGSpfUsr8IR
	xdsai9gAG3xWEUX3IDPolVvmvlGIIbQ6jCTPj1EbJgMn4IlgLLsb7p9SCjS85HSKRQSD3gp0jGR3Y
	smFdbxx7zfzDcbRBxtgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7P5L-000G0o-OL; Tue, 11 Jan 2022 21:53:43 +0000
Received: from mail-ot1-f46.google.com ([209.85.210.46])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7P5J-000FzZ-9M
 for linux-mediatek@lists.infradead.org; Tue, 11 Jan 2022 21:53:42 +0000
Received: by mail-ot1-f46.google.com with SMTP id
 a12-20020a0568301dcc00b005919e149b4cso341618otj.8
 for <linux-mediatek@lists.infradead.org>; Tue, 11 Jan 2022 13:53:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=d2PErXX1Zu38N/AijxY4TcRNrpCVzT0t6yIta9Nhwho=;
 b=ykAJehBM0ijleBtIP9izz08HG7YOGUMxY/5EjRb+D3r65usVFWsiARvorrcl+rqpul
 vYce6btjcecj8qdCFo4LsSi6YSh8Vx7I/5ie1mj0pTGB/V2DPoL9SM68044hgMFMW6Ym
 bV8LC9a9SMqF1feNlZyPNkMeQDozKzdiKv1a2Q6OxyhBV1vWuTaZe/LV/BdB+fnLNR1o
 RQMUEvuikszXsHj2Sx87q+fa58MHJuJgk975+OGY13eGqfP9iAZ1nk/HSggg4Hqp9O30
 hWqlWfpA/3Do+SQylwyzlQQXgEE9DAl58euQtcpSjtdZ+GM3Gz9gwvXd7Kh9uErkXsuq
 rLeQ==
X-Gm-Message-State: AOAM533PzyhaBR01DFjsLeWFDN2H/wDb0/u3gQLFP31fjtlK71dY2UO9
 Pyos7KPLu5Z+DQxr5tBvlA==
X-Google-Smtp-Source: ABdhPJyhokbTnN7kDaqb7DInRuN4ZE9YSE3zro1thlS1Svg9t/77MACWGuoJyoWh9lwbYtd64YL1kA==
X-Received: by 2002:a05:6830:13d9:: with SMTP id
 e25mr4649159otq.215.1641938020231; 
 Tue, 11 Jan 2022 13:53:40 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id h14sm2268808otr.4.2022.01.11.13.53.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jan 2022 13:53:39 -0800 (PST)
Received: (nullmailer pid 3570275 invoked by uid 1000);
 Tue, 11 Jan 2022 21:53:38 -0000
Date: Tue, 11 Jan 2022 15:53:38 -0600
From: Rob Herring <robh@kernel.org>
To: Bo Jiao <bo.jiao@mediatek.com>
Cc: Felix Fietkau <nbd@nbd.name>,
 linux-wireless <linux-wireless@vger.kernel.org>,
 Ryder Lee <ryder.lee@mediatek.com>, Xing Song <xing.song@mediatek.com>,
 Sujuan Chen <sujuan.chen@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>,
 Evelyn Tsai <evelyn.tsai@mediatek.com>,
 linux-mediatek <linux-mediatek@lists.infradead.org>,
 Peter Chiu <chui-hao.chiu@mediatek.com>, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/5] dt-bindings: net: wireless: mt76: document
 bindings for MT7986
Message-ID: <Yd38YhK5IC0PDkVJ@robh.at.kernel.org>
References: <cover.1641901681.git.Bo.Jiao@mediatek.com>
 <67eb9adaa2ed281cb6b8f3c74afc0cc7081f0f6b.1641901681.git.Bo.Jiao@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <67eb9adaa2ed281cb6b8f3c74afc0cc7081f0f6b.1641901681.git.Bo.Jiao@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220111_135341_358412_69A2D0FE 
X-CRM114-Status: GOOD (  19.50  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Jan 11, 2022 at 07:59:17PM +0800, Bo Jiao wrote:
> From: Peter Chiu <chui-hao.chiu@mediatek.com>
> 
> Add an entry for MT7986 SoC.
> 
> Signed-off-by: Peter Chiu <chui-hao.chiu@mediatek.com>
> Cc: devicetree@vger.kernel.org
> ---
>  .../bindings/net/wireless/mediatek,mt76.yaml  | 29 +++++++++++++++++--
>  1 file changed, 27 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/net/wireless/mediatek,mt76.yaml b/Documentation/devicetree/bindings/net/wireless/mediatek,mt76.yaml
> index 1489d3c..4444524 100644
> --- a/Documentation/devicetree/bindings/net/wireless/mediatek,mt76.yaml
> +++ b/Documentation/devicetree/bindings/net/wireless/mediatek,mt76.yaml
> @@ -18,7 +18,7 @@ description: |
>    wireless device. The node is expected to be specified as a child
>    node of the PCI controller to which the wireless chip is connected.
>    Alternatively, it can specify the wireless part of the MT7628/MT7688
> -  or MT7622 SoC.
> +  or MT7622/MT7986 SoC.
>  
>  allOf:
>    - $ref: ieee80211.yaml#
> @@ -29,9 +29,10 @@ properties:
>        - mediatek,mt76
>        - mediatek,mt7628-wmac
>        - mediatek,mt7622-wmac
> +      - mediatek,mt7986-wmac
>  
>    reg:
> -    maxItems: 1
> +    maxItems: 3

You just changed existing users. You need 'minItems: 1' to keep 1 reg 
entry being valid.

>  
>    interrupts:
>      maxItems: 1
> @@ -39,6 +40,17 @@ properties:
>    power-domains:
>      maxItems: 1
>  
> +  memory-region:
> +    maxItems: 1
> +
> +  resets:
> +    maxItems: 1
> +    description:
> +      Specify the consys reset for mt7986.
> +
> +  reset-name:
> +    const: consys
> +
>    mediatek,infracfg:
>      $ref: /schemas/types.yaml#/definitions/phandle
>      description:
> @@ -231,3 +243,16 @@ examples:
>  
>        power-domains = <&scpsys 3>;
>      };
> +
> +  - |
> +    #include <dt-bindings/reset/mt7986-resets.h>
> +    wifi@18000000 {
> +        compatible = "mediatek,mt7986-wmac";
> +        resets = <&watchdog MT7986_TOPRGU_CONSYS_RST>;

I'd suggest you don't use the define here to avoid the dependency.

> +        reset-names = "consys";
> +        reg = <0 0x18000000 0 0x1000000>,
> +              <0 0x10003000 0 0x1000>,
> +              <0 0x011d1000 0 0x1000>;
> +        interrupts = <GIC_SPI 213 IRQ_TYPE_LEVEL_HIGH>;
> +        memory-region = <&wmcpu_emi>;
> +    };
> -- 
> 2.18.0
> 
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
