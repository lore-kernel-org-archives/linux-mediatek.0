Return-Path: <SRS0=Syrz=L5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87343C07E95
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Jul 2021 03:21:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C8665613BA
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Jul 2021 03:21:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C8665613BA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VfIqwgoTptkre0XMyYTCCSHq9gg7nDlhOaUqVKipXkU=; b=VrrttR3c7r4k73
	y3NcqFRkP/Gcc1x6avlCb6FSDyIWScHNnh0Pl6iU5CyyOG8jNLjmanQdLO46HcMRok7dFWn/olbXt
	4G8AQuVndMVpyIzMeNQ4A9jIHGYi27K8qHGQU4w6/YywzG/U1BjmouSK4xIrDNzbTW6rq2KS87zQn
	o6Fqi9Yvpp+nUxW9mG4+lOU1IqSfLMlxtvRSnzD/BMJsKZk7etdBdIUlWGEmETUDnp1YP4XB58VKx
	VLiI2LOoDE/zVA69vkh6CzSGXtkAGo2KFY4+fBA9yGAk2VAFpT4q34Io3+o5rxq/MGKidV3VYsGRA
	ETlTuyc0MFvPm6oSrz7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m0FAE-007ZbV-CT; Mon, 05 Jul 2021 03:20:54 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m0FA1-007Za6-GD; Mon, 05 Jul 2021 03:20:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=Uyi3dGXOAbIOJd7YWHBSfk15jYVVRDs3BwEnju0HB+g=; b=iCDc5WaFLUOylkXScUecwCi8xL
 luN19mrIQDU4G+Y0GREridkhZtrH8YBG+1+abFaOpeZO7VxyvF92UqRyQb6nP535rJ+gc+Tf7cB5a
 /FoKo/8TokUJOYSP6XH2TeWQRsdOXT4TKXZsdPxFfZHuq2N1AqYqXHnr1zHJd5EKNeLXJIT8tHo2B
 ZPlLpZvpT2urW9fzh8qeIp2LrrBclfsH/kPiY7glKG1xtPSxHoI7xXX5c7WyRoDCjL1XQAunLGBzV
 QYa6UCtiPYX0SIyhesPZtoXgaqtne5IGbwbEB8xVgYxyNyof9xL/kYqXzsjB4JN0INA9oVE7rynFD
 kxUF2BNA==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1m0F9U-009qSU-3E; Mon, 05 Jul 2021 03:20:20 +0000
Date: Mon, 5 Jul 2021 04:20:08 +0100
From: Matthew Wilcox <willy@infradead.org>
To: yee.lee@mediatek.com
Cc: linux-kernel@vger.kernel.org, wsd_upstream@mediatek.com,
 nicholas.Tang@mediatek.com, Kuan-Ying.lee@mediatek.com,
 chinwen.chang@mediatek.com, Marco Elver <elver@google.com>,
 Christoph Lameter <cl@linux.com>, Pekka Enberg <penberg@kernel.org>,
 David Rientjes <rientjes@google.com>, Joonsoo Kim <iamjoonsoo.kim@lge.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Vlastimil Babka <vbabka@suse.cz>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "open list:SLAB ALLOCATOR" <linux-mm@kvack.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH v5 1/2] mm: introduce helper to check slub_debug_enabled
Message-ID: <YOJ6aPuNOtzjVhBC@casper.infradead.org>
References: <20210705024101.1567-1-yee.lee@mediatek.com>
 <20210705024101.1567-2-yee.lee@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210705024101.1567-2-yee.lee@mediatek.com>
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

On Mon, Jul 05, 2021 at 10:40:57AM +0800, yee.lee@mediatek.com wrote:
> From: Marco Elver <elver@google.com>
> 
> Introduce a helper to check slub_debug_enabled, so that we can confine
> the use of #ifdef to the definition of the slub_debug_enabled_unlikely()
> helper.

We don't usually embed '_unlikely' in function names; we
just do:

static inline bool slub_debug_enabled(void)
{
	return static_branch_unlikely(&slub_debug_enabled);
}

eg:

static inline bool cpusets_enabled(void)
{
        return static_branch_unlikely(&cpusets_enabled_key);
}

#define cgroup_bpf_enabled(type) static_branch_unlikely(&cgroup_bpf_enabled_key[type])

static inline int ip_tunnel_collect_metadata(void)
{
        return static_branch_unlikely(&ip_tunnel_metadata_cnt);
}

static inline bool frontswap_enabled(void)
{
        return static_branch_unlikely(&frontswap_enabled_key);
}


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
