Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10349D0EE12
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Oct 2024 16:37:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Tb6/zYZ762FrKsZuaklFpQpOK7qBPMn60N+XHfs5vRk=; b=OC/j4IMYRr6maxDsGsHPNSnoHm
	erdy8AxTASttVrJS1di7Pvi0o3eCxWgs/LvIs3gHKQZ6sfkWo4Dh60TySJe80mXK1hhH+KhWoDHLm
	+SSm+fbS3Qwy/gLPysP+JJLYmacY5Y6w2rW2YShdzgAzfWe6xJE8bJUuy2YtJvEI+gEtR9q4G4YGT
	CZwhlGmCdy3GLiGCGPZ8TrNxjnS7YmcR+Xg1h/oLMnqQEKHWS1qLanKVSNG4ZCK/9mXPCOuuMR6A9
	8Mym7r7vWn2oO8jzXFxA0u8PSE/yjBhYC0m3emD11DLE9FpxcReYSSAxHN0CZeSLddEJoiUVR0Buz
	kukyj56A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1szIdQ-0000000Gz3J-2uDr;
	Fri, 11 Oct 2024 16:37:00 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1szIdN-0000000Gz1A-3SaY
	for linux-mediatek@lists.infradead.org;
	Fri, 11 Oct 2024 16:36:59 +0000
X-UUID: 05e4f67087ef11efb3adad29d29602c1-20241011
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=Tb6/zYZ762FrKsZuaklFpQpOK7qBPMn60N+XHfs5vRk=;
	b=AKIRGAUkHBlahlX+sZLYIZ3zOK4nVfEMxu1IuhWQXn/iSX9O0eLVF4gQLlyJBN7xjf1dIaaabAq2Cc8Z+lNPg8hELO9E+0y79UD7SJRyT7Tr+Ejwpfdn2JnGAJq2HCoWFRlNT8g9jHNn91D8PF6sYg4yNoOK9O96gUabVm5+dP4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:7d7a0317-9908-4946-a682-491a3a2bf19e,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:5,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:0
X-CID-META: VersionHash:6dc6a47,CLOUDID:a75f1d41-8751-41b2-98dd-475503d45150,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: 05e4f67087ef11efb3adad29d29602c1-20241011
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <shayne.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1169705529; Fri, 11 Oct 2024 09:36:53 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Sat, 12 Oct 2024 00:36:49 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Sat, 12 Oct 2024 00:36:49 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: linux-firmware <linux-firmware@kernel.org>
CC: Felix Fietkau <nbd@nbd.name>, Evelyn Tsai <evelyn.tsai@mediatek.com>,
	linux-mediatek <linux-mediatek@lists.infradead.org>, Daniel Golle
	<daniel@makrotopia.org>
Subject: pull-request: mtk_wed firmware 20241011 v2
Date: Sat, 12 Oct 2024 00:36:49 +0800
Message-ID: <20241011163649.19110-1-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--10.381700-8.000000
X-TMASE-MatchedRID: 9SKQLBmTF7vgxStX0wUODsqXjImgj58bIfyQNHR2naZd9fDYSm945TC0
	pJIQUiJOMyjG/vEwWNeun8wjeYlO74BX93VZG6SnnVTWWiNp+v+y4iyjvVWTorIPyqeQTeKkV78
	paYC694ArIhHNwiG1WXATsg8MODVIHxPMjOKY7A8LbigRnpKlKTpcQTtiHDgWjtA42YMO2JEV0T
	f3EbjItSrYPj2tn+n3+OgcVNG/hM8bxn22FR0dWw==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--10.381700-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 2119E5403AD242148E6EF7DA970DF9683D5BCA2DD6006F21F78561E54B8660C92000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241011_093657_896689_01C59F55 
X-CRM114-Status: UNSURE (   8.55  )
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

Hi,

Here's a v2 pull request which fixes CI failures.
Please let me know if there are any problems, thanks.

Shayne

The following changes since commit d55315295cccf8ce5dc288a74d75cf09b8063cfc:

  Merge branch 'superm1/qci-patches' into 'main' (2024-10-10 19:11:13 +0000)

are available in the Git repository at:

  https://github.com/csyuanc/linux-firmware.git mtk_wed-20241011

for you to fetch changes up to 808cba847c70a91eb5a1d502a5e1a63379bb328b:

  mtk_wed: add firmware for mt7988 Wireless Ethernet Dispatcher (2024-10-12 00:02:10 +0800)

----------------------------------------------------------------
Shayne Chen (1):
      mtk_wed: add firmware for mt7988 Wireless Ethernet Dispatcher

 WHENCE                          |  28 ++++++++++++++++++++++------
 mediatek/mt7988/mt7988_wo_0.bin | Bin 0 -> 107816 bytes
 mediatek/mt7988/mt7988_wo_1.bin | Bin 0 -> 107752 bytes
 3 files changed, 22 insertions(+), 6 deletions(-)
 create mode 100644 mediatek/mt7988/mt7988_wo_0.bin
 create mode 100644 mediatek/mt7988/mt7988_wo_1.bin

