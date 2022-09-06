Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3335ECAAA1
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Sep 2022 16:56:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Lgh3vIwdeNSYx8GlCKAtAtQt9YyclbM6HZvbQmSZCu8=; b=dd3ueyDeq7d+UcHHdaC2UMUpvR
	yYpqcp5ip1ffMupo2xEvAZ20xPuMln7bUfjYcomjWchcjdMhdr+Qt+IUqtyNNgUYqE0oKLSNnRuee
	HkO4vawBks0T3Rfrl23p+/GsMYmJztFUnkvtVkho/k1Q39izHHfO9DPWGzlzkG+cBY+WMHrTL/0TT
	vXw8akxMGak1tsSIdiGn43h8RE0fxSpJ8bX6nbvpPH4A25d89Eslv8JfLSs+JKCd6fCgbDigVLpk1
	fNMYBH6HDBRAbhhKNzafJraPaToLvVh26vuYUzlFKdNK3570oWS6jxj26S3TcJ70MnMjkCq94ewfc
	myT0VpNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVbrq-00FfF9-0A; Tue, 06 Sep 2022 16:56:06 +0000
Received: from mail-ot1-f46.google.com ([209.85.210.46])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVbdp-00FWNZ-2V; Tue, 06 Sep 2022 16:41:38 +0000
Received: by mail-ot1-f46.google.com with SMTP id d18-20020a9d72d2000000b0063934f06268so8470633otk.0;
        Tue, 06 Sep 2022 09:41:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=Lgh3vIwdeNSYx8GlCKAtAtQt9YyclbM6HZvbQmSZCu8=;
        b=3Z33vVyqegqiUm0RM1BjzQVmfOAKl02LNJoJe4c7x4Odi/esXMA5gEAU4wtCyxKOOQ
         +zL8LdGoag35nY4YbzPVIfNd7v3mZxP9RsCpgKmf1px081dSpPBstthESaCoLq4B/mj5
         oRFesYdBUe77rdKg1HbyDM1ytGX00EnhBWt5HvKzriDpEc+3yL0EiUoLoiUuvk4cHGaE
         AHEYLPkuHW+J1g2N+mSbtinscVldnfMJ5ary0MzdwJzKq5HJt8bjMF7UynMdk/0zFRI4
         ywviFuoMt77zkZ64YS1/bbZcbOdodprdf40s/drT+inBxX47fVbKsLJdqh19Ks6JWdyM
         jAYQ==
X-Gm-Message-State: ACgBeo2ALe6XJeUAwyCJAUrJRfMBGQUhNAEtbGN+fEXDLzpH7BgaZR74
	fnzKm24zapuMKfL12XvhXQ==
X-Google-Smtp-Source: AA6agR6eT3W44N2T2/Zyuy68L3b4LyOQqPBPocAIz0OHE0repCmWb71KdiOTZdYsmijS/X/CKy0Jvg==
X-Received: by 2002:a05:6830:910:b0:637:18dd:7743 with SMTP id v16-20020a056830091000b0063718dd7743mr21298945ott.226.1662482494616;
        Tue, 06 Sep 2022 09:41:34 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id d23-20020a056830139700b0061cd208fadesm6018600otq.71.2022.09.06.09.41.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Sep 2022 09:41:33 -0700 (PDT)
Received: (nullmailer pid 670571 invoked by uid 1000);
	Tue, 06 Sep 2022 16:41:33 -0000
Date: Tue, 6 Sep 2022 11:41:33 -0500
From: Rob Herring <robh@kernel.org>
To: matthias.bgg@kernel.org
Cc: Matthias Brugger <mbrugger@suse.com>, mandyjh.liu@mediatek.com, krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, robh+dt@kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, lee@kernel.org
Subject: Re: [PATCH v2] dt-bindings: mfd: Rename mediatek,mt8195-scpsys.yaml
Message-ID: <20220906164133.GA670491-robh@kernel.org>
References: <20220830091110.27857-1-matthias.bgg@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220830091110.27857-1-matthias.bgg@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220906_094137_174497_71F6E21F 
X-CRM114-Status: GOOD (  12.19  )
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

On Tue, 30 Aug 2022 11:11:10 +0200, matthias.bgg@kernel.org wrote:
> From: Matthias Brugger <mbrugger@suse.com>
> 
> The file describes the scpsys node for all SoCs and not only the mt8195.
> Rename it to reflect this fact.
> 
> Signed-off-by: Matthias Brugger <mbrugger@suse.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> 
> ---
> 
> Changes in v2:
> - Fix id
> 
>  .../mfd/{mediatek,mt8195-scpsys.yaml => mediatek,scpsys.yaml}   | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename Documentation/devicetree/bindings/mfd/{mediatek,mt8195-scpsys.yaml => mediatek,scpsys.yaml} (96%)
> 

Acked-by: Rob Herring <robh@kernel.org>

