Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7955C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Jan 2022 22:56:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DtVNeYn6dt5XAziVyW5q/f26Umc9fujjPOVHHDK1qhE=; b=LtGY+Uod9O0MmL
	WwkMoRZqPm2jSvjNTO0PqCsGSEvYRilp/KP9p0RVN31ZJE6eFVRg/LKoB1BHaR7rbEu+8bd+Fv/Sd
	nREf1vmlQEQA/OnR3ADjh+oyTWb6gX4enuuOMqSTzVhJ6DD5G4q0GyrgiHw1vbqRWGA8Zt5r/0o87
	ioQcs/meUeWvEiX/vp6WM49G47+ikvUpF3F7MT5+hUfCCx2gwvmUrNZlLBe3vkOs4tTBd/39WMjfj
	XBdy7Wt3u2ZpeY99qZq8XHnj6KRoVyKJ7C/ePaqQY4O3x2AnMQvUDeGuJ2GiTbQ+dGI6eAdFbnbwf
	O6bBXb6iOsX3H4NDuVbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nCUji-009fkP-LD; Tue, 25 Jan 2022 22:56:26 +0000
Received: from mail-qk1-x72d.google.com ([2607:f8b0:4864:20::72d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nCUjf-009fjw-Vf
 for linux-mediatek@lists.infradead.org; Tue, 25 Jan 2022 22:56:25 +0000
Received: by mail-qk1-x72d.google.com with SMTP id o12so6358409qke.5
 for <linux-mediatek@lists.infradead.org>; Tue, 25 Jan 2022 14:56:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fireburn-co-uk.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Pf4LR+HDgvHIgHs+Dc3VVimHBG2P1oSVQMMzXRhSFfk=;
 b=c2zcrOSB1bTbgyIHCAJPILY6NaYxmiGcCwUE3NmQETnDwArM5okFr5Lk2kiTf2gPjO
 4TqUCEKSRIgyjMOuetA96SvmGhYTR5syonHlsem1uTKCCaFct3Y1TItCl8Z2VpwGXRkQ
 GEIcKjOEdW/n0lX0XAQGlxvEbkbJ9HTCHulVKzNWpVE6g4izgOBcoR+DSwGHxe4AvQEZ
 ot28HZtL0omM3M7a4U1MRXpj5x9tmhuENqhPl2g3Kx9lCG7McAqEPe0TrLadbsMVbfR1
 5Xjnd54Pv2iradDTkWCRFpKjuI5XCJ02l39ytm5Bf6sbhVqGdlLUTCZXexHmwPaLP9dK
 dGhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Pf4LR+HDgvHIgHs+Dc3VVimHBG2P1oSVQMMzXRhSFfk=;
 b=yDnQJ8vBok7HDm+NEeTOAsA99B+GIZdx+73ZJKf46Nv9Noz+lMe8p98KuzZBn/XVSm
 x3HJZUQtKmi/uB0NEO/eE7oloHglCNjfqS7suCLosiM0zMguZe0X7ARS9QnTv68z0XfW
 +43e3e9gjlTqQruRoqo2KHyyBgUu/RNlZ9pyB7TKS92vdUM8GbC7BSpFYTgYYkvWfAa9
 yJ3lKRbk23EG8aEgPClBg/8mLB4h7oflReyr3q1+WhmJ7TvPewPZ5uwg7Em6bFTgbDt5
 gcMycJcpJGI561zza1SwnU5J5hndMRolP8HkJS9GvhOlIjK9ibvHxTpHI3prXBPLyjEa
 V9IA==
X-Gm-Message-State: AOAM531Fn73OhzW6kEgm95ZLyeBsk/aDRiPHTPuIgdYB+VlB4i8mDZpC
 4gick2xvKpCnovwBV8kDsUdYin7vrLKU5pqBD3orhA==
X-Google-Smtp-Source: ABdhPJzYCRABMILMdvnImlA6uWbmy9/uIfcZnkSjHLGihwT8hih69vZKJaKD38KnSfGsx+phAj3VPUqfKlH28/Cp8PQ=
X-Received: by 2002:a37:9c4f:: with SMTP id f76mr7000304qke.464.1643151381712; 
 Tue, 25 Jan 2022 14:56:21 -0800 (PST)
MIME-Version: 1.0
References: <d291f592-d84a-2ffe-7f75-df77890efce8@gonehiking.org>
 <20220120095622.1938-1-mike@fireburn.co.uk>
 <CAHbf0-HLCcgZfbKdWQ-kX+QbRGJsEHCEDnG=NZ5QF71aTeDMGg@mail.gmail.com>
 <9d692dc9-4b24-44b0-cbe0-dfc33f3d5f03@candelatech.com>
In-Reply-To: <9d692dc9-4b24-44b0-cbe0-dfc33f3d5f03@candelatech.com>
From: Mike Lothian <mike@fireburn.co.uk>
Date: Tue, 25 Jan 2022 22:56:10 +0000
Message-ID: <CAHbf0-FwH-ftCFeqrNusu4DBPrKe0SeTAQnAZngpsn+At-fJsQ@mail.gmail.com>
Subject: Re: [PATCH] mt76: mt7921e: fix possible probe failure after reboot
To: Ben Greear <greearb@candelatech.com>
Cc: khalid@gonehiking.org, Deren.Wu@mediatek.com, Eddie.Chen@mediatek.com, 
 Eric-SY.Chang@mediatek.com, Eric.Liang@mediatek.com, Leon.Yen@mediatek.com, 
 Mark-YW.Chen@mediatek.com, Soul.Huang@mediatek.com, Stella.Chang@mediatek.com, 
 Tom.Chou@mediatek.com, YN.Chen@mediatek.com, abhishekpandit@google.com, 
 ch.yeh@mediatek.com, frankgor@google.com, jemele@google.com, 
 jenhao.yang@mediatek.com, jsiuda@google.com, km.lin@mediatek.com, 
 linux-mediatek@lists.infradead.org, linux-wireless@vger.kernel.org, 
 lorenzo.bianconi@redhat.com, nbd@nbd.name, posh.sun@mediatek.com, 
 robin.chiu@mediatek.com, sean.wang@mediatek.com, shawnku@google.com, 
 steve.lee@mediatek.com, ted.huang@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220125_145624_085549_B9548AB9 
X-CRM114-Status: GOOD (  16.56  )
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

On Tue, 25 Jan 2022 at 18:09, Ben Greear <greearb@candelatech.com> wrote:
>
> On 1/25/22 6:16 AM, Mike Lothian wrote:
> > On Thu, 20 Jan 2022 at 09:56, Mike Lothian <mike@fireburn.co.uk> wrote:
> >>
> >> Hi
> >>
> >> I get a BUG and the kernel resuses to boot with this patch when mt76 is compiled into the kernel
> >>
> >> https://bugzilla.kernel.org/show_bug.cgi?id=214557
> >>
> >> I don't see this issue when mt76 is compiled as a module
> >>
> >> My .config is at https://github.com/FireBurn/KernelStuff/blob/master/dot_config_tip
> >>
> >> Let me know if you'd like any more info
> >>
> >> Cheers
> >>
> >> Mike
> >
> > The bug I was hitting was due to a different change introduced in rc1,
> > with that reverted your patches work great
>
> What patch did you revert?
>
> Thanks,
> Ben
>

Hi

I reverted both 730b49aac426e1e8016d3c2dd6b407e500423821 and
510a0bdb2bfcff8d7be822c72adc3add7a97d559

But there's a fix now,
https://patchwork.kernel.org/project/linux-usb/patch/20220124090228.41396-2-heikki.krogerus@linux.intel.com/

I'm able to load mt76 as a module or built in

Cheers

Mike

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
