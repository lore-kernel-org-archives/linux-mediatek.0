Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 331A6C00A8F
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Oct 2023 03:50:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wpm4TcIB3OYOcCxJa54HMVXQ69ZhCLq/f+kuj+mgEDk=; b=Vj3iFRBVPqjug5ozS4kF+tCuGI
	dqoTJG36uBMF5rY6hapN+goMzBe5P2qNhqJed4WbLdOUhnzx7NumTrf7R0meISzbY8CT3TlQWS0DX
	X4YOMv6zd6ggnbi1juCFVPT86VlUqTV9QKW1xn4jtaCfLNn4GTavO85hkrwYUf3UiFZv3C9Q4x2YN
	10OSiysGvrw/+K4hekfcTmQarpi4kzxAzuA3uRShFQ62qlV/Q/s/qeDOJx1J7ySpQsC1cvUg8dr0L
	vsWpa4EqTUig6Iq8bCWOaVRUzwrIxE6vl5rborgqC7+Zo6TqovC25BFxYCfnr5mbqXSaJhrFZZhuo
	EpqXo3oQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qv8RM-008kBq-2D;
	Tue, 24 Oct 2023 03:50:48 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qv8RJ-008kAz-0k;
	Tue, 24 Oct 2023 03:50:46 +0000
X-UUID: 7f40c5fc722011ee9b7791016c24628a-20231023
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=wpm4TcIB3OYOcCxJa54HMVXQ69ZhCLq/f+kuj+mgEDk=;
	b=OLisONZAhE15Yk/OOpddBZ55G9gOYpuRkTjtM1fUGpvCqM/cf3jVqA4kyAdzANcRn7KdzIKtmweRBCEdtnskBgLZv2T/zvtAHF1g+TRDtjpG2sD9Ab39kULpLbdOVvuY5iUwPm4r1hOKM6G0AvM1Ddn9ujUfYmBO3YS6rmk5W1U=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32,REQID:a69a9857-93a6-4a4b-b9dc-5a10c686871c,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:5f78ec9,CLOUDID:1607b1fb-4a48-46e2-b946-12f04f20af8c,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 7f40c5fc722011ee9b7791016c24628a-20231023
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <maso.huang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 594396748; Mon, 23 Oct 2023 20:50:39 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 24 Oct 2023 11:50:35 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 24 Oct 2023 11:50:35 +0800
From: Maso Huang <maso.huang@mediatek.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, <alsa-devel@alsa-project.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>
CC: Maso Huang <maso.huang@mediatek.com>
Subject: [PATCH v2 0/3] ASoC: mediatek: Remove redundant code and add sample rate checker of MT7986 SoC
Date: Tue, 24 Oct 2023 11:50:16 +0800
Message-ID: <20231024035019.11732-1-maso.huang@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--4.037400-8.000000
X-TMASE-MatchedRID: ND/xO4uap3TenZYssfD30BIRh9wkXSlFsEf8CpnIYtlg5Pw7hhnE1UvI
	Gy2vt/IyXOz3YkNtdKDmV8c8W4k5T0kjllSXrjtQFEUknJ/kEl5jFT88f69nG/oLR4+zsDTt9xS
	3mVzWUuCMx6OO8+QGvjdtq08NA0w6mvlaUfZ1z1xs9QJGDvYulKmvGJXOTdgth1Bd9dxlZGe4RR
	Kx95f7QvcQlY+HGebAB8W3VqlZP4YB/+VWccgI2XmVKZusLp922v9OjYWA2uMMswg45VMfPadst
	5iAforfVlxr1FJij9s=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--4.037400-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 5C8626FAE56790049AE0ADA5E5774840D209DE1D7C0321B174A66BEE91DFBA6D2000:8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231023_205045_274548_4385B61F 
X-CRM114-Status: UNSURE (   7.12  )
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

Changes in v2:
 - devide v1 patch [1/2] into v2 [1/3] [2/3] with appropriate title and description
 - refine error log based on reviewer's suggestions [3/3]

1. Drop the remove callback of mt7986_wm8960.
2. Remove the mt7986_wm8960_priv structure
3. Add sample rate checker.
Patches are based on broonie tree "for-next" branch.

Maso Huang (3):
  ASoC: mediatek: mt7986: drop the remove callback of mt7986_wm8960
  ASoC: mediatek: mt7986: remove the mt7986_wm8960_priv structure
  ASoC: mediatek: mt7986: add sample rate checker

 sound/soc/mediatek/mt7986/mt7986-dai-etdm.c | 23 +++++++++--
 sound/soc/mediatek/mt7986/mt7986-wm8960.c   | 43 ++++++---------------
 2 files changed, 31 insertions(+), 35 deletions(-)

-- 
2.18.0


