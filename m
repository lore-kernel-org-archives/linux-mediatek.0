Return-Path: <SRS0=tEpm=NI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D34A3C432BE
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Aug 2021 20:34:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9146F6103A
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Aug 2021 20:34:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9146F6103A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YKGJieUYOyMO2C7SF0EYEGGPLN3ZnJSLMS4IW/eYE0g=; b=TW9vfgXMI9QAqn
	FWTQ80iVp/mdCIeDDIjGcGsOnq/Z8hVIynkuf4GJ4zHdDS72EcZ1SYbwJ/7YIaUDR+BZNCDIxfuRJ
	WDEkOAABfN+9WwMPzX0KjyiK7zHNatkga9igyWtDDWmsZlwripFhDPLImabO+AwR3G/a3qTw58ftg
	ERxdpsSiyaWHSH1WQWSAQt5fsWLkILgj4N8BDF8TMTIggCIDDxEjZ9W8vA6E94BQVW4eHtcPnXkVl
	z9RJflREUVqatt2pVvqZm3P3/exThBI0YrkeOJj02nQP03Xi4x3pmnHxcxrVocbx+Z0n6C/z8CUFo
	UBh2baVnIGBNJHY+upNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mG5mX-003SZj-4Y; Tue, 17 Aug 2021 20:33:57 +0000
Received: from mail-ot1-f45.google.com ([209.85.210.45])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mG5mI-003SXV-5G; Tue, 17 Aug 2021 20:33:43 +0000
Received: by mail-ot1-f45.google.com with SMTP id
 108-20020a9d01750000b029050e5cc11ae3so26418349otu.5; 
 Tue, 17 Aug 2021 13:33:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Qk6NGp+xE9TOP3LguIONlFmciWZ7grkB7B+J2N/IzfI=;
 b=XBSZ3FoCWW7RlVRn6Ne9Ocfih3qgsw1/mmWrfSlYkf18iCntZ5wQr5/xvYG2h8r9Qh
 iUk9BCc5JF2eslegwIdxsfYCgM9irvGGzCah4zh9Zh9ko+1Fo5VHYBVO+CcXSQoVL2/6
 JH8Y2aAlXxPV+KlcYVjCcIgEXs3+DxrOfmTyjB1rB0k3g22mnbkYcLfJfZ5x15U2qrtG
 wawewQkj6fiBLzR0DEGDVG4pKPyJGbc6fpdpA9bPIw2osbEvLhYxeLrWppKj8hfnDTRG
 xoycud5ssijh43LKW2lOGrsXJv5w5973E35ZgpESxDdBFsfHjHpyzQ8cbmZ64BCxP9HJ
 6g2g==
X-Gm-Message-State: AOAM532muR7X4fPfaTgf04Zb+MChmNBHDIyYMsO/IXIwl1SmZ68vFiKt
 tiyuP+NSKtl0FPUVs2MuHA==
X-Google-Smtp-Source: ABdhPJyz9ZLACKFVCFOlx9kgV8DMkNjlz3yzfdPCFXr/Q6uhyAKnR/Oq/0tiJKDwIGxRSNPOgxES1Q==
X-Received: by 2002:a9d:7416:: with SMTP id n22mr1780224otk.309.1629232421572; 
 Tue, 17 Aug 2021 13:33:41 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id n9sm589559otn.54.2021.08.17.13.33.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Aug 2021 13:33:40 -0700 (PDT)
Received: (nullmailer pid 791869 invoked by uid 1000);
 Tue, 17 Aug 2021 20:33:39 -0000
Date: Tue, 17 Aug 2021 15:33:39 -0500
From: Rob Herring <robh@kernel.org>
To: Yunfei Dong <yunfei.dong@mediatek.com>
Cc: Tiffany Lin <tiffany.lin@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Tomasz Figa <tfiga@google.com>, George Sun <george.sun@mediatek.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Alexandre Courbot <acourbot@chromium.org>,
 linux-arm-kernel@lists.infradead.org,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 linux-mediatek@lists.infradead.org, Irui Wang <irui.wang@mediatek.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Fritz Koenig <frkoenig@chromium.org>,
 Hsin-Yi Wang <hsinyi@chromium.org>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
 srv_heupstream@mediatek.com, Tzung-Bi Shih <tzungbi@chromium.org>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5, 05/15] dt-bindings: media: mtk-vcodec: Separate video
 encoder and decoder dt-bindings
Message-ID: <YRwdI7GcPofoSube@robh.at.kernel.org>
References: <20210811025801.21597-1-yunfei.dong@mediatek.com>
 <20210811025801.21597-6-yunfei.dong@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210811025801.21597-6-yunfei.dong@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210817_133342_249988_D040B725 
X-CRM114-Status: GOOD (  11.75  )
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

On Wed, 11 Aug 2021 10:57:51 +0800, Yunfei Dong wrote:
> Decoder will use component framework to manage hardware, it is big
> difference with encoder.
> 
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> ---
> v5: no changes
> ---
>  .../media/mediatek,vcodec-decoder.yaml        | 175 +++++++++++++++++
>  .../media/mediatek,vcodec-encoder.yaml        | 185 ++++++++++++++++++
>  .../bindings/media/mediatek-vcodec.txt        | 130 ------------
>  3 files changed, 360 insertions(+), 130 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek,vcodec-decoder.yaml
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek,vcodec-encoder.yaml
>  delete mode 100644 Documentation/devicetree/bindings/media/mediatek-vcodec.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
