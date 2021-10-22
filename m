Return-Path: <SRS0=WF8g=PK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0CDDC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Oct 2021 07:33:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 99E9C6058D
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Oct 2021 07:33:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 99E9C6058D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W0fti1yaIVVWnaJ2taS3tJ4aVd5qL4P+G9JnPUS2nXE=; b=emS1NGiKPdqHTU
	71ccBjVC1OYomV/C+7J1T86Z3IFAbGjZbv17k8MlErSNV+BKPg7m5ZubdAKKBABXv8iXVcm+FnoG7
	fXUrmdElLVJCGeyGEOQN6DHNX1lUFX1nUGj4ZX86E/HVeOatJlEJAGnV7eExl3hiw3XND6EK22SRA
	NAkt+Zgp7DdfkKt6ByvwjjCew2lFDsHQr0CBFs9u82WypHfq2zFAdXvzHTRtpYJSIUq+41uR/ti4w
	hRr1AHizQs4rIBgE5ucz8ujBUTgK37RwNkckbJYHlNUQbhim7lTnfLRxZQhfPiQUGbxnYxAtYtXDh
	nVa3RQr8OEVVSLWicFKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdp3P-009xsk-Ic; Fri, 22 Oct 2021 07:33:27 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdp3M-009xrW-Fs; Fri, 22 Oct 2021 07:33:25 +0000
X-UUID: 8f7f092bf4684a4581f78cd30fcd5cac-20211022
X-UUID: 8f7f092bf4684a4581f78cd30fcd5cac-20211022
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <nancy.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1862406422; Fri, 22 Oct 2021 00:33:21 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 22 Oct 2021 00:33:19 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Fri, 22 Oct 2021 15:33:18 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 22 Oct 2021 15:33:17 +0800
Message-ID: <8e66debdbba43680391b02116cbdf5af85710565.camel@mediatek.com>
Subject: Re: [PATCH v6 10/16] soc: mediatek: add mtk-mutex support for
 mt8195 vdosys1
From: Nancy.Lin <nancy.lin@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, "CK
 Hu" <ck.hu@mediatek.com>
CC: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>, Daniel Vetter
 <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, "jason-jh . lin" <jason-jh.lin@mediatek.com>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>,
 <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <singo.chang@mediatek.com>,
 <srv_heupstream@mediatek.com>
Date: Fri, 22 Oct 2021 15:33:17 +0800
In-Reply-To: <ccbaff29-808a-4c7b-51d4-764cf283fbbc@collabora.com>
References: <20211004062140.29803-1-nancy.lin@mediatek.com>
 <20211004062140.29803-11-nancy.lin@mediatek.com>
 <ccbaff29-808a-4c7b-51d4-764cf283fbbc@collabora.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211022_003324_569078_25444EDE 
X-CRM114-Status: GOOD (  23.35  )
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

Hi Angelo,

Thanks for the review.

On Thu, 2021-10-14 at 17:01 +0200, AngeloGioacchino Del Regno wrote:
> > Add mtk-mutex support for mt8195 vdosys1.
> > The vdosys1 path component contains ovl_adaptor, merge5,
> > and dp_intf1. Ovl_adaptor is composed of several sub-elements,
> > so change it to support multi-bit control.
> > 
> > Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
> > ---
> >   drivers/soc/mediatek/mtk-mutex.c | 296 ++++++++++++++++++------
> > -------
> >   1 file changed, 175 insertions(+), 121 deletions(-)
> > 
> > diff --git a/drivers/soc/mediatek/mtk-mutex.c
> > b/drivers/soc/mediatek/mtk-mutex.c
> > index 36502b27fe20..7767fedbd14f 100644
> > --- a/drivers/soc/mediatek/mtk-mutex.c
> > +++ b/drivers/soc/mediatek/mtk-mutex.c
> > @@ -29,113 +29,142 @@
> >   
> >   #define INT_MUTEX				BIT(1)
> >   
> > -#define MT8167_MUTEX_MOD_DISP_PWM		1
> 
> This patch doesn't only add support for MT8195 vdosys1, but also
> changes
> all definitions to a different "format", and also changes the type
> for
> "mutex_mod" from int to long.
> In reality, the actual functional change is minimal, compared to the
> size of
> this entire patch.
> 
> Please, split this patch in two parts: one patch changing the defines
> and
> the mutex_mod type (specifying that it's a preparation for adding
> support for
> mt8195 vdosys1 mutex) and one patch adding such support.
> 
> Thanks!
> 
> Regards,
> - Angelo

OK, I will separate it into two patches.

Regards,
Nancy
> 
> 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
