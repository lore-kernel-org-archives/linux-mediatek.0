Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 693C2CD5BDD
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Sep 2024 11:56:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=beik/VlMt7ACJaNEqGOg9cRTm/n3szkE5kz6nm0GEnY=; b=r5YLrZZa04txjw9AuwOGd6ojVe
	94sufEadVdmUOZvKTtXKxoCzoUIh8bvqGGFfVH7iHezbL4tIhEXT6hY+H1g50EuH+mV+p1xsIb9Y7
	9JTA0tgIrcQJ65rOoF2oO/+wcD1NcKOx80Zm65fCNo9xDnoUtooIn0JaaWKU27WgVbSWPQmVz6RbZ
	+fD9lKV76/H70b26wz9w0LwOUwH0/ssj9yONiNET1cTYWkKmQ7WPvDsxBeymqcz6CA2Zi5cV0QYnS
	6p/bwyuDVXBh6EAf3rdVtgBKVZlCH8dCPYerjXzDmg+IvJHxvpuIWuu0F5Qt4A08svXQmqUdhzaMW
	IceHxP5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smXZH-0000000C4jJ-1QPj;
	Fri, 06 Sep 2024 11:55:59 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smXZ8-0000000C4db-2VUv;
	Fri, 06 Sep 2024 11:55:51 +0000
X-UUID: f37ac2d06c4611efb3adad29d29602c1-20240906
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=beik/VlMt7ACJaNEqGOg9cRTm/n3szkE5kz6nm0GEnY=;
	b=ZWt2M7uzV5unzd9yKzQM6mmB/CDWp1ycPJmQsp9QCgq6ahlbqs6jXfdOmRGnwygATX+Kqd7FMIElDz1BFAVA5j/yZlzvLJu9IZYTyq2fipyEhp5sUO73AtHqfANkW1P1jW1oarP+O2qq6PktUqZP8VJzBB30aQN2MdqIHBMiJ2A=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:12a6276e-5d55-4879-b679-86a3b9d0c940,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:6dc6a47,CLOUDID:fcd14c05-42cd-428b-a1e3-ab5b763cfa17,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: f37ac2d06c4611efb3adad29d29602c1-20240906
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <chunhui.li@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 887596887; Fri, 06 Sep 2024 04:55:46 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 6 Sep 2024 04:55:43 -0700
Received: from mbjsdccf07.gcn.mediatek.inc (10.15.20.246) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 6 Sep 2024 19:55:42 +0800
From: Chunhui Li <chunhui.li@mediatek.com>
To: Luis Chamberlain <mcgrof@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: <linux-modules@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<wsd_upstream@mediatek.com>, Chunhui Li <chunhui.li@mediatek.com>
Subject: [PATCH v3 0/1] fix module sysfs patch defect
Date: Fri, 6 Sep 2024 19:57:47 +0800
Message-ID: <20240906115748.5367-1-chunhui.li@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240906_045550_666251_C9828642 
X-CRM114-Status: GOOD (  10.73  )
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

Hi Maintainer,

I have update the patch base on your feedback, please help review again.

V3:
-Fix initial value;
-Remove unnecessary checks about mod->sects_attrs
-Check sysfs_creat_* return value as error code
-Reorder the reveral of successful operations before exiting

We will use the information recorded in mod->sects_attrs for debugging.
   When a panic occurs in a .ko, we can use gdb to load the symbols of the .ko file
along with the coredump, and use the text segment address and init.text segment address
in mod->sects_attrs to debug. 
   If there is an error in add_sysfs_setup and the .ko is still loaded and runs normally,
when the ko suffer panic later, we would not be able to access the loading addresses
of the ko, which would prevent us from being able to debug effectively.
   Therefore, it is desired that if there is an error during load module, it should prevent
the ko from being inserted with insmod. This ensures that as long as the .ko is
successfully loaded, all necessary information for debugging is available.

Thanks for your time.


Chunhui Li (1):
  module: abort module loading when sysfs setup suffer errors

 kernel/module/sysfs.c | 57 +++++++++++++++++++++++++++----------------
 1 file changed, 36 insertions(+), 21 deletions(-)

-- 
2.45.2


