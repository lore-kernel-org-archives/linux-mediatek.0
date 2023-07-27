Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2844C04A94
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Jul 2023 18:02:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NrdhbFq2TllUS3d1FOZRRA3ctMM7rEJWO6QWxhxN4X0=; b=lxJzkORkXNc/5xck9mZUTPR0np
	nvc6fiQK0JmPIMA18QWz3X5Fyk+ieustrrG8spAgrIRkp0lMUspv7sH0LO86bdZV5Qa3U8NU0Gevq
	Zf+an8j41bGWLdTbHEL4EVMGpMUSvEH/VGeOBMkpSNMPLUYg0vUJMwB9UY1q0j/Dc3yNqx1YgFyOZ
	HE5QbXASI5cE5OXzplMq0NnWTZ8c0/ByCE3ghcHx7M3HY/ehWTsd1pH/iHNa30Zp6qGdxnph1zbXY
	q8P0ccYHhPdQNGTFz8NbJ85iiDTtq8vNeEduqBnzkR1QRZBF+ghcwcYDT+BKrl1IG6PrCCDqrPWzE
	UO3Os6/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qP5JR-0005VR-1B;
	Thu, 27 Jul 2023 18:02:09 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qP4Mv-00H1ry-2C
	for linux-mediatek@lists.infradead.org;
	Thu, 27 Jul 2023 17:01:43 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-686c06b806cso929006b3a.2
        for <linux-mediatek@lists.infradead.org>; Thu, 27 Jul 2023 10:01:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1690477299; x=1691082099;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NrdhbFq2TllUS3d1FOZRRA3ctMM7rEJWO6QWxhxN4X0=;
        b=gwKxjNrjlnXnzgiB40rgMiBl0/QtgC8VUcyszpZozy4dcwVgAWS2E8bfdp7c2YpL2f
         5K1p3ziPEsFBp9RabGxDWzD4SQH6S3e8EASPNAMSMVBUt0T7osetBpBmUJH8w16wFkCj
         LSWPtmArmmchxRrkcE2YLqO7umBc5u/VxmrX4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690477299; x=1691082099;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NrdhbFq2TllUS3d1FOZRRA3ctMM7rEJWO6QWxhxN4X0=;
        b=gHkPk1lIgpd/vf3m4QuyzTL2/U2UPi6iWPSAv/dx/ZMlSBiiuZTSuyHDqbkaPJX3fm
         hGaScHtzt9DRW37NM97T2I+032VD29JedyttHP88ZFkFBE7NGypS384J9xJ5L2wfzPst
         tR8AGlFWNRa5h5tbrAgTgtkoHekfYWyrjFKaTwGDlwHqlyOypRLh0d4w2dYkulHV/8dT
         Hl6/i8WCoaj3Cpv8UEZqsUnyr5tUhPrTdO19aI6/05DDiqt5a6J8rWdz6wORN0VrzKgf
         VoIXwXrcn1kh88v+veFTnGPby013j+Py6FW52F29JsP1KK30inpVpk8JFIOsUNJGVzF/
         AhEQ==
X-Gm-Message-State: ABy/qLaAFNWW3ogVXbJj0jqE23/WPhYwQKUrOrdqw86WKZN4oHD+5PaG
	BYRxSbQpdSs+H8r5cFrWZ2qcmg==
X-Google-Smtp-Source: APBJJlFApVlNeR4dyVr69s6M57WJ+jQYcGl2/Dm1rae4njEHS0rUSMH2qUw00/brVLWB60QevPBe0A==
X-Received: by 2002:aa7:8894:0:b0:66c:2d4e:4772 with SMTP id z20-20020aa78894000000b0066c2d4e4772mr6049993pfe.13.1690477298723;
        Thu, 27 Jul 2023 10:01:38 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id z17-20020aa785d1000000b006829b27f252sm1766012pfn.93.2023.07.27.10.01.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jul 2023 10:01:37 -0700 (PDT)
Date: Thu, 27 Jul 2023 10:01:37 -0700
From: Kees Cook <keescook@chromium.org>
To: Kalle Valo <kvalo@kernel.org>
Cc: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Azeem Shaikh <azeemshaikh38@gmail.com>,
	linux-hardening@vger.kernel.org,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>, linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] wifi: mt76: Replace strlcpy with strscpy
Message-ID: <202307270959.900E3A345E@keescook>
References: <20230703181256.3712079-1-azeemshaikh38@gmail.com>
 <169047317159.2400214.7882697833368890001.b4-ty@chromium.org>
 <87tttpz6ne.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87tttpz6ne.fsf@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230727_100141_829678_EEB12E26 
X-CRM114-Status: GOOD (  14.01  )
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

On Thu, Jul 27, 2023 at 07:00:21PM +0300, Kalle Valo wrote:
> Kees Cook <keescook@chromium.org> writes:
> 
> > On Mon, 03 Jul 2023 18:12:56 +0000, Azeem Shaikh wrote:
> >> strlcpy() reads the entire source buffer first.
> >> This read may exceed the destination size limit.
> >> This is both inefficient and can lead to linear read
> >> overflows if a source string is not NUL-terminated [1].
> >> In an effort to remove strlcpy() completely [2], replace
> >> strlcpy() here with strscpy().
> >> 
> >> [...]
> >
> > Applied, thanks!
> >
> > [1/1] wifi: mt76: Replace strlcpy with strscpy
> >       https://git.kernel.org/kees/c/535c78cbc0c4
> 
> Why did you take this? mt76 is in active development so risk of
> conflicts is high.

There didn't seem to be any further activity for 3 weeks, and it was a
relatively mechanical change. I can drop it from my tree. What's needed
for it to be picked up through wireless?

-Kees

-- 
Kees Cook

