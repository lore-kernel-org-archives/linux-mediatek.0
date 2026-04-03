Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35A9BE85371
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Apr 2026 16:20:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+V1E+/KFBONHYKrDP8YAiJIHIjVU2b7P8j+yHhcYHMc=; b=zItixznsN1QNM4KsuANlcoBUZX
	IFFMCXUH7Ry8IfAJ4KeS0y+7CspgR1Coe/unHNndrOM1YQoUvzBenVX/b9tohVcPi4YkTKpCbEiT1
	lvceW3l48Y5BJ4vOXD/XSFp8JwN1qzFIdPxUAm/qpQ8WVQkAqbf311CMGfp5dZvYn8mSUeoy7BLAi
	3yk9yPd+SJWPK4DA91EXhXlwgIQPeA2Uirv6SMluuToF9qyRbiepiaYSkXueNmWc/uV2IpAvt2W4H
	nBPJXzzcbrhTkIvY7wbLjjFum7QsQWNMhxSuVPdJaeQxcuG7t1ABDdM8hd7VsIYEseFyRpUJyeNW2
	vZ1WksSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8hFm-00000002JXr-3Rgy;
	Fri, 03 Apr 2026 16:20:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8hFl-00000002JXQ-2Qi6
	for linux-mediatek@bombadil.infradead.org;
	Fri, 03 Apr 2026 16:20:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=+V1E+/KFBONHYKrDP8YAiJIHIjVU2b7P8j+yHhcYHMc=; b=ZCKfvqVRnaPc5TwkSpb2Qg2qpl
	qoF860xN5A1PkaBQk8D8TqCoEdBX5vvbbOFM0lQvXXBvwY93Y0Jv7dv3xudQAX6JS74y9jLIgUU/6
	f9eCbVJBDFGdbTkHwPkolO9Rjg5LDAe1tcr4d3Bcf4iydbvE1QHEkAqWkJVzfLpDfcTd5/JHIaVGq
	eu3ufQ4i7vLdcSBDHPUyUmi9pwyCBeySjB0YTd/4WmeMOzfO+rx2eru2xc1jzf1+b2Aen2nNQTbr/
	7KmhWMuicgOjiWQxwGcjrOzIcK2OkQr07TSBAMvnH/A7w+39rC6mPr1gKnN/MEzArpOdqn+Q89Ixw
	PQdIhQbQ==;
Received: from mail-ot1-x331.google.com ([2607:f8b0:4864:20::331])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8hFf-00000004PtQ-2eUW
	for linux-mediatek@lists.infradead.org;
	Fri, 03 Apr 2026 16:20:11 +0000
Received: by mail-ot1-x331.google.com with SMTP id 46e09a7af769-7d77b179b52so1584406a34.2
        for <linux-mediatek@lists.infradead.org>; Fri, 03 Apr 2026 09:20:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775233202; cv=none;
        d=google.com; s=arc-20240605;
        b=WvWwuloc26nwJQwBAP+4BStMmUoPrMV2qBVknL1pb5UKbzqMNry6RhxygJYCVB3p9d
         4aE22J+eF4cO5H7o9RmYE7qjq3P8P5M9SPoz4crQtAG0tGUpMucWLij4Zxt35swFS61v
         8sOoClI3hix2pKs2s78duWS6Iw7Iea/AbhJcIUJMQ/fom2DJAsYmjoOFwqlkaziktp4G
         McM38YivYChY0vVpAXt5n46G89puVO6XHfsnFFdzVC8dTefEQgrctYuowrLJvu796Wf4
         4umhBk8FfuuHXztrqSzNlxJv4Sf8NwQMz4F18fUTbmx2zJg3rSDuY8a2ULagvbOdiq32
         RdBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+V1E+/KFBONHYKrDP8YAiJIHIjVU2b7P8j+yHhcYHMc=;
        fh=Q/qmjZczRx/Zf+avUG3vtJAQFjBHbKefZFkL5eNkvow=;
        b=Eheih9ZGkMeqislhEyWZtzMsLk37GEwadLi0fpi7famew9WkN99bntA8RO+zczTWCt
         qJcnfjDbgyX55tBd6sF9tuG2CL8T+zmAEcyZFQMsIfRYRj6fzikNZX3XQzM/KfcuI4PZ
         /S16Wg2H1FwjO3B7Ky9lRk5Zcxys0+kgu1lWE9SKErKp5okAFKwJ09ZcAo9Xc5wi0QVR
         lzWtevCpA/VzPqnU3OyMKHdHsxjEArfUhc6RnvqWyt3l8bRPVyzkRNiGE5FrpMaTqhzW
         aQKl6T7I6BcjxaRhnXf42E9f9K0Rb9bBEG/UcgwcVqsHBlHxmcp7L9LNHwr9ZCAJ3XBG
         Bs9g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775233202; x=1775838002; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+V1E+/KFBONHYKrDP8YAiJIHIjVU2b7P8j+yHhcYHMc=;
        b=NhdeJRVZyM6FqTLKdkcvB4SVdSKVb1ZFBhu+fk369L1R1/Wu2Vs6Z9V+FCbgHf/YFe
         cFUZEUiv/R/hPMUo1cEYvYzYRB0yLYBJhAEAP6SC9DhM2XHvqRjchKUJcET5XJJrfNtE
         XwHwVLp1OZm97tXJazoudL6bPZQM/OBuX/7s3CiD0gXWI4sOmh4BDaEtZUg4SdBbrb8t
         waN46e/1NnsTuXLRPjddksAqzC1WygWjHi0XW32SivU/4beYWiP9EJ+bXxCNuJsin7dq
         bqd/BSIBXsd0Lyjq2mEHVF50oEozKC2Hl7imKG9uYnGichKyYi9bYF8Gh+MU2DS71h/+
         xPyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775233202; x=1775838002;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+V1E+/KFBONHYKrDP8YAiJIHIjVU2b7P8j+yHhcYHMc=;
        b=Fzw31x4aqp55jRrk2F/Rd6yWe9gRT6M374ovKDhsqHTU508OBLuGE7dOdbtnWLAJKr
         RoSml9TY++I3vK/5B0GAHZmLMAu36fi+10ihgObCWU9FwFAHFVuTLhs5dRE90tZoIwWM
         SQmo2HXOxG+aISTbxOX6XDxv1U2INW+I8sLgY+v+QO92IhLo+KFAUKZybutQBG2WiOJ+
         VlVO2mxotxMQbgFnoB/5+zzCr5WxOweQ2BINii6erwIKWLQcBU/eRG6DjbUVzUCKems8
         yHrXoUz9Gtw1TggXdIB/HI9GTq7D//fi4eJ5BsMwwT0MuNCIFkYCZHKjThZNoHIsMcwb
         +s0A==
X-Forwarded-Encrypted: i=1; AJvYcCXbLFn6TGZ3luq4Edeh9PU8YrwcmS118pF7DKov7Ud/884d0oiUNL9ory0wF90QWX3v+H88W8ZDBWuOgC6q2g==@lists.infradead.org
X-Gm-Message-State: AOJu0YwAyNA/7IgdsR8veNi2fGQ0nYTtBBNQInHFow7ssukvfUXALEIq
	OPrjoYZdldcvf99M8vr6JURj89+Kqdzc/Lj9LWRg/8yNtVBCEXic9ZQbHe0UF/j9VKQp64ox4Ck
	4RtTVQgoNX/GbU4FTdWFDnM81fCBKRPU=
X-Gm-Gg: ATEYQzyK0nU9ec3by4TuGZv4YPMG3foc4WjaVKLUYuLiOXky70zkqv5gy0w1QKtMuOP
	9Y95HyJd+mPjSf58MPTkmAHZn9PHZcN55BUNNH3L5fvo743joOZ9XWf6462ZARW0kIh6eS9vG5g
	qrJ3ZFxqdNEmGumJzcofvd8KsRAJEsfQwjDfRnuFFSUnP4h9zkysNL8PFhABKF/Faec9hI8o0NB
	IWh6xDXX+f7o6Er2y/gKVMGySJ7XKaAn9HIhNpKuo/FCnfVz7Xa9hXXvPQ9XkbeGstmZy28iIBQ
	F5ZPRF9l
X-Received: by 2002:a05:6830:83ba:b0:7d9:ad90:5677 with SMTP id
 46e09a7af769-7dbb75d7260mr2353806a34.30.1775233202503; Fri, 03 Apr 2026
 09:20:02 -0700 (PDT)
MIME-Version: 1.0
References: <CABb+yY0ub51k-eFpPfgARXtwYjWzRSjbPDLtoMD77YQR8JH+=Q@mail.gmail.com>
 <20260403145119.2581034-1-joonwonkang@google.com>
In-Reply-To: <20260403145119.2581034-1-joonwonkang@google.com>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Fri, 3 Apr 2026 11:19:51 -0500
X-Gm-Features: AQROBzBimCWicSTdSy1XOK425eepJ2fZaf0LPQosLeZZ5fVq1iHQtw7KN5njBvw
Message-ID: <CABb+yY0uDQh-3cadPQONV=NJKjMtc4mJekgjmHYVaHnfHXvGZQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] mailbox: Use per-thread completion to fix wrong
 completion order
To: Joonwon Kang <joonwonkang@google.com>
Cc: angelogioacchino.delregno@collabora.com, jonathanh@nvidia.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org, 
	matthias.bgg@gmail.com, stable@vger.kernel.org, thierry.reding@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260403_172007_797944_40663116 
X-CRM114-Status: GOOD (  25.45  )
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

On Fri, Apr 3, 2026 at 9:51=E2=80=AFAM Joonwon Kang <joonwonkang@google.com=
> wrote:
>
> > On Thu, Apr 2, 2026 at 12:07=E2=80=AFPM Joonwon Kang <joonwonkang@googl=
e.com> wrote:
> > >
> > > Previously, a sender thread in mbox_send_message() could be woken up =
at
> > > a wrong time in blocking mode. It is because there was only a single
> > > completion for a channel whereas messages from multiple threads could=
 be
> > > sent in any order; since the shared completion could be signalled in =
any
> > > order, it could wake up a wrong sender thread.
> > >
> > > This commit resolves the false wake-up issue with the following chang=
es:
> > > - Completions are created just as many as the number of concurrent se=
nder
> > >   threads
> > > - A completion is created on a sender thread's stack
> > > - Each slot of the message queue, i.e. `msg_data`, contains a pointer=
 to
> > >   its target completion
> > > - tx_tick() signals the completion of the currently active slot of th=
e
> > >   message queue
> > >
> > I think I reviewed it already or is this happening on
> > one-channel-one-client usage? Because mailbox api does not support
> > channels shared among multiple clients.
>
> Yes, this patch is handling the one-channel-one-client usage but when tha=
t
> single channel is shared between multiple threads.

hmm.... how is this not single-channel-multiple-clients ?
A channel is returned as an opaque token to the clients, if that
client shares that with other threads - they will race.
It is the job of the original client to serialize its threads' access
to the channel.

> From my understanding, the
> discussion back then ended with how to circumvent the issue rather than w=
hether
> we will eventually solve this in the mailbox framework or not, and if yes=
, how
> we will, and if not, why.

It will be interesting to see how many current clients actually need
to share channels. If there are enough, it makes sense to implement
some helper api
on top of existing code, instead of changing its nature totally.

Thanks
Jassi

