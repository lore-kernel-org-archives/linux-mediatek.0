Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF450E73158
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Feb 2026 11:52:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:CC:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YehUUsjtuHlyhxJTWORrwLPRmBeZ16UED5xESeEXaBo=; b=TEqoUEkHKt0km68z+nvwtknOXS
	zSEdxq8LnvDFjDW+ZD/x/39A6snEtGyLVOkRpHz1wQbL89BKvR+Fy6Sbtpg8JQ2e1Shc0403ELZNO
	yMWwsMsMY/OnRZzNjI3U381S3vxNps8ZegQh4q5E17e5CuoKqMf1MHptx/2MJe0PDeYsOUt00bUsi
	r+52/sfMnY0ReqyPrVtvOmlxqZ6B8cpjbILJ2XCcFQrQ/yjqXXmK1kmnPUb41eUfsh2J4Ja3iUHxT
	8FHBm5K8AJPFDpcd7agL+rbnrcbky7KM/6Hs1CVX2IKgIPnzYNZv5ooz0UzT9ann8eqY2s6EmgpCB
	yciMYURw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmsU3-00000004vlA-07GB;
	Mon, 02 Feb 2026 11:52:47 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmsU0-00000004vkN-3ONQ
	for linux-mediatek@lists.infradead.org;
	Mon, 02 Feb 2026 11:52:46 +0000
X-UUID: aa8eba82002d11f1ad39f32c34db0b1c-20260202
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=YehUUsjtuHlyhxJTWORrwLPRmBeZ16UED5xESeEXaBo=;
	b=qDiIljQzs43D5ENNDx8Wnbs1dXTkZnqXToP0zCeqRAIYj5HPheKYDiwJ9U7D7mCY2Y/uBnIp7eXdKRBCQU/m0hHd53wdNqC2aWzisNuX2578Ra0s1rIuPmXkzXXNrQyq0b60JEPQhD8RPLIuT9zlUqvuCx8rFxCas53KaO2X8bg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.11,REQID:59e80450-78b5-4ce9-8082-1c538e317bce,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:89c9d04,CLOUDID:d4413cf0-16bd-4243-b4ca-b08ca08ab1d8,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|836|888|898,TC:-5,Co
	ntent:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL
	:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: aa8eba82002d11f1ad39f32c34db0b1c-20260202
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <shayne.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 494731928; Mon, 02 Feb 2026 04:52:36 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 2 Feb 2026 19:52:33 +0800
Received: from [10.233.130.16] (10.233.130.16) by mtkmbs13n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.2562.29 via Frontend
 Transport; Mon, 2 Feb 2026 19:52:33 +0800
Message-ID: <41b9111e696c0b0a9a3ad4d8728cf9819aa64708.camel@mediatek.com>
Subject: Re: [PATCH 5/5] wifi: mt76: mt7996: fix queue pause after scan due
 to wrong channel switch reason
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Lorenzo Bianconi
	<lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, Evelyn Tsai
	<evelyn.tsai@mediatek.com>, Money Wang <money.wang@mediatek.com>,
	linux-mediatek <linux-mediatek@lists.infradead.org>, StanleyYP Wang
	<StanleyYP.Wang@mediatek.com>
Date: Mon, 2 Feb 2026 19:52:33 +0800
In-Reply-To: <fe5bb9ed-7dab-4cd5-b2ab-e5252713095c@nbd.name>
References: <20260202075311.365673-1-shayne.chen@mediatek.com>
	 <20260202075311.365673-5-shayne.chen@mediatek.com>
	 <fe5bb9ed-7dab-4cd5-b2ab-e5252713095c@nbd.name>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_035245_204979_C4C8C2BF 
X-CRM114-Status: GOOD (  17.42  )
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

On Mon, 2026-02-02 at 10:01 +0100, Felix Fietkau wrote:
> On 02.02.26 08:53, Shayne Chen wrote:
> > From: StanleyYP Wang <StanleyYP.Wang@mediatek.com>
> >=20
> > Previously, we use the IEEE80211_CONF_IDLE flag to avoid setting
> > the
> > parking channel with the CH_SWITCH_NORMAL reason, which could
> > trigger TX
> > emission before bootup CAC.
> >=20
> > However, we found that this flag can be set after triggering
> > scanning on a
> > connected station interface, and the reason
> > CH_SWITCH_SCAN_BYPASS_DPD will
> > be used when switching back to the operating channel, which makes
> > the
> > firmware failed to resume paused AC queues.
> >=20
> > Seems that we should avoid relying on this flag after switching to
> > single
> > multi-radio architecture. Instead, replace it with
> > MT76_STATE_RUNNING.
>=20
> I don't see how the conditions are comparable at all. I also don't
> see=20
> how this function can be called with MT76_STATE_RUNNING unset.
>=20
The condition is used to prevent mt7996_mcu_set_chan_info() (in
mt7996_run()) from triggering TX emission.

> Maybe a better replacement would be to check for a chanctx on the
> phy?
>=20
Will do some tests on this and send v2.

Thanks,
Shayne=20

> - Felix


