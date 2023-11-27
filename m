Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A7FBC4167B
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Nov 2023 07:05:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NYKZdfMEZ8N9fLthqw1urmuNwplT4YFs5p5D6iB4J6Q=; b=tF2kFYOUDAXdYMLLDTpWjwHLxX
	l+HSPT40IuZODYPNG1EhISA8tt8y5nDOjCqbISn4TC6itIGrYmLd7LghEA+cpOna39KCqvYB2m9+D
	DRBImePbH6mXTszAS8ERns12L3c2RrBYb7n4xkrKbnP3B5YSSKndG1LZEj2092S04/UOrgoXKc4Oe
	UsKqaupmGDUp5tyiX1xJwCdOGG66P8ZyTKbE7L3LTk1LlyxX/kABd1mQD4/TecxSesNNplswl06Dl
	/Ct94Jf7GQuYbDAVggbZN1QOKRlVSgFD/IjPlZxiK0wrGGRaOhswYQ+MHCEIvgeHNS2KzestklHrx
	ByOVpQvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7VgM-001eTE-0a;
	Mon, 27 Nov 2023 07:05:26 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7VgJ-001eSG-0S;
	Mon, 27 Nov 2023 07:05:24 +0000
X-UUID: 501fe1de8cf311ee9b7791016c24628a-20231127
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=NYKZdfMEZ8N9fLthqw1urmuNwplT4YFs5p5D6iB4J6Q=;
	b=EC7Qa0Ki5KIbmkklpYBf8JCkTVw7GbNx4ZYahGqkPDp5WY5B3JUG88YpwRFImEn8EoTNmoYWrszVWCNEtP5SGtqL/LULVNX6dRO49g6T/mdZUYL9fppM/7sFahcpNXnpoqHDF/CzDuVZYm7CMJWErNeRzy7yOrCH5TYfmmhZNWg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.33,REQID:c37d389b-83c7-4a04-98d0-d7352a115487,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:364b77b,CLOUDID:3dd7fcfc-4a48-46e2-b946-12f04f20af8c,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
	NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 501fe1de8cf311ee9b7791016c24628a-20231127
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw01.mediatek.com
	(envelope-from <kuan-ying.lee@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1242210859; Mon, 27 Nov 2023 00:05:14 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 27 Nov 2023 15:05:10 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 27 Nov 2023 15:05:10 +0800
From: Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: <casper.li@mediatek.com>, <chinwen.chang@mediatek.com>,
	<qun-wei.lin@mediatek.com>, <linux-mm@kvack.org>,
	<akpm@linux-foundation.org>, Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>
Subject: [PATCH 0/3] Fix GDB commands error
Date: Mon, 27 Nov 2023 15:04:00 +0800
Message-ID: <20231127070404.4192-1-Kuan-Ying.Lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--1.823900-8.000000
X-TMASE-MatchedRID: 6efVvalF+GhBEeXXYJxA3huZoNKc6pl+MVx/3ZYby7/jud2x7TPVt/vO
	+ii1kEU9/pKwAK6MbUroNOYPho+2K3kXYHF7PdsXtxwPIeWtDDlKPIx+MJF9o5soi2XrUn/J8m+
	hzBStansUGm4zriL0oQtuKBGekqUpOlxBO2IcOBZcKP1ilp4RwRIWchrxYUogoPAkwJJUDVxm9A
	2MjQXQP/PURVwGjI4MF7+B6EXI4pUSA+HPw22nHoCBf9PLMTwKuFgIMLB2+FfBkGBTIlURuXoXD
	z8+lMxFpW+aIDJ4DaRzkxJ+SIkUjmncuUSUEdOX
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--1.823900-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 3BFE860726066AA1B74EC332893E7866F20F00E093DBA136B8A9977664D1C52E2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231126_230523_225915_ABC87029 
X-CRM114-Status: UNSURE (   6.09  )
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

This patchset fix some issues of gdb command.

Patch 1:
 - Fix lx-ps command error
Patch 2:
 - Fix stackdepot usage error
Patch 3:
 - Remove exception handling
 - Refine the printing format

---
This patchset is based on linux-next-20231127.

Kuan-Ying Lee (3):
  scripts/gdb/tasks: Fix lx-ps command error
  scripts/gdb/stackdepot: Rename pool_index_cached to pools_num
  scripts/gdb: Remove exception handling and refine print format

 scripts/gdb/linux/page_owner.py | 58 ++++++++++++++-------------------
 scripts/gdb/linux/slab.py       |  3 +-
 scripts/gdb/linux/stackdepot.py |  6 ++--
 scripts/gdb/linux/tasks.py      | 12 +++----
 4 files changed, 33 insertions(+), 46 deletions(-)

-- 
2.18.0


