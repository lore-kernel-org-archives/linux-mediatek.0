Return-Path: <SRS0=DbAw=DJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D7C8C47423
	for <linux-mediatek@archiver.kernel.org>; Fri,  2 Oct 2020 11:15:57 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 260F6206C1
	for <linux-mediatek@archiver.kernel.org>; Fri,  2 Oct 2020 11:15:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VRu3xh5j"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 260F6206C1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=KPt9OcGKUBbfKEShSr68qyx9LyX0K4oo3WVH2W5OYLc=; b=VRu3xh5jr5kPWYW58f1j3sFuQ
	ElWPZQ9zatl097l4zrfPxJcJhmO2VLgSitM8v7rorifh8VyvT/66ZoXajZX65jQ2kBBf3Numk5x8i
	C3EYPIK/y8viigzkYjjwvkoiRcsuZBIzXvBLY4CvE2ZoIjNcnsywYgFcAT6BhMTim74D6nbYnHHFW
	CVtMY+B2TyqBuxjZ3kHon+t2yyREuWfgva4QCbILaYSWrUWRq7ILq0+Yy3P7LAUA2uGokv5hW68jd
	+66l+DHlUyYpeLPh3uDPadT6VOkdbtKaWDVr7qksl2w49XXggRiOyh/2g7gI7woGk8ZTMx9U9kGhs
	viMl0nD6w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kOJ2U-00021D-Jp; Fri, 02 Oct 2020 11:15:50 +0000
Received: from mail-ej1-f67.google.com ([209.85.218.67])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kOJ2S-00020R-2J; Fri, 02 Oct 2020 11:15:48 +0000
Received: by mail-ej1-f67.google.com with SMTP id a3so1393175ejy.11;
 Fri, 02 Oct 2020 04:15:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=LHccXthzZpowujFlX/UIRlonuBGP7oxIKyYm0qA4pvg=;
 b=e4l55dcS5WIsyzPQ00ssxJNCsyqmLVEYKatJ6ES6VSKkv661QphxM/hpE9Xv3gnOWp
 kCN9W4PrT93HgqAUNran+p5oBXt7oJ7hY587UCje/wM1HmrS6mH5B/eg/ZAY7/qK1Ik7
 jrGh7BLJzAqK1P5dRD7wjXSL2lQlBKv/WvS2UeyrDZ9wzgpVGkHD+40razRFZ9lXGVw7
 u4s8pFHraVzZzSqS0B8aC9m7Olc1GBCUe1ImTmUXOp4j2P8J8OzcBhtzR+3ORgq3Ubjq
 zRetW4PlmrTLPFbjUSacrRD8l/8/qYjZkN4dKpaK5gMHqefgP1ZEZbDCAOG2I31xmm5N
 eRXQ==
X-Gm-Message-State: AOAM530HsIVQXJRlYDJ6tGmOMD2fGlw+lOo7e3FGEU61l79uugaeXN1t
 Q93yYqa3rYsw1Gq3ROHd2yY=
X-Google-Smtp-Source: ABdhPJzSZOSHhDhVdKKucPu1ITBef6j4ONzNmUa9XEdo6BcAOHABAtdMC5eowTZhVkiFyKCfXv3VoQ==
X-Received: by 2002:a17:906:cf9b:: with SMTP id
 um27mr1735440ejb.66.1601637347031; 
 Fri, 02 Oct 2020 04:15:47 -0700 (PDT)
Received: from pi3 ([194.230.155.194])
 by smtp.googlemail.com with ESMTPSA id bt19sm934515ejb.44.2020.10.02.04.15.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Oct 2020 04:15:45 -0700 (PDT)
Date: Fri, 2 Oct 2020 13:15:43 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Yong Wu <yong.wu@mediatek.com>
Subject: Re: [PATCH v3 24/24] memory: mtk-smi: Add mt8192 support
Message-ID: <20201002111543.GA7227@pi3>
References: <20200930070647.10188-1-yong.wu@mediatek.com>
 <20200930070647.10188-25-yong.wu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200930070647.10188-25-yong.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201002_071548_111617_4F88949E 
X-CRM114-Status: GOOD (  13.13  )
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
Cc: youlin.pei@mediatek.com, devicetree@vger.kernel.org,
 kernel-team@android.com, Nicolas Boichat <drinkcat@chromium.org>,
 srv_heupstream@mediatek.com, chao.hao@mediatek.com,
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
 Greg Kroah-Hartman <gregkh@google.com>, linux-kernel@vger.kernel.org,
 Evan Green <evgreen@chromium.org>, Tomasz Figa <tfiga@google.com>,
 iommu@lists.linux-foundation.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 ming-fan.chen@mediatek.com, anan.sun@mediatek.com,
 Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Sep 30, 2020 at 03:06:47PM +0800, Yong Wu wrote:
> Add mt8192 smi support.
> 
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> ---
>  drivers/memory/mtk-smi.c | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)

Does it depend on any of the previous patches (so can it be applied
independently)?

Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
