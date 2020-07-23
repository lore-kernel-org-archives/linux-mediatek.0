Return-Path: <SRS0=cyKo=BC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C00EFC433EC
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jul 2020 19:07:51 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8E692206F4
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jul 2020 19:07:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="vjBYvM56";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="uJ/LXXd4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8E692206F4
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=eNEX5H/M7ScDi9bAY6jd4Khgy1gDlAFZFb+dYuNOJ9A=; b=vjBYvM563oqacXiMYViDVAsTC
	/+Kq1FhFBDO+GEcvHpcto/Nb9lndOCLuKJQNWmVd4O1279E6BLlst0ScZX5XrXvYxIAQxqa7AYQZt
	Z38nLYM4m9aJdXABUEvkYUl+vaNHVIvqckJ7k80ORL2ebgJp4QXClJDYu24tqn0tb0ePTYIvKO1lY
	0AvbjHduRuJ7VPLWchZtFFDsBfJxrjAJ0Et2/3jqG0o6BkLTnxmQlOiGqXMdbUY2d8Bb2gUqwxi1e
	DOqLXn+O7SpM0pnMddqrbt13/n//u87UKzBd2MLKei7tc1dTLj6SEZPgJ+qoWXYKpu1xs04RcY2B5
	qg6h36hzg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jygZ9-0003ii-RB; Thu, 23 Jul 2020 19:07:39 +0000
Received: from mail-pj1-x1043.google.com ([2607:f8b0:4864:20::1043])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jygZ6-0003hU-DS
 for linux-mediatek@lists.infradead.org; Thu, 23 Jul 2020 19:07:37 +0000
Received: by mail-pj1-x1043.google.com with SMTP id a9so3624805pjd.3
 for <linux-mediatek@lists.infradead.org>; Thu, 23 Jul 2020 12:07:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=fmy4tO1tW/yB2p+/DBGuPfpuvcNIPQV/6jKnfwUymaM=;
 b=uJ/LXXd4WW3t/V9uP1pvh2+w7xCfmHmmU2q2MX994uvmdMhyUpnBd6wtTkFWVeSiVn
 fni2Skynmv78aJ9rstIyOgTssb4uBzBQL6YPmxb5SzQaGZtm2sB0Ln7Qk9r6vt5a/SEE
 gYzQRW0K8FC5lX9W9+bz+gbIOgybElEHRuMxxBvv7T+TJKJnGfXHkIe/b2UFhfrjNnt8
 hmvs/pCT8mt2wp6eGsvntxKg2m7zjG9IalAT3RXT7FCW3qu0zRZl84tHISI7JSF/JPwL
 M06pYkfoNbZamtdmUh5GU20hgxfU9YBtWQ50on6QDjz/h882N3ikL5uKYSp6UNdyl0GU
 5IDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=fmy4tO1tW/yB2p+/DBGuPfpuvcNIPQV/6jKnfwUymaM=;
 b=Jl37NF06/lqQXGD1ue7KKkDucP/7zIlFJ1+tf1xgVXUTnknyN6Liyh+d4ZtqWAzYCv
 0Me/FenogzD9X54GgmvX7kZGaCtJoE7IK/kAPyq+MoA/wFrJGKEV44aYqf3eG4Xi5U94
 0HIKE3F/Gjw9fybHqNiNXhij0BHcmqzKzMtOgJot+EoGmv+0cL/6J4PPjMz96En/bP6B
 pLEVOqKl+dgaWv36znViBSxQlujJECZ8mUm2YR00j05YZk0zCy0IB/Rb0sQ0/qIKAHJJ
 nbOM/3Tg0SW8ItZgp6Mf8R/uGx0Etwc60NL8evLEbLpibAuLWUEeBIR9cnYY5Ho570nG
 vXCw==
X-Gm-Message-State: AOAM53268muaLgeG3wQp7rhIrH29QP9j6HhmDbQd7ilZEGw0c+59RGpn
 z8ooQdeiHBsWcOM9/zfpmj540A==
X-Google-Smtp-Source: ABdhPJyFY8SK2yrpGMIJYPZOm/XbUPFW09vVIwr7j2Oue2l2cEXybEXOCRDyJvKCGSvI32jjRGApEQ==
X-Received: by 2002:a17:902:22:: with SMTP id 31mr4590106pla.120.1595531251889; 
 Thu, 23 Jul 2020 12:07:31 -0700 (PDT)
Received: from google.com ([2620:15c:201:2:f693:9fff:fef4:1b6d])
 by smtp.gmail.com with ESMTPSA id h6sm3716298pfo.123.2020.07.23.12.07.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Jul 2020 12:07:31 -0700 (PDT)
Date: Thu, 23 Jul 2020 12:07:24 -0700
From: Sami Tolvanen <samitolvanen@google.com>
To: Neal Liu <neal.liu@mediatek.com>
Subject: Re: [PATCH v2] cpuidle: change enter_s2idle() prototype
Message-ID: <20200723190724.GA1339461@google.com>
References: <1594005196-16327-1-git-send-email-neal.liu@mediatek.com>
 <1594005196-16327-2-git-send-email-neal.liu@mediatek.com>
 <CAJZ5v0ihB5AJwSRpjaOnXAmciregzxARL5xfudu1h+=_LXaE_w@mail.gmail.com>
 <1594350535.4670.13.camel@mtkswgap22>
 <1595233294.8055.0.camel@mtkswgap22>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1595233294.8055.0.camel@mtkswgap22>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200723_150736_549711_0CA7F59C 
X-CRM114-Status: GOOD (  26.83  )
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
Cc: Jacob Pan <jacob.jun.pan@linux.intel.com>,
 linux-tegra <linux-tegra@vger.kernel.org>,
 wsd_upstream <wsd_upstream@mediatek.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Linux PM <linux-pm@vger.kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, lkml <linux-kernel@vger.kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 "moderated list:ARM/Mediatek SoC..." <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Jul 20, 2020 at 04:21:34PM +0800, Neal Liu wrote:
> Gentle ping on this patch.
> 
> 
> On Fri, 2020-07-10 at 11:08 +0800, Neal Liu wrote:
> > On Thu, 2020-07-09 at 14:18 +0200, Rafael J. Wysocki wrote:
> > > On Mon, Jul 6, 2020 at 5:13 AM Neal Liu <neal.liu@mediatek.com> wrote:
> > > >
> > > > Control Flow Integrity(CFI) is a security mechanism that disallows
> > > > changes to the original control flow graph of a compiled binary,
> > > > making it significantly harder to perform such attacks.
> > > >
> > > > init_state_node() assign same function callback to different
> > > > function pointer declarations.
> > > >
> > > > static int init_state_node(struct cpuidle_state *idle_state,
> > > >                            const struct of_device_id *matches,
> > > >                            struct device_node *state_node) { ...
> > > >         idle_state->enter = match_id->data; ...
> > > >         idle_state->enter_s2idle = match_id->data; }
> > > >
> > > > Function declarations:
> > > >
> > > > struct cpuidle_state { ...
> > > >         int (*enter) (struct cpuidle_device *dev,
> > > >                       struct cpuidle_driver *drv,
> > > >                       int index);
> > > >
> > > >         void (*enter_s2idle) (struct cpuidle_device *dev,
> > > >                               struct cpuidle_driver *drv,
> > > >                               int index); };
> > > >
> > > > In this case, either enter() or enter_s2idle() would cause CFI check
> > > > failed since they use same callee.
> > > 
> > > Can you please explain this in a bit more detail?
> > > 
> > > As it stands, I don't understand the problem statement enough to apply
> > > the patch.
> > > 
> > 
> > Okay, Let's me try to explain more details.
> > Control Flow Integrity(CFI) is a security mechanism that disallows
> > changes to the original control flow graph of a compiled binary, making
> > it significantly harder to perform such attacks.
> > 
> > There are multiple control flow instructions that could be manipulated
> > by the attacker and subvert control flow. The target instructions that
> > use data to determine the actual destination.
> > - indirect jump
> > - indirect call
> > - return
> > 
> > In this case, function prototype between caller and callee are mismatch.
> > Caller: (type A)funcA
> > Callee: (type A)funcB
> > Callee: (type C)funcC
> > 
> > funcA calls funcB -> no problem
> > funcA calls funcC -> CFI check failed
> > 
> > That's why we try to align function prototype.
> > Please feel free to feedback if you have any questions.

I think you should include a better explanation in the commit message.
Perhaps something like this?

  init_state_node assigns the same callback function to both enter and
  enter_s2idle despite mismatching function types, which trips indirect
  call checking with Control-Flow Integrity (CFI).

> > > > Align function prototype of enter() since it needs return value for
> > > > some use cases. The return value of enter_s2idle() is no
> > > > need currently.
> > > 
> > > So last time I requested you to document why ->enter_s2idle needs to
> > > return an int in the code, which has not been done.  Please do that.

Rafael, are you happy with the commit message documenting the reason,
or would you prefer to also add a comment before enter_s2idle?

Sami

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
