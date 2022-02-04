Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35459C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Feb 2022 23:06:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Yyn+ffuXfNp9mTD+d5jDxTxdVoIgyTlA1aXLwGxfcF4=; b=KMhHlkVeA581Cj
	p1gvJ+6aYB53TdtmOLcDa/aw2htjU5xHsNk0yGQn8B12KymTobTrx8A0C+CtsvEAiKx2HuPlKueTX
	kMn15EU+AnVeCnlpeXJVqHmnD4CfMFmb/trCQw82f2iR1ZtfWIhCMSEmboOpX/ugH0c80rzFIu4hS
	3vyuqEFSUa7AP3qPHB8N737xzS2pspp2ciSYoMCgTa5yvgwqWJCVSKPFSThuSWr4jP9xrg+9q4H5e
	NxxXlBFckhjFNhwrZxF3xW4n12ny15NRts9nWUA5+O/Q9mVJnij/DjGKzBNlLEIPmKO+850wb9Mjp
	JjelJKZ2rv1FUNCzF70w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nG7f5-005hkq-7k; Fri, 04 Feb 2022 23:06:39 +0000
Received: from mail-oi1-f170.google.com ([209.85.167.170])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nG7bw-005gWZ-1V; Fri, 04 Feb 2022 23:03:25 +0000
Received: by mail-oi1-f170.google.com with SMTP id t199so10209115oie.10;
 Fri, 04 Feb 2022 15:03:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=HRBN3drX7LNP2CglYfthuDAO2TQ4Y16kM+T6H92Cb6k=;
 b=G9sqdug/Ium7wvrUBXVY/y28YjYx+dq+NEBfkWFTOWb7tzgFzuzFTCi1n1mybqqkzD
 AE70Q7sAH/aMu7GdP5QqW3c6oMfJJbzkJ954rdQY0xgm534HINLsXpoZyIABXWyHogx/
 KsSF7A0RlmvTWc0aqw6wKOHHNwpzzAGLiLYR3ug/agejdin8qtTXHSKMmxMAvkSvJtDr
 oj5StpucncDYh7FRXBxOV9wbFoZpzRR5kS9RgnCKzRTcSawBDo+gBv0jDGUnrbrtT9Ry
 mw3CAFEjUjzsiuQ3heBwBFVe0YwmwRtSw6j0Mvs8npkvaEwXjpTRvC5nmHPKMnM/aCVM
 LfZA==
X-Gm-Message-State: AOAM533vdQLyW8eaDrC3bQ7vALNxH/CHFXCCXvLy28kjJtbG19jgMTtR
 wWuR4pCDvdFN2C38Yi6v1g==
X-Google-Smtp-Source: ABdhPJxZGN8zUGqe8CCQFcnofv9zbGm8GHdE4O+DkLg3DuLzo4Ke7310tsAgwmT4loZ02k4nEVDyQw==
X-Received: by 2002:a05:6808:d47:: with SMTP id
 w7mr2519227oik.268.1644015802559; 
 Fri, 04 Feb 2022 15:03:22 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id l4sm1289993otq.50.2022.02.04.15.03.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Feb 2022 15:03:21 -0800 (PST)
Received: (nullmailer pid 3347992 invoked by uid 1000);
 Fri, 04 Feb 2022 23:03:20 -0000
Date: Fri, 4 Feb 2022 17:03:20 -0600
From: Rob Herring <robh@kernel.org>
To: Leilk Liu <leilk.liu@mediatek.com>
Cc: linux-arm-kernel@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
 linux-kernel@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-spi@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH V4 1/3] dt-bindings: spi: Convert spi-slave-mt27xx to
 json-schema
Message-ID: <Yf2wuML7yqiSUKqJ@robh.at.kernel.org>
References: <20220125012330.13449-1-leilk.liu@mediatek.com>
 <20220125012330.13449-2-leilk.liu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220125012330.13449-2-leilk.liu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220204_150324_133370_B44A0927 
X-CRM114-Status: GOOD (  10.03  )
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

On Tue, 25 Jan 2022 09:23:28 +0800, Leilk Liu wrote:
> Convert Mediatek ARM SOC's SPI Slave controller binding
> to json-schema format.
> 
> Signed-off-by: Leilk Liu <leilk.liu@mediatek.com>
> ---
>  .../spi/mediatek,spi-slave-mt27xx.yaml        | 58 +++++++++++++++++++
>  .../bindings/spi/spi-slave-mt27xx.txt         | 33 -----------
>  2 files changed, 58 insertions(+), 33 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/spi/mediatek,spi-slave-mt27xx.yaml
>  delete mode 100644 Documentation/devicetree/bindings/spi/spi-slave-mt27xx.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
