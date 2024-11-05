Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDF85D1CA3B
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Nov 2024 07:16:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zAcG4U16bKQFhsKkGG7xv5CA4zm+IXs3PR2YUVCjODs=; b=oH8OajPilynCLXekJ/EfEqoQhN
	uJU52gC2OXHFK2tCFWbfq74jA87BQLH1zbusqnH4zpYRczgLMjRQ4C5FFDXyD2+j+Ua9E5/Y/Haf+
	V+oBEj1AJ9Fo+aTfB5Jc/sASNr1xJkYJ5fKilx2Mb+Spq8k5rl5TQrRSXf81C5KLnewh8EfLhYU/T
	rV1pF+GTufj3BmfD0dPnvRxDGou6opfxdIXMB127chdZQNN0AaASqKlolsrGB3CIKw0mlUlRUkGwz
	61f7Y2WztcPzJuIHWk6j6nNlpybXZyykSrSc6bxZ+irItUlWSFPFcewjLoIdi0BSnzzVkrTcNqoK0
	GgstnxnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8DnN-0000000GAPx-2lCv;
	Tue, 05 Nov 2024 07:16:09 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8DnH-0000000GANu-0ILV
	for linux-mediatek@lists.infradead.org;
	Tue, 05 Nov 2024 07:16:07 +0000
X-UUID: ce18d1849b4511ef9048ed6ed365623b-20241105
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=zAcG4U16bKQFhsKkGG7xv5CA4zm+IXs3PR2YUVCjODs=;
	b=O870lpWyidL/WFC6DsVKeL6nyWmMqPC8Ff26N89qbLwZJm8myZtOVC0uQLB6IWBaKvrr3u1g47Ul8zUgboR1hHiYQhqQBqC5XDrygpG2AGeYzLDaDeV30xUV/wRtfFtlNwLvZuJSLDQi1wr+O1fgVz+We+8eSffC1P3vpKeAozw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.42,REQID:fca3ed21-6f8a-4c79-8d06-57bb0c21ba6d,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0fcdc3,CLOUDID:5bccb548-ca13-40ea-8070-fa012edab362,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: ce18d1849b4511ef9048ed6ed365623b-20241105
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <yr.yang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1414321162; Tue, 05 Nov 2024 00:15:58 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 5 Nov 2024 15:15:52 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 5 Nov 2024 15:15:52 +0800
From: yr.yang <yr.yang@mediatek.com>
To: <linux-firmware@kernel.org>
CC: <linux-mediatek@lists.infradead.org>, <shawnku@google.com>
Subject: pull request: linux-firmware: Add sof-tplg for mt8195
Date: Tue, 5 Nov 2024 15:12:52 +0800
Message-ID: <20241105071549.17476-1-yr.yang@mediatek.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--1.568900-8.000000
X-TMASE-MatchedRID: /IY58nGWDe4eMlyElPeCGC0x8J2DopENXXbpPagZMfcR34ro7k23nZgC
	Mlq+sZ+fKyIRzcIhtVlwE7IPDDg1SB8TzIzimOwPlpYqKNmWxsHZs3HUcS/scCq2rl3dzGQ1Gpe
	evGsoI5fxYVW9Dt9xPAALbFkH3VDIHvkNQnA1c2mCCcS+AMQypYLqKlN9pJTaQGswJytg1/k5cF
	bcyjLLWi3d7VyUb1gvvvfQgwBZV59pp55fZDlsr34cY/B7JqXaYZ1R7NXn0MdBmmCXcKyFFH7cG
	d19dSFd
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--1.568900-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: E4CA96BD09B3A63677EE62CB0E07DB498613047871E9C7BE21BD98C91B753EBC2000:8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_231603_138797_5A48F650 
X-CRM114-Status: UNSURE (   6.54  )
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

The following changes since commit 8dbcf94bfc68bdb1c6df3a42762b275557095558:

  Merge branch 'robot/patch-0-1729102102' into 'main' (2024-10-17 15:40:04 +0000)

are available in the Git repository at:

  https://github.com/mtk13576/sof_tplg adspsof

for you to fetch changes up to 7fbd03699a95b0624f26da4dbb00019669b9bed9:

  WHENCE: Add sof-tolg for mt8195 (2024-11-05 14:43:15 +0800)

----------------------------------------------------------------
YR Yang (1):
      mediatek: Add sof-tolg for mt8195

yr.yang (1):
      WHENCE: Add sof-tolg for mt8195

 WHENCE                                                   |   3 +++
 mediatek/sof-tplg/sof-mt8195-mt6359-max98390-rt5682.tplg | Bin 0 -> 16191 bytes
 2 files changed, 3 insertions(+)
 create mode 100644 mediatek/sof-tplg/sof-mt8195-mt6359-max98390-rt5682.tplg


