Return-Path: <SRS0=vrrm=GZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57B2DC433DB
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Jan 2021 08:14:11 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E296223358
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Jan 2021 08:14:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E296223358
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=/Yl8zMme/k7J7l7wd0fXKW5fqTq+oyT6YN0j4NZg62U=; b=I8yATjOS6+LE+RvNzO4sJURL1
	OMnk+sWWdJ/d9BmrrBCx4BfIoOihiWfetcCPP4qJ3N58c8/LHeZxgNPQVyfxMvELLbIwowtSc7z7/
	+SFp6WEyPUy4x8TZLX4uxOSog/WBhBoFlDkEKadkaONHQfH55zbApqRI0P7im6jHpH0ce4s6smlyp
	n85zP6AngmKzDYBMf4Brftrf3CruXcTgxNf7ZeCknrNQF+lsOqjvb5Esbo+47fOJS/MwDKnF6oPFd
	HWyl+wqdmnRxxEX9yUuRhlRvbIxoxprOz8gbLGG3q0iE4taT9laSUKURx3UrYsVngaUoXAd64ZedJ
	9nUDZfpUg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l2rZo-00053V-IT; Fri, 22 Jan 2021 08:13:52 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l2rZj-00051O-BR
 for linux-mediatek@lists.infradead.org; Fri, 22 Jan 2021 08:13:48 +0000
Received: by mail-pf1-x42a.google.com with SMTP id t29so3195781pfg.11
 for <linux-mediatek@lists.infradead.org>; Fri, 22 Jan 2021 00:13:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gC7rk0hC8Zt8EImbc+l8NzK6TAlu0aggpClSObCpidU=;
 b=P3JxhjaIvdObM6aJYWr90L23Dzb8CMOC0rk24BlBQjbWg/a16XWIpqlZWm2eUo8MLW
 hAs74iu2Wt4jV6QJsRLQAVEpMGT5NJZFEcij38O9sWPaYQK5UdpoJAXoPHotHG61HZZo
 1q26pUDgt46Qtt/6ZhJ9VvrCNSaGD2get1xX4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gC7rk0hC8Zt8EImbc+l8NzK6TAlu0aggpClSObCpidU=;
 b=nTFAD3CsXSpjueULiI/gEkHVHxMeCP9YcPtDA1OIRPtE8Hkb+Ss3klQJlzY0adMm+W
 x0GMMqSxoxA9w6V0sEoW1eCXFd1GEMDyxFtPRJ7QfgBX4h/jBUPE8gHBEZ9WXYwiUtB+
 cODJuWVsaw7njDFCKrSBpOTzjFoZrKfMgEHxf1AvxfPcfi76O3xyhAQ5TGNatR7GlQMm
 pNbkPGf0bQ3SDZYuV3PsHQuMrjpECdCq4mcuGg1n6uxFRXydvS91PiBEj/UAJ6BkUCML
 fYOPMPBi9gxshgX8OLDYIyrBhgbDmJaTu/cvH0ClIP51wrRYg6iPBhhfx7l0jDNXmKgS
 WAcQ==
X-Gm-Message-State: AOAM533qxWr5cFBZ+Bb3f67oHH78n2B8nudNayXe6H5uNHJ5nbFAy0Zx
 HpTzQq59VBRR8ExNiIvu4mQH3EGHRnkeF7KFTyQ5vg==
X-Google-Smtp-Source: ABdhPJyM3pSZTW1WdYHk/1SR5PgWHt193cq01FIJIaGqXj4HpsTsYOx/wM/7f75n5uC4pyDdv/SsJX4z0m21si6nkEA=
X-Received: by 2002:a62:8895:0:b029:19e:92ec:6886 with SMTP id
 l143-20020a6288950000b029019e92ec6886mr3625801pfd.12.1611303223430; Fri, 22
 Jan 2021 00:13:43 -0800 (PST)
MIME-Version: 1.0
References: <20210115112331.27434-1-crystal.guo@mediatek.com>
 <20210115112331.27434-2-crystal.guo@mediatek.com>
In-Reply-To: <20210115112331.27434-2-crystal.guo@mediatek.com>
From: Ikjoon Jang <ikjn@chromium.org>
Date: Fri, 22 Jan 2021 16:13:32 +0800
Message-ID: <CAATdQgA5pKhjOf5gxo+h7cs7kCts3DeKGU5axeX2t+OaJFHyBg@mail.gmail.com>
Subject: Re: [v7, 1/2] dt-binding: reset-controller: mediatek: add YAML schemas
To: Crystal Guo <crystal.guo@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210122_031347_415886_139E0723 
X-CRM114-Status: GOOD (  16.82  )
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, s-anna@ti.com,
 srv_heupstream <srv_heupstream@mediatek.com>,
 =?UTF-8?B?U2VpeWEgV2FuZyAo546L6L+65ZCbKQ==?= <seiya.wang@mediatek.com>,
 open list <linux-kernel@vger.kernel.org>,
 =?UTF-8?B?RmFuIENoZW4gKOmZs+WHoSk=?= <fan.chen@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Yidi.Lin@mediatek.com, p.zabel@pengutronix.de,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Yingjoe Chen <Yingjoe.Chen@mediatek.com>,
 =?UTF-8?B?U3RhbmxleSBDaHUgKOacseWOn+mZnik=?= <stanley.chu@mediatek.com>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Jan 15, 2021 at 7:23 PM Crystal Guo <crystal.guo@mediatek.com> wrote:
>
> Add a YAML documentation for Mediatek, which uses ti reset-controller
> driver directly. The TI reset controller provides a common reset
> management, and is suitable for Mediatek SoCs.
>
> Signed-off-by: Crystal Guo <crystal.guo@mediatek.com>
> ---
>  .../bindings/reset/mediatek-syscon-reset.yaml | 51 +++++++++++++++++++
>  1 file changed, 51 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/reset/mediatek-syscon-reset.yaml
>
> diff --git a/Documentation/devicetree/bindings/reset/mediatek-syscon-reset.yaml b/Documentation/devicetree/bindings/reset/mediatek-syscon-reset.yaml
> new file mode 100644
> index 000000000000..85d241cdb0ea
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/reset/mediatek-syscon-reset.yaml
> @@ -0,0 +1,51 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/reset/mediatek-syscon-reset.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Mediatek Reset Controller
> +
> +maintainers:
> +  - Crystal Guo <crystal.guo@mediatek.com>
> +
> +description:
> +  The bindings describe the reset-controller for Mediatek SoCs,
> +  which is based on TI reset controller. For more detail, please
> +  visit Documentation/devicetree/bindings/reset/ti-syscon-reset.txt.
> +
> +properties:
> +  compatible:
> +    const: mediatek,syscon-reset
> +
> +  '#reset-cells':
> +    const: 1
> +
> +  ti,reset-bits:
> +    description: >
> +      Contains the reset control register information, please refer to
> +      Documentation/devicetree/bindings/reset/ti-syscon-reset.txt.
> +

I remember that Rob didn't like adding new users of this property,

How about removing this from here and using a hardcoded version of
register layouts into driver code (and match it with compatible) ?

e.g.
struct ti_syscon_reset_data mt8192_reset_data { ... }

> +required:
> +  - compatible
> +  - '#reset-cells'
> +  - ti,reset-bits
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/reset/ti-syscon.h>
> +    infracfg: infracfg@10001000 {
> +        compatible = "mediatek,mt8192-infracfg", "syscon", "simple-mfd";
> +        reg = <0 0x10001000>;
> +        #clock-cells = <1>;
> +
> +        infracfg_rst: reset-controller {
> +            compatible = "mediatek,syscon-reset";
> +            #reset-cells = <1>;
> +            ti,reset-bits = <
> +               0x140 15 0x144 15 0 0 (ASSERT_SET | DEASSERT_SET | STATUS_NONE)
> +            >;
> +        };
> +    };
> --
> 2.18.0
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
