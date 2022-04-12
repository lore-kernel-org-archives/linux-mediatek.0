Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15B3CC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Apr 2022 11:27:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6uMwqVaJoflyakyUa0/U3MHbRlcWA71h54J+BJF/KFg=; b=ZuMy+e6KGIQVsQ
	GLT7f2JEXvrQbmza3l26aUueK01/2+D48vvcHhCHA2kXAshrETH1FoeNIS1YBkbMto4ZGo41Op6+e
	vFp/h4CCCzMPnFZK1zhqHmiqg79a6ytrYoU3fdH/QAkwQmzB24q/9fD3yyrRHnEUVm9mV+Nxkh+FD
	jyb4tMc2G1/+ntzBRZS9J94UWuYs2o8AEnzWZOWcOKSxxLtdoF4aLWGK/FJ2B5mAcAlZmAeXIoPtZ
	ZmpsxkLwXOppOAXsLmccMdECaxWUfB7ErOsg0nR4AzpugMF7YyWFrzTbhFYRvEd76q9s+vIW+t6I7
	NS0PJyiokdKaondIwnSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1neEfy-00Dg8p-E2; Tue, 12 Apr 2022 11:27:14 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1neEMS-00DY3w-2F; Tue, 12 Apr 2022 11:07:05 +0000
X-UUID: 8887bad5068942428a242032f072e7a0-20220412
X-UUID: 8887bad5068942428a242032f072e7a0-20220412
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <deren.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1635945736; Tue, 12 Apr 2022 04:06:58 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 12 Apr 2022 04:06:56 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 12 Apr 2022 19:06:55 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 12 Apr 2022 19:06:55 +0800
Message-ID: <668f1310cc78b17c24ce7be10f5f907d5578e280.camel@mediatek.com>
Subject: Re: [PATCH] Revert "mt76: mt7921: enable aspm by default"
From: Deren Wu <deren.wu@mediatek.com>
To: Kalle Valo <kvalo@kernel.org>, Philippe Schenker <dev@pschenker.ch>
CC: <linux-wireless@vger.kernel.org>, Felix Fietkau <nbd@nbd.name>,
 <linux@leemhuis.info>, "David S. Miller" <davem@davemloft.net>, "Jakub
 Kicinski" <kuba@kernel.org>, Lorenzo Bianconi <lorenzo.bianconi83@gmail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, Paolo Abeni <pabeni@redhat.com>,
 Ryder Lee <ryder.lee@mediatek.com>, Sean Wang <sean.wang@mediatek.com>,
 Shayne Chen <shayne.chen@mediatek.com>, YN Chen <YN.Chen@mediatek.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <netdev@vger.kernel.org>
Date: Tue, 12 Apr 2022 19:06:54 +0800
In-Reply-To: <87y20aod5d.fsf@kernel.org>
References: <20220412090415.17541-1-dev@pschenker.ch>
 <87y20aod5d.fsf@kernel.org>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220412_040704_194617_B611F986 
X-CRM114-Status: GOOD (  15.52  )
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

On Tue, 2022-04-12 at 12:37 +0300, Kalle Valo wrote:
> Philippe Schenker <dev@pschenker.ch> writes:
> 
> > This reverts commit bf3747ae2e25dda6a9e6c464a717c66118c588c8.
> > 
> > This commit introduces a regression on some systems where the
> > kernel is
> > crashing in different locations after a reboot was issued.
> > 
> > This issue was bisected on a Thinkpad P14s Gen2 (AMD) with latest
> > firmware.
> > 
> > Link: 
> > https://urldefense.com/v3/__https://lore.kernel.org/linux-wireless/5077a953487275837e81bdf1808ded00b9676f9f.camel@pschenker.ch/__;!!CTRNKA9wMg0ARbw!09tjyaQlMci3fVI3yiNiDJKUW_qwNA_CbVhoAraeIX96B99Q14J4iDycWA9cq36Y$
> >  
> > Signed-off-by: Philippe Schenker <dev@pschenker.ch>
> 
> Can I take this to wireless tree? Felix, ack?
> 
> I'll also add:
> 
> Fixes: bf3747ae2e25 ("mt76: mt7921: enable aspm by default")
> 

Hi Kalle,

We have a patch for a similar problem. Can you wait for the
verification by Philippe?
Commit 602cc0c9618a81 ("mt76: mt7921e: fix possible probe failure after
reboot")
Link: 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/drivers/net/wireless/mediatek/mt76?id=602cc0c9618a819ab00ea3c9400742a0ca318380

I can reproduce the problem in my v5.16-rc5 desktop. And the issue can
be fixed when the patch applied.


Hi Philippe,

Can you please help to check the patch in your platform?


Regards,
Deren


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
