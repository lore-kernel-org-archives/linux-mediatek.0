Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD4E9C76196
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Apr 2023 06:05:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RHMG10ntLeYlRbI/eWA7wuZfKFUbLypz6+gPoLW2XTQ=; b=qF+OaOk4Vs38JA9LGNeCIupPXL
	QdtDgDYmgQFJ4Fell9Nvc9jt3hdZ1sP1fZIjiVdayayTkHmh9eO3eKT0kdJIKBaWoSWCJQPjhTiRD
	afeEk5LwxM5UV/95+BIYscwALbNKSCTU5uoR9q5flaUmbqFtw1yXOy16WlTBvQqPBeu6useH2f5bm
	A5yNMHm+LQuQ99LkeoqbrWlwlQH23bNRj9ee7hoIUSUKsiEMKQdLsPOVMtl3UeP2sgqy6L304PDv2
	cJ3cqV2y0OKdBim2Qe6ZF10LT9EPY5dUWYhJ4We/u0qz6XLZZcZfrWymCpptOgNl1sKF09In0YmCY
	8ymWhOPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pm77k-00GXDz-1C;
	Tue, 11 Apr 2023 06:05:00 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pm77h-00GXDT-1O;
	Tue, 11 Apr 2023 06:04:58 +0000
X-UUID: c606f04cd82e11edb7d8d11f642b8e78-20230410
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=RHMG10ntLeYlRbI/eWA7wuZfKFUbLypz6+gPoLW2XTQ=;
	b=U7XnS+xVz5eOMoxgL3l3ZXhPY09yaeSM1OAqFGZ9qdDKiTWzBdEcgf89IB36uu8+fdB4OJ/YJ0jMR770/qQOEjP4CP30o4g0JG8Lg/ifyoZQ+JgeI7ZTKvxk1Dz1LQM04+XFhvGNCBQkIo5ka63PiaMK09FjziEud3dE1Uuu+Bc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.22,REQID:e7ab5a8a-ec9a-4e55-bd61-fede59a7336d,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:120426c,CLOUDID:4e90a683-cd9c-45f5-8134-710979e3df0e,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-UUID: c606f04cd82e11edb7d8d11f642b8e78-20230410
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <irui.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1760929005; Mon, 10 Apr 2023 23:04:52 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Tue, 11 Apr 2023 13:54:15 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Tue, 11 Apr 2023 13:54:15 +0800
From: Irui Wang <irui.wang@mediatek.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<maoguang.meng@mediatek.com>, Yunfei Dong <yunfei.dong@mediatek.com>, "Irui
 Wang" <irui.wang@mediatek.com>
Subject: [PATCH v2, 0/2] fix coverity issues in encoder driver
Date: Tue, 11 Apr 2023 13:54:11 +0800
Message-ID: <20230411055413.539-1-irui.wang@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230410_230457_496465_49EB38E2 
X-CRM114-Status: UNSURE (   7.85  )
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

two coverity issues in encoder driver, submit two changes for fix them.

changes compared with v1:
- separate into two changes.
---

Irui Wang (2):
  media: mediatek: vcodec: make sure array index is in valid range
  media: mediatek: vcodec: make sure pointer isn't NULL before used

 .../platform/mediatek/vcodec/mtk_vcodec_enc.c    |  2 +-
 .../mediatek/vcodec/mtk_vcodec_enc_drv.c         | 16 ++++++++++++----
 2 files changed, 13 insertions(+), 5 deletions(-)

-- 
2.18.0


