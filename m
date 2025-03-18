Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82602C28B28
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 Mar 2025 09:43:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ufAMNSodGm9ge3E2WCpTSSPB33/FyVtMvyoT7WBWCps=; b=vE+47Dy1kTNG9JuPRdtNTTOKgV
	rUOALWwIhWbb5sKXAfgCt0IYfrHjlupod8+mAK5FdpBU9r9v+LFknGRI21fdcSE0Lm10z6l/bfKFt
	Wq/BZmG23bXjgcP4FW2wn+gsWS/fyH6E9l7F5QB29D6sq87AckNkinO2VURqvB3FJmVv7IuLu/+oO
	DfOCyYFoakvbgIYDbVg9egeHcZsRQOTeJeRPLNJYJohudApVNN348DzgPXGXAmd/lHMCq951ABMkb
	DhZT9dP/5NVeT2Xa8Cs763sCDLjdS5S1eilk1zXaUei1wdQpHgDovK3gWUg2hvWU6+Z0h2hCBxOXI
	o97TGoWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuTTo-00000005MRY-30Tj;
	Tue, 18 Mar 2025 09:43:24 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuTTm-00000005MQX-1BOP
	for linux-mediatek@lists.infradead.org;
	Tue, 18 Mar 2025 09:43:23 +0000
X-UUID: 6ba6310803dd11f0a1e849db4cc18d44-20250318
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=ufAMNSodGm9ge3E2WCpTSSPB33/FyVtMvyoT7WBWCps=;
	b=V9SC8L7ms5sbpwKgghzAIwMTBtyb3//6BHzYV8AI4HHkuSOrWrYLM4c74DsA9okps7CbBlNGUlu2yIpwXFiUCZ+SaNUEskqF+9HGr4wGofh4xZxtuYNeYVlO3R4DaY+DWuQZWhVT/wWZ7nIvkbYsaZ5vkukQTQkF+fkjiU7nTzo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:a203589e-7946-4a86-9222-832be26ff1d7,IP:0,UR
	L:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:-5
X-CID-META: VersionHash:0ef645f,CLOUDID:cd03414a-a527-43d8-8af6-bc8b32d9f5e9,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:-3,IP:ni
	l,URL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: 6ba6310803dd11f0a1e849db4cc18d44-20250318
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <moudy.ho@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 453836627; Tue, 18 Mar 2025 02:43:17 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Tue, 18 Mar 2025 17:43:15 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Tue, 18 Mar 2025 17:43:15 +0800
From: Moudy Ho <moudy.ho@mediatek.com>
To: <linux-firmware@kernel.org>
CC: <linux-mediatek@lists.infradead.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Nicolas Prado
	<nfraprado@collabora.com>, Jason Chen <Jason-ch.Chen@mediatek.com>
Subject: pull request: linux-firmware: Create MediaTek MT8188 SCP firmware
Date: Tue, 18 Mar 2025 17:40:01 +0800
Message-ID: <20250318094255.3538621-1-moudy.ho@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_024322_325312_3AC09D75 
X-CRM114-Status: UNSURE (   4.29  )
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

The following changes since commit 588505068c48fe07b1cfa32c5f3acd4395ec9482:

  Merge branch 'copy-firmware' into 'main' (2025-03-18 00:45:21 +0000)

are available in the Git repository at:

  https://github.com/MoudyHo/linux_fw_scp v27749

for you to fetch changes up to a39712f2c8c9a520b889a45cbbdd2fa36d249cc3:

  mediatek: Add MT8188 SCP firmware (2025-03-18 16:49:53 +0800)


