Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 388C6C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 May 2022 16:04:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yK1qEjj4EmYPr5UPwtK/1o2pUVkKnGb9KvUiGeSElaw=; b=3t+BVW7Iim9ot/
	rKd7hVNxYf54FIV2tYaojLeNDjUPLlRK6lyH2wWf+2ry0eDvW8V8ajJgCOMFXUFS+vG8QSvhOb70a
	d9jovPv2fGfDa/oMczfnVvusZjXVWtwoGyD9plXaEstInQsbzhyg0ACz4teABpTwef3HTvn/nInk5
	6ngWHS5geZQNIgKPyfkPBBmbZIrbEPXJFz1TWBOIre4+y1BWchzO2CcySVOPt9Hc/WVLwYlujXvnG
	iNtkVP/hTAPyah1mjZM/xZ1er47ByHL/zI7Y4pR26+TYtsZUyhXeqfp1LtFO2gr+mSA/MDzflOwud
	CF/QnMqcM5Po6qdTF41A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nqdCv-008pPb-5F; Mon, 16 May 2022 16:04:29 +0000
Received: from mail-ot1-f51.google.com ([209.85.210.51])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nqdBy-008ooB-Ge; Mon, 16 May 2022 16:03:31 +0000
Received: by mail-ot1-f51.google.com with SMTP id
 l9-20020a056830268900b006054381dd35so10344929otu.4; 
 Mon, 16 May 2022 09:03:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=SzDio8XAI8nlBFG5iUOWW20ONgOCFkCak39qfWjf874=;
 b=sL2mLmVp+kwsnkuYMgTjAz2Mh/7RsGxhbJ0aXiMSEJxoQOpjsPkMT/0XwDcsmxG/OE
 SLw23iZWdgOi+E1A9SelkJuT10WnLHuzN5/JK63GHZE+b0PS2FVBTxm0EeT0ZwahCq7t
 ndcwuKKVoGkmbnz6+Tkt9w9tsyQCqWART+yBjshy2qytJsxYwX/UoqJG2Jof71t6ANHj
 lAIaIGMIP/e4x8kJii411rWfmRN2YmXNzsKNncUwAHRdfjAP+qMbM9kayRgMmmlvxxmc
 0h/jyz3jy3Ind2JO2g2v8Wev10JPBOQ998UUVhVz6O1rOBO5XchOuUxp7clmYEhpDmmT
 m0XQ==
X-Gm-Message-State: AOAM5327Ehe3EMprRLKfePTT+FqGwSJlT08+cyjdqlC0gWu3UOW+kJsz
 fNyKi+9d5Hydku6OA9dOy99gdBWsMw==
X-Google-Smtp-Source: ABdhPJxCVtmAolhbJ0fmzBUmzA+qG5NqVCHP9ys53Ul5bQx6uPg33wJGiivCjzr/GhgOwo+VDT9gdg==
X-Received: by 2002:a9d:da5:0:b0:605:e8e2:1706 with SMTP id
 34-20020a9d0da5000000b00605e8e21706mr6102309ots.317.1652717010094; 
 Mon, 16 May 2022 09:03:30 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 e24-20020a9d5618000000b006060322125fsm4121077oti.47.2022.05.16.09.03.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 09:03:29 -0700 (PDT)
Received: (nullmailer pid 2733520 invoked by uid 1000);
 Mon, 16 May 2022 16:03:28 -0000
Date: Mon, 16 May 2022 11:03:28 -0500
From: Rob Herring <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: marijn.suijten@somainline.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, konrad.dybcio@somainline.org,
 phone-devel@vger.kernel.org, kernel@collabora.com, bgolaszewski@baylibre.com,
 p.zabel@pengutronix.de, robh+dt@kernel.org, weiyi.lu@mediatek.com,
 mturquette@baylibre.com, linux-clk@vger.kernel.org,
 paul.bouchara@somainline.org, fparent@baylibre.com, ikjn@chromium.org,
 jason-jh.lin@mediatek.com, krzysztof.kozlowski+dt@linaro.org,
 rex-bc.chen@mediatek.com, ~postmarketos/upstreaming@lists.sr.ht,
 wenst@chromium.org, tinghan.shen@mediatek.com,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 sam.shih@mediatek.com, martin.botka@somainline.org, y.oudjana@protonmail.com,
 miles.chen@mediatek.com, matthias.bgg@gmail.com, sboyd@kernel.org,
 chun-jie.chen@mediatek.com, ck.hu@mediatek.com
Subject: Re: [PATCH 1/5] dt-bindings: mediatek: Document MT6795 system
 controllers bindings
Message-ID: <20220516160328.GA2733482-robh@kernel.org>
References: <20220513165050.500831-1-angelogioacchino.delregno@collabora.com>
 <20220513165050.500831-2-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220513165050.500831-2-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220516_090330_585800_DDFEEDD5 
X-CRM114-Status: UNSURE (   9.73  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, 13 May 2022 18:50:46 +0200, AngeloGioacchino Del Regno wrote:
> Document the MediaTek Helio X10 (MT6795) bindings for the apmixedsys,
> infracfg, topckgen, pericfg and mmsys system controllers.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../devicetree/bindings/arm/mediatek/mediatek,infracfg.yaml     | 2 ++
>  .../devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml        | 1 +
>  .../devicetree/bindings/arm/mediatek/mediatek,pericfg.yaml      | 1 +
>  .../devicetree/bindings/clock/mediatek,apmixedsys.yaml          | 1 +
>  Documentation/devicetree/bindings/clock/mediatek,topckgen.yaml  | 1 +
>  5 files changed, 6 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
