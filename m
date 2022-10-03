Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB466C4332F
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Oct 2022 14:58:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5cbLfqZI3Q8R3SGXiA37ed3O2MwBVAUrjqH+O7vBBxM=; b=kUtEtIPw8TOX4rDBvr3HjIrMoe
	2S8H8xfqJbh3qAbM+XkHP020Xk4IgcRtmbYazmuLPjHTRkZF1bXfFqo7wKKkNmaXlHTfGo2sv5PGJ
	oSabUiclEV1mpGO9JmIwJnrInbWdHIXviJPIab3uOt4DGxYnO1H8dEXhY+cEFKHJ2pw+W9EhuC8ug
	zBR8F7KOLUBQRVBbkjVjWQduoOMsWjKwJd9VyvVe63CDr0v+jrzI61QCIL4O96y9evtqrH/3Ih+0i
	PmaXsc+Bhc+bAEbHmjW5t8rPHTU2Tpfi0pVSOiug/MScqOEXlKSMHVbLDEzuDOpk63RHTSB49ww9d
	2vtBjHnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofMts-006MVC-Hu; Mon, 03 Oct 2022 14:58:32 +0000
Received: from mail-oa1-f54.google.com ([209.85.160.54])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofMth-006MRJ-VE; Mon, 03 Oct 2022 14:58:23 +0000
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-13207a86076so9001192fac.3;
        Mon, 03 Oct 2022 07:58:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=5cbLfqZI3Q8R3SGXiA37ed3O2MwBVAUrjqH+O7vBBxM=;
        b=NaLRQD1bhqb9ydiCp+aeB8X0SBEGmIxpHZfbF2nfTbZsYs9lm3UuBaYmHFpPBjC/3r
         TgvWL5ozW4Ath+xOuma9RGoiS7lQ9vu5RpVZQyPb6Breaf5aNqocKL/VKw5pIxBghbBp
         VFRbL8FKDFtsnKwy4sZMds+ptv3tIXsOGDEXOtcxBl609QlTzvEP1g0kD7OPNs5mztZC
         59/YR4mHSggFGI1302xdrss/PGuBncOjoxBcxdp89ff1XAy5f8+o9twVwU5GWz3F0zZR
         2Z1av2siwBurdakDP0ZQqPT3/C4W3PtKTjbUssVvLAUxWtdKInyt7lE6lyXwNY/cHvVw
         KhrA==
X-Gm-Message-State: ACrzQf1vCcYGAodFXzkv91Hrsz+Zn/jr2KoBM3aH2o12cn4gBd6xwDZR
	lUjqcqWEhubkdONc/6qgDQ==
X-Google-Smtp-Source: AMsMyM4NsYhk/PTE/9yjhHOaP5R9tw0lmISIvFKVVGKWethMJ7ua6fEfnSkoc/gMkL45Seg9UfwCQA==
X-Received: by 2002:a05:6871:783:b0:12d:4b84:352d with SMTP id o3-20020a056871078300b0012d4b84352dmr5484225oap.179.1664809099630;
        Mon, 03 Oct 2022 07:58:19 -0700 (PDT)
Received: from macbook.herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id o24-20020a05680803d800b0035179b87ba5sm2501593oie.20.2022.10.03.07.58.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Oct 2022 07:58:19 -0700 (PDT)
Received: (nullmailer pid 2249263 invoked by uid 1000);
	Mon, 03 Oct 2022 14:58:18 -0000
Date: Mon, 3 Oct 2022 09:58:18 -0500
From: Rob Herring <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: houlong.wei@mediatek.com, linux-kernel@vger.kernel.org, jassisinghbrar@gmail.com, linux-arm-kernel@lists.infradead.org, matthias.bgg@gmail.com, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org
Subject: Re: [PATCH v4] dt-bindings: mailbox: Convert mtk-gce to DT schema
Message-ID: <166480909049.2249063.7109234696871106188.robh@kernel.org>
References: <20220921090006.37642-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220921090006.37642-1-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221003_075822_020861_8F788966 
X-CRM114-Status: GOOD (  19.56  )
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

On Wed, 21 Sep 2022 11:00:06 +0200, AngeloGioacchino Del Regno wrote:
> Convert the mtk-gce mailbox binding to DT schema format.
> 
> During the conversion, the examples for client device/mutex nodes
> were removed, as these are found in their respective bindings:
> arm/mediatek/mediatek,mmsys.yaml for "mediatek,mt8173-mmsys"
> soc/mediatek/mediatek,mutex.yaml for "mediatek,mt8173-disp-mutex"
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
> 
> Changes in v4:
>  - Removed deprecated examples comment
>  - Fixed address for gce example
>  - clock-names variation is now in allOf block
>  - Added soc bus node with two address/size cells, as to
>    provide a more practical example for the gce node
> 
> Changes in v3:
>  - Removed '|' from description
>  - Removed mbox client examples
>  - Squashed patch dt-bindings: arm: mediatek:
>    mmsys: Reference to mediatek,gce-mailbox.yaml
> 
> Changes in v2:
>  - Changed mtk-gce.txt references to new yaml file
> 
> 
> A previous attempt for this was made at [1], but it was changing
> the way of getting clocks (by name for all).
> Keeping clock-names not required for the multi-gce case makes this
> binding simpler, hence I chose to abandon the change at [1] and go
> for this one instead.
> 
> Any Reviewed-by or Acked-by tag was dropped, as this conversion was
> completely redone from scratch and differs from [1] for the
> aforementioned reasons.
> 
> [1]: https://lore.kernel.org/all/20220524151512.247435-1-angelogioacchino.delregno@collabora.com/
> 
>  .../bindings/arm/mediatek/mediatek,mmsys.yaml |  3 +-
>  .../mailbox/mediatek,gce-mailbox.yaml         | 85 +++++++++++++++++++
>  .../devicetree/bindings/mailbox/mtk-gce.txt   | 82 ------------------
>  3 files changed, 87 insertions(+), 83 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/mailbox/mediatek,gce-mailbox.yaml
>  delete mode 100644 Documentation/devicetree/bindings/mailbox/mtk-gce.txt
> 

Applied, thanks!

