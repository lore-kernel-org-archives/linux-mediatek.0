Return-Path: <SRS0=j594=LR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72C7CC4743C
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Jun 2021 13:52:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 427F46101D
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Jun 2021 13:52:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 427F46101D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QUkdQwOjtr9QcRe93BxEBa6Fcw74ZdRAe1MfaRQlfMA=; b=tGj/B5InVqFlDW
	1qJeImts+xPnO5+WuhhXY3MCrPxQCddCXIqtKeuhTtv8et45v/KBJc9SGG74igz7nRjjmusq56fSd
	m8X++hSu9SC5hqsfDP2Wy0t8bVLpKZqhTmigSXEefqYQ3VXr+YIAR+tBwgeBQmb73uS0o55oHxglB
	ibp5VWUJ1/6OnYIhexGcNUhDOJPM7N/fPWNaMaVz9ZXxVfSKO4guUZg0B7a0PZ2epPAnqiZ+YFdqf
	MZ422b0W67eRlYO2pCCr84O81/6neityQStwa2DMqI4pUAMYgB+Ny5yPIJ1QG1kgNRQGAU/pojZRu
	EH3mAdsF2IYaXYq12UhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lw3If-00ArfE-Oh; Wed, 23 Jun 2021 13:52:17 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lw3IS-00Arcl-G9; Wed, 23 Jun 2021 13:52:06 +0000
X-UUID: 13bf9ec4f4884cc9935221ed11b43cd3-20210623
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=RF92/Z6meakI06XeuuVECOWlVPOkxWP2LurVAfhOeUc=; 
 b=PoctLPPavxeJlcS0VqNjXm9VM5iAEukdlnajfXKHIn+2TcJPvXQ+5/OTxg78YXDgMsA9/yXvvMRnx+NloZPyv20ftsHjMfuffSWF4CbcRDoJf+/tEJODENYhAoVzkcwjLrJ7Slc1/5UFAvg25UaoEkqWvXvu11WGqofs7nyQNgg=;
X-UUID: 13bf9ec4f4884cc9935221ed11b43cd3-20210623
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <yee.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 714493662; Wed, 23 Jun 2021 06:52:02 -0700
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 23 Jun 2021 06:52:00 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 23 Jun 2021 21:51:59 +0800
Received: from mtksdccf07 (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 23 Jun 2021 21:51:58 +0800
Message-ID: <06c19e0cc63db8ad02db116b7e2d9720f7f03efb.camel@mediatek.com>
Subject: Re: [PATCH v2 0/1] kasan: fix redzone overwritten issue under SLUB
 debug
From: Yee Lee <yee.lee@mediatek.com>
To: <andreyknvl@gmail.com>
CC: <wsd_upstream@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/Mediatek SoC
 support" <linux-mediatek@lists.infradead.org>
Date: Wed, 23 Jun 2021 21:51:58 +0800
In-Reply-To: <20210623133533.2246-1-yee.lee@mediatek.com>
References: <20210623133533.2246-1-yee.lee@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210623_065204_583766_E90E81C4 
X-CRM114-Status: GOOD (  12.46  )
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

Sorry not a completed patch. 
please skip this mail.

BR,
Yee


On Wed, 2021-06-23 at 21:35 +0800, yee.lee@mediatek.com wrote:
> From: Yee Lee <yee.lee@mediatek.com>
> 
> Issue: hwtag kasan_unpoison() would overwrite the redzone in those
> object with unaligned object size. This patch Adds memzero_explict()
> to separate the initialization for such condition. The new code path
> is executed about 1.1% during nromal booting process. 
> 
> =============
> Exp: QEMUv5.2(+mte)/SLUB_debug
> code path exec : 941/80854 (1.1%) 
> 
> ---
> Changed since v1:
>  - Apply IS_ENABLED to wrap codes under SLUB debug mode. 
>  - Replace memset() by memzero_explict().
> 
> ---
> Yee Lee (1):
>   kasan: Add memzero init for unaligned size under SLUB debug
> 
>  mm/kasan/kasan.h | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
