Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADA29C4321E
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Mar 2022 12:18:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qIeTO7Nqr7lRHkJrYidGqGPydpj8R12YW9qyFPWLtdw=; b=yHwMIIRHgsWVlA
	IZmCJHbobmRhsKil1miuBFDEGW9Btmmm4RlH+M37/4P6uAryDyfBxnX1DWUS0/8u3/wU8w6x57b6y
	+wMWG4inPvjP/kz814khE9HGrSVMSbTZ0A4SDHvLuKGkHmFLQde3+0/8mBLXgck3DSJaJXwKz/w/E
	f4Z+CenzvpqiTZhdWhyJfmKCejNKaVjiqUMhACvtVAbXVoX+M1/B7XMNRA7XqKW8KcQlIEZGfd1hu
	PradOEXATjFv+L/BVIw0KUhrsrCeHSZqqCrzdPgpq1S5HoQsf/sxqtptaxQMvX0Ife89CQnohhYZ7
	jUxujMDbYr+fjr6VJX9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nPkPk-006JMW-E7; Thu, 03 Mar 2022 12:18:36 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nPkPf-006JIe-6O
 for linux-mediatek@lists.infradead.org; Thu, 03 Mar 2022 12:18:34 +0000
Received: by mail-wr1-x434.google.com with SMTP id u1so7514685wrg.11
 for <linux-mediatek@lists.infradead.org>; Thu, 03 Mar 2022 04:18:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=W95klwG+EWnuJlXqfneyIPG4bMJIpYFCGfgCPBAo/s4=;
 b=BVoUYAMy6igzOx7YCxgmD2obGVeA4FBbFy39UaDXpcyotfQj1WSs4cD2dBmZ3jehpH
 Xv0H27JfD7LtNc3KTOYt5JsPQaESLbVZdrRIjVdCS/EqEN+LtHV3OI92ZhbhaxnOPsMB
 zwIbvmQMtvcWtqQz/AOpNYfJzkMTFsv4hojr0PuJEFUbZHgxYNi3BKpDV1mgkUzm+fR0
 4lMaaRE5yh5PGutSdpreHiYAqhMDl6KUHTvi2q6aV5S93rhbYz2wGWOzwPq3hB3YVbYG
 uAhL64o8wkOM/gpLUr2Hb7oB/DraMZLkoBj2jGHmKGFPjyxdoWyrLbd/6WyXGtmMO48w
 vp2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=W95klwG+EWnuJlXqfneyIPG4bMJIpYFCGfgCPBAo/s4=;
 b=0uOEetJaKjKj3cXUYKd6MqLRRHK6f4GQv8YtHA45vgLBxi2r1Rf4spCYiBs7q4H/e6
 tMkpsNcuvDtmxujUsPYKIVx3DKIuCMHOu1c8cUZ1VX38aw4jjExDhLw3t1B4PZ28kBC+
 lgzTgYJqy51riBGipKwNhnot3KOvQefI7aHbWQrI8dtwE+/Hv+27hipygeKbvWE6Qy+U
 uzTfpw6StYfFsAPCk1jm6GQpguumK9G37ym4bNR5Brio2v3puS0nHFRyb3p4f4QSgrXp
 BCx53n3VTTQCgmwEK88IxphHtPoidjPB28i1HGa2E6qsXRThLcfEeGb8oXqfbIVXiOi2
 2qNw==
X-Gm-Message-State: AOAM532fvXybT1xuq6iPj7N8b3kMC1tRBGHL+/zN5i98/zdJ+xGUO/AI
 13keyRaBCLH4CmpJCG0Tv+h9Kw==
X-Google-Smtp-Source: ABdhPJwgYeUN7RS9hQRShRziePljKQd/1cMutSSEkk4MeQ2QRRtTjZSLz5QSndDd2pML49XlqkHAqw==
X-Received: by 2002:a5d:6d0d:0:b0:1e8:7b6a:38e7 with SMTP id
 e13-20020a5d6d0d000000b001e87b6a38e7mr26568054wrq.625.1646309908722; 
 Thu, 03 Mar 2022 04:18:28 -0800 (PST)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175]) by smtp.gmail.com with ESMTPSA id
 p6-20020a5d4586000000b001f0436cb325sm1774600wrq.52.2022.03.03.04.18.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Mar 2022 04:18:28 -0800 (PST)
Date: Thu, 3 Mar 2022 12:18:24 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Xiaomeng Tong <xiam0nd.tong@gmail.com>
Cc: david.laight@aculab.com, alsa-devel@alsa-project.org,
 kvm@vger.kernel.org, gustavo@embeddedor.com,
 linux-iio@vger.kernel.org, kgdb-bugreport@lists.sourceforge.net,
 linux@rasmusvillemoes.dk, dri-devel@lists.freedesktop.org,
 c.giuffrida@vu.nl, amd-gfx@lists.freedesktop.org,
 torvalds@linux-foundation.org, samba-technical@lists.samba.org,
 linux1394-devel@lists.sourceforge.net, drbd-dev@lists.linbit.com,
 linux-arch@vger.kernel.org, linux-cifs@vger.kernel.org,
 linux-aspeed@lists.ozlabs.org, linux-scsi@vger.kernel.org,
 linux-rdma@vger.kernel.org, linux-staging@lists.linux.dev,
 h.j.bos@vu.nl, jgg@ziepe.ca, intel-wired-lan@lists.osuosl.org,
 nouveau@lists.freedesktop.org,
 bcm-kernel-feedback-list@broadcom.com, dan.carpenter@oracle.com,
 linux-media@vger.kernel.org, keescook@chromium.org, arnd@arndb.de,
 linux-pm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 bjohannesmeyer@gmail.com, linux-block@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, christophe.jaillet@wanadoo.fr,
 jakobkoschel@gmail.com, v9fs-developer@lists.sourceforge.net,
 linux-tegra@vger.kernel.org, tglx@linutronix.de,
 andriy.shevchenko@linux.intel.com,
 linux-arm-kernel@lists.infradead.org, linux-sgx@vger.kernel.org,
 nathan@kernel.org, netdev@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 tipc-discussion@lists.sourceforge.net, linux-crypto@vger.kernel.org,
 dmaengine@vger.kernel.org, linux-mediatek@lists.infradead.org,
 akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org,
 christian.koenig@amd.com, rppt@kernel.org
Subject: Re: [Kgdb-bugreport] [PATCH 2/6] treewide: remove using list
 iterator after loop body as a ptr
Message-ID: <20220303121824.qdyrognluik74iph@maple.lan>
References: <39404befad5b44b385698ff65465abe5@AcuMS.aculab.com>
 <20220303072657.11124-1-xiam0nd.tong@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220303072657.11124-1-xiam0nd.tong@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220303_041831_340062_F3712E6D 
X-CRM114-Status: GOOD (  21.31  )
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

On Thu, Mar 03, 2022 at 03:26:57PM +0800, Xiaomeng Tong wrote:
> On Thu, 3 Mar 2022 04:58:23 +0000, David Laight wrote:
> > on 3 Mar 2022 10:27:29 +0800, Xiaomeng Tong wrote:
> > > The problem is the mis-use of iterator outside the loop on exit, and
> > > the iterator will be the HEAD's container_of pointer which pointers
> > > to a type-confused struct. Sidenote: The *mis-use* here refers to
> > > mistakely access to other members of the struct, instead of the
> > > list_head member which acutally is the valid HEAD.
> >
> > The problem is that the HEAD's container_of pointer should never
> > be calculated at all.
> > This is what is fundamentally broken about the current definition.
> 
> Yes, the rule is "the HEAD's container_of pointer should never be
> calculated at all outside the loop", but how do you make sure everyone
> follows this rule?

Your formulation of the rule is correct: never run container_of() on HEAD
pointer.

However the rule that is introduced by list_for_each_entry_inside() is
*not* this rule. The rule it introduces is: never access the iterator
variable outside the loop.

Making the iterator NULL on loop exit does follow the rule you proposed
but using a different technique: do not allow HEAD to be stored in the
iterator variable after loop exit. This also makes it impossible to run
container_of() on the HEAD pointer.


> Everyone makes mistakes, but we can eliminate them all from the beginning
> with the help of compiler which can catch such use-after-loop things.

Indeed but if we introduce new interfaces then we don't have to worry
about existing usages and silent regressions. Code will have been
written knowing the loop can exit with the iterator set to NULL.

Sure it is still possible for programmers to make mistakes and
dereference the NULL pointer but C programmers are well training w.r.t.
NULL pointer checking so such mistakes are much less likely than with
the current list_for_each_entry() macro. This risk must be offset
against the way a NULLify approach can lead to more elegant code when we
are doing a list search.


Daniel.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
