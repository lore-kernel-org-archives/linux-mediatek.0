Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEFADC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Mar 2022 11:46:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bAB0y7oHs55Y6vDwGYY8BfZKlHwNoPfdOcg9i6whEOk=; b=qmdODMSt2ademU
	eEzvZHzprQKO4ACo3dr0TrkKc1ChRi7emdhSRD/mix5mxDEAex6klttpmKQTciFZxig77iCv9VXZ8
	OzK/jLn8RWKYR63+SaQQhXzgMH7krb0St8RpE+31HV76Bx4E1hkFpu4T4dNgPiY07Hri29EfKQMQA
	BMLbY78YViKs9Dd8MqiyX8FBFUCEaRbdvnETMHMp+lnxVv5+qSyEW98iCldvItKqYUcx10/MoUe8g
	COkhj3P16XVjbWjRqh1140BSbR9qv4id4qcIiYVQXLMEccWWWNalY8owUm31Sm3Yzo1c4q7ZIsNlg
	2ESa2eEbq0MSMTxdHUWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nPNRA-002Wnv-EW; Wed, 02 Mar 2022 11:46:32 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nPNR5-002Wm2-DZ; Wed, 02 Mar 2022 11:46:30 +0000
X-UUID: 582fb6a61d684313889e84d481502e00-20220302
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=TzHKaItWrpgO+h7FndARkx7dnkotsATBDiUGN46J6+A=; 
 b=U2FzbQvzstN5vCOsiyN51btUlaUx3nBtlhSt3vOhmW2Q/oJu+2twoEek3BjpgJyfpAH1onVXLZiCSddusdoGZXxWYKxpdQaidsRwz9be/MvVoPlwjSJpZA2tWYT493FrQGpx6FqFIb7FsXWKXYurtPOWqcxyxMBN0KMrQMutJTY=;
X-UUID: 582fb6a61d684313889e84d481502e00-20220302
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <qii.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 823050106; Wed, 02 Mar 2022 04:46:23 -0700
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 2 Mar 2022 03:36:20 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 2 Mar 2022 19:36:07 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 2 Mar 2022 19:36:06 +0800
Message-ID: <0f4b304e8244310648543d0b1ea4788b2c760f3f.camel@mediatek.com>
Subject: Re: [PATCH] i2c: busses: i2c-mt65xx: Simplify with clk-bulk
From: Qii Wang <qii.wang@mediatek.com>
To: Wolfram Sang <wsa@kernel.org>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>
CC: <matthias.bgg@gmail.com>, <linux-i2c@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, <kernel@collabora.com>
Date: Wed, 2 Mar 2022 19:36:06 +0800
In-Reply-To: <Yh6T3RSfvcXCi4sb@ninjato>
References: <20220118133358.111886-1-angelogioacchino.delregno@collabora.com>
 <8725a111-0ee2-8935-86b5-01c61774a628@collabora.com>
 <Yh6T3RSfvcXCi4sb@ninjato>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220302_034628_912764_2E4DAD5D 
X-CRM114-Status: GOOD (  20.34  )
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

On Tue, 2022-03-01 at 22:45 +0100, Wolfram Sang wrote:
> On Mon, Feb 14, 2022 at 12:26:30PM +0100, AngeloGioacchino Del Regno
> wrote:
> > Il 18/01/22 14:33, AngeloGioacchino Del Regno ha scritto:
> > > Since depending on the SoC or specific bus functionality some
> > > clocks
> > > may be optional, we cannot get the benefit of using
> > > devm_clk_bulk_get()
> > > but, by migrating to clk-bulk, we are able to remove the custom
> > > functions
> > > mtk_i2c_clock_enable() and mtk_i2c_clock_disable(), increasing
> > > common
> > > APIs usage, hence (lightly) decreasing kernel footprint.
> > > 
> > > Signed-off-by: AngeloGioacchino Del Regno <
> > > angelogioacchino.delregno@collabora.com>
> > > ---
> > >   drivers/i2c/busses/i2c-mt65xx.c | 127 +++++++++++++----------
> > > ---------
> > >   1 file changed, 51 insertions(+), 76 deletions(-)
> > > 
> > 
> > Hello,
> > this is a friendly ping to request review on this patch as to avoid
> > forgetting it.
> > 
> > Adding context, I have tested this patch on multiple (older/newer)
> > MediaTek
> > platforms.
> 
> Qii Wang, what do you think about this patch?
> 

Sorry for the late reply, I think it's ok.
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
