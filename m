Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEB40C10F1B
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Dec 2022 12:39:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=m8+6n1e6RQmmFLnT3yJSrxkphZnpo8Y8/MUK4VmiN4E=; b=vrCc+jFI/dwp6eNVAM+qLmTVKJ
	5NnS/IaGVi9Pm7+ujuLJnrhRWjL0GeWngMOqmBNOtfJpcVuBBFUp0YllZSRJVjAIl4jRVVUC6JrZD
	3U5VlgB8gxUAf2sq90WuoaxOhm1rS6zEU58Iawpa99bduxEpfEOtT8cCCR5GYchxLwaP9DZ3TPNsY
	li7eCSRQ15yXix6ksbrtbi161nR/bnDvc+ZE1Kj+3Jk+1zriyUqfdOVk5opWHKajiSJjpJadXI93/
	dHMpkEVFgHS8/shltQwl3cTwFalpCB9UtCNbQnBf1h3Mr9WxoauAOE7QEdKe/l83P6YDfgxmc91Um
	sMXR6X5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pA9Ez-00CwIe-F4; Tue, 27 Dec 2022 12:39:33 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pA9Er-00CwEp-D7; Tue, 27 Dec 2022 12:39:28 +0000
X-UUID: daea146935a5463f8d81ad1d4c158405-20221227
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=m8+6n1e6RQmmFLnT3yJSrxkphZnpo8Y8/MUK4VmiN4E=;
	b=s+pAjSW3N4cgqEx+6c7udRkOaNgOfY9bVuzG6oFLUzf45WV61ZcXaNVwlBp4hfnVmv36rLN/p2M8jeaWVU4U//Ck9s/S/36ZlrA7mTvhDhqajLqoR8ETJ8lYxw/OwdIIQl7BXJiEALDmBBO+WVpKNoD7NfHeK8FUbU1c2ZkuCto=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.14,REQID:2650d180-aea4-4719-a439-d5a804e1f2b8,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:dcaaed0,CLOUDID:def4ee52-dd49-462e-a4be-2143a3ddc739,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: daea146935a5463f8d81ad1d4c158405-20221227
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <roger.lu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 394329710; Tue, 27 Dec 2022 05:39:20 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Tue, 27 Dec 2022 20:09:16 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Tue, 27 Dec 2022 20:09:17 +0800
From: Roger Lu <roger.lu@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Enric Balletbo Serra
	<eballetbo@gmail.com>, Kevin Hilman <khilman@kernel.org>, Nicolas Boichat
	<drinkcat@google.com>
CC: Fan Chen <fan.chen@mediatek.com>, Roger Lu <roger.lu@mediatek.com>,
	Jia-wei Chang <jia-wei.chang@mediatek.com>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-pm@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v2 0/13] Enhance SVS's robustness
Date: Tue, 27 Dec 2022 20:09:01 +0800
Message-ID: <20221227120914.11346-1-roger.lu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221227_043925_952211_885313CF 
X-CRM114-Status: UNSURE (   7.50  )
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

Change since v1:
- Reorder patch for helping readness
- Re-write patch [9/13] to fix the corner case issue
- Remove redundant codes in patch [13/13]

Matthias Brugger (4):
  soc: mediatek: mtk-svs: clean up platform probing
  soc: mediatek: mtk-svs: improve readability of platform_probe
  soc: mediatek: mtk-svs: move svs_platform_probe into probe
  soc: mediatek: mtk-svs: delete superfluous platform data entries

Ricardo Ribalda (1):
  soc: mediatek: mtk-svs: enable the IRQ later

Roger Lu (7):
  soc: mtk-svs: mt8183: refactor o_slope calculation
  soc: mediatek: mtk-svs: use svs get efuse common function
  soc: mediatek: mtk-svs: use svs clk control APIs
  soc: mediatek: mtk-svs: use common function to disable restore
    voltages
  soc: mediatek: mtk-svs: restore default voltages when svs_init02()
    fail
  soc: mediatek: mtk-svs: add thermal voltage compensation if needed
  soc: mediatek: mtk-svs: keep svs alive even though debug cmd create
    fail

Shang XiaoJing (1):
  soc: mediatek: mtk-svs: Use pm_runtime_resume_and_get() in
    svs_init01()

 drivers/soc/mediatek/mtk-svs.c | 341 ++++++++++++++++-----------------
 1 file changed, 167 insertions(+), 174 deletions(-)



