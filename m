Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C53EECAAD3
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Sep 2022 14:13:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SPyIRI2qTfSO2auACHjp148Yr0cJMKWfWPP3G131wXU=; b=K4PvN/VizTfv1TiSlFhKfG7CjN
	nc6X1WZEHEmypwdxj4ofBmPE6SAYdzseKqronAqN4+qf/hM4GELcWPw6nXWwy/t2EgeSRtDH+RyCx
	G9oAUeJkVViIZ+ibVyQ9oz/HBQJMStrkGgyYVAYc7nJdefbRT5myJp6MeLxA3lnIwOJjx+956ZkUu
	lZ900YmbBZakchaRn5CmMJmhhZ2sampwhif6XeM5TwksJQSxlfoabULy2/PkbI8uCE5ujHfXGzw//
	N2yc6+anbD23eEelwEFDLdmrlVCLno0KEtcT9uvmApJQwEoBN0CQOvkxKPuPifPxXq+WaGJuUvhGL
	qj2Bfl3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYT8e-001p34-AE; Wed, 14 Sep 2022 14:13:16 +0000
Received: from mail-oa1-f48.google.com ([209.85.160.48])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYT8Z-001oFM-4w; Wed, 14 Sep 2022 14:13:15 +0000
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-12b542cb1d3so31539129fac.13;
        Wed, 14 Sep 2022 07:12:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=SPyIRI2qTfSO2auACHjp148Yr0cJMKWfWPP3G131wXU=;
        b=AZsp68Utdz/Br+qJl04iDFugRdcHFgCaaS5z55SWGLScFK8G6MsxSuSHrt6nthKpfL
         aU3DEIrYn7ATb3AHFBPJaX/LGpKY1ElZtSKo9PQLuj0g43jPfDZXeOYWedCMb7CKPk0b
         JCakB1huO8r4ikXfnXk3p9SPyof8KzkbEkTXAsF2WH30bV/4ka/elUgSB7kibxQl6JyS
         tzWFM8IC3uN8Z0Qti0Qb/So7aHCW+KmRfb3VINvHJDE98/aoMqV9ZAYBDqDZJhwXllkK
         EelZTuOrPP9I5J44y2GH6od1RXpzU3a2M7yXI5VkZRdSzCnWFaRqXBr8C28CDcr1a9Ad
         NthA==
X-Gm-Message-State: ACgBeo36FaVzz1K0v6wP8rVJtuVzmVsRFcQZKwEZJG29SKarz8YbpKjw
	WX0sBvo2qnod2hFH7/wzcg==
X-Google-Smtp-Source: AA6agR7QeunMWJohZIlFuCMAfUkU6WKkOLpkzcAPqf/clN22a3MXHYUvpcOCZ79QPAgMSv29PpsnAA==
X-Received: by 2002:aca:5b0b:0:b0:344:bea0:8c88 with SMTP id p11-20020aca5b0b000000b00344bea08c88mr1980979oib.225.1663164766562;
        Wed, 14 Sep 2022 07:12:46 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id t184-20020a4a54c1000000b0044b0465bd07sm6451845ooa.20.2022.09.14.07.12.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Sep 2022 07:12:46 -0700 (PDT)
Received: (nullmailer pid 2131256 invoked by uid 1000);
	Wed, 14 Sep 2022 14:12:45 -0000
Date: Wed, 14 Sep 2022 09:12:45 -0500
From: Rob Herring <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: allen-kh.cheng@mediatek.com, devicetree@vger.kernel.org, chunkuang.hu@kernel.org, rex-bc.chen@mediatek.com, moudy.ho@mediatek.com, matthias.bgg@gmail.com, jason-jh.lin@mediatek.com, linux-mediatek@lists.infradead.org, krzysztof.kozlowski+dt@linaro.org, p.zabel@pengutronix.de, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, robh+dt@kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: soc: mediatek: Add display mutex
 support for MT6795
Message-ID: <20220914141245.GA2131194-robh@kernel.org>
References: <20220913140121.403637-1-angelogioacchino.delregno@collabora.com>
 <20220913140121.403637-2-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220913140121.403637-2-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220914_071311_230858_201CCB82 
X-CRM114-Status: UNSURE (   9.11  )
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

On Tue, 13 Sep 2022 16:01:20 +0200, AngeloGioacchino Del Regno wrote:
> Add compatible for MT6795 Helio X10 SoC.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../devicetree/bindings/soc/mediatek/mediatek,mutex.yaml         | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

