Return-Path: <SRS0=452w=GM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72A68C433DB
	for <linux-mediatek@archiver.kernel.org>; Sat,  9 Jan 2021 07:27:05 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EEC8020E65
	for <linux-mediatek@archiver.kernel.org>; Sat,  9 Jan 2021 07:27:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EEC8020E65
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=3r4dhSwDrWqVmdSRZS99WY/86UK9PoBQu6mC4N1g7w4=; b=kHUMR1HNR0T736r1O5oOQcNS4
	QnTqWv2181w/DestDJb7cMZzr6KV20/Ut0PwcEIFle5YJATC5TY3woS30hb0DkjC2tpXiyyFFHlhX
	f3KxQmerdjpzwrzpwD72ejUtXUKIi/EFv4Li39sAPRhvSq+Zw8wLH15JTR/wALYSfrmCy+QLLnpcn
	KfHYkXD3vyuABWV8ZFewRdX+Aqhb+Q8Ge5ujTFYTHXk6WDr7+DjUiufxAJQRbOdBkJiylnCriLpsw
	+6BsF3S7zwxchtoayjSgQhtJJY+Dxcz5t2VdGHgozATsZr4bKpvKzLVLelbF3nXRval3inWV4yBLw
	FAKoCN8UA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ky8e5-00078p-He; Sat, 09 Jan 2021 07:26:45 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ky8e1-00077M-G7; Sat, 09 Jan 2021 07:26:43 +0000
X-UUID: b31e000aaaec43cdbc9dd23ce1593e7c-20210108
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=LG/cJoeFBo7UbfJCnoAM2KeDSjMX1tcxR4lh/0+orbU=; 
 b=Iv+L/YcuMt8WQQOzfpS/PQGxFL1tg0u515g6UAlki7JSpauONdL0ZLj/84Dz5Eb0hkAAxZj7mx5kxzj1n7Apt7KBRAKDCv1eBeaIYIE6C0dCs/EM1v6G4nDF5RU42zUqNOAilwVxahBYrY/WXPGUuwKno75101w0kDldNhmul1g=;
X-UUID: b31e000aaaec43cdbc9dd23ce1593e7c-20210108
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <lecopzer.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 301542814; Fri, 08 Jan 2021 23:26:36 -0800
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 8 Jan 2021 23:26:35 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 9 Jan 2021 15:26:33 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sat, 9 Jan 2021 15:26:33 +0800
From: Lecopzer Chen <lecopzer.chen@mediatek.com>
To: <andreyknvl@google.com>
Subject: Re: [PATCH 3/3] arm64: Kconfig: support CONFIG_KASAN_VMALLOC
Date: Sat, 9 Jan 2021 15:26:33 +0800
Message-ID: <20210109072633.7234-1-lecopzer.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <CAAeHK+wc-DU2pUma43JtomOSy0Z6smGKwQoG_R+uKzByu3oZ9w@mail.gmail.com>
References: <CAAeHK+wc-DU2pUma43JtomOSy0Z6smGKwQoG_R+uKzByu3oZ9w@mail.gmail.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210109_022641_759720_2B95610F 
X-CRM114-Status: GOOD (  17.52  )
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
Cc: lecopzer.chen@mediatek.com, linux-mm@kvack.org, catalin.marinas@arm.com,
 yj.chiang@mediatek.com, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com, lecopzer@gmail.com,
 glider@google.com, linux-arm-kernel@lists.infradead.org,
 aryabinin@virtuozzo.com, akpm@linux-foundation.org, will@kernel.org,
 dan.j.williams@intel.com, dvyukov@google.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Andrey,
 
> On Sun, Jan 3, 2021 at 6:13 PM Lecopzer Chen <lecopzer@gmail.com> wrote:
> >
> > Now I have no device to test for HW_TAG, so keep it not selected
> > until someone can test this.
> >
> > Signed-off-by: Lecopzer Chen <lecopzer.chen@mediatek.com>
> > ---
> >  arch/arm64/Kconfig | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> > index 05e17351e4f3..29ab35aab59e 100644
> > --- a/arch/arm64/Kconfig
> > +++ b/arch/arm64/Kconfig
> > @@ -136,6 +136,7 @@ config ARM64
> >         select HAVE_ARCH_JUMP_LABEL
> >         select HAVE_ARCH_JUMP_LABEL_RELATIVE
> >         select HAVE_ARCH_KASAN if !(ARM64_16K_PAGES && ARM64_VA_BITS_48)
> > +       select HAVE_ARCH_KASAN_VMALLOC if (HAVE_ARCH_KASAN && !KASAN_HW_TAGS)
> 
> KASAN_VMALLOC currently "depends on" KASAN_GENERIC. I think we should
> either do "HAVE_ARCH_KASAN && KASAN_GENERIC" here as well, or just do
> "if HAVE_ARCH_KASAN".

Thanks for the correctness, I'll change to the following in V2 patch.
	"select HAVE_ARCH_KASAN_VMALLOC if HAVE_ARCH_KASAN"

Let KASAN_VMALLOC depend on the mode it supports to avoid modifying
two places if KASAN_VMALLOC can support other than GENERIC in the future.
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
