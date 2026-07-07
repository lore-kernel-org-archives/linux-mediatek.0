Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9616CC43458
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Jul 2026 14:48:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7JqovvXzMlh5rauQf8957U0jSCHUoUql6bim5TQYvA0=; b=EcABHOFuzYNRBk/X/wvBJaMJRu
	cVE/zk7ojxbg8/N5lemSQS/eZF9rWjLPxCwb3sjbJk1wyuP9WwsAmcr2Z4baN9hdhi+uFTyDtJ+K9
	mL7J3TNFcUoDjA3y7qVqSBX8WQM7Tt+mHYKEsWEFwLaktU8ik84cBpDzIOE5qxZD6z4I2TeSd6QGl
	2GPI5Dq+RJgHtUuAdTxg5Y7Wk/pyB9ZCtl5mSYAz8KQQCzJxi0MMrSi6G5pbo6vxMOsDU2HoWwT1m
	OF4/igYvKOQtzQpo/8CSJ+C2MlG+PiTLpiQKjsNry6Za6MnJUURmesN9eVwRqdrw+R8prrQlKhGTn
	3XcV++6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh75i-0000000FClC-0eZO;
	Tue, 07 Jul 2026 14:48:06 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh75f-0000000FCju-1KUx
	for linux-mediatek@lists.infradead.org;
	Tue, 07 Jul 2026 14:48:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1783435682;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7JqovvXzMlh5rauQf8957U0jSCHUoUql6bim5TQYvA0=;
	b=JsT4OA1c9QGSZCwg6jyEepLh7f2k6gp20qTNFWSLAZA6UZcVO9uv6Zr4jgXJg8G6CITuJU
	8WMZGjHwvQa3fKizhp+xVpriM+xdEJFxW4kv0VC/jW0CuxQsH3+3Ieyvq68jdoehbdOoeU
	DmlRCGaI4vQ3QqM+0s5Q9iUQ2zs/I5w=
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com
 [209.85.210.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-209-FMO_ijVdNCiBZ2JDJXyNEw-1; Tue, 07 Jul 2026 10:48:01 -0400
X-MC-Unique: FMO_ijVdNCiBZ2JDJXyNEw-1
X-Mimecast-MFC-AGG-ID: FMO_ijVdNCiBZ2JDJXyNEw_1783435680
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-7eb641eaf5eso5301402a34.1
        for <linux-mediatek@lists.infradead.org>; Tue, 07 Jul 2026 07:48:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783435680; x=1784040480;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7JqovvXzMlh5rauQf8957U0jSCHUoUql6bim5TQYvA0=;
        b=Ag2SVTgvcf+B4eGJogQDbTbPPNuKvl541xXpOfjsa6qWiO1QCHeSdDmujzTAgeWkJY
         qmscbjcgO/PXbnAUhbSuSfcHFO/NW9ueJLWUQj5XQ3qpoS6skqzitorTUcWzDwCPI1Dz
         ufpzEmIb5x2lS6JZerYNqpdnMf/2TB6u/mi7bWd9MwwFgT6riRSMrnmM8IlAjXKkwVxF
         YnB4a9lMQJ7CAsBoIe6mJl04OFl0Q5nvDEcl67uWkg9k+QCbdyFSikIL2xyUZ5T3fkGP
         Joyew8SGMHBpkJrhDzGutACVm4yYhUfh5kMdr/uWE4l3/HR9UgQqeaMh8m6x3HG8v11Q
         dziw==
X-Forwarded-Encrypted: i=1; AFNElJ/CEOC7TEwuoR6H4/YgtmF1wefKm+DVFOXaffxA4HREeO7biBMm/+C/Wa+hP3MwUoRQxq/iWilnvJQHHpKbSw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw9HPHlGWK60fv72fCHtwDgO4ohTBCUjkmqHhszHuhCvZMn8gYI
	VzU3HfYKg3CwDB48D2h6IN4vmdJ2KKBVVL+4YOJ1WajH6fG4mO2Q4nYXHvE1F4CUz4hBmuMGTVD
	3ak9NxSrH6aitF/E3IKVVn2B9/oJc/vWdrB+5aZhOn6yIj/0ErDpuHR/zqq9RyMLPJdpVD1AvUQ
	==
X-Gm-Gg: AfdE7cmgK/NcM3cgDG5ZTqNnp4MRYVpeYMsi1i9hvb76baSlbDfG+YxSNJqvt/Kubdu
	ms/hHth1yzlsEe5ahS/iVEfHrsyHGnRlOg8pVOYHTahcz3/Q8C47IyjcR0D2tM4dWJVUEVKQaMM
	cuxHYPMnkhBd3ZVMdFk1L/nHtbGu+x5sbHcSQu0hIYi99WCi9JY2bCicTh3OY+4lveawTbKK6Gw
	sTZh+s6HmYQ6p22dN1tSZoKDFEdHFbg1eka64yKxZOLhIMHv9zDC4hiR9D6G1yyiEVB+riKpvr7
	BClrSch3s18OXPAVGULG2C210DjckDMTcfGjiKrX72Tw6l2b9bb/e6p9N9qY7n5rYg+XGcxUp85
	ln0+S3RJg
X-Received: by 2002:a05:6820:1f02:b0:6a0:e1d4:7fdd with SMTP id 006d021491bc7-6a3553de9bfmr3896704eaf.23.1783435680166;
        Tue, 07 Jul 2026 07:48:00 -0700 (PDT)
X-Received: by 2002:a05:6820:1f02:b0:6a0:e1d4:7fdd with SMTP id 006d021491bc7-6a3553de9bfmr3896690eaf.23.1783435679782;
        Tue, 07 Jul 2026 07:47:59 -0700 (PDT)
Received: from redhat.com ([2600:382:850a:55b4:731e:b0d4:e0cc:410])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6a3103e064esm10772021eaf.14.2026.07.07.07.47.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 07:47:59 -0700 (PDT)
Date: Tue, 7 Jul 2026 10:47:56 -0400
From: Brian Masney <bmasney@redhat.com>
To: Akari Tsuyukusa <akkun11.open@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>,
	"open list:ARM/Mediatek SoC support" <linux-kernel@vger.kernel.org>,
	"moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>,
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
	stable@vger.kernel.org, Chen-Yu Tsai <wenst@chromium.org>,
	Miles Chen <miles.chen@mediatek.com>
Subject: Re: [PATCH v2 4/6] clk: mediatek: mt8135: fix memory leak on module
 removal
Message-ID: <ak0RnIsPqT8fQ7c1@redhat.com>
References: <20260707074839.240676-1-akkun11.open@gmail.com>
 <20260707074839.240676-5-akkun11.open@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20260707074839.240676-5-akkun11.open@gmail.com>
User-Agent: Mutt/2.3.2 (2026-04-26)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: -0Ugl7i3vBGevZid2uyUFYEL--jM5z691MP0a_EX9yM_1783435680
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_074803_428292_3F0E7CEB 
X-CRM114-Status: GOOD (  11.21  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Jul 07, 2026 at 04:48:33PM +0900, Akari Tsuyukusa wrote:
> clk_mt8135_apmixed_probe() in clk-mt8135-apmixedsys.c does not call
> platform_set_drvdata(), but clk_mt8135_apmixed_remove() callback calls
> platform_get_drvdata().
> This results in platform_get_drvdata() returning NULL,
> which leads to calling kfree(NULL) in mtk_free_clk_data(NULL).
> This leaves clk_data unreleased, causing a memory leak.
> 
> Fix this by calling platform_set_drvdata() during probe.
> 
> Fixes: 54b7026f011e ("clk: mediatek: mt8135-apmixedsys: Convert to platform_driver and module")
> Cc: stable@vger.kernel.org
> Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>


