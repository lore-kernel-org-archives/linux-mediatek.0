Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 830ABC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Jan 2022 23:35:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vYzQS2sqNe8ZhxPOEPgmkMuT4JqgX2syZ5A7L9y4OJc=; b=ewOiFMPSNf3D+Z
	G/DT5pr1SiHKQ0rdlN4bVN4+zMk0n9YcRuQJp88t2BA9M26n3GfoJNuuHt4q3E5b+XuOGNtmBfKA4
	J8vIybn2dxor3n6hhdYW63cUbRE3FLLUejZIhFVUVI1oxEed5hl3Hobny6AOxJO/IFt7+SA1Ihvc7
	qCmPRPPOlk3gYWGf4CPloTVnVZk6qN0ZSXgT1MVaT0KGPKLvcsjm4gGCs5lhkdQ/QoPJk0QbTnQhy
	YRO92n9jxD9K1By7D1U1ENCzGNhfeXEB8VA/6qJ3DSTfj+8p/tjAaLGYhbhsxBMewoPAjfURnQrsR
	9amy2MIrt8cUDXSpsiKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nB3RN-00GFki-5q; Fri, 21 Jan 2022 23:35:33 +0000
Received: from mail-oo1-f50.google.com ([209.85.161.50])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nB3RA-00GFgw-EU; Fri, 21 Jan 2022 23:35:21 +0000
Received: by mail-oo1-f50.google.com with SMTP id
 p4-20020a4a8e84000000b002e598a51d60so468153ook.2; 
 Fri, 21 Jan 2022 15:35:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=lKHiq2AsZWPinKuXt6G3c62yHGQDekscNMsLmGJgK2k=;
 b=t6DsyJD/1YHKWArLjVRHH7rkXI5L5UJ9o85OQj+ABXVV+lz4nNYZRhDp0mIWZZqqVZ
 MbyJHjzQQ6M12J7nYPv4aTv3YupmoDca5Z0+mx8WbuwMouRdL33Ck+371MU3k/jz1DWb
 p9744XteGkxgeysw+0sDl5DQrUmexkXDydmseqaxI1AbzK+siSYPYPMbKbyTKhnTMKLR
 ViOaDpx2uMFta9b5yWdPw/jezlt3CXwLd0pLmzecfy4M/hCHycwm7a9eqS0X4Z1OB9Tj
 MQ8wWkF/ADoPjM029Poebq+NuKn1m4KvI8rwUX0ATzLhg4j2wVajZ4chOfznjSOnJXzr
 Vf6Q==
X-Gm-Message-State: AOAM533kIbUtpAJzwDrUcAruHWcbYOyc4WuA9W7C4hPoeZGeLyeEkwxw
 OduT2ISc9BgHUJH1cezcIA==
X-Google-Smtp-Source: ABdhPJyV292K3EFqdUiuUDNzx8/jE1xrtTcg1jtIEpo3bwTOmFomBtGk7ogEx3SZ6y8XVzqgHm9JTA==
X-Received: by 2002:a05:6820:151b:: with SMTP id
 ay27mr4069888oob.47.1642808118263; 
 Fri, 21 Jan 2022 15:35:18 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id w13sm2213974oik.52.2022.01.21.15.35.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Jan 2022 15:35:17 -0800 (PST)
Received: (nullmailer pid 1823399 invoked by uid 1000);
 Fri, 21 Jan 2022 23:35:16 -0000
Date: Fri, 21 Jan 2022 17:35:16 -0600
From: Rob Herring <robh@kernel.org>
To: Chun-Jie Chen <chun-jie.chen@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Stephen Boyd <sboyd@kernel.org>,
 Nicolas Boichat <drinkcat@chromium.org>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 srv_heupstream@mediatek.com, Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [v2 2/3] dt-bindings: ARM: Mediatek: Remove vppsys in MT8195
 clock document
Message-ID: <YetDNPs8Xo/Alndj@robh.at.kernel.org>
References: <20220110005902.27148-1-chun-jie.chen@mediatek.com>
 <20220110005902.27148-3-chun-jie.chen@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220110005902.27148-3-chun-jie.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220121_153520_511249_4D70DD41 
X-CRM114-Status: GOOD (  14.71  )
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

On Mon, Jan 10, 2022 at 08:59:01AM +0800, Chun-Jie Chen wrote:
> vppsys0 and vppsys1 sub-system are both integrated with mmsys driver,
> should be describe in mediatek,mmsys.yaml

Driver partitioning is not a reason to change the DT. This needs a 
better description answering why you are doing this and what are the 
implications (is this breaking the ABI?).

> 
> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
> ---
>  .../arm/mediatek/mediatek,mt8195-clock.yaml      | 16 ----------------
>  1 file changed, 16 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8195-clock.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8195-clock.yaml
> index 17fcbb45d121..d62d60181147 100644
> --- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8195-clock.yaml
> +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8195-clock.yaml
> @@ -28,11 +28,9 @@ properties:
>            - mediatek,mt8195-imp_iic_wrap_s
>            - mediatek,mt8195-imp_iic_wrap_w
>            - mediatek,mt8195-mfgcfg
> -          - mediatek,mt8195-vppsys0
>            - mediatek,mt8195-wpesys
>            - mediatek,mt8195-wpesys_vpp0
>            - mediatek,mt8195-wpesys_vpp1
> -          - mediatek,mt8195-vppsys1
>            - mediatek,mt8195-imgsys
>            - mediatek,mt8195-imgsys1_dip_top
>            - mediatek,mt8195-imgsys1_dip_nr
> @@ -92,13 +90,6 @@ examples:
>          #clock-cells = <1>;
>      };
>  
> -  - |
> -    vppsys0: clock-controller@14000000 {
> -        compatible = "mediatek,mt8195-vppsys0";
> -        reg = <0x14000000 0x1000>;
> -        #clock-cells = <1>;
> -    };
> -
>    - |
>      wpesys: clock-controller@14e00000 {
>          compatible = "mediatek,mt8195-wpesys";
> @@ -120,13 +111,6 @@ examples:
>          #clock-cells = <1>;
>      };
>  
> -  - |
> -    vppsys1: clock-controller@14f00000 {
> -        compatible = "mediatek,mt8195-vppsys1";
> -        reg = <0x14f00000 0x1000>;
> -        #clock-cells = <1>;
> -    };
> -
>    - |
>      imgsys: clock-controller@15000000 {
>          compatible = "mediatek,mt8195-imgsys";
> -- 
> 2.18.0
> 
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
