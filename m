Return-Path: <SRS0=4wrq=4P=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88E2FC11D3D
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Feb 2020 17:19:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5A35A246A0
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Feb 2020 17:19:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="heGklP5T"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5A35A246A0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=saHYeu16qGRTl8M3qgLSajfBVP4y7yv1wFArIaOZLak=; b=heGklP5T0GHGta
	cSITUbYvkty3tGkKcEGLtEBNu5s2Upy5GMAdz6m7OuNoX/9fIgpzgVEB11esezPG5LL0JibKgC6ss
	N7TToQr07wl1ZNv8blqVFTdFIvCOSSUgayskMDWzMXL0je+aIDox/7Lbz7pPDeLTMxgBUMG3q+w2e
	0rhMrlnxvpd7TByFRPSAxc3eFCeKJw3mxMRI3froxpcV3rUhCv4b9i+Oyx4nJMb4hg7fIzzmMAuJe
	zqWCfGIvjzDAZQEf2ALhUKAm4okg0O1HO/+21LdIS6EPd05FtPQvBLAyz/lZrq6JtVMkRbuwL1h7Q
	9cAlrijgsv+XjQksBADA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j7MoW-0006KU-W7; Thu, 27 Feb 2020 17:19:08 +0000
Received: from mail-oi1-f193.google.com ([209.85.167.193])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j7MoV-0006K8-64; Thu, 27 Feb 2020 17:19:08 +0000
Received: by mail-oi1-f193.google.com with SMTP id d62so4023637oia.11;
 Thu, 27 Feb 2020 09:19:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=EEa7ye+4SNg6W5sroyNYrJMOxOtx09zWUa0ioGPqjd8=;
 b=ra2BgRPwpG7mTV7Ct7R/vM/kTSF4IEJOyDiYUXbhyr0ah5FsImG2G1HIj7dcvhqX6r
 yovxqMygv219o3mLTZFp/UmqTDrN64SKuoBE+biV/IaLK6XiIgyy0vBJqpkJrjHAwgjd
 HWibcKO3go8kGP+hrQtCJImVPsdJ4K/yPObpnCfnoIgvTmoeTz5eZCSCMO8z4kdZe0RO
 2XVQaDG/1Dd/y42feA4qd2bikIT8dLe/rBE+6E5M3TV/2xx4L4+usZmBjmr0ONmNXN11
 24BbdSte5CjH8BXGJWqt929APOhM2URxCPHWX5PShAFgjDCDqa+kkyg4/ipr/QoLdoW/
 YrEw==
X-Gm-Message-State: APjAAAVD2OEQy+FRj8il4dbHA9Rab7X8YLn5JDf1TLI05RXSikkeJj/v
 EZ+zIkZ4opPHKWsb8n90MA==
X-Google-Smtp-Source: APXvYqyivrbnGPADBq2gCXjpZ0Ulx7DPwJxfGsdNrYwEE5j4rbjAGXZ2yhl3jW4hSxNtdbA1D1ycUA==
X-Received: by 2002:aca:3857:: with SMTP id f84mr58985oia.150.1582823946480;
 Thu, 27 Feb 2020 09:19:06 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id k201sm2165169oih.43.2020.02.27.09.19.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Feb 2020 09:19:06 -0800 (PST)
Received: (nullmailer pid 18856 invoked by uid 1000);
 Thu, 27 Feb 2020 17:19:04 -0000
Date: Thu, 27 Feb 2020 11:19:04 -0600
From: Rob Herring <robh@kernel.org>
To: Jitao Shi <jitao.shi@mediatek.com>
Subject: Re: [PATCH v9 3/5] dt-bindings: display: mediatek: dpi sample data
 in dual edge support
Message-ID: <20200227171904.GA17829@bogus>
References: <20200226053238.31646-1-jitao.shi@mediatek.com>
 <20200226053238.31646-4-jitao.shi@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200226053238.31646-4-jitao.shi@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200227_091907_225987_045B9316 
X-CRM114-Status: GOOD (  13.65  )
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
 srv_heupstream@mediatek.com, David Airlie <airlied@linux.ie>,
 huijuan.xie@mediatek.com, stonea168@163.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, cawa.cheng@mediatek.com,
 linux-mediatek@lists.infradead.org, Daniel Vetter <daniel@ffwll.ch>,
 Matthias Brugger <matthias.bgg@gmail.com>, yingjoe.chen@mediatek.com,
 eddie.huang@mediatek.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Feb 26, 2020 at 01:32:36PM +0800, Jitao Shi wrote:
> Add property "pclk-sample" to config the dpi sample on falling (0),
> rising (1), both falling and rising (2).
> 
> Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> ---
>  .../devicetree/bindings/display/mediatek/mediatek,dpi.txt       | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.txt b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.txt
> index a7b1b8bfb65e..4299aa1adf45 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.txt
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.txt
> @@ -20,6 +20,7 @@ Required properties:
>  Optional properties:
>  - pinctrl-names: Contain "gpiomode" and "dpimode".
>    pinctrl-names see Documentation/devicetree/bindings/pinctrlpinctrl-bindings.txt
> +- pclk-sample: refer Documentation/devicetree/bindings/media/video-interfaces.txt.
>  
>  Example:
>  
> @@ -37,6 +38,7 @@ dpi0: dpi@1401d000 {
>  
>  	port {
>  		dpi0_out: endpoint {
> +			pclk-sample = 0;

Not valid dts syntax: <0>

>  			remote-endpoint = <&hdmi0_in>;
>  		};
>  	};
> -- 
> 2.21.0
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
