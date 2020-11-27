Return-Path: <SRS0=3jAl=FB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BC4DC63697
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Nov 2020 03:27:34 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D17B022228
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Nov 2020 03:27:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Ke79PTJ6";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="UFEq9wBd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D17B022228
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=FKoo2XVozQMgSEzr3wc/7SiTVfkrwbD9LmAxzMnttCM=; b=Ke79PTJ6zm7Bdi/zn4TTP8/jk
	EE9N3zpA/V7DLVZ2tACCwC7bT/InT/Mcv+C6mk/E8qKmmrPl7AAkf/q3zUuFBm/S0ZzgbO0UNUNP/
	awuLlsWapAIdIGco7yilIsDFsVb9QGfqredrQ3ur4aDO/9bHoi0fQ5jbhaL9ecFSgqqoiIS+4lpSE
	x5vQDL6zrsn9Je1eHwxVAvI45p9TNOKkRc7JU87x/ibuGsU5ITClgzeD8PXZG5nWlhORz1c7aPPfb
	zbEzzLq5tvIA5nrVYtgYuqcnCLWw+qdQOXkA2wGcGVdAm1oBU+awpGu18kbs/t+Nr/GUZ3YiOxJJ2
	pjnREXJFQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kiUPv-0001OU-KU; Fri, 27 Nov 2020 03:27:27 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kiUPm-0001JW-2Q
 for linux-mediatek@lists.infradead.org; Fri, 27 Nov 2020 03:27:23 +0000
X-UUID: 6104cd8b8dd84b8a80f4f084ca40597a-20201126
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=7mGvXBf1oDk/sMWGysxsG6Qx0eXvEJgGpJ68T2MY34w=; 
 b=UFEq9wBdUNIKj8Y/irFAvy44mpxdMh0TjJmSuCi6w2UhKAekaeV/9a5Io6qMJy5OUryUOOVV4k9qsAE3lqjVzSDEm7RStDmPP+HP92fqZo6OtyU3hjiF5epz1eAX/khmw52WTCJx/x5oLPPt/ScUph2AJb91RPEdL3FMH+qVH5U=;
X-UUID: 6104cd8b8dd84b8a80f4f084ca40597a-20201126
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <miles.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1699769657; Thu, 26 Nov 2020 19:26:44 -0800
Received: from MTKMBS01N1.mediatek.inc (172.21.101.68) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 26 Nov 2020 19:17:05 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 27 Nov 2020 11:16:50 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 27 Nov 2020 11:16:52 +0800
Message-ID: <1606447013.8845.5.camel@mtkswgap22>
Subject: Re: [RESEND PATCH v1] proc: use untagged_addr() for pagemap_read
 addresses
From: Miles Chen <miles.chen@mediatek.com>
To: Catalin Marinas <catalin.marinas@arm.com>
Date: Fri, 27 Nov 2020 11:16:53 +0800
In-Reply-To: <CAHkRjk7xGoU=KBeFE4gy=yxkLhvHqz2A1JyCBKF8dhjJNDD=zA@mail.gmail.com>
References: <20201123063835.18981-1-miles.chen@mediatek.com>
 <CAHkRjk7xGoU=KBeFE4gy=yxkLhvHqz2A1JyCBKF8dhjJNDD=zA@mail.gmail.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201126_222722_283513_4B5E756F 
X-CRM114-Status: GOOD (  27.45  )
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
Cc: wsd_upstream@mediatek.com, andreyknvl@google.com,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-mediatek@lists.infradead.org, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Alexey Dobriyan <adobriyan@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 2020-11-26 at 11:10 +0000, Catalin Marinas wrote:
> Hi Miles,
> 
> Could you please cc me and Andrey Konovalov on future versions of this
> patch (if any)?
> 
> On Mon, 23 Nov 2020 at 08:47, Miles Chen <miles.chen@mediatek.com> wrote:
> > When we try to visit the pagemap of a tagged userspace pointer, we find
> > that the start_vaddr is not correct because of the tag.
> > To fix it, we should untag the usespace pointers in pagemap_read().
> >
> > I tested with 5.10-rc4 and the issue remains.
> >
> > My test code is baed on [1]:
> >
> > A userspace pointer which has been tagged by 0xb4: 0xb400007662f541c8
> >
> > === userspace program ===
> >
> > uint64 OsLayer::VirtualToPhysical(void *vaddr) {
> >         uint64 frame, paddr, pfnmask, pagemask;
> >         int pagesize = sysconf(_SC_PAGESIZE);
> >         off64_t off = ((uintptr_t)vaddr) / pagesize * 8; // off = 0xb400007662f541c8 / pagesize * 8 = 0x5a00003b317aa0
> 
> Arguably, that's a user-space bug since tagged file offsets were never
> supported. In this case it's not even a tag at bit 56 as per the arm64
> tagged address ABI but rather down to bit 47. You could say that the
> problem is caused by the C library (malloc()) or whoever created the
> tagged vaddr and passed it to this function. It's not a kernel
> regression as we've never supported it.

thanks for the explaination.
> 
> Now, pagemap is a special case where the offset is usually not
> generated as a classic file offset but rather derived by shifting a
> user virtual address. I guess we can make a concession for pagemap
> (only) and allow such offset with the tag at bit (56 - PAGE_SHIFT +
> 3).
> 
> Please fix the patch as per Eric's suggestion on avoiding the
> overflow. You should also add a Cc: stable v5.4- as that's when we
> enabled the tagged address ABI on arm64 and when it's more likely for
> the C library/malloc() to start generating such pointers.

Got it, thanks for your reviewing and suggestion. I will follow Eric's
suggestion and submit patch v2 and cc stable v5.4-

Miles
> 
> If the problem is only limited to this test, I'd rather fix the user
> but I can't tell how widespread the /proc/pid/pagemap usage is.
> 
> Thanks.
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
