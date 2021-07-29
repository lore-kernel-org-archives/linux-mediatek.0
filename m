Return-Path: <SRS0=Fikf=MV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15A2FC4320A
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Jul 2021 22:58:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D617E60F46
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Jul 2021 22:58:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D617E60F46
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k6reC/9XgOtMbh3/JObLeKuD03fl9UXBJVwvJinYQzQ=; b=HldeQjbJUFRKsm
	cOVatLFxNfwRrqJ5vPQADYTr002XbylyWyRHWmPze5ONCRqeEA8PR5VyH8QdDSmWVIoTXK1BY9xrd
	taSOk0SxrFbVmBT10qzXX2SZcS2VM2vHE3pVWSPcr8Z51pb78mMen5kXkx3NQEZA2nH6YjPGZQROZ
	tvIK7j2NXYpE08jYJpnVNJzqWofSfN5xXXk9XCEc7swl3rThmwGLNa2+k4SC0fuC8S8+qRlQFn1LQ
	GNS4x119Zix6RISzno+13+Y0zjCxSqCuJpjVMynAYmT/wMT8lVttTLHkC3ZepzdM+Xq7UNiLPF5Lm
	Hp6Q9Tq9bLgIDaFylBCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m9Eyf-006KgI-Ts; Thu, 29 Jul 2021 22:58:09 +0000
Received: from mail-io1-f49.google.com ([209.85.166.49])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m9EuD-006Itv-EH; Thu, 29 Jul 2021 22:53:34 +0000
Received: by mail-io1-f49.google.com with SMTP id r18so9170507iot.4;
 Thu, 29 Jul 2021 15:53:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=uJpFDnLGsRTERddirEkC/Otejhw3rqBCEU9YfBhRf7U=;
 b=NYH/H684+svrEunrL8MHeHC64rq3j4RtJApk7zxT+a6dZNKBaW8afuVGz0DEUIlvNC
 piLk9WdVHmcx9cGWUx0VzGmLD+2X7sGfV5IzX3Yl31YeUORrlWjNuMQ8yPHTA4sthUSU
 hkMTqFPDgLez+4qw+0+VM/2/uB3za61KapR6pNg3J6fNhm/w82mCFqmuj9o4+cC54tes
 mTBvQJpSsHpv0LPXJHJhkKbOGPzWDq0QO2QtHOyF5HWmPOL1zvC+Mg29UkPLe+gpOsFU
 rntJMNwV9I7PCMqDzXCDGWi2hnHfaubonv1bB/0CBe+XGMnZpbjOdnkrYeyACvZ++5Dr
 dSSA==
X-Gm-Message-State: AOAM530hgb58x3SEVM+wb01o+gA8h+CjKZApNKp6fgclQEeD7UboRdRr
 4pOerJ31ZO54jk39pib1ow==
X-Google-Smtp-Source: ABdhPJyEsK2jDWjZFywMCQXwGVNiTd+X7dee88ammCDu73syt+3U1Fhoa2oj3r3aYr5KQbctmLvaDA==
X-Received: by 2002:a6b:b883:: with SMTP id i125mr6041617iof.104.1627599212586; 
 Thu, 29 Jul 2021 15:53:32 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id z6sm2632418ilz.54.2021.07.29.15.53.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jul 2021 15:53:32 -0700 (PDT)
Received: (nullmailer pid 1057151 invoked by uid 1000);
 Thu, 29 Jul 2021 22:53:29 -0000
Date: Thu, 29 Jul 2021 16:53:29 -0600
From: Rob Herring <robh@kernel.org>
To: Sam Shih <sam.shih@mediatek.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Matt Mackall <mpm@selenic.com>,
 linux-watchdog@vger.kernel.org, Sean Wang <sean.wang@kernel.org>,
 linux-kernel@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 John Crispin <john@phrozen.org>, Hsin-Yi Wang <hsinyi@chromium.org>,
 linux-mediatek@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
 linux-crypto@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Guenter Roeck <linux@roeck-us.net>, Stephen Boyd <sboyd@kernel.org>,
 Fabien Parent <fparent@baylibre.com>, linux-gpio@vger.kernel.org,
 Ryder Lee <Ryder.Lee@mediatek.com>, Linus Walleij <linus.walleij@linaro.org>,
 devicetree@vger.kernel.org, Wim Van Sebroeck <wim@linux-watchdog.org>,
 Herbert Xu <herbert@gondor.apana.org.au>, linux-clk@vger.kernel.org,
 Seiya Wang <seiya.wang@mediatek.com>, linux-arm-kernel@lists.infradead.org,
 linux-serial@vger.kernel.org
Subject: Re: [PATCH 08/12] dt-bindings: rng: mediatek: add mt7986 to mtk rng
 binding
Message-ID: <YQMxaXqr/zqf1+Ch@robh.at.kernel.org>
References: <20210726071439.14248-1-sam.shih@mediatek.com>
 <20210726071439.14248-9-sam.shih@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210726071439.14248-9-sam.shih@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210729_155333_539504_10713E6A 
X-CRM114-Status: GOOD (  10.84  )
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

On Mon, 26 Jul 2021 15:14:35 +0800, Sam Shih wrote:
> Add RNG binding for MT7986 SoC.
> 
> Signed-off-by: Sam Shih <sam.shih@mediatek.com>
> ---
>  Documentation/devicetree/bindings/rng/mtk-rng.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Applied, thanks!

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
