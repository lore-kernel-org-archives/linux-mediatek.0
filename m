Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B1E2C43334
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Jun 2022 21:39:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bslPby+Ydb7eJ2PfH2XQCc1VYqpL9TKCaQhHZ8Wf9gU=; b=YkO/CZTv9DXoSgrC10BN0LXNfU
	ajU57MfWCibGa+nleYrQQL74Izqc+gLg+3ED9yZEB35j5iIprpaoJrSqiZtv/IAbDJFYPE+lN3G1+
	95yNXHA1LMFJDxAF21XIWbb213f6sV1B531617vmM5++xCRByryvYCjvUTZNp2b2LnQ3vz6PiFqq7
	c7aKz/tQqfailHBAi9jCRlq36Chdc1q1Q8e70THDMso5MqW2/3/hiM8TbApXb7tjVMZ9HVE0V360l
	x+z78VumDCwXTpi7F0kFwOfPAi3CURGuwNg1lByxKrpAFnf+wDjAV8JHD4YnkmD09BOXNK1peok8B
	9m9/D9LA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6fPb-00EAJg-5Z; Wed, 29 Jun 2022 21:39:51 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6fPP-00EAGk-KD; Wed, 29 Jun 2022 21:39:40 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id F2058616B2;
	Wed, 29 Jun 2022 21:39:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41930C341C8;
	Wed, 29 Jun 2022 21:39:36 +0000 (UTC)
Date: Wed, 29 Jun 2022 22:39:33 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: yee.lee@mediatek.com
Cc: linux-kernel@vger.kernel.org, Alexander Potapenko <glider@google.com>,
	Marco Elver <elver@google.com>, Dmitry Vyukov <dvyukov@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	"open list:KFENCE" <kasan-dev@googlegroups.com>,
	"open list:MEMORY MANAGEMENT" <linux-mm@kvack.org>,
	"moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>,
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH v2 1/1] mm: kfence: apply kmemleak_ignore_phys on early
 allocated pool
Message-ID: <YrzGlSUtnXuiuUEK@arm.com>
References: <20220628113714.7792-1-yee.lee@mediatek.com>
 <20220628113714.7792-2-yee.lee@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220628113714.7792-2-yee.lee@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220629_143939_737081_C000C773 
X-CRM114-Status: GOOD (  12.05  )
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

On Tue, Jun 28, 2022 at 07:37:11PM +0800, yee.lee@mediatek.com wrote:
> From: Yee Lee <yee.lee@mediatek.com>
> 
> This patch solves two issues.
> 
> (1) The pool allocated by memblock needs to unregister from
> kmemleak scanning. Apply kmemleak_ignore_phys to replace the
> original kmemleak_free as its address now is stored in the phys tree.
> 
> (2) The pool late allocated by page-alloc doesn't need to unregister.
> Move out the freeing operation from its call path.
> 
> Suggested-by: Catalin Marinas <catalin.marinas@arm.com>
> Suggested-by: Marco Elver <elver@google.com>
> Signed-off-by: Yee Lee <yee.lee@mediatek.com>

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>

