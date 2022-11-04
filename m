Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F9A9C433FE
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Nov 2022 21:59:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g8HWz9kiwP2ArMvVVBjsIPOdlOe9gKH5fjfr8UxkpAI=; b=HzQZnGhr5XCN7pAIHdLqcGpyCl
	D+DgViKd1o1iOBsRFVJIRDLnfzLcC71CGzmKhYqb8zy/GelCSp0hCQnRWLLC+7A/8JUeqoqnSOXBm
	fx+9DgXK9BqWFTMr/8kiLToqQ2xk2yLVREZCwo0bQgG9+uMyB2NOSf7dtP8S15gXqleLvEghcvQpA
	UhfnDiRbgN9q1KKPp9yG2R4UZy91m0gdhVda5V0ztFChWcM6rg0D/zTChsUiAARP0739dJkAJy0TN
	DZ5r8z9zD8jlcknigROnHk02cbcY60o4ntqKiqvojj9NXshGo/IlWyuQDMgvML05e+vtcB2n5vQ8R
	6bwqGGxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1or4j1-005JJY-Tp; Fri, 04 Nov 2022 21:59:43 +0000
Received: from mail-oi1-f179.google.com ([209.85.167.179])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1or4iy-005JHZ-In; Fri, 04 Nov 2022 21:59:43 +0000
Received: by mail-oi1-f179.google.com with SMTP id n83so6528638oif.11;
        Fri, 04 Nov 2022 14:59:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g8HWz9kiwP2ArMvVVBjsIPOdlOe9gKH5fjfr8UxkpAI=;
        b=kMCziGBJ7xyoCIa71z2GfgDBa8H0yLFMzTfgla732021EjBvtVev2WHtEteW0dQzVn
         HEjbLjk1lM9/XSeqAYdcpOh+gaJ8lvIZQz/BY43VnKy38uQNn6ZlsEBkbEEx8inPRLUY
         zWQZVrvJGzRuwSsgo9VeKFohwCsyJhkrNrYq4gypqLNKayQcNgtmKyjDtjadjxkQqNm2
         um0utJlm05KgB+AZ43UtBhtfOvrDDOrSSKn1Zxbbm8XwI4U8MPMxHZyPWTdJ27qUtQwy
         QUdq50I/Gh0LqCJCHoFhLWOtT5DxZM5J+tXF2KVmA9dz2dM0mZEjkscbTXxMrL+MMIrY
         QcMQ==
X-Gm-Message-State: ACrzQf1eYZorLgGDpjRqSa/COLaQdio0IrRjUFWhjVtAbjqLleeQXoHe
	vqbHdLCMlcv7u1LP/YkJfg==
X-Google-Smtp-Source: AMsMyM44JC4DHyZ3R5J0DsTWv8pZFFqZoZE6Jfx8IiWT3Y+Ce49KnN+aGjyJNEo2KWZSJ4NSxSPzrA==
X-Received: by 2002:a05:6808:1642:b0:331:567c:54e1 with SMTP id az2-20020a056808164200b00331567c54e1mr19705073oib.232.1667599178815;
        Fri, 04 Nov 2022 14:59:38 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id o22-20020a9d5c16000000b0066756fdd916sm192116otk.68.2022.11.04.14.59.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Nov 2022 14:59:38 -0700 (PDT)
Received: (nullmailer pid 2900136 invoked by uid 1000);
	Fri, 04 Nov 2022 21:59:40 -0000
Date: Fri, 4 Nov 2022 16:59:40 -0500
From: Rob Herring <robh@kernel.org>
To: Tinghan Shen <tinghan.shen@mediatek.com>
Cc: Jianjun Wang <jianjun.wang@mediatek.com>, Bjorn Helgaas <bhelgaas@google.com>, Project_Global_Chrome_Upstream_Group@mediatek.com, linux-pci@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Ryder Lee <ryder.lee@mediatek.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/3] dt-bindings: PCI: mediatek-gen3: Support mt8195
Message-ID: <166759917936.2900079.7086690867814056235.robh@kernel.org>
References: <20221103025656.8714-1-tinghan.shen@mediatek.com>
 <20221103025656.8714-2-tinghan.shen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221103025656.8714-2-tinghan.shen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221104_145940_657719_5CFDA68F 
X-CRM114-Status: GOOD (  11.73  )
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


On Thu, 03 Nov 2022 10:56:54 +0800, Tinghan Shen wrote:
> From: Jianjun Wang <jianjun.wang@mediatek.com>
> 
> In order to support mt8195 pcie node, update the yaml to support new
> properties of iommu and power-domain, and update the reset-names
> property to allow only one 'mac' name.
> 
> Signed-off-by: Jianjun Wang <jianjun.wang@mediatek.com>
> Signed-off-by: TingHan Shen <tinghan.shen@mediatek.com>
> ---
>  .../devicetree/bindings/pci/mediatek-pcie-gen3.yaml | 13 +++++++++++--
>  1 file changed, 11 insertions(+), 2 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

