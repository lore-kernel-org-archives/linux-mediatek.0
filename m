Return-Path: <SRS0=eP1B=K4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 319ADC47083
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Jun 2021 17:30:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E57F061D23
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Jun 2021 17:30:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E57F061D23
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wkjzpSdunfMMVsMtSYR32I3+n4OTs3l3d50qhQFLrHs=; b=d022bhWiLlMXth
	z+h5FPsOj8T2vRJp9lU4t3T727eNqTlOaUyX+L7MnMCCUP9CB7Tpd9no++LEqzq7oCvxA7QZhp22Y
	qamPpq46bz5TpdTzpsdM1rcRcq6QaQGSkQH4QQY+rgc6pmPIjqnL8bhJFHCXHwDLnIXLJcJLKMW/f
	/HqUCmB5jeDwyGmWqSXWDW9B4L93hEIqxogiXsYPRkYILt7QxBA3PTD29fcqSygXtq2P0Y0hj+fAI
	NFZr5d7a98DpzqdRPbv+uz/qGYLAnjyPabueDWAYFKtNwfioKew6bgqnNnEBS0/L7v9HQPcaHEi9I
	xsW9J1FewG8oqH4Ri8/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1loUgw-005ZEs-Oy; Wed, 02 Jun 2021 17:30:06 +0000
Received: from mail-ot1-f43.google.com ([209.85.210.43])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1loUXn-005U7o-SK; Wed, 02 Jun 2021 17:20:41 +0000
Received: by mail-ot1-f43.google.com with SMTP id
 v19-20020a0568301413b0290304f00e3d88so3115820otp.4; 
 Wed, 02 Jun 2021 10:20:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=S760l51s1Im/Sbvy7Dtc50ED1n126IiINq2IN3QL0xA=;
 b=s+BUiNLMMfXH6z0JPKdTDRK5CVhllNmWUeGXhgzP4oc/2qReZOpSYi6sTxmzXenGLF
 cJvGr76R2bbWcN59qVrPFEynl1Uo4229S3uz3T+g3FKfYOdMxLwk+iqCzAgTYdN85hsR
 zSxMbiND8o9K0/3yFTPuzIi4tnovvr2nOcOewDCjdGFIJFaLmigyiNtF126y4Qlhwjbz
 2aT8b/ZFTJ9zT+FxSKbIPVOqilYQW5tKiQYX4lhAWoK0q+beYFpGzwAHPUwQ3gqGSAsg
 z7sVWXGJNdZC6oU3um4MlQ02FeZWLNL0tiW/mPDsq2yUyUu5dcFmWJiPfXKUaVGLEpUt
 Gl+w==
X-Gm-Message-State: AOAM531kxaT9Fio+++g9ANgLJIlgyjFbo/74hAXtI9DFzW06QzQF/1Es
 4nz2PcWE4x4dKZreGzAQ1w==
X-Google-Smtp-Source: ABdhPJw0aGNS3eRSYczf6VM3Kz60i+J+GYUEcnlmLVIJSL8D7ttU1dvJz16V7KZ2Mr2LaIOaUZSPsQ==
X-Received: by 2002:a05:6830:1d0:: with SMTP id
 r16mr2401070ota.116.1622654438471; 
 Wed, 02 Jun 2021 10:20:38 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id 53sm115521otu.21.2021.06.02.10.20.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jun 2021 10:20:37 -0700 (PDT)
Received: (nullmailer pid 3605273 invoked by uid 1000);
 Wed, 02 Jun 2021 17:20:36 -0000
Date: Wed, 2 Jun 2021 12:20:36 -0500
From: Rob Herring <robh@kernel.org>
To: Chun-Jie Chen <chun-jie.chen@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Stephen Boyd <sboyd@kernel.org>,
 Nicolas Boichat <drinkcat@chromium.org>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 srv_heupstream@mediatek.com, Project_Global_Chrome_Upstream_Group@mediatek.com,
 Weiyi Lu <weiyi.lu@mediatek.com>
Subject: Re: [PATCH v9 05/22] dt-bindings: ARM: Mediatek: Document bindings
 of MT8192 clock controllers
Message-ID: <20210602172036.GA3601208@robh.at.kernel.org>
References: <20210524122053.17155-1-chun-jie.chen@mediatek.com>
 <20210524122053.17155-6-chun-jie.chen@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210524122053.17155-6-chun-jie.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210602_102039_977771_5CF3859B 
X-CRM114-Status: GOOD (  20.54  )
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

On Mon, May 24, 2021 at 08:20:36PM +0800, Chun-Jie Chen wrote:
> This patch adds the binding documentation of topckgen, apmixedsys,
> infracfg, pericfg and subsystem clocks for Mediatek MT8192.

I suspect all these could just be merged into 1 schema like the others 
if the only differences are compatible strings.

> 
> Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
> Signed-off-by: chun-jie.chen <chun-jie.chen@mediatek.com>
> ---
>  .../arm/mediatek/mediatek,apmixedsys.txt      |  1 +
>  .../bindings/arm/mediatek/mediatek,audsys.txt |  1 +
>  .../bindings/arm/mediatek/mediatek,camsys.txt | 22 +++++++++++++++++++
>  .../bindings/arm/mediatek/mediatek,imgsys.txt |  2 ++
>  .../arm/mediatek/mediatek,infracfg.txt        |  1 +
>  .../bindings/arm/mediatek/mediatek,ipesys.txt |  1 +
>  .../bindings/arm/mediatek/mediatek,mfgcfg.txt |  1 +
>  .../bindings/arm/mediatek/mediatek,mmsys.txt  |  1 +
>  .../arm/mediatek/mediatek,pericfg.yaml        |  1 +
>  .../arm/mediatek/mediatek,topckgen.txt        |  1 +
>  .../arm/mediatek/mediatek,vdecsys.txt         |  8 +++++++
>  .../arm/mediatek/mediatek,vencsys.txt         |  1 +
>  12 files changed, 41 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,apmixedsys.txt b/Documentation/devicetree/bindings/arm/mediatek/mediatek,apmixedsys.txt
> index ea827e8763de..551c30735cd7 100644
> --- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,apmixedsys.txt
> +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,apmixedsys.txt
> @@ -18,6 +18,7 @@ Required Properties:
>  	- "mediatek,mt8167-apmixedsys", "syscon"
>  	- "mediatek,mt8173-apmixedsys"
>  	- "mediatek,mt8183-apmixedsys", "syscon"
> +	- "mediatek,mt8192-apmixedsys", "syscon"
>  	- "mediatek,mt8516-apmixedsys"
>  - #clock-cells: Must be 1
>  
> diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,audsys.txt b/Documentation/devicetree/bindings/arm/mediatek/mediatek,audsys.txt
> index b32d374193c7..699776be1dd3 100644
> --- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,audsys.txt
> +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,audsys.txt
> @@ -13,6 +13,7 @@ Required Properties:
>  	- "mediatek,mt7623-audsys", "mediatek,mt2701-audsys", "syscon"
>  	- "mediatek,mt8167-audiosys", "syscon"
>  	- "mediatek,mt8183-audiosys", "syscon"
> +	- "mediatek,mt8192-audsys", "syscon"
>  	- "mediatek,mt8516-audsys", "syscon"
>  - #clock-cells: Must be 1
>  
> diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,camsys.txt b/Documentation/devicetree/bindings/arm/mediatek/mediatek,camsys.txt
> index a0ce82085ad0..7d0b14e5c8ba 100644
> --- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,camsys.txt
> +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,camsys.txt
> @@ -9,6 +9,10 @@ Required Properties:
>  	- "mediatek,mt6765-camsys", "syscon"
>  	- "mediatek,mt6779-camsys", "syscon"
>  	- "mediatek,mt8183-camsys", "syscon"
> +	- "mediatek,mt8192-camsys", "syscon"
> +	- "mediatek,mt8192-camsys_rawa", "syscon"
> +	- "mediatek,mt8192-camsys_rawb", "syscon"
> +	- "mediatek,mt8192-camsys_rawc", "syscon"
>  - #clock-cells: Must be 1
>  
>  The camsys controller uses the common clk binding from
> @@ -22,3 +26,21 @@ camsys: camsys@1a000000  {
>  	reg = <0 0x1a000000  0 0x1000>;
>  	#clock-cells = <1>;
>  };
> +
> +camsys_rawa: syscon@1a04f000 {
> +	compatible = "mediatek,mt8192-camsys_rawa", "syscon";
> +	reg = <0 0x1a04f000 0 0x1000>;
> +	#clock-cells = <1>;
> +};
> +
> +camsys_rawb: syscon@1a06f000 {
> +	compatible = "mediatek,mt8192-camsys_rawb", "syscon";
> +	reg = <0 0x1a06f000 0 0x1000>;
> +	#clock-cells = <1>;
> +};
> +
> +camsys_rawc: syscon@1a08f000 {
> +	compatible = "mediatek,mt8192-camsys_rawc", "syscon";
> +	reg = <0 0x1a08f000 0 0x1000>;
> +	#clock-cells = <1>;
> +};
> diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,imgsys.txt b/Documentation/devicetree/bindings/arm/mediatek/mediatek,imgsys.txt
> index dce4c9241932..b9e599e116dc 100644
> --- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,imgsys.txt
> +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,imgsys.txt
> @@ -15,6 +15,8 @@ Required Properties:
>  	- "mediatek,mt8167-imgsys", "syscon"
>  	- "mediatek,mt8173-imgsys", "syscon"
>  	- "mediatek,mt8183-imgsys", "syscon"
> +	- "mediatek,mt8192-imgsys", "syscon"
> +	- "mediatek,mt8192-imgsys2", "syscon"
>  - #clock-cells: Must be 1
>  
>  The imgsys controller uses the common clk binding from
> diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,infracfg.txt b/Documentation/devicetree/bindings/arm/mediatek/mediatek,infracfg.txt
> index eb3523c7a7be..6e05a0014cf7 100644
> --- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,infracfg.txt
> +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,infracfg.txt
> @@ -19,6 +19,7 @@ Required Properties:
>  	- "mediatek,mt8167-infracfg", "syscon"
>  	- "mediatek,mt8173-infracfg", "syscon"
>  	- "mediatek,mt8183-infracfg", "syscon"
> +	- "mediatek,mt8192-infracfg", "syscon"
>  	- "mediatek,mt8516-infracfg", "syscon"
>  - #clock-cells: Must be 1
>  - #reset-cells: Must be 1
> diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,ipesys.txt b/Documentation/devicetree/bindings/arm/mediatek/mediatek,ipesys.txt
> index 2ce889b023d9..9cd10350ab9b 100644
> --- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,ipesys.txt
> +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,ipesys.txt
> @@ -7,6 +7,7 @@ Required Properties:
>  
>  - compatible: Should be one of:
>  	- "mediatek,mt6779-ipesys", "syscon"
> +	- "mediatek,mt8192-ipesys", "syscon"
>  - #clock-cells: Must be 1
>  
>  The ipesys controller uses the common clk binding from
> diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mfgcfg.txt b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mfgcfg.txt
> index 054424fb64b4..6bfb49a43ef9 100644
> --- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mfgcfg.txt
> +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mfgcfg.txt
> @@ -10,6 +10,7 @@ Required Properties:
>  	- "mediatek,mt6779-mfgcfg", "syscon"
>  	- "mediatek,mt8167-mfgcfg", "syscon"
>  	- "mediatek,mt8183-mfgcfg", "syscon"
> +	- "mediatek,mt8192-mfgcfg", "syscon"
>  - #clock-cells: Must be 1
>  
>  The mfgcfg controller uses the common clk binding from
> diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.txt b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.txt
> index 78c50733985c..9712a6831fab 100644
> --- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.txt
> +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.txt
> @@ -16,6 +16,7 @@ Required Properties:
>  	- "mediatek,mt8167-mmsys", "syscon"
>  	- "mediatek,mt8173-mmsys", "syscon"
>  	- "mediatek,mt8183-mmsys", "syscon"
> +	- "mediatek,mt8192-mmsys", "syscon"
>  - #clock-cells: Must be 1
>  
>  For the clock control, the mmsys controller uses the common clk binding from
> diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,pericfg.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,pericfg.yaml
> index 8723dfe34bab..b405cbcafb90 100644
> --- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,pericfg.yaml
> +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,pericfg.yaml
> @@ -26,6 +26,7 @@ properties:
>                - mediatek,mt8135-pericfg
>                - mediatek,mt8173-pericfg
>                - mediatek,mt8183-pericfg
> +              - mediatek,mt8192-pericfg
>                - mediatek,mt8516-pericfg
>            - const: syscon
>        - items:
> diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,topckgen.txt b/Documentation/devicetree/bindings/arm/mediatek/mediatek,topckgen.txt
> index 5ce7578cf274..1627e384b2ba 100644
> --- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,topckgen.txt
> +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,topckgen.txt
> @@ -18,6 +18,7 @@ Required Properties:
>  	- "mediatek,mt8167-topckgen", "syscon"
>  	- "mediatek,mt8173-topckgen"
>  	- "mediatek,mt8183-topckgen", "syscon"
> +	- "mediatek,mt8192-topckgen", "syscon"
>  	- "mediatek,mt8516-topckgen"
>  - #clock-cells: Must be 1
>  
> diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,vdecsys.txt b/Documentation/devicetree/bindings/arm/mediatek/mediatek,vdecsys.txt
> index 98195169176a..376c82ed09ab 100644
> --- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,vdecsys.txt
> +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,vdecsys.txt
> @@ -14,6 +14,8 @@ Required Properties:
>  	- "mediatek,mt8167-vdecsys", "syscon"
>  	- "mediatek,mt8173-vdecsys", "syscon"
>  	- "mediatek,mt8183-vdecsys", "syscon"
> +	- "mediatek,mt8192-vdecsys", "syscon"
> +	- "mediatek,mt8192-vdecsys_soc", "syscon"
>  - #clock-cells: Must be 1
>  
>  The vdecsys controller uses the common clk binding from
> @@ -27,3 +29,9 @@ vdecsys: clock-controller@16000000 {
>  	reg = <0 0x16000000 0 0x1000>;
>  	#clock-cells = <1>;
>  };
> +
> +vdecsys_soc: syscon@1600f000 {
> +	compatible = "mediatek,mt8192-vdecsys_soc", "syscon";
> +	reg = <0 0x1600f000 0 0x1000>;
> +	#clock-cells = <1>;
> +};
> diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,vencsys.txt b/Documentation/devicetree/bindings/arm/mediatek/mediatek,vencsys.txt
> index 6a6a14e15cd7..d22de01c24ec 100644
> --- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,vencsys.txt
> +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,vencsys.txt
> @@ -11,6 +11,7 @@ Required Properties:
>  	- "mediatek,mt6797-vencsys", "syscon"
>  	- "mediatek,mt8173-vencsys", "syscon"
>  	- "mediatek,mt8183-vencsys", "syscon"
> +	- "mediatek,mt8192-vencsys", "syscon"
>  - #clock-cells: Must be 1
>  
>  The vencsys controller uses the common clk binding from
> -- 
> 2.18.0

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
