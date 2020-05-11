Return-Path: <SRS0=Nu0C=6Z=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74D76C47255
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 May 2020 11:46:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 40C5F20735
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 May 2020 11:46:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="V+OWNpk/";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="KTJtUy+x"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 40C5F20735
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j0ZCgv/le5rS0gJ+djFQtB344gh5vFc4/is8p/H/Q1I=; b=V+OWNpk/wMZqfA
	HOaF+wn/++pIYf1lqXmkO8ceyyYkgbZ1MwrRGqm+auvRNHu4UySsiH4eOC7dCX95OUSKeUydwbslm
	utQ/WnVTtVzOYQncUVlw5qUwGRE3FX3nzddm1c9KvghsZEEoJ2KUHS1O4LOWJfCoT5159Cr3PxC7e
	WziMkGiy0VZBeP6oNC3e5AFqGV0S+zuDUoZlnAhM1XJPRAX5pVHgI0Y7xtld70n8fKgfRm2fsbgy8
	Nw02JzOFbys0PNP2qzq+iqOKHdQe6fGSrp4L2r4qdrRapgZWCgcqrUwNk7l9YdeXZCXsD0HGFzrJw
	8Vzb6ededJZvkLWeZ3/w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jY6tN-00054E-R3; Mon, 11 May 2020 11:46:41 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jY6tF-0004vV-DX
 for linux-mediatek@lists.infradead.org; Mon, 11 May 2020 11:46:34 +0000
Received: by mail-wm1-x342.google.com with SMTP id d207so3724095wmd.0
 for <linux-mediatek@lists.infradead.org>; Mon, 11 May 2020 04:46:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=8HihaMjBho7yHhoZ4dXDWrBXozE3xr0NvWok/3IgXso=;
 b=KTJtUy+xvCilgtfASvMVkrHFxJGWQd6oQfRtMj53UFUDKm0GLZdcKmysVquVdcGnNQ
 GnLnowb53q2mnDekrftfm5idSn2La4Hwi3EQlRIr2/x9kLZEGljvyDzDJ/tH/iPMhCm1
 Br1Mj0mQ+w2yON0HQ2T8K1qFr/JqndsQWJkbeeocTf/p+tdDaBtBm97H2lzKg+T6eaZa
 e1c0Mmv7ay3WSrdGzzxq+HftjVHi1YFqLO/rTY4o27q48B7uXHJnRU8plAj3pMPpDMjc
 48oZp2j9ep2hx9TCcvQ4njLDs5w+TaPPZM4SJGoDmaM0Jh1BZ2wDTD7I2hrixnS3uVeE
 pxUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=8HihaMjBho7yHhoZ4dXDWrBXozE3xr0NvWok/3IgXso=;
 b=mm673mbWFSZ9NdbgdeZ9X+c+FO0Bdjo0uSEuZGroxDN5kmbZOoCI87X8GFy5IwugRe
 l3BMdQmEHBGTTfc+RN3XldXplFxw3HMwzNWHKxW1LLvU1CTylYOZWg7haXlM7xAVcZfS
 mlMZoXVNCO0kllzrS4/5kTNCtjwlYvtON2/cja6uNGDkbWQh1Q0CcMdpXXjnk+RdnWNF
 ljo63p65wfUUCb7bc6RRN66+EfqNvzLq5YXUOua4944S6vRxcgMPplb8KKoNoo9vNnkw
 SeHZ0ntpN8dy8RKOSn2IowVxJZ0sEBJs9T5bvDX1F2l5JidTKfpveHzcoS/6mQfNzMpU
 JN6w==
X-Gm-Message-State: AGi0PuZ1/V2/wDkui7W54fG4PW1DM/lWxjpj11lQLPXiybGy0cOTpR1J
 /R5JGPBxto+GSs/Uhbluyui31Q==
X-Google-Smtp-Source: APiQypK+52M5jh5tMkIap1YctDwL5nM0Q2YdPkE9mtpXjfSY9F6Whlp3f9IAQU+9uwYyfn1ELFgsiA==
X-Received: by 2002:a7b:ce89:: with SMTP id q9mr33216701wmj.185.1589197588860; 
 Mon, 11 May 2020 04:46:28 -0700 (PDT)
Received: from google.com ([2a00:79e0:d:110:d6cc:2030:37c1:9964])
 by smtp.gmail.com with ESMTPSA id w18sm17682226wro.33.2020.05.11.04.46.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 May 2020 04:46:28 -0700 (PDT)
Date: Mon, 11 May 2020 12:46:24 +0100
From: Quentin Perret <qperret@google.com>
To: Lukasz Luba <lukasz.luba@arm.com>
Subject: Re: [PATCH v7 01/15] PM / EM: change naming convention from
 'capacity' to 'performance'
Message-ID: <20200511114624.GA11091@google.com>
References: <20200511111912.3001-1-lukasz.luba@arm.com>
 <20200511111912.3001-2-lukasz.luba@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200511111912.3001-2-lukasz.luba@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200511_044633_470550_9F6AB4FC 
X-CRM114-Status: UNSURE (   6.75  )
X-CRM114-Notice: Please train this message.
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
Cc: nm@ti.com, juri.lelli@redhat.com, peterz@infradead.org,
 viresh.kumar@linaro.org, liviu.dudau@arm.com, dri-devel@lists.freedesktop.org,
 bjorn.andersson@linaro.org, bsegall@google.com,
 alyssa.rosenzweig@collabora.com, festevam@gmail.com, mka@chromium.org,
 robh@kernel.org, amit.kucheria@verdurent.com, lorenzo.pieralisi@arm.com,
 vincent.guittot@linaro.org, khilman@kernel.org, agross@kernel.org,
 daniel.lezcano@linaro.org, steven.price@arm.com, cw00.choi@samsung.com,
 mingo@redhat.com, linux-imx@nxp.com, rui.zhang@intel.com, mgorman@suse.de,
 orjan.eide@arm.com, daniel@ffwll.ch, linux-pm@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, s.hauer@pengutronix.de, rostedt@goodmis.org,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 linux-omap@vger.kernel.org, Dietmar.Eggemann@arm.com,
 linux-arm-kernel@lists.infradead.org, airlied@linux.ie,
 tomeu.vizoso@collabora.com, sboyd@kernel.org, rdunlap@infradead.org,
 rjw@rjwysocki.net, linux-kernel@vger.kernel.org, b.zolnierkie@samsung.com,
 kernel@pengutronix.de, sudeep.holla@arm.com, patrick.bellasi@matbug.net,
 shawnguo@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Monday 11 May 2020 at 12:18:58 (+0100), Lukasz Luba wrote:
> The Energy Model uses concept of performance domain and capacity states in
> order to calculate power used by CPUs. Change naming convention from
> capacity to performance state would enable wider usage in future, e.g.
> upcoming support for other devices other than CPUs.
> 
> Acked-by: Daniel Lezcano <daniel.lezcano@linaro.org>
> Signed-off-by: Lukasz Luba <lukasz.luba@arm.com>

Acked-by: Quentin Perret <qperret@google.com>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
