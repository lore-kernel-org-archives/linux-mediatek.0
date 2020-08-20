Return-Path: <SRS0=4nm1=B6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C775CC433DF
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Aug 2020 19:40:02 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 82957207DE
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Aug 2020 19:40:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eUz+/xc6";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="Byh29kc4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 82957207DE
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=dB2GNfZuYdqPvpLJ75c0Uq7qdebAV41xVfOK7xOkgD4=; b=eUz+/xc66pw8jyIX4rgbHdkGw
	eNSEoKqcHZJ4IXcBnvTa64dt/IcV0vKBhG31H6tDKd0pg3VWcsSNW/sKw8quFOCDVHGX2EOQi4py1
	gL1tljytBW75PrMTyvmVLTTMK6XyZXTQTfJb5mIJyb1BPr2dmKAAWZpspUtqCAJgSxXjxnkO82IoR
	E9Plgjn1Q4RxlBaYMH2MWfO06PUjvJZMQrQdEzR6SxsneEy8E+gkvruZmrGP3q0ZfB41hOoxJLQ9R
	EBu/scuACi+5HILnSki/gruELa/f98V4v7dlHY4+bnmnSGyVqqvAQuhYV+SBTHOlpABiRjp0nqmk8
	UsZjpz1lQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k8qPf-00033a-BL; Thu, 20 Aug 2020 19:39:51 +0000
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8qPb-00032S-FD
 for linux-mediatek@lists.infradead.org; Thu, 20 Aug 2020 19:39:48 +0000
Received: by mail-pg1-x541.google.com with SMTP id j21so1620766pgi.9
 for <linux-mediatek@lists.infradead.org>; Thu, 20 Aug 2020 12:39:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wXIlJgCi0Hc+qjW3EmvatA+4YXMKzONFgX9ZK9vfGVU=;
 b=Byh29kc4cV3ARFPI/Wlk0/U6LwFlY3do928FTIcxGaxbCcgFUm40Fzo6EZmoH3jf45
 +KHAV91KvPEzkBIC7pCOmnlKjPlO9OUxadtclYKUsLIjezrJ5oPyqd+OsJBpn6tvS2gD
 VCLQnLIrRJqQajFge2GUlSju3XU+/A55+NmWf00MIxOvw0bxwSdj3zAI5bL5tGNznh6z
 VHQsBRta/AHkcLLRJV/d9fgZ7ctTUA7xvEWhJGEkw/i6rv0IFX6M62y1ovizLidR9Ypg
 IGYdP77Gjil0K1X56UqtZ8ROL3LlqTumNtyDnnHVrIJ5Clw03mIbYH0jxLXG63DW8k/5
 alKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wXIlJgCi0Hc+qjW3EmvatA+4YXMKzONFgX9ZK9vfGVU=;
 b=Czx8pD5EdeshBgdp+GwsL/eUPUXxwan3l98bn2PsIsnsJ8aF1CFXuLleYkgNRVtuOi
 lQ5HldENZ+yNWNR/j7Bu/hDpNlTHjG3ZepE9XUdsCkuIzQXSlbsNYxlo5BPFq4Pvj7ex
 58T9RvBl/6T1Ym5SXKxIGl3bLx5O9S4C/d3uW6Kw0lN2RDqSNoOzz1UkRvR+5I3oN+5g
 ntE8ylFnO8Iaca6ncFVKU91PbG7N4bvmIPwtJX9ETP6/k8oAFljO2E5yjD85VD7ip/yX
 rm9TCdPjfkW4eOnWTEgNwn3l7zPFzo82dawJfFcatgbxti+VrWZ8G6pgKELASAX4jhiy
 sOhw==
X-Gm-Message-State: AOAM533JQMKnuLKbru1DkxSbAbYIn66oKHUiRGWP031C6Ty/QWNqh1vp
 /kszjAqPI07x8/3V//1FF3FUKZ3PBWVMGiYJMnZZSw==
X-Google-Smtp-Source: ABdhPJym/FbUKNACd+sG+GCzf3AR9j9nUiLJQxeLO2wEIc43GF74XHG+gaLLRAbnKyQMsx9vmJyOQlV2oIBMWjeQigQ=
X-Received: by 2002:a63:fa09:: with SMTP id y9mr271539pgh.0.1597952383386;
 Thu, 20 Aug 2020 12:39:43 -0700 (PDT)
MIME-Version: 1.0
References: <20200819161907.1155110-1-enric.balletbo@collabora.com>
 <C9E59107-CE83-4554-9447-5DE5BEE09A3B@fw-web.de>
 <CAGETcx9_A-E5b-JxT2G142mGxqoo8xqFNEgT+CNWt=oOv0Z5+w@mail.gmail.com>
 <a23bac35d20eb002bdfb5263bf5dd213@kernel.org>
 <CAGETcx-NpRzzeXYN-UBP1eAsC3s_AofSQ9rXOEmCjhLhKLnxWg@mail.gmail.com>
 <14b8f4b9667d29ee25e25eb19c69e3f7@kernel.org>
In-Reply-To: <14b8f4b9667d29ee25e25eb19c69e3f7@kernel.org>
From: Saravana Kannan <saravanak@google.com>
Date: Thu, 20 Aug 2020 12:39:07 -0700
Message-ID: <CAGETcx9TB9HNd3WKwQ=p8VYy1-gLYqpGCtvk9QsdG1fvprROYQ@mail.gmail.com>
Subject: Re: [PATCH] Revert "irqchip/mtk-sysirq: Convert to a platform driver"
To: Marc Zyngier <maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200820_153947_578735_BC9A9DE0 
X-CRM114-Status: GOOD (  34.14  )
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
Cc: Nicolas Boichat <drinkcat@chromium.org>,
 Jason Cooper <jason@lakedaemon.net>, Hanks Chen <hanks.chen@mediatek.com>,
 Frank Wunderlich <wichtig@fw-web.de>, LKML <linux-kernel@vger.kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Hsin-Yi Wang <hsinyi@chromium.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Frank Wunderlich <linux@fw-web.de>, Collabora Kernel ML <kernel@collabora.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Aug 20, 2020 at 7:53 AM Marc Zyngier <maz@kernel.org> wrote:
>
> On 2020-08-20 09:07, Saravana Kannan wrote:
> > On Thu, Aug 20, 2020 at 12:56 AM Marc Zyngier <maz@kernel.org> wrote:
> >>
> >> On 2020-08-19 19:51, Saravana Kannan wrote:
> >> > On Wed, Aug 19, 2020 at 9:52 AM Frank Wunderlich <wichtig@fw-web.de>
> >> > wrote:
> >> >>
> >> >> hi,
> >> >>
> >> >> does the fix you've linked to my revert [1] not work in your case?
> >> >>
> >> >> [1] https://patchwork.kernel.org/patch/11718481/
> >> >
> >> > Thanks for pointing it out Frank. Also, might want to avoid top
> >> > posting in the future.
> >> >
> >> > Enric, Can you please try that other fix and see if that solves your
> >> > issue?
> >>
> >> I think Enric was clear that the driver does probe correctly
> >> (meaning that he has the fix in his tree). It is everything else
> >> that breaks, because none of the drivers on the platform are
> >> equipped to defer their own probing.
> >>
> >> I think we need to change this works right now, meaning that we can't
> >> blindly change the behaviour of *built-in* drivers. I'll see if I can
> >> come up with something quickly, but I'll otherwise take Enric patch.
> >
> > Sounds fair Marc.
> >
> > Btw, Enric, out of curiosity, can you try adding "fw_devlink=on" to
> > your kernel command line to see if it helps? It basically ensures
> > proper probe ordering without depending on the drivers. There are some
> > corner cases where it still can't work properly (too much to explain
> > for a late night email), but if the platforms don't have those corner
> > cases it'll work perfectly.
> >
> > I'm fine with the revert if Marc isn't able to find a quick fix to the
> > drivers, but this might also fix your problem right away.
>
> I'm afraid there is no quick fix if we want to preserve the current
> behavior with built-in drivers,

> and not having "fw_devlink=on" by
> default makes it irrelevant for most people.

Agreed.

> fw_devlink also prevents my test platforms from booting (my rk3399
> doesn't find its PCI devices with it), while the same kernel boots
> just fine without it. It could well be that the corner case is
> likely to be more prevalent than you seem to expect.

Yeah, I know it has a few corner cases I need to deal with.

> I will probably end-up end-up queuing reverts for both mtk-sysirq,
> mtk-cirq, and qcom-pdc (the first two can't be built as module with
> mainline anyway, and I seem to remember that the latter caused some
> controversy as well).
>
> As an experiment, I have pushed out a branch[1] that implements
> a "hybrid" probe, retaining the previous early probe mechanism when
> the driver is built-in, and letting things rip when built as a
> module (if you do that, you hopefully know what you are doing).
> I'd welcome some testing on affected platforms (I don't have
> anything I can run mainline on that'd be affected).

I like [1] and the code looks good. Hopefully, we can stick with that.

-Saravana

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
