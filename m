Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17424C28D13
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Aug 2022 07:05:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6GuUro5qIlUHirZ1NQir7sOfvYDYHGHkP5HZ51CeuWg=; b=fofMPD9W+ZFNf77IUicfsiTrVy
	t3JHKeO/K35ZPX2RBZidGGrBUQ9ZGfZi2C7Y2Nn7PHr9e4HW0xkgg1d12Dni35cdYSCdqepl1w+57
	V/ypwnZJyTsc1X2O3DTLYR/E1eOA58PjeY4wbwYsCWPcOULPY3td5KvgmFAKl9TXWoTwh5vBjnQSm
	4u/ZpafjsObNwetCRYBGEosxi416v9pvlj2jZ4mN1XxCXyRudkLbNqIDu79j0C9uI4Z1VesaEd5Xt
	Ja8PVraFRqhNTLyowRy5HVNfaLtd9fj9GZWGYKooHSS0X9IN1pGHEia7/Wy3Y73zRbpxIJLpwFnaY
	MgMh6Xig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oR6vH-008Pz1-7J; Thu, 25 Aug 2022 07:05:03 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oR6vE-008Pku-N5; Thu, 25 Aug 2022 07:05:02 +0000
X-UUID: a1b5b938b57f4ff09c6867fd45ef1921-20220825
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=6GuUro5qIlUHirZ1NQir7sOfvYDYHGHkP5HZ51CeuWg=;
	b=HsTdFNr6trkpUbgYTstZ9vZT2medPEl3/ZWODx1wMtetMPak/+/+AtxGGMjjVvWbFqZ8hDiEySfxOK7S3efBCkGGNHkb6BdnjDzLC+AQWeGaXCKF96XyZ+l0KEQK5EdkeP2RwpU7twnkOJfh7zyNpdyzCEM1K+zi7IIQRlFx2yI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10,REQID:1b8dbf01-ea88-4ac7-a991-98672eeaa124,OB:0,L
	OB:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_
	Ham,ACTION:release,TS:0
X-CID-META: VersionHash:84eae18,CLOUDID:331391cf-20bd-4e5e-ace8-00692b7ab380,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: a1b5b938b57f4ff09c6867fd45ef1921-20220825
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <chunxu.li@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1479357338; Thu, 25 Aug 2022 00:04:52 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 25 Aug 2022 14:54:15 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Thu, 25 Aug 2022 14:54:14 +0800
From: Chunxu Li <chunxu.li@mediatek.com>
To: <broonie@kernel.org>, <pierre-louis.bossart@linux.intel.com>,
	<peter.ujfalusi@linux.intel.com>, <lgirdwood@gmail.com>,
	<angelogioacchino.delregno@collabora.com>, <daniel.baluta@nxp.com>
CC: <matthias.bgg@gmail.com>, <yc.hung@mediatek.com>,
	<linux-kernel@vger.kernel.org>, <alsa-devel@alsa-project.org>,
	<sound-open-firmware@alsa-project.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<project_global_chrome_upstream_group@mediatek.com>, Chunxu Li
	<chunxu.li@mediatek.com>
Subject: [PATCH 0/3] ASoC: SOF: mediatek: update SOF driver for mt8186
Date: Thu, 25 Aug 2022 14:54:08 +0800
Message-ID: <20220825065411.31279-1-chunxu.li@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220825_000501_029252_E362CCCC 
X-CRM114-Status: UNSURE (   6.08  )
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

In these patches, we update SOF driver for mt8186

Chunxu Li (3):
  ASoC: SOF: mediatek: Add dai driver for mt8186
  ASoC: SOF: mediatek: add snd_sof_dsp_ops callbacks for pcm and mail
    box
  ASoC: SOF: mediatek: Use generic implementation for .ipc_msg_data
    field

 sound/soc/sof/mediatek/mt8186/mt8186.c | 49 ++++++++++++++++++++++----
 1 file changed, 42 insertions(+), 7 deletions(-)

-- 
2.25.1


