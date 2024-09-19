Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADC13CE8D7A
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Sep 2024 11:33:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pFtDBXloIcerwPHPWpyl2alet9mKUnrBwiIRPJMroSA=; b=KYKKAqgB55b+P7j5W9zBTgsdvN
	Fos7eE36RR9qayOlJiXEtI7H++AsjAxH8cy9z8Gf90HWG9a9TCb8VwqS0I00nJKoDO2OaazrWCYgJ
	H1+ZNLPpIqwDBrYZBZJOamHfaDo8HKh1C4EmWLSdYPsag2AhZDVPdbjvqLxDtrkd8Q7Yq2CLzKKN3
	JoyhVSwg+IiPvUPsxW3WiuCDGkwlrm0q+wbLENOcSMo0wulNnPgIKQ46NP4x1+2J+JskjNgxFCjMp
	4MqWoVuKebxAoecEeeiN+UHW9wXFqVgDtJiEBYq7SRWUM3OYKi0qxhOg8rgcB784yif2Zfx0/eF6f
	6pPLcWpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1srFPr-0000000AAbV-19pu;
	Thu, 19 Sep 2024 11:33:43 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1srFMa-0000000AA3E-2qQ7;
	Thu, 19 Sep 2024 11:30:22 +0000
X-UUID: 8a8715ec767a11efb3adad29d29602c1-20240919
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=pFtDBXloIcerwPHPWpyl2alet9mKUnrBwiIRPJMroSA=;
	b=f+gsnbtGned9LkWJWc5NbYauoXN3t+I+B8r4NjplArVdmHSzRv8ml7tuNqPBcjEleuZBvJcEc7x/DdJSmnUoKjYJHtTizVLH01mqp0w6vDQrz+gEhjtEoum6xezrvN6cpBTVZw5kPv9kNxDBR7lniBr8+8A1yQmW+Zbw2VIgqQ0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:96634d60-0bd6-4ea4-8fd4-e17ba12fd980,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6dc6a47,CLOUDID:e5f03d9e-8e9a-4ac1-b510-390a86b53c0a,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 8a8715ec767a11efb3adad29d29602c1-20240919
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw01.mediatek.com
	(envelope-from <qun-wei.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1765836027; Thu, 19 Sep 2024 04:30:15 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 19 Sep 2024 19:30:10 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 19 Sep 2024 19:30:10 +0800
From: Qun-Wei Lin <qun-wei.lin@mediatek.com>
To: Andrew Morton <akpm@linux-foundation.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Ryan Roberts
	<ryan.roberts@arm.com>, "Huang, Ying" <ying.huang@intel.com>, "David
 Hildenbrand" <david@redhat.com>, Chris Li <chrisl@kernel.org>, "Matthew
 Wilcox (Oracle)" <willy@infradead.org>, Al Viro <viro@zeniv.linux.org.uk>,
	"Dan Schatzberg" <schatzberg.dan@gmail.com>, Kairui Song
	<kasong@tencent.com>, Barry Song <baohua@kernel.org>, Jens Axboe
	<axboe@kernel.dk>
CC: <linux-kernel@vger.kernel.org>, <linux-mm@kvack.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<linux-block@vger.kernel.org>, Casper Li <casper.li@mediatek.com>, "Chinwen
 Chang" <chinwen.chang@mediatek.com>, Andrew Yang <andrew.yang@mediatek.com>,
	John Hsu <john.hsu@mediatek.com>, <wsd_upstream@mediatek.com>, Qun-Wei Lin
	<qun-wei.lin@mediatek.com>
Subject: [PATCH 0/2] Add BLK_FEAT_READ_SYNCHRONOUS and SWP_READ_SYNCHRONOUS_IO
Date: Thu, 19 Sep 2024 19:29:50 +0800
Message-ID: <20240919112952.981-1-qun-wei.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--2.319100-8.000000
X-TMASE-MatchedRID: y/MOm6ldwRLxEHpzyfiYCrCvlllU7Dl1u56wFPSkMVFsmSfP7d/dpYhK
	asDlRLg0PMCTxZ0FhhdYo3G+rvxrNUkjllSXrjtQFEUknJ/kEl5q8/xv2Um1avoLR4+zsDTttrr
	TuahHzlGpp01G3uBXtb0XhwlNA8MHofnMcDO+aeBJiBkhcxr75pWf1beiAmbTHliXM5eW2aacaV
	HiDzvLgZJWAqw/Km95o4s7o73brFxJmt82E/eyBQGH0CAFIQWsmb5gmylW+PbGS+seVPx64j6Qr
	n3xh/cy
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--2.319100-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 934E8F1C009F82DA8C65E157967D6F7A839701E4510113EE88E9F19DE3C52A232000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240919_043020_751466_2FCAF1BB 
X-CRM114-Status: UNSURE (   9.64  )
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

This patchset introduces 2 new feature flags, BLK_FEAT_READ_SYNCHRONOUS and
SWP_READ_SYNCHRONOUS_IO.

These changes are motivated by the need to better accommodate certain swap
devices that support synchronous read operations but asynchronous write
operations.

The existing BLK_FEAT_SYNCHRONOUS and SWP_SYNCHRONOUS_IO flags are not
sufficient for these devices, as they enforce synchronous behavior for both
read and write operations.

Patch 1:
- introduce BLK_FEAT_READ_SYNCHRONOUS

Patch 2:
- introduce SWP_READ_SYNCHRONOUS_IO

Qun-Wei Lin (2):
  block: add BLK_FEAT_READ_SYNCHRONOUS feature for synchronous read
  mm, swap: introduce SWP_READ_SYNCHRONOUS_IO

 include/linux/blkdev.h |  8 ++++++++
 include/linux/swap.h   | 31 ++++++++++++++++---------------
 mm/memory.c            |  3 ++-
 mm/page_io.c           |  2 +-
 mm/swapfile.c          |  3 +++
 5 files changed, 30 insertions(+), 17 deletions(-)

-- 
2.45.2


