Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 320F2C61DA4
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 Jan 2023 02:00:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WJYXLBX/n/oH+RscWZpywMvfmWqQoxEHuehKlop3feY=; b=XhIOPYy5MLHBAJjXtVwLxK6zh8
	qC2bXGtwjWRBbxuRK0CzKwXVF4O8mJyeGWiYxkEr8aU7g+flXLlz+HABJ9/imygLVTmI5UKJ9tk4A
	MgbNVm2xLS/ftLRQ1lL2PK7CiXa4Ky1ONd/d0vdiZqPw1nNp4ruhbUGaS758FgMvFbiQ1worFY9CW
	Y8rwpa2jCGRrebjvDTQTye4WWv+JJOiy4SeZsrkP740wpKpJtS7rdpKkrQ6ME8NPnm96b6R5VFvtV
	yXiXc2cF+muf4O/F+YfwY0eOmf00IcOCzqHf67Z5A3AttBa7Q+uCRy/ZKMINGn+4zUL619KkFfOeo
	3G9Wbl0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMfwJ-0062R8-6x; Tue, 31 Jan 2023 02:00:03 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMfwH-0062Ps-30; Tue, 31 Jan 2023 02:00:02 +0000
X-UUID: f4e8f456a10a11edbbe3f76fe852e059-20230130
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=WJYXLBX/n/oH+RscWZpywMvfmWqQoxEHuehKlop3feY=;
	b=QZhxSHGyJX4kFS6bhvcMoqITURSAxh7H3nFwucSWt8tggqmXTl4ZWYJpmpAFZiVHgYh8gCRYcmoNkCCzIz4XMHO1nTq6QjxvoOW3W2HF65aQ6Opid87WL+137DT+GIJ/QfZ3qLPlgjfFFEHAcbh0q/xl0Zd5bIjRqe3WKAMHYMs=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.18,REQID:516d4927-f951-4db2-970e-1ef170778313,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:3ca2d6b,CLOUDID:af6f678d-8530-4eff-9f77-222cf6e2895b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
X-CID-BVR: 0
X-UUID: f4e8f456a10a11edbbe3f76fe852e059-20230130
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <xinlei.lee@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 406101259; Mon, 30 Jan 2023 18:59:54 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Tue, 31 Jan 2023 09:59:21 +0800
Received: from mszsdaap41.gcn.mediatek.inc (10.16.6.141) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Tue, 31 Jan 2023 09:59:21 +0800
From: <xinlei.lee@mediatek.com>
To: <chunkuang.hu@kernel.org>, <p.zabel@pengutronix.de>, <airlied@linux.ie>,
	<daniel@ffwll.ch>, <matthias.bgg@gmail.com>,
	<angelogioacchino.delregno@collabora.com>, <jitao.shi@mediatek.com>,
	<thierry.reding@gmail.com>, <sam@ravnborg.org>
CC: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Xinlei Lee
	<xinlei.lee@mediatek.com>
Subject: [PATCH v3 0/2] Reduce lcm_reset to DSI LP11 send cmd time
Date: Tue, 31 Jan 2023 09:59:17 +0800
Message-ID: <1675130359-24459-1-git-send-email-xinlei.lee@mediatek.com>
X-Mailer: git-send-email 2.6.4
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230130_180001_139869_4D6B8E34 
X-CRM114-Status: UNSURE (   9.45  )
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

From: Xinlei Lee <xinlei.lee@mediatek.com>

The panel spec stipulates that after lcm_reset is pulled high, cmd
should be sent to initialize the panel. Within the allowable range of
the DSI spec, this time needs to be reduced to avoid panel exceptions.

Base on the branch of linus/master v6.2.

Change since v2:
1. Remove the applied patch.
2. Change the commit title and the description.

Change since v1:
1. Added fine-tuning panel power sequence modification.

Xinlei Lee (2):
  drm/panel: boe-tv101wum-nl6: Reduce lcm_reset to send initial code
    time
  drm/panel: boe-tv101wum-nl6: Fine tune the panel power sequence

 drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

-- 
2.18.0


