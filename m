Return-Path: <SRS0=tzuU=55=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44044C2BA2B
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Apr 2020 17:14:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1B4DA20578
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Apr 2020 17:14:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="otJgXF+7";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OZf3KhdY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1B4DA20578
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rgRMUJxoUi8a5zbCrgVpC8x5NFpekZlnl55TEI2dmZs=; b=otJgXF+7RWxARd
	YPLZBIDijesms7aaalGRuiHY1OMkJPdaxyUwjcX777ndeSaFCFLHrgC0uiBZOSUZI1A+IX1o32wRL
	FHnmCLu9Cx8QB3XkNH1a4NlkHqYYMPysB4815oWaw9ZWlh4cuSBuAGvX3NxU/Z9xrAMUtPngI7M35
	QPX1D3qwijUFqgkyaetDB1koWoQRTyBR16ZBJcQMTzKkYx2iXl1afMj6ukycVDWOpN7VaA7j6b8iI
	2aduI4tKVzNmtd9u1ZCZluEljrl/q4e6YEdzvxIC9DttVHFKEzfbcSFZ1gwuJcG2cSRweoJCvXYO3
	Xx6s+ceP+9EZiX3Pz3Gg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jO2fL-0000Cs-8m; Mon, 13 Apr 2020 17:14:35 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jO2fB-0008UB-16; Mon, 13 Apr 2020 17:14:26 +0000
Received: by mail-wr1-x442.google.com with SMTP id h9so10914709wrc.8;
 Mon, 13 Apr 2020 10:14:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=NCloB/ogzJdXAIh9tkhxO1+IyWpGxa0FMmYj1590ZJk=;
 b=OZf3KhdYgA5GM+fEitWdpnlSiJ2vDS8L0Y4nBAvQ6ZFEQotkmBnNIAJzs5WOYVseB7
 lRMP7tSBp0lZQfq3TKTCL9m9rCKt9HyT3bJJeCQ0qiOfFsCVRCzaTEZ3f/6h9Sf+SZE4
 vtw3h2bcuu/VGEbUDMNlgL0K5ofgF10NmP7ztEkJYHzvh1CmAIAi/ldnFNTkw0dV+Kdv
 5UZqpXOpO/zzCxYlN2+Sr/segF/fjjkmoib0/E3dnHSI0SsYSwdPRQ4tD3giOg2d6hje
 co9onkLfZ0gOmn9hS/e2s/7g56V43MDpPhDwtP/tEEBe1rNR/dC9brfGpcjyVsUSbDXE
 cc8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=NCloB/ogzJdXAIh9tkhxO1+IyWpGxa0FMmYj1590ZJk=;
 b=CqDh5TQ95ECV2R3LaKTVO1XSPgyg1KcWCjRCmiKTJlOHY0oek8z9L+DmoARUFvkXjI
 kZ2xQpXsZHrbSjstcuD68RDKTOwP7VdZ68h7dtXk04KCX+ivvtQV84/g169BXOG8Qc1M
 fVvrddNlgd6fgviG9qAYJs6bqSzCqVdpOWKtixRJEzNed7oYCEYZcYsHgH5CV4l2sfV6
 41YZXxY3+85uz3eMbWfLz3vE6HMZjRoQjabXar9Mc8dg8ncruh2tT9K+pPZty60vmot0
 aJslG9CAEfjM9XjJXGdBozHdZA0A5wDThHgwlGwVwY4qzK1cyJPRGLfguwrqUNi7egKK
 Kh3Q==
X-Gm-Message-State: AGi0PuaE/EYCvGrjd70c5cavfNT/sC/i68s8K+YwjuIf4LeWdSWWw963
 TDh75qG3EFvH2kNztUc5xj0=
X-Google-Smtp-Source: APiQypJNWzMbdOu+UjgqIt+HASwu4uE8Q9/xNGWNMGLnYPc83wWmOXZG4+pKQ8LwKjoAL1knRePmqA==
X-Received: by 2002:a5d:4012:: with SMTP id n18mr17131148wrp.387.1586798062068; 
 Mon, 13 Apr 2020 10:14:22 -0700 (PDT)
Received: from linux-gy6r.site ([213.195.113.243])
 by smtp.gmail.com with ESMTPSA id h17sm3957607wmm.6.2020.04.13.10.14.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Apr 2020 10:14:21 -0700 (PDT)
Subject: Re: [PATCH v7 1/5] dt-bindings: arm64: dts: mediatek: Add mt8173 elm
 and hana
To: Hsin-Yi Wang <hsinyi@chromium.org>, linux-arm-kernel@lists.infradead.org
References: <20200210063523.133333-1-hsinyi@chromium.org>
 <20200210063523.133333-2-hsinyi@chromium.org>
From: Matthias Brugger <matthias.bgg@gmail.com>
X-Pep-Version: 2.0
Message-ID: <ec131e02-1556-d986-3628-ab1e00060643@gmail.com>
Date: Mon, 13 Apr 2020 19:14:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200210063523.133333-2-hsinyi@chromium.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200413_101425_097592_645F1234 
X-CRM114-Status: GOOD (  14.23  )
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
 Nicolas Boichat <drinkcat@chromium.org>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 2/10/20 7:35 AM, Hsin-Yi Wang wrote:
> Elm is Acer Chromebook R13. Hana is Lenovo Chromebook. Both uses mt8173
> SoC.
> 
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> Reviewed-by: Rob Herring <robh@kernel.org>

Applied to v5.7-next/dts64

Thanks!

> ---
>  .../devicetree/bindings/arm/mediatek.yaml     | 22 +++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
> index 4043c5046441..abc544dde692 100644
> --- a/Documentation/devicetree/bindings/arm/mediatek.yaml
> +++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
> @@ -84,6 +84,28 @@ properties:
>            - enum:
>                - mediatek,mt8135-evbp1
>            - const: mediatek,mt8135
> +      - description: Google Elm (Acer Chromebook R13)
> +        items:
> +          - const: google,elm-rev8
> +          - const: google,elm-rev7
> +          - const: google,elm-rev6
> +          - const: google,elm-rev5
> +          - const: google,elm-rev4
> +          - const: google,elm-rev3
> +          - const: google,elm
> +          - const: mediatek,mt8173
> +      - description: Google Hana (Lenovo Chromebook N23 Yoga, C330, 300e,...)
> +        items:
> +          - const: google,hana-rev6
> +          - const: google,hana-rev5
> +          - const: google,hana-rev4
> +          - const: google,hana-rev3
> +          - const: google,hana
> +          - const: mediatek,mt8173
> +      - description: Google Hana rev7 (Poin2 Chromebook 11C)
> +        items:
> +          - const: google,hana-rev7
> +          - const: mediatek,mt8173
>        - items:
>            - enum:
>                - mediatek,mt8173-evb
> 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
