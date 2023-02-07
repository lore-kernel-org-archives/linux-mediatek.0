Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7861DC636D4
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Feb 2023 20:40:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2+MMAdZlfw/9O4oUybbbQ4cVQfeOgnkULR9gIWh8BDo=; b=BKHTYp/bvi6QMCDCnJcD0bLcCh
	2qAfTIcfq6HX5Vnp/WFpCnMql0upIjsAChU2u04hd3PuI1w9gDovycsFUBRxcSpMFoROdZVep7wt4
	bbFLSVnwUZUsx1Xim+vxXYtfDWSYib32BH4C60M5N4SsR1dEK0ywcq8aKWu3K8iT9d5W42LkRKozD
	K0CwqPdnQaiElOHEK1r7tuARUIa/mrZIlYN+RV+ofekf9a/ulMAR2QwHHmSkrGFRVCQoLfJq59SSY
	5ErdJvVlqMmC9Rikouvae/HGdtFiFZ3BQVoYOTNUy1JkCBnTUOOHCOoKcWlu3PMmg7uHj46VTmwZw
	NGGLY8bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPUkz-00DLsU-KI; Tue, 07 Feb 2023 20:40:01 +0000
Received: from mail-ot1-f41.google.com ([209.85.210.41])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPUkv-00DLr8-8s; Tue, 07 Feb 2023 20:40:00 +0000
Received: by mail-ot1-f41.google.com with SMTP id j6-20020a9d7686000000b0068d4ba9d141so4621045otl.6;
        Tue, 07 Feb 2023 12:39:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2+MMAdZlfw/9O4oUybbbQ4cVQfeOgnkULR9gIWh8BDo=;
        b=o+P3p/n1d6ZnrACfLiNcfzEqRYco/4JjgwsWvZXbdrlgjTCnPUTmqCmezNAnjIiieH
         1Sd6aBsDT/Zoy2VghE8H776qndaV4DOST3am3/egq2WAHQV5D9aSSZdbeiXJy1QJT3s5
         xJROOVnOGZ+ewqdhlAioidiSve+hcCmEBZ0vLHMqrhTcMth2u0o3OKDRV6HH3pdYyxMl
         2BB2kb3E9xGQn8K74+N2WtTfWLy67t+67N91IQzNsxhtEoVoNgbQCwJz+co+1jmkR4kV
         7Vua5fJK0vS2wbhatViQizoCeGfoElUrNOtPaOKeUfRUkxfzNg+Tg7Iem06tN3EyMn7q
         yDwA==
X-Gm-Message-State: AO0yUKVhnEA+BdEYD7q+MedWuHqsrOO+B7vwMMlZeSdbVD2U7XGoAK0r
	6LTPCs93uLtETa57iUWxaQ==
X-Google-Smtp-Source: AK7set+Xb8y1929C/3ir/6OF+cXnTSlLAjlNzMxZ14b7jdJhUthzb5BwWTe/EnSQGuz0NzYLhHXWMA==
X-Received: by 2002:a9d:4681:0:b0:68a:ed8b:caf3 with SMTP id z1-20020a9d4681000000b0068aed8bcaf3mr2591459ote.33.1675802393043;
        Tue, 07 Feb 2023 12:39:53 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id cp23-20020a056830661700b0068bdd78f763sm7083449otb.29.2023.02.07.12.39.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Feb 2023 12:39:52 -0800 (PST)
Received: (nullmailer pid 4117410 invoked by uid 1000);
	Tue, 07 Feb 2023 20:39:51 -0000
Date: Tue, 7 Feb 2023 14:39:51 -0600
From: Rob Herring <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chun-jie.chen@mediatek.com, miles.chen@mediatek.com, wenst@chromium.org, linux-mediatek@lists.infradead.org, rex-bc.chen@mediatek.com, mturquette@baylibre.com, edward-jw.yang@mediatek.com, linux-kernel@vger.kernel.org, matthias.bgg@gmail.com, devicetree@vger.kernel.org, robh+dt@kernel.org, sboyd@kernel.org, linux-arm-kernel@lists.infradead.org, johnson.wang@mediatek.com, jose.exposito89@gmail.com, linux-clk@vger.kernel.org, kernel@collabora.com, krzysztof.kozlowski+dt@linaro.org
Subject: Re: [PATCH v3 3/7] dt-bindings: clock: mediatek,mt8186-fhctl:
 Support MT6795, MT8173/92/95
Message-ID: <167580232739.4115577.9212468332187095949.robh@kernel.org>
References: <20230206100105.861720-1-angelogioacchino.delregno@collabora.com>
 <20230206100105.861720-4-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230206100105.861720-4-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230207_123959_039497_729AF024 
X-CRM114-Status: GOOD (  12.34  )
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


On Mon, 06 Feb 2023 11:01:01 +0100, AngeloGioacchino Del Regno wrote:
> MT6795, MT8173, MT8192 and MT8195 support Frequency Hopping: add the
> compatibles for them.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../devicetree/bindings/clock/mediatek,mt8186-fhctl.yaml   | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 


Please add Acked-by/Reviewed-by tags when posting new versions. However,
there's no need to repost patches *only* to add the tags. The upstream
maintainer will do that for acks received on the version they apply.

If a tag was not added on purpose, please state why and what changed.

Missing tags:

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>




