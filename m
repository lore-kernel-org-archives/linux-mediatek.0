Return-Path: <SRS0=GpGz=2U=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 411FEC2D0C3
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Dec 2019 03:39:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0DA8E2075D
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Dec 2019 03:39:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jPi1wvd/";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="KpY8jNLL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0DA8E2075D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cBO7p4gyv4d7mNZAE1bar0lhqfphvKqDNSv+hENJXK8=; b=jPi1wvd/57fl/9
	rrbug7Oa2ZL8Ul8sTRb0LUaPj7smL7ceDgR8wosDgO8zm9maC03j1N2hbksUhDoeVYO7qzb9gHASj
	npOoiPCXImzSCnplxbQ5DcKquASxQuPycMCMMUgWZk7Jl0iN+C9pSBUmjU19nzKeaJdcpPe0WC2Cg
	BdP9AivlvY+EWb3gduzY6nLSfz0tmnYB6kyHe2HNpI6AGxYE9sC+nm9SrwH8iV0CQDtR8BqM0kdAg
	9PmEGZ1XoFoFk7uOkrUShADWEgTfq6qMc3wpbRWtkc7KT71uWFLAsqV1ukzzaC63UFQRnvYqaidRo
	bhE7qXnWBoAcvoJhkNug==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1illth-0002Lv-EQ; Mon, 30 Dec 2019 03:39:13 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1illte-0002LP-Ub
 for linux-mediatek@lists.infradead.org; Mon, 30 Dec 2019 03:39:12 +0000
X-UUID: 60e7135c19844ed985073bf3c93fd45f-20191229
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=/4cmGo5jk+InL1JQXnv8LJ5xJENmJ8A8wH1U3y98Dxs=; 
 b=KpY8jNLLVCSxKpZxOwPsCIbPbZeZnMM1JpaZr8Sb03gWy5uVpRUEhWIFJttkPMh3bxzhcp8OIBqgStIi06+5K09+/z2hJVQi1iSIW4881FMkHqfYfxfRv8IEGhqFr/JYIRhZkfRinQBuNAlw56Z80dtjRFGhCNHClDd3dNQuQ6o=;
X-UUID: 60e7135c19844ed985073bf3c93fd45f-20191229
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <miles.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 307791357; Sun, 29 Dec 2019 19:38:59 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Sun, 29 Dec 2019 19:29:13 -0800
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 30 Dec 2019 11:28:34 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Mon, 30 Dec 2019 11:29:18 +0800
Message-ID: <1577676536.29596.2.camel@mtkswgap22>
Subject: Re: [PATCH] mm/page_owner: print largest memory consumer when OOM
 panic occurs
From: Miles Chen <miles.chen@mediatek.com>
To: Qian Cai <cai@lca.pw>
Date: Mon, 30 Dec 2019 11:28:56 +0800
In-Reply-To: <D8935037-8A59-4A64-9C35-52486DC01015@lca.pw>
References: <1577669436.25204.8.camel@mtkswgap22>
 <D8935037-8A59-4A64-9C35-52486DC01015@lca.pw>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191229_193910_991703_051B0487 
X-CRM114-Status: UNSURE (   7.44  )
X-CRM114-Notice: Please train this message.
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
Cc: Michal Hocko <mhocko@suse.com>, wsd_upstream@mediatek.com,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-mediatek@lists.infradead.org, Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sun, 2019-12-29 at 20:51 -0500, Qian Cai wrote:
> 
> > On Dec 29, 2019, at 8:30 PM, Miles Chen <miles.chen@mediatek.com> wrote:
> > 
> > Yes, printing top 10 will be too much. That's why I print only the
> > greatest consumer, and test if this approach works.
> > 
> > I will resend this patch after the break. Let's wait for others'
> > comments?
> 
> Sure, but to make my point clear.

No problem. Thanks for your replies.

  Miles
> 
> Nacked-by: Qian Cai <cai@lca.pw>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
