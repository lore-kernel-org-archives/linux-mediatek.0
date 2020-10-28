Return-Path: <SRS0=7lD3=ED=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71546C388F7
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Oct 2020 13:57:24 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ED7B524751
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Oct 2020 13:57:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bPBPNNXy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ED7B524751
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=VT9r/XDExk/53LgZwItOiM5m+6n272e+i7nDN/AWCJs=; b=bPBPNNXymM+HeJu+1EAitneEB
	J+mIc/votXRCg91McclEqgAGtCW6vQCNxoVpXgrnWgmWglgAsedrIdwdaw9gJXRz/kp7JWTWlmB4L
	hohR1E/L4Uk3vDhWwq9ZtAaqYdJUPDew4CaP5b4n+MTtPUIs8Aal/g9shY2I4EW+UEnIZ0Wlmv6t2
	BicapR6sqSyHI6LpnJxFC4m4tBCI/BXbTbdr/dsbWgGfPT1MKrHtFlarjjTWU3WN1nlhftoXwe9c4
	XxAiHDwp9gyT7eOhGlrDa3kZiobNviWfYrdAX6+zm4sW9TYGwFJJMASwme10z+Q56jlK3YSPclbFz
	kD7fCRD0Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kXlwx-0006Pr-Mk; Wed, 28 Oct 2020 13:57:15 +0000
Received: from mail-oi1-f194.google.com ([209.85.167.194])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kXlww-0006PN-Gv; Wed, 28 Oct 2020 13:57:15 +0000
Received: by mail-oi1-f194.google.com with SMTP id x1so5013234oic.13;
 Wed, 28 Oct 2020 06:57:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=U9xGcm8q97b1Pd4skv7mi7RHXIXoGHZIAAwtVH9gLfo=;
 b=a3zBq0e7Yrf81c+rm4bYe8ssWPhFKAUg7QXUbeMJtlYPGKl/Oc75Oqd2ukLY5pM9qX
 1Nm7WyFoSgb4daQB8IJWLjiIrkIuZoi4neaUTw11d/sMMC3a/gE7w5jPUVNza1tfmsHx
 FpJIkC4mSmIPFKdYA+91iLsac7ddhHG3JbXA4eUPxvUkHo4k/p8OZWIqSKBdWCnOJf/n
 r1WF7wiax1dyf0efeGqeEct0bAH1i3ukRxnSKdnK/UTW9uthmtkZQEtoRYbe2osSvoko
 xjvnY7YkwfW18Q7XUaBcq4q+JI/PjVMSLKRkHLQNXRn1Bj2uHSXSFymYjm/qQhz8Qg9p
 KJZg==
X-Gm-Message-State: AOAM532yoH12w5FFobEOf2i2OiLqRpWm9AHLxqqj9/kWB8RVAq9sfVES
 cQYSubvoBMIPfU9/M6mOYA==
X-Google-Smtp-Source: ABdhPJwsO6pD7ObQFTyD2GlTwW6QAtdf6KnbKuM1cAN1HFof/CWmTmFS6xuNbep2BF+NsIMok0JnGw==
X-Received: by 2002:a05:6808:57c:: with SMTP id
 j28mr5197913oig.63.1603893433383; 
 Wed, 28 Oct 2020 06:57:13 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id g3sm2760537oif.26.2020.10.28.06.57.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Oct 2020 06:57:12 -0700 (PDT)
Received: (nullmailer pid 3932609 invoked by uid 1000);
 Wed, 28 Oct 2020 13:57:11 -0000
Date: Wed, 28 Oct 2020 08:57:11 -0500
From: Rob Herring <robh@kernel.org>
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Subject: Re: [PATCH v3 01/16] dt-bindings: power: Add bindings for the
 Mediatek SCPSYS power domains controller
Message-ID: <20201028135711.GA3932108@bogus>
References: <20201026175526.2915399-1-enric.balletbo@collabora.com>
 <20201026175526.2915399-2-enric.balletbo@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201026175526.2915399-2-enric.balletbo@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201028_095714_586233_A8F0FD2A 
X-CRM114-Status: GOOD (  14.11  )
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
Cc: devicetree@vger.kernel.org, drinkcat@chromium.org, weiyi.lu@mediatek.com,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 fparent@baylibre.com, Matthias Brugger <mbrugger@suse.com>,
 linux-mediatek@lists.infradead.org, hsinyi@chromium.org,
 matthias.bgg@gmail.com, Collabora Kernel ML <kernel@collabora.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, 26 Oct 2020 18:55:10 +0100, Enric Balletbo i Serra wrote:
> The System Control Processor System (SCPSYS) has several power management
> related tasks in the system. Add the bindings to define the power
> domains for the SCPSYS power controller.
> 
> Co-developed-by: Matthias Brugger <mbrugger@suse.com>
> Signed-off-by: Matthias Brugger <mbrugger@suse.com>
> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> ---
> 
> Changes in v3:
> - Use hex for unit-addresses.
> - Define child nodes for nested power domains even are duplicated, but
>   more clear than adding a regex scaped to be a valid URI.
> 
> Changes in v2:
> - Use generic node names (power-domain).
> - Define valid values for common properties like #power-domain-cells.
> 
>  .../power/mediatek,power-controller.yaml      | 289 ++++++++++++++++++
>  1 file changed, 289 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
> 

With the indentation warnings fixed:

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
