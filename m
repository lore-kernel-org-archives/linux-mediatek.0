Return-Path: <SRS0=F7c8=NC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FSL_HELO_FAKE,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF6A2C4338F
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Aug 2021 09:54:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7BEFF60FDA
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Aug 2021 09:54:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7BEFF60FDA
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4RbE8cxZvJfjmsxy2a8diEGc/NmSjlmrYh90egzI2qE=; b=pvsO30HR7ROzgK
	NmHIYKbCK4OqCCeW7Bds90Xh4QqNYtM+MT1LK77HPj5uDHGfwDJzxpECKBRZeFqvVPQiB9Am4vd4U
	PWpY/qlpIATprfDCQAtVPdAXLL6/v5D4R0D+W1P2tGZOk6w5FCV1eytgzAf/FBWWc6KL1Cmg1OTCh
	NDW4sQuzojb7L8l+EiQOCgssGyPhKZGewp5wgBwbpn+boPzeBVFCPTjYuelO/1J9DQ7N+0obF8vmO
	LzViG05kOqLVnW6krkOuCmz4UeP4CDTUHY8dQu34cMoFWjSVhyw/kFnwf1BGKvEAJpymYJx5G7gm6
	E55QB/6uk5MaB6sUGcWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mDkvr-006RuQ-48; Wed, 11 Aug 2021 09:53:55 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mDkqx-006Q50-4y
 for linux-mediatek@lists.infradead.org; Wed, 11 Aug 2021 09:48:52 +0000
Received: by mail-wm1-x336.google.com with SMTP id
 q11-20020a7bce8b0000b02902e6880d0accso3988457wmj.0
 for <linux-mediatek@lists.infradead.org>; Wed, 11 Aug 2021 02:48:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=p4WmlR24/y2/H/iFDZT8SMkW7O2fno0PSDl3vpvyQeE=;
 b=iaVC7Y7Zmp0QcX38aol/tjPqpn4a9rxsP+5sEfJ55JdRHQf78WhTS54TvYm1QuiZb9
 Tfv0V+kMCmuN3NlmWiy+TFbkP8Z36BybITbwzyiRLjWOhIIr9BHtWja4KxbVpcBPi/HI
 HuD68dSvDc/WEbgyaUM8PsEuId/nmfzZ9pPp60bwzZ1zayPm70ShfyqrudfelYC77Hsv
 lYfsQBRYWFNavWRipVgXXp3YGsoJzSPKV2/B/dz02TFMtktJ/TilyV8Jiu+vO4+FU2Ra
 CLbILl4Kx7dV2I8iGXshcBeO08NSv6p9CNlc4nncGiFlrwXLzL7ajuNEyVzb/lB2uvJY
 953w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=p4WmlR24/y2/H/iFDZT8SMkW7O2fno0PSDl3vpvyQeE=;
 b=CrwGi/dHGvaWyMs5ktw2AZV6U28Y525Q+jsX2H1evjn02ZtkWCrPuPNmD1TLxLzDB8
 0HvhPrCRIGnVAa2xHrooZT7HhL91wtpSba9Xh4nqG5E8Og6q9AQuhjfzmOq3qm/q9dda
 47KQIXb3twftrLi6MrZF8iclcfYLhHPuqyV2gCm8NEUBgMo8nvmyNaiGcqXNgVDzONe0
 al2FmhfDU34JTnKdLdSfnWc9wKD6HPJAA0uWhx+qqnzs40+yMU99hr1CsuWaOXTFF3rG
 XoatpYX0q3XBsu8FELVUhm6/MFPPQd5x/QTToOzgdIAcWEWlOzr9pLvxUkc93NSCn93n
 s6dQ==
X-Gm-Message-State: AOAM532KHeH4L8i+8vnvbZ2Jr3eR9GhP9RZ2qQ0dESrZhfVsZb+YmHKY
 t1JFF1bgKPIlTSnRjcuw0m555g==
X-Google-Smtp-Source: ABdhPJwGyl1imWlJBD9wXE9eHTwazSKJ1G8Ab8pkXMP8KjdfEz4VJdIoamsdZzeXoxBFY1zz1ZxyEw==
X-Received: by 2002:a7b:c350:: with SMTP id l16mr8974823wmj.151.1628675325873; 
 Wed, 11 Aug 2021 02:48:45 -0700 (PDT)
Received: from google.com ([2a00:79e0:d:210:43fd:e634:73d9:e10e])
 by smtp.gmail.com with ESMTPSA id p4sm14701093wrq.81.2021.08.11.02.48.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Aug 2021 02:48:45 -0700 (PDT)
Date: Wed, 11 Aug 2021 10:48:39 +0100
From: Quentin Perret <qperret@google.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
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
Message-ID: <YROc95YKA1Y/TfYI@google.com>
References: <cover.1628579170.git.viresh.kumar@linaro.org>
 <YRJym+Vn4bbwQzzs@google.com>
 <20210811051859.ihjzhvrnuct2knvy@vireshk-i7>
 <20210811053406.jqwextgtnxhgsjd2@vireshk-i7>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210811053406.jqwextgtnxhgsjd2@vireshk-i7>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210811_024851_254288_E3DDB3D3 
X-CRM114-Status: GOOD (  23.59  )
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

On Wednesday 11 Aug 2021 at 11:04:06 (+0530), Viresh Kumar wrote:
> On 11-08-21, 10:48, Viresh Kumar wrote:
> > On 10-08-21, 13:35, Quentin Perret wrote:
> > > This series adds more code than it removes,
> > 
> > Sadly yes :(
> > 
> > > and the unregistration is
> > > not a fix as we don't ever remove the EM tables by design, so not sure
> > > either of these points are valid arguments.
> > 
> > I think that design needs to be looked over again, it looks broken to
> > me everytime I land onto this code. I wonder why we don't unregister
> > stuff.
> 
> Coming back to this series. We have two options, based on what I
> proposed here:
> 
> https://lore.kernel.org/linux-pm/20210811050327.3yxrk4kqxjjwaztx@vireshk-i7/
> 
> 1. Let cpufreq core register with EM on behalf of cpufreq drivers.

If we're going that route, I think we should allow _all_ possible
EM registration methods (via PM_OPP or else) to be done that way.
Otherwise we're creating an inconsitency in how the EM is registered
(e.g. from the ->init() cpufreq callback for some, or from cpufreq core
for others) which is problematic as we risk building features that
assume loading is done at a certain time, which won't work for some
platforms.

> 2. Update drivers to use ->ready() callback to do this stuff.

I think this should work, but perhaps will be a bit tricky for cpufreq
driver developers as they need to have a pretty good understanding of
the stack to know that they should do the registration from here and not
->init() for instance. Suggested alternative: we introduce a ->register_em()
callback to cpufreq_driver, and turn dev_pm_opp_of_register_em() into a
valid handler for this callback. This should 'document' things a bit
better, avoid some of the problems your other series tried to achieve, and
allow us to call the EM registration in exactly the right place from
cpufreq core. On the plus side, we could easily make this work for e.g.
the SCMI driver which would only need to provide its own version of
->register_em().

Thoughts?

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
