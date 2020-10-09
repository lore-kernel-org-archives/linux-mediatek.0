Return-Path: <SRS0=0dL+=DQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D715C433E7
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Oct 2020 05:15:49 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C40122184D
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Oct 2020 05:15:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TjWO3f+C";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XCoNHHpR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C40122184D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=omZYHCpuOVWmbmV9k0FmboF1Dpt6p4jlfv++UPrTFkI=; b=TjWO3f+CnQXfCrqqHnX4GFwUZ
	xnQzvETxUvT7eOtliK4X6w6mWpqII+kPc0kiqUH+7gd0Z4NuwMXumWZtYjwRv6WiFk4zdH3duDcwE
	3sDMR0L+8xDmrOgLfA2roTcLdnSnJf2RoBaMAGPGzIoiVPbqGninjunh8giKOslAp5HVyWNMpqH1B
	oEb86WxTMZvN7+TjdtKhHCtOYajnZ330IjlQhCcW4oGwrv035Vr//gPleKJM5Fd4o7InUzFRdYIgT
	wkfBYjXcQlSzgVEuHnzQqq7f7tXFu3kAD9inFHEbXAsOULCoVB+8ZgIM5k0LZ5Vl6SYm+tcfiXWQt
	pcabzFmxw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kQkkm-00021Q-Ux; Fri, 09 Oct 2020 05:15:40 +0000
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kQkkj-000206-2j
 for linux-mediatek@lists.infradead.org; Fri, 09 Oct 2020 05:15:38 +0000
Received: by mail-pg1-x541.google.com with SMTP id 34so6215913pgo.13
 for <linux-mediatek@lists.infradead.org>; Thu, 08 Oct 2020 22:15:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=G8Nv66WyfzDbZb96ZzpHY2rCT/XGW71eFKJ/39nR8TI=;
 b=XCoNHHpR6Vhu0dp1FPc+9nNkBsd5828pOu6BwS+P8s2Vdorubxx2Y2IAtZsi/nMaca
 e+TkRySMistYnVoFo5Z9bLk7QRa4W6weIKbFGeJH0Vz5orS5mNhLXq3Hxd9Fa5Tgf1sI
 NhlYxCX+6eRYUbGun4XXVlbz7e6EjJaYRoKlddaptvY/bK1P1mXBltBbFfrGjZpRJxNo
 8xmC36xR0mcZ2Hjz/k2WlRrVCyu5dIOr9dlLZQKsLf81SC+yNk2TPlU20njb/v3X2Szc
 S2LTCV6AQnPdmhhH3HzZywkVzzDzkuiRUNg86ydh+cG09bU/omt0wDu3NEc9XYv88M89
 xn4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=G8Nv66WyfzDbZb96ZzpHY2rCT/XGW71eFKJ/39nR8TI=;
 b=b6qCMtTGVHs53heMiM3CEbaw6t8iqM0tCnOK1VGEfaYyHlbfh0ezzqcYQQJr7m3HHT
 TyRLtb736vLPki+9ry8cEQXksjiekHwhhoUS6lykzXLi3NQPjqMWB8sx+z+AmVL9M15a
 b3oxYlzFraDh5Ykh62iiy2xrTtzXwLrNXOUSufS8lYlxEHFEdjPET0TdWs9eKp4WfnIq
 /4deidPXGSOG7DYBIDuW+JR3/gHuF5ltU7jUoBSHimtHoksrlw+1NDhk4GIVASbgr4bU
 SjbcDyZGCeWf2OOkqdoNguXaIwu4IsnqcB3bwsIh8QLLS1yf8XiV7iYOpVeWcOQdqQiY
 06eQ==
X-Gm-Message-State: AOAM530N8hSZk0pJy+4yp32WZNc9WU3P/ojBO9M/04Oy3gkI3dOUQlAP
 Kr24WZh9TQcwkAa6ATmNkjmaIxR3Km+u0A==
X-Google-Smtp-Source: ABdhPJwMAbt3m8tzVuwutYCoq9Ex4jJiYU6jAHGkyZslmrwAEnxhVZ77mlrygUBEez+RF7uvOzZPlg==
X-Received: by 2002:a63:d046:: with SMTP id s6mr2103311pgi.76.1602220534209;
 Thu, 08 Oct 2020 22:15:34 -0700 (PDT)
Received: from localhost ([122.181.54.133])
 by smtp.gmail.com with ESMTPSA id gd14sm9188455pjb.31.2020.10.08.22.15.33
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 08 Oct 2020 22:15:33 -0700 (PDT)
Date: Fri, 9 Oct 2020 10:45:31 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Hector Yuan <hector.yuan@mediatek.com>
Subject: Re: [PATCH v1 1/1] cpufreq: mediatek-hw: Register EM power table
Message-ID: <20201009051531.gmlpv4wnpbtyqldt@vireshk-i7>
References: <1602159204-13756-1-git-send-email-hector.yuan@mediatek.com>
 <1602159204-13756-2-git-send-email-hector.yuan@mediatek.com>
 <20201009041912.nzhvubzmfox2twxg@vireshk-i7>
 <1602218579.21446.57.camel@mtkswgap22>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1602218579.21446.57.camel@mtkswgap22>
User-Agent: NeoMutt/20180716-391-311a52
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201009_011537_121933_F4B27835 
X-CRM114-Status: GOOD (  20.67  )
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
Cc: wsd_upstream@mediatek.com, linux-pm@vger.kernel.org,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 09-10-20, 12:42, Hector Yuan wrote:
> On Fri, 2020-10-09 at 09:49 +0530, Viresh Kumar wrote:
> > On 08-10-20, 20:13, Hector Yuan wrote:
> > > From: "Hector.Yuan" <hector.yuan@mediatek.com>
> > > 
> > > Register CPU power table to energy model framework
> > > 
> > > Signed-off-by: Hector.Yuan <hector.yuan@mediatek.com>
> > > ---
> > >  drivers/cpufreq/mediatek-cpufreq-hw.c |   50 +++++++++++++++++++++++++--------
> > >  1 file changed, 38 insertions(+), 12 deletions(-)
> > 
> > I don't see this file in mainline. What am I missing ?
> > 
> Hi, Viresh:
> 
> Yes, I base on my patches which is currently reviewed by Rob for the
> Device tree part.
> As I mentioned in cover letter.
> 
> This patch depends on Mediatek cpufreq HW driver patch submitted by
> Hector Yuan.
>  https://lkml.org/lkml/2020/9/10/13
> 
> I have asked your approval for sending my new patches based on it and
> you said it's okay to you.
> I will stop sending new patches if you have any concerns.
> Thank you so much.

Sorry about that, I failed to see the details in the cover-letter.

-- 
viresh

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
