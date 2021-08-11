Return-Path: <SRS0=F7c8=NC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A922DC4338F
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Aug 2021 09:34:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 61CB060F55
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Aug 2021 09:34:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 61CB060F55
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=acE0vp5s8EV9CLT8UyrMidpV6VNYMkwQN1CPCmg5xcY=; b=n8gwHJX+uQqg54
	IoSHSxuBie00WXU77Ref7QGZ2lLdLewyNRyjvQaXrwVPKT3h2ii5LOP570lvnrUVofU06NabWERqE
	2iG+4MEXm2JcU//9PX9wwzWwt4DlHFCoAZWxQwKY+qbPb+pgu01oztm6pr48oX+axhKBA8+hyRpvG
	b+f9cTgPaol6PaJaAheBP3IMGGezJ3u9eyThdXil7L9IP+gUomdU6/mt6xzOE79iu8zsRs3J010Ze
	hdCssWMdo4d2UlRTJXTju1F5Nv0Bo/XhAUrN/lvUphQQx5Fun38Y3GF9frg1LZQqKfQe/2B9dNON6
	stuIXLUmydrn2Bq/+ncQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mDkcT-006KNU-BC; Wed, 11 Aug 2021 09:33:53 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mDkIg-006DiM-KJ
 for linux-mediatek@lists.infradead.org; Wed, 11 Aug 2021 09:13:30 +0000
Received: by mail-pl1-x629.google.com with SMTP id b7so1828214plh.7
 for <linux-mediatek@lists.infradead.org>; Wed, 11 Aug 2021 02:13:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=3ZkAU2QHfzdbeB6vZcR6DekWG4U8QzIxN1zOaeYHseo=;
 b=oDomj3rRcyWzJT98WWaMn3iUHVhd213N1K7Dc6cCQNOuPXxWqAQZdSD0fDwhqTUN5H
 bL4VRM/Iq7Wnsd4s6S13jK+Oga0ym2De4dTzSegfF9dfZet2+bbu2ZPOCAdoSEawJ8FA
 UXppbc0qPyrJkus/W8SGWprMiFPmMrprxll6d0dRRhVC3CslE0T9qVutq9EI9huG3Iwn
 EZLXH52csD4G2MXoVd5zYIl9SRzm3VzrvoM4OsXUpBoo/cNdomdEy5OlucKVNj2x0R2J
 /DHNb0L4ubFFusIvvIuglUm9c8BXGcewvgnZTrXsT4nQLY9mvU80q5OyqS4C+dliiQtr
 7XHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=3ZkAU2QHfzdbeB6vZcR6DekWG4U8QzIxN1zOaeYHseo=;
 b=SFzgxlcHwGbz+txbyRHxZbWmDAsFifrf5xIo/LPjYx7kJz/VZuNaASU6YZKR34X9wC
 48avjk5IpRI4qn2cGHIbM6vxHZo47zvE/3JKrF1BpWAimUxpMU4RltApaT3XdMh71qBC
 73p0WFuFevNRRYCPsqS65dlMiDpc0A4RqpGGvWK7Q+qHKtJwWDIaP18/sEAPC/Qoeajf
 wnRIJteJ6Pi3sO2MHLXkxZiYn6/xgrQ28197RYGqXegYE2K9lCh9yq8ZxOZeAzyv5lQq
 2q0nqEup4VHEvyqMV1xQP4No63ktwL437m60Zr1/KnExzGsbnEG+HoJBkk6dd3/q9O73
 WAng==
X-Gm-Message-State: AOAM531XeywdJXuluv1JXHR7n6DTuHFIFPEsTOrSdNAepi5K0X8vxfAI
 cSPkt2fdtXj4pp+n2Q6e5H0jEQ==
X-Google-Smtp-Source: ABdhPJw6gEf2Fw6iBxua2gL1EBsBW5dHh3H63IoaqHdI9KWyzvZpYGzAm266LjhE7aZjzOuSMwvjGg==
X-Received: by 2002:a62:e914:0:b029:3dd:a1d0:be57 with SMTP id
 j20-20020a62e9140000b02903dda1d0be57mr2957701pfh.11.1628673204607; 
 Wed, 11 Aug 2021 02:13:24 -0700 (PDT)
Received: from localhost ([122.172.201.85])
 by smtp.gmail.com with ESMTPSA id mr18sm24660227pjb.39.2021.08.11.02.13.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Aug 2021 02:13:24 -0700 (PDT)
Date: Wed, 11 Aug 2021 14:43:21 +0530
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
Message-ID: <20210811091321.xtb776q4t6cwyanx@vireshk-i7>
References: <cover.1628579170.git.viresh.kumar@linaro.org>
 <YRJym+Vn4bbwQzzs@google.com>
 <20210811051859.ihjzhvrnuct2knvy@vireshk-i7>
 <YROMZFHCor3pbhMr@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YROMZFHCor3pbhMr@google.com>
User-Agent: NeoMutt/20180716-391-311a52
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210811_021326_713713_E15280FA 
X-CRM114-Status: GOOD (  26.15  )
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

On 11-08-21, 09:37, Quentin Perret wrote:
> On Wednesday 11 Aug 2021 at 10:48:59 (+0530), Viresh Kumar wrote:
> > I had to use the pm-opp version, since almost everyone was using that.
> > 
> > On the other hand, there isn't a lot of OPP specific stuff in
> > dev_pm_opp_of_register_em(). It just uses dev_pm_opp_get_opp_count(),
> > that's all. This ended up in the OPP core, nothing else. Maybe we can
> > now move it back to the EM core and name it differently ?
> 
> Well it also uses dev_pm_opp_find_freq_ceil() and
> dev_pm_opp_get_voltage(), so not sure how easy it will be to move, but
> if it is possible no objection from me.

What uses these routines ? dev_pm_opp_of_register_em() ? I am not able
to see that at least :(

> Right but the EM is a description of the hardware, so it seemed fair
> to assume this wouldn't change across the lifetime of the OS, similar
> to the DT which we can't reload at run-time. Yes it can be a little odd
> if you load/unload your driver module, but note that you generally can't
> load two completely different drivers on a single system. You'll just
> load the same one again and the hardware hasn't changed in the meantime,
> so the previously loaded EM will still be correct.

Yeah, it will be the same driver but a different version of it, which
may have updated the freq table. For me the EM is attached to the
freq-table, and the freq-table is not available anymore after the
driver is gone.

Anyway, I will leave that for you guys to decide :)

> I hear your argument
> about cpufreq driver development, but the locking involved to allow
> 'just' that is pretty involved, and nobody has complained about this
> specific issue so far, so that didn't seem worth it. If we do have good
> reasons to change the EM at runtime, then yes I think we should do it,
> it just didn't seem like that was the case until now.

-- 
viresh

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
