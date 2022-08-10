Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13120C00140
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Aug 2022 16:56:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xjxCoi5hOqipKdbAywsT9ZQgRnNFcm/4tZuCvBDtqy4=; b=EfrbOTVD3NZIZ+tJkegnIMjKxL
	KtTvRSXdCvFEaKIx3mDV2KKM8PdVhQ1ursdvkTFca4MCaloXU6m9i4t3ylZi6BHe+coSm7UzDBAAN
	Fme3oyp3+xl570m4Hhlql1kZk72eDyDKaEWPDs79lKgy4t1zJSygMRQTLjm5skgMIufPABLccIRjx
	DFoAsFWVyJ3uzDZ7JRmSmz0OMGY8JBtK7LnOQPr3eD/6KFZImNcYQh8r3T9lu6ivrRSBkUpuaOAH1
	V1WQ0wzByBl17LY3FpXEl0bAYYqam9rwTuAV2dTnzoh6/p5YWy6TKdjg/D/SonG2bXvdU/B1RlNYO
	vLEDcdLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oLp03-00D64z-LJ; Wed, 10 Aug 2022 16:56:07 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oLp00-00D62V-EL
	for linux-mediatek@lists.infradead.org; Wed, 10 Aug 2022 16:56:06 +0000
X-UUID: ebb97f99ed4e492c86324039de903c8b-20220810
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.9,REQID:94156117-3be2-4bea-a859-ec40ac47f774,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_H
	am,ACTION:release,TS:0
X-CID-META: VersionHash:3d8acc9,CLOUDID:d1cb4c9c-da39-4e3b-a854-56c7d2111b46,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: ebb97f99ed4e492c86324039de903c8b-20220810
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <ryder.lee@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 276137551; Wed, 10 Aug 2022 09:55:57 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Thu, 11 Aug 2022 00:45:20 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Thu, 11 Aug 2022 00:45:20 +0800
Message-ID: <0e387e3e57388bb58449feee12b54cfe414836ba.camel@mediatek.com>
Subject: Re: [PATCH 1/2] mt76: move move mt76_sta_stats to mt76_wcid
From: Ryder Lee <ryder.lee@mediatek.com>
To: Josh Boyer <jwboyer@kernel.org>
CC: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi
	<lorenzo.bianconi@redhat.com>, Shayne Chen <shayne.chen@mediatek.com>,
	"Evelyn Tsai" <evelyn.tsai@mediatek.com>, <linux-firmware@kernel.org>,
	<linux-mediatek@lists.infradead.org>
Date: Thu, 11 Aug 2022 00:45:20 +0800
In-Reply-To: <a9ded159fd293b25c745dea966e5b00a2601e56d.1660092593.git.ryder.lee@mediatek.com>
References: <a9ded159fd293b25c745dea966e5b00a2601e56d.1660092593.git.ryder.lee@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220810_095604_516370_EEF3E13A 
X-CRM114-Status: GOOD (  11.32  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 2022-08-11 at 00:37 +0800, Ryder Lee wrote:
> This is a preliminary patch for WED's TxS support.
> 
> Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
> ---
>  drivers/net/wireless/mediatek/mt76/mt76.h     | 42 ++++++++++-------
> --
>  .../net/wireless/mediatek/mt76/mt76_connac.h  |  3 +-
>  .../wireless/mediatek/mt76/mt76_connac_mac.c  |  4 +-
>  .../net/wireless/mediatek/mt76/mt7915/mac.c   |  3 +-
>  .../net/wireless/mediatek/mt76/mt7915/main.c  |  2 +-
>  .../wireless/mediatek/mt76/mt7915/mt7915.h    |  2 -
>  .../net/wireless/mediatek/mt76/mt7921/mac.c   |  3 +-
>  .../net/wireless/mediatek/mt76/mt7921/main.c  |  2 +-
>  .../wireless/mediatek/mt76/mt7921/mt7921.h    |  1 -
>  9 files changed, 29 insertions(+), 33 deletions(-)
> 

Oops. I sent to the wrong mailing list. Please ignore these patches.

Ryder


