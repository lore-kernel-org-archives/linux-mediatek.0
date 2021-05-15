Return-Path: <SRS0=4stH=KK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A37FEC433B4
	for <linux-mediatek@archiver.kernel.org>; Sat, 15 May 2021 01:30:42 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 26E7761408
	for <linux-mediatek@archiver.kernel.org>; Sat, 15 May 2021 01:30:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 26E7761408
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=af733q78kgMf9AeYW1v0x7eebbHYuRdtH+G2gfL5dfs=; b=Z+opFLmI1atpuBj8qMx9Fah7z
	usr+IjHujIVAdmGihi1LiPyIYBQNzWv8//eEpXSC/KxKesODre8esYalE+FtJsQv5OcFGFxZfi7ii
	GR3ilWdzW0rKs97JsHuvFOIDU6ybZr/WaLlBUqgFIPB5Mb8acfO8c0ABNn109f2k8saXbqIimxmSO
	5cLwg7o+quNUSm2e+bjWpLLF0sYaPRz/eiaTlRi8pXFaI0bzO/srOBk0YeaPl/EzI+MIUu3hkbB35
	Lj2yZ/9lVF6MryQ3zDpfnwxJ9fbefFjZWW5P9IG43u8NBDyYqgL/jW1OikgVNevsrE44P5vp6QyMZ
	VcAqUjgwA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lhj8O-009SJ0-JV; Sat, 15 May 2021 01:30:28 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lhj8B-009SIK-Cm
 for linux-mediatek@desiato.infradead.org; Sat, 15 May 2021 01:30:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=xnKdVLmA6JV4gVRXBLAZ9YZgzU3RbAwYHw7sjvnZr2M=; b=qSuQcCeyXD4rKumTY4W3JSHqxq
 YrCiwOZP2FS7E7VFPd6sTPf1R82hhhGk5sBAvyJ9a3aNKx8gAbhFS2uwoSxCJ4n/JQPq25yUTpHBK
 qXEfTumK7RLhjp3E9EBPoCfCT4t3h2c8c02bpkVZbb7dmYYzKBaW0Sjkcvf4FR05/yH1WKfJ4lCbs
 KN/RCW0d3OiNClrT2ZcIoQUbll2tP00N06hublz3EWJXQT6sjFVWjd2kSXDO6bZTvMkcR2uKHeHDQ
 t26x3z9zmAUmBdlQpnptL6uEr2CQKUZW3s0wH/NEPzl200II1/Q6YXMACagaHipweyd5rNBgeaHMT
 6GNw6+jg==;
Received: from mail-vk1-xa2b.google.com ([2607:f8b0:4864:20::a2b])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lhj88-00CLdU-Gw
 for linux-mediatek@lists.infradead.org; Sat, 15 May 2021 01:30:13 +0000
Received: by mail-vk1-xa2b.google.com with SMTP id q143so305018vkb.7
 for <linux-mediatek@lists.infradead.org>; Fri, 14 May 2021 18:30:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xnKdVLmA6JV4gVRXBLAZ9YZgzU3RbAwYHw7sjvnZr2M=;
 b=VwV6MZUCTsR/21K6Nf4JfACfINmxMfGCBHGmn98b0KfWsmCZrSQ2JpyT8Bdp68jt86
 sDNDN7SbuawvPtvhjP9wKtwRygwgJzn0tfMmDDcZ+h4vVw6XJcnXLyVLstDDSixUw5Wg
 a/R/uOdLzy1G4+2g8s+miyc6pGFSjC8j19gPQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xnKdVLmA6JV4gVRXBLAZ9YZgzU3RbAwYHw7sjvnZr2M=;
 b=k2uXjJBkGfbfkOAX+OaoUKpJiIB2yY6/FvP2x4qsMV239BaunOVpb8qOmvhiOkYApB
 21YZHxBYwvsNClFiktSvOy6NJX2+V6vQDL3QgMEwkhI6FRVvDzFcXHZBsH7m+EM1/QAC
 EkwcTowWWGS8Va86JRYQ6+a4HGsuSkLu87JfAh3JKQtTb19KaKy/duwFEtOTJ6KabREy
 uF9k/Y3VEDyJl+W2MXB+PO1cE2KECYiSsWXD/LioM/I3W/5JgVftr6l9iQ5MedFCta2X
 9RXvYza43R2elLQNBnxP72uZcWy5B3JdPwzwCrpLQ0tkUSZ5UEUdR2PEI4grMj/m6iwX
 0apw==
X-Gm-Message-State: AOAM533LdCqRJGO7WED0awwSGh7fhw0G/f8pGHPcRdyjZpndB3/kBLO8
 vh7ckYq/KmRlE4Ki5ehsJ/OXg7BE7fBGZe8miv0JdA==
X-Google-Smtp-Source: ABdhPJx3fj4K/0hK+tGEFHOV0fBGKfWSZTp6om4TbcQ6XfQmzQb1l75qCqJGUbHXGY2nyNG5LbOZQsO3ewg/M0mqnt4=
X-Received: by 2002:a1f:c704:: with SMTP id x4mr2701192vkf.9.1621042210632;
 Fri, 14 May 2021 18:30:10 -0700 (PDT)
MIME-Version: 1.0
References: <20210421052855.1279713-1-drinkcat@chromium.org>
 <c91746ce-88b6-5612-74a5-74600c7761e8@baylibre.com>
 <CAAEAJfD3i+L4w1NuE5pUkMuH=R3CfBztDn-ZLcYR=onkcZ4Gxg@mail.gmail.com>
 <373d0803-8658-9413-2f51-1e9804c39126@baylibre.com>
 <ce401ca2-e285-4fcf-0583-c1dae94dba6a@arm.com>
In-Reply-To: <ce401ca2-e285-4fcf-0583-c1dae94dba6a@arm.com>
From: Nicolas Boichat <drinkcat@chromium.org>
Date: Sat, 15 May 2021 09:29:59 +0800
Message-ID: <CANMq1KDwVdhw+4UnshoG8Ex5Axyhk1d2WeUxbL=mJTGRsAMJGA@mail.gmail.com>
Subject: Re: [PATCH v13 0/4] drm/panfrost: Add support for mt8183 GPU
To: Steven Price <steven.price@arm.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Rob Herring <robh@kernel.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 devicetree <devicetree@vger.kernel.org>, 
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, Fei Shao <fshao@chromium.org>, 
 David Airlie <airlied@linux.ie>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 Rob Herring <robh+dt@kernel.org>,
 Boris Brezillon <boris.brezillon@collabora.com>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Kristian Kristensen <hoegsberg@chromium.org>, 
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210514_183012_597332_A1E20AAB 
X-CRM114-Status: GOOD (  18.97  )
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

On Fri, May 14, 2021 at 11:27 PM Steven Price <steven.price@arm.com> wrote:
> [snip]
> >>> Seems this version is ready to be applied if we get a review on the DT ?
> >>>
> >>> Mathias ? could you have a look ?
> >>>
> >>
> >> Given Rob has Acked the DT bindings, I think it's OK to apply patches
> >> 1, 3 and 4 via drm-misc, letting Mediatek people sort out the DT changes.
> >>
> >> My two unsolicited cents :-)
>
> You make a convincing point - and if everyone is happy for the DT
> changes to be handled separately I don't see a reason for the other
> patches to be held up.
>
> > Yeah sure, is there a panfrost maintainer in the room ? I can apply them if you ack me.
>
> I seem to be applying most Panfrost changes these days, so I'll save you
> the effort and push 1,3,4 to drm-misc-next.

Thanks Steve!!

>
> Thanks,
>
> Steve

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
