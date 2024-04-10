Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 984F6CD11C2
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Apr 2024 11:24:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=k2vJZvzXPWAch/3DrDdHKVno+X2M7Z03bzv0+J14OPA=; b=28yOcKKgRulF+GV8Z0U8NXXx2q
	FRefedsQrBSLtUJiLJs+kdLqXS00BXrxzpS/bhKSGJMulqKPFlJd9D47GdioKoPqWw0GRz0xSK1q9
	YvwrFVpqZCX3Jz2bvxLRoHIhUvw4RdwZTmLuD11mVVXiKAaqH3jpgA5xcaJEeC1j5IEMNefmeZyC6
	9bU3ZqcnYktP3ytMv4NOUllBKB3lr49nFD4rErPKDCcZoxW7GEN4Ze90lZdu3YR1KngqUlxMCeW+g
	ju2+G7huz94QAU+6p553fwzaYgpdQmXMaOn6TmQG1BRRwfJHqAU7mGNAZ3vApwRZF5xD74nz7VClx
	9w03TzLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruW4G-00000006b11-3ZbV;
	Wed, 10 Apr 2024 11:24:40 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruW4C-00000006aze-3z6u;
	Wed, 10 Apr 2024 11:24:38 +0000
X-UUID: e4de26b6f72c11eeac1957ae9f99f617-20240410
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=k2vJZvzXPWAch/3DrDdHKVno+X2M7Z03bzv0+J14OPA=;
	b=VVpmsGNkpprCLcHsYuxZaAF2IP1m2K2dfGLZvaRabzwWfS6oF3/F2lvf4pmF7ysa5e85gaDX7GQbdTrLk4Xsc1+/JqJJ6UU9Co5gpI6uJqwhH80CQdJ2YvCA+rSBCgk3xy5nKZhEGRNMP/7oFMPROrH1NO86sFHmDupTbONj2O4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.37,REQID:11c73e71-c8a1-43c1-a507-7ba2e3258d8f,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:6f543d0,CLOUDID:42e90386-8d4f-477b-89d2-1e3bdbef96d1,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 50,UGT
X-CID-BAS: 50,UGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: e4de26b6f72c11eeac1957ae9f99f617-20240410
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <irui.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1662268863; Wed, 10 Apr 2024 04:24:28 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS14N2.mediatek.inc (172.21.101.76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 10 Apr 2024 19:14:19 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 10 Apr 2024 19:14:18 +0800
From: Irui Wang <irui.wang@mediatek.com>
To: <linux-firmware@kernel.org>
CC: <linux-mediatek@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-media@vger.kernel.org>,
	<Longfei.Wang@mediatek.com>, <Yunfei.Dong@mediatek.com>,
	<Andrew-CT.Chen@mediatek.com>, <tiffany.lin@mediatek.com>,
	<irui.wang@mediatek.com>, <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: pull request: linux-firmware: mediatek: Update MT8173 VPU firmware to v1.1.9 
Date: Wed, 10 Apr 2024 19:14:15 +0800
Message-ID: <20240410111416.2204-1-irui.wang@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--2.122600-8.000000
X-TMASE-MatchedRID: lT3Pays+ayfPOb61tmLEGoSvKOGqLLPK/kqO2xYqX5aqG/oAv7EtlT3O
	m/10wG4m94kvTNM1tWePFrrIuZSCCl/ag3kgZsCOngIgpj8eDcBpkajQR5gb3savT21DsLD/UEh
	Wy9W70AFYF3qW3Je6+5hOxoM3JPyDViork/Gnty5YDTpkwiF+IbKEF54avyFSFjGYDTSgk1Ilyt
	ehiG+vxvLpWv+Ui6RSioz9IaWL7lI2eTwdZT29r4SVUZZHNLr+RgV6Hsqyx11QaONuZ6Jr4g9k3
	l8EaYIcovpDXVQHzIN+3BndfXUhXQ==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--2.122600-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: F31CA27B66CB61F2B24F8A3F80638668CD75F6C8AB4F1C27A8621BFD9E74AACF2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_042437_478439_EFEE3F98 
X-CRM114-Status: UNSURE (   6.78  )
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

Dear linux-firmware maintainers,

The following changes since commit 1addd7dca2d953a5484c3e3c08dbd7dc253058dd:

  Merge branch 'rtw' into 'main' (2024-04-09 12:30:28 +0000)

are available in the Git repository at:

  https://github.com/irui-wang/linux_fw_vpu_v1.1.9.git v1.1.9

for you to fetch changes up to c81f094c847d934c0ffe0870fa5cf861c62e3451:

  linux-firmware: mediatek: Update MT8173 VPU firmware to v1.1.9 (2024-04-10 18:36:10 +0800)

----------------------------------------------------------------
Irui Wang (1):
      linux-firmware: mediatek: Update MT8173 VPU firmware to v1.1.9

 mediatek/mt8173/vpu_d.bin | Bin 2977184 -> 2977184 bytes
 mediatek/mt8173/vpu_p.bin | Bin 131380 -> 131380 bytes
 2 files changed, 0 insertions(+), 0 deletions(-)



