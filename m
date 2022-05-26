Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 051DDC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 May 2022 07:03:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=stQVsynlat319e4tAJ65Nd9ob8767JAbyDxiW5y86kc=; b=x9q/YWnbIpQAlI
	WlW1W9VN07StdBiBv9TH4Z2GH8yWpGjw7XxHQYovGQu/+j+KpYV4hhubjr7T53YPI2HifVTAMfXDu
	7FnXLU7Nb2HKkLdc5W/hm6Q+kvz5OOl7tu1hwv7kXpLim5gkSRQUFP6ha6Ir5mKu7NujDItl4ZOnz
	67teWd7eUN+ZgoegUCSgJtY9kllsUzx5OX91aVFc5e7JIRVq7nBSGqKcK7nrZRhLDdRSzIEEv5Eh1
	h3AojFOrhnxpbd+Biw9TeMzqLotDA7KXwW5lmGOWY8Gb5Nhn3CNMKm5uOCBcki7rwmpJ8Dr6psrMl
	BSQBDHIowiAoP8ot4xqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nu7XF-00Dhgz-1T; Thu, 26 May 2022 07:03:53 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nu7XA-00DheL-BC; Thu, 26 May 2022 07:03:51 +0000
X-UUID: 69b506a7d8584208ab4984912e7579e8-20220526
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5,REQID:e9295edc-eb03-451a-b844-5efd1254f931,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:2a19b09,CLOUDID:a3768c47-4fb1-496b-8f1d-39e733fed1ea,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:0,BEC:nil
X-UUID: 69b506a7d8584208ab4984912e7579e8-20220526
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
	(envelope-from <nancy.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 185885107; Thu, 26 May 2022 00:03:36 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 26 May 2022 00:03:34 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3;
 Thu, 26 May 2022 15:03:32 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 26 May 2022 15:03:32 +0800
Message-ID: <995c91a5dbad4512aadc8b2e12502e88b335af5b.camel@mediatek.com>
Subject: Re: [PATCH v21 00/25] Add MediaTek SoC DRM (vdosys1) support for
 mt8195
From: Nancy.Lin <nancy.lin@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rex-BC Chen <rex-bc.chen@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, Chun-Kuang Hu
	<chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
	<wim@linux-watchdog.org>, <linux@roeck-us.net>
CC: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, "Nathan
 Chancellor" <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>,
	"jason-jh . lin" <jason-jh.lin@mediatek.com>, Yongqiang Niu
	<yongqiang.niu@mediatek.com>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <dri-devel@lists.freedesktop.org>,
	<llvm@lists.linux.dev>, <singo.chang@mediatek.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Thu, 26 May 2022 15:03:32 +0800
In-Reply-To: <79863f1b-7bdd-61c7-2209-23011d8e1558@collabora.com>
References: <20220512053128.31415-1-nancy.lin@mediatek.com>
	 <8c6ceb14be7e53a7dab9d6f045a48deaef54f683.camel@mediatek.com>
	 <79863f1b-7bdd-61c7-2209-23011d8e1558@collabora.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220526_000348_415540_A8241493 
X-CRM114-Status: GOOD (  23.91  )
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

On Wed, 2022-05-25 at 12:08 +0200, AngeloGioacchino Del Regno wrote:
> Il 18/05/22 04:47, Rex-BC Chen ha scritto:
> > On Thu, 2022-05-12 at 13:31 +0800, Nancy.Lin wrote:
> > > The hardware path of vdosys1 with DPTx output need to go through
> > > by
> > > several modules, such as, OVL_ADAPTOR and MERGE.
> > > 
> > > Add DRM and these modules support by the patches below:
> > > 
> > > Changes in v21:
> > > - fix reviewer comment
> > >    - fix rdma and ethdr binding doc and dts
> > > 
> 
> ..snip..
> 
> > 
> > Hello Matthias,
> > 
> > Could you also spare some time to give us some suggestion for the
> > mmsys
> > and mutex patches of this series?
> > If we can improve anything, we can do it before 5.19.
> > Thanks for your big support!
> > 
> > BRs,
> > Rex
> > 
> 
> Even though there may be something to further improve, keep in mind
> that we're
> already at v21... that's... a lot of versions, and vdosys0/1 are
> practically
> tied together even though they're coming from two different
> engineers.
> 
> I can confirm that this entire stack works on the new HW as intended
> and that
> there's no regression on older ones, so on all patches you can add
> my:
> 
> [Tested on MT6795, MT8173, MT8192, MT8195]
> Tested-by: AngeloGioacchino Del Regno <
> angelogioacchino.delregno@collabora.com>
> 
> 
> .... BUT! ....
> 
> 
> This series won't apply cleanly anymore on next-20220525 (same for
> vdosys0,
> already pinged Jason about it) because of the commits adding support
> for MT8186,
> so *please rebase this series once again*.
> 
> 
> Cheers,
> Angelo

Hi Angelo,

I will rebase to next-20220525 and resend it soon.

Regards,
Nancy


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
