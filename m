Return-Path: <SRS0=MDpP=IQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42ABEC433E0
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Mar 2021 01:35:47 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 93C1C64DF1
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Mar 2021 01:35:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 93C1C64DF1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=lLT06dn679fiJeFfLWEn0+mGal+21u2uH64NPuHniFI=; b=hMICZQTpyzLc5R8BRBq1UzXA8
	eWHqn73SQv/nyu9l0O1W8NSRdnK094LnGOduD5of/fSu0l5FVl8z2Zo+cRZdgQDPMOH9i8IdsbdU/
	xPFRwVIyh6bdfSkQTZbOIM3y2yGPBIv0pryC4sS+BAbuVx4BlScGFLB4w6ApVBjoT9DNV6Ku4nJL2
	Ntckg9ZpG1gxcX0QLLNXjnh5wB0eTXcDsfkCv7qhN72eQNq6k5YyufJC5QR73GYqnl9FnUOesPE/7
	QnqPCFfhQ5c8LKhqCWB33QBdkFKmN6ZJBX+YObkIYJflax6pCSA+B5U9NR//b2yXH8hu+O7cDVLI0
	Z43R+TJ/g==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lMhYP-004FPc-0R; Thu, 18 Mar 2021 01:34:49 +0000
Received: from mail-ot1-x32d.google.com ([2607:f8b0:4864:20::32d])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lMhXu-004FMt-IH
 for linux-mediatek@lists.infradead.org; Thu, 18 Mar 2021 01:34:00 +0000
Received: by mail-ot1-x32d.google.com with SMTP id
 w21-20020a9d63950000b02901ce7b8c45b4so3717484otk.5
 for <linux-mediatek@lists.infradead.org>; Wed, 17 Mar 2021 18:33:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Mlqkc8Fn80lOlVJTmFiV3+xf4AvW508aTxYk8g0qyng=;
 b=u+kJYPGobHpiqa7F8jXyRAuD/inJzoGpu7JeU6eVNhzhp3zF1wJj/Yt4GJxOKKUC7O
 azzp5Wnx9l9URng/E8lPA9NPv4SHChZgMYk/1nD9xaJuaFjzuX2v6sKYFIW6sRpKba0/
 9gcY1Fcw/MmDKhmiMSYrYFPyCjvYg6ODTve34pWaBW16UlkwuDKk956b9baGeWHhIG8m
 k3cZY1RLYcUlmQt90DpnCFKZvkFQsGemy3wLGyEZ4oB9EE5jWJ07wjqRLxIRsVpKAQ2R
 dFOj1T0F93523CHglEfpOzzifOurPprSXPq2av2qHqZQJkt5XvM4jejuoDX71GuzgWz9
 YpQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Mlqkc8Fn80lOlVJTmFiV3+xf4AvW508aTxYk8g0qyng=;
 b=EDia+Dentf092hTQsXqTx4zKf1u5MNNCTQpHYfeFC0OTVltcLgwZ0UExy2nIEjkomr
 yJSUyjo44ZWrcN7gw2JqinSGFEp2nHCjDNkGD9Kd+lGb9Ymy1yXIoDR0+vGw1C4d21L9
 qOTkG6jBmGX9RcAdOcBKtdizAGVxiksgKWBbe0KcQ1pn89MPE9IzjpxLM1VsB+RQxkmx
 KrS1ZPFBWWgh1yY1Nvk8wVSLtUtOSxMRnahKwY+F2aMCy2bOmRZfC2FShe/bndWjzr9Q
 ALPdex3UnJK7pwceN+DbizdkSkaHRota+fIfHM6kbyKB2mao2naEn6ipJwC8KfeWglFr
 zmhw==
X-Gm-Message-State: AOAM530IHrcPfuyP+zL3zgzvY6IZqj7fvfnJxh8xYbUyYAaw9KYM6rLn
 /XgHkf+mB6v1RKMB2DpHGUYW/w==
X-Google-Smtp-Source: ABdhPJwsxmRm8d1n02rxEzbhmTn9pUWKBbLrm4gdM2T4c6U3pXEpaVAOiRceW3oKi3Wh/dqvXbY4yg==
X-Received: by 2002:a9d:590e:: with SMTP id t14mr5439141oth.1.1616031233150;
 Wed, 17 Mar 2021 18:33:53 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id w7sm131363ote.52.2021.03.17.18.33.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Mar 2021 18:33:52 -0700 (PDT)
Date: Wed, 17 Mar 2021 20:33:50 -0500
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Tzung-Bi Shih <tzungbi@google.com>
Cc: Ohad Ben-Cohen <ohad@wizery.com>,
 "open list:REMOTE PROCESSOR (REMOTEPROC) SUBSYSTEM"
 <linux-remoteproc@vger.kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Tinghan Shen <tinghan.shen@mediatek.com>
Subject: Re: [PATCH] remoteproc/mediatek: set to DEVAPC domain 3 for MT8192 SCP
Message-ID: <YFKt/mGha/IQRDz4@builder.lan>
References: <20210317034311.2281708-1-tzungbi@google.com>
 <YFJVIfTPnZe/SfgX@builder.lan>
 <CA+Px+wWnB0ZigyVsOHhEnNDCEToOEF6JZSGQFNq1SZE3TyxH2Q@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CA+Px+wWnB0ZigyVsOHhEnNDCEToOEF6JZSGQFNq1SZE3TyxH2Q@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210318_013357_862246_E6117ADD 
X-CRM114-Status: GOOD (  20.11  )
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

On Wed 17 Mar 20:27 CDT 2021, Tzung-Bi Shih wrote:

> On Thu, Mar 18, 2021 at 3:14 AM Bjorn Andersson
> <bjorn.andersson@linaro.org> wrote:
> >
> > On Tue 16 Mar 22:43 CDT 2021, Tzung-Bi Shih wrote:
> >
> > > DEVAPC (device access permission control) is a MPU (memory protection
> > > unit) in MT8192.
> > >
> > > To restrict SCP accesses to a specific memory range, sets SCP to DEVAPC
> > > domain 3.  ATF (Arm trusted firmware) should setup memory range for the
> > > domain.
> > >
> > > Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
> >
> > As written here Tinghan is the author of the commit, but the author of
> > the patch is Tzung-Bi. Please resolve this.
> 
> Tinghan is the co-author of the patch.  Added "Co-developed-by" tag in v2[1].
> 

Perfect, thank you!

> [1]: https://patchwork.kernel.org/project/linux-remoteproc/patch/20210318012416.2816574-1-tzungbi@google.com/
> 
> >
> > Regards,
> > Bjorn
> >
> > > Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
> > > ---
> > >  drivers/remoteproc/mtk_common.h | 2 ++
> > >  drivers/remoteproc/mtk_scp.c    | 3 +++
> > >  2 files changed, 5 insertions(+)
> > >
> > > diff --git a/drivers/remoteproc/mtk_common.h b/drivers/remoteproc/mtk_common.h
> > > index 61901f5efa05..2aa9fdf5e59b 100644
> > > --- a/drivers/remoteproc/mtk_common.h
> > > +++ b/drivers/remoteproc/mtk_common.h
> > > @@ -51,6 +51,8 @@
> > >  #define MT8192_CORE0_WDT_IRQ         0x10030
> > >  #define MT8192_CORE0_WDT_CFG         0x10034
> > >
> > > +#define MT8192_SCP_DEVAPC_DOMAIN     0x85080
> > > +
> > >  #define SCP_FW_VER_LEN                       32
> > >  #define SCP_SHARE_BUFFER_SIZE                288
> > >
> > > diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
> > > index 9679cc26895e..50bdec5a97e3 100644
> > > --- a/drivers/remoteproc/mtk_scp.c
> > > +++ b/drivers/remoteproc/mtk_scp.c
> > > @@ -374,6 +374,9 @@ static int mt8192_scp_before_load(struct mtk_scp *scp)
> > >       /* enable MPU for all memory regions */
> > >       writel(0xff, scp->reg_base + MT8192_CORE0_MEM_ATT_PREDEF);
> > >
> > > +     /* set to DEVAPC (device access permission control) domain 3 */
> > > +     writel(3, scp->reg_base + MT8192_SCP_DEVAPC_DOMAIN);
> > > +
> > >       return 0;
> > >  }
> > >
> > > --
> > > 2.31.0.rc2.261.g7f71774620-goog
> > >

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
