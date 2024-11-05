Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2C37D1CA3A
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Nov 2024 07:16:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ko2/lgbTDWkPYYq5LFxV1H81UxfUBuNJrVWXn+FJYTY=; b=L2frr0ym918X4+mzvHlazeUYw8
	TIO1P0GRmZzhE15m+QT7Hdu+Ms16FeNDTglLOAeDbotZygB2+tcF4wEJL4RGet/MGKYyp9CY/yUDT
	jZscxoMSOBOn0B295CsJXu6TCEE+BlnB22SGjn6bxIN/QRfd3X8WnlIxrgRjwALqiKaLgtyKNEf0c
	TtGUpHNXpMBlrAVyjjk8T+FJUgxg30MuvSoe+zNtCCQXjfPvhKICuUMCVgJVlS5nZyzRKZJ7ODcjV
	lu8N1JN3y79HBwsL4fKoeqgXJ/QGIiBKT8VLbTna9s5twM3vrs1P4BpA3fsoO3v3/V9FaZSM4EoDW
	Msdj8d9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8DnN-0000000GAQN-4AqV;
	Tue, 05 Nov 2024 07:16:10 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8DnH-0000000GAO6-0zIK
	for linux-mediatek@lists.infradead.org;
	Tue, 05 Nov 2024 07:16:08 +0000
X-UUID: cd387af89b4511ef9048ed6ed365623b-20241105
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=ko2/lgbTDWkPYYq5LFxV1H81UxfUBuNJrVWXn+FJYTY=;
	b=JhYzAe8gFD4oAEkS3icH2pTBmNpK/p4jKB0pcM8d5u+2JA7wZXumjX3lDmGQKU1LvYYOdo7Yl5VieyPtdQeMkve9Z6y1Sz+Yo1Y/zNd6m5YVl3VOiINqRKpIM8xqFh7LhLJWW0I2NUhJaRMjpFTeV6kpUqgNCKugyCOcvXrugaw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.42,REQID:b4a6a762-f8ff-43da-b426-b3e270383c90,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0fcdc3,CLOUDID:56949007-7990-429c-b1a0-768435f03014,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: cd387af89b4511ef9048ed6ed365623b-20241105
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw02.mediatek.com
	(envelope-from <yr.yang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 143728016; Tue, 05 Nov 2024 00:15:56 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 5 Nov 2024 15:15:54 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 5 Nov 2024 15:15:54 +0800
From: yr.yang <yr.yang@mediatek.com>
To: <linux-firmware@kernel.org>
CC: <linux-mediatek@lists.infradead.org>, <shawnku@google.com>, yr.yang
	<yr.yang@mediatek.com>
Subject: [PATCH] WHENCE: Add sof-tolg for mt8195
Date: Tue, 5 Nov 2024 15:12:53 +0800
Message-ID: <20241105071549.17476-2-yr.yang@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20241105071549.17476-1-yr.yang@mediatek.com>
References: <20241105071549.17476-1-yr.yang@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_231603_296846_5A9B518F 
X-CRM114-Status: UNSURE (   7.84  )
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

mediatek: Add sof-tolg for mt8195

Signed-off-by: yr.yang <yr.yang@mediatek.com>
---
 WHENCE | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/WHENCE b/WHENCE
index 691291c3..dfa5ea70 100644
--- a/WHENCE
+++ b/WHENCE
@@ -7529,6 +7529,9 @@ File: mediatek/sof/sof-mt8195.ldc
 File: mediatek/sof-tplg/sof-mt8195-mt6359-rt1019-rt5682.tplg
 Version: v0.4.2
 
+File: mediatek/sof-tplg/sof-mt8195-mt6359-max98390-rt5682.tplg
+Version: v0.4.3
+
 Licence: Redistributable. See LICENCE.mediatek for details.
 
 --------------------------------------------------------------------------
-- 
2.46.0


