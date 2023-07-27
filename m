Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D30DBC00528
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Jul 2023 17:57:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wT/ZsiiDZwcgiQgl4DELrnCzGmHF+3XYDdWiMBrFYvo=; b=Xz4o0jymeXqYo0RNm8Gu+b8a18
	iXE5r+wU5WcOw3foO6K93bBo4cG7b5/Rr9NqauJ7mfleRpZyIaRhDjDBEWljSIzEPYRKILh6EEfU7
	amuB35n35zeZVkrQF7gzyEgBSzO+AlGpWJ0jxIKKC2EZd8i7skFgZc+V+RyZ3iMXqyDhscgQh/2WN
	Iwt3RgRzklrSWsbHcLcVQIRTMmqnqZwUdELZZ79SDhWkKC/YLqQBZnhrmiD9zcBAWwuri5g+hnWp8
	cJC4X5fcy7l5rNyBZK1ov4WSq1FdPeTgePZG87GOTnLk4t5xMR6FKRwiAJgObLmitXWM6iJreUzH0
	OzNn61jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qP5Ev-000115-34;
	Thu, 27 Jul 2023 17:57:29 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qP5Eo-0000ok-2U
	for linux-mediatek@bombadil.infradead.org;
	Thu, 27 Jul 2023 17:57:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=wT/ZsiiDZwcgiQgl4DELrnCzGmHF+3XYDdWiMBrFYvo=; b=mT2fjG4TfqhIJytD1FelyuNwtW
	2cb8UmS//AWq4hk3TN330ah3glMQsUvulO1Cwg+VHK6jCVCNBOQ5uICFc93KbDOneuDblvJwY6Y0E
	+j668uXfBNFRjiftx0Lkch3aAQGPkXKk6cZ6oVThkXekXQ3Lur2mK42cqyFrBQ4YSCnJbbB2pY3ko
	20mgl742fSmdETmIzy3o0lSwfkbtWehrcF+xh75SwEIKWUIk7lLcR/6lEw1hXSCsKQpx2CJDZP03A
	CFmHNG4Tcl/2BPDnypH4FHU3bX6SHzcJqAitl1Tc3GlG8b14r4oCgpIZ8nT/x6JSndPTZezCJ8X6n
	tgf6+oSA==;
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qP4Nk-007Baf-1T
	for linux-mediatek@lists.infradead.org;
	Thu, 27 Jul 2023 17:02:34 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-1bba2318546so9676165ad.1
        for <linux-mediatek@lists.infradead.org>; Thu, 27 Jul 2023 10:02:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1690477349; x=1691082149;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wT/ZsiiDZwcgiQgl4DELrnCzGmHF+3XYDdWiMBrFYvo=;
        b=K0phnEYk/GVAqF5YbTQkVwMdPv8mpH4CuAkx7IsfmRJ5aLTp4xG8IBBDRxwU3rp18M
         H3sZi0bD5d69IgZnJX0pGk+67CRDZxTrseYrgwlMhuP5Q9J4PWS82sWweo8TAt9iHOuR
         rX1q8/lxZ76BFQzEOl67eODr84NVHK31gql9s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690477349; x=1691082149;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wT/ZsiiDZwcgiQgl4DELrnCzGmHF+3XYDdWiMBrFYvo=;
        b=aZYDf1JqKT6k4tXqQLubgLkgC8uIfTqFkw+YeYRgI2gv47J5VTXmw7sJ1AJeRM1ABP
         kdP2F1fK5Tlzd7tR0DXj/WiDIqICUzvOWXnaGschzunZxmoBPkhyT2NGizqWOIxSPcIg
         mX2hAQYvfkQZWAsfUwt4no+8EEtj+WMAk03PX2841L8lHpZ3MjJH/pg4vmXaBX0k5V0D
         cmtZvhq+rJMViuZtvFawzyodpPsERJfoQmZ2yXgWFbpjO6YHcdnT8kiANoKRkN877vKC
         aYhVQGwm3zPUL47RqYNI/5WuUUWIBDVhtU3bKQryvbTBIUjQ+7b8MuiG+Hk90MxE/tLd
         7SDA==
X-Gm-Message-State: ABy/qLbBZ4Xrrq3+PT2lHowlavOqwrqkEBT+ZAqUvhGnn4+gNp6ub2GD
	KjMhJzK7WXpuW2grR1sABfsMFA==
X-Google-Smtp-Source: APBJJlEJpUVqcSMnFLWNvhMQvBdF6RrGYz2iohHdmUVWppDCrgiBB6p74K9WRtxaVJoGd8oU9n28vw==
X-Received: by 2002:a17:902:dac4:b0:1bb:cd10:8209 with SMTP id q4-20020a170902dac400b001bbcd108209mr5653824plx.50.1690477348974;
        Thu, 27 Jul 2023 10:02:28 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id e2-20020a170902d38200b001ac7f583f72sm1879688pld.209.2023.07.27.10.02.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jul 2023 10:02:28 -0700 (PDT)
Date: Thu, 27 Jul 2023 10:02:28 -0700
From: Kees Cook <keescook@chromium.org>
To: Azeem Shaikh <azeemshaikh38@gmail.com>
Cc: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>, linux-hardening@vger.kernel.org,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>, linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org, Kalle Valo <kvalo@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] wifi: mt76: Replace strlcpy with strscpy
Message-ID: <202307271001.13EA5FB@keescook>
References: <20230703181256.3712079-1-azeemshaikh38@gmail.com>
 <202307121653.4A9C69C655@keescook>
 <CADmuW3UY=w0p-h1h4qOord7z1nFnvpyCOU3fcCaATm_PvFFUeA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CADmuW3UY=w0p-h1h4qOord7z1nFnvpyCOU3fcCaATm_PvFFUeA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230727_180232_669423_084D1870 
X-CRM114-Status: GOOD (  19.00  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Jul 18, 2023 at 12:38:37AM -0400, Azeem Shaikh wrote:
> On Wed, Jul 12, 2023 at 7:54 PM Kees Cook <keescook@chromium.org> wrote:
> >
> > On Mon, Jul 03, 2023 at 06:12:56PM +0000, Azeem Shaikh wrote:
> > > strlcpy() reads the entire source buffer first.
> > > This read may exceed the destination size limit.
> > > This is both inefficient and can lead to linear read
> > > overflows if a source string is not NUL-terminated [1].
> > > In an effort to remove strlcpy() completely [2], replace
> > > strlcpy() here with strscpy().
> > >
> > > Direct replacement is safe here since DEV_ASSIGN is only used by
> > > TRACE macros and the return values are ignored.
> > >
> > > [1] https://www.kernel.org/doc/html/latest/process/deprecated.html#strlcpy
> > > [2] https://github.com/KSPP/linux/issues/89
> > >
> > > Signed-off-by: Azeem Shaikh <azeemshaikh38@gmail.com>
> >
> > Looks good -- thing is using return values from the macros.
> 
> Just to confirm, you mean *not* using return values from the macros?

I thought I'd replied to this, but I see it didn't happen: yes, I meant
"not using return values". Sorry for the confusion!

-- 
Kees Cook

