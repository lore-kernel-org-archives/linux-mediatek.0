Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B44DFC0015E
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Jul 2023 13:55:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pv4E2/kDpVfa/Dtz4RIrx4SYaXDBMv1Xx1z917P6AGI=; b=TqOWCUhWiY0ZbcmR37Ot9pfdFf
	ee5CdPHzUtMTPii75kNPYc3oqkHZVj1xWnwxfbdDmBBBlVV8lNVpkY0sDIVAQGZ9m5aGzz9akxtrJ
	4ldJy6vZnZIEewqGVBMdtun7gwTp2pxS5cHojC+4/tSMKymtYwEuDAE5BIBNEJjeO7UFqNi2EFQzU
	Dob2eQZmbfnMazSa6ZoJs+l4Td9KaJyd82oa5VhMI0dJVX6M5UvQQJzy/Wtq1hP58RBoqn7pc4+YP
	M/YhAqXpJ8u8ATxlAS46R7q4VXO62j6yIlXzRTHbglXFUnxGfbGNvxiYYnO3wTbfsrBHXTzVUBlBH
	In0YXPSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOezd-00AbSN-2P;
	Wed, 26 Jul 2023 13:55:57 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOezc-00AbRn-12
	for linux-mediatek@bombadil.infradead.org;
	Wed, 26 Jul 2023 13:55:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Pv4E2/kDpVfa/Dtz4RIrx4SYaXDBMv1Xx1z917P6AGI=; b=VdJQoIqDFuFSY8lD8ETSqXAhAh
	SaAY+FLlG28/ACFsa4krSMsJ3oLHwdJGyEQKmjcN2g2leZart826WHa+FVJNXJ5Cm+HEs85QXb8FD
	Xd/f5VbdussrtabdAP9TmtFEqCHLzLBDAMRWvaXbS86w6R1MpjaQqPEC9I9TdA0akxTDOe0IZKw6i
	gV2+J7cFsH8vpwNWApVbhVTt0uN8SyAan8FftSZ6sonTvCr/juuPpawjfH1iK9WET1qL+0Nq/QjDR
	83EsQcZxgwkK+wjgOIAz510tF2x88Ujg8gBe4oX7CEJ1mMB54zOPA/+I2bhMT/YFFZRzDPf9QGI67
	WPWSjIaw==;
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOckS-005pc9-2M
	for linux-mediatek@lists.infradead.org;
	Wed, 26 Jul 2023 11:32:10 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-1bb81809ca8so34376595ad.3
        for <linux-mediatek@lists.infradead.org>; Wed, 26 Jul 2023 04:31:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1690371113; x=1690975913;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Pv4E2/kDpVfa/Dtz4RIrx4SYaXDBMv1Xx1z917P6AGI=;
        b=l0T/8cA7WKqxO3XFgE9ZfKHIIgxeet6bqJaEbDCqCpPOhySJ+dWssA6/afqm4C3FaR
         BR/Swp7B2kTCsvcYs2Oap1e+4HLd1dRmTS77blnj+HrL9avMOXUxz4gPSKuPLn5X/bfV
         sQWxK2YW/GaopekmCSB+3S7uSk4HI1OVOvaWI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690371113; x=1690975913;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Pv4E2/kDpVfa/Dtz4RIrx4SYaXDBMv1Xx1z917P6AGI=;
        b=C4KU4I2+jQQwZoMdMG1cBVSLxIgwn+DHstrpm+Qu9prOFTbvsWBqw3wrzE4eGTaP0t
         NIdLjlhOMlmlZeivkXrNbBoe5MDy95ATk6D/U98XCu9owC+R3J1rKOSBHL9RD8GKT9+s
         u1hYaajOgcI+dMvW69JtvGg/gOXuotG3ZsWDLpfAVB9acgX6Fyyr4sECcs28AB4DMuHl
         78Gj54/ksyfvFujHOLyYLgslwZaYKYtUHMX6wDWU2wo7xIF+sZkd2oFwpS0orPZHGw3i
         SpVQL8RWqdS7n0ymDDDzLslz9c6g+xs6pd/vwaBmP9++fxlcI2vON8yNRNITvx9jwpgZ
         UK4w==
X-Gm-Message-State: ABy/qLarzgoZlv8+qoDCuOG7FPQPmH3P5ZQIKkMSImzMu/Cbh4Tnlqlu
	6EFxnX6T1kHLHMSl6kQDYtMYogyOsKK6tfOBsbA=
X-Google-Smtp-Source: APBJJlFCJJMP3H6D5za0xJAObSY0B6q4CxM92CBcDxsHlqd8NDdz090Z75NONySCDQqIjyGz7wBlWg==
X-Received: by 2002:a17:902:8f8d:b0:1b8:8af0:416f with SMTP id z13-20020a1709028f8d00b001b88af0416fmr1630769plo.1.1690371112691;
        Wed, 26 Jul 2023 04:31:52 -0700 (PDT)
Received: from google.com ([2401:fa00:8f:203:a2a4:d590:6375:66ba])
        by smtp.gmail.com with ESMTPSA id y3-20020a1709029b8300b001b895336435sm12863278plp.21.2023.07.26.04.31.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jul 2023 04:31:52 -0700 (PDT)
Date: Wed, 26 Jul 2023 20:31:47 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Andrew Yang =?utf-8?B?KOaliuaZuuW8tyk=?= <Andrew.Yang@mediatek.com>
Cc: "senozhatsky@chromium.org" <senozhatsky@chromium.org>,
	"bigeasy@linutronix.de" <bigeasy@linutronix.de>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux-mm@kvack.org" <linux-mm@kvack.org>,
	wsd_upstream <wsd_upstream@mediatek.com>,
	Casper Li =?utf-8?B?KOadjuS4reamrik=?= <casper.li@mediatek.com>,
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>,
	"minchan@kernel.org" <minchan@kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"angelogioacchino.delregno@collabora.com" <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH] zsmalloc: Fix races between modifications of fullness
 and isolated
Message-ID: <20230726113147.GK955071@google.com>
References: <20230721063705.11455-1-andrew.yang@mediatek.com>
 <20230726031846.GJ955071@google.com>
 <42f1209a686404ffd0f9dff05ed10a8d23383a11.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <42f1209a686404ffd0f9dff05ed10a8d23383a11.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230726_123208_861057_910416DD 
X-CRM114-Status: GOOD (  22.75  )
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

On (23/07/26 06:59), Andrew Yang (楊智強) wrote:
> On Wed, 2023-07-26 at 12:18 +0900, Sergey Senozhatsky wrote:
> >
> > External email : Please do not click links or open attachments until
> > you have verified the sender or the content.
> >  On (23/07/21 14:37), Andrew Yang wrote:
> > >
> > > Since fullness and isolated share the same unsigned int,
> > > modifications of them should be protected by the same lock.
> > >
> > > Signed-off-by: Andrew Yang <andrew.yang@mediatek.com>
> > > Fixes: c4549b871102 ("zsmalloc: remove zspage isolation for
> > migration")
> >
> > Have you observed issues in real life? That commit is more than a
> > year
> > and a half old, so I wonder.
> >
> Yes, we encountered many kernel exceptions of
> VM_BUG_ON(zspage->isolated == 0) in dec_zspage_isolation() and
> BUG_ON(!pages[1]) in zs_unmap_object() lately.

Got it.

> This issue only occurs when migration and reclamation occur at the
> same time. With our memory stress test, we can reproduce this issue
> several times a day. We have no idea why no one else encountered
> this issue. BTW, we switched to the new kernel version with this
> defect a few months ago.

Yeah, pretty curious myself.

> > > @@ -1858,8 +1860,8 @@ static int zs_page_migrate(struct page
> > *newpage, struct page *page,
> > >   * Since we complete the data copy and set up new zspage
> > structure,
> > >   * it's okay to release the pool's lock.
> > >   */
> >
> > This comment should be moved too, because this is not where we unlock
> > the
> > pool anymore.
> >
> Okay, I will submit a new patch later.

Thank you!

