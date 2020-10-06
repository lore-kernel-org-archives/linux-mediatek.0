Return-Path: <SRS0=UyV0=DN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47394C4363D
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Oct 2020 20:44:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CC08620866
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Oct 2020 20:44:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tUnTcA3A"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CC08620866
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=qBIYDzcqbB+CXAJug4WxcL1Sr4yHRproqPzq1yDAGIQ=; b=tUnTcA3AvCfCQcowAvgggGhpX
	sM7AUvDr7ay4o1AGaG5grT0hm7tbHIpP756tr7oVGzmaMHJ0r++TiEQL60F9zbXDZAzK6+3UQWPP8
	pzlXIRNFUC656SUbT2nE8rBlo5iqT27gwhiYUQg0U+S1Zk/V13imR8quk+mBrl0+BScAh7fKVZOGf
	kIBrvNHY0XCWdyZI3NE238iMhhlDd4yKqkrhNEbliLBRK/X5cZku4/4vML4LKSnkUecQa+LgnbJji
	6yhNL2VK4V+P6dBFMbfE5NF8xKDsqAR0mFD8MTtpv/0linZcTVI5L54+87t90DsiamGTF/xkJlqLE
	71Tt7ScyQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kPtoO-0001Xn-4K; Tue, 06 Oct 2020 20:43:52 +0000
Received: from mail-ot1-f68.google.com ([209.85.210.68])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kPtoK-0001Wo-8g; Tue, 06 Oct 2020 20:43:49 +0000
Received: by mail-ot1-f68.google.com with SMTP id 60so115749otw.3;
 Tue, 06 Oct 2020 13:43:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=4LMhyTOT+VAAaRU5CJODNmpQONO/RSgV3tZAx3nzv1s=;
 b=Ux6+dYl7HBaKSSTbD98iXfw7nnJlOY+IEITuwQpKXcgsWMw61V5HR57vHqOxxf0W4G
 KVyPIR6Oi/fRInQDvwaBgrzs0lmTt/3UIUkOf/a0UeKA2orwYCpaVFSDICrHVzoxQLYc
 yIKFiQK2hiTIGpr/iILck4gG9Z1vEzQwdTOS8iZBxfqWqOlg0KYDnrMnAe4IHg0rebN6
 3mc82vyS4w16QpSp9flWYEhZQrD3UcRjfASpzeqhlLf5lvmGxG01GxMoYHAzQqGVCs5x
 vPETpHyy80lnlbRo9s1YevT8eZeKA8t/tz5uHUpY3gxtmDQSoTb3hkwByqXRKoIew5Jf
 4KWw==
X-Gm-Message-State: AOAM5318H0+Eki/0llM2jrsU5hKr6z0w7aAjUA1egQjGRIdrwWln2n9I
 OjwDY7VvJd3X+ZGxglBv/6kcuUNoYgUX
X-Google-Smtp-Source: ABdhPJxcFTHl/Zxl9qzw0vdVU0w3yDGzsHIJvGPcCAWCrYTm8MbmtyeEQMqz1oTH2yBnSUGZBdrqmA==
X-Received: by 2002:a05:6830:1be2:: with SMTP id
 k2mr675329otb.70.1602017026150; 
 Tue, 06 Oct 2020 13:43:46 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id o205sm1822353oig.8.2020.10.06.13.43.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Oct 2020 13:43:45 -0700 (PDT)
Received: (nullmailer pid 2804669 invoked by uid 1000);
 Tue, 06 Oct 2020 20:43:44 -0000
Date: Tue, 6 Oct 2020 15:43:44 -0500
From: Rob Herring <robh@kernel.org>
To: Jiaxin Yu <jiaxin.yu@mediatek.com>
Subject: Re: [PATCH 5/5] dt-bindings: mediatek: mt8192: add
 mt8192-mt6358-rt1015-rt5682 document
Message-ID: <20201006204344.GA2791644@bogus>
References: <1601624142-18991-1-git-send-email-jiaxin.yu@mediatek.com>
 <1601624142-18991-6-git-send-email-jiaxin.yu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1601624142-18991-6-git-send-email-jiaxin.yu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201006_164348_330456_A9BAD4A9 
X-CRM114-Status: GOOD (  19.48  )
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 kuninori.morimoto.gx@renesas.com, shane.chien@mediatek.com, tiwai@suse.com,
 maowenan@huawei.com, tzungbi@google.com, broonie@kernel.org,
 linux-mediatek@lists.infradead.org, p.zabel@pengutronix.de,
 matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Oct 02, 2020 at 03:35:42PM +0800, Jiaxin Yu wrote:
> This patch adds document for the machine board with mt6358, rt1015 and rt5682.
> 
> Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>
> ---
>  .../sound/mt8192-mt6359-rt1015-rt5682.yaml    | 44 +++++++++++++++++++
>  1 file changed, 44 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/mt8192-mt6359-rt1015-rt5682.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/mt8192-mt6359-rt1015-rt5682.yaml b/Documentation/devicetree/bindings/sound/mt8192-mt6359-rt1015-rt5682.yaml
> new file mode 100644
> index 0000000000000..dff5004cd0368
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/mt8192-mt6359-rt1015-rt5682.yaml
> @@ -0,0 +1,44 @@
> +# SPDX-License-Identifier: GPL-2.0

Dual license new bindings:

(GPL-2.0-only OR BSD-2-Clause)

> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/mt8192-mt6359-rt1015-rt5682.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Mediatek MT8192 with MT6359, RT1015 and RT5682 ASoC sound card driver
> +
> +maintainers:
> +   - Jiaxin Yu <jiaxin.yu@mediatek.com>
> +   - Shane Chien <shane.chien@mediatek.com>
> +
> +description:
> +  This binding describes the MT8192 sound card.
> +
> +properties:
> +  compatible:
> +    contains:

Drop this. Other strings shouldn't be allowed.

> +      const: mediatek,mt8192_mt6359_rt1015_rt5682

Just a list of part numbers? A different codec would be a different 
compatible and driver? You should have a link to the codec and you can 
read it's compatible to get what codec you have.

> +
> +  mediatek,platform:
> +    $ref: "/schemas/types.yaml#/definitions/phandle"
> +    description: |
> +     The DT/OF node which is used to specify the link's platform driver.

What's "link's platform driver"? A DT doesn't have drivers.

> +
> +additionalProperties: false
> +
> +required:
> +  - compatible
> +  - mediatek,platform
> +
> +examples:
> +  - |
> +
> +    sound: mt8192-sound {
> +        compatible = "mediatek,mt8192-mt6359-rt1015-rt5682";
> +        mediatek,platform = <&afe>;
> +        pinctrl-names = "aud_clk_mosi_off",
> +                        "aud_clk_mosi_on";
> +        pinctrl-0 = <&aud_clk_mosi_off>;
> +        pinctrl-1 = <&aud_clk_mosi_on>;
> +    };
> +
> +...
> -- 
> 2.18.0

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
