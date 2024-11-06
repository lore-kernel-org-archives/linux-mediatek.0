Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D45BD3E783
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Nov 2024 02:55:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KOYxrBw8EUrrRWzm09yKcDBb3HHovQ1xJDDNiVTXfBE=; b=feE4nH/7OcCen4qegs0MWKL9Xx
	fQFiFkD+GBLErtVPkJVaEhlrFl35ZdEc/kSWqi0PORCIipZ6WIvgoc/nKe0kYWYYQv9agorMkqAUg
	0F0bQa+ZYzSBdKsfym64fm4Y4sEC2bgj7dYSyNaCwN84Zk0nRLNWZ+Ph+faWmW3M5IqdO/C03Zl2z
	/QYgXmfBTCU4QziNUsnaup7Qhj0uksxh9EYaMJ7RiVL0BlrpRvxtZdwpF1A8hRz4PyFdlmJbjQiaI
	x0rYzcx9AdY+j+yJXmKXQ640JKBNgooORB6OneDp/F5P7DAFcQUv1BTvxEwyrzk+E9aq8eYVD1vTv
	u/b1BWow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8WCV-00000001cEd-3akZ;
	Wed, 06 Nov 2024 02:55:19 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8WCT-00000001cDJ-2Fcc
	for linux-mediatek@lists.infradead.org;
	Wed, 06 Nov 2024 02:55:18 +0000
X-UUID: 8bf0ac329bea11ef9048ed6ed365623b-20241105
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=KOYxrBw8EUrrRWzm09yKcDBb3HHovQ1xJDDNiVTXfBE=;
	b=rniZClNYPfPVo5zOhNf9vUcwlyUtoNK02nb88B99ldjwE84Py9dC/EXKeZi2Hd/Ci1qsQtZUhQGAgWfqTfuNB4HeQiPsIiK0giwupl1q6zyI5fglzrDXuPBW9rBIhSZQa+/KBBixrz4fH2YmLYZKHMH4mLMGocXKfwh1s9/rgT0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.42,REQID:65a5ea71-ec7c-4105-8a53-33df8c8cabad,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0fcdc3,CLOUDID:d9fa7822-a4fe-4046-b5be-d3379e31a9ef,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 8bf0ac329bea11ef9048ed6ed365623b-20241105
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw02.mediatek.com
	(envelope-from <yr.yang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1451164808; Tue, 05 Nov 2024 19:55:14 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 6 Nov 2024 10:55:08 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 6 Nov 2024 10:55:08 +0800
From: yr.yang <yr.yang@mediatek.com>
To: <linux-firmware@kernel.org>
CC: <linux-mediatek@lists.infradead.org>, <shawnku@google.com>, YR Yang
	<yr.yang@mediatek.corp-partner.google.com>
Subject: [PATCH] WHENCE: Add sof-tolg for mt8195
Date: Wed, 6 Nov 2024 10:53:35 +0800
Message-ID: <20241106025439.25929-2-yr.yang@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20241106025439.25929-1-yr.yang@mediatek.com>
References: <20241106025439.25929-1-yr.yang@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--1.976600-8.000000
X-TMASE-MatchedRID: Po6oKkC+jBAxFdXyW/P+XQPZZctd3P4BsSrAWY+HdwqbKItl61J/yfJv
	ocwUrWp7FBpuM64i9KELbigRnpKlKTpcQTtiHDgWgupbOEVUWNXts+4REx60pksSKeSvkiWDDPG
	qMZBKAmW0KJRsn/ovowfkDiYNky8vISG4z1M0Wdp7FMChVAK0Iw+WefkcuSbU4sOrsb4iT/K/bb
	EolHIgZUOc7GjOamnWv5a9cmIodEspRnLV2kwrLg==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--1.976600-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 86225C840403CCC19E7FE9FF8DC4A4B91A67092ED95DBCF5103FD5BA1842D3E62000:8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_185517_635490_3841DAB0 
X-CRM114-Status: UNSURE (   8.53  )
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

From: YR Yang <yr.yang@mediatek.corp-partner.google.com>

mediatek: Add sof-tolg for mt8195

Signed-off-by: YR Yang <yr.yang@mediatek.corp-partner.google.com>
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


