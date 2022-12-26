Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54437C3DA79
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Dec 2022 09:43:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wO/YlaAH2Y8g68ssS2G0vi1odeG2J8FOazjyVtZ7WaE=; b=WtMhhdc80qwqYj5jGHsXss/mOc
	i3hrHzUe9xxN/tOPVH4e+5Wp1G+kfrbEo3iFcGjW+Lqz7dZ3nVd7HCjXIbq6E9mqlMOTl/cNCeJNk
	9/UfhaIUs1GZ6bQvq4Bniot32qDN3xhtI+pPmzwOY9Q3MWANlDmkPZV0V3k4ZKIGwUmgtmBBQggpj
	+1QmOrVynh4bDStGj1Uqwoc6SIgCjfqHBR804j7nEcmJmsGqZepzb06rB5zkjSfzEYufNBqSlWVe6
	lJ7swwVxqDCtlKUnPBtALguMZKj8HYm86LkcYruHupkohj1alFdejrK92X+Sq+S0xtwTo/DwUDCOI
	049GAUQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p9k0a-002u2I-7z; Mon, 26 Dec 2022 09:43:00 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p9k0W-002tyZ-NN; Mon, 26 Dec 2022 09:42:58 +0000
X-UUID: 9265273c86b94a3a89c2cbc96f980fac-20221226
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=wO/YlaAH2Y8g68ssS2G0vi1odeG2J8FOazjyVtZ7WaE=;
	b=OLDnyltbOD+xTBPL9FjUEBln8vxhHiSgFQuvsuIBTMOUv1kU78iWCfV+wN9UtB4PYCQe75+0OcW3pvBq5FgZfrfdS5cm1js1LN9aAzI5Nmpkc2+c6dF+wUrvkpKWWXrKZL/DKgz8ToC2eWsTDEYMuomWTiYawhUb499ZC+A7sH8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.14,REQID:6b7c0328-43e3-401d-92d9-1848de156719,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:dcaaed0,CLOUDID:d1166a8a-8530-4eff-9f77-222cf6e2895b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 9265273c86b94a3a89c2cbc96f980fac-20221226
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <roger.lu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1829516407; Mon, 26 Dec 2022 02:42:51 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Mon, 26 Dec 2022 17:42:49 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Mon, 26 Dec 2022 17:42:49 +0800
From: Roger Lu <roger.lu@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Enric Balletbo Serra
	<eballetbo@gmail.com>, Kevin Hilman <khilman@kernel.org>, Nicolas Boichat
	<drinkcat@google.com>
CC: Fan Chen <fan.chen@mediatek.com>, Roger Lu <roger.lu@mediatek.com>,
	Jia-wei Chang <jia-wei.chang@mediatek.com>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-pm@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v1 0/13] Enahance SVS's robustness
Date: Mon, 26 Dec 2022 17:42:35 +0800
Message-ID: <20221226094248.4506-1-roger.lu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221226_014256_804926_EA7D193E 
X-CRM114-Status: UNSURE (   6.80  )
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

SVS driver got accepted upstream but still has room to be improved.
Therefore, we add these patches to fix issues and coding style.

Matthias Brugger (4):
  soc: mediatek: mtk-svs: clean up platform probing
  soc: mediatek: mtk-svs: improve readability of platform_probe
  soc: mediatek: mtk-svs: move svs_platform_probe into probe
  soc: mediatek: mtk-svs: delete superfluous platform data entries

Ricardo Ribalda (1):
  soc: mediatek: mtk-svs: enable the IRQ later

Roger Lu (7):
  soc: mediatek: mtk-svs: use svs get efuse common function
  soc: mtk-svs: mt8183: refactor o_slope calculation
  soc: mediatek: mtk-svs: add main_clk check during system-wide suspend
  soc: mediatek: mtk-svs: use common function to disable restore
    voltages
  soc: mediatek: mtk-svs: restore default voltages when svs init02 fail
  soc: mediatek: mtk-svs: add thermal voltage compensation if needed
  soc: mediatek: mtk-svs: keep svs alive even though debug cmd create
    fail

Shang XiaoJing (1):
  soc: mediatek: mtk-svs: Use pm_runtime_resume_and_get() in
    svs_init01()

 drivers/soc/mediatek/mtk-svs.c | 279 +++++++++++++++------------------
 1 file changed, 124 insertions(+), 155 deletions(-)



