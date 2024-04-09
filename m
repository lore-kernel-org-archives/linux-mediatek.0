Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97400CD1297
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Apr 2024 06:44:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=UnZa+kymEWALAGSMk0rr8+0T+l265TIU6gLXOBOUsZo=; b=W096ZfJnrIBcgSodOqoUwim0nw
	TdkXt93xjvTVlYg1o9QkE+ojZphJzMSY5ypyaNosd54kzruCQSxX2QvSm7p1JX3zboHtbCx2i/2mR
	/BWtyENsBM/Mz2uoMHHePwL6CvlXm50Mvhz+K/+DNXNvrYnKOqMOhRShrbe5EGfGUCDU7vhlmCjZy
	Y2ZAgDUFlnbJwjwsJG/T71AhZPmvXunoOONSnRZmJNJBK88q/6ecewLwOc2azD/Vd2WSlboFILAks
	jmbKSnuUYD62OKuVVLhLJgMQQyub5cb3ZS0F7AoREJPh3A7sQ1YJY3nNHg2cva5mPwW6Kr3eEfq2c
	z/qlMb3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ru5Dp-00000000dON-087T;
	Tue, 09 Apr 2024 06:44:45 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ru5Dm-00000000dMu-2IKk;
	Tue, 09 Apr 2024 06:44:43 +0000
X-UUID: a1c3ca02f63c11ee96d5dfc950b7243d-20240408
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=UnZa+kymEWALAGSMk0rr8+0T+l265TIU6gLXOBOUsZo=;
	b=Skgp1VIWML4MExHSKn7sg/sWgQG9JaU82WU6oo2g5GomSY7UODkDqSz2UlF8YuQeESkG6u6zBR3arsoNL8R3e4eFgJzy3Bop3xtIlQHZuoIy02h+3qYlOXuvmtQoa+iPyC4zwEXZn+tscsKmzb+dGJDuZnF1+G/NOTigMjKlVJI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.37,REQID:a4fa0aa5-23d9-4f0e-85fc-1a5c49d7b399,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6f543d0,CLOUDID:4362d900-c26b-4159-a099-3b9d0558e447,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: a1c3ca02f63c11ee96d5dfc950b7243d-20240408
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <yunfei.dong@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 705396190; Mon, 08 Apr 2024 23:44:36 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 9 Apr 2024 14:44:32 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 9 Apr 2024 14:44:31 +0800
From: Yunfei Dong <yunfei.dong@mediatek.com>
To: =?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?=
	<nfraprado@collabora.com>, Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Benjamin Gaignard
	<benjamin.gaignard@collabora.com>, Nathan Hebert <nhebert@chromium.org>,
	Sebastian Fricke <sebastian.fricke@collabora.com>
CC: Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>,
	Daniel Vetter <daniel@ffwll.ch>, Steve Cho <stevecho@chromium.org>, "Yunfei
 Dong" <yunfei.dong@mediatek.com>, <linux-media@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v2,0/5] media: change the calculation method of sizeimage
Date: Tue, 9 Apr 2024 14:44:26 +0800
Message-ID: <20240409064431.16909-1-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--3.658400-8.000000
X-TMASE-MatchedRID: tiRXYRqWr+t7EGbCBtXNh5dc7I2df+ms7TLAShhI26nfUZT83lbkEF2k
	xKIqW9ov4vM1YF6AJbZhyT3WNjppUtAtbEEX0MxBxEHRux+uk8hxKpvEGAbTDs2d8v07uhCE1LI
	xCR7fv4UoyD9yZkFZeBEgi3uuWutXDxXLKQJKaUy36ORTd1K+uaY7sVJ5Q4+lfdzU+O6sfADO8T
	UL2Fw68xz+PhojlLUuev0YPTN868QBqq+/+aGCsUu0bcffALXE
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--3.658400-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 7216C0668EF25ACFABAA8C78AB5D3A64ACCEEE92F96DE857900F403C65F763032000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240408_234442_652945_078A08B3 
X-CRM114-Status: UNSURE (   7.01  )
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

The bytesperline and sizeimage of each plan are different for 8bit
and 10bit bitstreams. Using v4l2 common interface to calculate them
independently.

---
compare with v1:
- add patch 1/2/3/4
- change the calculation method for sizeimage for patch 5
---
Yunfei Dong (5):
  media: mediatek: vcodec: fix incorrect MT2T format information
  media: mediatek: vcodec: fix incorrect MT2R format information
  media: mediatek: vcodec: add MM21 format definition
  media: mediatek: vcodec: add MT21 format definition
  media: mediatek: vcodec: fix incorrect sizeimage for 10bit bitstream

 .../mediatek/vcodec/decoder/mtk_vcodec_dec.c  | 28 ++++++-------------
 drivers/media/v4l2-core/v4l2-common.c         | 12 +++++---
 2 files changed, 16 insertions(+), 24 deletions(-)

-- 
2.18.0


