Return-Path: <SRS0=q7ss=LJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEFE6C48BDF
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Jun 2021 19:54:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 74C6F61246
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Jun 2021 19:54:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 74C6F61246
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IFwMtSP25a53Q/jt0T1INvpNDPDAmaMGubQa4BPHZO0=; b=JL0sfUXSxov3nO
	zADBLs1c8BsI6oG3R7jY7T9E4RLSfTcJmNslS06pQW8BRhgxtePjt/zJBMkyflNcpEHfIG6xtfBsH
	cMWm64+qSsDIJxH9pUhLLd06NB6S3jzn8y789hLJGBbrLtSaMnIs28FqJlVDjgP2iFqmmawRoOzAF
	r4tDj7lN59EXcWDw9oUAmEFIrC40OyILwmhrpt54oRfQ/xArur36DuQ5C1jU6kNgC2VJ6pKtVE4d1
	8nY6bUbaRgMJk4pI++9YTXSGEkELzLbz+C32+Smp8gg94ZzdAPSWUVm9olW3uwcicVPpzkSX+TKLr
	Uj9IQqA+TNEzKKudFOMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ltF8G-002bKN-0x; Tue, 15 Jun 2021 19:53:56 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ltBD9-0013YL-Tn; Tue, 15 Jun 2021 15:42:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
 :MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=3yEoT072I6MOxjNG7YT4qxHaaxCVzQrNLMVgWw47rQ0=; b=fmMWlKx648f7R93oqI2HPgoP/L
 gVhnTqcXtoTW27ZtpAbOaZIOF0BeSEt6ou0mFeJPOyrk92bpWcc0CQqDlxbtcTlIYZjJibAgV0tCb
 9YWr16G+oImN0G0y7G4PKZxH/PrJWh3d3w4Zaq0KVyAufLz+vsEIhwdB7TSgJb2SqZu6wAltQBJds
 hIIXixhQJXcXduKNMpXZecpx+ZwRXCgTKnhJmd/R8bWcjuDZlfTkMX63E70sGqdfahqGm/huTX5KI
 YXfE58G7CMdvFBtDSHXXFm3SwS4YYG0f83hq2H+oIE676umF9/IAxeNIiAVObfhyXJcd3tw7XenRn
 2dvNOvHA==;
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ltBCz-0081KZ-G6; Tue, 15 Jun 2021 15:42:42 +0000
Received: from oasis.local.home (cpe-66-24-58-225.stny.res.rr.com
 [66.24.58.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C1D766145C;
 Tue, 15 Jun 2021 15:42:30 +0000 (UTC)
Date: Tue, 15 Jun 2021 11:42:29 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Matt Helsley
 <mhelsley@vmware.com>, Sami Tolvanen <samitolvanen@google.com>,
 <peterz@infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <yj.chiang@mediatek.com>
Subject: Re: [PATCH v2] recordmcount: Correct st_shndx handling
Message-ID: <20210615114229.3b1f2c5f@oasis.local.home>
In-Reply-To: <20210615064720.21950-1-mark-pk.tsai@mediatek.com>
References: <20210615064720.21950-1-mark-pk.tsai@mediatek.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210615_164240_616796_24964753 
X-CRM114-Status: GOOD (  10.89  )
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

On Tue, 15 Jun 2021 14:47:20 +0800
Mark-PK Tsai <mark-pk.tsai@mediatek.com> wrote:

> One should only use st_shndx when >SHN_UNDEF and <SHN_LORESERVE. When
> SHN_XINDEX, then use .symtab_shndx. Otherwise use 0.
> 
> This handles the case: st_shndx >= SHN_LORESERVE && st_shndx != SHN_XINDEX.
> 
> Reported-by: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
> Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> Tested-by: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
> Signed-off-by: Mark-PK Tsai <mark-pk.tsai@mediatek.com>

Please explain the two signed-off-by's above. If you are just tweaking
Peter's original patch, please add at the start:

From: Peter Zijlstra (Intel) <peterz@infradead.org>

And then just above your signed off by, add what you changed:

Tested-by: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
[ Changed something ]
Signed-off-by: Mark-PK Tsai <mark-pk.tsai@mediatek.com>

But state what you changed.

Thanks!

-- Steve

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
