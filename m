Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0276C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 May 2022 22:33:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xM8EIaxxe7YVp48lNotfgLoz7KSEd2QKD7up7eW2gbE=; b=jjnC/wQXMU8cb4
	HbsD1Rv36WK2tx9AzD9Si2j9xaIxmc4Ps9xliVS1DqM17RzFemOz5AxT3PUi2UQzhCOdspENIcytn
	faU8V1+azk9N9kBiOHnekc8GBAqOFtg5VShfLEDwLTanBuqudhOI5Aa3OrtAh2v7oCmWZCNL+DsjU
	wSxdcL8ci3yo491K7HznCBN7qNu8KVQKlgwqg/EpP9toGVUHL7YXqlgXMSdeHEXLMsx69LHBW3fPA
	Ffrtau4bG9jzJIKBoOilrSWk74ozClZYp+nPRrT4McB5wzN7Qk5JUfFbFazhRpKtAdDJHx106AJ9i
	66aGlRal+Yl7Fem749cQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nsBBe-00EmiF-U2; Fri, 20 May 2022 22:33:34 +0000
Received: from mail-oi1-f169.google.com ([209.85.167.169])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nsBBc-00EmhA-Qg; Fri, 20 May 2022 22:33:33 +0000
Received: by mail-oi1-f169.google.com with SMTP id t144so8264349oie.7;
 Fri, 20 May 2022 15:33:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=PXDaYfdouwA97Dyh3xFZZ2BaIW2LzW4Se1PNa8S3D9Q=;
 b=7SizSegOpgqeAaXd6y/0FmHS5mlKVwlwiSxt87qf2p5x516i7CXIr6MKGakQFVq7qA
 Ez5Eq3mognxrMGbC6x6f5g0RwvVK8uiCidl2fNgwVh/nYC91u4cksHzBUNHb4TYbPP6u
 mkzs+wGXuLLhmTdzdZsBOb1tmyHnoiICfnZIYSWYa2igAI1a2f3mciAsGido5bOpq+8C
 AM3rTRHDb6JonFBL7EN5dPebY1r0lJACVkU0h8oIwLrHojxStH+867ibArIttkDr9coP
 7GC4oMERC8sGC3cpuF+meOrL5FLiwzZycrwI8R1+m3Zy9Oa7hV3Dls7UmAkyHfu+C1aU
 JpzQ==
X-Gm-Message-State: AOAM533xar1KCMB1yApsJ6ZOkb3/Dr33AEJ33Jw9gSzRRc3cBRYjuUsc
 NONgfM9P10xWcoPw5TFTEA==
X-Google-Smtp-Source: ABdhPJxEqOGnOf4NSH7Hk1LJ68LHOPidjNw1JrZtODYMxN39z+e4TAoUh6dDrjhozXcA7G6zekSwbg==
X-Received: by 2002:a05:6808:11c2:b0:2f9:b58f:5ac7 with SMTP id
 p2-20020a05680811c200b002f9b58f5ac7mr7100268oiv.132.1653086010592; 
 Fri, 20 May 2022 15:33:30 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 b7-20020a4aac87000000b0035eb4e5a6d6sm1636202oon.44.2022.05.20.15.33.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 May 2022 15:33:29 -0700 (PDT)
Received: (nullmailer pid 374265 invoked by uid 1000);
 Fri, 20 May 2022 22:33:15 -0000
Date: Fri, 20 May 2022 17:33:15 -0500
From: Rob Herring <robh@kernel.org>
To: Rex-BC Chen <rex-bc.chen@mediatek.com>
Cc: mturquette@baylibre.com, chun-jie.chen@mediatek.com,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-clk@vger.kernel.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 runyang.chen@mediatek.com, sboyd@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 p.zabel@pengutronix.de, wenst@chromium.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 angelogioacchino.delregno@collabora.com, robh+dt@kernel.org
Subject: Re: [PATCH v7 18/19] dt-bindings: arm: mediatek: Add #reset-cells
 property for MT8186
Message-ID: <20220520223315.GA374204-robh@kernel.org>
References: <20220519125527.18544-1-rex-bc.chen@mediatek.com>
 <20220519125527.18544-19-rex-bc.chen@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220519125527.18544-19-rex-bc.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220520_153332_894608_EBFDE9F6 
X-CRM114-Status: GOOD (  10.86  )
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

On Thu, 19 May 2022 20:55:26 +0800, Rex-BC Chen wrote:
> We will use the infra_ao reset which is defined in mt8186-sys-clock.
> The value of reset-cells is 1.
> 
> Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> ---
>  .../bindings/arm/mediatek/mediatek,mt8186-sys-clock.yaml       | 3 +++
>  1 file changed, 3 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
