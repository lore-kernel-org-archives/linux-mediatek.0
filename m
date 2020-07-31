Return-Path: <SRS0=UCxl=BK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A8C9C433DF
	for <linux-mediatek@archiver.kernel.org>; Fri, 31 Jul 2020 21:14:07 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CCAB422B43
	for <linux-mediatek@archiver.kernel.org>; Fri, 31 Jul 2020 21:14:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VsMybaS8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CCAB422B43
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=mhC9KKmUJTby5J04CHAtAtgE0qPMhk8Pizhd9AGLiLQ=; b=VsMybaS8tfcq473I7GCp41qOk
	9L6R8hr1WZlrzbl6eQLpQQ1TPr8e8TlLVAzLYLYwh8vkTudRlFRlJ9s5sFEoPowMXBOwx+nNzUFTL
	NLYy4BzTho6EIueBk8h1swSumrgs7LQEoMhe2ETeSVqksYCZrJFxzy/9XS9IvidVLnNUmhS4yRtbd
	bdff/9ZtRJuZAAJ6+1lvML64hTH8LMAVsyvwRf1e7ukhC65fLcVS/C8IyT2TIVJokUT1c2J+v4yg6
	h9BvkDcr3vNm2ytXRhreOPuIgN/xW+CovuDjKgc+CYqHjIESzlyOIckC4f1z47UezfI8WYY49aEUb
	+9X1oB3og==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k1cLi-0006oj-V9; Fri, 31 Jul 2020 21:13:54 +0000
Received: from mail-io1-f66.google.com ([209.85.166.66])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k1cLg-0006nd-IT; Fri, 31 Jul 2020 21:13:53 +0000
Received: by mail-io1-f66.google.com with SMTP id s189so25780961iod.2;
 Fri, 31 Jul 2020 14:13:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=0kUiZodQVGoScmGeQBAxfGuNNmJgniCksGkhC2caiFo=;
 b=WKjceDMfUURIo9itJftLfdo/L1PPDOtc4WjUs4aypPaE0fy+epT/74dcGIhA+pSctq
 DmFCLDsnLlPyzhalH/7HSu07GX/peWdRHPrww5io0lWdW12A8dONM8SRRn5eOSH+qWE2
 C6aCUOPRFWCdzJW4YzzoHOhEPNRe1v3C4x84Y3CdF8hXvNDSLcvrUyq1MRHntDsV5OfO
 x8INzZlGl3O3dw5MGReTTyeVIbxzHIJvCVWphKxbsVYcZV8W53OF9pUtbrCiQ9kWQ520
 BRb9K/pekiO3d0g/KrIw9ZJNJWUVPk3VjfTF1EfkDsJ66Ik0jyo0X1/eqeqaEOms33wp
 YLBQ==
X-Gm-Message-State: AOAM531wSZW7f7EdiMyNfGflOTW3MMm81rs+YkRIQSPkHQyZnBqdPGOT
 QzIBLJyybi0wYhtKmlSeOg==
X-Google-Smtp-Source: ABdhPJxkduuS7JPJS9dhqjYDKOUcWmOcyCaz1IWXXBMarQCX27BuT7ZuW1Xheh1N6rFpWa7XPS02Qw==
X-Received: by 2002:a05:6638:2653:: with SMTP id
 n19mr7238909jat.34.1596230031583; 
 Fri, 31 Jul 2020 14:13:51 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
 by smtp.gmail.com with ESMTPSA id s10sm5360289ilh.4.2020.07.31.14.13.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Jul 2020 14:13:51 -0700 (PDT)
Received: (nullmailer pid 800839 invoked by uid 1000);
 Fri, 31 Jul 2020 21:13:49 -0000
Date: Fri, 31 Jul 2020 15:13:49 -0600
From: Rob Herring <robh@kernel.org>
To: Seiya Wang <seiya.wang@mediatek.com>
Subject: Re: [PATCH v3 3/3] dt-bindings: timer: Add compatible for Mediatek
 MT8192
Message-ID: <20200731211349.GA800755@bogus>
References: <20200729013100.19539-1-seiya.wang@mediatek.com>
 <20200729013100.19539-4-seiya.wang@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200729013100.19539-4-seiya.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200731_171352_654458_EE028B71 
X-CRM114-Status: GOOD (  13.03  )
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
Cc: devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 linux-serial@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, 29 Jul 2020 09:31:00 +0800, Seiya Wang wrote:
> This commit adds dt-binding documentation of timer for Mediatek MT8192 SoC
> Platform.
> 
> Signed-off-by: Seiya Wang <seiya.wang@mediatek.com>
> ---
>  Documentation/devicetree/bindings/timer/mediatek,mtk-timer.txt | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
