Return-Path: <SRS0=3jAl=FB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B0B9C3E8C5
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Nov 2020 18:25:24 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E17B42224B
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Nov 2020 18:25:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="w/HYl40C";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qZK9SghC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E17B42224B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=agrulAEbw74CYh/+oI1hP8ouF95rfYCOxhTKXXj8lnw=; b=w/HYl40C3djPhR1wug1qjKFiN
	hfUUKkCEYQPipWFZVPXuJ5S1Ef4M8gMw7SsPLDZr8iiDqnPI4vyEVxCZ2txD17ds1g5qXaYvBYcMM
	EsehKLXkZkqTvLLxxnzJniA1h1UW2iBku66Qag4DJZaYr2fTzHKM9mMJs4yYOcC+bpgKoLVm0JMga
	PO9MgWO2Mm1c0rBuQuqM98jpeUUNFxmNETJUM6jEsGvvxQPb3iS7/82dS/vkeQK/zqFQTcUlfZ431
	4Euc/G+SiIp8hiQA9OBs28bQPEG1jEf2H0r9RMEI1XlkP2pvP1xS3zKADCMIfr3oA2iQnOQf3cMIT
	n9dsJv6Sw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kiiQo-0007UF-8N; Fri, 27 Nov 2020 18:25:18 +0000
Received: from mail-il1-x141.google.com ([2607:f8b0:4864:20::141])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kiiQj-0007TS-QO
 for linux-mediatek@lists.infradead.org; Fri, 27 Nov 2020 18:25:14 +0000
Received: by mail-il1-x141.google.com with SMTP id x15so5409762ilq.1
 for <linux-mediatek@lists.infradead.org>; Fri, 27 Nov 2020 10:25:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6kYoVKqPC3vhqU3nrR8MKfApG6zVMbrBxSj843bnZ/E=;
 b=qZK9SghCUm4wMaFfBrzS7CyvIixET6Sh0iFuK0MFi/MgD408Jk0gmPHcV/FuomkdNx
 45q7TGYLZr9S3LsGC5WxePnOwe+COlLD97VN2Qq81ylU19XYH7Ose4dqwgNGInAnMEfI
 wJriQc7TkjW1I+U2TfD41BPMZu7eCBmFAk7h/KbjaV2UK6boPRQaeOMwDfP2hCiAyHg3
 Lo7hxa57U1d6Z76jg4kcvWCERdMX+8GR3HRobVdHVKq4NaG2T1pcdjmOz5UC7dAGL7rR
 MbzGct9f+beWbbX4K1JZi9cdBu0NcnVlO9XSMkZaL+93IT55HfZvUIwHnzvZVW9H1e57
 yyRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6kYoVKqPC3vhqU3nrR8MKfApG6zVMbrBxSj843bnZ/E=;
 b=onK5RaYxHr6kaxADQKXjCmOeix4+wLSSyApfs5K8nNDyXYOYmg86XuTVkrTxS9Z6wI
 8kDOAUOB8C8TJXtVDKPvXo80x48YFd3ikHhDCxwbJi0VCf9RAuf+ZuV7VXk8NTkPKF7h
 8hul84uoioST4kS9fpzUR7fYMY43vPqyIBPESxHXwKpd1w8d63hTxkR2gEC6ffPorOYz
 WSlxjfKcyXHvROqPY2/LuUuJhKNf6Od9gjOA7ZsAn28tkrUhArZ1k2L+mGahfNlbihRj
 zqiYDnVSSv8nlFS1ihZv7h6VJTxtJev82ktTarhyPjwvVwEogGmU5wboDPRgWHNYRANT
 mbHA==
X-Gm-Message-State: AOAM530hT5JHgj0Iijcip3bFbBUYHFQHrvkFL7RgTJWRv13Gy/SQqFLg
 MFs27oEtI7BImYWJkKAUgpWKnDH32576CFg9+h6eQA==
X-Google-Smtp-Source: ABdhPJyHGxibPr/pcc2cJ+NWBNFIpeSdMBuz+P0601qjR/KBDxKpkUl6Ou7uphTF6dCMxe0/w7IIrk2GG0GmMAyZJpY=
X-Received: by 2002:a92:3403:: with SMTP id b3mr8146206ila.140.1606501511895; 
 Fri, 27 Nov 2020 10:25:11 -0800 (PST)
MIME-Version: 1.0
References: <20201127092941.1646260-1-tzungbi@google.com>
 <CANLsYkx5FqGUe46SDwV8yYZkES66j5daFEAs9_eafiJm8RNz_A@mail.gmail.com>
 <CA+Px+wVsL6YUa7jNvpsehpUyqcxpm+8_Axag26zCeufaKrdTcw@mail.gmail.com>
In-Reply-To: <CA+Px+wVsL6YUa7jNvpsehpUyqcxpm+8_Axag26zCeufaKrdTcw@mail.gmail.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Fri, 27 Nov 2020 11:25:01 -0700
Message-ID: <CANLsYkwT6HYLgZ4MzEkfOvq6Rou8_toE=AS=wfjGeNinnuzRhA@mail.gmail.com>
Subject: Re: [RESEND PATCH v2] remoteproc/mediatek: read IPI buffer offset
 from FW
To: Tzung-Bi Shih <tzungbi@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201127_132514_035198_238AC177 
X-CRM114-Status: GOOD (  19.65  )
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
Cc: Ohad Ben-Cohen <ohad@wizery.com>,
 linux-remoteproc <linux-remoteproc@vger.kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Pi-Hsun Shih <pihsun@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, 27 Nov 2020 at 10:25, Tzung-Bi Shih <tzungbi@google.com> wrote:
>
> On Sat, Nov 28, 2020 at 12:11 AM Mathieu Poirier
> <mathieu.poirier@linaro.org> wrote:
> > On Fri, 27 Nov 2020 at 02:30, Tzung-Bi Shih <tzungbi@google.com> wrote:
> > > The patch breaks MTK SCP when working with legacy SCP firmware.  We're
> > > aware of it and will upgrade the devices' kernel and SCP firmware
> > > carefully.  Other than that, AFAICT, no other devices in the wild are
> > > using this driver.
> > >
> >
> > This is the exact same patch that you sent here [1], that I commented
> > on, and that you agreed with my assessment.
> >
> > What do you want me to do here?  What am I missing?
>
> Yes, this is a resend patch because only the first 2 patches in the
> previous series have merged.
>

The first two patches were merged because they made sense.

> I agree the patch is aggressive which would break machines with old
> SCP firmware.  But AFAICT, no other devices are using this driver; and
> we'll take care of our devices to upgrade SCP firmware first and then
> kernel drivers.  Thus, ideally, no real device breakage is expected.
>

How do you know about all the systems out there that use this SoC?
Moreover why would the original author have implemented the driver the
way they did if it didn't work for them?

> Would the patch be acceptable?

Definitely not.

> Or would you suggest we consider
> backward-compatible anyway (even if with the context mentioned above)?

That is the only way this patch will get merged.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
