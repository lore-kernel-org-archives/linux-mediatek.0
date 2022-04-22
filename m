Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21B97C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Apr 2022 21:11:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GqJ35p+i3H/Q9ADtNcFGu5sfcFhUUp4tor+oQPxSw7E=; b=wD3N3wpiNJucmV
	ueYsR5u8mAwfr3GG+7Fop3jCD8QWZtFmWy+Iu+FAOwnSemtb8Q4h/UvVWtKZi+a/+QGh8qFtkSPok
	gsd4WZy2yfovMGqDPW8W94ppTakokqd5lHkQHyoZp905/wLvVdnN7akhSa/fyFEkTVtv2LB7bCcWo
	OgYk8JCMYU6A5qn+/mEPHV7pZ628nRFDtSke/S1+TVwtTBNq+tTzefjgme1/ERIYlJKnW4NlerGT/
	MEd+ZPR6EjWXE+BaSL/wFd8e5DnvJN0KOTGFi3mBYgG3tOMZL9BSmjCDzmjfQhRxalT/d2yh+F5wJ
	EO3yqeOvRBB/12uj1jPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ni0YH-002Lmk-22; Fri, 22 Apr 2022 21:10:53 +0000
Received: from mail-oa1-f47.google.com ([209.85.160.47])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ni0YE-002LlM-46; Fri, 22 Apr 2022 21:10:51 +0000
Received: by mail-oa1-f47.google.com with SMTP id
 586e51a60fabf-e68392d626so4826972fac.4; 
 Fri, 22 Apr 2022 14:10:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=Tkutjbl6M6F7ROD9a26bDdNrkbSWhhcwmMr6zx2IOcE=;
 b=sXJ4+CaP4/SANGMXo+fUE0jiIfArWEe1uALv/obCDtCuGwP/931p3se1YUsIA6oeNO
 wPz51QKJwXBQ8+b/6C+AXXhHkbD58i2ro5tcTFSkD762HEHQHACfRPz9a5cSTaKlv86o
 Mo26Xe/uzU/qzBDSjW7irMtufg9Bro+nNxbbL8KPFqtLPhYXA4XW5xmtc/5HHoIJASyK
 qzt8X1DsX49s39wIsYEcnWSY8BEgE5kaF2tl1xqL4JP5C8hgaLklISknnMW18AtIwp5N
 YrPCaxAqSwzvM6J5g7lNnetlrUVsOWGLeawvSLLtGOdm75p0xwdPPZR5msV42ZvliR9b
 MldQ==
X-Gm-Message-State: AOAM530APKmD0tnO75F4LWqVsdfDNXUHMBpWsxHdv58zHYmT01DMWXCY
 pERPXLe084Esqr0+FP6zrg==
X-Google-Smtp-Source: ABdhPJxgDVs7xvcysn1Di8tXdOlKYuPI1U7BFRO4ay+lXkeVtgeYsglZ1My+1O/4c4tx67VSav4XdA==
X-Received: by 2002:a05:6870:9689:b0:e6:bcf:4b6 with SMTP id
 o9-20020a056870968900b000e60bcf04b6mr6980687oaq.64.1650661848365; 
 Fri, 22 Apr 2022 14:10:48 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 u20-20020a4a9e94000000b003291f6ac4b2sm1238286ook.28.2022.04.22.14.10.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Apr 2022 14:10:47 -0700 (PDT)
Received: (nullmailer pid 2784281 invoked by uid 1000);
 Fri, 22 Apr 2022 21:10:47 -0000
From: Rob Herring <robh@kernel.org>
To: Tinghan Shen <tinghan.shen@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
 devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
In-Reply-To: <20220422071534.15653-1-tinghan.shen@mediatek.com>
References: <20220422071534.15653-1-tinghan.shen@mediatek.com>
Subject: Re: [PATCH v1] dt-bindings: dsp: mediatek: add mt8186 dsp document
Date: Fri, 22 Apr 2022 16:10:47 -0500
Message-Id: <1650661847.232289.2784280.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220422_141050_203176_2A36AD3D 
X-CRM114-Status: GOOD (  14.97  )
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

On Fri, 22 Apr 2022 15:15:34 +0800, Tinghan Shen wrote:
> This patch adds mt8186 dsp document. The dsp is used for Sound Open
> Firmware driver node. It includes registers, clocks, memory regions,
> and mailbox for dsp.
> 
> Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
> ---
> 
> This patch depends on MT8186 clock bindings.
> https://lore.kernel.org/all/20220409132251.31725-2-chun-jie.chen@mediatek.com/
> 
> ---
>  .../bindings/dsp/mediatek,mt8186-dsp.yaml     | 93 +++++++++++++++++++
>  1 file changed, 93 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/dsp/mediatek,mt8186-dsp.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/dsp/mediatek,mt8186-dsp.example.dts:22:18: fatal error: dt-bindings/clock/mt8186-clk.h: No such file or directory
   22 |         #include <dt-bindings/clock/mt8186-clk.h>
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[1]: *** [scripts/Makefile.lib:364: Documentation/devicetree/bindings/dsp/mediatek,mt8186-dsp.example.dtb] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1401: dt_binding_check] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
