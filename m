Return-Path: <SRS0=2J9p=O2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E8EFC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Oct 2021 05:48:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1B81F61139
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Oct 2021 05:48:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1B81F61139
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eq51m2uZueF/XxY9oS0A2oGsSgzl23XMsNAeFutz29U=; b=UrURkT8sSLRntZ
	c7Ben5YnxbW4MV8zw2pFnaVHE3Gf5q2kgMEGSF0EmEt18eyHuOhRNwV6q5og9pB4VEwsllD9A86VK
	LEGeSp9FqY0fzH3CcBr5vXpIRPxjkVLPiLygTrEQHykzSxabETx8NQl6sMkeDcBmmd4eWB3lxOb4f
	Sl5MJ/ZKHD0iIg5hSk1PE01wZovYOjqFucP4PJc9Ba+WSWdRMNqCaib1qaFTI+W1KgTcIzGbloZZk
	L6/G2jvVjrwOU7rWgKSCqUDwW0ORowDFHe+WTBjnSkvRfMhOAMv9dC/rwo9oUefiEJh3jZqm25QCj
	2jgt1NMXtwBJwGjTY3xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mXznF-00CtZT-OP; Wed, 06 Oct 2021 05:48:41 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mXznB-00CtYq-Rs
 for linux-mediatek@lists.infradead.org; Wed, 06 Oct 2021 05:48:39 +0000
X-UUID: ea11e005c84844058e655ded6a4230b7-20211005
X-UUID: ea11e005c84844058e655ded6a4230b7-20211005
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <peter.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 169430785; Tue, 05 Oct 2021 22:48:36 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 5 Oct 2021 22:39:23 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Wed, 6 Oct 2021 13:39:21 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 6 Oct 2021 13:39:21 +0800
Message-ID: <70550eb4364fd184682d14543fc5c1f9810a93f2.camel@mediatek.com>
Subject: Re: [PATCH v3 0/2] scsi: ufs: support vops pre suspend for mediatek
 to disable auto-hibern8
From: Peter Wang <peter.wang@mediatek.com>
To: Bart Van Assche <bvanassche@acm.org>, <stanley.chu@mediatek.com>,
 <linux-scsi@vger.kernel.org>, <martin.petersen@oracle.com>,
 <avri.altman@wdc.com>, <alim.akhtar@samsung.com>, <jejb@linux.ibm.com>
CC: <wsd_upstream@mediatek.com>, <linux-mediatek@lists.infradead.org>,
 <chun-hung.wu@mediatek.com>, <alice.chao@mediatek.com>,
 <cc.chou@mediatek.com>, <chaotian.jing@mediatek.com>,
 <jiajie.hao@mediatek.com>, <powen.kao@mediatek.com>,
 <jonathan.hsu@mediatek.com>, <qilin.tan@mediatek.com>,
 <lin.gui@mediatek.com>, <mikebi@micron.com>
Date: Wed, 6 Oct 2021 13:39:21 +0800
In-Reply-To: <fda69919-44d3-1150-7141-a71e5900bb20@acm.org>
References: <20211006030959.20533-1-peter.wang@mediatek.com>
 <fda69919-44d3-1150-7141-a71e5900bb20@acm.org>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211005_224837_956701_D0A2D317 
X-CRM114-Status: GOOD (  15.45  )
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

On Tue, 2021-10-05 at 21:02 -0700, Bart Van Assche wrote:
> On 10/5/21 20:09, peter.wang@mediatek.com wrote:
> > Mediatek UFS design need disable auto-hibern8 before suspend.
> > This patch introduce an solution to do pre suspned before SSU
> > (sleep) command.
> > 
> > Peter Wang (2):
> >    scsi: ufs: support vops pre suspend
> >    scsi: ufs: ufs-mediatek: disable auto-hibern8 before suspend
> 
> Please always include a changelog when posting a new version of a
> patch
> series.
> 
> I have the same comment about v3 as for v2: I don't think that this
> series is bisectable so please combine the two patches into one patch
> or add "if (status == PRE_CHANGE) return" in ufshcd_vops_suspend() in
> patch 1/2 and remove this again in patch 2/2.
> 
> Thanks,
> 
> Bart.

Hi Bart,

OK, will merge to one patch.
Thanks for review.

Peter



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
