Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11C6F606A335
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Nov 2026 03:13:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=A6IiVvKJ;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=XsGx8rs7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=b6mO35zQsUgdCke45nS1F0bWlUCIY7+zrG0PT6o+9Is=; b=A6IiVvKJefp6atxjmD3POaeChW
	fv+P4h4KB8tY/GstNzFU5At/UVo4XUmX3BlmavIWhWZ6u3wjOOG2YgO+WIEeEmGNVva5BTiNgr4/i
	HjtU2MOxW6r8IEHcm2Fe+wgfVhuPj1xwo3XA8z5siYARPPay4elbZUHHo5YFhYktSFn2dRNs/Z8u5
	6GdEGU66AcQMuVRkEYkXWR780hP9i0DsyQexr7AGTvgxP784LBUw2+8l04C24FLEjsLPNdFtYv9P+
	29pbDHy+U5Deu94hI8OMKt8jJBf67yGARDUEwJMBjxyxwgkgf2v3U3GvPz+jmragSYfutcbTS1H2p
	AgXM5RlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQcIK-00000002EcF-2U6S;
	Tue, 10 Nov 2026 03:13:12 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQcII-00000002Ebr-39ri
	for linux-mediatek@lists.infradead.org;
	Tue, 10 Nov 2026 03:13:11 +0000
X-UUID: a4939cbadcb411f1acbe4559397dec65-20261109
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=b6mO35zQsUgdCke45nS1F0bWlUCIY7+zrG0PT6o+9Is=;
	b=XsGx8rs7qiNe4rwoJ3H1dj+NpNCbvFMAxbIrvfbVv8b/KEIeIzNbISmb3D62n9aXITpeAvYimFhJsZukBZ5NXo2ycgDf6TrBNhs8nU0AYZoaS9jCeb8IQoqg7sScZMDV/wnH5meCjFCHWelfXoBXPPwJzTimar/J+9/kESdmdvg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:95f73062-9c88-4de7-99b1-3dae22e5c59c,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0318ac,CLOUDID:27290f57-a87d-42b7-8ffd-9e23ca174329,B
	ulkID:nil,BulkQuantity:0,SF:102|136|836|865|888|898,TC:-5,Content:0|15|50|
	99,EDM:-3|-100,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OS
	I:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: a4939cbadcb411f1acbe4559397dec65-20261109
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <emery.hsin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1218768163; Mon, 09 Nov 2026 20:13:03 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 10 Nov 2026 11:13:01 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Tue, 10 Nov 2026 11:13:01 +0800
From: Emery Hsin <emery.hsin@mediatek.com>
To: <nbd@nbd.name>, <lorenzo@kernel.org>
CC: <Sean.Wang@mediatek.com>, <jb.tsai@mediatek.com>,
	<Quan.Zhou@mediatek.com>, <linux-wireless@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, Emery Hsin <emery.hsin@mediatek.com>
Subject: [PATCH 00/28] wifi: mt76: mt7925: add MLO hybrid and EMLSR support
Date: Tue, 10 Nov 2026 11:12:16 +0800
Message-ID: <20261110031244.369014-1-emery.hsin@mediatek.com>
X-Mailer: git-send-email 2.45.2
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_191310_829393_516B5A1A 
X-CRM114-Status: GOOD (  10.43  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This series adds station-mode multi-link operation to the mt7925 driver:
three-link hybrid MLO (one link per band) and EMLSR for APs on a vendor
OUI allowlist. Hybrid MLO and EMLSR are gated by the chip capabilities
the firmware reports.

Patches 1-8 fix the basic rate sent in the STA phy TLV and a sub-link
memory leak on disconnect, both with Fixes tags, then prepare the series
with no functional change: named constants for chip_cap, the DBDC band
and the HT secondary channel offset, a link STA wcid unwind helper, and
a gated mt792x_mcu_set_dev_active() also used by mt7921.

Patches 9-10 deactivate the DEV and BSS on disconnect and reactivate the
DEV before a reconnect, scan or off-channel operation. This covers the
MLO to legacy switch fixed by commit 8f9e5807671e ("wifi: mt76: mt7925:
restore the legacy BSS after MLO teardown") and replaces its BSS re-add.

Patches 11-19 add the firmware interfaces the link setup needs (the
third-link band limit, the EMLSR OUI allowlist and a multi-link
remain-on-channel) and keep the MLD consistent as links are added.
Patch 14 replaces the pending link parameter of commit dd3f17ef69ed
("wifi: mt76: mt7925: keep MLD membership consistent during link add").

Patches 20-28 bring up all links at authorization with one MLO ROC,
install the existing keys on the added links, apply the link state the
firmware reports, remap hybrid MLO TX to the primary link OMAC, and add
a hm_alg_ctrl debugfs file to override the firmware link plan.

The series is based on mt76 commit 8739e5b44b23 ("wifi: mt76: connac:
bound the scan IEs in mt76_connac_mcu_hw_scan()").

Emery Hsin (28):
  wifi: mt76: mt7925: fix the basic rate sent in the STA phy TLV
  wifi: mt76: mt7925: fix MLO sub-link memory leak on disconnect
  wifi: mt76: mt792x: turn chip_cap bits into an enum of bit positions
  wifi: mt76: mt792x: use named constants for the DBDC band
  wifi: mt76: use named constants for the HT secondary channel offset
  wifi: mt76: mt7925: factor out mt7925_mac_link_sta_free_wcid()
  wifi: mt76: mt792x: add a gated mt792x_mcu_set_dev_active() helper
  wifi: mt76: mt792x: route DEV (de)activation through
    mt792x_mcu_set_dev_active()
  wifi: mt76: mt7925: deactivate the DEV and BSS on disconnect
  wifi: mt76: mt7925: reactivate the DEV before (re)connect, scan and
    off-channel
  wifi: mt76: mt7925: parse the FW hybrid-MLO third-link band limit
  wifi: mt76: mt7925: gate EMLSR by AP vendor OUI allowlist
  wifi: mt76: mt7925: support multi-link hybrid/EMLSR remain-on-channel
  wifi: mt76: mt7925: describe the whole MLD in the STA/BSS MLD TLVs
  wifi: mt76: mt7925: assign a per-MLD firmware link index
  wifi: mt76: mt7925: share the primary OMAC across MLO links
  wifi: mt76: mt7925: carry the STA decap offload to later links
  wifi: mt76: mt7925: split link sta add into alloc and commit phases
  wifi: mt76: mt7925: publish every link before sending any STA_REC
  wifi: mt76: mt7925: add mt7925_mcu_add_bss_sec() helper
  wifi: mt76: mt7925: only refresh the SEC tag when setting the first
    key
  wifi: mt76: mt7925: add mt7925_set_links_key_iter() helper
  wifi: mt76: mt7925: bring up all MLO links on authorization
  wifi: mt76: mt7925: skip re-adding the primary MLD BSS_INFO in chanctx
    ops
  wifi: mt76: mt7925: apply FW-reported MLO link state
  wifi: mt76: mt7925: remap hybrid-MLO TX to the primary link OMAC
  wifi: mt76: mt7925: clear the MLD BSS tag on deactivate
  wifi: mt76: mt7925: add hm_alg_ctrl debugfs to override the MLO link
    plan

 .../wireless/mediatek/mt76/mt76_connac_mcu.c  |   4 +-
 .../wireless/mediatek/mt76/mt76_connac_mcu.h  |   2 +
 .../net/wireless/mediatek/mt76/mt7921/mac.c   |   7 +-
 .../net/wireless/mediatek/mt76/mt7921/main.c  |   9 +-
 .../net/wireless/mediatek/mt76/mt7921/mcu.c   |  14 +-
 .../net/wireless/mediatek/mt76/mt7921/pci.c   |   2 +-
 .../net/wireless/mediatek/mt76/mt7921/regd.c  |   4 +-
 .../net/wireless/mediatek/mt76/mt7921/regd.h  |   2 +-
 .../wireless/mediatek/mt76/mt7925/debugfs.c   |  41 +
 .../net/wireless/mediatek/mt76/mt7925/mac.c   |  23 +-
 .../net/wireless/mediatek/mt76/mt7925/main.c  | 843 +++++++++++++-----
 .../net/wireless/mediatek/mt76/mt7925/mcu.c   | 628 +++++++++----
 .../net/wireless/mediatek/mt76/mt7925/mcu.h   |  26 +-
 .../wireless/mediatek/mt76/mt7925/mt7925.h    |  33 +-
 .../net/wireless/mediatek/mt76/mt7925/pci.c   |   4 +-
 .../net/wireless/mediatek/mt76/mt7925/regd.c  |   4 +-
 .../net/wireless/mediatek/mt76/mt7925/regd.h  |   2 +-
 drivers/net/wireless/mediatek/mt76/mt792x.h   |  56 +-
 .../net/wireless/mediatek/mt76/mt792x_core.c  |  23 +-
 19 files changed, 1251 insertions(+), 476 deletions(-)

-- 
2.45.2


