Return-Path: <SRS0=jsh4=BY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC90AC433DF
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Aug 2020 09:08:21 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A39D5207DA
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Aug 2020 09:08:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JbasiJVr";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Q8Iy3+0i"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A39D5207DA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Ts+3+0oZceyw76PYQ2ZqU9vk3dF3ZUwWzaO07A3JdMc=; b=JbasiJVrviIABlPbLutzh+F1t
	IL73/9s2WMbCy6QnE4AYod5kZ7jQbNcXHhpq0EK9JPif5os1TAfNT5cezDk6YCpNFUyElx0sf+HqS
	Hu+HfMOJW/1Lfq7Igbt4AUve1uluFq8T2KLG4pktdMrVAfc9q1hTc+DkC5kzN9FMJVBYRhM76wjnG
	cEj2V84oKOl7yBSaACSsFrzu2G1Cat7a4rdckqMIiBCDAvOsFzjyZEgAthaSMyTNXee2XiZgC47ox
	dbc9XVjeN1axIG0sdXEo1hbkgYpb0dXzvLhNEr+qBOrytQ+x7s5QUpUAXUSfpstpFRO4LoKKsITfY
	JV/Omm6RA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k6Vh7-0004kc-Cu; Fri, 14 Aug 2020 09:08:13 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k6Vh3-0004jX-Pb; Fri, 14 Aug 2020 09:08:11 +0000
X-UUID: d598d854ce104cdb96b8ec073e94ee7b-20200814
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=Uz5ripoV/+pUZcgYYnjGHaVEtX3lTJMQY1UuM8dECro=; 
 b=Q8Iy3+0igqsaru66x1pWQmfZx9rUW7611iexjivvXFooJMbrTk3BQMjSjxdaCp9sa3iuGruzoE+EpKygf0EZKk57lUvp/J9bSEBrA44AGiy7SPlOqfYCQP5OH1UEVLmdCSfC1TwgIYU1JJd5uxRC0rASv4HquAIJrsuXkPUi5x8=;
X-UUID: d598d854ce104cdb96b8ec073e94ee7b-20200814
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <chinwen.chang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 231710915; Fri, 14 Aug 2020 01:08:04 -0800
Received: from MTKMBS01N1.mediatek.inc (172.21.101.68) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 14 Aug 2020 02:08:05 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 14 Aug 2020 17:08:00 +0800
Received: from [172.21.77.33] (172.21.77.33) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 14 Aug 2020 17:08:00 +0800
Message-ID: <1597396082.32469.58.camel@mtkswgap22>
Subject: Re: [PATCH v2 2/2] mm: proc: smaps_rollup: do not stall write
 attempts on mmap_lock
From: Chinwen Chang <chinwen.chang@mediatek.com>
To: Michel Lespinasse <walken@google.com>
Date: Fri, 14 Aug 2020 17:08:02 +0800
In-Reply-To: <CANN689FtCsC71cjAjs0GPspOhgo_HRj+diWsoU1wr98YPktgWg@mail.gmail.com>
References: <1597284810-17454-1-git-send-email-chinwen.chang@mediatek.com>
 <1597284810-17454-3-git-send-email-chinwen.chang@mediatek.com>
 <CANN689FtCsC71cjAjs0GPspOhgo_HRj+diWsoU1wr98YPktgWg@mail.gmail.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200814_050809_996120_B01C4F96 
X-CRM114-Status: GOOD (  19.83  )
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
Cc: linux-arm-kernel@lists.infradead.org, Song Liu <songliubraving@fb.com>,
 wsd_upstream@mediatek.com, Davidlohr Bueso <dbueso@suse.de>,
 LKML <linux-kernel@vger.kernel.org>,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>, Daniel
 Jordan <daniel.m.jordan@oracle.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 linux-mediatek@lists.infradead.org, Jimmy Assarsson <jimmyassarsson@gmail.com>,
 Huang Ying <ying.huang@intel.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Steven Price <steven.price@arm.com>, Alexey Dobriyan <adobriyan@gmail.com>,
 Vlastimil Babka <vbabka@suse.cz>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, 2020-08-14 at 01:35 -0700, Michel Lespinasse wrote:
> On Wed, Aug 12, 2020 at 7:13 PM Chinwen Chang
> <chinwen.chang@mediatek.com> wrote:
> > smaps_rollup will try to grab mmap_lock and go through the whole vma
> > list until it finishes the iterating. When encountering large processes,
> > the mmap_lock will be held for a longer time, which may block other
> > write requests like mmap and munmap from progressing smoothly.
> >
> > There are upcoming mmap_lock optimizations like range-based locks, but
> > the lock applied to smaps_rollup would be the coarse type, which doesn't
> > avoid the occurrence of unpleasant contention.
> >
> > To solve aforementioned issue, we add a check which detects whether
> > anyone wants to grab mmap_lock for write attempts.
> 
> I think your retry mechanism still doesn't handle all cases. When you
> get back the mmap lock, the address where you stopped last time could
> now be in the middle of a vma. I think the consistent thing to do in
> that case would be to retry scanning from the address you stopped at,
> even if it's not on a vma boundary anymore. You may have to change
> smap_gather_stats to support that, though.

Hi Michel,

I think I got your point. Let me try to prepare new patch series for
further reviews.

Thank you for your suggestion :)

Chinwen
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
