Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31336C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Dec 2021 20:21:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wU3gDTF/eoK04NmfMjoTohBLn9XfYwvvEmqQp5y8jzA=; b=TLqmxGG+vpR9dO
	JhZRqzXEDXZtaJgBM61jBtVQ1lQ8VkzBsYh4LRyCdU1eNar//i6KVnWEauCmCuhAfHaUCaUJv9MfQ
	EkofJ9WBrlFez99K2Wl+ddX/fgCea1ni9Umum3lL6vzqQRWLGGTHNinM17+37Ef7H5Wi5bIE5w+aa
	3kDuG6MyCb+bvaROaxtDbWuRl+86bbmO2DF1n8TEshuyu1zQA6lg9EYoXId4RzLMNHH6bZjCuTagX
	32zkYtAw5aW+6PhXERvtOxCC/DAAixL2YJne0+m2cEkeaFZmlsvXLtzmrk2oFPRmgfMv4psWaesLv
	Rlia+dzA3gLEOzZshnvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mxamX-002b3P-E9; Wed, 15 Dec 2021 20:21:45 +0000
Received: from mail-ot1-f53.google.com ([209.85.210.53])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mxamU-002b2M-AD; Wed, 15 Dec 2021 20:21:43 +0000
Received: by mail-ot1-f53.google.com with SMTP id
 x3-20020a05683000c300b0057a5318c517so26223727oto.13; 
 Wed, 15 Dec 2021 12:21:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=RdIFuSso44hrhd8nXmN6Y3wbJps6MIRzHFW57KgL+Q8=;
 b=uStIOb6XZUZwtuwf7lsZMdTncUGPR8WTaV11peR2T5B6G/9fMglTAtuVqeZlbcC6lT
 iGo2N4JCapaMrs2x++lrg/Hnq3AjUiZRC+HK+qVmZsCPPJhk1uu1DoiooXXBw3olysZM
 245fv2SXP180z6Gp1I5D2oJwuiurbu65uXQjob/Rs6fo4oC6v0EFMR5+A7/XJ/0nnxhq
 ve0T3otkNgcffm7tZnHNiII00AoUpDw7p+/DSYQJA7O0Q9sdISQms5LdJJMbU8DVAsVz
 ntZYq3IkC0elQOxbBMsFA4fSr1IrzPS2wUC2DIEdLC+JmVmBARnvuRzEVa9wHKT4AmAf
 OMZQ==
X-Gm-Message-State: AOAM532ogAvHoPCNGryK/jeT8NiHZLEsVuyVCpewATg+oaVKulwT/rfG
 pfgJWKTsIfamCkeobB2XzQ==
X-Google-Smtp-Source: ABdhPJxGdUPqJQCMWMFcp5PgXBllnOaxCxFH1D3ewEYWT+NUYoyWaZoVi7w6Ws9a5AInQ8A2Bhx+Ow==
X-Received: by 2002:a9d:17cc:: with SMTP id j70mr9865104otj.313.1639599701365; 
 Wed, 15 Dec 2021 12:21:41 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id x13sm627605otr.58.2021.12.15.12.21.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Dec 2021 12:21:40 -0800 (PST)
Received: (nullmailer pid 1772584 invoked by uid 1000);
 Wed, 15 Dec 2021 20:21:39 -0000
Date: Wed, 15 Dec 2021 14:21:39 -0600
From: Rob Herring <robh@kernel.org>
To: Hsin-Yi Wang <hsinyi@chromium.org>
Cc: linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 3/4] dt-bindings: arm64: dts: mediatek: Add
 mt8183-kukui-katsu
Message-ID: <YbpOU0VL2SxJhSr9@robh.at.kernel.org>
References: <20211213162856.235130-1-hsinyi@chromium.org>
 <20211213162856.235130-3-hsinyi@chromium.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211213162856.235130-3-hsinyi@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211215_122142_375033_FB7C69DA 
X-CRM114-Status: UNSURE (   9.70  )
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

On Tue, 14 Dec 2021 00:28:55 +0800, Hsin-Yi Wang wrote:
> Katsu is known as ASUS Chromebook Detachable CZ1.
> 
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> ---
>  Documentation/devicetree/bindings/arm/mediatek.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
