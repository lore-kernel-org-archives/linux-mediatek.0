Return-Path: <SRS0=ht0X=4O=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30042C4BA10
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Feb 2020 14:30:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 049C42467B
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Feb 2020 14:30:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="aRmrH/1Q";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="UgKEAOVP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 049C42467B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Qk4qIa6wNfvVOUAfbiOqsDHyBP2Wz3zjS3nQNDIn/+A=; b=aRmrH/1QEKU2K4
	u1kQ6FY2kfKKaXsjbB8i7fwmUDgI73HGReHJCQC7DRGmvn0gfXz9bvqP7UZUZPWEyOIvoKNzhWSvp
	/6+BghDBvE7pxBdI7tIn4gc37wIyuNARebRjl4SHdmSXatBvFRPyYdQRDjaxAf67WwIRmFJnAao4H
	faYCD8j6SDtEPq0jeVo0GhZ2i/l+jdfQrs1/dBWFtDfFaoVCNLoWXIOWuKICVv46DYlMFDfjCnq0l
	+tip764dZwAm8tbwnULe8MIqEjNXnc7iI279uTFOynY6J3Oj103pAAV8Mw1yHFmUJQ+SoP0H2dRlk
	5b72WokXbPZjaLw+2qzg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j6xhe-0005Cd-0B; Wed, 26 Feb 2020 14:30:22 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j6xhT-00052D-Pv; Wed, 26 Feb 2020 14:30:13 +0000
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com
 [209.85.222.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2028A2468D;
 Wed, 26 Feb 2020 14:30:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1582727409;
 bh=FTavrhRvD3/cAi6dtPOZfJq/yT2BV2F/rKEuNXloXiw=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=UgKEAOVPqCjEnalnG/MJpctIDGJWpzc2VZ3liqn3FBmTSyRcGR6x0QQxl+hDA8K7m
 0N/mJRIgoKmlNj5OsWGP15UXTpGPisYFxZ62tjsvVR5qzCWQS5DYFn4Ij5KrMu0G8J
 JQK2IWg89VZASe7ljBjnu5MKAJcRa0Sws1CB9+HQ=
Received: by mail-qk1-f170.google.com with SMTP id z19so2775716qkj.5;
 Wed, 26 Feb 2020 06:30:09 -0800 (PST)
X-Gm-Message-State: APjAAAViYQk2kYB7PXJyYSHGcRIKOOBIUmuumfysJ9PoPMgWvnZYy9a+
 u7mlWDzI0rGtqxT7ij16lI/eichO8Bp6LOhTYQ==
X-Google-Smtp-Source: APXvYqx8P7fHvCOhAoSOWA8DnUwX4yyOHQiABO8b/bbXdZCaWKAxi3z6qQ+ITbxwwNfVk+W8jZLhM9/ZJQIl6x+NuTM=
X-Received: by 2002:a05:620a:12a3:: with SMTP id
 x3mr2439558qki.254.1582727408199; 
 Wed, 26 Feb 2020 06:30:08 -0800 (PST)
MIME-Version: 1.0
References: <20200221053802.70716-1-evanbenn@chromium.org>
 <20200221163717.v2.1.I02ebc5b8743b1a71e0e15f68ea77e506d4e6f840@changeid>
 <CAL_JsqL94vtBEmV2gNWx-D==sLiRXjxBBFZS8fw1cR6=KjS7XQ@mail.gmail.com>
 <CAKz_xw2ETZ5eyNfdWU5cF6Qy23E1NqhpFHoLT_CzUDHWTCbw4Q@mail.gmail.com>
In-Reply-To: <CAKz_xw2ETZ5eyNfdWU5cF6Qy23E1NqhpFHoLT_CzUDHWTCbw4Q@mail.gmail.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Wed, 26 Feb 2020 08:29:56 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLYpSK6HRT4s=hq153xvU_aiPCq3Hk_oZC-7X7e7daA7Q@mail.gmail.com>
Message-ID: <CAL_JsqLYpSK6HRT4s=hq153xvU_aiPCq3Hk_oZC-7X7e7daA7Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: watchdog: Add mt8173, smc-wdt watchdog
To: Evan Benn <evanbenn@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200226_063011_869332_498684A9 
X-CRM114-Status: GOOD (  12.17  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 LINUX-WATCHDOG <linux-watchdog@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 LKML <linux-kernel@vger.kernel.org>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Julius Werner <jwerner@chromium.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 "David S. Miller" <davem@davemloft.net>, Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Feb 25, 2020 at 6:15 PM Evan Benn <evanbenn@chromium.org> wrote:
>
> Thanks Rob
>
> > This should be a child of some Mediatek firmware node. I assume
> > watchdog is not the *only* function.
>
> I am not quite sure what you mean, do you intend this:
>
>  firmware {
>    watchdog {

Not quite. /firmware is generic container. I'd expect another layer in
the middle for the overall set of Mediatek firmware behind smc calls.
Look at 'xlnx,zynqmp-firmware' for an example.

Rob

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
