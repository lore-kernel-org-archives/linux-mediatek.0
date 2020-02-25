Return-Path: <SRS0=J0Vt=4N=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E5FAC35E0C
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Feb 2020 17:16:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E660E20732
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Feb 2020 17:16:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nm5l6c8q"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E660E20732
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a1AaYgjvmtA+sR4YaFEPwbR6AB9r73R8mekrxeeunso=; b=nm5l6c8qOXxd6V
	2QzDO4Uvv/udQJePt8BTXhCKNZ3MjlJ8j9mr+xgnyj6urjWlVFthNFwlyndViUqHeyR9KsJ2Poswk
	RXT2bHL108sEMGmDjYh7eCT+lmk5TxaNA9nQZAIXA7WIAlP1mQnknHfvxudl2AeHGakY+DSj/Gruk
	L/aTY2hgmFSEoxefheFTw05twSNVWE1UuCSPoSlgseNE9wotf2aSy2u4vr3F80E7Ave2/6Fyqo1jQ
	cZmpOIo1WMsUdSInyrk5k5AcRSRH0kCdbgH+la6bP/sP+RuppzXHduRV5jyPCNyrLIoUjcjBwZAPx
	ntkSBZ+1jnmSFH5EgUGw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j6don-0000WO-Gj; Tue, 25 Feb 2020 17:16:25 +0000
Received: from mail-ot1-f66.google.com ([209.85.210.66])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j6doe-0000NR-N8; Tue, 25 Feb 2020 17:16:18 +0000
Received: by mail-ot1-f66.google.com with SMTP id b3so236950otp.4;
 Tue, 25 Feb 2020 09:16:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=OE6eipVQm4bME6AE3KlIKW+8PF5MdzZLKNm5AdRaXEo=;
 b=JpqLcTAor5LzQBOAjnQ+g74YI6iO46K7ghHm7X6dZ6pRLFQzN3P1THTQVAKvxW+Gy5
 J19LRLey5izs/8rAO+CzUL7xaH/YdHVSsJ9mEgXJfgDfWJpmXsFimGzXIbCgi8BfRb57
 zIumxx+gLsxTnlhR3bEOI+ROWxdq8Fee9KooGKz69kiMRu+ff0WvBxwIgkacauEukAJn
 FpDrPRPT/EaOC2EuKUemPzKShjGfxxEz/ePxPBvWGpHXOUyD0E4pmeLUrjTGqGEPzvpM
 eUdpGYvbYpqLiTsBq5bExHpbxwYR+LNuz7EPa2wYHAHatBFfD5FQ+itLTjrg8ijLzB/4
 EMUw==
X-Gm-Message-State: APjAAAWP3HQBu0cJlNVBOcvZyVUs0zgpPVbd6BUFK34kqpquUIFwk9T0
 RysawpJtjN11aA2fKUxvAQ==
X-Google-Smtp-Source: APXvYqwU0mKHqcSecaw+GXPaK947LH2SDNl/9+T8PUAMCjq938LQ4s7sM8N5fIiMZJA8eWGLsGru4g==
X-Received: by 2002:a9d:760d:: with SMTP id k13mr43428788otl.42.1582650975368; 
 Tue, 25 Feb 2020 09:16:15 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id t21sm5863311otr.42.2020.02.25.09.16.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Feb 2020 09:16:14 -0800 (PST)
Received: (nullmailer pid 13718 invoked by uid 1000);
 Tue, 25 Feb 2020 17:16:13 -0000
Date: Tue, 25 Feb 2020 11:16:13 -0600
From: Rob Herring <robh@kernel.org>
To: Nicolas Boichat <drinkcat@chromium.org>
Subject: Re: [PATCH v4 1/7] dt-bindings: gpu: mali-bifrost: Add Mediatek MT8183
Message-ID: <20200225171613.GA7063@bogus>
References: <20200207052627.130118-1-drinkcat@chromium.org>
 <20200207052627.130118-2-drinkcat@chromium.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200207052627.130118-2-drinkcat@chromium.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200225_091616_753685_886400E8 
X-CRM114-Status: GOOD (  14.25  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 ulf.hansson@linaro.org, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>, dri-devel@lists.freedesktop.org,
 Steven Price <steven.price@arm.com>, Mark Brown <broonie@kernel.org>,
 linux-mediatek@lists.infradead.org,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Daniel Vetter <daniel@ffwll.ch>, hsinyi@chromium.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Feb 07, 2020 at 01:26:21PM +0800, Nicolas Boichat wrote:
> Define a compatible string for the Mali Bifrost GPU found in
> Mediatek's MT8183 SoCs.
> 
> Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>
> Reviewed-by: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
> ---
> 
> v4:
>  - Add power-domain-names description
>    (kept Alyssa's reviewed-by as the change is minor)
> v3:
>  - No change
> 
>  .../bindings/gpu/arm,mali-bifrost.yaml        | 25 +++++++++++++++++++
>  1 file changed, 25 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
> index 4ea6a8789699709..0d93b3981445977 100644
> --- a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
> +++ b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
> @@ -17,6 +17,7 @@ properties:
>      items:
>        - enum:
>            - amlogic,meson-g12a-mali
> +          - mediatek,mt8183-mali
>            - realtek,rtd1619-mali
>            - rockchip,px30-mali
>        - const: arm,mali-bifrost # Mali Bifrost GPU model/revision is fully discoverable
> @@ -62,6 +63,30 @@ allOf:
>            minItems: 2
>        required:
>          - resets
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: mediatek,mt8183-mali
> +    then:
> +      properties:
> +        sram-supply: true
> +        power-domains:
> +          description:
> +            List of phandle and PM domain specifier as documented in
> +            Documentation/devicetree/bindings/power/power_domain.txt
> +          minItems: 3
> +          maxItems: 3
> +        power-domain-names:
> +          items:
> +            - const: core0
> +            - const: core1
> +            - const: 2d

AFAIK, there's no '2d' block in bifrost GPUs. A power domain for each 
core group is correct though.

Rob

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
