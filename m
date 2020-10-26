Return-Path: <SRS0=oVGr=EB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9335C4363A
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Oct 2020 13:27:44 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8510B217A0
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Oct 2020 13:27:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uGZ8HMKp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8510B217A0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=3h2Dyl7Ms8ccexFxwSh6pAbZVzfddQ4nVN/fmZVPFbk=; b=uGZ8HMKpWoJ/DX+VYA2wezHLX
	lEwr+RgRUc8hFiLPl5xCtzXINpQUJ2jV3dMFtqdFWx+gdPBt/GuL07h1tQAMywF3ZVuGHx6HxFkgl
	s6nBZVQabSbVqLyb7PngAME8Byv9FT+PfUK2qMzDfL7BmsQM4CHj/qwDL2kz5HneKjDovF2xGEJxU
	ofKf1eVP2g9EEacNs2O72jIdp6c8fflyMCTq1BcYvnZnbyq+nT5emK33h7BSnUNs0wVnFncbJe4OR
	+n+QabxlEdhx7s92uwaCF9O0CZLKZ4p9FLVMwy+U76Egx3Knfinyg/KE1xKQBUdlNzHAQQrMMClNo
	ansx63kcQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kX2XA-0005Iz-4z; Mon, 26 Oct 2020 13:27:36 +0000
Received: from mail-ot1-f66.google.com ([209.85.210.66])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kX2X7-0005I2-Tl; Mon, 26 Oct 2020 13:27:34 +0000
Received: by mail-ot1-f66.google.com with SMTP id f97so7972056otb.7;
 Mon, 26 Oct 2020 06:27:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=dICAa5zihRqkfMFzmU2zbHT9Gkg7gGmUMAo66qHLtrs=;
 b=PMdIUdMSVdsw0usxsnWB4Ee/1rB0vDI9BXHwsiiF9mPqe21ybNEsWpdUOPBPiYcpyU
 SNj9cn66zzo/ArPwOVCK1oPSy6ixFpWQ2CAmoFhzi7a175hU4YbG2HOzUxXpb1KEK6+5
 Saq1gIDyWZKZUYhVcKC4m11cwdYxPhMVv0ukVPiWJEwlsDyym5Px9SBjcRKMJS2ELBVM
 2JsCTqkGecAuIqLQW2gUn9UL9HKevHzGX0Y8A28YmSCUV9KnJskjldKGD0WuLau0hjXg
 XmYi/Mqw3kdNqwELp4daSoyEdtAJB0Dcnhd+C312s5zXGTy11Zssr26l3aifhmGGEQBI
 Kq4A==
X-Gm-Message-State: AOAM530UC8GSqF0KT7cMS5a1ma2Jxj8eI5vK9ZIxQmR7yTQvY2ZfXlPK
 yuz+3nPzZoRDARndZfS5QQ==
X-Google-Smtp-Source: ABdhPJzB7uZlU7aojvgwdRg+bswvuVs94ivjynutrDsKpFzPNHbjZFMSqkJiWvL1Z9l//D7tryYCNA==
X-Received: by 2002:a9d:822:: with SMTP id 31mr13921986oty.224.1603718852758; 
 Mon, 26 Oct 2020 06:27:32 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id l44sm3924052ooi.44.2020.10.26.06.27.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Oct 2020 06:27:31 -0700 (PDT)
Received: (nullmailer pid 29159 invoked by uid 1000);
 Mon, 26 Oct 2020 13:27:31 -0000
Date: Mon, 26 Oct 2020 08:27:31 -0500
From: Rob Herring <robh@kernel.org>
To: Fabien Parent <fparent@baylibre.com>
Subject: Re: [PATCH] dt-bindings: pwm: mtk-disp: add MT8167 SoC binding
Message-ID: <20201026132731.GA29104@bogus>
References: <20201016185015.3371433-1-fparent@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201016185015.3371433-1-fparent@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201026_092734_007522_762D873D 
X-CRM114-Status: GOOD (  11.76  )
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
Cc: linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org, thierry.reding@gmail.com,
 linux-mediatek@lists.infradead.org, u.kleine-koenig@pengutronix.de,
 matthias.bgg@gmail.com, lee.jones@linaro.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, 16 Oct 2020 20:50:15 +0200, Fabien Parent wrote:
> Add binding for MT8167 SoC. The IP is compatible with MT8173.
> 
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> ---
>  Documentation/devicetree/bindings/pwm/pwm-mtk-disp.txt | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
