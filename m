Return-Path: <SRS0=F7c8=NC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F30BC4338F
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Aug 2021 05:34:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AE6BC60FA0
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Aug 2021 05:34:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AE6BC60FA0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9MOeGI+W2NGVp/bqDdIIt9x8e+TZxYi0Bfq/PmbWO/I=; b=12/1JXptRZVXOy
	PbUKl4q3tVEnPWJPO1mZfqGwFcuhMpvgVzFehnfrNXLpaFKkTCFAOmlc+zUbbSuNnCUPo4iC68EoK
	VGj6uj4fnMhRAfEGyztBP+IJDdr98VXuHJzQ4l+1lP9ypM1wgphm8v+13GY8SKt9Ig/0Kx2LuRPK9
	MCCojo6aMjCJG63FCq53lQ5fxlZDMpTeU5f2FhJMET225OggWSNHFrchtQDTUgKEZKh5Avn7KyenB
	bPZ05VBqNQPjinlJ+zr7U4nr9lsa2nIY4Wlc0v/kk7f6bH1tNmNo7bb+9XB6vecLNJriobin64s4r
	k5U50fktN968HyQjKBBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mDgsZ-005e3I-IF; Wed, 11 Aug 2021 05:34:15 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mDgsU-005e21-7Y
 for linux-mediatek@lists.infradead.org; Wed, 11 Aug 2021 05:34:14 +0000
Received: by mail-pj1-x1029.google.com with SMTP id
 mq2-20020a17090b3802b0290178911d298bso2883903pjb.1
 for <linux-mediatek@lists.infradead.org>; Tue, 10 Aug 2021 22:34:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=ScSbxJofNLIiJut+toTZ7USozFNrpn/9FRU/yhxl+AE=;
 b=eb6WOqa/iiW+lVxPN/WwlN1ktVPrT2bUzlrRfDrYo41IvDzG4/ln5yWs6uXhICalPc
 8R0u5AzW7yMU6cYgS+wfVr1wFhPcTBbZD2Xyd4b7nHZ3hafixxLtxxbPGwpJLDHfRGdI
 zsU9bV0uTcH4s9YjyKyk3RwVbO/HStRc+oKgUx5B2+8G9pO8KCbN0SSodCkkTKH5OwCj
 NkEi8tGAip3xqqCWY5Cd5cCb4jacmdKEE4+LxGNZA+sGwQu085Zzb25vTOg1ndLK0z5V
 r4ejQRIY4GkBb+GZRhHuNkrSOOBP5ZQyuytbggBbhP7/xyVm24hsXA8Zo39boZpUz10E
 Ygng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=ScSbxJofNLIiJut+toTZ7USozFNrpn/9FRU/yhxl+AE=;
 b=H7q7eKlIC0AWBjewCIqFjLsXvU7X7AD932bE//YsovoCEAB909+iDgJKj44S89qPkl
 D3g6L3C8Qf5IU3K7MqhwNR3M0F1yt6AhxZ2kZk6woQ7ZX/1xj8c/sus+VfXtRAdymoj6
 itHMifNeYc0udFezBzsh4SXCbWXjsGdKghhCBNR2OG594vsREzCKx+dW6CR2vQ8kBdbE
 rlRZeiczGWcdIxWGuLQqE77a00d2LCQhLOO3KvIY10p3h3cg5yi4YrvXcJPkLUza5LMJ
 8EqLUfhHfqZVR1GC0QTbrmfgfVa6eHTSTLD4Thn7IvYSK7Aluur9okD6joosR4N7YPH3
 dzOw==
X-Gm-Message-State: AOAM532mNSH/ICQ/BcanAgo7jP0mu24YwPtZnkula2kZ5G8fLNwPpG0G
 +YlaznMmKl94nAsyVBGFU9X4Ww==
X-Google-Smtp-Source: ABdhPJyJHzEP2u8Lqj/aaTrSt5nOj9C159L82xQKicF/GaJrGfuVo5tn/qTlGn31FvoW9cEaqP30pg==
X-Received: by 2002:a17:902:8507:b029:12b:533e:5e9d with SMTP id
 bj7-20020a1709028507b029012b533e5e9dmr28394940plb.53.1628660049321; 
 Tue, 10 Aug 2021 22:34:09 -0700 (PDT)
Received: from localhost ([122.172.201.85])
 by smtp.gmail.com with ESMTPSA id q4sm6443106pga.48.2021.08.10.22.34.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Aug 2021 22:34:08 -0700 (PDT)
Date: Wed, 11 Aug 2021 11:04:06 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Quentin Perret <qperret@google.com>
Cc: Rafael Wysocki <rjw@rjwysocki.net>,
 Vincent Donnefort <vincent.donnefort@arm.com>, lukasz.luba@arm.com,
 Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Cristian Marussi <cristian.marussi@arm.com>,
 Fabio Estevam <festevam@gmail.com>, Kevin Hilman <khilman@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Sudeep Holla <sudeep.holla@arm.com>, linux-pm@vger.kernel.org,
 Vincent Guittot <vincent.guittot@linaro.org>,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-omap@vger.kernel.org
Subject: Re: [PATCH 0/8] cpufreq: Auto-register with energy model
Message-ID: <20210811053406.jqwextgtnxhgsjd2@vireshk-i7>
References: <cover.1628579170.git.viresh.kumar@linaro.org>
 <YRJym+Vn4bbwQzzs@google.com>
 <20210811051859.ihjzhvrnuct2knvy@vireshk-i7>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210811051859.ihjzhvrnuct2knvy@vireshk-i7>
User-Agent: NeoMutt/20180716-391-311a52
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210810_223410_443615_7227545E 
X-CRM114-Status: GOOD (  14.98  )
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

On 11-08-21, 10:48, Viresh Kumar wrote:
> On 10-08-21, 13:35, Quentin Perret wrote:
> > This series adds more code than it removes,
> 
> Sadly yes :(
> 
> > and the unregistration is
> > not a fix as we don't ever remove the EM tables by design, so not sure
> > either of these points are valid arguments.
> 
> I think that design needs to be looked over again, it looks broken to
> me everytime I land onto this code. I wonder why we don't unregister
> stuff.

Coming back to this series. We have two options, based on what I
proposed here:

https://lore.kernel.org/linux-pm/20210811050327.3yxrk4kqxjjwaztx@vireshk-i7/

1. Let cpufreq core register with EM on behalf of cpufreq drivers.

2. Update drivers to use ->ready() callback to do this stuff.

I am fine with both :)

-- 
viresh

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
