Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF35EC38A2D
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Oct 2022 01:15:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=axatU4fcD+wolPyz4bGrdQ9wRDjsPIVraTvvyidQSxU=; b=RIVPQSzfEU+4Lq7ZR01XylxhkQ
	5gAo/kuyQQjxJjY3/YiLsKAtJWchrTxBRAnrs3ce7t+SLB5T/4So+mh5qMmoA6cSefBaqN2kmyX39
	0rk3XD05NEFMX4i8BJCbR8brPIu/3zoIY+rbqHhFlTNy4dhsDc132LMvVcmnNVZkUQ0eH07vtt1uI
	O9+H5sPIKz1t9kX1dz24DPpyzzPlbV226JXGFQO+L7R97hoBvXsbHoVcPqgh5R4ftI0eb9nXVdndW
	eFUE3IpaMU7nbGOZW/ZH7emZ0Tg0nqFj5W80207a1gjnkUGz2Uqbs6hiVHJtTj8HANE5oIob+TtRc
	/72ebEMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1on8XD-003Vrn-Kk; Tue, 25 Oct 2022 01:15:15 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1on8XB-003Vqw-Lx
	for linux-mediatek@lists.infradead.org; Tue, 25 Oct 2022 01:15:15 +0000
X-UUID: c16f5b72c14e4a3d9c9aef741e84fe77-20221024
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=axatU4fcD+wolPyz4bGrdQ9wRDjsPIVraTvvyidQSxU=;
	b=IxerMc4MBbQIlHH8erRikzj/KxIGLNEao/siRzqL3hnR6iSaxmc8yviZcCdCeNFuBaPyrBbdGyHChT61cqNL3ahMuIIh2NM/j40MWYPVplsWyam3ddekEyMrH21cn3psAaAfVPvYtVxU2HoRJJuAvNQm4cJLb7O0905CAoK5EOQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.12,REQID:72a355f1-90cc-448a-b2c9-6c61dad59125,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:62cd327,CLOUDID:ac8289e4-e572-4957-be22-d8f73f3158f9,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: c16f5b72c14e4a3d9c9aef741e84fe77-20221024
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <ryder.lee@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1522210963; Mon, 24 Oct 2022 18:15:00 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Tue, 25 Oct 2022 08:44:57 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Tue, 25 Oct 2022 08:44:57 +0800
Message-ID: <42da87e3aa229722fac9566aaef963acd28d9c7a.camel@mediatek.com>
Subject: Re: [PATCH 1/2] wifi: mt76: mt7915: enable use_cts_prot support
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, <linux-wireless@vger.kernel.org>
CC: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, Shayne Chen
	<shayne.chen@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>,
	<linux-mediatek@lists.infradead.org>
Date: Tue, 25 Oct 2022 08:44:57 +0800
In-Reply-To: <f13c8c4ae61eb1374ca65e92b03e908c21073917.1666657715.git.ryder.lee@mediatek.com>
References: <f13c8c4ae61eb1374ca65e92b03e908c21073917.1666657715.git.ryder.lee@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221024_181513_907477_D07E3785 
X-CRM114-Status: UNSURE (   7.31  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, 2022-10-25 at 08:31 +0800, Ryder Lee wrote:
> This adds selectable RTC/CTS enablement for each interface.
> 
> Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
> Change-Id: I5eb7851b513d4140d879676154e2abe769969c01
> ---

Oops. I accidentally included our internal change-id for both patch.

@Felix, can you help to drop them while merging?

Ryder


