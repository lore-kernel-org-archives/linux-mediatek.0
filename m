Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFA78C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Feb 2022 03:35:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yyKyTZQ31cgiMD5ZwNr2j0pdacLczVCpGRrnq5TNqQc=; b=ZHd3ScdUCHLjLx
	2G+FGdUHEa7rvrQdbrV+1ThfkwGKmk0HZ3UUqVQpgzAB0xE9hYwIPHDQhaEik/CvwUVDOAiVX8eEO
	jCwhJFZi37ZvQK5CUNT6cFmkvRz/k8Wv1HPhFFXX9RWaJmHMnm16QC7GD47kh6mJC74YkH47Q2RTX
	zmzGDjhMkn8E6I+vcHW1PeqjY8m9kJNcPosgb9ZYEXYCRjCA/3O6rBbaoUFpPIRJgGsECeMYoQbp/
	kP4M+L7FYwczbIZoEY8LGCLhftcxYEmDYVs0ugupWQ22+B1hCMKNCYus057zQecmksnH47y9T5LlZ
	QStZIzDttNCPIGVA+/3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nHdlj-00G8g5-RT; Wed, 09 Feb 2022 03:35:47 +0000
Received: from mail-oo1-f46.google.com ([209.85.161.46])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nHdlU-00G8cX-BX; Wed, 09 Feb 2022 03:35:33 +0000
Received: by mail-oo1-f46.google.com with SMTP id
 o128-20020a4a4486000000b003181707ed40so1017381ooa.11; 
 Tue, 08 Feb 2022 19:35:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Ua8yzWuBZ3Q29vbdd20GEsasq9Yt7O844bjqRtO+wJI=;
 b=hKX1AMo6yfQsKN24TYVTN0PSM1lnnwwztlgF1oR1ASUzqaYCyN68YsqBg3FxZK90WJ
 oGpsdNoCf6SctVya3UMCGaEnmhDkMoOl+SYeV2J6gxxMVhWM0+28QU4wDxj22P3FfDu4
 VsIokQDGqK2SL06szJu1UulznciZAMiBFTu99GXRin3HUXOO1INFOqyA5MxxwICMxksj
 9ravQVRkxBgfU5DmKdofE7WX3+UYrP5MxAQUa6fpy0587sAruEk4AhJov0ipBHSztsFf
 /GiERE/PFKKwaT7qENVXwiyKdv7gfZ3xk7wN4DmRtI3B4WIRen7LpSY0MPm6WL/VS6R9
 zb0w==
X-Gm-Message-State: AOAM530AhSYw0yp2etjMGRgdy0tDkT73KY+YIYrUHJ6D+IqM3Pht8w4s
 QapntrTrQ++fC9GhPfpAlQ==
X-Google-Smtp-Source: ABdhPJwklbn1MIZs1/9RclzK3S7SlJx6e1DOtC9O6gHsNTCdMxHh0O0KRUuHoqfzQbEnwz7S4bpX7w==
X-Received: by 2002:a05:6870:5146:: with SMTP id
 z6mr147799oak.52.1644377731646; 
 Tue, 08 Feb 2022 19:35:31 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id s3sm6113168otg.67.2022.02.08.19.35.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Feb 2022 19:35:31 -0800 (PST)
Received: (nullmailer pid 3591177 invoked by uid 1000);
 Wed, 09 Feb 2022 03:35:29 -0000
Date: Tue, 8 Feb 2022 21:35:29 -0600
From: Rob Herring <robh@kernel.org>
To: Biao Huang <biao.huang@mediatek.com>
Cc: Mark Lee <Mark-MC.Lee@mediatek.com>, linux-arm-kernel@lists.infradead.org,
 Fabien Parent <fparent@baylibre.com>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Felix Fietkau <nbd@nbd.name>, devicetree@vger.kernel.org,
 Macpaul Lin <macpaul.lin@mediatek.com>, John Crispin <john@phrozen.org>,
 Jakub Kicinski <kuba@kernel.org>, linux-mediatek@lists.infradead.org,
 srv_heupstream@mediatek.com, Matthias Brugger <matthias.bgg@gmail.com>,
 netdev@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
 David Miller <davem@davemloft.net>, Yinghua Pan <ot_yinghua.pan@mediatek.com>
Subject: Re: [PATCH net-next v2 4/9] dt-bindings: net: mtk-star-emac: add
 support for MT8365
Message-ID: <YgM2gb7mqZAwmigt@robh.at.kernel.org>
References: <20220127015857.9868-1-biao.huang@mediatek.com>
 <20220127015857.9868-5-biao.huang@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220127015857.9868-5-biao.huang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220208_193532_422919_A47CE128 
X-CRM114-Status: GOOD (  10.37  )
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

On Thu, 27 Jan 2022 09:58:52 +0800, Biao Huang wrote:
> Add binding document for Ethernet on MT8365.
> 
> Signed-off-by: Biao Huang <biao.huang@mediatek.com>
> Reviewed-by: Bartosz Golaszewski <brgl@bgdev.pl>
> ---
>  Documentation/devicetree/bindings/net/mediatek,star-emac.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
