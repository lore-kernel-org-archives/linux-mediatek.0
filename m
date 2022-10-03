Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E1AAC433F5
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Oct 2022 15:38:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o9tyAHoFBze0gmpWGtkgp3sleUFke7gglXwwNjWc4ys=; b=URNFOPk3dxOiC6btME9yJx46VC
	zDwfcGgPs2cpnTIznVtEoiHH74cNek1IYxYrnutD/s24DyJ2aJKmPzktV3cJPGhrr+n+vGwfLIify
	U6WZWB3OJPu4tCNETmfXnDZ6Wvkn3YrBOGGPM2ZaKTYlVQoswBEn1g+iouauK7MqtHVWdGFStY9oa
	7BrIbT0Qf97zS6i4tgTG1AmDV4z2cEOH3P3UaU5EovmHAxsdjj4ttJ0vYny0QAgnihe5qFr4bU76x
	XGb65B32jPGm8OyBgXYQhw/9nB3wBSGuFIA8VoqSRpPZI09HXJloTEkaP+SJfkhkIWwr2G+vdr4dA
	6zinucjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofNWW-006VW8-7C; Mon, 03 Oct 2022 15:38:28 +0000
Received: from mail-oa1-f51.google.com ([209.85.160.51])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofNWR-006VTT-Vv; Mon, 03 Oct 2022 15:38:25 +0000
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-131ea99262dso11102495fac.9;
        Mon, 03 Oct 2022 08:38:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=o9tyAHoFBze0gmpWGtkgp3sleUFke7gglXwwNjWc4ys=;
        b=KLhfAMcUtZi8dWaKOnOUMMvIK+rKjMxRvN59zVVDSKb85uk5msFC0bM4w5G6pNoN4G
         xgDxpVZ2EzJDpZ2ZvkI8avnxUQcfa48eV47AlKaDxDIUayzaYTlnbuUvLsFgxJg46Csr
         IfGvqQ1hLLfnN2DsL+vtMvsYIYIWXMwLjLm1CFyphClpZbLrFzAMMziPf2Q+6fozJzR3
         ubrnxLyY9jWRvYgZgV8vuskRiJyuQYfpwoU8fMVY4vWvU38sG0EO1pwH0HFnZr7dnl4G
         YYUDZynm5dtfu65uOLmwpC7oBPVQPFjGSp+sm4W16/hmhdDB9ltcX+Vf/u4Lb34E2b9P
         fZ6A==
X-Gm-Message-State: ACrzQf3VWK6m22JDxO0yeQQCGD3Qida/k7PKvRHwIwcFquyH4WdrMfWf
	JnvHA8cxFSVJZ4uCSyN0Pw==
X-Google-Smtp-Source: AMsMyM5d5oI/HLMxN/5cSyd7PwbMiup/QxvlbuLeXMrnykgKhb+jP1zkorMQuhf3++sio6mLpTRRIQ==
X-Received: by 2002:a05:6870:178e:b0:126:7055:fc78 with SMTP id r14-20020a056870178e00b001267055fc78mr5805562oae.58.1664811500401;
        Mon, 03 Oct 2022 08:38:20 -0700 (PDT)
Received: from macbook.herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id z33-20020a9d24a4000000b0063695ad0cbesm2411586ota.66.2022.10.03.08.38.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Oct 2022 08:38:20 -0700 (PDT)
Received: (nullmailer pid 2350958 invoked by uid 1000);
	Mon, 03 Oct 2022 15:38:19 -0000
Date: Mon, 3 Oct 2022 10:38:19 -0500
From: Rob Herring <robh@kernel.org>
To: ChiaEn Wu <peterwu.pub@gmail.com>
Cc: matthias.bgg@gmail.com, andriy.shevchenko@linux.intel.com, alice_chen@richtek.com, linux-kernel@vger.kernel.org, szunichen@gmail.com, krzysztof.kozlowski+dt@linaro.org, linux-leds@vger.kernel.org, linux-iio@vger.kernel.org, chiaen_wu@richtek.com, devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org, lars@metafoo.de, jic23@kernel.org, cy_huang@richtek.com, pavel@ucw.cz, linux-arm-kernel@lists.infradead.org, robh+dt@kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v12 2/5] dt-bindings: leds: Add MediaTek MT6370 flashlight
Message-ID: <166480917702.2250974.12439864185418442009.robh@kernel.org>
References: <cover.1663926551.git.chiaen_wu@richtek.com>
 <5632ef04d7807f78259e4e9f3d952849a839a50c.1663926551.git.chiaen_wu@richtek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5632ef04d7807f78259e4e9f3d952849a839a50c.1663926551.git.chiaen_wu@richtek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221003_083824_061270_2FE23E2C 
X-CRM114-Status: GOOD (  10.70  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, 23 Sep 2022 10:51:23 +0800, ChiaEn Wu wrote:
> From: Alice Chen <alice_chen@richtek.com>
> 
> Add MediaTek MT6370 flashlight binding documentation.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Alice Chen <alice_chen@richtek.com>
> Signed-off-by: ChiaEn Wu <chiaen_wu@richtek.com>
> ---
>  .../bindings/leds/mediatek,mt6370-flashlight.yaml  | 41 ++++++++++++++++++++++
>  1 file changed, 41 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/mediatek,mt6370-flashlight.yaml
> 

Applied patches 1 and 2 as the MFD binding depends on these.

However, these introduce warnings in the example, so please get those 
fixed.

Rob

