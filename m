Return-Path: <SRS0=fNpG=PG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 134C1C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Oct 2021 16:45:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D0DC8610C8
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Oct 2021 16:45:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D0DC8610C8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Fw/yNvKri6jOAJpz1iZyvyBptDfFR2KMbVtXfTFhBg4=; b=z/0jA5befuBp2z
	4kHIif2WI4mlN+2quLVerXR/7X++NV8Y50xU/fS712uDkkj8IJ7Si911y9arHa4yCYGMSz/iSu00l
	ByC72D/OlvM8giaxQ8XTIhKucRWzhAJD9h5ziZ0MGVuX2CO4Uzhsvh8wutuALPSzMeMcXNdpC9CR4
	FWYKVskI7Zm+A0HcFxnbxjdcIN68y81Ph31gL6BDgxm4dGkQXfOYIXWUxwy/gkIcBHj3MkHaPGsyj
	3irOcCelDtiswI17e5dWx2xPM3FveiWX7PX1/51LbSJpk43UkQZDPTeN50n24gHVB9xCz5c1+VWpj
	vH7TFe+vYOtijzk3amcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mcVlj-00GXkW-3Q; Mon, 18 Oct 2021 16:45:47 +0000
Received: from mail-ot1-f49.google.com ([209.85.210.49])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mcVlh-00GXjk-7J; Mon, 18 Oct 2021 16:45:46 +0000
Received: by mail-ot1-f49.google.com with SMTP id
 34-20020a9d0325000000b00552cae0decbso694650otv.0; 
 Mon, 18 Oct 2021 09:45:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=v7SIvYsyxTrrhTfqbIcpqFyMaDz24Upct6dezLpWgMA=;
 b=JhYhSnRoyjr2euNeMBcB085LudhBCrMZ5WJ0Ypr7TELNyjU+s+txDrgyNhTAm53pg9
 qadtp7XJdcEK1ojFTY6J0XMszXDY/crT/FyL1LX+9Ftg3vg9iHe+njLEaTw1tJnOanYM
 eydKzvkI06hMLjdiyXGRBhOV7gVE0k0YD2opbw07R/otQibdr4bHC4YnDmk2AmdVcDsD
 J6XFEDf3GUe7JahwR0dIZeLEJru3r83BotpV61Fzz6C4h+AcqndPFaOF/j70M7KFwssT
 /pVlR6hZw5AINbOKlpMgvfEZTYV9tWnoq9ZRMXJwZSNKcLIOqJDqH7na2lJqCTrDu55G
 fjDQ==
X-Gm-Message-State: AOAM530ugTMgHpBiQ0OB8HEZjWovzVpB4+nuIdw63Nrz7YsRCa+Ez70e
 5w4EwT3J0IwVBwWWP5uZDn2oE8RfiA==
X-Google-Smtp-Source: ABdhPJzTN6vcyj7UTW/IiMw7/IQYBgBx/ZG1GMXDcGPS9qtqf97y2RanabonT6M91w/bBg4vnfYovg==
X-Received: by 2002:a05:6830:4488:: with SMTP id
 r8mr777956otv.155.1634575544330; 
 Mon, 18 Oct 2021 09:45:44 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id v17sm3056429otk.56.2021.10.18.09.45.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Oct 2021 09:45:43 -0700 (PDT)
Received: (nullmailer pid 2535996 invoked by uid 1000);
 Mon, 18 Oct 2021 16:45:41 -0000
Date: Mon, 18 Oct 2021 11:45:41 -0500
From: Rob Herring <robh@kernel.org>
To: Sam Shih <sam.shih@mediatek.com>
Cc: Ryder Lee <Ryder.Lee@mediatek.com>, John Crispin <john@phrozen.org>,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Sean Wang <sean.wang@kernel.org>
Subject: Re: [PATCH v8 1/4] dt-bindings: pinctrl: update bindings for MT7986
 SoC
Message-ID: <YW2ktTdHivBGbkwW@robh.at.kernel.org>
References: <20211018114739.14026-1-sam.shih@mediatek.com>
 <20211018114739.14026-2-sam.shih@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211018114739.14026-2-sam.shih@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211018_094545_284671_8B55ACB5 
X-CRM114-Status: GOOD (  13.32  )
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

On Mon, 18 Oct 2021 19:47:36 +0800, Sam Shih wrote:
> This updates bindings for MT7986 pinctrl driver. The
> difference of pinctrl between mt7986a and mt7986b is that pin-41 to
> pin-65 do not exist on mt7986b
> 
> Signed-off-by: Sam Shih <sam.shih@mediatek.com>
> 
> ---
> v8: fixed uart node in yaml dts example
> v7: updated pinctcl node binding description, and separate pinctrl
>      part into a single patch series
> 
> Original thread:
> https://lore.kernel.org/all/8348ed3e-c561-ad7e-fe9e-a31ed346d8d0@gmail.com/
> 
> v6: fixed yamllint warnings/errors v2
> v5: fixed yamllint warnings/errors v1
> v4: used yaml format instead of txt format document
> v3: make mt7986 pinctrl bindings as a separate file
> v2: deleted the redundant description of mt7986a/mt7986b
> ---
>  .../pinctrl/mediatek,mt7986-pinctrl.yaml      | 363 ++++++++++++++++++
>  1 file changed, 363 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/mediatek,mt7986-pinctrl.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
