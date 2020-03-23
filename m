Return-Path: <SRS0=hrCJ=5I=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01625C43331
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Mar 2020 22:00:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C458420753
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Mar 2020 22:00:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="F1XW67/x"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C458420753
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VyW1p7eJp5LCGbiV2yuSgiMj5mE+fycbQk7UF9bvsnM=; b=F1XW67/xHT6ASf
	ETZEOp+37NouzuYKDSSCNfz49hN+j2dnTn+L5bevBzbWLgsTSIkv+iS7TnSt8XwE95aci+NwTRvmu
	m6p1EQ0gK0OIEfXkTqIgl9Ya2irhGH3EA0raphDNx/KJhW2KNXAnkz8jX13JW8fc0aT30XtmAPe06
	U80gGRi9mLCwS9deXsX0thkBrr5GbdlbYBQkMDMtfkwKLE7ALYPxr++URqnz2DQBpAz8N/uy1YvpI
	EtF5YcDdw2+AD0mm2psXn8o0/ZVaW0O9RIXinLloHF4B4Ti0uwLzoU9m61Q87/pRSyy+1Td4UpNYv
	c105YaCVHJIBGqdejHqg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jGV7f-0007IG-1p; Mon, 23 Mar 2020 22:00:39 +0000
Received: from mail-il1-f193.google.com ([209.85.166.193])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jGV7c-0007Hs-Rp; Mon, 23 Mar 2020 22:00:38 +0000
Received: by mail-il1-f193.google.com with SMTP id m9so14888336ilq.12;
 Mon, 23 Mar 2020 15:00:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=qFiwHqrhsKdbaQVzkW2fMkiFVAgwIM9ohgEmy5tZ2Xk=;
 b=rT3Q5PILoIm/MckgX+ZnBNgc8Zhqk0q2EeAFX7VGd5Rzj326EmNnN9DUjX7yvBnRTV
 AzbAFbg0mm6wZdiYUxo6wTSOO6Tmw4J9ZB2/CE0sZzbJF0eDW70TntJOVuYTirsMnaRf
 Y35XtHSQ8xRZIVucg/ursh2dFirqqNlpfPQdfACQ4cjSVWlxfh28LYe2P88Jq1xxN1/7
 1y3AjS5VhWkMfnV1MfNaOCgTjOip7NdMOaP6jU/ZanOnV2tqaBGdEereI4q1AzHqIpRG
 Ygxawf6eCNO3AdaW19APRgULTM5BwTIBotObhLgJYUVS2M1G7jqf7H5gFXrVezv06KzR
 3bvg==
X-Gm-Message-State: ANhLgQ0I6MHXO5N+s3ptziwinPJcUtNnkGc077qc312hIlVpbap+J1V8
 qC8aOkW50xK5kNXmVU94TA==
X-Google-Smtp-Source: ADFU+vtSXHZEpiLMs2FsMhDZIZ99EheK1oZfK6YT/nyh4eZQFkcY0AWh7hyF7JqjXt0YhfmzAA9P8Q==
X-Received: by 2002:a92:ddcb:: with SMTP id d11mr23249377ilr.211.1585000835890; 
 Mon, 23 Mar 2020 15:00:35 -0700 (PDT)
Received: from rob-hp-laptop ([64.188.179.250])
 by smtp.gmail.com with ESMTPSA id m18sm5620099ila.54.2020.03.23.15.00.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Mar 2020 15:00:35 -0700 (PDT)
Received: (nullmailer pid 10516 invoked by uid 1000);
 Mon, 23 Mar 2020 22:00:33 -0000
Date: Mon, 23 Mar 2020 16:00:33 -0600
From: Rob Herring <robh@kernel.org>
To: Jitao Shi <jitao.shi@mediatek.com>
Subject: Re: [PATCH v3 1/4] dt-bindings: display: mediatek: add property to
 control mipi tx drive current
Message-ID: <20200323220033.GA29463@bogus>
References: <20200311074032.119481-1-jitao.shi@mediatek.com>
 <20200311074032.119481-2-jitao.shi@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200311074032.119481-2-jitao.shi@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200323_150036_900020_61ACF797 
X-CRM114-Status: GOOD (  12.29  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 bibby.hsieh@mediatek.com, srv_heupstream@mediatek.com,
 David Airlie <airlied@linux.ie>, huijuan.xie@mediatek.com, stonea168@163.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 cawa.cheng@mediatek.com, ck.hu@mediatek.com,
 linux-mediatek@lists.infradead.org, Daniel Vetter <daniel@ffwll.ch>,
 Matthias Brugger <matthias.bgg@gmail.com>, yingjoe.chen@mediatek.com,
 eddie.huang@mediatek.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Mar 11, 2020 at 03:40:29PM +0800, Jitao Shi wrote:
> Add a property to control mipi tx drive current:
> "drive-strength-microamp"
> 
> Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> ---
>  .../devicetree/bindings/display/mediatek/mediatek,dsi.txt     | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.txt b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.txt
> index a19a6cc375ed..d501f9ff4b1f 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.txt
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.txt
> @@ -33,6 +33,9 @@ Required properties:
>  - #clock-cells: must be <0>;
>  - #phy-cells: must be <0>.
>  
> +Optional properties:
> +- drive-strength-microamp: adjust driving current, should be 1 ~ 0xF

TBC, 1-0xf is in units of microamps? So a max drive strength of 15uA? 
Seems a bit low.

> +
>  Example:
>  
>  mipi_tx0: mipi-dphy@10215000 {
> @@ -42,6 +45,7 @@ mipi_tx0: mipi-dphy@10215000 {
>  	clock-output-names = "mipi_tx0_pll";
>  	#clock-cells = <0>;
>  	#phy-cells = <0>;
> +	drive-strength-microamp = <0x8>;
>  };
>  
>  dsi0: dsi@1401b000 {
> -- 
> 2.21.0

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
