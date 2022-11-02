Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF980C433FE
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Nov 2022 17:08:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8IPGxGLkD8As1GeJY5oeoH1phDYt4Av4JKr4840Jm8Y=; b=tvfs9qLH9GV6KZOIOAIHZljWGM
	Pd1Z9y/kJLgYbfit4u3G97HKRzgfKfjESPBR8JsCPTHi6nd4BBs/iLbuENld6/KAh1tVwraq8ff6/
	qj6Wy3KoqeZPSxyQAMH1zR3h823HvBsPAGw7HbF+QmbDv7LuuMMX6py38SgyvYNgS+a9/1wMhIy8C
	duRNu3C4rH8E9vbv3ssL/Q7OMLCbykcPHr6LvKF0sX5EVDNU2XUBjRbElN27phvud00MNElbQn56q
	lAmAgdMFoQ4N4W6gk9t0M6/yffOKdhBfExqV26IgDKVgCuopXoNw2dw68ILxTXtkgS7r4wJAvMb20
	UXtb5i0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqHE1-00CNIP-1f; Wed, 02 Nov 2022 17:08:25 +0000
Received: from mail-oi1-f173.google.com ([209.85.167.173])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqGjk-00CBlL-RE; Wed, 02 Nov 2022 16:37:10 +0000
Received: by mail-oi1-f173.google.com with SMTP id c129so7943368oia.0;
        Wed, 02 Nov 2022 09:37:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8IPGxGLkD8As1GeJY5oeoH1phDYt4Av4JKr4840Jm8Y=;
        b=GxZR0DFWCxChBNi2MSOlduDwTK65ER3uamiJekW5fTenu42Ivkqze6/5DpA3hwDU0f
         FdPJ6atBjY0qF47jvVDOoaOFap5Crf0QwfSFo5C4fu2aPx/GpbL6KwXTy3NcRz7RA0ij
         RM5miCo87m7SIOaaan755y4JvOZc0FgoPH/m0ar1IJtrtR85vT7C0Pu2RUIKAyZtX1Qf
         HM0eM1cAkv+GNPKJ9zaS7N+gYJWApNV0nNhW6hzcTehV2a/574kmA376zGyGr7USlBBm
         VDWJYP9LNramVaKwX00lM3DceAl4vAdcd1V/tpizrNg8644JF93Yx0bMvaZVZXqpha2T
         wXQA==
X-Gm-Message-State: ACrzQf1KXfxUmnzR0c2u3r3NFbbnXK92TOViQ7OsiKqa01B/To5VOiIe
	c8g1DvaGIDoT2tjCuOP4PQ==
X-Google-Smtp-Source: AMsMyM6PfkexEnFF5ueqQBi7Z38vRQ66nOVbGxRwh7cGgAQdHJAYlhuoFPMkoiRF/71lDerNONVVNw==
X-Received: by 2002:a05:6808:118c:b0:34f:9fc9:ce15 with SMTP id j12-20020a056808118c00b0034f9fc9ce15mr5868351oil.220.1667407025923;
        Wed, 02 Nov 2022 09:37:05 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id n1-20020a4ad401000000b00425806a20f5sm4603995oos.3.2022.11.02.09.37.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Nov 2022 09:37:05 -0700 (PDT)
Received: (nullmailer pid 4012210 invoked by uid 1000);
	Wed, 02 Nov 2022 16:37:07 -0000
Date: Wed, 2 Nov 2022 11:37:07 -0500
From: Rob Herring <robh@kernel.org>
To: Daniel Golle <daniel@makrotopia.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Amit Kucheria <amitk@kernel.org>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org, Daniel Lezcano <daniel.lezcano@linaro.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, linux-pm@vger.kernel.or, linux-arm-kernel@lists.infradead.org, Zhang Rui <rui.zhang@intel.com>
Subject: Re: [PATCH 2/2] dt-bindings: thermal: mediatek: add compatible
 string for MT7986 SoC
Message-ID: <166740702669.4012151.14909545026991021834.robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Bad-Reply: 'Re:' in Subject but no References or In-Reply-To headers
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221102_093708_898046_B78B887F 
X-CRM114-Status: GOOD (  10.50  )
X-Mailman-Approved-At: Wed, 02 Nov 2022 10:08:23 -0700
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


On Mon, 31 Oct 2022 22:16:53 +0000, Daniel Golle wrote:
> Add compatible string 'mediatek,mt7986-thermal' for V3 thermal unit
> found in MT7981 and MT7986 SoCs.
> 
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> ---
>  Documentation/devicetree/bindings/thermal/mediatek-thermal.txt | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

