Return-Path: <SRS0=MDtk=CY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA498C433E2
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Sep 2020 01:13:51 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2F18D216C4
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Sep 2020 01:13:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YC1Tk9DO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2F18D216C4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=FSBagcTO+9o4g6ODhf3hu+5jKcAqhEYQe+HQ+lMbpa4=; b=YC1Tk9DO1BZR+8A6YU0+tBaMS
	snZufuAy4xNfvnVweYRw+Vv875xulwYVuklZPQHZHVDQa5RzJ+eL5mXfjq9HzZVwnyXcJhc4iQHXn
	++CA7KpJ7RhMuNChQrSpheQECf/s/EV9d/WbNzy5iSs1IJMOBJSqr9L0sXtK2kfjUnKh0cKwQzsSk
	/Fo4YQl18hsGjaiB4e1xby3NjWBLewTTXVRqtE7Sbq8CwnfBwYJo//VCLzWk32PFgC3IqO+h/MHNf
	i/KXVHDNCEynNZmt3xW+HDnnM5uJqnDcHuLVLxQ5dvJVcLUnWj786aCxtwRqnALrE2NGFQS7S5gsh
	ifKZOlJlw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kHzXT-0002B5-M3; Tue, 15 Sep 2020 01:13:43 +0000
Received: from mail-io1-f67.google.com ([209.85.166.67])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kHzXR-0002Ae-EO; Tue, 15 Sep 2020 01:13:42 +0000
Received: by mail-io1-f67.google.com with SMTP id y13so2281195iow.4;
 Mon, 14 Sep 2020 18:13:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=wJyXEjNhnavm6OGxMGpiglYSRW9Ck9Xx/Oa+d48O33U=;
 b=SEprdqRnKjr6WApxf5h1szJqhFgIfAXziyRqzvBOg7WEKt6j9kibCnZH2UUUtuNiQ+
 wZC2IoVhV+Hn7ced/UCmdEw036mqRQuPb71yOjoh40in3ekDJ/UKCZ1sLoettYYeJSOy
 Qm4FzCpefwbl7EMgPAlo8+potB8/IvdmYnFFzepudz4ys1aYcwfA2VHyjcz0kSvMlCQA
 SuJi/YKuBD+SfoV35xzuxOOi0ihwBYW7N4Xej4S2c8Tb1hUtoq3794tcWDUl6QWGyWFi
 LQbh86lplrpwt73XZvaS9JPLpE+r3Rj+2whV8JGtv00oeGdlUtvhs1yGJZck9xCqVmLQ
 i/cw==
X-Gm-Message-State: AOAM533rjbCALIXp0VwMbMoiIm5moRJGUzZd3kWLPBRxU9i658OG/ITl
 VAKupAiQ0or76Wc1utUjbYAb0pmTOdc+
X-Google-Smtp-Source: ABdhPJzgk7GZMndb5SkzACJ48AJ3+fnaE/Zbts7nxs9Cw9UbOh5yb3KyMFXpIGyMRObsiNbNNvfFTA==
X-Received: by 2002:a6b:e017:: with SMTP id z23mr13494818iog.101.1600132420688; 
 Mon, 14 Sep 2020 18:13:40 -0700 (PDT)
Received: from xps15 ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id t10sm6968130iog.49.2020.09.14.18.13.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Sep 2020 18:13:39 -0700 (PDT)
Received: (nullmailer pid 640710 invoked by uid 1000);
 Tue, 15 Sep 2020 01:13:37 -0000
Date: Mon, 14 Sep 2020 19:13:37 -0600
From: Rob Herring <robh@kernel.org>
To: Fabien Parent <fparent@baylibre.com>
Subject: Re: [PATCH 1/2] dt-bindings: mediatek: add MT8167 power dt-bindings
Message-ID: <20200915011337.GA640680@bogus>
References: <20200906172337.1052933-1-fparent@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200906172337.1052933-1-fparent@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200914_211341_492214_200A9004 
X-CRM114-Status: GOOD (  10.99  )
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
Cc: devicetree@vger.kernel.org, ulf.hansson@linaro.org,
 linux-kernel@vger.kernel.org, krzk@kernel.org, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, macpaul.lin@mediatek.com,
 matthias.bgg@gmail.com, mars.cheng@mediatek.com, owen.chen@mediatek.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sun, 06 Sep 2020 19:23:36 +0200, Fabien Parent wrote:
> Add the SCPSYS binding documentation for MediaTek MT8167 SoCs.
> 
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> ---
>  .../devicetree/bindings/soc/mediatek/scpsys.txt    |  3 +++
>  include/dt-bindings/power/mt8167-power.h           | 14 ++++++++++++++
>  2 files changed, 17 insertions(+)
>  create mode 100644 include/dt-bindings/power/mt8167-power.h
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
