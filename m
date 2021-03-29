Return-Path: <SRS0=H7Ok=I4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59ACBC433DB
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Mar 2021 00:14:16 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D63B961985
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Mar 2021 00:14:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D63B961985
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:References:In-Reply-To:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=omITkjzocW4w2JE2Q/yKRCSyDzLofF+UCqUsYYu3738=; b=LREBSBhwNOYJzlIoI8ndwlEVyC
	5vqN8zx1w7vcJ23tC/VclaQ2x//nR2tWaUDHFAbXx6rFX3MUBz9V8QSt3ks4JaHmJ/Z9JlXJWe7Hp
	8PHv2Vz4Xf6MwVWtrmhGQI0NQxOoha4QchrgUi5zgsaWKijWTTEIRXHnNhAc1L6iE7ecKsqy0EUUR
	Yxz7OxCYCF8jM2nA8kXJviE0j64D5R4ty80amXxuzcrxnhVzKJuqUugJUOeiZvP2pDDZl8OC9tNWX
	evZuGNsllZj83pXnebCgIRD6qvvx2h/hD+JPlMD6SrHgHkPLSW37oOtrF/Haqs57b4wZOHiZOBAX5
	rK3Ql7Iw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lR21D-0028uT-5E; Tue, 30 Mar 2021 00:14:03 +0000
Received: from mail-ot1-f44.google.com ([209.85.210.44])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lQxS5-001EEP-CE; Mon, 29 Mar 2021 19:21:34 +0000
Received: by mail-ot1-f44.google.com with SMTP id
 w21-20020a9d63950000b02901ce7b8c45b4so13336974otk.5; 
 Mon, 29 Mar 2021 12:21:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=ABMvZ9iUvOdLCSBOVI1wNxuXeT7prS5xQHqqnwlqeLM=;
 b=qVdfJ0AGfDZ9UavX+ZEMsMI3VoMvZJd78vS3ic0ukQuuls2+xLvc6zDhcx1kxaVaPZ
 PF2mM8oiloXjlRjVepvlmSaTktMuLYgzxv9X6RXT8Kf0DveS9DY+MtS7u7/uc8oWiUay
 B15e3Jxjr4gR+ecMdTdbRxs/CY4tTiSgARkrhs+EP7JW23VvPsiyIjQo1xBg/EL+0CoJ
 e0SOqIoLfpVjlUKEqJiyKycgjSFbciT7hfJYT63bLl0d3rOMqq+tBxV1yE5MYJVYP67V
 AwoIFMgTW+UFi7Oz1JBoUv5JlCydHB/hEP+DYerrBHlq0qGedWpbic97enMtw4xMm/2D
 aBGg==
X-Gm-Message-State: AOAM531Vtr0bbi6ydM1GLYyBCmvIhc5xmHPuK7FNgkbbvI9jOJ6+04sM
 HP8fl/BBtWrRnstuZaF5+Q==
X-Google-Smtp-Source: ABdhPJwIFStn32vLNg0UX/TXSmm7jOFuFdUm4TdNpso1A3DPY9K9j909OAzRLcWQUCadrY2Pf09EsQ==
X-Received: by 2002:a9d:1c7:: with SMTP id e65mr23811411ote.259.1617045687465; 
 Mon, 29 Mar 2021 12:21:27 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id f2sm3949995oos.16.2021.03.29.12.21.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Mar 2021 12:21:26 -0700 (PDT)
Received: (nullmailer pid 2905696 invoked by uid 1000);
 Mon, 29 Mar 2021 19:21:24 -0000
From: Rob Herring <robh@kernel.org>
To: Zhiyong Tao <zhiyong.tao@mediatek.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 biao.huang@mediatek.com, linus.walleij@linaro.org, hongzhou.yang@mediatek.com,
 srv_heupstream@mediatek.com, jg_poxu@mediatek.com, robh+dt@kernel.org,
 devicetree@vger.kernel.org, mark.rutland@arm.com, matthias.bgg@gmail.com,
 sean.wang@mediatek.com, linux-gpio@vger.kernel.org, erin.lo@mediatek.com,
 hui.liu@mediatek.com, sean.wang@kernel.org, sj.huang@mediatek.com,
 eddie.huang@mediatek.com, linux-mediatek@lists.infradead.org,
 seiya.wang@mediatek.com
In-Reply-To: <20210329113103.11003-3-zhiyong.tao@mediatek.com>
References: <20210329113103.11003-1-zhiyong.tao@mediatek.com>
 <20210329113103.11003-3-zhiyong.tao@mediatek.com>
Subject: Re: [PATCH Resend v0 2/6] dt-bindings: pinctrl: mt8195: add binding
 document
Date: Mon, 29 Mar 2021 14:21:24 -0500
Message-Id: <1617045684.216718.2905695.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210329_202129_708940_E537994A 
X-CRM114-Status: GOOD (  12.07  )
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

On Mon, 29 Mar 2021 19:30:59 +0800, Zhiyong Tao wrote:
> The commit adds mt8195 compatible node in binding document.
> 
> Signed-off-by: Zhiyong Tao <zhiyong.tao@mediatek.com>
> ---
>  .../bindings/pinctrl/pinctrl-mt8195.yaml      | 152 ++++++++++++++++++
>  1 file changed, 152 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/pinctrl-mt8195.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/pinctrl/pinctrl-mt8195.example.dts:19:18: fatal error: dt-bindings/pinctrl/mt8195-pinfunc.h: No such file or directory
   19 |         #include <dt-bindings/pinctrl/mt8195-pinfunc.h>
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[1]: *** [scripts/Makefile.lib:349: Documentation/devicetree/bindings/pinctrl/pinctrl-mt8195.example.dt.yaml] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1380: dt_binding_check] Error 2

See https://patchwork.ozlabs.org/patch/1459558

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
