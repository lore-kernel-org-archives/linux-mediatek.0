Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58315C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Dec 2021 06:27:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1LvxYuqxQEY4hvyckeTCOlluryDiGWcIPempxCP4sgU=; b=H2IDadki6uxFI2
	pt4Um3OOFGsvP4Nr8jb31zZ/oKa8IKHl6/wiIKG1KFXqRtFOd3zk1mxIULegRDxDHJDFg1n+S8862
	TMPhdzQ8bVIxi7ctADzJPXDPNZM9p9oaRLoipG2B9HK3XaUgSTGHQ1ZUim5VdU8QSts8yavHdHt+H
	4NChNrQm0Os/6LUMiFEYZBZjf7cwwGBO3k9sFv7Bt8XD27738JgOj4HZd+n2YKxm8rsmHN3xn+MTF
	FLCSX8PiMiJ3a/21RbAsQYP1uxi1zPhkXtPXroM2DOL7h/N5EUYLin+cFdoiac0PKzHW2pW9tMUkp
	XXsJPoZbaUlmBUQrgnQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mzYcE-005dh1-47; Tue, 21 Dec 2021 06:27:14 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mzYcB-005dgJ-SN; Tue, 21 Dec 2021 06:27:13 +0000
X-UUID: ad9e91b8e84d467fb72968369cc0c038-20211220
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=fsqmCiRK++ZH7UUg/8t/S1vZ6GLSXPgcsopcYXVP/ho=; 
 b=pwASkwYOHFOnDKboNRTvkeuzPJujkQGEdDqa8akb/tbdZSkwwFSFw4AYBzX6Uju5PmpA2YPF3tmHlcEBdnGanNrwi1l/v+721LnawWoT4uXo/apCDrTrDcWdfnOZTqBh80QMOSkSgu4KBxbvRHq93eLpVwjp7cXejdD0AImHKxo=;
X-UUID: ad9e91b8e84d467fb72968369cc0c038-20211220
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 738261395; Mon, 20 Dec 2021 23:27:07 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 20 Dec 2021 22:17:05 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 21 Dec 2021 14:16:58 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 21 Dec 2021 14:16:57 +0800
Message-ID: <37fc793f6b544f46cb214f7ed14034a1934bfe32.camel@mediatek.com>
Subject: Re: [PATCH v2 3/4] usb: mtu3: fix list_head check warning
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Sergei Shtylyov <sergei.shtylyov@gmail.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>
CC: Matthias Brugger <matthias.bgg@gmail.com>, Felipe Balbi
 <felipe.balbi@linux.intel.com>, <linux-usb@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, Eddie Hung <eddie.hung@mediatek.com>,
 <stable@vger.kernel.org>, Yuwen Ng <yuwen.ng@mediatek.com>
Date: Tue, 21 Dec 2021 14:16:58 +0800
In-Reply-To: <9c5417f7-3cd9-472d-5b04-f831135ffd78@gmail.com>
References: <20211218095749.6250-1-chunfeng.yun@mediatek.com>
 <20211218095749.6250-3-chunfeng.yun@mediatek.com>
 <64b9453a-84c5-8d41-26d5-698d1ae9d473@gmail.com>
 <Yb8MM2zL2Ecfzv1/@kroah.com>
 <9c5417f7-3cd9-472d-5b04-f831135ffd78@gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211220_222711_943749_F7645409 
X-CRM114-Status: GOOD (  15.13  )
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

On Sun, 2021-12-19 at 14:00 +0300, Sergei Shtylyov wrote:
> On 19.12.2021 13:40, Greg Kroah-Hartman wrote:
> [...]
> 
> > > > This is caused by uninitialization of list_head.
> > > 
> > >     Again, there's no such word as "uninitialization" (even if it
> > > existed, it
> > > wouldn't mean what you wanted to say); please replace by "not
> > > initializing".
> > 
> > We are not English language scholars, most of us do not have
> > English as
> > their native language.  We all can understand what is being said
> > here,
> > there's no need for any change, please do not be so critical.
> 
>     OK, noted...
>     I was just somewhat upset that my 1st comment was ignored. :-/
Very sorry, I planned to fix it, but forgot it;

Please feel free to point out my mistakes;

Thanks a lot

> 
> > thanks,
> > 
> > greg k-h
> 
> MBR, Sergey
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
