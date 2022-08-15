Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D81AC00140
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Aug 2022 10:02:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:Date:CC:To:From:Subject:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Mi+Gi9iTKDF5VQ28kqgllLcvUnQ8Tb329H1uS9EjtlE=; b=PAqf/BEFPuXLUSBDMW7RirLCTd
	sg447EP4YZzl12/KwkiamLjMWP8rAuV/qST3mt9SUm3FbiG+6ALPTq8cTgPVxRkn31SqtxiCF/jzE
	KCYj1uFHHUWwWsn2ARcW0HXHneKi9tRg2w4qpoNil2BPE6deSEgi6AsGwqhhMnLQ0VGF4K+W3Of+n
	dGZk0Ic/Qtk9/TEWwp9MMSvELmRHbIMkYPhCwnyA5NMoK6LDJnM5AXd0z/usnQdrhS6MJBW6ByUvW
	4LEbYKKXeP1hlUSOWwzx8fV0S/zsjpnoEiPAo8V9jHlrpXBIs3BJVefpNNmOphQDamrPqWO4zJmlR
	0DtKhIuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNWuu-00EK1b-Kj; Mon, 15 Aug 2022 10:01:52 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNWnR-00ED0i-DI
	for linux-mediatek@lists.infradead.org; Mon, 15 Aug 2022 09:54:21 +0000
X-UUID: 8fbf04ccd1b84b0fab1d81ea55164a71-20220815
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:Date:CC:To:From:Subject:Message-ID; bh=Mi+Gi9iTKDF5VQ28kqgllLcvUnQ8Tb329H1uS9EjtlE=;
	b=ompUNrqlFCQ1HnnPRMJloeFlT0SfAQyDinwJCGlcK4tYGyc/+w1IdkDZwtNo6QkwPtrW0/21DApgukeljawR7iLVV9J68jUDRgo4TQDXK7dZTC75cw6hPD1SfAVQlRQ7k1KoFSlJv2nOo2sXNbTvZ4pxuRTIanMyIfdU0f1i1YQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.9,REQID:7b2f53a9-6bb2-466e-8aad-3b720600de68,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_
	Ham,ACTION:release,TS:-5
X-CID-META: VersionHash:3d8acc9,CLOUDID:b6beb29c-da39-4e3b-a854-56c7d2111b46,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 8fbf04ccd1b84b0fab1d81ea55164a71-20220815
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <tinghan.shen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 98786931; Mon, 15 Aug 2022 02:54:00 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Mon, 15 Aug 2022 17:13:23 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 15 Aug 2022 17:13:23 +0800
Message-ID: <bee56d689e67b4bb4d46d14d07e93ab212a6bb6b.camel@mediatek.com>
Subject: [PULL linux-firmware] mediatek mt8186 SOF firmware v0.2.0
From: Tinghan Shen <tinghan.shen@mediatek.com>
To: <linux-firmware@kernel.org>
CC: <linux-mediatek@lists.infradead.org>, <chunxu.li@mediatek.com>,
	<allen-kh.cheng@mediatek.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Mon, 15 Aug 2022 17:13:23 +0800
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220815_025409_547936_3924501C 
X-CRM114-Status: UNSURE (   8.50  )
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

Hi maintainers,

This pull request adds new MediatekTek firmware for MT8186 SOF.

Please let me know if there are any problems.

Best regards,
TingHan

---

The following changes since commit ad5ae82019480dc1feffb538c118397a40934e62:

  Merge branch 'main' of https://github.com/suraj714/BT-Upstream (2022-08-10 07:58:34 -0400)

are available in the Git repository at:

  https://github.com/tinghan-shen/linux_fw_scp mt8186-sof-20220815

for you to fetch changes up to 12ca0753342651fa2ab640deffde5e51b0dd9868:

  mediatek: Add new mt8186 SOF firmware (2022-08-15 16:43:11 +0800)

----------------------------------------------------------------
Tinghan Shen (1):
      mediatek: Add new mt8186 SOF firmware

 WHENCE                                              |  21 +++++++++++++++++++++
 mediatek/sof/sof-mt8186-mt6366-da7219-max98357.tplg | Bin 0 -> 16191 bytes
 mediatek/sof/sof-mt8186-mt6366-rt1019-rt5682s.tplg  | Bin 0 -> 16191 bytes
 mediatek/sof/sof-mt8186.ri                          | Bin 0 -> 128712 bytes
 4 files changed, 21 insertions(+)
 create mode 100644 mediatek/sof/sof-mt8186-mt6366-da7219-max98357.tplg
 create mode 100644 mediatek/sof/sof-mt8186-mt6366-rt1019-rt5682s.tplg
 create mode 100644 mediatek/sof/sof-mt8186.ri




