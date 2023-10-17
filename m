Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 643A1CDB474
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Oct 2023 20:19:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q6YKzXb6RpcvAIE2KNseI2JNeCjjBedEHxdHH0ygsVs=; b=rWOqa5EZkFo/TS/BwAW5HelAuC
	to2ZoEkUMxwisW7NNXdtP+25xgPovEMzfZM+vqNfwjZdLZdU4if7+BOeMieBwgwrS4e3hfuGUfS86
	2NmqKJNVsF5HBowIqi5yLWnYs2QQgJqm8gAHWDk1f42DzkvU4Oo5DJMQP/XN+vFvJjjhgqjXDWYWL
	LbzAMhGq6sPJvL8ssZdXpJ63dpU9/EHrvjD9hr9FhRCUjnV3m7BgD5mRQahaynkrb/4uXv41AodDv
	+WTDp+DDcVI//Fyguc9juNI3/KIPviFr1sJx1Y5yI3UM7pJd0gIEnI73zMQYM8MiDCVIMP4chKNt0
	csSjiDWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsqWx-00DBe7-14;
	Tue, 17 Oct 2023 20:19:07 +0000
Received: from mail-oo1-f44.google.com ([209.85.161.44])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qsqWu-00DBda-1t;
	Tue, 17 Oct 2023 20:19:05 +0000
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-581b6b93bd1so1526229eaf.1;
        Tue, 17 Oct 2023 13:19:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697573943; x=1698178743;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q6YKzXb6RpcvAIE2KNseI2JNeCjjBedEHxdHH0ygsVs=;
        b=E29uqlgwh9rSFnEmPd+4AaHjhrm5X7Hvqc5ONh0jT4QkKFjad+Omr8t0cYdw4JsoSL
         Lyq01e/7CaReKo27EeWr7AASbe91NLVmFaZCS5xKf/kITb/OQfd8kjcP4FrT5Y5wdIm7
         zYSVeI+gJzft+yo06MSh2BJ8cT40bhwqzU0/oamddAWexyMk8uz4KsKXtGF4RWYiRkhh
         4iYvE2VAA3zX7UJGlPEouHIji1yR0TCMAQxp7zZJRI6OUrBpEWeYjsVTlZacm1WIosyI
         89IyK1mZQLqg9/4vk9YHl3X3lAwsvs9HkeyvKfePlS6PgtOG5or2l+TRjwMqApWL0qs2
         1XbA==
X-Gm-Message-State: AOJu0YydPPPtlu1+CBof1eDbj68ab0EhPyjaGKjh9WkunJHZ9/FPTfgc
	hYO5uINTUJK6uc9SUEdWtg==
X-Google-Smtp-Source: AGHT+IGvqa31RZJ8r/SrafiLvgLLHO+b84rMNqNQHLDYchD24kgtHpxnm526SRtBWsxbafS8D89ukQ==
X-Received: by 2002:a4a:db86:0:b0:57e:1618:e700 with SMTP id s6-20020a4adb86000000b0057e1618e700mr3406874oou.7.1697573943076;
        Tue, 17 Oct 2023 13:19:03 -0700 (PDT)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id f7-20020a4aeb07000000b0057bcbc23738sm372285ooj.17.2023.10.17.13.19.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Oct 2023 13:19:02 -0700 (PDT)
Received: (nullmailer pid 2681966 invoked by uid 1000);
	Tue, 17 Oct 2023 20:19:01 -0000
Date: Tue, 17 Oct 2023 15:19:01 -0500
From: Rob Herring <robh@kernel.org>
To: Hsiao Chien Sung <shawn.sung@mediatek.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Singo Chang <singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, devicetree@vger.kernel.org, Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org, Chun-Kuang Hu <chunkuang.hu@kernel.org>, Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, Jason-JH Lin <jason-jh.lin@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, David Airlie <airlied@gmail.com>, Chen-Yu Tsai <wenst@chromium.org>, linux-kernel@vger.kernel.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v3 03/11] dt-bindings: display: mediatek: ovl: Modify
 rules for MT8195/MT8188
Message-ID: <169757394073.2681910.919376164260775888.robh@kernel.org>
References: <20231017064717.21616-1-shawn.sung@mediatek.com>
 <20231017064717.21616-4-shawn.sung@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231017064717.21616-4-shawn.sung@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231017_131904_645113_D4625063 
X-CRM114-Status: UNSURE (   9.43  )
X-CRM114-Notice: Please train this message.
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


On Tue, 17 Oct 2023 14:47:09 +0800, Hsiao Chien Sung wrote:
> Modify rules for both MT8195 and MT8188.
> Hardware capabilities include color formats and AFBC are
> changed since MT8195, stop using the settings of MT8183.
> 
> Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>
> ---
>  .../bindings/display/mediatek/mediatek,ovl.yaml      | 12 +++++-------
>  1 file changed, 5 insertions(+), 7 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>


