Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB6C9EE0211
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Sep 2023 23:17:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e1a1XS5FwL95wVQ3U0hOYK16YJk3gJb5vChvM9EJIak=; b=2sA4CfXzCyfPBsu0URtu+eZ33N
	Uig5EY/eq0y6QYDa6WOlEx60XZtcvIZZ/l1lE1HY1g94TdIgAI3f/W1bei8lDldcpYeo8E6nU98GB
	VH8BYQ3humFUlAQ5vFLKEms5ncNPSHI3adZGCUSZkhdVzp95bDSCuDdU2qyHibQZ/djJYXV0jSIRI
	kXUTOXn224pdc16nGrTqH0ggulKJZGN/tj95M2jUp/VilRX5z29FeBI/nfqDPM6MhrKR9BA7vPGtu
	IcQFyt3bC6H4wio2IbxY+PgF/zgnz/1W29gB0stgwavXCd62qLbRf/1t2Hge0uDG9exiKnGk8ZejK
	ohismyaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgZ71-006sEl-1k;
	Wed, 13 Sep 2023 23:17:35 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgZ6y-006sDc-1z
	for linux-mediatek@lists.infradead.org;
	Wed, 13 Sep 2023 23:17:33 +0000
Received: by mail-pg1-x531.google.com with SMTP id 41be03b00d2f7-573ccec985dso249852a12.2
        for <linux-mediatek@lists.infradead.org>; Wed, 13 Sep 2023 16:17:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1694647050; x=1695251850; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=e1a1XS5FwL95wVQ3U0hOYK16YJk3gJb5vChvM9EJIak=;
        b=J7GkE5qfMGAhVSb6F6Bq8Mzs1fJ818vLFFgsLs2cekeRNJpI7cPTTGn2peDIjvQw71
         /04hzRf83Cg3IiL8XTLj+FsEbUys1YILeDw0EP8AqStugA/lhQ8dmMIj726fTQfVBFWq
         OeED/OK7qkios7babH+aKjOl60dW36ZOv0I1I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694647050; x=1695251850;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e1a1XS5FwL95wVQ3U0hOYK16YJk3gJb5vChvM9EJIak=;
        b=mWRcO3jVwiiRtf5TaPz2QS78XGYo6J6eH7Wj4nMp0F0S7tvG8RFNMLf9FZXPUCYmZf
         fbx9ZRv0WfIMFhWJs5TCoHlIY1XIuAyT6J7oi+kjNTz2uziW28aC670pl/dw4slulTQr
         nd0WIegzFG/9iwdvpnPKdY6JnbksUY/z5jB/dCH6wIkW8Ddsh5zqnEtjeKygElhVEc7N
         aNA9pAffnzEM9aDvicTPMXZvFuTNF76VV8EbexSONTf3nIzf14/eYrMP1Z53zJk286ru
         5S5Pl1UN36ljLLFQh6ijJ/c7ZKvrmPqbQK15Dm3n0id+zUeuIsBY2wpzLMtZmbcROaGj
         YyGQ==
X-Gm-Message-State: AOJu0Yy3nXPqrXP2RATd5YL6Xpe+/ZZidA30WjPs0eHi86xfd6VmplCw
	iVdBQAkMTvBfVukTK9a1J9qIIg==
X-Google-Smtp-Source: AGHT+IGClTtKAGRhwBX0rTWyQayaNUFl7oUgqH9imWkdIjnn/sGMkGEiuN74YRWSvEaa6g5mBChF6w==
X-Received: by 2002:a17:90a:a008:b0:26b:24ed:e0d9 with SMTP id q8-20020a17090aa00800b0026b24ede0d9mr3570072pjp.33.1694647050628;
        Wed, 13 Sep 2023 16:17:30 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id e15-20020a17090a684f00b0026b4d215627sm128652pjm.21.2023.09.13.16.17.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Sep 2023 16:17:30 -0700 (PDT)
Date: Wed, 13 Sep 2023 16:17:29 -0700
From: Kees Cook <keescook@chromium.org>
To: Will Deacon <will@kernel.org>
Cc: Mukesh Ojha <quic_mojha@quicinc.com>, corbet@lwn.net, agross@kernel.org,
	andersson@kernel.org, konrad.dybcio@linaro.org, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	tony.luck@intel.com, gpiccoli@igalia.com,
	mathieu.poirier@linaro.org, catalin.marinas@arm.com,
	linus.walleij@linaro.org, andy.shevchenko@gmail.com,
	vigneshr@ti.com, nm@ti.com, matthias.bgg@gmail.com,
	kgene@kernel.org, alim.akhtar@samsung.com, bmasney@redhat.com,
	quic_tsoni@quicinc.com, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-hardening@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, kernel@quicinc.com
Subject: Re: [REBASE PATCH v5 08/17] arm64: mm: Add dynamic ramoops region
 support through command line
Message-ID: <202309131613.C0E12D0D14@keescook>
References: <1694429639-21484-1-git-send-email-quic_mojha@quicinc.com>
 <1694429639-21484-9-git-send-email-quic_mojha@quicinc.com>
 <20230912101820.GA10884@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230912101820.GA10884@willie-the-truck>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230913_161732_652898_ADAF1DFE 
X-CRM114-Status: GOOD (  22.16  )
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

On Tue, Sep 12, 2023 at 11:18:20AM +0100, Will Deacon wrote:
> On Mon, Sep 11, 2023 at 04:23:50PM +0530, Mukesh Ojha wrote:
> > The reserved memory region for ramoops is assumed to be at a fixed
> > and known location when read from the devicetree. This may not be
> > required for something like Qualcomm's minidump which is interested
> > in knowing addresses of ramoops region but it does not put hard
> > requirement of address being fixed as most of it's SoC does not
> > support warm reset and does not use pstorefs at all instead it has
> > firmware way of collecting ramoops region if it gets to know the
> > address and register it with apss minidump table which is sitting
> > in shared memory region in DDR and firmware will have access to
> > these table during reset and collects it on crash of SoC.
> > 
> > So, add the support of reserving ramoops region to be dynamically
> > allocated early during boot if it is request through command line
> > via 'dyn_ramoops_size=' and fill up reserved resource structure and
> > export the structure, so that it can be read by ramoops driver.
> > 
> > Signed-off-by: Mukesh Ojha <quic_mojha@quicinc.com>
> > ---
> >  arch/arm64/mm/init.c       | 94 ++++++++++++++++++++++++++++++++++++++++++++++
> 
> Why does this need to be in the arch code? There's absolutely nothing
> arm64-specific here.

I would agree: this needs to be in ramoops itself, IMO. It should be a
ramoops module argument, too.

It being unhelpful for systems that don't have an external consumer is
certainly true, but I think it would still make more sense for this
change to live entirely within ramoops. Specifically: you're
implementing a pstore backend behavioral change. In the same way that
patch 10 is putting the "output" side of this into pstore/, I'd expect
the "input" side also in pstore/

More comments there, though.

-- 
Kees Cook

