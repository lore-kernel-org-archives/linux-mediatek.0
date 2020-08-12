Return-Path: <SRS0=Jt7l=BW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 812D0C433DF
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Aug 2020 19:44:42 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4D45D206DA
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Aug 2020 19:44:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JLRAHXq3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4D45D206DA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=TfyJLyZVzEuVUWhPaVqlLX3Fc9Vdi58VaPgXjb3j37Q=; b=JLRAHXq345MpCdHXVAQRUzkJc
	Sg6O0z6lkmYwlWWvdW0t8fbsJDWRY/uWVNIlCMGjRTwHApchkFuLVkLqsVAesaxXuh54RYZIF/H4y
	lnOl1+XIzqWwKQLD7BEJ8Z69vnhl8D7NNim24AQddnKTL6YzrAAtgc0IPWJmHrrEm7P3bvCHyEdx7
	qPN34QyNX9sibc1ASfPSqxA3GA5zh3UJEtgt6qJm7qkqtP+1PLGYDhOetMEazQfgZXdu/bI0ozRA+
	pCHrfj6Rnw3EoL3B2iNBtnEeyqbttUcclKaVf52boZKRVabsrmGhJCKaO5FpvzmJTwPT4qJp4jCHC
	OP1r7selw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k5wfn-0005TN-Sy; Wed, 12 Aug 2020 19:44:31 +0000
Received: from mail-io1-f68.google.com ([209.85.166.68])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k5wfl-0005SV-01; Wed, 12 Aug 2020 19:44:29 +0000
Received: by mail-io1-f68.google.com with SMTP id g19so4295833ioh.8;
 Wed, 12 Aug 2020 12:44:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=PI60pBGvyY4YK8WMXJBtlmGtDEkgGzmHg6VvPJsaQpE=;
 b=eJ874VHOYPMdxeTWNeCgt3YdTezskxX9QyVgy8q7HwaSYvpiwheQHSi4tHP5+0qZJG
 Kg+lUK4Ml4r+MpccoiEl6PUs+Z1nv6hweo/d6sXCNSygXD+QT1E1Dc1OM+IRQUTWCWcY
 k/xXfp9JaB/RHCTCEuX7EmQsC2bbottuHYWohpqt4YF9kOP5pa/CTAw9uVwtMIQFM/+z
 bQ9W+p0/czZCrr+bHr+0OkmpXWpghO6bb3q/rdI5AMnNWBM77fqsu79fU04653pUSYmv
 Joz8Uvbxp4SKbFHSckUeoYPQ65PFANCBk1uwHLZspuQef7a7bWm48L9GGKHO8C5oQlpV
 rf5Q==
X-Gm-Message-State: AOAM531vAvMfoof8i4XLixdF8QRqFSdqskhLG9h/RGHnZ3P4ZSDoitHt
 CYLNyqYLAyDpUoGsFXgDBw==
X-Google-Smtp-Source: ABdhPJxtdZ8IsN1XGqyW7GSknz7VmFg9WPtG4jxsvpLrp0sWIqvvPreSCVcRhSyLZtRAjKXTfLscmA==
X-Received: by 2002:a6b:6c13:: with SMTP id a19mr1392236ioh.31.1597261468379; 
 Wed, 12 Aug 2020 12:44:28 -0700 (PDT)
Received: from xps15 ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id m7sm1540808ilq.45.2020.08.12.12.44.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Aug 2020 12:44:27 -0700 (PDT)
Received: (nullmailer pid 2587368 invoked by uid 1000);
 Wed, 12 Aug 2020 19:44:23 -0000
Date: Wed, 12 Aug 2020 13:44:23 -0600
From: Rob Herring <robh@kernel.org>
To: Zhiyong Tao <zhiyong.tao@mediatek.com>
Subject: Re: [PATCH v3 1/3] dt-bindings: pinctrl: mt8192: add pinctrl file
Message-ID: <20200812194423.GA2587320@bogus>
References: <20200807074905.23468-1-zhiyong.tao@mediatek.com>
 <20200807074905.23468-2-zhiyong.tao@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200807074905.23468-2-zhiyong.tao@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200812_154429_088207_A70DF925 
X-CRM114-Status: GOOD (  10.95  )
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
Cc: mark.rutland@arm.com, linus.walleij@linaro.org, hongzhou.yang@mediatek.com,
 biao.huang@mediatek.com, devicetree@vger.kernel.org, hui.liu@mediatek.com,
 seiya.wang@mediatek.com, sean.wang@mediatek.com, linux-gpio@vger.kernel.org,
 sj.huang@mediatek.com, robh+dt@kernel.org, linux-mediatek@lists.infradead.org,
 matthias.bgg@gmail.com, eddie.huang@mediatek.com,
 linux-arm-kernel@lists.infradead.org, srv_heupstream@mediatek.com,
 chuanjia.liu@mediatek.com, erin.lo@mediatek.com, sean.wang@kernel.org,
 linux-kernel@vger.kernel.org, sin_jieyang@mediatek.com, jg_poxu@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, 07 Aug 2020 15:49:03 +0800, Zhiyong Tao wrote:
> This patch adds pinctrl file for mt8192.
> 
> Signed-off-by: Zhiyong Tao <zhiyong.tao@mediatek.com>
> ---
>  include/dt-bindings/pinctrl/mt8192-pinfunc.h | 1344 ++++++++++++++++++
>  1 file changed, 1344 insertions(+)
>  create mode 100644 include/dt-bindings/pinctrl/mt8192-pinfunc.h
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
