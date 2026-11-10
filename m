Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8BCC606A32E
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Nov 2026 12:34:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0jKhvnP/;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=JCntIEsa
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=cxMTIjXRdQvtPP725G7qVD4ba99GFCdXfLsXZF2kHPw=; b=0jKhvnP/jJT1228LS7fsL3HBve
	/vRyFk5zA+wkrVo3I+PlL8LDDzkYLGEfxmMNEwuAXh4H2bh1Ttoq4MFe/pCYWeUCCo+3Ics0dBhM0
	Y8r69Su4cawsrItVXUTdj8Tt7bgjExZI6845gbB7ejcaeOneJcz+sNxNw4b0Vcm9VbsVHF7NgVfgQ
	RkXarqnnJBkS3AHwCu90JPRp23plPiBI47i1EMh7pnLDI94CKwLHMwIusKCRlllxo2yU23w/wtRrF
	o3LnR53V1TIlQ5XC/Es8s+stfvjSltqrO4P0+wKvPoCrruNnN1HX2GwedaiJbuXe/tu1q6qPfr76V
	cPqYVpsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQl39-00000003rgC-1nkx;
	Tue, 10 Nov 2026 12:34:07 +0000
Received: from [216.200.240.185] (helo=mailgw02.mediatek.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQl36-00000003rez-3nFy
	for linux-mediatek@lists.infradead.org;
	Tue, 10 Nov 2026 12:34:06 +0000
X-UUID: ffafcd28dd0211f1acbe4559397dec65-20261110
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=cxMTIjXRdQvtPP725G7qVD4ba99GFCdXfLsXZF2kHPw=;
	b=JCntIEsaeWsym3hkqSijBiYV31IDHg808a3h1Eo30GWBwMs6IiscmR5VFsczO9TJS61+84sAz5jcfLhwt+jg/20S1yONvQfmj8r5hlJBRmgXHfMhamZewR+JJU8sFoXYBRebZRIFzKKRcu8tI33oqxeFRN/RS8ZCy6505bhZn4s=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:237c1b13-8915-49f0-8d0e-dbb294629488,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0318ac,CLOUDID:69801966-4b51-4c95-bb1b-80ac6aad9c96,B
	ulkID:nil,BulkQuantity:0,SF:102|136|836|865|888|898,TC:-5,Content:0|15|50|
	99,EDM:-3|-100,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OS
	I:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: ffafcd28dd0211f1acbe4559397dec65-20261110
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw02.mediatek.com
	(envelope-from <james-ly.huang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 789523212; Tue, 10 Nov 2026 05:33:57 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 10 Nov 2026 20:33:55 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Tue, 10 Nov 2026 20:33:55 +0800
From: James-LY Huang <james-ly.huang@mediatek.com>
To: <nbd@nbd.name>, <lorenzo@kernel.org>
CC: <linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<sean.wang@mediatek.com>, <jb.tsai@mediatek.com>, <kun.wu@mediatek.com>,
	<James-LY.Huang@mediatek.com>, mtk18285 <james-ly.huang@mediatek.com>
Subject: [PATCH v2 0/1] wifi: mac80211: don't coalesce a new ROC onto an expired one
Date: Tue, 10 Nov 2026 20:33:50 +0800
Message-ID: <20261110123351.566633-1-james-ly.huang@mediatek.com>
X-Mailer: git-send-email 2.45.2
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_043404_957209_43249D32 
X-CRM114-Status: UNSURE (   9.88  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.3 (-)
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

From: mtk18285 <james-ly.huang@mediatek.com>

ieee80211_coalesce_hw_started_roc() merges a new remain-on-channel
request into a running one when the new duration fits into the time
the running ROC has left. That remaining time is computed with an
unsigned subtraction which wraps when the running ROC has already
expired, so the "fits" check passes and the new request is queued
behind a ROC that has already delivered its events: the new ROC is
never started, and the cookie handed to userspace never expires.

The expired-but-still-listed state is not rare: a driver usually
processes ieee80211_remain_on_channel_expired() in a work item, so
until that work runs every ROC whose time is up stays listed with
started=true.

This series refuses to coalesce once the running ROC's end time has
passed, so a new request always gets a fresh ROC of its own. It has
been verified with a full x86_64 defconfig kernel build and passes
scripts/checkpatch.pl with no errors or warnings.

Changes in v2:
  - rewrite the commit message and the code comment as requested
    by the reviewer; no functional change.

james-ly huang (1):
  wifi: mac80211: don't coalesce a new ROC onto an expired one

 net/mac80211/offchannel.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

--
2.45.2


