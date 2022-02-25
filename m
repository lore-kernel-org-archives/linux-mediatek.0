Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46638C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Feb 2022 16:28:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B/0pyDjnv1xBqboYSLy7PUi6IEU2pZMKU5VKCdiMwNE=; b=kLet46PFYnFcA1
	oo/xlomX0bzpTFpcnOgTN/3Qehba19nlUk8ngk90G8YdB9u9EHIC7/7HazYgMOV05Z+GmxUIU+Hg/
	7uzbxVamDjCGjQ/I2/wGeMhlVCL3U5X34DSppOeETqDwebxVuMZFtm6Phy/lf0ETIkP0PpJFxUz9h
	7o84w/KfxIdvCtoKDdGgZErz4D9IjbeYnub6PU3Mr2Sia9t58VYeuOlOw0MvezPtkRrgSqTLQr0Yf
	eGZnv4Ox06t8a0ij794BZ85qwKHnRZz6Ha3nPdk5j+Dv2Ot7YGrhfdY/+CQm0Utr9+UlPs8G5F2jH
	oZzjwwONIlAkJzknVBDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nNdSZ-005uxX-E9; Fri, 25 Feb 2022 16:28:47 +0000
Received: from mail-oi1-f176.google.com ([209.85.167.176])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nNdSX-005uuO-GH; Fri, 25 Feb 2022 16:28:46 +0000
Received: by mail-oi1-f176.google.com with SMTP id l25so7929933oic.13;
 Fri, 25 Feb 2022 08:28:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=2/qpEObgS3Mrx6MTCn9DFV0A8DvCbIfP/OPe4aJKhsA=;
 b=cTpNGpOwF9itWsJiYXDnDbCK+HXgGBuwWediMwEyjY2XaGmvRKGjuoWu+SoX3yrYqt
 LcIke7E9JGxn81TiQZx0UP+RxK4F+4ZvxkgMq1uX1+f2G2M2wdEYFaW/93zVl7cGDNBy
 fGZOhwgHtd4IdXPdnnCPWLWH0gdmKdGj/mvts9Z5Js7p2ldYpkK8Lx9n/gQZV+e7Ekl1
 YWLFSlH/GgHUf5212TAxrRA6aeCB6tAPWQZ1tf4Tf1lAXjVxkMQvsPv1Jaq4a4x1Vvwf
 vH8vE4GXWscrBiN0QQ2G7C0I/NlN7ObSv23ykM0hyuWREL+3CIGNiTYOKMtc4vREbhKQ
 208Q==
X-Gm-Message-State: AOAM531qLbpmtTS8bBbAp3vXZPBNT0TODI4VddNvEPNpIWCxZXqqCHod
 56j3+dVq+ektmhD5SZHoyw==
X-Google-Smtp-Source: ABdhPJz6HE/6y2WBKz5LNahiBbqbjozKHG6vhfmf6HiNlePZxR7q6dbdvITWPJqYK8tAZj89258umQ==
X-Received: by 2002:a05:6808:15a9:b0:2d4:5775:d06a with SMTP id
 t41-20020a05680815a900b002d45775d06amr46770oiw.138.1645806518218; 
 Fri, 25 Feb 2022 08:28:38 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213]) by smtp.gmail.com with ESMTPSA id
 n22-20020a056870e41600b000d6d4ac3c64sm1296488oag.39.2022.02.25.08.28.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Feb 2022 08:28:37 -0800 (PST)
Received: (nullmailer pid 1042574 invoked by uid 1000);
 Fri, 25 Feb 2022 16:28:35 -0000
Date: Fri, 25 Feb 2022 10:28:35 -0600
From: Rob Herring <robh@kernel.org>
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Cc: Chunfeng Yun <chunfeng.yun@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-mediatek@lists.infradead.org, Min Guo <Min.Guo@mediatek.com>,
 Hsin-Yi Wang <hsinyi@google.com>, linux-arm-kernel@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH] dt-bindings: usb: mtk-xhci: add compatible for mt8186
Message-ID: <YhkDs9FUlGNl473i@robh.at.kernel.org>
References: <20220216120025.29860-1-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220216120025.29860-1-allen-kh.cheng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220225_082845_558538_C433A267 
X-CRM114-Status: UNSURE (   9.99  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, 16 Feb 2022 20:00:25 +0800, Allen-KH Cheng wrote:
> Add compatible for mt8186
> 
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> ---
>  Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
