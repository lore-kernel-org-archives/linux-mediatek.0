Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08C36ECAAA1
	for <linux-mediatek@archiver.kernel.org>; Mon, 31 Oct 2022 14:43:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w+B+bKwkZajw9wqTsexpQ+swmijNJ09uQIWw31o7PxQ=; b=3eFhMEoEtfOLl84x/9XUoudIj0
	6nrzd/5x+phwlJCu63mG+nanah8DJpQO+D/3TOx8rV8LQ1gWfwG8Oh6YmsHtVq6DIraa5H5z4331U
	oVdzGdCpeKMBZUSJQ32TafHqX+0zet5SF/WD6mdfgI4GCp1BI8gNHD/o4n0cfq2S0ePCwmqWBJZfP
	jLRZyXNnpEskkjyGCEP9y3b5P8kBD0CiGibygYNb4UF8gqKGZgz+OkQpyJnHx7mOTkntBFuJITyL0
	UFfm9YhNscgUTkuQw5UmigpbNMCce6Ym5KUOYLOCPXkIUrnORzmiZJ/cxeKmfKOsqpYstBqTKex0j
	RZG8XAVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opW0J-00CKmM-3C; Mon, 31 Oct 2022 14:43:07 +0000
Received: from mail-oa1-f45.google.com ([209.85.160.45])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opW0G-00CKlG-Ts; Mon, 31 Oct 2022 14:43:06 +0000
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-1322d768ba7so13681060fac.5;
        Mon, 31 Oct 2022 07:43:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w+B+bKwkZajw9wqTsexpQ+swmijNJ09uQIWw31o7PxQ=;
        b=EnIWXiTp9roLIcVt1dU6em0PeIJ3EDcwSDlJTzJ3C3mCCM5bKt1FCCWPxSMSpwASh2
         MLpdWyjrcNxcjTSbI39lkDD3UxoZewLi5xxMC0xysBFz1aqMTz9ArJKgHKtlE1qJuTZp
         tN7tX+E0W9FcRZsOsjAaR2RZD5iVUSUiLrEq3r4q/EUqAvWy/OZtUiVNpiYohA1QcjOH
         8AIm3eDQuREaNvJ9mI0dZEkl2KQALJPFU/l8iXeLJq0g+F6v/e9Yc1RC6xvjYtnX/YJ0
         Jn5pmaD9Ut/xizIjLZCTQwDAAUj21IDLxTUE7BBfk9Wp6oNowsEKQxv6Q97maPRDXbQd
         TRtg==
X-Gm-Message-State: ACrzQf12e8gTE8RA55NhAP59U07PbnJaWJY1LQn9l0FYVWWV4VN3v1sF
	22KRLfU9rsXB6I0DkzMCOXoPLDrI1g==
X-Google-Smtp-Source: AMsMyM6r3n78WWlzNtMmHub5yrpP5yHb6caca/SxmRCN8GdJrio1xlSLZskM2+oZwdb8CDa0AodveQ==
X-Received: by 2002:a05:6870:c88d:b0:137:11e7:12e9 with SMTP id er13-20020a056870c88d00b0013711e712e9mr7713557oab.220.1667227380162;
        Mon, 31 Oct 2022 07:43:00 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id g10-20020a4a250a000000b00480fd5b0d6bsm178938ooa.22.2022.10.31.07.42.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Oct 2022 07:42:59 -0700 (PDT)
Received: (nullmailer pid 2857339 invoked by uid 1000);
	Mon, 31 Oct 2022 14:43:01 -0000
Date: Mon, 31 Oct 2022 09:43:01 -0500
From: Rob Herring <robh@kernel.org>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: linux-mediatek@lists.infradead.org, Ryder Lee <ryder.lee@mediatek.com>, Jianjun Wang <jianjun.wang@mediatek.com>, Bjorn Helgaas <bhelgaas@google.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 1/2] dt-bindings: PCI: mediatek-gen3: add SoC based
 clock config
Message-ID: <20221031144301.GA2856406-robh@kernel.org>
References: <20221029175806.14899-1-frank-w@public-files.de>
 <20221029175806.14899-2-frank-w@public-files.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221029175806.14899-2-frank-w@public-files.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221031_074304_983852_AF294A71 
X-CRM114-Status: GOOD (  13.50  )
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

On Sat, Oct 29, 2022 at 07:58:05PM +0200, Frank Wunderlich wrote:
> The PCIe driver covers different SOC which needing different clock
> configs. Define them based on compatible.
> 
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> ---
> v2:
> - fix typo in mediatek,mt8192-pcie
> v3:
> - remove contains to match only if compatible is no fallback
>   tested with series "Add driver nodes for MT8195 SoC" and mt7986
>   pcie-nodes, dtbs_check is now clean
> ---
>  .../bindings/pci/mediatek-pcie-gen3.yaml      | 47 ++++++++++++++-----
>  1 file changed, 35 insertions(+), 12 deletions(-)

Reviewed-by: Rob Herring <robh@kernel.org>

