Return-Path: <SRS0=z/aX=IX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F605C433DB
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Mar 2021 23:51:30 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A36EA61A2B
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Mar 2021 23:51:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A36EA61A2B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:CC:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=we1x2p8F43O3uUywgOlDzMxpUgvPNJwo8yGTlB4Q428=; b=B4XjE1jD1c8qe20xoSy0TUKyz
	gjMdEMv702VANZuCZuYM4/v7td+eZFxgXrGH3pH065OTLNu81PndoKbg1m2s5jIUdKB7ETDbNePMX
	CKpt/tvSSCf2OpllBAvD3nk4juCYjkem66RjQGgSFAt5slLppfT9yWB2ewx250KzlGipRmhl1pZfk
	M2FlgtwBJYWC7v/psuWrXRuxK5Uo7FHu/LMT/ABKyjdoxi5yo5MWPTdhfBDAoeiwSslwni0USYEPr
	KFaDgiVKJKi4/bXry81H3l6HfLqlCJoNJ1eZHY2fMvBIo31kOhivWOkxDSRaCu9maJeEYonP0sBiv
	OrLtCdxDg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lPZkx-002NsE-Vf; Thu, 25 Mar 2021 23:51:16 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lPZkr-002NrV-JZ
 for linux-mediatek@lists.infradead.org; Thu, 25 Mar 2021 23:51:14 +0000
X-UUID: 1d360c046f8f49729d333c8589dd0304-20210325
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=A+r3ZCIBQxVHt9voIgiPko8MotKHzte07lmFGpXmOlI=; 
 b=ZID52VX0qU5jj8A74t8aIwwlP2VR22gtfIipC+dZSSeghQxl2ZPSVX9X+Psz5sFPLfDOKpmC31+vEH1nBwFb3e8NMH8HdQNLJsabPjluirHfuDiVurNBcYoUTXMPbT005mHQnA86guOpB7+cAwi4rOgaGi3igw3eYwke9sX5z7k=;
X-UUID: 1d360c046f8f49729d333c8589dd0304-20210325
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 239278689; Thu, 25 Mar 2021 15:51:03 -0800
Received: from MTKMBS06N1.mediatek.inc (172.21.101.129) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 25 Mar 2021 16:51:01 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 26 Mar 2021 07:51:00 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 26 Mar 2021 07:51:00 +0800
Message-ID: <1616716260.5392.4.camel@mtkswgap22>
Subject: Re: [PATCH v2 1/2] mt76: mt7615: cleanup mcu tx queue in
 mt7615_dma_reset()
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, Shayne Chen
 <shayne.chen@mediatek.com>, <linux-wireless@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>
Date: Fri, 26 Mar 2021 07:51:00 +0800
In-Reply-To: <750b96aa-f26a-5c2a-7040-4bb84a7aa6a7@nbd.name>
References: <fdde0eb8c6dea0e81b5f5ae528085f1ccf53fef3.1616696376.git.ryder.lee@mediatek.com>
 <750b96aa-f26a-5c2a-7040-4bb84a7aa6a7@nbd.name>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210325_235110_357841_1CBBBD3E 
X-CRM114-Status: UNSURE (   8.44  )
X-CRM114-Notice: Please train this message.
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


> On 2021-03-25 19:28, Ryder Lee wrote:
> > Cleanup ext_phy and mcu tx queue so that mt7615_mac_reset_work() can
> > recover mt7615 normally.
> > 
> > Fixes: mt76: e637763b606 ("move mcu queues to mt76_dev q_mcu array")
> > Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
> > ---
> > change since v2 - cleanup mphy_ext->q_tx
> I like v1 better, since ext-phy tx queues are the same as primary phy tx
> queues. Or am I missing something?
> 
> - Felix
right. i didn't notice mt7615 ext-phy shares the same tx queues with
primary phy. please drop this one.
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
