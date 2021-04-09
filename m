Return-Path: <SRS0=HbKG=JG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C13BC433ED
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Apr 2021 18:26:12 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2ED35610E5
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Apr 2021 18:26:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2ED35610E5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=TkMz/u8kde1KTfh+FTSpYgWF5+vF9c4tQbtPspCNCIU=; b=KBQUuecRqW39B1aTm6DlRUCJJ
	cYh5wcX4rxpznqxlnaGF2RLHwZr4gk6PElfZsxUcZXwkZsiRjPSqicQqOdM6s08wVrN7LoMkLosj2
	UwROoTWyW6RMvNBysJoILTlDjALIkSDc94ey+ELceOqpuyHAV2F7guUY8MM5HKD0fqMcSqbE29oNH
	eazUwRR/I0hinxkFjj/h6w1yVDneoitW5SoFsVWCyKazr0Pwzr+oOQvnoPbh0TliDCcigxCwaDJj6
	RpwCaXrB0zEusjZLoqxm4qLVhWADHFMmuuObxlBEmsNB4q+RGLsQSyEy1K86w+DGj2lq5rf2Mq2LB
	Np3Zj/zCQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lUvpM-001KKS-7s; Fri, 09 Apr 2021 18:25:56 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUvpA-001KIM-DR; Fri, 09 Apr 2021 18:25:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=ap1xXHQrgNoanoCkiwbFpBXllDQp2mXH4gtHCARaL4U=; b=Ospf3x7r4z+yESkg4yIbrsrXaF
 I3YVDv1IhU9hijmvotx/0945/+qPZqhSReOWGN7QOZsZYHKErIlPbJ8vx5QBjOE0HkSUSWIQc+yiO
 +n9XoHTOWCRsgSYiRccU02r1pZUfv72+hntJQ4yOgFcXSFYMRjM+GG9sk+YfNyr8grGoYJg02M+q8
 i36cuEcpX0IGP8YeHEOG0ZuARPHTC8LnWI/qc6s8JzIAQZ0HurQ9iN/XRNmjqvQHb/McR+98NRvgg
 CAy0v0ZMIRmOb5WWWnMTcCAahRUnsQ5sKWAPh5YXQxrmj973uBkA57s59gxZq4FXo+oBP/WmOreIj
 Nh5YgNDg==;
Received: from mail-oo1-f43.google.com ([209.85.161.43])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUvp7-004j7q-Jo; Fri, 09 Apr 2021 18:25:43 +0000
Received: by mail-oo1-f43.google.com with SMTP id
 i20-20020a4a8d940000b02901bc71746525so1551249ook.2; 
 Fri, 09 Apr 2021 11:25:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ap1xXHQrgNoanoCkiwbFpBXllDQp2mXH4gtHCARaL4U=;
 b=IaPUUP8uuSApp84aRLKEyFmYOA3iewbtjsqwvcC7UQ7KrROVX7/sjOicYZpg6tUmNU
 E9Phyw0H7NmMxXjf35+KeuS3QmwOf1dnLMhrHY84nYY4rXfquyPK9/Qw1MHKetYQnu1F
 5xbJIZcvg1DGGQ6nm5CeqhT6VnzQ4eEeXeQW/9S5OCZrGD3nGm4y1mOr9h0uGTwAMg7F
 vFioavJh6oenMjBrI66wNjvmOPA6Ej46Oi6NKgKH2iKdph7pgSjdn4rLEvFzsS32syVt
 fjXJUbbz7sG9ZwVe3ym9W7LnRhk6gLgToNfUHMsURY70WrNuBrz/Y6zT7fK1ZzH8d1pv
 ysJw==
X-Gm-Message-State: AOAM532Nl8P8fzWOwBPjtD4ypaQk2EeuRnB4sh98hS/TgwpBrC/qYjDY
 jhUWLbb5HlU1QeXyyfxubA==
X-Google-Smtp-Source: ABdhPJweHT9wHvpbXVWmGxFX9Ck28qRM1eahscjqOn+iYGqcvUYN7gC7q4C72Axnzp84rzKTMQTdEQ==
X-Received: by 2002:a05:6820:60e:: with SMTP id
 e14mr12869794oow.67.1617992740263; 
 Fri, 09 Apr 2021 11:25:40 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id 88sm745559ota.11.2021.04.09.11.25.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Apr 2021 11:25:39 -0700 (PDT)
Received: (nullmailer pid 3916170 invoked by uid 1000);
 Fri, 09 Apr 2021 18:25:38 -0000
Date: Fri, 9 Apr 2021 13:25:38 -0500
From: Rob Herring <robh@kernel.org>
To: Flora Fu <flora.fu@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Pi-Cheng Chen <pi-cheng.chen@mediatek.com>,
 Chiawen Lee <chiawen.lee@mediatek.com>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH 4/8] dt-bindings: arm: mediatek: Add new document
 bindings for APU
Message-ID: <20210409182538.GA3913794@robh.at.kernel.org>
References: <1617766086-5502-1-git-send-email-flora.fu@mediatek.com>
 <1617766086-5502-5-git-send-email-flora.fu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1617766086-5502-5-git-send-email-flora.fu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210409_112541_675930_F74DBCFE 
X-CRM114-Status: GOOD (  17.98  )
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

On Wed, Apr 07, 2021 at 11:28:02AM +0800, Flora Fu wrote:
> Document the apusys bindings.
> 
> Signed-off-by: Flora Fu <flora.fu@mediatek.com>
> ---
>  .../arm/mediatek/mediatek,apusys.yaml         | 56 +++++++++++++++++++
>  1 file changed, 56 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,apusys.yaml
> 
> diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,apusys.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,apusys.yaml
> new file mode 100644
> index 000000000000..dc04a46f1bad
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,apusys.yaml
> @@ -0,0 +1,56 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/arm/mediatek/mediatek,apusys.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek APUSYS Controller
> +
> +maintainers:
> +  - Flora Fu <flora.fu@mediatek.com>
> +
> +description:
> +  The Mediatek apusys controller provides functional configurations and clocks
> +  to the system.
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - mediatek,mt8192-apu_mbox
> +          - mediatek,mt8192-apu_conn
> +          - mediatek,mt8192-apu_vcore

s/_/-/

> +      - const: syscon
> +
> +  reg:
> +    maxItems: 1
> +
> +  '#clock-cells':
> +    const: 1
> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    apu_mbox: apu_mbox@19000000 {

mailbox@...? Is this a mailbox provider?

> +        compatible = "mediatek,mt8192-apu_mbox", "syscon";
> +        reg = <0x19000000 0x1000>;
> +    };
> +
> +  - |
> +    apu_conn: apu_conn@19020000 {
> +        compatible = "mediatek,mt8192-apu_conn", "syscon";
> +        reg = <0x19020000 0x1000>;
> +        #clock-cells = <1>;
> +    };
> +
> +  - |
> +    apu_vcore: apu_vcore@19029000 {
> +        compatible = "mediatek,mt8192-apu_vcore", "syscon";
> +        reg = <0x19029000 0x1000>;
> +        #clock-cells = <1>;
> +    };
> -- 
> 2.18.0
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
