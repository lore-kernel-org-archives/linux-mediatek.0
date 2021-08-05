Return-Path: <SRS0=iyt4=M5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_03_06,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D203CC4338F
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Aug 2021 01:04:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 645CB61176
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Aug 2021 01:04:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 645CB61176
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vNaj59UFuXis0FJbTr6OZGHXtav9poWw15lK3hef/Is=; b=Z1SuDVL+g2rups
	sAZVu+62m48HY+URYVij3UFjL4OnkZkCoTZhyXJbln2OrPHqdT2gsmO3Ns+PL/R/D5ud14vvIlqFH
	dfu4RBbS7QIsOxeSn6w+hcl8e4XncK7/BUM4jyUdXI0XPplqAAXNKsEyPSESkPCWZhX9WM2MUU4QI
	qh2FfprQgYvrhD8kvC54rRbNhhwj2k2cm5NETqWF4DMc9pT9ztZd1hsoKOQoIo7jOiTOBuwXoxL2y
	yUUzhlOQ+Dd6WY2YGfM3kXODTxI2ps43Ls5lT5+ZHc5ZP8M5A4kcXDS3GKn7AvQGxe+mLhmnqiMWJ
	9jvYgL7qHszs8MaHP3qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mBoHN-00BD9t-Qz; Fri, 06 Aug 2021 01:04:05 +0000
Received: from mail-qt1-x82f.google.com ([2607:f8b0:4864:20::82f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mBoHA-00BD8u-M5; Fri, 06 Aug 2021 01:03:54 +0000
Received: by mail-qt1-x82f.google.com with SMTP id c5so5289695qtp.13;
 Thu, 05 Aug 2021 18:03:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Zdjxi4Fa3+ypzllJ/AyX6+tXVRJghFv1IfDBReY0s4E=;
 b=MjDYXRchkMHR1K5FB/rmmwE8O1/Ig0ZpF2+r6THxJtWckbXWrh8lBX57SAvayQHw/X
 P84k1I9/gj+P+RSPgR/1FmAPof0p1wPjgKcWI34IJFAVrGO7V5ozPkk7vfPUqWi0yoO6
 IS1uJtTDqV1jipDSFiGGs3hmV/khlOtPZGReZsrRiqrK78uWc8Ve46v5qGkAka8R+rD0
 0Xv8SirP0FGqBBDgr8CibvMdH/jCVQn65oStCqnGImutvKiu1l4VN+BwWWpumB7nONy4
 lTpyew+8vYjn3VHcPR/PFegdxeKwHbyEhuCpEEg5OiZMhqUE/NZx1MB/9Jdb56zjLcGR
 +w2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Zdjxi4Fa3+ypzllJ/AyX6+tXVRJghFv1IfDBReY0s4E=;
 b=hedLtkDbtNe7aOTsZcQc4bRuzGmKNBOSw2pEM085aCTJcyyrvFac1/Wlrvh2vX+PDT
 WwRRfyJjB+CEr5xJufzui834lY5mHCn9aF72L37v5GjPnrlSn7BClpFDgavQUIeqO/wC
 Z0vQZjTPaXvmF03lcNLSaegJIVf0SxEJvMUVOa6gn9btiTCM81mJXi3kXq5X0Jac+XP+
 DezXeISOitL3B9Tj5e9Sbxc0Wqm9cniR016J7JYalmZqbl5WIRgDbQjPoy3JRvIwb87W
 7sExCwDfmq9jsDcFNQkAxZc8xrpEwATGaqFOIR7hm0hCAsYwUcY4+yfiKgptj0+BAN+V
 WdMA==
X-Gm-Message-State: AOAM530iOKgnsg4S7mIXFy+Dtihjkl/D4lYxhQrxrQBnNa7YstngRipx
 Ua1lPiPLXd9kOZAdOH/duE7EiSJfzl0Tzsz0Mv4=
X-Google-Smtp-Source: ABdhPJzYF7AHiMBuo/3+tXUl+VEji15oVKcEHzNU1d9kup9ThZgSbEolru+V7969gCh8x5het/lQclWXFd1jwExT/Ok=
X-Received: by 2002:ac8:5a96:: with SMTP id c22mr6804098qtc.229.1628211828611; 
 Thu, 05 Aug 2021 18:03:48 -0700 (PDT)
MIME-Version: 1.0
References: <CAEsQvctJDnsaRTXAGAJ6==juKazoo2=AJrWabLzqE=jCfg5EEA@mail.gmail.com>
 <20210805075401.21170-1-chihhao.chen@mediatek.com>
 <CAEsQvcsvbJdgvAOxkv_kbLohGi676Zrgz4XSFW2o3CWU3Q68Dg@mail.gmail.com>
 <CAEsQvcvJeAXoVE9FE9vsKNvXMaQYgHZBoPyKfZLT=UA-4BMe_Q@mail.gmail.com>
In-Reply-To: <CAEsQvcvJeAXoVE9FE9vsKNvXMaQYgHZBoPyKfZLT=UA-4BMe_Q@mail.gmail.com>
From: Geraldo Nascimento <geraldogabriel@gmail.com>
Date: Thu, 5 Aug 2021 22:03:39 +0000
Message-ID: <CAEsQvcvArDwA9aeAm-FN6f9-G0HM0tNDRxXvX9roFQ1koqQKrg@mail.gmail.com>
Subject: Re: [PATCH] ALSA: usb-audio: fix incorrect clock source setting
To: chihhao chen <chihhao.chen@mediatek.com>
Cc: alsa-devel@alsa-project.org, damien@zamaudio.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com, tiwai@suse.com, 
 Takashi Iwai <tiwai@suse.de>, wsd_upstream@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210805_180352_784285_A77E58CA 
X-CRM114-Status: GOOD (  16.08  )
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

Chihhao Chen,

Since you're the one with the hardware I believe the bug report for
Samsung should be done by your side.

Maybe Takashi Iwai has somebody in mind that develops audio code for
Samsung and has already contributed to ALSA?

It's best if Takashi Iwai helps you out, and you take the shortcut to
the corporate structure, otherwise the importance of our findings may
be underestimated.

Chihhao Chen, please include the following link in your bug report to
Samsung: https://lore.kernel.org/patchwork/patch/1466711/

I'd politely remind them that the headset requires a very specific
quirk to work with recent Linux, that the patch has entered Linux-Next
however it's a workaround because the headset is apparently breaking
UAC compliance when it sets both Clock Selectors at the same time,
regardless of what Clock Selector we tell it to set via USB Control
Message.

But you're free to do as you wish. I'm sure you'll be fine.

Good luck,
Geraldo Nascimento

On Thu, Aug 5, 2021 at 11:31 PM Geraldo Nascimento
<geraldogabriel@gmail.com> wrote:
>
> Em Qui, 5 de ago de 2021 12:50, Geraldo Nascimento <geraldogabriel@gmail.com> escreveu:
>>
>> > There is no noise and I think this should be a firmware bug.
>
>
> The fact that there's no noise during the echo test itself doesn't mean it's not a firmware bug.
>
> It may just mean the MIC is able to support both 48KHz and 96KHz.
>
> Because from the log we see both Clock Selectors end up selected to pin 1.
>
> Thank you,
> Geraldo Nascimento

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
