Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7582C77B7F
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Jun 2025 11:37:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kgQPLojOCvKyYWN1b4NpMo1DPdZByKamqop9i/6TJf4=; b=dydvtALASNJJZBNTJIYFHMu9uT
	2gInH9fjcjjA4PfiPfj8KS1pRpartZ2RaNTF7gd5WjB34j7v5rJMuM/nUsIkEIsO1DIb2hXTbjoJG
	0zsx4Fgt776YuGYjfftwm4i6B5OttNoWYQGpLzPZlhuckZHkt1r+Ab1LdFGCD86MQVdYQpyGuM8bR
	fEjs1+V6p7oPHK1SS82Aqk6U/X7NAzz5Gda52SxZ2HXFuLfu3BWtrpfEgIAyI+NWaJrmnKETpB8N5
	8B9inIje5QZTOywjks8ZQum/u2E/8ofiNnrqHYlBPiDL11ShVt6dXUQVtMIwkv8/ngzUoa8BZdHfR
	gq2XqboQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTfU4-00000002WQe-06jR;
	Mon, 23 Jun 2025 11:37:09 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTeMI-00000002L4i-1NUy;
	Mon, 23 Jun 2025 10:25:03 +0000
X-UUID: 4e916ea8501c11f09f706fa2197c6ceb-20250623
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=kgQPLojOCvKyYWN1b4NpMo1DPdZByKamqop9i/6TJf4=;
	b=LNDuy07v2QLU8pRUGgfzV0QQJMKDxE8vO5Mzf9EIlhHzMuMssmmmL5wOyiMPhuRiF8ipuhJ2muHSRXxupKdv2spmNt7ozGoIv4mDbp0f55kQutExrwRsaZ87FmJku2rhFBg4qjVCmdkA5r7Ft4k35w+8J+xFX6islWuCQnriefQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.2,REQID:a5e836e6-e09e-4548-891c-5de5e6d2396c,IP:0,UR
	L:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:-5
X-CID-META: VersionHash:9eb4ff7,CLOUDID:66bfc228-fdd2-4021-9c0c-83548fdcf243,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:-3,IP:ni
	l,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 4e916ea8501c11f09f706fa2197c6ceb-20250623
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <ot_zhangchao.zhang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1290361883; Mon, 23 Jun 2025 03:24:55 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Mon, 23 Jun 2025 18:24:51 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Mon, 23 Jun 2025 18:24:50 +0800
From: Zhangchao Zhang <ot_zhangchao.zhang@mediatek.com>
To: Marcel Holtmann <marcel@holtmann.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Luiz Von Dentz <luiz.dentz@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: Sean Wang <sean.wang@mediatek.com>, Deren Wu <deren.Wu@mediatek.com>,
	Chris Lu <chris.lu@mediatek.com>, Hao Qin <Hao.qin@mediatek.com>,
	linux-bluetooth <linux-bluetooth@vger.kernel.org>, linux-kernel
	<linux-kernel@vger.kernel.org>, linux-arm-kernel
	<linux-arm-kernel@lists.infradead.org>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Zhangchao Zhang
	<ot_zhangchao.zhang@mediatek.com>
Subject: [PATCH v4 0/1]  Bluetooth: mediatek: add gpio pin to reset bt 
Date: Mon, 23 Jun 2025 18:23:58 +0800
Message-ID: <20250623102359.2684-1-ot_zhangchao.zhang@mediatek.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_032502_385260_61057367 
X-CRM114-Status: UNSURE (   6.37  )
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

Reset Bluetooth using hardware pin via dts

Compared with the previously submitted version, the following
information are some specific revision histories

V3-->V4 modifications:
Modify dt binding format information and
the explanation text in the patch

V2-->V3 modifications:
-Changed the capitalization of co-developer names,
   using the correct capitalization of abbreviations and full
   name, and corrected obvious spelling errors.
-Add a revision history.
-Remove the "BT Driver" in the prefix.
-Add the bt-binding document, include inforamtion related to reset
   pin and compatibility matching.
-Add a comment before the schedule_delayed_work function call,
   although schedule_delayed_work is asynchronous, there is no risk.
   Even if it is not completed within 200ms, it will only postpone
   the subsequent probe and will not have any impact.
-Add a comment before the btmtk_reset_by_gpio function call,
   if the compatibility filed or pin cannot be found in the dts
   files, it can still reset bluetooth using software reset.

V2 modifications:
Modify gpio to GPIO, SW to software,
and fix other obvious spelling errors.

