Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80D00C25B08
	for <linux-mediatek@archiver.kernel.org>; Sat, 20 Aug 2022 07:59:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hxId8EXkM6wL6taHhHYAwb9icvQWKyVr7gitqZ85vRA=; b=3hUsU8AD6i82gQxi4AdncHIPqy
	KVRWOFSVGFff8jQsOqUHbzP93qr6YMup/XKb24jOGCH1YVVgX/c2wGmGhceQ9fzTfyPpO+NtW+2uT
	v+dVySlGVcYhxjxkMyQ4BVnxCF0WM7RI3vIyE2ne7ONkInMJhr5Rv4rooQF5SnX4lypCu23urhpXc
	xE+OM+D8MFWZMF105zKSxBKvrBU/zLojmBaEbipJOb3fCD8RlIhgJVJ2E0fjuqURxFOFA+o71rsM/
	LSen5eBRPF+sv8omaTL+5r7evbTuzIdkg8gtBhAgqyVbNjwMppXG/GfTPG1QVeVEeE/oj/fBTtMye
	uWkL4tuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oPJOO-004ZOX-6W; Sat, 20 Aug 2022 07:59:40 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oPJOK-004ZJi-Nj; Sat, 20 Aug 2022 07:59:38 +0000
X-UUID: 88d1fda1f35c4aed8bd6aa35f62d6a25-20220820
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=hxId8EXkM6wL6taHhHYAwb9icvQWKyVr7gitqZ85vRA=;
	b=UJOWq4Gvy33zmYhK7KTufvngHXsL/0GawYr8PRLPmHHAECjYIp1XM/0C30jHZhpNoRxDReHE8KHCDvwmITzhMRftdCcNG5VUiCFl+kj6ZNK36bJi2gBjnOWvJ9oJF0iNJVkz2Qo/eI/KtsoUwsQt88Jy4y5kZnIm9Bdki7MluaE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10,REQID:80c118c7-2004-41f4-8343-2a1ece2fefc2,OB:0,L
	OB:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_
	Ham,ACTION:release,TS:0
X-CID-META: VersionHash:84eae18,CLOUDID:087bc567-a9d9-4672-a3c8-12721739a220,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 88d1fda1f35c4aed8bd6aa35f62d6a25-20220820
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <jiaxin.yu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1639511311; Sat, 20 Aug 2022 00:59:30 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Sat, 20 Aug 2022 15:19:26 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 20 Aug 2022 15:19:26 +0800
From: Jiaxin Yu <jiaxin.yu@mediatek.com>
To: <broonie@kernel.org>, <angelogioacchino.delregno@collabora.com>
CC: <chunxu.li@mediatek.com>, <alsa-devel@alsa-project.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Jiaxin Yu
	<jiaxin.yu@mediatek.com>
Subject: [PATCH] ASoC: mediatek: mt8186: fix DMIC record noise
Date: Sat, 20 Aug 2022 15:19:25 +0800
Message-ID: <20220820071925.13557-1-jiaxin.yu@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220820_005936_808957_1418ED15 
X-CRM114-Status: UNSURE (   7.34  )
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

When the first DMIC recording is power down, mtkaif_dmic will be reset.
This will cause configuration error in the second DMIC recording. So do
not reset mtkaif_dmic except in "MTKAIF_DMIC Switch" kcontrol.

Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>
---
 sound/soc/mediatek/mt8186/mt8186-dai-adda.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/sound/soc/mediatek/mt8186/mt8186-dai-adda.c b/sound/soc/mediatek/mt8186/mt8186-dai-adda.c
index 266704556f37..094402470dc2 100644
--- a/sound/soc/mediatek/mt8186/mt8186-dai-adda.c
+++ b/sound/soc/mediatek/mt8186/mt8186-dai-adda.c
@@ -271,9 +271,6 @@ static int mtk_adda_ul_event(struct snd_soc_dapm_widget *w,
 		/* should delayed 1/fs(smallest is 8k) = 125us before afe off */
 		usleep_range(125, 135);
 		mt8186_afe_gpio_request(afe->dev, false, MT8186_DAI_ADDA, 1);
-
-		/* reset dmic */
-		afe_priv->mtkaif_dmic = 0;
 		break;
 	default:
 		break;
-- 
2.25.1


