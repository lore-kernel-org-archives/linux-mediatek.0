Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15504C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Jun 2022 10:02:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=06ETpuMkkHvgkjlRcUOfW3Fbdi0cQVfE/Mqnw8Cfz6c=; b=opA51NGaJVPu4q+zRXEBMYAQa7
	HWKcXt6C6L6svgFsHuRKRZYfWL7CAChCXm7lahqNVm47u+NxBTs0SJcIRXjJIZ11bhNeG3LgvCU0D
	8WVRmVrTdSa5TFHt2A8dxyDa3/JGU3X4CpS0eE7A2sPv3lUVGdQz3pkOYvAO0deagx1dXm5IfxMZf
	NkG2qO+IsiX6Pq9Ju0cpPm1futhj50x0UbumrDa+KmgtGd5vkRqFSc63RdD3WsxoyndvOzqqBDk98
	DFcVM153um8fDS1OxFnH88MWYLmcpTyyp8g2MhdpZmHvF2BzO3UJSHYGegbca2tTimz262/YkVfV3
	gbW7SHbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6UWw-00AsrL-Kk; Wed, 29 Jun 2022 10:02:42 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6UWA-00AsQB-4T
	for linux-mediatek@lists.infradead.org; Wed, 29 Jun 2022 10:01:55 +0000
Received: by mail-pg1-x536.google.com with SMTP id 9so14842733pgd.7
        for <linux-mediatek@lists.infradead.org>; Wed, 29 Jun 2022 03:01:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=06ETpuMkkHvgkjlRcUOfW3Fbdi0cQVfE/Mqnw8Cfz6c=;
        b=Z+DdzGQCOPMWgnRlG7eFR3++KN2JGZInwRICpUOLLpqkx2IqLJFYiPE47vbXS1M7JZ
         k3dBjYEgqg78UAgVBFY2pwz5JpwYtepipTJYYxwuIoIUuP5JxEfD+nfiFcBKqeF03ycP
         iXM2XlNp7Yy8tyP8WcNfyxrCw2Rqkywr09QZhnjzI3P0NvFFLMoEvoJCIhQs/n+r9q0C
         nftPKoUNQHGMtw6rkvD7cv2qg65N0sWjsgd81B54w4c5ESm5qN/yJl8HsfhfcW5CSyyI
         gshmwI0JOZqQF0PNQmq+IM/Fc00D2tISqKkflocSf8xRPkE8kRhbSXyNcERixq5pUFZs
         VDjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=06ETpuMkkHvgkjlRcUOfW3Fbdi0cQVfE/Mqnw8Cfz6c=;
        b=XJ6dDqRphcxlWd+wX30lfz60HGgqW4Lm0ml6X7pnCZPBwp2FCklRRnkRYDc8h5N1fK
         WLi7UGqnA12G46/dFlwNBhNqT58PvShdcloBy6/H8yOaWrflAzbJMw1YXcXw+u1sBq/2
         x71DfLs+4nbqGfQdZjoXAWKA39Zm+yEdo27rVNuqEGm8zxF39ZbZPTZqYbPRrZwdzxw9
         X0zdpvI15cd/z1DZiQ3vJe/1iv865PxmiwF959g01Kf24ZeO9/OHHKLLtMUBEBHFh2xJ
         B9xeK5Yz89M2X26irTnDurLeSRaOmDex6upuTK20WnTkZ9UnKjwxchVbjiKDxiz4UlRF
         MXtQ==
X-Gm-Message-State: AJIora+Jyt46Gkq+Hs4ixrozq2OxU6v1Cqqs/FAKl0Q9CPDU4c3+whRo
	fgwVFQAFfjLh4sEk2cQYNu2r8Q==
X-Google-Smtp-Source: AGRyM1u3TUNiIcqmMzXOhJVXBVjarrFFI/oXzgv9p8odXVYl86MN3Ot3cWjxvyYtnW9QUQTXGp/5mw==
X-Received: by 2002:a63:481a:0:b0:411:7951:cbcd with SMTP id v26-20020a63481a000000b004117951cbcdmr2346233pga.66.1656496911163;
        Wed, 29 Jun 2022 03:01:51 -0700 (PDT)
Received: from localhost ([122.172.201.58])
        by smtp.gmail.com with ESMTPSA id a8-20020a656048000000b003db7de758besm10992476pgp.5.2022.06.29.03.01.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jun 2022 03:01:50 -0700 (PDT)
Date: Wed, 29 Jun 2022 15:31:48 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: daniel.lezcano@linaro.org, Lukasz Luba <lukasz.luba@arm.com>
Cc: linux-pm@vger.kernel.org, amitk@kernel.org, rui.zhang@intel.com,
	rafael@kernel.org, dietmar.eggemann@arm.com, nm@ti.com,
	sboyd@kernel.org, sudeep.holla@arm.com, cristian.marussi@arm.com,
	matthias.bgg@gmail.com, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] Energy Model power in micro-Watts and SCMI v3.1
 alignment
Message-ID: <20220629100148.67kevfelqq7d23n5@vireshk-i7>
References: <20220622145802.13032-1-lukasz.luba@arm.com>
 <be793e51-0d89-7afd-e122-ec929a1130e9@arm.com>
 <20220629095302.bi3xx6yicsnjeff7@vireshk-i7>
 <1072cb84-4097-0cbd-f980-a864ea851b0c@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1072cb84-4097-0cbd-f980-a864ea851b0c@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220629_030154_226950_AE72A115 
X-CRM114-Status: GOOD (  11.69  )
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

On 29-06-22, 11:00, Lukasz Luba wrote:
> Thanks for fast response. It would be great.
> 
> I have 2 ACKs from Sudeep for the SCMI part,
> but I don't know the status e.g. of DTPM
> current work which is using the EM milli-Watts
> and does conversion to uW internally.
> I hope, I won't make issues to Daniel's work with this
> change.

Daniel, do you have any objections to this ?

-- 
viresh

