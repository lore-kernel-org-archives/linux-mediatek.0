Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87926C433F5
	for <linux-mediatek@archiver.kernel.org>; Sun, 24 Apr 2022 08:59:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UQiqGdb7Lc4Ki7P4ujMRwzw2uiG4mghhroy+di881Xs=; b=AyYbli2XxQ1q2C
	PYNKiUnmHpjyL30C23uZZLAFzhklLi5B1vfWbWx/wGf56CM75K8A62i/xIwhIPF71C+psPD6ZjjaF
	nmqkyLGxmng3VDOKgXzHA3KWwmL91a1KWinwgG+Rd+lJ7OFHNSULbVDCpYE7BGcd3wTNMHaA2rapB
	1LUpdcUIfNpYFZCNXIxihgGZdpp5NGAYAT/loERJlW6A+Zu/rkKPrLkxTl24CzCmbvDqDiX+uzjZ/
	fMrODQ4IroRV0J/hvfNTZ3EF18N55KlpKzYTKE+f8EKlppEYe/auclMpPf8zCZpVrrB2v+oIbzBBf
	DLx2//2y8JZaJ8VRxCDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1niY5n-006D4M-27; Sun, 24 Apr 2022 08:59:43 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1niY5K-006Cys-UR; Sun, 24 Apr 2022 08:59:16 +0000
X-UUID: 16088c8215564f16a858fd3f28fb4258-20220424
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:4be7fd54-2cfd-498b-a47d-35828e030054, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:faefae9, CLOUDID:c1d2bcf0-da02-41b4-b6df-58f4ccd36682,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: 16088c8215564f16a858fd3f28fb4258-20220424
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <jason-jh.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1187617020; Sun, 24 Apr 2022 01:59:10 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 24 Apr 2022 01:49:08 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Sun, 24 Apr 2022 16:48:54 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sun, 24 Apr 2022 16:48:54 +0800
Message-ID: <a0b90deb9d30fe331493f5fbe8e67a97b698fe49.camel@mediatek.com>
Subject: Re: [PATCH v20 2/8] soc: mediatek: add mtk-mutex support for mt8195
 vdosys0
From: Jason-JH Lin <jason-jh.lin@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, CK Hu <ck.hu@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>
CC: Nancy Lin <nancy.lin@mediatek.com>, Singo Chang
 <singo.chang@mediatek.com>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>, 
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Sun, 24 Apr 2022 16:48:54 +0800
In-Reply-To: <074d8c26-3fb7-bee1-d559-7ce96f583fee@gmail.com>
References: <20220419094143.9561-1-jason-jh.lin@mediatek.com>
 <20220419094143.9561-3-jason-jh.lin@mediatek.com>
 <82cc5e6900138e13ed9d75c6d2a42c6d7afc1959.camel@mediatek.com>
 <c3de9ccb314316b5296b115dd3e9f8171577489f.camel@mediatek.com>
 <074d8c26-3fb7-bee1-d559-7ce96f583fee@gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220424_015915_141879_505ACBE2 
X-CRM114-Status: GOOD (  23.37  )
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

Hi Matthias,

Thanks for the reviews.

On Fri, 2022-04-22 at 14:31 +0200, Matthias Brugger wrote:
> 
> On 22/04/2022 04:32, Jason-JH Lin wrote:
> > Hi CK,
> > 
> > Thanks for the reviews.
> > 
> > On Thu, 2022-04-21 at 14:50 +0800, CK Hu wrote:
> > > Hi, Jason:
> > > 
> > > On Tue, 2022-04-19 at 17:41 +0800, jason-jh.lin wrote:
> > > > Add mtk-mutex support for mt8195 vdosys0.
> > > > 
> > > > Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
> > > > Acked-by: AngeloGioacchino Del Regno <
> > > > angelogioacchino.delregno@collabora.com>
> > > > Tested-by: Fei Shao <fshao@chromium.org>
> > > > ---
> > > >   drivers/soc/mediatek/mtk-mutex.c | 87
> > > > ++++++++++++++++++++++++++++++--
> > > >   1 file changed, 84 insertions(+), 3 deletions(-)
> > > > 
> > > > diff --git a/drivers/soc/mediatek/mtk-mutex.c
> > > > b/drivers/soc/mediatek/mtk-mutex.c
> > > > index aaf8fc1abb43..729ee88035ed 100644
> > > > --- a/drivers/soc/mediatek/mtk-mutex.c
> > > > +++ b/drivers/soc/mediatek/mtk-mutex.c
> > > > @@ -17,6 +17,9 @@
> > > >   #define MT8183_MUTEX0_MOD0			0x30
> > > >   #define MT8183_MUTEX0_SOF0			0x2c
> > > >   
> > > > +#define MT8195_DISP_MUTEX0_MOD0			0x30
> > > > +#define MT8195_DISP_MUTEX0_SOF			0x2c
> > > 
> > > This is identical to mt8183, so use mt8183 one instead of
> > > creating
> > > new
> > > one.
> > > 
> > > Regards,
> > > CK
> > > 
> > 
> > I'll fix this in the next version.
> 
> Please send this as a follow-up fix on top of:
> 
https://urldefense.com/v3/__https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux.git/log/?h=v5.18-next*soc__;Lw!!CTRNKA9wMg0ARbw!0QzNDaejnt54R86SL628fJ9p2BKTOmYBnoz6uPz9X8WsHXeQi3rqPAXmPFRBcw1vEtUu$
>  
> 
> Regards,
> Matthias
> 
OK, I'll send the fix-up patch soon.

Regards,
Jason-JH.Lin

> > 
> > Regards,
> > Jason-JH.Lin.
> > > > 
> > > >   
> > > > +static const struct mtk_mutex_data mt8195_mutex_driver_data =
> > > > {
> > > > +	.mutex_mod = mt8195_mutex_mod,
> > > > +	.mutex_sof = mt8195_mutex_sof,
> > > > +	.mutex_mod_reg = MT8195_DISP_MUTEX0_MOD0,
> > > > +	.mutex_sof_reg = MT8195_DISP_MUTEX0_SOF,
> > > > +};
> > > > +
> > > >   
> > > 
> > > 
-- 
Jason-JH Lin <jason-jh.lin@mediatek.com>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
