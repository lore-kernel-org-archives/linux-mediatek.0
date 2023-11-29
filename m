Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45AF3C4167B
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Nov 2023 01:22:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Mime-Version:References:In-Reply-To:Message-Id:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tpFoDWxzhly8vBWsBuFUUlmjaSBQExvhtIJrmrRoKEE=; b=ZattXoGcu0x+yVX37+YxfthPnA
	t4na1Z38bAeYOVJ41dUt9sjatDUD0QAK2Hjip/CK162uipJyXcelTwCXBG32JuKvafLpvx8i5a3hC
	5kuxF/c7vwrzx4WtRG3Yg5gnnvgcrZeS0CsK4XBNL7yiYKbmdIOvTNWgjgovObNMMh0nxDgYWIMgb
	i9hezUQkpCC+dpbLavo7xAK/9lSmWc667WKCl2iabL6IVyJBl3JafMd4lNDp7DrtLfmLzycDG+GRH
	LBBiLweKYB+5IhGfyd4yP66sztrqFmoTJWya3Gyr51eDHq9zlIgnbeDlfH72qtnglk6zQ2yyDqomx
	87SU42uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r89Hq-006lXU-1Y;
	Wed, 29 Nov 2023 01:22:46 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r89Hm-006lWX-2n;
	Wed, 29 Nov 2023 01:22:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 7B95FB835E0;
	Wed, 29 Nov 2023 01:22:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67609C433C8;
	Wed, 29 Nov 2023 01:22:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1701220959;
	bh=FBEAIzoLgu9Zkuu5c9UADybKG5tCWoq0pA1ohTQwa20=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=HTEloEWxitIAf4LrB+uGaCeVqy52QvkDsiW2ua5f4z/AKXmiI4hBsmwz7PT6WTZ1s
	 Wxwfavqo2J72G1RZWH7aANFIO7lWJsNGHPpk1qGbaREMhcIco32+aA0fD6htjwWtLz
	 m3FgVonjktFJ978Fuc/dQrQaVIQfLkN/ghI7VTIk=
Date: Tue, 28 Nov 2023 17:22:38 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Haibo Li <haibo.li@mediatek.com>
Cc: <linux-kernel@vger.kernel.org>, Andrey Ryabinin
 <ryabinin.a.a@gmail.com>, Alexander Potapenko <glider@google.com>, Andrey
 Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, <kasan-dev@googlegroups.com>,
 <linux-mm@kvack.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <xiaoming.yu@mediatek.com>, kernel
 test robot <lkp@intel.com>
Subject: Re: [PATCH] fix comparison of unsigned expression < 0
Message-Id: <20231128172238.f80ed8dd74ab2a13eba33091@linux-foundation.org>
In-Reply-To: <20231128075532.110251-1-haibo.li@mediatek.com>
References: <20231128075532.110251-1-haibo.li@mediatek.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231128_172243_423981_F43CD820 
X-CRM114-Status: GOOD (  13.20  )
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

On Tue, 28 Nov 2023 15:55:32 +0800 Haibo Li <haibo.li@mediatek.com> wrote:

> Kernel test robot reported:
> 
> '''
> mm/kasan/report.c:637 kasan_non_canonical_hook() warn:
> unsigned 'addr' is never less than zero.
> '''
> The KASAN_SHADOW_OFFSET is 0 on loongarch64.
> 
> To fix it,check the KASAN_SHADOW_OFFSET before do comparison.
> 
> --- a/mm/kasan/report.c
> +++ b/mm/kasan/report.c
> @@ -634,10 +634,10 @@ void kasan_non_canonical_hook(unsigned long addr)
>  {
>  	unsigned long orig_addr;
>  	const char *bug_type;
> -
> +#if KASAN_SHADOW_OFFSET > 0
>  	if (addr < KASAN_SHADOW_OFFSET)
>  		return;
> -
> +#endif

We'd rather not add ugly ifdefs for a simple test like this.  If we
replace "<" with "<=", does it fix?  I suspect that's wrong.

But really, some hardwired comparison with an absolute address seems
lazy.  If KASAN_SHADOW_OFFSET is variable on a per-architecture basis
then the expression which checks the validity of an arbitrary address
should also be per-architecture.


