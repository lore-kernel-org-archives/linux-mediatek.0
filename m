Return-Path: <SRS0=ZZ2m=JU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1D27C43460
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Apr 2021 18:42:43 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5917D613CD
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Apr 2021 18:42:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5917D613CD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=1E0tfKsyVXJSdZXZ+orX26g7iL+L/7wqcSoKHWXYeqc=; b=esoAhq4ihCFHwI4C/mje4wxKe
	0S++TMMpwT0Wsk/mCawgrNWNuzOukest0aNumXR3RWYHXbOyn3piv+vc3KsRoNs1PGUvJOxiBRoSn
	hxeV9tLH+ofboGxl+Y19b8AYeSuxbuWonDCE7BZKL43U2yCDB7I6tzEBFjKj7NHCbhjVXo+y8yHym
	MAJekBQ6QWUD1NDIWVQ3NzAME1C2DSjxwq2Vix/hLysKqr00dXcrr8oCIhMzPux/U4SgcJ/RR074U
	agDDINixodeQXCG6EOUZuOuTynrsJhR63uS/b2r/JtrQ/XAkKt0YwRycanuqOr9bp7eCImHMdLv+Y
	/xZ+B03YA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1la0ky-002AqC-T1; Fri, 23 Apr 2021 18:42:24 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1la0kn-002Apg-Cx; Fri, 23 Apr 2021 18:42:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=qIaVUyzdhjBUU7tl3VOejcO6+StJQjKYlePJddUmi7E=; b=xSYfN2sAxIghFhsQVnhPuijS3q
 VU9QBQ+Rk/xe97IkYRzvNujK+7KoHOPaxMTXIOcwQy1AITRPPW8DrgqHP8Nd0Z45MDLMl5SRS+8/L
 7Uw6oneOpedhikvpuisaiY4Bzg6ayA01FqyGTXx5FhT5WqgOjAsUdZBdb3wpEB2R6Y7SOSrYAKQlg
 j60TtCbm5xZqh7YZ3bXEv5WOI3zvUJfoUZM46V9GLDqiZqfqgDKWCKbd9IvmzfUmYbNk0ERNtf5gb
 KAPDAiXI21xiJaHDCqrlkOjsJInMhXBQmNZBvdVy+h0fsgpVRHdG9SiYp3R6QnVIU2xFpki+Z6o2o
 3xj5GoPg==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1la0kk-00EdKJ-UE; Fri, 23 Apr 2021 18:42:12 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id DB0A5613CD;
 Fri, 23 Apr 2021 18:42:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1619203329;
 bh=qIaVUyzdhjBUU7tl3VOejcO6+StJQjKYlePJddUmi7E=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=O1+nBERqjuL9ybFDM9msy8Fu+jIgxFrtzSKRGtbFXtmhGVR0hc+9WbZp3CwI2aDHQ
 /HjLp6C5mV+dyUnt/cOwM2HU6fOmJ6ZfLUlibcOwmS+2y7GbMHc4LDaPLMBse8bH1J
 8FfdnBTRyFH+ZmkLPXg+UCnUs5X699xXgRETDHRn/yn5UCfuYuTGTqswdFxxy6Ive5
 JOcb8P1gpMXjL94/kiKbFpEoI7F/U3cvA3y4rPKK3Mr7g4OzHOPFe9MDuBjM61dSsR
 yolUYqZjpVcVplTxYG6EYBoOFvkJyV8NbbzPCVM9Asb68pzZLsLQwcbaDydfULwDL+
 Qakgtck9a+BWw==
Received: by mail-ed1-f43.google.com with SMTP id z5so21994237edr.11;
 Fri, 23 Apr 2021 11:42:09 -0700 (PDT)
X-Gm-Message-State: AOAM530cgayPedRkTYtHjn/Exzneua45vRQOOrQgsATPscOy6gQaXCnf
 zsxfjsjeMPoJ7sdF/lA5rViVmAzkWasupi5RyA==
X-Google-Smtp-Source: ABdhPJxRxWR99r32kKOjtbYRcF+R9SoFCUGOziFQxhTRy7/ub7acC9s4XzQRvki8x3jvmUqBtR/g+HPM9RbFw1VUkOs=
X-Received: by 2002:a05:6402:34c8:: with SMTP id
 w8mr6219150edc.194.1619203328426; 
 Fri, 23 Apr 2021 11:42:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210420024222.101615-1-ilya.lipnitskiy@gmail.com>
 <20210421220302.GA1637795@robh.at.kernel.org>
 <CALCv0x2oSXBT-6LteYtr9J5XmmDuer_=sbCgB5CBXWe_cKk2sA@mail.gmail.com>
In-Reply-To: <CALCv0x2oSXBT-6LteYtr9J5XmmDuer_=sbCgB5CBXWe_cKk2sA@mail.gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Fri, 23 Apr 2021 13:41:56 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+Zhgn53wGdMbZKMjxk2gPQQFpjSsudVso+keonDCd+oQ@mail.gmail.com>
Message-ID: <CAL_Jsq+Zhgn53wGdMbZKMjxk2gPQQFpjSsudVso+keonDCd+oQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: net: mediatek/ralink: remove unused bindings
To: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, netdev <netdev@vger.kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, 
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 John Crispin <john@phrozen.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210423_114211_044445_C9630ACF 
X-CRM114-Status: GOOD (  19.20  )
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

On Wed, Apr 21, 2021 at 5:05 PM Ilya Lipnitskiy
<ilya.lipnitskiy@gmail.com> wrote:
>
> Hi Rob,
>
> On Wed, Apr 21, 2021 at 3:03 PM Rob Herring <robh@kernel.org> wrote:
> >
> > On Mon, Apr 19, 2021 at 07:42:22PM -0700, Ilya Lipnitskiy wrote:
> > > Revert commit 663148e48a66 ("Documentation: DT: net: add docs for
> > > ralink/mediatek SoC ethernet binding")
> > >
> > > No in-tree drivers use the compatible strings present in these bindings,
> > > and some have been superseded by DSA-capable mtk_eth_soc driver, so
> > > remove these obsolete bindings.
> >
> > Looks like maybe OpenWRT folks are using these. If so, you can't revert
> > them.
> Indeed, there are out of tree drivers for some of these. I wasn't sure
> what the dt-binding policy was for such use cases - can you point me
> to a definitive reference?

Perhaps we should write that down more explicitly, but I think it is
pretty rare actually. And really, I'd like to require we have at least
1 dts user. Though, then we'd just have dead dts files. More
generally, other projects use the bindings and dts files. The bindings
and dts files live in the kernel tree for convenience and the simple
fact that is where the vast majority of both developers and hardware
support are. There are exceptions of course such as h/w that doesn't
run Linux.

I'm all for removing this if no one cares (please try to find out) or
if the existing binding is just bad (doesn't match the h/w or is
incomplete in an incompatible way). I would have expected in the 5
years since it was added, a user (either dts file or driver) would
have appeared.

Rob

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
