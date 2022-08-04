Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2DCFC19F21
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Aug 2022 19:54:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c+lfeYbmQzrdXFvP7lcfdDn539L06Iv7kKvWbZznc3s=; b=NjYmAiuNAfq7qe+Ie5yLVZLlV7
	/smiMoAIg1Vx/++0zYDQvkeL2ordqgdbD5NwoSSOofn91aiAFAgYb4OYGwajEVOqH9kwa1orU3MTj
	YQ+1s7899Kvrq+r705mSilkVgzp+zq2HkFb78yCGxyCWU+IrrJGHG9XhFh2tQ2eUXdpxYIUeT3fq/
	jP4CQVx7nJ1bQYrhyUTe/sB6AYHgBM/T9DcuQz5PRlj5ZWMUMWHZwrOuz2fEF84XI9Coa4PVBZaMY
	210QIuohkHamCVoYT0kPEWg8/y1wLaR8WDwqsGEWvV2yHI3zm6TBS2ByHdNjo6mQ3k3FuOk8XI+8n
	K/jrLCew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJgvI-008k4X-NL; Thu, 04 Aug 2022 19:54:24 +0000
Received: from mail-il1-f181.google.com ([209.85.166.181])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJgrj-008iLo-3w; Thu, 04 Aug 2022 19:50:44 +0000
Received: by mail-il1-f181.google.com with SMTP id z6so422734iln.13;
        Thu, 04 Aug 2022 12:50:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=message-id:date:subject:references:in-reply-to:cc:to:from
         :x-gm-message-state:from:to:cc;
        bh=c+lfeYbmQzrdXFvP7lcfdDn539L06Iv7kKvWbZznc3s=;
        b=ruhlPPjtVVmuyOPZ2JT0WJq5I7JMQc3NVwv3boV6sQJth+o0OUvOkss3Hs1h9MpWPD
         G0Kl+/Qb59tjmXVrEiOhJdsYwyE4sRdthxryrtm9GP32c5klF6peJwgX6zcgnK5DpLEO
         2+6IyAqS/Q/MpdsIqOf38fVcc6HTfGW2B5Ru0HaMOYSnjnBq+wAhPZdsIK8Lj6xUBFas
         VsuxYaVP+WKC0nXSu7VUjwek56SrVOdS1ycItpz1sinW70IDdzDOMcN1Cy88n6xFFnPC
         PoErnZuZVWI+EeXy7NSGKxtsQD62QN3dvFhaERCExIwiPsrz+VT70vQgGpGlrPpVCJNh
         b5nQ==
X-Gm-Message-State: ACgBeo1f9VRySJOU0qmO7Nf4NjhT0ykHyJm2yJ9+ScGGRfUEKh3LuAQv
	kDTBpH//fOyaPMbEEV84LA==
X-Google-Smtp-Source: AA6agR7u0l38e/FffftiZmTXKP1m1dVqkPyS9dEXiBCiG5YDG9cwa+SHcna4Er/WhU6rDTuFL4nhSg==
X-Received: by 2002:a05:6e02:1c0a:b0:2de:87ff:18f2 with SMTP id l10-20020a056e021c0a00b002de87ff18f2mr1554084ilh.133.1659642641182;
        Thu, 04 Aug 2022 12:50:41 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id e11-20020a056e020b2b00b002dd0a586cbasm755840ilu.58.2022.08.04.12.50.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Aug 2022 12:50:40 -0700 (PDT)
Received: (nullmailer pid 259295 invoked by uid 1000);
	Thu, 04 Aug 2022 19:50:38 -0000
From: Rob Herring <robh@kernel.org>
To: bchihi@baylibre.com
Cc: louis.yu@mediatek.com, james.lo@mediatek.com, khilman@baylibre.com, p.zabel@pengutronix.de, amitk@kernel.org, linux-kernel@vger.kernel.org, mka@chromium.org, abailon@baylibre.com, devicetree@vger.kernel.org, rafael@kernel.org, linux-mediatek@lists.infradead.org, daniel.lezcano@linaro.org, rui.zhang@intel.com, linux-pm@vger.kernel.org, krzk+dt@kernel.org, fan.chen@mediatek.com, matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org, rex-bc.chen@mediatek.com, robh+dt@kernel.org
In-Reply-To: <20220804130912.676043-3-bchihi@baylibre.com>
References: <20220804130912.676043-1-bchihi@baylibre.com> <20220804130912.676043-3-bchihi@baylibre.com>
Subject: Re: [PATCH v8.1, 2/7] dt-bindings: thermal: Add binding document for LVTS thermal controllers
Date: Thu, 04 Aug 2022 13:50:38 -0600
Message-Id: <1659642638.738608.259294.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220804_125043_236259_BAC30F04 
X-CRM114-Status: GOOD (  11.72  )
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

On Thu, 04 Aug 2022 15:09:07 +0200, bchihi@baylibre.com wrote:
> From: Alexandre Bailon <abailon@baylibre.com>
> 
> This patch adds dt-binding documents for mt8192 and mt8195 thermal controllers.
> 
> Signed-off-by: Alexandre Bailon <abailon@baylibre.com>
> Signed-off-by: Balsam CHIHI <bchihi@baylibre.com>
> ---
>  .../thermal/mediatek,lvts-thermal.yaml        | 77 +++++++++++++++++++
>  1 file changed, 77 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/thermal/mediatek,lvts-thermal.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Error: Documentation/devicetree/bindings/thermal/mediatek,lvts-thermal.example.dts:32.36-37 syntax error
FATAL ERROR: Unable to parse input tree
make[1]: *** [scripts/Makefile.lib:383: Documentation/devicetree/bindings/thermal/mediatek,lvts-thermal.example.dtb] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1404: dt_binding_check] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.


