Return-Path: <SRS0=iI7F=FL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1435FC4361B
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Dec 2020 21:16:12 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CC5BE207F7
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Dec 2020 21:16:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CC5BE207F7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=2kY7BK/GY0MsJWqABwuRMu1zVZUCOfBOIUIuOz3yVgE=; b=EeelZHUblpNRsyFGef95WZ8LE
	Ynkig+Qpc17lOyXELBuwRC8MnQK2xq7kq49mX49CixPsf49whGue1bWxrh2+TfikPwTvqzBrCYGT7
	7JkzYyPHw2OoUm4p5VmAw6AkKGcSBEHLgH3WrF0q5iR6gkupWNhtVplu+HL8V0JocgExX1vYDFyoh
	ZDI7yqdmdC6VaeOfszmVC0hveNauDcJ68TW2sVjyTWuiR03rffEy+n7GIeKYeTmBqpTMXK59dufA+
	YZxMCJWRLOvVRCMG6YeWRf9PPGAcVBb89Zt7cTZ9p8N7rRPurUp4sHzFCymq6o85etarvEiw8PEaT
	7Tok56brA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmNrV-0004bl-BT; Mon, 07 Dec 2020 21:16:01 +0000
Received: from mail-ot1-f68.google.com ([209.85.210.68])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmNrQ-0004Zo-Ul; Mon, 07 Dec 2020 21:15:57 +0000
Received: by mail-ot1-f68.google.com with SMTP id f16so13880267otl.11;
 Mon, 07 Dec 2020 13:15:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=rSAFkhpNJQAuz9y5dju0W7uXjODyDSx6iiAnGJorzFE=;
 b=oJhKPmDP339RYj3+Y22c7j0vmxNnqlk2+mCY/U9nviCGSDS/F/bhsb5NYb3JjHS7dz
 QLjjrsIZjvxlpkdYd92i+087OuukrpSu8lhnIFE9cZovl2FsbJldoKDJ6IxDtdRVRjyD
 /t0Q+pwMTYb0OxUlu+gW7+puljCKZ/3AquUPwEwLUDb+m8pY9sKeOcoyMFhObtwE04NM
 Da00Aa4UfbYqxN4bFLB7IquJFLshBTdQYs3F80JLNSZaH74vnGZLjf58W6VjyNHCP2v+
 2zwM9Er7ph8v49dRwbVSIZ8UhqpFK59wNug1YTXOwdROOfatSkTgLf43jYRwNLEsU1N4
 OmZQ==
X-Gm-Message-State: AOAM5309rlNPJn0ZqdQ6t1OfRK+00vs83mlgWBEuOadD4FEpwud4Fy5V
 O18xUjdW+Ojux/FTxqypJA==
X-Google-Smtp-Source: ABdhPJxQpESfvNGlJAqwTMytNEER2nkmsXBzu8vhDgGPWF4PCnXOQyEU6ub0eGzupCQoCYrmNFRMlQ==
X-Received: by 2002:a05:6830:128a:: with SMTP id
 z10mr14708659otp.3.1607375754577; 
 Mon, 07 Dec 2020 13:15:54 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id b28sm2878493oob.22.2020.12.07.13.15.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Dec 2020 13:15:53 -0800 (PST)
Received: (nullmailer pid 838684 invoked by uid 1000);
 Mon, 07 Dec 2020 21:15:52 -0000
Date: Mon, 7 Dec 2020 15:15:52 -0600
From: Rob Herring <robh@kernel.org>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: Re: [PATCH v3 03/11] dt-bindings: phy: convert phy-mtk-xsphy.txt to
 YAML schema
Message-ID: <20201207211552.GA838655@robh.at.kernel.org>
References: <20201118082126.42701-1-chunfeng.yun@mediatek.com>
 <20201118082126.42701-3-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201118082126.42701-3-chunfeng.yun@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201207_161557_091150_599FA257 
X-CRM114-Status: GOOD (  13.44  )
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, netdev@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Kishon Vijay Abraham I <kishon@ti.com>,
 Serge Semin <Sergey.Semin@baikalelectronics.ru>, Vinod Koul <vkoul@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Min Guo <min.guo@mediatek.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Stanley Chu <stanley.chu@mediatek.com>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, 18 Nov 2020 16:21:18 +0800, Chunfeng Yun wrote:
> Convert phy-mtk-xsphy.txt to YAML schema mediatek,xsphy.yaml
> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
> v3:
>   1. remove type for property with standard unit suffix suggested by Rob
>   2. remove '|' for descritpion
>   3. fix yamllint warning
> 
> v2:
>   1. modify description and compatible definition suggested by Rob
> ---
>  .../bindings/phy/mediatek,xsphy.yaml          | 199 ++++++++++++++++++
>  .../devicetree/bindings/phy/phy-mtk-xsphy.txt | 109 ----------
>  2 files changed, 199 insertions(+), 109 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/phy/mediatek,xsphy.yaml
>  delete mode 100644 Documentation/devicetree/bindings/phy/phy-mtk-xsphy.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
