Return-Path: <SRS0=oVGr=EB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E27E8C4363A
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Oct 2020 13:48:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 61B122242C
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Oct 2020 13:48:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AX+Xgqev"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 61B122242C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=xd9dxLJT3qK5TBv3HFCARnEQME1qeZa+jvRYZvP11Dk=; b=AX+XgqevKjam5IIt8Gsr1+uzK
	8vz4TKLm6Fhp+KYbgqgwaWfStABonIry1AQxlIxW0VmspXoS/2dfCAf72ZxO42bOWiIhTroIo1qXK
	vdem6f6TQt/5gy9+oGbhQGrxAzNQPkK6qAZep44Lf43kVP6NOIHEE5gUKUHql+5CSbQZvlYZ/dpql
	s26xAnqmvnO+j19dUm6VtJkGYfhE2zLCVDR4OC5eHqZkFKZ54nUCMyu6KYBVCVUmOcOTuT3bTGwEm
	zqRVBBRS+BHfbf9CsMvG2xfmcFzwiZvrA5o4iDbuzHiXOgqJfr9aWW6/wvPq+DCzq+yYIaIMCZrDY
	JqO0hznJg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kX2r6-0005T5-8j; Mon, 26 Oct 2020 13:48:12 +0000
Received: from mail-oi1-f193.google.com ([209.85.167.193])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kX2hk-0000nl-1H; Mon, 26 Oct 2020 13:38:33 +0000
Received: by mail-oi1-f193.google.com with SMTP id k27so10466682oij.11;
 Mon, 26 Oct 2020 06:38:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=xeSglgw6V+lXedmY2yfKw+hxq6uo2upHgu1Rrr+TqIw=;
 b=n3idlG8ocsGLS6ffOqkRtb72Wx/4p68BcHdxXhNKXotSrZsHkSbJgEXC5LHF6QQKhk
 e8yVh9wmDxor546f+7VlUcOElnBTQdb5609RNnTZcW6szfetz+vrW4KIN8BRGlxAL03G
 34jkyohv1lr3bvdHYdNE1Etr+xBHbar9xtjXvhcS+Ibq9gVAx3RsgcWkgx/ZZEZn0+55
 9t/1YqqqChKPkC714PwOGdCkWTWbjqgHrUSN66hMFoKWdRwdzC1ZewIshvf0V0ZsdM29
 Hjq5wXYXddsXtrt7ySmSArvo2qT5Sdoak0uYuZFNxK/ATQjzhiE4asCYSZjSJsXSJpxh
 Lbtw==
X-Gm-Message-State: AOAM5339BVIT91UQXxFt1j20bc6YjSL0FocQNmHfNo322CbWYazSh4/l
 NrZhZZQbS2OqK7izvtio2g==
X-Google-Smtp-Source: ABdhPJwf8rWPGWPFxMh9FCJA9hqD+W6fqMrnAa7HRWtQOWAfWPHvQI2l4u1rlwvS2lGh3pCiZKqHfg==
X-Received: by 2002:a05:6808:aa1:: with SMTP id
 r1mr10468829oij.153.1603719509673; 
 Mon, 26 Oct 2020 06:38:29 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id u125sm4017909oif.21.2020.10.26.06.38.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Oct 2020 06:38:28 -0700 (PDT)
Received: (nullmailer pid 43832 invoked by uid 1000);
 Mon, 26 Oct 2020 13:38:28 -0000
Date: Mon, 26 Oct 2020 08:38:28 -0500
From: Rob Herring <robh@kernel.org>
To: Fabien Parent <fparent@baylibre.com>
Subject: Re: [PATCH 1/5] dt-bindings: pwm: pwm-mediatek: Add documentation
 for MT8183 SoC
Message-ID: <20201026133828.GA43785@bogus>
References: <20201019140705.1518822-1-fparent@baylibre.com>
 <20201019140705.1518822-2-fparent@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201019140705.1518822-2-fparent@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201026_093832_242349_88831C81 
X-CRM114-Status: GOOD (  11.79  )
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
Cc: devicetree@vger.kernel.org, linux-pwm@vger.kernel.org,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org, thierry.reding@gmail.com,
 linux-mediatek@lists.infradead.org, u.kleine-koenig@pengutronix.de,
 matthias.bgg@gmail.com, lee.jones@linaro.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, 19 Oct 2020 16:07:01 +0200, Fabien Parent wrote:
> Add binding documentation for the MT8183 SoC.
> 
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> ---
>  Documentation/devicetree/bindings/pwm/pwm-mediatek.txt | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
