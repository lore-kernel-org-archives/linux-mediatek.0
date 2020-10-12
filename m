Return-Path: <SRS0=Vqxm=DT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96483C433E7
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Oct 2020 16:00:56 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3C5432067C
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Oct 2020 16:00:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oMI/4B0v"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3C5432067C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=9TnvQSg0VDHKUdanyE/cZwiIBychUXq1pHGdo7ZMdWc=; b=oMI/4B0vT+cQf9fvDt7ev1hBj
	divQZS9JNwFs8MSuNxGuSLkUd+yKKopR5dPk8YElNJKRtSki0ZNLZ7IsFnWSccq+QGgETsm+/B0NJ
	Z74RuTu5ZVvu01jjPlNddBMKG2oqYuQPNHj+qn8wH9+T9BpMyTAnuEm8LegEMgYvj/gOr9DObm1in
	gigyhzVronU2YZwIGVO83CoMjhQN0YhEJRa8SixVmUPnDjINAtC7S+P0hxgSTb28OK9cvojRODTip
	Jb3T1WK5c7jBItPIEhSyUE8BniOZXq+wJkWsnfLqzP6n6AvmgUo8McZU4y3pXM5t5Ynh2wN1Jc9xM
	0fQd8H5ug==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kS0Fk-0006ZT-E2; Mon, 12 Oct 2020 16:00:48 +0000
Received: from mail-ot1-f65.google.com ([209.85.210.65])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kS0Fd-0006WL-4X; Mon, 12 Oct 2020 16:00:41 +0000
Received: by mail-ot1-f65.google.com with SMTP id i12so16286725ota.5;
 Mon, 12 Oct 2020 09:00:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=sKQvgCFfoUK383C3nmDjkaV64Iaz4htqCFpPTHjis94=;
 b=o1mbaDz6CqkhVLdjgKKJvYF2X/4qmwZUBDQdDwvf4u2r/UJanhUZPh16iNC1INC5OU
 WPu+1U2c4l416wY6xr8Glkau4cIh48lOulr/LIXMenfBmXfawyZYzgS03rbZBSGZNOLK
 09UDLaDM7VaJQ3aJ3obPko2sQQqWBAabNjP1KwknxjuHSNxcCwR12qV28gWrJAb1FVry
 mHxWXSKlcAwUkxAPcJ4b0BEJOWWHFzg87PquM9buP7b3G0ntTC7hLq5vM+4qGGFzk3dI
 vioO1yPdTkao6o4kggGg7Z4ky0k/GzvqIXAAqOhT7LCGN7460zR1Kc6amHvcHbXPtmlI
 /aCg==
X-Gm-Message-State: AOAM533tH6h6d9hgs1IAU596Xit2ARAS/vtEDLtYCZRpuOK62V3ffBaq
 1zxeJ5Rm8ibyaviOVVFBSQ==
X-Google-Smtp-Source: ABdhPJxkLahxePnE9AL27oE1+P/rxoCNJR5P+a+QdCW4mRzABSit5agAwmV+5vq3bUnnU+pwFw6YXg==
X-Received: by 2002:a9d:3e4:: with SMTP id f91mr20173294otf.244.1602518440260; 
 Mon, 12 Oct 2020 09:00:40 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id k73sm8849333otk.63.2020.10.12.09.00.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Oct 2020 09:00:39 -0700 (PDT)
Received: (nullmailer pid 1622059 invoked by uid 1000);
 Mon, 12 Oct 2020 16:00:38 -0000
Date: Mon, 12 Oct 2020 11:00:38 -0500
From: Rob Herring <robh@kernel.org>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: Re: [PATCH v2 2/4] dt-bindings: usb: add properties for hard wired
 devices
Message-ID: <20201012160038.GA1618651@bogus>
References: <3db52d534065dcf28e9a10b8129bea3eced0193e.1602318869.git.chunfeng.yun@mediatek.com>
 <bd71ed260efd162d25e0491988d61fcf1e589bc0.1602318869.git.chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <bd71ed260efd162d25e0491988d61fcf1e589bc0.1602318869.git.chunfeng.yun@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201012_120041_190837_E9F5DDFF 
X-CRM114-Status: GOOD (  18.55  )
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
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sat, Oct 10, 2020 at 04:43:12PM +0800, Chunfeng Yun wrote:
> Add some optional properties which are needed for hard wired devices
> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
> v2 changes suggested by Rob:
>    1. modify pattern to support any USB class
>    2. refer to usb-device.yaml instead of usb-device.txt
> ---
>  .../devicetree/bindings/usb/usb-hcd.yaml      | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)

You can fold this into the first patch. While not explicit before, it 
was implied.

Rob

> 
> diff --git a/Documentation/devicetree/bindings/usb/usb-hcd.yaml b/Documentation/devicetree/bindings/usb/usb-hcd.yaml
> index 7263b7f2b510..42b295afdf32 100644
> --- a/Documentation/devicetree/bindings/usb/usb-hcd.yaml
> +++ b/Documentation/devicetree/bindings/usb/usb-hcd.yaml
> @@ -22,9 +22,28 @@ properties:
>      description:
>        Name specifier for the USB PHY
>  
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 0
> +
> +patternProperties:
> +  "^[a-f]+@[0-9a-f]+$":

Just define the unit-address here: "@[0-9a-f]+$"
> +    type: object
> +    $ref: /usb/usb-device.yaml
> +    description: The hard wired USB devices

Need to also define 'reg' and 'compatible' here.

> +
>  examples:
>    - |
>      usb {
>          phys = <&usb2_phy1>, <&usb3_phy1>;
>          phy-names = "usb";
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        hub@1 {
> +            compatible = "usb5e3,610";
> +            reg = <1>;
> +        };
>      };
> -- 
> 2.18.0

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
