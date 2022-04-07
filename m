Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2347C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Apr 2022 17:21:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MiEq6zjausQsBZZ/ExeHZ3hFp4jdiLVmtBbMNBkFD8U=; b=ICOI+35Sz8Bwxj
	mH28xwLjrX6qptdpGPMmekeECjzDiFJ4SAiNnVZln7jI6O+Q3GkYGV3R3xCRGQkhpAJi5JzTn/WfJ
	iUfRvpc8cRvcDnXejd1u/b0joYvEU+NjTOUAL1qyHnzSDo7gtBqfsuIDjenj8lPmQIbRcZiH5vtWk
	n5BC5eqL0luUofCiJVZ5vK+yuIIoGLPWnKfeK7pgKo9wftKGWxmIENlkAuSUcZb/AOV2B8YokQElx
	uPdce16E7/eA66/2YfWLu7gclMHXP54r0g5fw+htO1/3AAEFoQvBse9S1lDCSVVo1WeWWBYkpVt6M
	2J49KrBME86C6QfEohFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ncVol-00DKMT-Gp; Thu, 07 Apr 2022 17:21:11 +0000
Received: from mail-oa1-f44.google.com ([209.85.160.44])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ncVoa-00DKI1-4C; Thu, 07 Apr 2022 17:21:01 +0000
Received: by mail-oa1-f44.google.com with SMTP id
 586e51a60fabf-dacc470e03so7066541fac.5; 
 Thu, 07 Apr 2022 10:20:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=rwhEiY9odJROCRAy+Ndxe/cp+ZV49XR/EL4wYOpAE08=;
 b=ah7xCa+NAVdU9KR1PCeDU4BUd07Vbm6q1QpWFjtG0EX6sKzUnUGMb4Nd2WEyG4aObe
 ii827bYgvRMTgUowaLWGjjmcF7gmuSACXQtLvRI6ZQHybitQVqv7D75x7W6HK31AaFiy
 +jad++jzBOFZICN8kQNIfBEHGZbch5YMYD4cV9VPumeTRfLmhiMuruBqBvWz4k54J1pG
 2BwvuwdgTn8DPO8nyRtuYKRufiG302AXWQkX8Ue8BDv3A7BOKIh5xtOHKi5+JOLspq9V
 C27uPl7yWt0Wm33cNsiOQYnCUf7Uxahd0Uf5VRPHdCWi4yLaX0gevGK3kiLRdVpqSIE1
 TwlQ==
X-Gm-Message-State: AOAM532GAB+Bta0VILPHH5x4TEAAvpayGFxJmRF5s5WwMH+WdT58iqLx
 CKOylMH9+xgRaLdwxVYYFA==
X-Google-Smtp-Source: ABdhPJzOkKryYuGQU1yXI/kalRRJK9WAgKPBFsBxb61733YyUlHX5uXdCZkO25oICRI+DQ0DnHBrxQ==
X-Received: by 2002:a05:6870:d1c8:b0:e2:b03:1d44 with SMTP id
 b8-20020a056870d1c800b000e20b031d44mr6489525oac.162.1649352056351; 
 Thu, 07 Apr 2022 10:20:56 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 65-20020aca0544000000b002f980b50140sm3707530oif.18.2022.04.07.10.20.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Apr 2022 10:20:56 -0700 (PDT)
Received: (nullmailer pid 1485057 invoked by uid 1000);
 Thu, 07 Apr 2022 17:20:55 -0000
Date: Thu, 7 Apr 2022 12:20:55 -0500
From: Rob Herring <robh@kernel.org>
To: Felix Fietkau <nbd@nbd.name>
Cc: netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Lorenzo Bianconi <lorenzo@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2 01/14] dt-bindings: net: mediatek: add optional
 properties for the SoC ethernet core
Message-ID: <Yk8ddwmSiFg3pslA@robh.at.kernel.org>
References: <20220405195755.10817-1-nbd@nbd.name>
 <20220405195755.10817-2-nbd@nbd.name>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220405195755.10817-2-nbd@nbd.name>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220407_102100_192040_3F180D48 
X-CRM114-Status: GOOD (  18.10  )
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

On Tue, Apr 05, 2022 at 09:57:42PM +0200, Felix Fietkau wrote:
> From: Lorenzo Bianconi <lorenzo@kernel.org>
> 
> Introduce dma-coherent, cci-control and hifsys optional properties to
> the mediatek ethernet controller bindings
> 
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> Signed-off-by: Felix Fietkau <nbd@nbd.name>
> ---
>  Documentation/devicetree/bindings/net/mediatek-net.txt | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/net/mediatek-net.txt b/Documentation/devicetree/bindings/net/mediatek-net.txt
> index 72d03e07cf7c..13cb12ee4ed6 100644
> --- a/Documentation/devicetree/bindings/net/mediatek-net.txt
> +++ b/Documentation/devicetree/bindings/net/mediatek-net.txt
> @@ -41,6 +41,12 @@ Required properties:
>  - mediatek,pctl: phandle to the syscon node that handles the ports slew rate
>  	and driver current: only for MT2701 and MT7623 SoC
>  
> +Optional properties:
> +- dma-coherent: present if dma operations are coherent
> +- mediatek,cci-control: phandle to the cache coherent interconnect node

There's a common property for this already. See CCI-400 binding.

> +- mediatek,hifsys: phandle to the mediatek hifsys controller used to provide
> +	various clocks and reset to the system.
> +

This series is adding a handful of new properties. Please convert the 
binding to DT schema first.

Rob

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
