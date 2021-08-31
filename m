Return-Path: <SRS0=bg5C=NW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F64BC432BE
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 Aug 2021 22:09:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D89176102A
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 Aug 2021 22:09:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D89176102A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vWaNBO0yNLxuHLyes11vJ3LTNwqVvL4SzoVOJ/SnBtg=; b=k1ablyOrVHMdx1
	tw0sS7CNbcpgMnnR4YDrjEE9XQkgLZHBnG5CwmqnvCkqa8WY9LPxnW3MncAiLye4kle9NtRx1+BeF
	7OvE2bNao/1taGifYAPI+RgAIAIbNsqOdj+1/gbC669/lFwTJWZ+VIcTZtaZlA/R5iDe6NJ2sUKsI
	q8YbiMkTZXU6vLsOYc9EpN+6t3dvHMMK0QHMYevPAfky+oHsfZ3PC7yjjPnZCLebjnxpJKKFK4tzy
	MW3qofVsD9+8DBg9P8lLPIuDN9u7+5Tlqn68/D/CdAd10za6OkCPYCYSeGlJsg74q6e63x4gJOCiT
	8L84QOB0v3ejq/KfVSzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mLBwt-003Hx8-IR; Tue, 31 Aug 2021 22:09:43 +0000
Received: from mail-oi1-f170.google.com ([209.85.167.170])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mLBwq-003HwM-SM; Tue, 31 Aug 2021 22:09:42 +0000
Received: by mail-oi1-f170.google.com with SMTP id u25so1186015oiv.5;
 Tue, 31 Aug 2021 15:09:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=HmcikI+VA0QWzI/qoUl+fgTIxA58N+W9f1DbteKD1V8=;
 b=mojAHt6qvN/kNh73kqZBEEUb+sTPgAAamoqOMO6Ylm5x67y4eXlhC4kqw/fVlZQrIR
 9nL7endnJ19VAWNODJeZY+P+aU69hO2rVnIU4kA+6Q3Yz1BBENrb0i/A7f5QsqoQE1dV
 JkSy31/XYVwu0crVxgknuNmi2Ff0a/LrSltm6nQEiwP6SWsszlIFacYYtdhUy5jTosp5
 9Lz00kJr3h9cim3jWxLpOYDHnwj+rEBIdldV6jr+2FjKfPxdghQJ1Fe6hKHtv0Noyy2c
 mQgTz5sK1Z1YGHve1F/9kQ4TTBasHctHSx8gjX8Y8u1HOMHKv3FvAqWEkl6l6Fg8jTCk
 R4fQ==
X-Gm-Message-State: AOAM532arrw/PVtVm9U5QIAe9/ZbQCvod/7y6vbCXeFWuAtp1mG54jBc
 tuPvzjPX6mxKfl88c61NkQ==
X-Google-Smtp-Source: ABdhPJx82+Qn2N1AOPfd4yPM8R+IFiObvLLyMQ4j+UpyO87vSVMNNDAUlqu/L4TPpkcu9FUWchm5qw==
X-Received: by 2002:aca:be56:: with SMTP id o83mr4847542oif.51.1630447777584; 
 Tue, 31 Aug 2021 15:09:37 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id y66sm3900548oia.12.2021.08.31.15.09.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Aug 2021 15:09:36 -0700 (PDT)
Received: (nullmailer pid 730620 invoked by uid 1000);
 Tue, 31 Aug 2021 22:09:35 -0000
Date: Tue, 31 Aug 2021 17:09:35 -0500
From: Rob Herring <robh@kernel.org>
To: Zhiyong Tao <zhiyong.tao@mediatek.com>
Cc: biao.huang@mediatek.com, devicetree@vger.kernel.org,
 eddie.huang@mediatek.com, sean.wang@mediatek.com, mark.rutland@arm.com,
 light.hsieh@mediatek.com, srv_heupstream@mediatek.com, matthias.bgg@gmail.com,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 seiya.wang@mediatek.com, hongzhou.yang@mediatek.com, sean.wang@kernel.org,
 linux-mediatek@lists.infradead.org, robh+dt@kernel.org,
 linus.walleij@linaro.org, hui.liu@mediatek.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v11 1/4] dt-bindings: pinctrl: mt8195: add rsel define
Message-ID: <YS6onwnr4Lo8VPDA@robh.at.kernel.org>
References: <20210830003603.31864-1-zhiyong.tao@mediatek.com>
 <20210830003603.31864-2-zhiyong.tao@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210830003603.31864-2-zhiyong.tao@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210831_150940_941860_019E74DF 
X-CRM114-Status: UNSURE (   9.86  )
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

On Mon, 30 Aug 2021 08:36:00 +0800, Zhiyong Tao wrote:
> This patch adds rsel define for mt8195.
> 
> Signed-off-by: Zhiyong Tao <zhiyong.tao@mediatek.com>
> ---
>  include/dt-bindings/pinctrl/mt65xx.h | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
