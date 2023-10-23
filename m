Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBE12CDB474
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Oct 2023 10:15:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Qmbr2w5tujfuurOZRA3SRLMQeRjiZeSosCGmD3RvDX0=; b=J16geGI2LZZSIddOBgc98h6ZaU
	Hk4pcHAJ6xaEV94DLTzD3Gf92Tw2gemIAur1uc7KoJB7qtPkfq5IDkt6pw5zMVM2aOU2VLePjUGef
	DkDDPovAOxVXMCv4i2eXRu87Y+xaaFYsgs6dqUTcmRBOdy/tUuTUuSeInMO54ZgSCsM3d39bcQZsj
	o+RTlg3iF7bB3f+wKTRlhmJflKHKmyzAu4LTfzISGMtgqkM7IDVh4JY2mrVdz38hxtYwb8ih0NKy0
	fnaHzKdh/q1NnaAVg6iIiN5G5JCbtA6OsDxeHQJByRM5F2NFEd/JpCccS3U+qtJf333bV0AwdUMZk
	tBhAwVuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1quryQ-0070g9-1f;
	Mon, 23 Oct 2023 10:15:50 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1quryO-0070ff-0c;
	Mon, 23 Oct 2023 10:15:49 +0000
X-UUID: 2097a95a718d11ee9b7791016c24628a-20231023
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=Qmbr2w5tujfuurOZRA3SRLMQeRjiZeSosCGmD3RvDX0=;
	b=lelYArMj6Z8CYRXKqWwADfGZFFDv+nvM/JZBlhCGHlOy+uCCvI6nkZIL07jJwtkmqIjo5uL2zDB7gTt8Zd2Yp4+B3BB+9r1sIBmmCI/R18oOd0o19Wgtf+E6m7QE1j1ZpdEqkPndQy3CevCr9mGTOK9v9vt7jXdccUvhM3n1B+U=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32,REQID:2cb05d1a-92c6-49d4-8e74-981c2c9e9b62,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:5f78ec9,CLOUDID:b3880b7d-ccd9-4df5-91ce-9df5fea3ae01,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 2097a95a718d11ee9b7791016c24628a-20231023
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <maso.huang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 990757635; Mon, 23 Oct 2023 03:15:44 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 23 Oct 2023 17:55:07 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 23 Oct 2023 17:55:07 +0800
From: Maso Huang <maso.huang@mediatek.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, <alsa-devel@alsa-project.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>
CC: Maso Huang <maso.huang@mediatek.com>
Subject: [PATCH 0/2] ASoC: mediatek: Remove redundant code and add sample rate checker of MT7986 SoC
Date: Mon, 23 Oct 2023 17:54:51 +0800
Message-ID: <20231023095453.4860-1-maso.huang@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--1.888400-8.000000
X-TMASE-MatchedRID: 1cUIhvZrMEAyRohotsnq51z+axQLnAVBojQrbrPpzzptJv7x/D93bILy
	KdE2c/PXKi8kfHJWoY+gVbxI8zQaQh8TzIzimOwP0C1sQRfQzEHEQdG7H66TyN+E/XGDLHcM5H4
	ky09s9NKNLGOuO04vodSYd3t+km3SiC7Dlcya3aYyzYzUVqX0RXmVKZusLp922v9OjYWA2uMMsw
	g45VMfPadst5iAforfVlxr1FJij9s=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--1.888400-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 5C758EFB01D13D8E60F6A8BE080B9F24FB0F074251EB3EF620CBB287C29401A22000:8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231023_031548_237627_F1AA1E83 
X-CRM114-Status: UNSURE (   5.48  )
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

1. Remove redundant remove function.
2. Add sample rate checker.
Patches are based on broonie tree "for-next" branch.

Maso Huang (2):
  ASoC: mediatek: mt7986: remove redundant remove function
  ASoC: mediatek: mt7986: add sample rate checker

 sound/soc/mediatek/mt7986/mt7986-dai-etdm.c | 22 +++++++++--
 sound/soc/mediatek/mt7986/mt7986-wm8960.c   | 43 ++++++---------------
 2 files changed, 30 insertions(+), 35 deletions(-)

-- 
2.18.0


