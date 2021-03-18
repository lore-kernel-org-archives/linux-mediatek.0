Return-Path: <SRS0=MDpP=IQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95379C433E0
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Mar 2021 01:28:17 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CB8F564F38
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Mar 2021 01:28:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CB8F564F38
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=U/YUdbUT8V+9OD/yTwHDVeDrhSTj9kh8tWFKB8afsd8=; b=qYd5/AWssA7iCI4y6dA7GGg1t
	/g//3s37nfZNYPmXiX8oLs9RpjOUBug6+0DqoBPvm+GplPiom9b11obMfrEaA16CQ4HO9gnj7tZAZ
	ZzJrObHmB8jmuQmdygNJ8MeyhVQ7Gz3dszpe32aRs64ArYascHXHsPFXhB/8oYcl2AzzV+5cY3SAw
	lVUp/PDxdz9AP53gkTIsEN/9MNeVKHoTWM41aaAMGX+B8w11+GW6jLX1kPh6lU1pHIHZBDBVlV2Z6
	KNrkuQzzfCtJHnAHQZoprEPLB5urd27tikhX5DYdDscHLJjyPfr0uRP8xF4Ze9YG4FqR1TPDl6Uqe
	IAbrCzmzA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lMhSI-004F6l-KA; Thu, 18 Mar 2021 01:28:07 +0000
Received: from mail-il1-x12f.google.com ([2607:f8b0:4864:20::12f])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lMhSE-004F6N-Qz
 for linux-mediatek@lists.infradead.org; Thu, 18 Mar 2021 01:28:05 +0000
Received: by mail-il1-x12f.google.com with SMTP id l5so3369913ilv.9
 for <linux-mediatek@lists.infradead.org>; Wed, 17 Mar 2021 18:28:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uOjKjs4Ioywu0sks2JQgWXB9Qs16kCgcivZBVvJn86U=;
 b=hld3X585HJjdQYYvS1ETXFpQGVKx7mDNLAtLYOgu+wuT1IKtaU2FB9hVR3EiTHCy27
 n5xmwhVcaAALDu505A73xYuf+RxQNqAtx04AbBpONFPx3wWzkNiq5+GQ//iZzRya+S1x
 ENMkMB5tOZ8G0PWqmDAwWAaSzgA9unoj3r/MfbKYQ+BbbJXC7TvD63ac6h2dFN9+t0bv
 J5Ly8WcbXIefKCsejDjhX03u0Lak0SLjD2UE7GJrNWajdOlQGhVqLX9kMp0cPSYSQEST
 Fm+24STN6xAltjN30CoeAXdkn6/G35+lTu7QkaePD9G9NH/ppqBfCiFotaszdLwgk3UT
 7P9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uOjKjs4Ioywu0sks2JQgWXB9Qs16kCgcivZBVvJn86U=;
 b=XOchxvTXNdIQY5memD1by26lITotbMIPhuPCokhmm58tg9cyuZzm8H6oCgwsGCmzhV
 3oV4sua7NHFWh01ewVgTU7H11H2mREC1AnJkfheOYMcF9Wx0uKHBqu8bpwNBhnNBecpm
 GMzPe5B+/oX4t+gaFMB5VNDkVEPRLFPYNuXXz2glpIB/AOMoHUSuOIWbjAifVX3kp9Dp
 VQQ7sQxMPelp5QJyE0FIMdBXPEOOmLB0QYj21nil+T5SwUELCwwkwIgBIcdKYmqAWYr3
 iq/4+pFJtQZeKzp25zRs1YD/cNAQtH5GizHRCV2dgYbkw1EHCU4C/hPaxFyK6TcG5MZh
 3aTA==
X-Gm-Message-State: AOAM531+f+A+vuCtYwdjUJG+lG/jwFx7apCQc8KWuEHD99bOWfc1AwBI
 tX7lQG4WsrLbjNDPMISY1Qi9nO1hRBPddEG6Lgslyg==
X-Google-Smtp-Source: ABdhPJwmiUIwFrt8IB4rlFnwaZV57qrA05SCd9JxNA1keQIDqtP/M6+MT42UhtfAknTN84Jbp8hmm+nARoMRtG8+3q8=
X-Received: by 2002:a05:6e02:12e6:: with SMTP id
 l6mr9251401iln.218.1616030879356; 
 Wed, 17 Mar 2021 18:27:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210317034311.2281708-1-tzungbi@google.com>
 <YFJVIfTPnZe/SfgX@builder.lan>
In-Reply-To: <YFJVIfTPnZe/SfgX@builder.lan>
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Thu, 18 Mar 2021 09:27:48 +0800
Message-ID: <CA+Px+wWnB0ZigyVsOHhEnNDCEToOEF6JZSGQFNq1SZE3TyxH2Q@mail.gmail.com>
Subject: Re: [PATCH] remoteproc/mediatek: set to DEVAPC domain 3 for MT8192 SCP
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, 
 "open list:REMOTE PROCESSOR (REMOTEPROC) SUBSYSTEM"
 <linux-remoteproc@vger.kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Tinghan Shen <tinghan.shen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210318_012803_190145_91A4489F 
X-CRM114-Status: GOOD (  19.16  )
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

On Thu, Mar 18, 2021 at 3:14 AM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> On Tue 16 Mar 22:43 CDT 2021, Tzung-Bi Shih wrote:
>
> > DEVAPC (device access permission control) is a MPU (memory protection
> > unit) in MT8192.
> >
> > To restrict SCP accesses to a specific memory range, sets SCP to DEVAPC
> > domain 3.  ATF (Arm trusted firmware) should setup memory range for the
> > domain.
> >
> > Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
>
> As written here Tinghan is the author of the commit, but the author of
> the patch is Tzung-Bi. Please resolve this.

Tinghan is the co-author of the patch.  Added "Co-developed-by" tag in v2[1].

[1]: https://patchwork.kernel.org/project/linux-remoteproc/patch/20210318012416.2816574-1-tzungbi@google.com/

>
> Regards,
> Bjorn
>
> > Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
> > ---
> >  drivers/remoteproc/mtk_common.h | 2 ++
> >  drivers/remoteproc/mtk_scp.c    | 3 +++
> >  2 files changed, 5 insertions(+)
> >
> > diff --git a/drivers/remoteproc/mtk_common.h b/drivers/remoteproc/mtk_common.h
> > index 61901f5efa05..2aa9fdf5e59b 100644
> > --- a/drivers/remoteproc/mtk_common.h
> > +++ b/drivers/remoteproc/mtk_common.h
> > @@ -51,6 +51,8 @@
> >  #define MT8192_CORE0_WDT_IRQ         0x10030
> >  #define MT8192_CORE0_WDT_CFG         0x10034
> >
> > +#define MT8192_SCP_DEVAPC_DOMAIN     0x85080
> > +
> >  #define SCP_FW_VER_LEN                       32
> >  #define SCP_SHARE_BUFFER_SIZE                288
> >
> > diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
> > index 9679cc26895e..50bdec5a97e3 100644
> > --- a/drivers/remoteproc/mtk_scp.c
> > +++ b/drivers/remoteproc/mtk_scp.c
> > @@ -374,6 +374,9 @@ static int mt8192_scp_before_load(struct mtk_scp *scp)
> >       /* enable MPU for all memory regions */
> >       writel(0xff, scp->reg_base + MT8192_CORE0_MEM_ATT_PREDEF);
> >
> > +     /* set to DEVAPC (device access permission control) domain 3 */
> > +     writel(3, scp->reg_base + MT8192_SCP_DEVAPC_DOMAIN);
> > +
> >       return 0;
> >  }
> >
> > --
> > 2.31.0.rc2.261.g7f71774620-goog
> >

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
