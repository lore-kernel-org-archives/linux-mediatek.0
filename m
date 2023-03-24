Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9572C6FD20
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Mar 2023 10:12:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Qvnagfc0tiYt5NldRZqfyp+ajccQr8eiBxiShG+FP7Y=; b=tYp4I9iatGNREuereTt2+/tBHq
	B4ER4YGzuu8lKxQJC8xatf9jmu+tZyXXN0zd1Acn9PDdJuizrWLkVGDjM3xrc7hHJJtCfFZwqn2NJ
	Zu0rbPHDG9jFdKBJ5636LLf3ucci4xv+smHaHknEL5elAnHbfe5bdr/3fIa5gRpTyEujo4oopcG2R
	JeGkNlpn533bhKCfz50qgBCenrHwFhKRk5XpJO4zCh9KN2qDP97e02e/1bE7O/4KiX7duxEB6JFfD
	rcudUncum9nNQ+dATRzZPJ0KNfdDiosWJKe8MOl9ZTFubb4Is8uq+TmOzQyrPI6gxJlBu6C3l2jR7
	Isy+nzJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfePK-0047cz-0P;
	Fri, 24 Mar 2023 10:12:26 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfePB-0047Xo-2i;
	Fri, 24 Mar 2023 10:12:19 +0000
X-UUID: 576f7bbeca2c11edb7d8d11f642b8e78-20230324
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=Qvnagfc0tiYt5NldRZqfyp+ajccQr8eiBxiShG+FP7Y=;
	b=PkXD6dOkkaxvzYH6PMQ7hruFBry+K2lOxQndUOOaI9qPbz0LdL0alOV5PqNMRTjjm6k1Cx01Ee1G0Uv0235UHcRocv4YwZ5sNj+YKmAcLoh75FSEk+3cuNUtb9qwPoTiiRVnpElj2NWPt7/4tX+4WUzbiMWwI75fW003+ENAoEo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.22,REQID:cb8625b3-5cdb-46a4-be75-ca929f44fc6f,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:120426c,CLOUDID:53896229-564d-42d9-9875-7c868ee415ec,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-UUID: 576f7bbeca2c11edb7d8d11f642b8e78-20230324
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <jia-wei.chang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1679370672; Fri, 24 Mar 2023 03:12:11 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Fri, 24 Mar 2023 18:11:33 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Fri, 24 Mar 2023 18:11:33 +0800
From: jia-wei.chang <jia-wei.chang@mediatek.com>
To: "Rafael J . Wysocki" <rafael@kernel.org>, Viresh Kumar
	<viresh.kumar@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Kevin
 Hilman <khilman@baylibre.com>, Rex-BC Chen <rex-bc.chen@mediatek.com>,
	Jia-Wei Chang <jia-wei.chang@mediatek.com>
CC: <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, <hsinyi@google.com>,
	Nick Hainke <vincent@systemli.org>, Dan Carpenter <error27@gmail.com>
Subject: [PATCH v2 0/4] Enhance mediatek-cpufreq robustness
Date: Fri, 24 Mar 2023 18:11:26 +0800
Message-ID: <20230324101130.14053-1-jia-wei.chang@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230324_031217_879531_8981DC1A 
X-CRM114-Status: UNSURE (   7.71  )
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

From: "Jia-Wei Chang" <jia-wei.chang@mediatek.com>

MediaTek cpufreq driver has some reported problems required to be fixed.

Change since v1:
- Fix error handling in patch [2/3] in a way of "Free the Last Thing
  Style". Refine its commit message tag.
- Remove the change for MT7622/7623 platform data in the patch [3/3].
- Add the patch for MT7622/7623 platform data [1] in this series.
[1]: Message ID: 20221202095227.167492-1-angelogioacchino.delregno@collabora.com/

Tested on:
MT8186 Platform (kernel v5.15)

AngeloGioacchino Del Regno (1):
  cpufreq: mediatek: Raise proc and sram max voltage for MT7622/7623

jia-wei.chang (3):
  cpufreq: mediatek: fix passing zero to 'PTR_ERR'
  cpufreq: mediatek: fix KP caused by handler usage after
    regulator_put/clk_put
  cpufreq: mediatek: raise proc/sram max voltage for MT8516

 drivers/cpufreq/mediatek-cpufreq.c | 98 +++++++++++++++++-------------
 1 file changed, 57 insertions(+), 41 deletions(-)

-- 
2.18.0


