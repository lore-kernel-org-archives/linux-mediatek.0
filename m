Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F18AEC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Apr 2022 13:22:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qfernPG25dipSpVpRa/lG644cglHCJSUMv8M+XwfyQk=; b=k6x1fA3x3SHLIu
	5N3nA0mnvGXY4bYt5XfYOnPvPPcvfloBwIoeUcLsZyGRKH7dzcr7hB9aWxiuXEwip+ufhos5JBBjW
	GIbJY9p511UlXu7sJRS7PGaAKl8NcLF5lTajqJHt8hgBAvVChKYmm1bevJLI+2TV/vGQmk71t2xpa
	RHNNbbjhjwMVcH4HjNkOtMXTW25oLbnPc1giFizZP+kX7HM/Nuxbu6cvKPZccL4bohIqiKXbfARoZ
	z/ruAXJzhe8MTAFYArANpdDJzg8/th/GeALxtRZXZesPk2s9t6UdxAtPMKUNxT/KWYYGk5JWMnZTf
	NEKhgYjJUbpsTrLrFNrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ngnoN-003o4m-HG; Tue, 19 Apr 2022 13:22:31 +0000
Received: from mail-ot1-f43.google.com ([209.85.210.43])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ngmjD-003Nq6-Lf; Tue, 19 Apr 2022 12:13:09 +0000
Received: by mail-ot1-f43.google.com with SMTP id
 r14-20020a9d750e000000b00605446d683eso5544431otk.10; 
 Tue, 19 Apr 2022 05:12:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=lbM+6TXr7OH0hoMGKTtqkVWI32EFUbBVKJzBhHmX6V4=;
 b=LnadR1GWbz4ZHVw1QmNNIahGJ1bgKhReHEhiCdzEtMIEEyOvP0nNPL2tfqNSrRu4lT
 ZrY2wlqfG4i6Q6/R4ZH/PSZblPHqmxC8w3VapIFuCmMVZ3GSMwaq87A9XGiGfwg2Mpui
 6E+ISggBK8784AHK5ZsaRvC+L9+wuKCmC6VfoohTmpwOjV4jzDJ8ZvPpVCvLInDVdurV
 Tph2Hl2HBDuKrxllHhvN7sF1k9CBxsILVfHM5tvtsczwl7J2ZQAGSpaiOOI0anODulDY
 KFo+AObtlAmwsLUC8UIW9knbzL9cq4oP1EbgNtIcWtyOjRBIj0DgXjRUgLLCchboSTrR
 a3Gw==
X-Gm-Message-State: AOAM532cbkRL5UOs5bfiwzcehQ0G+hHUZTfN55GuUbRo1V7aMZsP0VNf
 7OMAkntIt34M/worq4oaKg==
X-Google-Smtp-Source: ABdhPJyjKDFF8xz6BuFfOGVDFYuw4bwRD11RnRt3Q2XGouMWxrrzMKZfe3UV4QNteW5WL5S5+lphdg==
X-Received: by 2002:a9d:765a:0:b0:605:4910:afb8 with SMTP id
 o26-20020a9d765a000000b006054910afb8mr4193620otl.1.1650370367445; 
 Tue, 19 Apr 2022 05:12:47 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 o17-20020a9d5c11000000b005b2611a13edsm5239752otk.61.2022.04.19.05.12.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Apr 2022 05:12:47 -0700 (PDT)
Received: (nullmailer pid 1977868 invoked by uid 1000);
 Tue, 19 Apr 2022 12:12:43 -0000
From: Rob Herring <robh@kernel.org>
To: Rex-BC Chen <rex-bc.chen@mediatek.com>
Cc: chunkuang.hu@kernel.org, Project_Global_Chrome_Upstream_Group@mediatek.com,
 angelogioacchino.delregno@collabora.com, nancy.lin@mediatek.com,
 dri-devel@lists.freedesktop.org, robh+dt@kernel.org, airlied@linux.ie,
 linux-kernel@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
 jason-jh.lin@mediatek.com, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, p.zabel@pengutronix.de,
 devicetree@vger.kernel.org, matthias.bgg@gmail.com
In-Reply-To: <20220419033237.23405-6-rex-bc.chen@mediatek.com>
References: <20220419033237.23405-1-rex-bc.chen@mediatek.com>
 <20220419033237.23405-6-rex-bc.chen@mediatek.com>
Subject: Re: [PATCH 5/5] dt-bindings: mediatek: add ethdr definition for mt8195
Date: Tue, 19 Apr 2022 07:12:43 -0500
Message-Id: <1650370363.563060.1977867.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220419_051307_753490_BDBBD24E 
X-CRM114-Status: GOOD (  11.90  )
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

On Tue, 19 Apr 2022 11:32:37 +0800, Rex-BC Chen wrote:
> From: "Nancy.Lin" <nancy.lin@mediatek.com>
> 
> Add vdosys1 ETHDR definition.
> 
> Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
> Reviewed-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../display/mediatek/mediatek,ethdr.yaml      | 158 ++++++++++++++++++
>  1 file changed, 158 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,ethdr.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/display/mediatek/mediatek,ethdr.example.dts:26:18: fatal error: dt-bindings/memory/mt8195-memory-port.h: No such file or directory
   26 |         #include <dt-bindings/memory/mt8195-memory-port.h>
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[1]: *** [scripts/Makefile.lib:364: Documentation/devicetree/bindings/display/mediatek/mediatek,ethdr.example.dtb] Error 1
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
