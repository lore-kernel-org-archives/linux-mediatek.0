Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06151C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Dec 2021 07:27:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wb3nhmcExL1CvlDG5/IrKTlns3MxihVir5GbOyHpeZ0=; b=sii6DpinBMeS9/
	Gt+UiT/duOmWBS9yPjzafQpOckYT5GzPwM8RBY+X1k4Xpck8OghT5iCrFR5E9oJqq8qxUEjvC9Ts7
	uStAJ9+6T5zfxkYHiwxX2VuOz28qwghl+SQT5mj/KmV5HfsJQyoxo+i/82Kd7VMvPokNEBd8ODF2c
	BJWXD3dQQ9R5XmSw6NX46qCgf6qhcRASu46mZsDNbesiSzecxUoDTES0F8ylsialre2zWR55KAEot
	qSIxwSDFkGbDPATzs/XpkUYyubvMNNBFBXeBHBIAjXfuuzO/M7VG8mTxn4aWSi2z6E1frvOzsOFuY
	HM3669a4MtTLluTwGO9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1muUsz-007DTW-1G; Tue, 07 Dec 2021 07:27:37 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1muUst-007DSX-1J
 for linux-mediatek@lists.infradead.org; Tue, 07 Dec 2021 07:27:33 +0000
X-UUID: cbbb6939154d4ba08c7ce0462a2dd43b-20211207
X-UUID: cbbb6939154d4ba08c7ce0462a2dd43b-20211207
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <meichia.chiu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 594819384; Tue, 07 Dec 2021 00:27:26 -0700
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 6 Dec 2021 23:25:49 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 7 Dec 2021 15:25:48 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 7 Dec 2021 15:25:47 +0800
Message-ID: <72ca4f5fe3c351ec56dee4935b28c7b7f26188c2.camel@mediatek.com>
Subject: Re: [PATCH] mt76: mt7915: add mu-mimo and ofdma debugfs knobs
From: meichia chiu <meichia.chiu@mediatek.com>
To: Ben Greear <greearb@candelatech.com>, Felix Fietkau <nbd@nbd.name>
CC: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, Shayne Chen
 <shayne.chen@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>, "Ryder
 Lee" <ryder.lee@mediatek.com>, Money Wang <Money.Wang@mediatek.com>,
 <linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>
Date: Tue, 7 Dec 2021 15:25:48 +0800
In-Reply-To: <7158a937-57f3-2bd8-591e-124a18d2d8e8@candelatech.com>
References: <20211206141006.29632-1-MeiChia.Chiu@mediatek.com>
 <7158a937-57f3-2bd8-591e-124a18d2d8e8@candelatech.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211206_232731_116856_7459C25B 
X-CRM114-Status: GOOD (  12.71  )
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

On Mon, 2021-12-06 at 08:43 -0800, Ben Greear wrote:
> On 12/6/21 6:10 AM, MeiChia Chiu wrote:
> > From: MeiChia Chiu <meichia.chiu@mediatek.com>
> > 
> > Add mu-mimo and ofdma packet counters statistics.
> 
> Hello,
> 
> Are these stats clear-on-read in the firmware?  If so, then we need
> to accumulate
> them in the driver.
> 
> Is there any significant downside to enabling the stats?  For
> instance, a performance
> degradation in the firmware/hardware?
> 
> Thanks,
> Ben

Hi Ben,

Yes, the current design is clear-on-read and its sole purpose is for
debugging only. If you need statistics, this may have to be done in
another way.

Yes, a performance degradation is expected since enabling this debug
function would burden MCU with more calculation.

Thanks,
Meichia


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
