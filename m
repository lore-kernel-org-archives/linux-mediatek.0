Return-Path: <SRS0=QQ5c=4T=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF7E9C3F2D1
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Mar 2020 22:13:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 873BE21739
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Mar 2020 22:13:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FzZuYGWr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 873BE21739
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=96XAShXJKt0aXeDh3znnMhj+Vjt66QqV1z2rmJX5juE=; b=FzZuYGWrk7nT0p
	NPnjyeEt0oFOiLiSTS7H3DG6NSXAlOBTD2dgBZr2WXNEqEbREQbBgBP1d8lPaI8wwmdno//4/o7/v
	bN6vwrF/g+OY5LuR94As9Mvjlk54T614UjdZUJcGYq1stc2gJnyNTZu2B1j1N5C2CGZC44DnU543v
	rQBJ1sxe/HDffyknpgouYb0GzOGdfTXKQuqZ64KrqKNBoJpPMgoUwHAo5ilVAJgKNM6OhxXWTszP5
	6TIqlBpcEZk/sJQzbRtu2YtGuj03KWEJFe9llpjLiAPi66kTfWAM9ahzH2EaT6lfW9aSkIE7AEa7t
	Die+HklXMuy17qyCONZw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j8tJb-0006kA-Ju; Mon, 02 Mar 2020 22:13:31 +0000
Received: from mail-ot1-f66.google.com ([209.85.210.66])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j8tJZ-0006ja-Db; Mon, 02 Mar 2020 22:13:30 +0000
Received: by mail-ot1-f66.google.com with SMTP id j16so992272otl.1;
 Mon, 02 Mar 2020 14:13:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=uGARtVGb5GQcRJdnLbZgGSdPsUcgBwNPE/vctX/sjkM=;
 b=iqfAFkvQzppBn7vVbybBMLycF98gemoLXqm5Jn4CzjAgx0mybGLOTRsfSRXw1r5c0p
 i9+zM8hzPxbAtTVyU+hBtl4jdk1TpZtCXdG39Rs6/IptHU0sJsYpjyWV0x1SBS1NCFH7
 7Ly5hKZzfqS+kROb7toTkZ6Jgn34Cxh9NTpsc2upQTHCH9XLzdYqUiEwfUPrOit8EuXp
 AxxJgFA79maZNM9iienH2t+GnfgiXxsJKMo9Jrc/TArGYl2uLBV21tXXFSA1Rd1Vhmui
 SqvMwMI22fbCvfBOR5d9Hmhz70tfQAnXayn1N8J0sZTfDn5tR4WXi+XyFsL+VOAAA8RI
 5lRg==
X-Gm-Message-State: ANhLgQ0CVCRPlOYKNM9iUc0/DqKewFCDof8UEoBSSag6soXqdPPzzU6G
 JbUXabljH8Bq0k9bk2UxwQ==
X-Google-Smtp-Source: ADFU+vsW/Ftc+zw0bkyoQI7ygt1in3IUwH41Y0ReqXzak1w+/RwutHp8ko7jGUtVL4RV0SiqGHVaZg==
X-Received: by 2002:a9d:21b4:: with SMTP id s49mr998093otb.294.1583187208115; 
 Mon, 02 Mar 2020 14:13:28 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id p65sm6809911oif.47.2020.03.02.14.13.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Mar 2020 14:13:27 -0800 (PST)
Received: (nullmailer pid 24401 invoked by uid 1000);
 Mon, 02 Mar 2020 22:13:26 -0000
Date: Mon, 2 Mar 2020 16:13:26 -0600
From: Rob Herring <robh@kernel.org>
To: Jitao Shi <jitao.shi@mediatek.com>
Subject: Re: [PATCH v2 1/4] dt-binds: display: mediatek: add property to
 control mipi tx drive current
Message-ID: <20200302221326.GA17941@bogus>
References: <20200225114730.124939-1-jitao.shi@mediatek.com>
 <20200225114730.124939-2-jitao.shi@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200225114730.124939-2-jitao.shi@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200302_141329_458656_8BE0A41E 
X-CRM114-Status: GOOD (  13.59  )
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

On Tue, Feb 25, 2020 at 07:47:27PM +0800, Jitao Shi wrote:
> Add a property to control mipi tx drive current:
> "mipitx-current-drive"

'dt-bindings: display: ...' for the subject prefix.

> 
> Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> ---
>  .../devicetree/bindings/display/mediatek/mediatek,dsi.txt     | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.txt b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.txt
> index a19a6cc375ed..780201ddcd5c 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.txt
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.txt
> @@ -33,6 +33,9 @@ Required properties:
>  - #clock-cells: must be <0>;
>  - #phy-cells: must be <0>.
>  
> +Optional properties:
> +- mipitx-current-drive: adjust driving current, should be 1 ~ 0xF

Perhaps should be a common property and use the existing 
'drive-strength-microamp'.

> +
>  Example:
>  
>  mipi_tx0: mipi-dphy@10215000 {
> @@ -42,6 +45,7 @@ mipi_tx0: mipi-dphy@10215000 {
>  	clock-output-names = "mipi_tx0_pll";
>  	#clock-cells = <0>;
>  	#phy-cells = <0>;
> +	mipitx-current-drive = <0x8>;
>  };
>  
>  dsi0: dsi@1401b000 {
> -- 
> 2.21.0

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
