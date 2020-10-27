Return-Path: <SRS0=3R1W=EC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4937C4363A
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Oct 2020 07:52:22 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 50D5020738
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Oct 2020 07:52:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lWyd/kix";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="GljPc8HZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 50D5020738
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=8hGzguTuABkoJNx04b3kauebaq67yagKZugm07VoB+M=; b=lWyd/kixIrFK6r+6Rw4x/wU6T
	03+8dG5fCSs0e13UPCkgjaUUO991uYkilBG3+8UXU3lwEhX7HdhInGhtF+ScWHiJEIoT8rDZ2Zggc
	LVfit9GnaZRUQ3MS9R7ZcIg3wHb5/iCsusLuchF7CTud9u9YDLMBX+mV5zxO9BjtNDrmF8ePGlZb4
	LaYcWBskDPU0Fg+v8oHD+WLT6h4cDYCJpG+GP03arfNteaZU8oZSpbsdI41JGGFSHiBwst4/Qgj38
	PxT7x3cVkB5LOCrXRwVT55U3fMD10vBB5eT6lcRu+MKA5+E22VE/ZgtFmVlLYr4sJwSAwFzRD24kF
	A4O8hH0+A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kXJm8-0005te-Ow; Tue, 27 Oct 2020 07:52:12 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kXJm2-0005rh-JJ; Tue, 27 Oct 2020 07:52:10 +0000
X-UUID: b979a5e69f474ca49f4407f41e799dda-20201026
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=PTtnXYd9arSTe9cH1RmMwHvzY9bdu3XbEoZA6CWYDas=; 
 b=GljPc8HZYSGiYwNrMjzunJqXyQZYZrngr1ycBHwG6sipq0S/UuKGIF5uTixyT6lUOL+4yfKrdUROLRQCSo7wvNHnj673vrqYs74ARLeDeaHFO9aTmoMRGM1uymwQZPhwUVGgJtZw5FZPffQOCJZw0I/G1hxihcFdRi/8EKwZhXE=;
X-UUID: b979a5e69f474ca49f4407f41e799dda-20201026
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <miles.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1491833230; Mon, 26 Oct 2020 23:52:00 -0800
Received: from MTKMBS01N1.mediatek.inc (172.21.101.68) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 27 Oct 2020 00:42:17 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 27 Oct 2020 15:41:56 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 27 Oct 2020 15:41:56 +0800
Message-ID: <1603784517.12492.2.camel@mtkswgap22>
Subject: Re: [PATCH v2 4/4] arm: replace vector mem type with read-only type
From: Miles Chen <miles.chen@mediatek.com>
To: Russell King - ARM Linux admin <linux@armlinux.org.uk>
Date: Tue, 27 Oct 2020 15:41:57 +0800
In-Reply-To: <20201023101257.GZ1551@shell.armlinux.org.uk>
References: <20201023091437.8225-1-miles.chen@mediatek.com>
 <20201023091437.8225-5-miles.chen@mediatek.com>
 <20201023101257.GZ1551@shell.armlinux.org.uk>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201027_035206_913114_66E68715 
X-CRM114-Status: GOOD (  21.41  )
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
Cc: wsd_upstream@mediatek.com, Catalin Marinas <catalin.marinas@arm.com>,
 linux-kernel@vger.kernel.org, Minchan Kim <minchan@kernel.org>,
 linux-mediatek@lists.infradead.org, Suren Baghdasaryan <surenb@google.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, 2020-10-23 at 11:12 +0100, Russell King - ARM Linux admin wrote:
> On Fri, Oct 23, 2020 at 05:14:37PM +0800, Miles Chen wrote:
> > Since kernel no longer writes to the vector, try to replace
> > the vector mem type with read-only type and remove L_PTE_MT_VECTORS.
> > 
> > from Catalin in [1]:
> > "
> > > I don't think this matters since the kernel no longer writes to the
> > > vectors page at run-time but it needs cleaning up a bit (and testing in
> > > case I missed something). IOW, do we still need a dedicated mapping type
> > > for the vectors or we can simply use the read-only user page attributes?
> > "
> 
> Catalin is incorrect. If CONFIG_KUSER_HELPERS is enabled, then the
> vectors page is definitely written to - it's a user interface, so
> it's not going to change:
> 
> #ifdef CONFIG_KUSER_HELPERS
>                         /*
>                          * User space must never try to access this
>                          * directly.  Expect your app to break
>                          * eventually if you do so.  The user helper
>                          * at 0xffff0fe0 must be used instead.  (see
>                          * entry-armv.S for details)
>                          */
>                         *((unsigned int *)0xffff0ff0) = val;
> #endif
> 

Thanks for the comment. 
We have to keep L_PTE_MT_VECTORS for KUSER_HELPERS.


Miles
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
