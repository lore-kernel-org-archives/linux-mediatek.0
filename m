Return-Path: <SRS0=qi5H=EL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B6C6C388F7
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Nov 2020 19:27:36 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EF3A320728
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Nov 2020 19:27:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jtBiEHkW";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="OQqCNHtf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EF3A320728
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=CBN5z0QCNGZzuAnRX7PiDP8zbY4sBYLy9nM5PBCUkKQ=; b=jtBiEHkW4LglOl8IgQnfqP1Vn
	FnjK27cl/I+9eckMNDqq6xx7Kb4w3pxtfM664K2zp1xSU3uP1sY4SHq4kYui3xLLHT7KJFFOCl3vb
	nqF2rHJuq7Or9PbZ6rEtMBvT8pyoZo0g+kdZFUoShZ4cT52jzNdB+PTtWmRRPXHZqAfU0Hrl9hwPl
	HJi/Yvs9lv6vlzVz4bc5gN66vOPTeiSFjM8GktAyvNV29eNycDcKYiTMJdCLEhwVmxOh3x7cSgBxv
	8hBBFnnEuVbi6YnsbAWTdUCP7wXCT+9IOvLCwzylYMQ9/sPp/DwIXEBuuEGjQQLF68AObnVUsUPDZ
	nQyFPRPdQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kakut-0007Kj-QE; Thu, 05 Nov 2020 19:27:27 +0000
Received: from mail-yb1-xb42.google.com ([2607:f8b0:4864:20::b42])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kakuq-0007Ij-Kv
 for linux-mediatek@lists.infradead.org; Thu, 05 Nov 2020 19:27:25 +0000
Received: by mail-yb1-xb42.google.com with SMTP id b138so2331047yba.5
 for <linux-mediatek@lists.infradead.org>; Thu, 05 Nov 2020 11:27:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OEJCPZbEVHfia1Epohqphy6Yj/smF64D3n/3+kypg8I=;
 b=OQqCNHtf8pBE8qWazz/H5tigbyp3ReGtnojBVAU00we9GFG+Kcj36jZiUw5IyMElzC
 huQq6/xWdiIFb7LxYniPB7g7MnWIqrmwD31l/b19exLeoUJpo3Eb5I8P71SKDMVPekSA
 15iEsPQJnsEFHpMNYCh30nF1mJ/CoiF96J0jdlHyrgvhlxCgztRQyQz/JtQ6nNa6Bhy/
 60W3FjBnys/p+nIf4Yp2fE1/NtxZG48chR23r1QKiAmsRpT+2rlF/YkZcX3K9s0u1RYB
 xt2FbD7lCfGt6OBTRRigrztWvQ52AFMJbJgEEFEJ+zMPrTSSr/RkRj1ygcXW2Hatfqbz
 v/hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OEJCPZbEVHfia1Epohqphy6Yj/smF64D3n/3+kypg8I=;
 b=T3JKTEpzb/mq/foKk6D8aqIP9kjf/alywzv7lNgHhNqNtZG32hGNcSLOQTz+BSKI0S
 bHmcBcRHBL8N1ebv6AAmfTeNiTMBmD9jCwbvCMw64t8yfZi1jviQ4Dy9GSWCcprMQwch
 QuTLD4RJkLisk1m8MQL7fjmxYuwtFDRqB/hsuMR+UWfiEj6zGl0EAN1ASJnTfWsE2UUX
 fIRN6N8Jb3cTIIlxmjjgYPm3GNBge2qnKkG3OE4+faNV5npdyUCwUzAXarKsmDckJf6j
 tfvMW4sGS2HsiMQPrwdKUJBdZJXVe4rSnpc5BOoMVj9ufVRRat8O/3GVE8wqTPbA0qHW
 FNaw==
X-Gm-Message-State: AOAM533/sYVxHFW8jVri+09faQiMSoRqmzw7iRfFQ8MlZ7ryFiS1uttX
 ntsfEUIUi0WszIOrzN+Kv+mapjO5fTV1NORlRINW+A==
X-Google-Smtp-Source: ABdhPJwlnGJOo1LG7y4K+S2hBDh8YtqWL23pmaubXW/KQdP2prs3xkbdAYxyo5drnjSES2ecA8NUXYNNDVjbT/yPuF0=
X-Received: by 2002:a25:3:: with SMTP id 3mr5833833yba.412.1604604440845; Thu,
 05 Nov 2020 11:27:20 -0800 (PST)
MIME-Version: 1.0
References: <20201104205431.3795207-1-saravanak@google.com>
 <20201104205431.3795207-2-saravanak@google.com>
 <20201105171201.GF4856@sirena.org.uk>
In-Reply-To: <20201105171201.GF4856@sirena.org.uk>
From: Saravana Kannan <saravanak@google.com>
Date: Thu, 5 Nov 2020 11:26:44 -0800
Message-ID: <CAGETcx9_En10j0DwktXtPDrx=Aqdr2iWEuHmYB-=SnfODTmMfg@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] spi: Populate fwnode in of_register_spi_device()
To: Mark Brown <broonie@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201105_142724_758984_5D86C26D 
X-CRM114-Status: GOOD (  19.55  )
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
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Cheng-Jui.Wang@mediatek.com,
 Nick Desaulniers <ndesaulniers@google.com>,
 LKML <linux-kernel@vger.kernel.org>, linux-spi@vger.kernel.org,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Daniel Mentz <danielmentz@google.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Nathan Chancellor <natechancellor@gmail.com>,
 Android Kernel Team <kernel-team@android.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Nov 5, 2020 at 9:12 AM Mark Brown <broonie@kernel.org> wrote:
>
> On Wed, Nov 04, 2020 at 12:54:31PM -0800, Saravana Kannan wrote:
> > From: Daniel Mentz <danielmentz@google.com>
> >
> > This allows the fw_devlink feature to work for spi devices
> > too.  This avoids unnecessary probe deferrals related to spi devices and
> > improves suspend/resume ordering for spi devices when fw_devlink=on.
>
> >       of_node_get(nc);
> >       spi->dev.of_node = nc;
> > +     spi->dev.fwnode = of_fwnode_handle(nc);
>
> Why is this a manual step in an individual subsystem rather than
> something done in the driver core

It can't be done in driver core because "fwnode" is the abstraction
driver core uses. It shouldn't care or know if the firmware is DT,
ACPI or something else -- that's the whole point of fwnode.

> - when would we not want to have the
> fwnode correspond to the of_node,

Never.

> and wouldn't that just be a case of
> checking to see if there is a fwnode already set and only initializing
> if not anyway?

Honestly, we should be deleting device.of_node and always use
device.fwnode. But that's a long way away (lots of clean up). The
"common" place to do this is where a struct device is created from a
firmware (device_node, acpi_device, etc). I don't see a "common place"
for when a device is created out of a device_node, so I think this
patch is a reasonable middle ground.

-Saravana

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
