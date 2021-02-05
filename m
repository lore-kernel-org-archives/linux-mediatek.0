Return-Path: <SRS0=sOPI=HH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B043EC433E0
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Feb 2021 22:04:49 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4700A64EEC
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Feb 2021 22:04:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4700A64EEC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=GhgydMJ2QJMlDAKu/D4VJWg875DjNkmk0kwunQHaXJo=; b=nA07huFAd0xe2Xp3xYIFnSh8F
	maw02vrK7K0kGijSe7fCt9zYvjXsSkM8/Aq26HE4pcmTmEP9BFwtdKlRnRaopnUfISPnDgLMR4kFU
	EdAf+7v90mOhA/cx4lQ+0DgzmIsQyY4F5BVHMqi5clzVmGL6NAHJ3EdRJhhMGZ1XXXu7vu9aaqduT
	iwQiEjWl+X+2om0ZCCtEt6zZhwUkhg/lmCcCTkttrm0wu/mfi16O4DKLL481zzPEXxDktRlc8fOar
	R4KOccVe+wvit4rCXFLXqMgPoDs1+OY8+kdM/NMykRtlbz4xE8sls1YaAqo+GevK7LGaezDa1iF//
	Xiyn8CmLA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l89DU-00037B-VQ; Fri, 05 Feb 2021 22:04:41 +0000
Received: from mail-oi1-f171.google.com ([209.85.167.171])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l89DS-00036f-P7; Fri, 05 Feb 2021 22:04:39 +0000
Received: by mail-oi1-f171.google.com with SMTP id h6so9127752oie.5;
 Fri, 05 Feb 2021 14:04:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=oYX3STVGOutn/ODTJ1Chx6wd1ikGLIpdQAWlo27fcnA=;
 b=GUZNLJHB4OqHPDqPK201lrQsdAKbgnATIs21nlgqg7i2Vb3CPJaSAChjNX3sg4qMen
 o9HbVXAG/RADlWh4grnfiwQME8L3iLR3hh905ocr73/vgOgyWkRemYHxcNI7ffxmTejQ
 TwPB03oJHmLd97rzBuipOTKikO7ZLUa1DZAbfREOmZ4m2y3wOrs+BlSwcu4jCGBjCmpY
 T9cJwLN+AjCjpVOQlFED4pdyQlWz0+J+d5HsKQkIuGMB/hGyo2AgxPhs68A8ptivztZE
 0VxjrxZZreH8WePKzwzpFf549zTZlSxBGXY5uOXJY9ZwnlgPLPN5jjVxGsak9v1YvV68
 MXhw==
X-Gm-Message-State: AOAM530P/cPeguybToiYvpYvLQM329zXWE+KXWYl0JPtyoHEC9wmVhCk
 +VxHN7aAur4Z6pO5sSXvPw==
X-Google-Smtp-Source: ABdhPJx7yvm1O6oqJ0lLXbtfmYGfoeVWzvCVL9cCxLieYLbGmE6b1ddW84xEXKVGBDviVnEhIIsV6Q==
X-Received: by 2002:a05:6808:918:: with SMTP id
 w24mr4534554oih.20.1612562677933; 
 Fri, 05 Feb 2021 14:04:37 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id u15sm1970378oiu.28.2021.02.05.14.04.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Feb 2021 14:04:36 -0800 (PST)
Received: (nullmailer pid 3833547 invoked by uid 1000);
 Fri, 05 Feb 2021 22:04:34 -0000
Date: Fri, 5 Feb 2021 16:04:34 -0600
From: Rob Herring <robh@kernel.org>
To: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
Subject: Re: [PATCH RESEND v5 3/8] dt-bindings: mfd: Add compatible for the
 MediaTek MT6359 PMIC
Message-ID: <20210205220434.GA3833495@robh.at.kernel.org>
References: <1611913781-23460-1-git-send-email-hsin-hsiung.wang@mediatek.com>
 <1611913781-23460-4-git-send-email-hsin-hsiung.wang@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1611913781-23460-4-git-send-email-hsin-hsiung.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210205_170438_859644_BE936DDB 
X-CRM114-Status: GOOD (  12.76  )
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
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Sean Wang <sean.wang@mediatek.com>, srv_heupstream@mediatek.com,
 Alessandro Zummo <a.zummo@towertech.it>, Ran Bi <ran.bi@mediatek.com>,
 Fei Shao <fshao@chromium.org>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Mark Brown <broonie@kernel.org>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Eddie Huang <eddie.huang@mediatek.com>, Lee Jones <lee.jones@linaro.org>,
 Yuchen Huang <yuchen.huang@mediatek.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, 29 Jan 2021 17:49:36 +0800, Hsin-Hsiung Wang wrote:
> This adds compatible for the MediaTek MT6359 PMIC.
> 
> Signed-off-by: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
> ---
> changes since v4:
> - remove unused compatible name.
> ---
>  Documentation/devicetree/bindings/mfd/mt6397.txt | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
