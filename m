Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76F64C6FA82
	for <linux-mediatek@archiver.kernel.org>; Fri,  2 Sep 2022 18:19:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KW4nmJxC2UWMUp990Fkr+YzerSKZovQARWrLIEvTTQE=; b=CIxLsCyGqT8deBtkoaB301xIfl
	t2rYu7rwhbaac6vDTWqaf0j6ZFnH5cdBvmhshBCnVi2mr9IXy7B6Ecubm+UIjxzoxfFWiVI53yTRE
	dDf1XXLNuAeH1ogHKGihq6SnbdiAEC7emqZ4ivGIUzZuSNL/P8p2GCJbuHrf8xxwISX2Hg/19MK9M
	nJWng66uILB5UZShHybCNR3VueuIZQJLXwnpYwlwCYFacBcQ9cPkE/E+Fb4+q4PzLEA/CWJZzJdIU
	7ysAxlVN1m82j+fwX+TLhJf6m+3mdWgcD/JRY3kap6EadIZTZstDF47+vzBSMQ5PzRJkYdeX4ubAp
	koZP3Fmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oUBGI-009FbP-Q7; Fri, 02 Sep 2022 18:19:26 +0000
Received: from mail-oa1-f44.google.com ([209.85.160.44])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oUBGG-009FUs-Bh; Fri, 02 Sep 2022 18:19:25 +0000
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-11eb44f520dso6654930fac.10;
        Fri, 02 Sep 2022 11:19:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=KW4nmJxC2UWMUp990Fkr+YzerSKZovQARWrLIEvTTQE=;
        b=59J0S4sl6WIAJdH7smI4WlMRQiImvZ3SJsLK/++9WuJ9bjCLXhRmbJlBB3HA1gUCNk
         SFy/bmc8y15QfKUh+FXomyUd9zWtbp1+taTgsBKYkJfrYpyKraSpdWOr+tyyIVQGjb0W
         OClqul44AmLcnZMfUPYIp/6nJxNUL7qwDRvhNoktOQjBnLpTCeJZ2Qv74steWlZ7Pvmq
         kcNSQh67Hig4LsQwU+RjeR0Cu/KKd6mvWBasoqFIsMzyL3pJSRNwqwjzDCC/tteOVNw8
         ISs7lrf5mqNZvcYLFiuXnnzEwby4fALH0443hXtkWhsJBm6tFRCJpmGy4Z30fDzRtqns
         3yMw==
X-Gm-Message-State: ACgBeo1Cvl3wx+LMdS5EBvtQMROeGBDLvCkW+4hqpfZDAMovjXq71Ozm
	Fgi01ZxNlW/Qq1wSdBLe0Q==
X-Google-Smtp-Source: AA6agR7zJKJQn83IPHVAWk3IbF3tpzJEotiRHoaiAoBWuEU29vlzyuig22drfwWxdqfltEM9aCuFNw==
X-Received: by 2002:a05:6808:45:b0:343:657d:4089 with SMTP id v5-20020a056808004500b00343657d4089mr2421692oic.68.1662142763277;
        Fri, 02 Sep 2022 11:19:23 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id y11-20020a0568301d8b00b006372969fbdcsm1374873oti.26.2022.09.02.11.19.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Sep 2022 11:19:22 -0700 (PDT)
Received: (nullmailer pid 172292 invoked by uid 1000);
	Fri, 02 Sep 2022 18:19:21 -0000
Date: Fri, 2 Sep 2022 13:19:21 -0500
From: Rob Herring <robh@kernel.org>
To: Irui Wang <irui.wang@mediatek.com>
Cc: xia.jiang@mediatek.com, Tzung-Bi Shih <tzungbi@chromium.org>, angelogioacchino.delregno@collabora.com, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, wenst@chromium.org, Hans Verkuil <hverkuil-cisco@xs4all.nl>, nicolas.dufresne@collabora.com, devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, kyrie wu <kyrie.wu@mediatek.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, maoguang.meng@mediatek.com, Tomasz Figa <tfiga@chromium.org>, linux-arm-kernel@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [V7,1/8] dt-bindings: mediatek: Add mediatek,mt8195-jpgdec
 compatible
Message-ID: <20220902181921.GA172239-robh@kernel.org>
References: <20220826092904.10283-1-irui.wang@mediatek.com>
 <20220826092904.10283-2-irui.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220826092904.10283-2-irui.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220902_111924_423535_C0B3A151 
X-CRM114-Status: GOOD (  10.82  )
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

On Fri, 26 Aug 2022 17:28:57 +0800, Irui Wang wrote:
> From: kyrie wu <kyrie.wu@mediatek.com>
> 
> Add mediatek,mt8195-jpgdec compatible to binding document.
> 
> Signed-off-by: kyrie wu <kyrie.wu@mediatek.com>
> Signed-off-by: irui wang <irui.wang@mediatek.com>
> ---
>  .../media/mediatek,mt8195-jpegdec.yaml        | 169 ++++++++++++++++++
>  1 file changed, 169 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek,mt8195-jpegdec.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>

