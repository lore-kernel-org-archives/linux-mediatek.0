Return-Path: <SRS0=95qJ=OR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE590C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Sep 2021 18:37:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A84B860FC0
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Sep 2021 18:37:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A84B860FC0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=isoRMwyQrwU28ia32KYvg/63hnTuQ/zfpzDDER45W8U=; b=KrX0jjMsN0ElPu
	XVlSzs8GLQaf2B7yfShDxx6DSIOjWnP56hdDfR98+SWQCNHJIujhC+JQHOMO4jZjxXTyHWaiDQjLX
	pn8asMcmNdRRl7fJNIKyF2tGlnABrFhJ9zSr7ou2hqKw5tlW/Z3eLvdwhRlubfYm19wQ26h74DQ9G
	5hkJObFoVaRO3wSa7yGAWEwMuoAJIJRxGlbVErqLho/DHPvUYJtgJuwP7oMv/hjOjIbNbd/Vp+Enh
	Lcaseof75LTxueHEIgF/dgaNVjZLjB1kwJ79ljB8kuYe9tQp8XZ2cB2HEhbYXKocERgoICpufqODX
	PqJbQVrSoBi8hrD2FjAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mUvVO-003nuq-5i; Mon, 27 Sep 2021 18:37:34 +0000
Received: from mail-ot1-f46.google.com ([209.85.210.46])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mUvVB-003nsx-CO; Mon, 27 Sep 2021 18:37:22 +0000
Received: by mail-ot1-f46.google.com with SMTP id
 c6-20020a9d2786000000b005471981d559so25681865otb.5; 
 Mon, 27 Sep 2021 11:37:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=SuxR2IvzQVEkyDLBWxJcO67m/+ONZAWmCGPQgvvSfpw=;
 b=F5+G117Q6OiPJhl5HyHSySju24zseJHcP8HWluReZ0CXLcXsDgAlNze1nXyXzbbBIL
 P/reQB0vbqAxMiosyZyaZ6SmOTOzCNHfOAMaEhFTbwwSV1cCepbYoT3wo4Qb/34w5fpB
 VL/AI8jmUkgEhRiVIRlTkR7QwsIbyvmpMYTXrvx/Vo4FURmjRgAaCbYohR6uGDANSd0T
 yD9NvIv00Z/h9JGeYfmT+SNePjvOlOFmvwkv/S14JvJJszQcxjNYINbGiehJkm/RKEhf
 ug+CaAXaFMvPgeuYLGmkZ/HAXZxxXIR1FIwFHximK0XIkytCTUsCsiz6NDmPY5xaI8PX
 koIg==
X-Gm-Message-State: AOAM532HRBCD8+dJgMJ6tmFqBmbRBuobuivL1cFB62MqWcddP9Xm9Hzl
 2lLm5qOe+tMooX7q3dL/Dd8YRlQgTg==
X-Google-Smtp-Source: ABdhPJwkRNJVkLd+tuErpymK7l2Tzio+zqB0FOLe74K9baG82pc39/nCxvdnmBx/hiPlkp7PuzHAfg==
X-Received: by 2002:a05:6830:25d6:: with SMTP id
 d22mr1379151otu.50.1632767840510; 
 Mon, 27 Sep 2021 11:37:20 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id p8sm4086338oti.15.2021.09.27.11.37.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Sep 2021 11:37:19 -0700 (PDT)
Received: (nullmailer pid 3610993 invoked by uid 1000);
 Mon, 27 Sep 2021 18:37:18 -0000
Date: Mon, 27 Sep 2021 13:37:18 -0500
From: Rob Herring <robh@kernel.org>
To: Miles Chen <miles.chen@mediatek.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Jason-jh Lin <jason-jh.lin@mediatek.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>,
 devicetree@vger.kernel.org, wsd_upstream@mediatek.com
Subject: Re: [PATCH] dt-bindings: mailbox: fix incorrect gce.h file paths
Message-ID: <YVIPXvjcfHg1uZ+6@robh.at.kernel.org>
References: <20210922070845.5108-1-miles.chen@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210922070845.5108-1-miles.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210927_113721_442875_BD348EB6 
X-CRM114-Status: GOOD (  11.19  )
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

On Wed, 22 Sep 2021 15:08:45 +0800, Miles Chen wrote:
> A few *gce.h file paths are not in 'dt-bindings/gce/<chip>-gce.h'
> format. To fix it, replace 'dt-binding' with 'dt-bindings'
> 
> Fixes: 0553fb51686e ("dt-bindings: mailbox: add definition for mt8195")
> Signed-off-by: Miles Chen <miles.chen@mediatek.com>
> ---
>  Documentation/devicetree/bindings/mailbox/mtk-gce.txt | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Applied, thanks!

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
