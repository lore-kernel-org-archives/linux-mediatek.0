Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03B1BC433EF
	for <linux-mediatek@archiver.kernel.org>; Sun, 24 Apr 2022 13:48:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/p8JfstnXLnHZvkzH2BIvvhYZoqaC7U50EI8w/qko/4=; b=LTjZz1yuIJdEsB
	BL9E/Xd7/8N7gZ6CGRCh76tXTpppmuCiFIKclUZZHbQy0PU73xj3thF+xTp6hTT3EbMqnIBRmwLfI
	7P00jM+YligkieK+uDnYSeN5aHq0KhKQuW5J5JHKsaO796wR1pKAZlLR4HxpNAD2XYb87t+MpYdyP
	RY2EUZpdrWXGn6EBjjFJrj7BKY6PrggqxXRADlNJiwIhYL4tcD38p70TITbDWGzYkksAoS3Ifrkn6
	JwO6GaPLwKYEBPAgU4GSsKEPde3Jp/XURBWfrIbdOm0J8qGdk5zeqLrHOC6SJb776CUQEAhBElM/w
	+1m75hrXEtJXTxdTw8mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nican-006hBt-Su; Sun, 24 Apr 2022 13:48:01 +0000
Received: from mail-oa1-f53.google.com ([209.85.160.53])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nicak-006hAm-SX; Sun, 24 Apr 2022 13:48:00 +0000
Received: by mail-oa1-f53.google.com with SMTP id
 586e51a60fabf-d39f741ba0so13529570fac.13; 
 Sun, 24 Apr 2022 06:47:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=Pu6DnoU4e+S28wwiQtquR83df83fF19JIUY4ZsQ9G1U=;
 b=NZGUEcyUOR35j6vyVfEku764hHQMD+UEAr58T3QKwIaWSjlX/dbPRwF+BlSRMtQKQn
 TklPs4vlE89XU4Dfxsh6cO6a1gpoaxQg66twe5Rcqiyr6przcjNmTsWelHj//8YBKiGM
 UtjATVnkfP1dnTwI7LauGUPA3zgPFvPLUHSiIRg+XpWvZ6VKIWQ8Cn1pG3d7WcWPJ6/H
 j277PQFb9y16dT0sG5XvufzSZCuHTtS0Gx6pn/X7+KEmNZGr0VuXi5vPThfhgqYyTeae
 jbFt8LfwpoOqx0wh0dhOqv1Fzx+mjFQ9uuTqdenjx5FWOLTk7OO3ZLWCpwCES9CTmnGF
 HCmg==
X-Gm-Message-State: AOAM531eOAtM4ITvmKsbGUsdSvrGnNfFCJ+UAodK6iAQgDFxSWM4KGW4
 9lT2gUuc1sHb+ohVfznxGg==
X-Google-Smtp-Source: ABdhPJyvEyxNrCShSr4B9GI+N2FFzDSFgIt2A4wEHMS5YRIGTBE48y06oer1YkM1bftG/CRPVFlAgQ==
X-Received: by 2002:a05:6870:ac06:b0:e9:cba:68cc with SMTP id
 kw6-20020a056870ac0600b000e90cba68ccmr3646271oab.144.1650808074936; 
 Sun, 24 Apr 2022 06:47:54 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 y83-20020aca4b56000000b003251ffeaf7csm724139oia.10.2022.04.24.06.47.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Apr 2022 06:47:54 -0700 (PDT)
Received: (nullmailer pid 1284015 invoked by uid 1000);
 Sun, 24 Apr 2022 13:47:53 -0000
From: Rob Herring <robh@kernel.org>
To: Yassine Oudjana <yassine.oudjana@gmail.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Yassine Oudjana <y.oudjana@protonmail.com>,
 devicetree@vger.kernel.org, Ryder Lee <ryder.lee@kernel.org>,
 linux-mediatek@lists.infradead.org,
 Michael Turquette <mturquette@baylibre.com>,
 linux-arm-kernel@lists.infradead.org, Sam Shih <sam.shih@mediatek.com>,
 linux-clk@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>
In-Reply-To: <20220424084647.76577-4-y.oudjana@protonmail.com>
References: <20220424084647.76577-1-y.oudjana@protonmail.com>
 <20220424084647.76577-4-y.oudjana@protonmail.com>
Subject: Re: [PATCH v2 3/3] dt-bindings: arm: mediatek: infracfg: Convert to
 DT schema
Date: Sun, 24 Apr 2022 08:47:53 -0500
Message-Id: <1650808073.407864.1284014.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220424_064758_948041_FB26276D 
X-CRM114-Status: GOOD (  12.32  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sun, 24 Apr 2022 12:46:47 +0400, Yassine Oudjana wrote:
> From: Yassine Oudjana <y.oudjana@protonmail.com>
> 
> Convert infracfg bindings to DT schema format. Not all drivers
> currently implement resets, so #reset-cells is made a required
> property only for those that do. Using power-controller in the
> example node name makes #power-domain-cells required causing
> a dt_binding_check error. To solve this, the node is renamed to
> syscon@10001000.
> 
> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
> ---
>  .../arm/mediatek/mediatek,infracfg.txt        | 42 ----------
>  .../arm/mediatek/mediatek,infracfg.yaml       | 81 +++++++++++++++++++
>  2 files changed, 81 insertions(+), 42 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,infracfg.txt
>  create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,infracfg.yaml
> 

Running 'make dtbs_check' with the schema in this patch gives the
following warnings. Consider if they are expected or the schema is
incorrect. These may not be new warnings.

Note that it is not yet a requirement to have 0 warnings for dtbs_check.
This will change in the future.

Full log is available here: https://patchwork.ozlabs.org/patch/


infracfg@10001000: '#reset-cells' is a required property
	arch/arm64/boot/dts/mediatek/mt7986a-rfb.dtb
	arch/arm64/boot/dts/mediatek/mt7986b-rfb.dtb

syscon@10001000: '#reset-cells' is a required property
	arch/arm64/boot/dts/mediatek/mt2712-evb.dtb


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
