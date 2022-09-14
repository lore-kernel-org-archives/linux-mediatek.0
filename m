Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97E51C6FA8A
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Sep 2022 15:06:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DG8jK2VGVF6CoXW6DXySelXNuunB85oFke/oAJQGn7M=; b=hnTp/bZHmxVtWrxu/1+dNyYQ1g
	q1DXbGxq38wcqrjPuLcH7QnVUewByG9zIOSuI5bLC9btYjgJaRjfdRT5IUPzzcgCHVHVqkdzVuryO
	pLOgLxEvBbXrswLMA/DisP34cRFJYMZw5rPpMJLUvUC3YTwKY5/bwb5/KTZuoPwg3UWOXDT2Yhvp4
	R1wnHzF7TRQqWZdmffDp4c+eNtGtk949VhC1cVLozgkFUzIxF4gh6TYLSIswbSRMDBK8z1qeItFKf
	jV9uIjrrsVKJa1n2NVamEGvIzvTeN0xz9HYsrLror4pB6vHbxLAWCaPn1DMI5IziYln1nr1bnw/zW
	Wp3/vF3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYTy6-003GC4-N4; Wed, 14 Sep 2022 15:06:26 +0000
Received: from mail-oo1-f46.google.com ([209.85.161.46])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYTy3-003G86-DR; Wed, 14 Sep 2022 15:06:24 +0000
Received: by mail-oo1-f46.google.com with SMTP id c22-20020a4a4f16000000b00474a44441c8so2476568oob.7;
        Wed, 14 Sep 2022 08:06:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=DG8jK2VGVF6CoXW6DXySelXNuunB85oFke/oAJQGn7M=;
        b=Prcrx/4u5UAdqcUMk2YW98bWwoIgCRjDozF1CKGaP1WfNXyG+4Rg7pz4kUL3V+EGXL
         5hmtfOcyymdnG9XRboxOlxeotC/Bu44TU6hbVlnduiuR/PBgVsHRsXqA8/fooP4G5Dh2
         /IJ+9wnNSnQ6y0TXs9eb67HFVgJ4PyNzj/YgpzW6BjY9kU48ZZFpQg4xfbg/9LvWkQIN
         +NnAIsfoYQD7PW2T19jZkH4W1ccdtKcKb8B9o9IKqWyWUpmpH7r+iIk360J5OM+JRf7e
         cGGyd/JgOp2z0947Z6d0jZWUm0NZcqGhvCOn4rgYOt/HuoXaQQOezimH/C9IN9dRXVG2
         m+ig==
X-Gm-Message-State: ACgBeo2dQ4Dd9zcmk4vR2Bo9xPS9tJOwOWEd7khUB245KdI5G/f/U7Me
	9/tX++xq/Rb/GJ7st86vaQ==
X-Google-Smtp-Source: AA6agR77S+W1uvRmgcKfkwfbm9OYUUZIqqBM8PBzfVvughcMQPv55SChHWRW8CTOWrpBRsoJZsZ3vg==
X-Received: by 2002:a4a:d41:0:b0:44a:8081:733c with SMTP id 62-20020a4a0d41000000b0044a8081733cmr12883364oob.71.1663167981347;
        Wed, 14 Sep 2022 08:06:21 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id u22-20020a056871009600b0012b342d1125sm7788150oaa.13.2022.09.14.08.06.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Sep 2022 08:06:20 -0700 (PDT)
Received: (nullmailer pid 2221684 invoked by uid 1000);
	Wed, 14 Sep 2022 15:06:20 -0000
Date: Wed, 14 Sep 2022 10:06:20 -0500
From: Rob Herring <robh@kernel.org>
To: cy_huang <u0084500@gmail.com>
Cc: cy_huang@richtek.com, robh+dt@kernel.org, chiaen_wu@richtek.com, linux-mediatek@lists.infradead.org, alice_chen@richtek.com, linux-arm-kernel@lists.infradead.org, matthias.bgg@gmail.com, krzysztof.kozlowski+dt@linaro.org, lee@kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: mfd: mt6370: fix the indentation in the
 example
Message-ID: <20220914150620.GA2221443-robh@kernel.org>
References: <1663143803-28660-1-git-send-email-u0084500@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1663143803-28660-1-git-send-email-u0084500@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220914_080623_475382_18B99974 
X-CRM114-Status: GOOD (  11.45  )
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

On Wed, 14 Sep 2022 16:23:23 +0800, cy_huang wrote:
> From: ChiYuan Huang <cy_huang@richtek.com>
> 
> Fix the indentation in the binding example. There're two redudant space
> charactors need to be removed.
> 
> Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
> ---
>  Documentation/devicetree/bindings/mfd/mediatek,mt6370.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>

