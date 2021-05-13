Return-Path: <SRS0=rIjB=KI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA28AC433ED
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 May 2021 01:17:32 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1A1BF613E9
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 May 2021 01:17:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1A1BF613E9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=gd73ngcF5JUpQs1ki+AbcVbx9KnVnG5pmdXs16Ow+aU=; b=pSRlAX1sfAipT8BEbddQcRg4Y
	zqwAWzIr1ue7veGS8dYz0hbbziqIKCdTFE2t+D2qZ7uHLDQtVSiMfAgBCuIZFk1Ee+dCRN8mu1jLq
	jnATbtsMj/JcONAZoCDOov8Zu5NXrhWF+fvS5hkOW59jmCKhT8ARhDy+7aNbiwmZ//n2C+sCHGcnU
	6ukx+gTPC6WLqYxvTmXgOkfDOI0tm3fC7iV7FMWmEYeNGla5OWQ6ETm7VPkG5heXVAFkYRlHW/YjQ
	+vC9Pn59jv7Q+Gq0bQBtb7Wc0q3AgEaRDqs2Cj3I2N5/zFAnrCEVZi1Zzp1u3lyDSJt12hBDRV8i/
	asFznXEHQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lgzyK-004MfC-Si; Thu, 13 May 2021 01:17:05 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgzyJ-004Mf3-6m
 for linux-mediatek@desiato.infradead.org; Thu, 13 May 2021 01:17:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=8rIOlce/5RXrT16ramfLpoZjAAz9w2C7JWd/JQK5isA=; b=sULy7yOImGXthy9rhx8TPohMFQ
 ch6Nnt/D2WZMm+8oiDrswFDGvWdRWIC/7uSvJlloNP46A5Pl7JlJOnxSWecitvNfXn6OxWd02+17/
 FHDxXiH79c2c323NEEEZNDq6DvKY7ZiEiwfunyoz9UT/6Emu6eZXTPzCMcgvvUG7XgtiyiEP8NbN/
 0rAu2EWPwcsOoz7Hxn99lPxgHNuex5uJCDWX/z7btc1IGoxqS9BvuAhkOjVbw0NenbUG20gTVNNKO
 sjEzXutbmPrxg3Z10/qPuz5inXa/6Xr5mMwGLeMWirgjio41kG79Fnu56agv7fqKsBJGlefRNj/3z
 ImqYqOjA==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgzyF-00AxBw-TW
 for linux-mediatek@lists.infradead.org; Thu, 13 May 2021 01:17:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620868617;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8rIOlce/5RXrT16ramfLpoZjAAz9w2C7JWd/JQK5isA=;
 b=Sz87xDnH113sWSHdeLObUgq6frhPNvVcr/FYNy+VTQimg0j87ykJSENRXaTQIkhiwzoPHF
 VvLZsdw5G3uj0yn05owGhPPU22sJRk/XbJ8bo9mFw4dl24w0jd/2rbrj1V8xircJpLlei8
 RYDXJFLj1ZyNi6Lwqjiju0CN1zbn5CU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-466-mgF-RyesNwGIJLXXb7cNcw-1; Wed, 12 May 2021 21:16:53 -0400
X-MC-Unique: mgF-RyesNwGIJLXXb7cNcw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 14FC9801B12;
 Thu, 13 May 2021 01:16:52 +0000 (UTC)
Received: from localhost (ovpn-12-82.pek2.redhat.com [10.72.12.82])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 15A0B63BA7;
 Thu, 13 May 2021 01:16:50 +0000 (UTC)
Date: Thu, 13 May 2021 09:16:48 +0800
From: Baoquan He <bhe@redhat.com>
To: Mike Rapoport <rppt@kernel.org>, Miles Chen <miles.chen@mediatek.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 wsd_upstream@mediatek.com, k-hagio-ab@nec.com
Subject: Re: [PATCH] mm/sparse: fix check_usemap_section_nr warnings
Message-ID: <20210513011648.GA6776@MiWiFi-R3L-srv>
References: <20210511093114.15123-1-miles.chen@mediatek.com>
 <YJpbWVrgJFLRpzl3@kernel.org> <1620797600.14730.7.camel@mtkswgap22>
 <YJuh90iYeZ8F4Ain@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YJuh90iYeZ8F4Ain@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210512_181700_056085_D33E3A3F 
X-CRM114-Status: GOOD (  28.03  )
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

On 05/12/21 at 12:37pm, Mike Rapoport wrote:
> On Wed, May 12, 2021 at 01:33:20PM +0800, Miles Chen wrote:
> > On Tue, 2021-05-11 at 13:24 +0300, Mike Rapoport wrote:
> > > On Tue, May 11, 2021 at 05:31:14PM +0800, Miles Chen wrote:
> > > > In current implementation of node_data, if CONFIG_NEED_MULTIPLE_NODES=y,
> > > > node_data is allocated by kzmalloc. If CONFIG_NEED_MULTIPLE_NODES=n,
> > > > we use a global variable named "contig_page_data".
> > > > 
> > > > If CONFIG_DEBUG_VIRTUAL is not enabled. __pa() can handle both kzalloc and
> > > > symbol cases. But if CONFIG_DEBUG_VIRTUAL is set, we will have the
> > > > "virt_to_phys used for non-linear address" warning when booting.
> > > 
> > > Maybe we'll just allocate pgdat for CONFIG_NEED_MULTIPLE_NODES=n (which is
> > > essentially !NUMA) case in, say, free_area_init()?
> > 
> > 
> > thanks for your comment.
> > 
> > I check the source tree and found that contig_page_data is used by
> > crash_core.c as a symbol. I am not familiar with crash_core but I guess
> > allocate pgdat may break this crash_core users.
> > 
> > For example: some userspace scripts want to read the address of
> > contig_page_data symbol from a corefile.
> > 
> > kernel/crash_core.c:460:        VMCOREINFO_SYMBOL(contig_page_data);
> > 
> > #ifndef CONFIG_NEED_MULTIPLE_NODES
> >         VMCOREINFO_SYMBOL(mem_map);
> >         VMCOREINFO_SYMBOL(contig_page_data);
> > #endif
> 
> My understanding is that VMCOREINFO_SYMBOL() should correspond to actual
> symbol. If there is no contig_page_data symbol, there is no need for
> VMCOREINFO_SYMBOL() either.

Yeah, it's exported for makedumpfile and crash utility to parse and get
the memory layout of the corrupted kernel. If removing it, makedumpfile
will get it from node_data[]. Looks like a good idea to unify code for
numa|!numa on pglist_data instances.

Add Kazu to CC since he maintain makedumpfile and Crash utilities.

My concern is that that only happens on arm/arm64/riscv, does it mean the
warning is not necessary, so can be removed? Or we need to check if
CONFIG_DEBUG_VIRTUAL doesn't work well in this case.

Thanks
Baoquan


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
