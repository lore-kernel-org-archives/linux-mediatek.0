Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F6E7C3DA4A
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Jul 2024 07:16:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=aIc4NRIeHEFygIQHKpa4gE3f3X/S5XUFpfK78RXhxpU=; b=1oml8abppmdENOcqBH8eYYx1g3
	W74p/E1D4qKzZr5fdTx4S/uZSOqBXLW2xkaOaiobd77TS/+sKNrH5VSnNnXwDYHHhJhu/Il/c3jUf
	uijppDfFqj3qx5TzkQc/pk2HhAn5Zu6Y2lhZgAFbDS6t19jrY+qkcX8XSoxeLisQ1756bmpjR0uQ9
	BB8Leb6kisi/fZUYoLqLIE1iA8ammJ89z7OkOnENJfGW15GuCzO/S9ID4zo7xfhqdOxEj2eX5zEEg
	E/fr7b1z+wKsRq48etnk9WRI+BVWQwd0v7i23bh0a+l3+YvTj1HrzoAl9mzVz8J9J2VuqmaZ3Wxr3
	FvhAkOgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYKcQ-0000000AJZC-3bFX;
	Mon, 29 Jul 2024 07:16:30 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYKWh-0000000AHQl-1vm4
	for linux-mediatek@lists.infradead.org;
	Mon, 29 Jul 2024 07:10:37 +0000
X-UUID: a431a6944d7911efa6c87f6b4542ff6b-20240729
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=aIc4NRIeHEFygIQHKpa4gE3f3X/S5XUFpfK78RXhxpU=;
	b=Lw3Vzu6qNU15GtZD8NzNG6zoA0qJZN08s+t67n4nKqVQmZXoesqGL5f0Pa0YvW8cxnmp9wEXtt1pIXBcs33DkBWOGLfx4oabo/tH426lL5vqpsozyyYXdmWX17ehb+Vt+5QP6qNTR1w7D6gQihBRh88TBVN/Kmi6JjCJk66/gIU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:3bd7ec7c-c669-441a-b68c-25a0c2123166,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:6dc6a47,CLOUDID:de1f04d2-436f-4604-ad9d-558fa44a3bbe,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: a431a6944d7911efa6c87f6b4542ff6b-20240729
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw01.mediatek.com
	(envelope-from <xiangzhi.tang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1042060388; Mon, 29 Jul 2024 00:10:31 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 29 Jul 2024 15:10:28 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 29 Jul 2024 15:10:28 +0800
From: Xiangzhi Tang <xiangzhi.tang@mediatek.com>
To: <linux-firmware@kernel.org>
CC: <linux-mediatek@lists.infradead.org>, <joe.cheng@xperi.com>,
	<hailong.fan@mediatek.com>, <justin.yeh@mediatek.com>,
	<howard-ch.wang@mediatek.com>, <sidney.chang@mediatek.com>,
	<Jjian.zhou@mediatek.com>, Xiangzhi Tang <xiangzhi.tang@mediatek.com>
Subject: [PATCH] mediatek: Update mt8195 SOF firmware
Date: Mon, 29 Jul 2024 15:10:10 +0800
Message-ID: <20240729071010.6129-1-xiangzhi.tang@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240729_001035_570182_0B330870 
X-CRM114-Status: UNSURE (   7.10  )
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

    Update SOF version: sof/sof-mt8195.ldc
    Release version: v0.4.2

Signed-off-by: Xiangzhi Tang <xiangzhi.tang@mediatek.com>
---
 mediatek/sof/sof-mt8195.ldc | Bin 51168 -> 40560 bytes
 1 file changed, 0 insertions(+), 0 deletions(-)

diff --git a/mediatek/sof/sof-mt8195.ldc b/mediatek/sof/sof-mt8195.ldc
index 0ae937dd0fd153d3169b90291836705126542dad..80c5394b3692b45ae3d9a54523049c0cdb198874 100644
GIT binary patch
delta 190
zcmaFR&-`Hz6PHhZdNBjTii9WACvs`<nVTCJS~4&gFtGmQ6S%g~!NFs*K!}Xc<P~N-
zo3}LYVc%TR?WbXCW~Q4CR%wuGkYr?#s!&{%tdNmdoS|S)p=w}Jp`ekI0vAXzGc+(r
jO|zW*eRDi{IyZN3*~`Odu-WrqJL9Co2AdNOH?RNz0`5Mp

delta 10115
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
E0}ttrg#Z8m

-- 
2.25.1


