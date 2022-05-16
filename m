Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E2A9C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 May 2022 16:25:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TRqQseqIDy0i3ymg4Pl939OGN0ZX/cGHtYMsu6lA3bc=; b=Lxyjuk1/acHoAy
	wLtuR4BC9kfg8ovJlHfeln9UcLCgF9nWJ7T6xnD6O71TILFSH9RRidmlUUpEIldqCzbJdpyqgKZPn
	d4Jmmh+Lxs6FGE64H+aYiyAIFaHHKuIvhuJAK3UCyHSth4txZG6BmC1UNfhf4cqjmupOwmVrftbRx
	UpvNBizRshCArCLAcmaa2OU6CNidys1j66+sXGpy3QPWfe9eV7m4ir8maVrAAbLjl8Hd+63LckoNB
	5RT24it/sFOBrPfnmJaMyf+uCWi//GRo3i5rsy7TyTC3KFoTRCjerb6ysweOq44WFaKmHek2fo5WK
	BgRybAs86dMiMqqaFTRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nqdXP-008xrh-Qj; Mon, 16 May 2022 16:25:39 +0000
Received: from mail-ot1-f47.google.com ([209.85.210.47])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nqdXC-008xjI-Hl; Mon, 16 May 2022 16:25:27 +0000
Received: by mail-ot1-f47.google.com with SMTP id
 y14-20020a9d460e000000b00605ee347da1so10407737ote.8; 
 Mon, 16 May 2022 09:25:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=K5njaV69c/xpUdcIluz+60lzV8MqdGOZB2Dl54ng57I=;
 b=qquIcpkIPS25Nq0hTl+mJ1+5/fwDCCWEPQrjIeQI7lmaqiG0ulTNv/mb+F/nK716Ps
 HAuREK6pY3qKoaMezdShbPJWZwjuMM6tJbArwcyIv3jbAa6HVOTDAaekQwebMsyeCsu8
 YClYx63LTwmosCF2PRFyAJo2fxLYKwVBeyMXQBsE18salC/7U8JAez+t7UHrGwRuk1Zr
 Orq3kuepbemXzJJ5+pRXx6hYDIrUIgsh7j0Tf4AVggAGgZ52Znk/0Z4PjIbNb+WSANUR
 kWbl1s4TpHa82wQA3JpN0pYc2KfJodjb63r0vAzjFtZbQ8PBNwvT1nDUYhSX2oK6lR2y
 3h9g==
X-Gm-Message-State: AOAM532C/WJUOwnaG+42iViCQrotJPHvOI2fCTSkBQxBp0f6BPSu8bi9
 /DCmhu+rWDfktFlvwrWFLZDwoeYdZg==
X-Google-Smtp-Source: ABdhPJxjRAZExXDXIcmckfL11VmInJI+EIKA0G0IRSMqE7F83ThjrKdv3SpNxwvw1tbseXG+V7GGvw==
X-Received: by 2002:a9d:740b:0:b0:606:21eb:8f93 with SMTP id
 n11-20020a9d740b000000b0060621eb8f93mr6427106otk.330.1652718324452; 
 Mon, 16 May 2022 09:25:24 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 u30-20020a056871009e00b000e686d13883sm5467949oaa.29.2022.05.16.09.25.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 09:25:23 -0700 (PDT)
Received: (nullmailer pid 2789731 invoked by uid 1000);
 Mon, 16 May 2022 16:25:22 -0000
Date: Mon, 16 May 2022 11:25:22 -0500
From: Rob Herring <robh@kernel.org>
To: Gene Chen <gene.chen.richtek@gmail.com>
Cc: devicetree@vger.kernel.org, lee.jones@linaro.org, pavel@ucw.cz,
 gene_chen@richtek.com, linux-arm-kernel@lists.infradead.org,
 krzysztof.kozlowski+dt@linaro.org, cy_huang@richtek.com,
 linux-kernel@vger.kernel.org, matthias.bgg@gmail.com,
 linux-mediatek@lists.infradead.org, robh+dt@kernel.org
Subject: Re: [PATCH v2] dt-bindings: mfd: Add bindings child nodes for the
 Mediatek MT6360
Message-ID: <20220516162522.GA2789107-robh@kernel.org>
References: <20220516062127.99647-1-gene.chen.richtek@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220516062127.99647-1-gene.chen.richtek@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220516_092526_622591_0C918BF9 
X-CRM114-Status: GOOD (  10.68  )
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

On Mon, 16 May 2022 14:21:27 +0800, Gene Chen wrote:
> From: Gene Chen <gene_chen@richtek.com>
> 
> Add bindings child nodes for the Mediatek MT6360
> 
> Signed-off-by: Gene Chen <gene_chen@richtek.com>
> Link: https://lore.kernel.org/all/YmqTzlrVL5KaVPuz@robh.at.kernel.org/
> ---
>  .../bindings/mfd/mediatek,mt6360.yaml         | 189 ++++++++++++++++++
>  1 file changed, 189 insertions(+)
> 

As the dependency is in my tree, applied, thanks!

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
