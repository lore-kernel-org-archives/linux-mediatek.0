Return-Path: <SRS0=fB7w=DM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3361CC4363A
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Oct 2020 14:39:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D14A7207F7
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Oct 2020 14:39:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Vorug80x"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D14A7207F7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=BCaQ5dEXiAcLp0eDfoMvxS0wONFXVK/r48b87G9mut0=; b=Vorug80xvaH3QGvM9JaCHzwkQ
	ZKdjcQrC7hoV5w5Oi5O8vmbQ+MAA9HbHNjpSpM7gxNj9EQ9wwVZH/U22YnS8hRwfIBYZZaJLM0nYR
	AY4TdIsW3d+YsOnMftref+JVMALv2JaZmIziT6fcdgvv0tWvQzKd6Dd0+BCdk8Pfke0XPXOriv/nY
	fVVxDjW/7IwcFxJ40bCCrjY7NXUQoF5+kWbVW/1aRmu3u7gJAecmWAGrTRNKrtodFXa6SRpYr8wEN
	QqyZsY2PGsn6NSPKtLqVVCKVrJSJybR3bNUzodMy8jsrEeHFoVWNP5+UivoLboYfxkW7X81V1Ks+F
	ufNq9WMbA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kPRdo-0002cB-Fi; Mon, 05 Oct 2020 14:39:04 +0000
Received: from mail-oi1-f196.google.com ([209.85.167.196])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kPRdj-0002bG-EO; Mon, 05 Oct 2020 14:39:00 +0000
Received: by mail-oi1-f196.google.com with SMTP id m128so8907387oig.7;
 Mon, 05 Oct 2020 07:38:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=naQi8NEjlXf44kRLn+g1FTyii1oFTs4V5HICiDUnCFM=;
 b=btj0dwOkh64Ktt/nIm+0ZXSuAOhMId3/B2vFM58PfcGFZhN3qPQT7pH7NqrDCz1UKy
 BPlPWOCcREbd/AqjKZkXXfQji2Lf3QwPvMKU24ujZV/kqCCs9LhvLK9jfWEFXR2QbkOM
 lPc1VQ1AXRC2o+kyk0Zzb1hmgYlqaig4SQoTFHEGe6y90AD3A1kDEGQKd578VAeZbLfk
 vQgxXJz6beQ6z7nC7EXJKKliDIgG7ikS2O3HDYqF+tOmaRBKix9YbK978AcbaQz0k5aC
 xnEoN61au3TP6psYxNfHwJWv0+zkwFKrl+AHf3be2sh6scqKlZdhYlL78ZB60E93KlzI
 0Qag==
X-Gm-Message-State: AOAM533BkOeeHsL6QGW8PASEYwwY/k2KnHXSAOeFNjx4RYql/KAz9e58
 HdgxrG99dC/hL85sGc1IPr0rUBKvqTaO
X-Google-Smtp-Source: ABdhPJyBNSFKOcjOpYW30Jw30TpzykIS03eABHXPs2eAFFuiWGe8CeVT1pVZB+S/XP4nZBn1bxFiKQ==
X-Received: by 2002:aca:55c2:: with SMTP id j185mr5332858oib.13.1601908738430; 
 Mon, 05 Oct 2020 07:38:58 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id u68sm3104760otb.9.2020.10.05.07.38.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Oct 2020 07:38:57 -0700 (PDT)
Received: (nullmailer pid 149913 invoked by uid 1000);
 Mon, 05 Oct 2020 14:38:56 -0000
Date: Mon, 5 Oct 2020 09:38:56 -0500
From: Rob Herring <robh@kernel.org>
To: Gene Chen <gene.chen.richtek@gmail.com>
Subject: Re: [PATCH v6 1/3] dt-bindings: iio: adc: add bindings doc for
 MT6360 ADC
Message-ID: <20201005143856.GA149682@bogus>
References: <1601542448-7433-1-git-send-email-gene.chen.richtek@gmail.com>
 <1601542448-7433-2-git-send-email-gene.chen.richtek@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1601542448-7433-2-git-send-email-gene.chen.richtek@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201005_103859_533575_0BDF0C66 
X-CRM114-Status: GOOD (  12.34  )
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
Cc: gene_chen@richtek.com, devicetree@vger.kernel.org, lars@metafoo.de,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, cy_huang@richtek.com,
 benjamin.chao@mediatek.com, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, jic23@kernel.org, pmeerw@pmeerw.net,
 knaack.h@gmx.de, matthias.bgg@gmail.com, Wilma.Wu@mediatek.com,
 linux-arm-kernel@lists.infradead.org, shufan_lee@richtek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 01 Oct 2020 16:54:06 +0800, Gene Chen wrote:
> From: Gene Chen <gene_chen@richtek.com>
> 
> This change adds the binding doc for the MT6360 ADC.
> 
> Signed-off-by: Gene Chen <gene_chen@richtek.com>
> ---
>  .../bindings/iio/adc/mediatek,mt6360-adc.yaml      | 34 ++++++++++++++++++++++
>  1 file changed, 34 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/iio/adc/mediatek,mt6360-adc.yaml
> 


Please add Acked-by/Reviewed-by tags when posting new versions. However,
there's no need to repost patches *only* to add the tags. The upstream
maintainer will do that for acks received on the version they apply.

If a tag was not added on purpose, please state why and what changed.


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
