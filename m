Return-Path: <SRS0=3jAl=FB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09958C3E8C5
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Nov 2020 17:26:09 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9BDC222245
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Nov 2020 17:25:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="loW6iws7";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="POH9nEfS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9BDC222245
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=6Mp8th62UHOvuSBA9F6ePqrSHn7w4iZxONAN1fwwEXw=; b=loW6iws7DVsiTfzLkusWPSRwe
	fvvlgBrt8xCF+AG1CFloK7M938yVpDp9maX125G2mu5X6OLyEJDx1WDR98phOhvpDxQPXEbB5Amze
	A7wUYghsvGMVOPkjay39r/2Ai6IIuAtCGjDzI+h9df+JKFhPGlxPc5uGa5NX/PUcWx1waRixbOh5k
	fL1A1JLaE3aT+zQa485Py7vtfhPVuy9ks9oKjgRiBdq2B6DXmiIYmV1o2mtvzANOreUCpp/nyAt0Y
	8brCK5rrUGy+kKydhjTBKIaddpQNlo7xYC+HApjBz4lTgSxbOTvONedD2vEOY0IQmXGgvvlCTQ5HA
	HWWc+Q6UA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kihVH-0008Gf-DW; Fri, 27 Nov 2020 17:25:51 +0000
Received: from mail-il1-x142.google.com ([2607:f8b0:4864:20::142])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kihVC-0008EQ-7r
 for linux-mediatek@lists.infradead.org; Fri, 27 Nov 2020 17:25:47 +0000
Received: by mail-il1-x142.google.com with SMTP id z14so5226455ilm.10
 for <linux-mediatek@lists.infradead.org>; Fri, 27 Nov 2020 09:25:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+Acm2ZExJpzGiHdCwJFkfrVzAksbUtRfcZnQHr+JzIw=;
 b=POH9nEfSxBH4InsUIU3kkfAh2Ipc6D7apcAffonRmNnp2egOFSfPrK3jTbNWT5xFw8
 nYY/CN/TqXPOOh1kN3J5Mxiw+cWR3+8FRpUYS1LB0O3oVNw6zvpv4JSgUlWrUStao78Z
 ISKu/a7qlQIvek47PxqXZdirJ6XYE6H7kO88sZ0ctqlHU2MzPGW/tpE7RKcdKgCGIQsN
 NxTJIYvV+BaI7ua9vdfbcn5PgMsqyr5JrocDW6uGMH3+iwH01rfG8Fjgd9ccUXKwhc30
 pWl5OSGIRSjEgGP5Af7e6Rl6V469ORng7Uq9rklojxEiLj+6oqng2hU+YyIc4WG7pous
 nG9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+Acm2ZExJpzGiHdCwJFkfrVzAksbUtRfcZnQHr+JzIw=;
 b=R1mtNQLgHWleBhmCSAe+rGCa8JINC3psSkjKmzb0ssKVs60tOj5vGQvXYxccXllbMh
 GdQZJv1YxIMdR0MEl+dFyMuQdXhDc7vJQQ32+VbvsPVuDnPLpUcM9gBqdgOV+S6wH11n
 p7WxVeXsEm6eBMZyuYt1n2yIc4BlC6U6LGmVQxYJRVk2iE6yfN6Ohr/kwIcOyJ9Q8Mv4
 5EHvR3lCqhRnjabmYmXBU+Bdyfsog7MZPHWtH9e0Ems5YiZwnNzE5AZbzgrZcSTIFcpc
 69MzCKj1iDBGzUUjXeAZgeQsBWSv51APYc+ihypBz6u7HxRSGs3DLJtv4DvzaCmaq0ji
 tW9w==
X-Gm-Message-State: AOAM533KVb7ReK0eZhZEnMf0bZbTUVwgnyqLQOTY3mPyNFodMGO0pxS8
 RgGEBCFZIhXmZoyKHmMdh/+jdw4iCGxwED9eefonczr4GLZcbhzF
X-Google-Smtp-Source: ABdhPJztn0uQRmqsLbsG/Rw9F4ym28+uH+606Px3XbpOCZ/buANVuTbqi4T1ThN4Wt9LOF2x0QO0yIMQ9lqD9bdzFvs=
X-Received: by 2002:a92:c88c:: with SMTP id w12mr8073208ilo.204.1606497941430; 
 Fri, 27 Nov 2020 09:25:41 -0800 (PST)
MIME-Version: 1.0
References: <20201127092941.1646260-1-tzungbi@google.com>
 <CANLsYkx5FqGUe46SDwV8yYZkES66j5daFEAs9_eafiJm8RNz_A@mail.gmail.com>
In-Reply-To: <CANLsYkx5FqGUe46SDwV8yYZkES66j5daFEAs9_eafiJm8RNz_A@mail.gmail.com>
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Sat, 28 Nov 2020 01:25:30 +0800
Message-ID: <CA+Px+wVsL6YUa7jNvpsehpUyqcxpm+8_Axag26zCeufaKrdTcw@mail.gmail.com>
Subject: Re: [RESEND PATCH v2] remoteproc/mediatek: read IPI buffer offset
 from FW
To: Mathieu Poirier <mathieu.poirier@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201127_122546_341645_4F9434FF 
X-CRM114-Status: GOOD (  15.81  )
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

On Sat, Nov 28, 2020 at 12:11 AM Mathieu Poirier
<mathieu.poirier@linaro.org> wrote:
> On Fri, 27 Nov 2020 at 02:30, Tzung-Bi Shih <tzungbi@google.com> wrote:
> > The patch breaks MTK SCP when working with legacy SCP firmware.  We're
> > aware of it and will upgrade the devices' kernel and SCP firmware
> > carefully.  Other than that, AFAICT, no other devices in the wild are
> > using this driver.
> >
>
> This is the exact same patch that you sent here [1], that I commented
> on, and that you agreed with my assessment.
>
> What do you want me to do here?  What am I missing?

Yes, this is a resend patch because only the first 2 patches in the
previous series have merged.

I agree the patch is aggressive which would break machines with old
SCP firmware.  But AFAICT, no other devices are using this driver; and
we'll take care of our devices to upgrade SCP firmware first and then
kernel drivers.  Thus, ideally, no real device breakage is expected.

Would the patch be acceptable?  Or would you suggest we consider
backward-compatible anyway (even if with the context mentioned above)?

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
