Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C0D1C197A0
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Nov 2023 08:42:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6OWGdmPDtLYdunCwZiQeWtejrbXgW6HPimKj8ttk0XQ=; b=RHkLB2nyrNK2XDJc2YjPCvaFuQ
	woNhbqcJlww16u1nR7GcNMokGHGajicmnrZSPcHBsvJ1qkknohm4CT8pJSq48oHvzj/T7wkS85J8r
	zyJYpLdaHTBK4jxTPVx3C6oRzf4PPKy9zSgbZRpiKqVZ1Kge0HOMFR2jT4kkU49UUJZJOR6asAuQW
	UyTRo51hohfOe1VBPSZyhthkQ7GdPGAZYFzOUV7NigMYbdgBE6Ec5MmGV4Lgv9sVx3AZO46O+eNEw
	vi0lG+hR1t64DIwQ3Raf3Odf5sl5cH11QOF3o93MzApXCF14Vo9GpD6R4dhV1k+z++y0SnHMzWv57
	+oLW08hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r4zrp-00BXAz-13;
	Mon, 20 Nov 2023 08:42:53 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r4zrl-00BX9I-11
	for linux-mediatek@lists.infradead.org;
	Mon, 20 Nov 2023 08:42:50 +0000
X-UUID: c7872cb4878011ee9b7791016c24628a-20231120
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=6OWGdmPDtLYdunCwZiQeWtejrbXgW6HPimKj8ttk0XQ=;
	b=dEu/G+g9duW+cCAvtcicuSMlQP9N0Ew+YQmIaj+WxguXX2/U+Mz+DhvUtKakPaLNsQjbPRq4amVENg/Iu+m6s+DrHj3tyjiva5CAWuVAB30BVsmo0a6UfMILb2Vc+fFO/Bn9L1ZsmGFbONG3XVuJ6LDEQw4n1+l7iipCeuhU5DM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.33,REQID:9c6bb9f5-852e-46da-a4b0-29e15c88d775,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:364b77b,CLOUDID:88634260-c89d-4129-91cb-8ebfae4653fc,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: c7872cb4878011ee9b7791016c24628a-20231120
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <jason-ch.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1265627849; Mon, 20 Nov 2023 01:42:46 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 20 Nov 2023 16:42:10 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 20 Nov 2023 16:42:10 +0800
From: Jason-ch Chen <jason-ch.chen@mediatek.com>
To: <linux-firmware@kernel.org>
CC: <linux-mediatek@lists.infradead.org>, <yunfei.dong@mediatek.com>,
	<menghui.lin@mediatek.com>, <shawnku@google.com>
Subject: pull-request: linux-firmware: Update MT8195 SCP firmware to
Date: Mon, 20 Nov 2023 16:42:06 +0800
Message-ID: <20231120084207.830-1-jason-ch.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231120_004249_494170_8CBF7270 
X-CRM114-Status: UNSURE (   6.10  )
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

The following changes since commit 7124ce30ba82266e3972e99aacebeda712131d6f:

  Merge branch 'mlimonci/encoding' into 'main' (2023-11-17 16:54:55 +0000)

are available in the Git repository at:

  https://github.com/jason-ch-chen/linux_fw_scp 8195-v2.0.23033

for you to fetch changes up to a41fa7c5008809ae360ce0808e378b37b1d6c0f4:

  mediatek: Sync shared memory structure changes (2023-11-20 16:18:04 +0800)

----------------------------------------------------------------
Jason Chen (1):
      mediatek: Sync shared memory structure changes

 mediatek/mt8195/scp.img | Bin 635492 -> 635448 bytes
 1 file changed, 0 insertions(+), 0 deletions(-)



