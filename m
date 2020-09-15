Return-Path: <SRS0=MDtk=CY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFB82C43461
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Sep 2020 17:48:48 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 35B6920936
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Sep 2020 17:48:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="h/m1whTs";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="mFt7JwE/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 35B6920936
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:From:To:Subject:MIME-Version:References:
	In-Reply-To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=JXrdtCyZd1iYhB8xxF1r2q5CrQDCnhfuTl5QwpZvsRg=; b=h/m1whTsrjyEgaG3CbqGJNGT6
	jfr/LpaPs678CIwh6fnuPZqpEW3Vu+edl8jrawf/koJmbkJ7//xOCPjtPNYoEdARa1OobCzuKIGkO
	G3x5ptrzZNh9u4OIExcdW3b1uuMW8NznkwY9c9+U2ZMgWqap/ET6iDSNo1RhPGQJXanVXPhzBLLp5
	a5qSCh6+uVBoprTmJS3qmIYeoNGctjvPGWGirmcslkDPdvj8OWK6L4NcIMe3udbGIzeAUoIJ+sFpK
	e3AuXzSrq21R+GUYmLhJCyTxyvfWRuTy+2oSbgnfO0ZRsWLy6IwRgqXBiOR+sEp8/Xqg1xugEf4Ot
	Y1fo+jQQQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kIF4H-0005ye-IR; Tue, 15 Sep 2020 17:48:37 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kIF4G-0005xs-5W; Tue, 15 Sep 2020 17:48:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Message-ID:From:CC:To:Subject:
 Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
 Date:Sender:Reply-To:Content-ID:Content-Description;
 bh=/Rg6cY/e/tZ4JpFULugLMdJVoy+DCc5wy/pCoVMw9yA=; b=mFt7JwE/fwN9x1ow+LoVe2Q0KA
 iAV2NGaXBd/2KCBLsZwnRrJ4CDY+pI067LFcEQvFJGNVUk+tbr8kmXU47resJdRqmBdUUyPwXBFXR
 DUsxcHUpAd5+UbTrcKRqnJs52YSeYdB+YBi0j8bWVuj95SbsCSUeZr1B6S/AfX7cxIJbXbtX8KFeI
 9aRpEPnZbfL0J0hgf8LhxGmgOwtxfPFkRiB8Y7OaY3NI4MsdBmA3NliRQAuIDoUbILcP6mOcdJg3V
 TXSC1Z2oo9L3q6hU1cuf9Jrg0sdegEn48EdKayH3s52r+xQP7THGDbdeSQaHZ4rGImv66nLxrrxKR
 +uxCPERQ==;
Received: from [2001:8b0:10b:1:8038:2d21:920d:9fa6]
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kIF4C-0002OC-Py; Tue, 15 Sep 2020 17:48:33 +0000
Date: Tue, 15 Sep 2020 18:48:31 +0100
User-Agent: K-9 Mail for Android
In-Reply-To: <20200915150855.24825-1-phil.chang@mediatek.com>
References: <20200915150855.24825-1-phil.chang@mediatek.com>
MIME-Version: 1.0
Subject: Re: [PATCH] [PATCH] ARM64: Setup DMA32 zone size by bootargs
To: linux-mediatek@lists.infradead.org, Phil Chang <phil.chang@mediatek.com>,
 linux-arm-kernel@lists.infradead.org
From: David Woodhouse <dwmw2@infradead.org>
Message-ID: <7AD19C4D-CB80-48C5-8B12-62D52BFDBE63@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, Jonathan Corbet <corbet@lwn.net>,
 Alix Wu <alix.wu@mediatek.com>, Anshuman Khandual <anshuman.khandual@arm.com>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, YJ Chiang <yj.chiang@mediatek.com>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Will Deacon <will@kernel.org>, Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 15 September 2020 16:08:55 BST, Phil Chang <phil.chang@mediatek.com> wrote:
>Allowing the DMA32 zone be configurable in ARM64 but at most 4Gb.

I don't think 4,000,000 bits is a particularly sensible limit.

Perhaps you meant bytes, and perhaps you meant 4*1024*1024? That would be "4 GiB".

-- 
Sent from my Android device with K-9 Mail. Please excuse my brevity.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
