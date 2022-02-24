Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B666EC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Feb 2022 21:20:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MLsbZg8t6FlRLp+Cxk7PNZQAvXbnNDHPao/XfN038u4=; b=VV1zig4zyvdZUM
	XRJyQEAwHyLO1a9mAuNLwdprAgYtukYjRgk2hQbXUUnjuanmzu1cLL0d7G+dWUQSSN/XX2NtiUZLe
	zy3mnRguffr7kfsfQmEavRgOuORzb/7sHlkXTzpS793XCEP3xmuRBmxnCczL0RTTUJcRwfYRPtczV
	Sht4tE/iCPq1jSkcBTkX9PFvzB5ovN2C1T/hE0gHLvu1f0cJat/PtFWmh9g/qgV6OiccfrQotmz4K
	UjOEPzszapaPn3gmk6e12iTlooSL9RbXw3fygjlo1pGDsh4M9+NtJamM4QTMc+qNBy9iWae0oFfss
	mOAEvRNfhGw/nHOpDJmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nNLWk-002QsX-My; Thu, 24 Feb 2022 21:19:54 +0000
Received: from mail-oi1-f171.google.com ([209.85.167.171])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nNLWY-002Qqx-Cr; Thu, 24 Feb 2022 21:19:43 +0000
Received: by mail-oi1-f171.google.com with SMTP id p15so5085818oip.3;
 Thu, 24 Feb 2022 13:19:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=P6QnJiv1rMIaign9iD0tkUPqz3xHrGrktiGAlyZNFsI=;
 b=6VnhzVospz3TboKxkfCplEEqTyeXt3fUIXxf232cbID0HslwwbcI7YP7pwTL/b/9yH
 pUs1X392GYmTzNF/T2LxMI0N1PAxJO/Iz/7ZOnAw5EhPJWzWdp5vhSFcNdWPzIdJyQmJ
 kQ2ur78cqp/W1/UOG5sNqp4LPtd56KPCFKOKBk2O0U2ohX3erT8GQ8kkwsUeCsXHaRoA
 dk198hm9l2+n4rrKwrkO0Gah5YF1WSCsV6wGgpxPeuc5rKJj5rhuybrbCpP5MLlSCiwo
 mU+t4lXEjfSiaJaYonC+9QiyMxjGfsohJ2qDMJbWuCY0dXrYRKKl95AgY54XJhlasGh9
 AOmA==
X-Gm-Message-State: AOAM530HL7FMLdKhOJmHzMa+uNB3lb8FKvC6/cvAAsxVA+KWmZYBSXS9
 5OOAKxFhNOVrIHBrnInBE/ChnAb00g==
X-Google-Smtp-Source: ABdhPJzlgmL4Mdb2h4dOX1lcM83XGfZginiIrhciEV3qmI1oyjIGjejhSg9GcmdUZj0IZYs9PECzEg==
X-Received: by 2002:a05:6870:f80d:b0:d3:12c8:d6bf with SMTP id
 fr13-20020a056870f80d00b000d312c8d6bfmr11660oab.270.1645737581477; 
 Thu, 24 Feb 2022 13:19:41 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213]) by smtp.gmail.com with ESMTPSA id
 g2-20020a9d5f82000000b005af678c9cfdsm254665oti.41.2022.02.24.13.19.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Feb 2022 13:19:40 -0800 (PST)
Received: (nullmailer pid 3607370 invoked by uid 1000);
 Thu, 24 Feb 2022 21:19:39 -0000
Date: Thu, 24 Feb 2022 15:19:39 -0600
From: Rob Herring <robh@kernel.org>
To: xinlei.lee@mediatek.com
Cc: thierry.reding@gmail.com, u.kleine-koenig@pengutronix.de,
 lee.jones@linaro.org, matthias.bgg@gmail.com, jitao.shi@mediatek.com,
 allen-kh.cheng@mediatek.com, linux-pwm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Xinlei Lee <xinlei.lee@mediatek.corp-partner.google.com>
Subject: Re: [v2,4/4] dt-bindings: pwm: Add compatible for MediaTek MT8186
Message-ID: <Yhf2a/h6H1/9sN6b@robh.at.kernel.org>
References: <1645003971-16908-1-git-send-email-xinlei.lee@mediatek.com>
 <1645003971-16908-5-git-send-email-xinlei.lee@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1645003971-16908-5-git-send-email-xinlei.lee@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220224_131942_461423_582358CB 
X-CRM114-Status: GOOD (  12.44  )
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

On Wed, Feb 16, 2022 at 05:32:51PM +0800, xinlei.lee@mediatek.com wrote:
> From: Xinlei Lee <xinlei.lee@mediatek.corp-partner.google.com>
> 
> Add dt-binding documentation of pwm for MediaTek MT8186 SoC.
> 
> Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.corp-partner.google.com>
> ---
>  Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml b/Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml
> index 768ab04d3764..1f45b1b8c3d4 100755
> --- a/Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml
> +++ b/Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml
> @@ -17,6 +17,7 @@ properties:
>        - mediatek,mt6595-disp-pwm
>        - mediatek,mt8173-disp-pwm
>        - mediatek,mt8183-disp-pwm
> +      - mediatek,mt8186-disp-pwm
>        - mediatek,mt8192-disp-pwm
>        - mediatek,mt8195-disp-pwm

It seems unlikely that every SoC has a different version of h/w for 
something as simple as a PWM. There's not an appropriate fallback? The 
first version from an SoC that has all the features and would work with 
existing driver unchanged?

Rob

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
