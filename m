Return-Path: <SRS0=9f7n=PJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 034C0C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Oct 2021 08:56:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C291660EFE
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Oct 2021 08:56:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C291660EFE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9oNB7f0ss7LWjh+jbyypRwAC78zakPFQZi4Wzb5mv0I=; b=PcxYwpFLZi73Su
	0+vhJ/8F8EVcSVTevZQExxiYWXH6a0YjN+KW3sAbSCLJJ+fQlV4AkNVSTC2MNWvmjVt7wK+5dN71E
	Xet/TnKhGxF5xBYVIaP6o/fCbFZK5/acnSQP9fQekalX7hbkWeA+FV5eaksLBXj5FVWtMxQ7Z0JEZ
	UbvfErc1nh5ktthfRRgjGCXButMtchfRzZ2le2QV5YHUlBSCAcRJ4QZbjY+zbEXOZfewx+4pUuOTT
	nRqRyo+D53TjwW1d2/KkdtOkQcHUHiB5aTuQAUUi6Ph71RDRdLS0BsfLk5klrWDGMHBuup+9zfPzw
	yUfV5606BhX8D5puqrvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdTrp-006wVa-09; Thu, 21 Oct 2021 08:56:05 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdTrV-006wQ2-81; Thu, 21 Oct 2021 08:55:46 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2D8A160EFE;
 Thu, 21 Oct 2021 08:55:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634806544;
 bh=sGHVGWnjzjFvR3hjiYX7d2YdANy/k/ZCokiW+Te13L4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GhU+jNx6bYr0Blfq7/IqvJUC+7Je8ExsYbsmu220w/ahCCsqt0Jumv1XHGnvren4r
 uVigVFJxzRqa5xsAs3IZIDG++5G8cKEdgJn9oU6Pq6UgEifUZaUbqJ7AFCELD4iKCU
 upPhoO7C97kIsyjkI19hDMgBl8bKW+nHpI5vHIpgH3CkFClK7nHfEc4sgtiVFezWJY
 uZuLPEy6sRyYPu55zbwYXHVaOL7+Vcaq3vlCealgf4MdYsDNT/Xeu0cjtS511qXMIB
 /cYeuBtb/d6qXVUeSyx4OjzlM79NpTTUhlolFp1n0Hrt4B7Phmo5hcpeQLcIHAFkx9
 fZAVq1qOirSWw==
Date: Thu, 21 Oct 2021 09:55:38 +0100
From: Will Deacon <will@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Marco Elver <elver@google.com>, Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com>,
 Andrey Ryabinin <ryabinin.a.a@gmail.com>,
 Alexander Potapenko <glider@google.com>,
 Andrey Konovalov <andreyknvl@gmail.com>,
 Dmitry Vyukov <dvyukov@google.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 chinwen.chang@mediatek.com, yee.lee@mediatek.com,
 nicholas.tang@mediatek.com, kasan-dev@googlegroups.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v3] kasan: add kasan mode messages when kasan init
Message-ID: <20211021085538.GB15622@willie-the-truck>
References: <20211020094850.4113-1-Kuan-Ying.Lee@mediatek.com>
 <CANpmjNMk-2pfBjD3ak9hto+xAFExuG+Pc-_vQRa6DSS=9-=WUg@mail.gmail.com>
 <20211020152909.2ea34f8f0c0d70d8b245b234@linux-foundation.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211020152909.2ea34f8f0c0d70d8b245b234@linux-foundation.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211021_015545_327478_46BFF5A7 
X-CRM114-Status: GOOD (  16.98  )
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

On Wed, Oct 20, 2021 at 03:29:09PM -0700, Andrew Morton wrote:
> On Wed, 20 Oct 2021 11:58:26 +0200 Marco Elver <elver@google.com> wrote:
> 
> > On Wed, 20 Oct 2021 at 11:48, Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com> wrote:
> > >
> > > There are multiple kasan modes. It makes sense that we add some messages
> > > to know which kasan mode is when booting up. see [1].
> > >
> > > Link: https://bugzilla.kernel.org/show_bug.cgi?id=212195 [1]
> > > Signed-off-by: Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com>
> > 
> > Reviewed-by: Marco Elver <elver@google.com>
> > 
> > Thank you.
> > 
> > Because this is rebased on the changes in the arm64 tree, and also
> > touches arch/arm64, it probably has to go through the arm64 tree.
> 
> That would be OK, as long as it doesn't also have dependencies on
> pending changes elsewhere in the -mm tree.
> 
> To solve both potential problems, I've queued it in -mm's
> post-linux-next section, so it gets sent to Linus after both -mm and
> arm have merged up.

Works for me -- I'll ignore this patch then.

Will

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
