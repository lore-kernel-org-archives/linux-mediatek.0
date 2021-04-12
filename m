Return-Path: <SRS0=8MWw=JJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89B56C433B4
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Apr 2021 13:20:58 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3A3286128C
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Apr 2021 13:20:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3A3286128C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:References:In-Reply-To:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vW+gg/cZbGGghIjtyBKKj8q+TiE7+ki/4yWArv/gQpM=; b=ElcwfJhmeTp4vO6pmPWWb5h9hM
	Hk25W5emUzl9+kwOdyXduX9VANYs86lQfemxOEhdM5RZK4fZ0T6Eb4BC/cxfRz4TuBJArjW40RhKv
	/ucOX39dL24xe16kCwV08NondWjVMWwH8HhIuGdwIrIPFsj11kNs8uc2PUo7aU+Jm409C2GTSILRe
	SjyZ9aOx1Gf0oqNKVb45NszoitebH47x3FtxGWGse9ZRQNDu7E+ocidcgFRcetLmGJum1cDVWa1Vf
	zgDfgXI7OhXv9FCo7R6+UAYCyQ/u1AGdvvtUsKvtdBIhN7FaUEkSw65+/HAC9jTPP2cVLgaSv1xUZ
	Wl0M7hyg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lVwUi-006otC-IS; Mon, 12 Apr 2021 13:20:48 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVwU6-006ocQ-6Z; Mon, 12 Apr 2021 13:20:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Message-Id:Date:Subject:References:
 In-Reply-To:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=hzHfZu8e65Sn1btLVYGzu7cBqxLKTQVgEFz+j4avFdk=; b=g2sRH9ihjehBHBOtQnBGaLve/c
 7dnwZhddunYx/6aZRnwWMwMXgoDjFHoueNpT1QguujQ9Pwxq6qNnY5Sfj8tFeoeOtBtpmc/w2kwDC
 6abIAGnV4NugUZ8VB3pwQxewklZ1uI501hEoWcX04l325E7+1vYyK07vdDIxyh+XCCB3BbVRoNi+8
 VUw5WVG5Enor/D9ZGpgdw7AaCZ0y3IfnZsS+LibzRwNnRqO5aNt6tRTiEChobKcJsirLvPhYON0pH
 WgazYqnA4UNs92x4mZIFdFq5bpOuTIe3c4tyDJP8CPvwxVUFt6qfwJYYKLeaL5vJQa+Yyrkl1Uh9D
 KdzOJUQw==;
Received: from mail-oi1-f180.google.com ([209.85.167.180])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVwU3-006GAN-Gr; Mon, 12 Apr 2021 13:20:09 +0000
Received: by mail-oi1-f180.google.com with SMTP id c16so13397998oib.3;
 Mon, 12 Apr 2021 06:20:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=hzHfZu8e65Sn1btLVYGzu7cBqxLKTQVgEFz+j4avFdk=;
 b=Ieq+Y6RgXTZq+1HSuj8mXix6Gv31d8gkblkVinM9Fv3faKiWrMzYcMYxuXzIEKLsjM
 aw0WykjKyiCmPUFAJOe88OWFx788EK2zaD6RYS/Rf8AzIBIrQkaIS6a4lNUejTDahEOx
 sWsooFJI5NJnvEooz+Menyv9aKpLyYZKlt9G2CjLXtNAi6s+mo4gZt8fylEOBKfZPkou
 M0z5fNKkC8MK2E06aRbxz8SvadOO/0wAJ5tFA49lgDObiastx+3vObrThd5Z/v6gyMyE
 Fqbbi4SA+KB1PnYw6Z5Vvv7h+Ot/KPkmKMmAV+JEKWhOmhfHqWCkOEYn5IlIILbI2BOa
 8CAg==
X-Gm-Message-State: AOAM5304qyD5ce+hwsNr/E+3KmKhbs9bCpoFzVG+cAnpORLrQlUCSzrZ
 cz3a2yjEg0FX8bRdI2iHbg==
X-Google-Smtp-Source: ABdhPJyvWr8wbNAJq9fl9Tt+VaEYca5cgXsgpQzh5o8vHIS3waTqr6/xnHfjZAEI2jymUcrCseE9eA==
X-Received: by 2002:aca:c34d:: with SMTP id t74mr20271983oif.131.1618233606225; 
 Mon, 12 Apr 2021 06:20:06 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id t14sm2634140otj.50.2021.04.12.06.20.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Apr 2021 06:20:05 -0700 (PDT)
Received: (nullmailer pid 3757974 invoked by uid 1000);
 Mon, 12 Apr 2021 13:20:00 -0000
From: Rob Herring <robh@kernel.org>
To: Zhiyong Tao <zhiyong.tao@mediatek.com>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 robh+dt@kernel.org, srv_heupstream@mediatek.com,
 linux-mediatek@lists.infradead.org, hongzhou.yang@mediatek.com,
 seiya.wang@mediatek.com, sj.huang@mediatek.com, jg_poxu@mediatek.com,
 sean.wang@mediatek.com, mark.rutland@arm.com, eddie.huang@mediatek.com,
 sean.wang@kernel.org, biao.huang@mediatek.com, linus.walleij@linaro.org,
 matthias.bgg@gmail.com, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, hui.liu@mediatek.com, erin.lo@mediatek.com
In-Reply-To: <20210411092659.22838-2-zhiyong.tao@mediatek.com>
References: <20210411092659.22838-1-zhiyong.tao@mediatek.com>
 <20210411092659.22838-2-zhiyong.tao@mediatek.com>
Subject: Re: [PATCH v3 1/5] dt-bindings: pinctrl: mt8195: add pinctrl file and
 binding document
Date: Mon, 12 Apr 2021 08:20:00 -0500
Message-Id: <1618233600.191242.3757973.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210412_062007_576216_8A170CFD 
X-CRM114-Status: GOOD (  12.13  )
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

On Sun, 11 Apr 2021 17:26:55 +0800, Zhiyong Tao wrote:
> 1. This patch adds pinctrl file for mt8195.
> 2. This patch adds mt8195 compatible node in binding document.
> 
> Signed-off-by: Zhiyong Tao <zhiyong.tao@mediatek.com>
> ---
>  .../bindings/pinctrl/pinctrl-mt8195.yaml      | 152 +++
>  include/dt-bindings/pinctrl/mt8195-pinfunc.h  | 962 ++++++++++++++++++
>  2 files changed, 1114 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/pinctrl-mt8195.yaml
>  create mode 100644 include/dt-bindings/pinctrl/mt8195-pinfunc.h
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8195.example.dt.yaml: pinctrl@10005000: reg: [[268455936, 4096], [298909696, 4096], [299040768, 4096], [299106304, 4096], [300023808, 4096], [300023808, 4096], [300613632, 4096], [301203456, 4096], [268480512, 4096]] is too long
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8195.yaml

See https://patchwork.ozlabs.org/patch/1464777

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
