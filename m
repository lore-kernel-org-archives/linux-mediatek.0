Return-Path: <SRS0=tEpm=NI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75EF7C4338F
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Aug 2021 21:24:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2E0DE61038
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Aug 2021 21:24:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2E0DE61038
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nCtxULJ+CiVhrlwlWArr9PIZh3CGzKuUeL5GPw0wYYg=; b=qU7Dp3sqwRFSJa
	wY4C5mBMJvMPYmIwQfBGbuRi2MSdxIcuinkm+rj2L5ClGKNgAvdg6w/psIKIY3H8deNppNwnUf/fc
	H3bd9sEWxi7CsUExhrXhJKRC9WBRUXYw0yyLEGTvOIDtBcI7qaQHBtcdxd4yz5+3OwB1FT2DD7b3Q
	HqgZO0GWWiRlEcIH1+x3sCzIXyb2f5RZXt9k2ZuetNr5EDiCM3+kDcOAdBjhRPOafu57Y1NY5Iq5M
	0y/2jdZD5ZnoTs2QT9O7tBbMGG7OIGdyIIl7APOX4/IYwprlZKmBn19IGRx5YAd+hYq3/1s1SI2pj
	XT86AR+osA/AeK+8wMzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mG6Zc-003X9B-70; Tue, 17 Aug 2021 21:24:40 +0000
Received: from mail-ot1-f51.google.com ([209.85.210.51])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mG6ZM-003X4E-Bm; Tue, 17 Aug 2021 21:24:25 +0000
Received: by mail-ot1-f51.google.com with SMTP id
 x10-20020a056830408a00b004f26cead745so113845ott.10; 
 Tue, 17 Aug 2021 14:24:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=7W9npOknUtUU037y5TUXkyCwGRj5nJWHyHC1caEq6G0=;
 b=TvVQQZ+0GRkU43tamANiwZTp/I1Aqp0JwELAjNx/LnCzgm99mJK5wD6F9fYKU+R6l9
 f8BLh1+lNH5Jp305BkD/rZhlh2Ld9evVV+jHIo9xmHSmkzD6KYqROXSy1m+EeZbnv06g
 sDGuJ7Yg3O0TrL/lYnEkMyw7LaO2D91Ch2S2ySC/NN8Ea+0IQUO0Ys0WE6FF0DHoW/vZ
 POMupDTwWsi22OfZUEHDzrqvKXtSKiQO1SzTGYJSIHXUfyXTdaKEUp/+Oblt90VKGlxY
 +ke8GluGml77khDTWo2hGI+e2SE05LlyJ7vSn5ecdMqvaFNezRvcuPBYOrMh1CiSojoB
 JxwA==
X-Gm-Message-State: AOAM532M6vieMt0Q5Jc+P/knNL+yh3TkEzAn3XudZpeRGHk0jGKVqMnn
 yccKL8H4a+xR+61tSyLiOw==
X-Google-Smtp-Source: ABdhPJz5WjCQw00OSV19UzmnYoJNag5H4oeeak/snW4AcVvwi66ujDfDHn7AEgc1RlfMhusAaMvC0g==
X-Received: by 2002:a9d:8ed:: with SMTP id 100mr4115192otf.232.1629235463552; 
 Tue, 17 Aug 2021 14:24:23 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id u127sm779604oib.16.2021.08.17.14.24.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Aug 2021 14:24:22 -0700 (PDT)
Received: (nullmailer pid 866082 invoked by uid 1000);
 Tue, 17 Aug 2021 21:24:21 -0000
Date: Tue, 17 Aug 2021 16:24:21 -0500
From: Rob Herring <robh@kernel.org>
To: Dawei Chien <dawei.chien@mediatek.com>
Cc: Fan Chen <fan.chen@mediatek.com>, Mark Rutland <mark.rutland@arm.com>,
 Ryan Case <ryandcase@chromium.org>, linux-arm-kernel@lists.infradead.org,
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-mediatek@lists.infradead.org, Arvin Wang <arvin.wang@mediatek.com>,
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 James Liao <jamesjj.liao@mediatek.com>, Stephen Boyd <swboyd@chromium.org>,
 Nicolas Boichat <drinkcat@google.com>, linux-kernel@vger.kernel.org,
 Georgi Djakov <georgi.djakov@linaro.org>
Subject: Re: [V11,PATCH 11/19] dt-bindings: interconnect: add MT8195
 interconnect dt-bindings
Message-ID: <YRwpBQu+rXPiUe3i@robh.at.kernel.org>
References: <20210812085846.2628-1-dawei.chien@mediatek.com>
 <20210812085846.2628-12-dawei.chien@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210812085846.2628-12-dawei.chien@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210817_142424_448545_5F348D58 
X-CRM114-Status: UNSURE (   9.76  )
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

On Thu, 12 Aug 2021 16:58:38 +0800, Dawei Chien wrote:
> Add interconnect provider dt-bindings for MT8195
> 
> Signed-off-by: Dawei Chien <dawei.chien@mediatek.com>
> ---
>  include/dt-bindings/interconnect/mtk,mt8195-emi.h | 42 +++++++++++++++++++++++
>  1 file changed, 42 insertions(+)
>  create mode 100644 include/dt-bindings/interconnect/mtk,mt8195-emi.h
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
