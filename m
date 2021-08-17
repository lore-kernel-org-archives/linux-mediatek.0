Return-Path: <SRS0=tEpm=NI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9ECBC4338F
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Aug 2021 21:24:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 765CC6102A
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Aug 2021 21:24:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 765CC6102A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jK7aiwj/bQ4XnT+poqxcJ+4S2hKn3F1YzMYNGxnKXMY=; b=VIvy7YTX/zSZ7g
	Lv0y6fDNs9DNQMdiycN9cv/zvrM0TNVvhWkl1scoXD4/D2rjs6oPEpoOGwu5Lx/9/mGkSnSN3PHOD
	V+Wj+pzDp6DAt+rcH6Vz2ejMLGNxYTYVGA8yf8xOUlyHDreXh5gMfIPXjsY9LAptTUicALT368h2c
	8fB3Y9mbo6Wf48/bHj3it13XpE5j4fUTTqmK0nGpBN1+8F3uXcFeP+gYGA7icEKiIAL42rz95Cz3j
	V2LSAkHiwQhnrnKlp0+LYj7bSYu07kK1k6zdSWkx/LN2Yob/yxGimnewMjndvH3wVjIcPIFFhlwWR
	mgI/FMCjuO1etXrxqz8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mG6Z2-003Wz1-4D; Tue, 17 Aug 2021 21:24:04 +0000
Received: from mail-oi1-f171.google.com ([209.85.167.171])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mG6Z0-003WyQ-2y; Tue, 17 Aug 2021 21:24:03 +0000
Received: by mail-oi1-f171.google.com with SMTP id t35so1199534oiw.9;
 Tue, 17 Aug 2021 14:24:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=cc1Tee25eLnpmetGn3WxZiNcJ/LLzI5Ywtl6ibNrqCc=;
 b=mq4YeVfxkSCKf7g79Y42Lv+1IIi2seMgGKVZX0pxFk6mn1mRhkf/fO1LF6EIYoPmaZ
 NibB0c3DWPkbtyQ3dWuTTf5D+UrcQBgjsm1xGFGZK1mRDE0D8QX2jqp9aMSiP8knYz2F
 GAbL5nixg62ZQlhs551JAohB/o4PVri6sy6zeTXxOjKagy1d8mNOMSD+NsEa4EGyN8+c
 Un+sftRAc0an/59A1urojUEzAwBQShSrR7+dOYBroQaChZyzhPp8obW/hiY0Nd+FiohX
 ybDinEMk4EoE+eiONAb0R1TvsuN50plHAPoZLZx8PJvXu5c1S9mFRiz0Ofw7vRzqkhaR
 0//g==
X-Gm-Message-State: AOAM531GujIKUMLSHqRsieIy41KIdGPxLyglH9+qpBvvHWgwEDQtIJNv
 iWtkR9g3RZzWMgriP+OSlw==
X-Google-Smtp-Source: ABdhPJxB+13MUTodakTypFZWJ0OC1eGz65e3oYzvM2LSxBEUtJ5ZgfSPnWAqFOqmy5Dv97ixorGFbA==
X-Received: by 2002:a05:6808:10d:: with SMTP id
 b13mr4264105oie.79.1629235441533; 
 Tue, 17 Aug 2021 14:24:01 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id h19sm610545otr.75.2021.08.17.14.24.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Aug 2021 14:24:00 -0700 (PDT)
Received: (nullmailer pid 865404 invoked by uid 1000);
 Tue, 17 Aug 2021 21:23:59 -0000
Date: Tue, 17 Aug 2021 16:23:59 -0500
From: Rob Herring <robh@kernel.org>
To: Dawei Chien <dawei.chien@mediatek.com>
Cc: Georgi Djakov <georgi.djakov@linaro.org>,
 Ryan Case <ryandcase@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 Arvin Wang <arvin.wang@mediatek.com>, devicetree@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Mark Rutland <mark.rutland@arm.com>,
 James Liao <jamesjj.liao@mediatek.com>, Nicolas Boichat <drinkcat@google.com>,
 linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Fan Chen <fan.chen@mediatek.com>, linux-kernel@vger.kernel.org,
 Stephen Boyd <swboyd@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [V11,PATCH 02/19] dt-bindings: mediatek: add compatible for
 MT8195 dvfsrc
Message-ID: <YRwo72vWlsY1cPw+@robh.at.kernel.org>
References: <20210812085846.2628-1-dawei.chien@mediatek.com>
 <20210812085846.2628-3-dawei.chien@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210812085846.2628-3-dawei.chien@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210817_142402_190314_2A986441 
X-CRM114-Status: UNSURE (   9.32  )
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

On Thu, 12 Aug 2021 16:58:29 +0800, Dawei Chien wrote:
> This adds dt-binding documentation of dvfsrc for Mediatek MT8195
> SoCs Platform.
> 
> Signed-off-by: Dawei Chien <dawei.chien@mediatek.com>
> ---
>  Documentation/devicetree/bindings/soc/mediatek/dvfsrc.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
