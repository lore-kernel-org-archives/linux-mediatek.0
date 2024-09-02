Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11E53CD13CF
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Sep 2024 09:35:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=i0kqKgN7CJvd0BeYNnJy0G3k1/9Gmrex+aORwHnQoQU=; b=4X6yn5aHbEmyAgngAkCfKbyw5y
	MN2egfFqM4QccGqQ1e7I6wJyQLtrTdD/qI/z9dixLiyo2kaUxc/vQN2VgGT16QHCH7bqPm7SCS8Bo
	b/iElbEPmRzHtgPfTdjX8lNxUFLz+t9S/g3qm68aQY/9Fv9S7STojEWdW1bvyuhzyLF0Ir/QsyJs6
	9kDSJ3uRsOCkUnLdrDDsTh+CV7CmjCtoqgtchapUeV/HtQhk/rm3EFD5UKiOZEkX4/ibPftMgia+z
	LO1//m8ElVSw7qVvfqX9te4tx1PNd4OHIaig/kYpwE+JXTnpsJ+veErUsIH7CrOc803grb1+LcFzm
	ZxbLcbOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sl3T2-0000000Dj6o-47f6;
	Mon, 02 Sep 2024 09:35:24 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sl3Qg-0000000DiS6-0Szi;
	Mon, 02 Sep 2024 09:32:59 +0000
X-UUID: 55107878690e11efb3adad29d29602c1-20240902
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=i0kqKgN7CJvd0BeYNnJy0G3k1/9Gmrex+aORwHnQoQU=;
	b=I7CG6e0ktwICWEVW+qJ8oSKi0d8Ucb46CVf87q04ItLyQHe8E/1LPha3ONypyF0otKdMRxluUdM5ouNrMPy1GlFzOfKKIJoeWfX+KoFAUuEMV3EV/o88xewld8yYfzzjpyTLaKt0I30S81saHLIWBzP1e3ILylSNeRe9cyCXyd4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:9d267e27-8cfa-4302-8677-ea1cf1edabd6,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6dc6a47,CLOUDID:8bc94fbf-d7af-4351-93aa-42531abf0c7b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 55107878690e11efb3adad29d29602c1-20240902
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw01.mediatek.com
	(envelope-from <yenchia.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1527453292; Mon, 02 Sep 2024 02:32:54 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 2 Sep 2024 17:32:51 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 2 Sep 2024 17:32:51 +0800
From: Yenchia Chen <yenchia.chen@mediatek.com>
To: <stable@vger.kernel.org>
CC: Yenchia Chen <yenchia.chen@mediatek.com>, "Rafael J. Wysocki"
	<rafael@kernel.org>, Pavel Machek <pavel@ucw.cz>, Len Brown
	<len.brown@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, <linux-pm@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>
Subject: [PATCH 6.6 0/1] pm, restore async device resume optimization
Date: Mon, 2 Sep 2024 17:32:47 +0800
Message-ID: <20240902093249.17275-1-yenchia.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--0.721600-8.000000
X-TMASE-MatchedRID: NKO9ekWIDjZNfAuy6MOHARWCVBr+Ay98UAjrAJWsTe+CsBeCv8CM/WoY
	8jnT5UNAdvMDsdlFTfx1VOt17I0Spc3AmdtMjGJVngIgpj8eDcAZ1CdBJOsoY9mzcdRxL+xwKra
	uXd3MZDWuikCL8VXXTHd9H3D4g3TAjOdC04VQHm0AQifLWGK23xTY0YxG1fFWyfZaWEB2dsF0BN
	B20+SxH7f8mJY57oZddJaBDYald1lvF9+X2GEIHA==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--0.721600-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 01B788881749FE3475082A6EE46C935325F93AB08D3EA507A3A6E8672CEA022C2000:8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240902_023258_305651_11959154 
X-CRM114-Status: UNSURE (   7.49  )
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

We have met a deadlock issue on our device which use 5.15.y when resuming.
After applying this patch which is picked from mainline, issue solved.
Backport to 6.6.y also.

Rafael J. Wysocki (1):
  PM: sleep: Restore asynchronous device resume optimization

 drivers/base/power/main.c | 117 +++++++++++++++++++++-----------------
 include/linux/pm.h        |   1 +
 2 files changed, 65 insertions(+), 53 deletions(-)

-- 
2.18.0


