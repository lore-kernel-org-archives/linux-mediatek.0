Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64C7BC2BD09
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Jul 2024 10:11:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4g/n/U/gNIclUl8PDWXPkIANE160xOqth+NppkBoar4=; b=gJJvs9u324iNrHFP8ZNkqCKOut
	HGL7CQPbZH8oLquvlocyGDOGsylrWNx99FcAsQPEQiRO0pwgzElTOFKHP3jYRexBVzNSkgNSvMwOu
	v4lDzx+RaESEV6o2NYSdJRbmDs0dvZ7E1bPOe7EzU/iDoDIJ2o9svspdKwYt5t/9JSWqmFWocviSC
	9cgTC/lkrajBSk72MFapNAcrGHTCS9zXuwDunKsD3pvcHIiJ38oJCuDMuL/UT2izzKSMMHjCyXmLo
	Oz2WtsxWlG7aIhLuh5iLZsqf7GSAF6qP+bypEpErHR7qIMBDda2p821HiWhYBxJcnVLN6rniUUp1L
	R5A44NXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sR7oY-00000006l3m-039e;
	Tue, 09 Jul 2024 10:11:14 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sR7oU-00000006l17-35w4;
	Tue, 09 Jul 2024 10:11:12 +0000
X-UUID: 8ddcdcfe3ddb11ef955bff358274dad2-20240709
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=4g/n/U/gNIclUl8PDWXPkIANE160xOqth+NppkBoar4=;
	b=vEl4nrwbvO4QEubFl9uXe0mSTg+zDRJG7vv+BmDBI2xo0YKnxhSCzqIiGXX/m9+hntKzmYWbmg098inZfMvrPUWChmOPZpmYRSf9oR6uJdV6IXHzuteLjtAdcz6jIKxLYQEYJ57Wb96EiZA1mnEBqgf6g8nHH1+3rOP84kRR3tQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.40,REQID:7188fba6-6e7e-47e3-be42-b93fd3ca2669,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:ba885a6,CLOUDID:000a45d1-436f-4604-ad9d-558fa44a3bbe,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: 8ddcdcfe3ddb11ef955bff358274dad2-20240709
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <mark-pk.tsai@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1322002580; Tue, 09 Jul 2024 03:11:05 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 9 Jul 2024 18:10:59 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 9 Jul 2024 18:10:59 +0800
From: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
To: Jonathan Corbet <corbet@lwn.net>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Lu Baolu
	<baolu.lu@linux.intel.com>, Mark-PK Tsai <mark-pk.tsai@mediatek.com>, "Will
 Deacon" <will@kernel.org>
CC: Vegard Nossum <vegard.nossum@oracle.com>, Randy Dunlap
	<rdunlap@infradead.org>, Kees Cook <kees@kernel.org>, Andrew Morton
	<akpm@linux-foundation.org>, Jeff Xu <jeffxu@chromium.org>, Leo Yan
	<leo.yan@linux.dev>, Daniel Stone <daniels@collabora.com>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
Subject: [PATCH] docs: iommu: Drop the stale entry in documentation TOC
Date: Tue, 9 Jul 2024 18:10:30 +0800
Message-ID: <20240709101055.27178-1-mark-pk.tsai@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10-0.495500-8.000000
X-TMASE-MatchedRID: q3DD6paP25SxpgqXoiq0QRIRh9wkXSlF+KgiyLtJrSBh2fnHe1cil5go
	A6tCR5r5tb9lbjrD8CQi/q1BDW1QNbBAQLqGlKivsK+WWVTsOXUFoWM8D8/dJpsoi2XrUn/J8m+
	hzBStansUGm4zriL0oQtuKBGekqUpUfEQFBqv0mf+fcB583Y+85VPwxBjG5R/rDloKsUzYHV1ir
	HCFqK+evR4gTBSYcescfVBOXUPkQV0qcKXT3+uyBGzJje0pkt3TocK8dAVBXBJmt82E/eyBQGH0
	CAFIQWsmb5gmylW+PbGS+seVPx64iJPbCM5uaOswL6SxPpr1/I=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10-0.495500-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 3A272DCB714E486716714DCA05C2AB6A0DA45688F6DAC0F139CBD8C1959BC1852000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240709_031110_808395_EC78F03F 
X-CRM114-Status: UNSURE (   9.18  )
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

The Documentation/userspace-api/iommu.rst had been removed,
so should TOC entry.

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Closes: https://lore.kernel.org/lkml/20240709190613.3fd8b7ea@canb.auug.org.au/
Fixes: d926e7c04843 ("docs: iommu: Remove outdated Documentation/userspace-api/iommu.rst") on linux-next
Signed-off-by: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
---
 Documentation/userspace-api/index.rst | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/userspace-api/index.rst b/Documentation/userspace-api/index.rst
index 8a251d71fa6e..274cc7546efc 100644
--- a/Documentation/userspace-api/index.rst
+++ b/Documentation/userspace-api/index.rst
@@ -45,7 +45,6 @@ Devices and I/O
    accelerators/ocxl
    dma-buf-alloc-exchange
    gpio/index
-   iommu
    iommufd
    media/index
    dcdbas
-- 
2.18.0


