Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1255606A31E
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Oct 2026 02:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ZojJ38xm;
	dkim=pass (1024-bit key, unprotected) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=VEECkWiL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=0DV7tMjRSGpWgrPEB8r/sZahHaIcSHsSwlL4yELocFE=; b=ZojJ38xmEDsxFSAFyBO7AV4RBw
	1+xrQeFwOs8AVYkU4vpTIzHCOr/jV3wMAlBMlt+iqhle4sXtHc7BFf9uFEfnT62G9/QEiz35KJQdW
	7Z3H/HEH0GRZLT4N9lV0Tt9PeddVDJO0AzrIxPslOQuxUfJIuBtbgQ1vjPAuWTiUYDXIXRgbbpQZZ
	gWTrRzpYPlygO9CJE4RpFp30qLlqdCSusie7quba+aQ9KAPqXLkA6wNkZfoISHbVCtCBn/8GtP/1l
	KGZIQ/XOhfY4v8o/LFM6NbCNQdxKq+qVzOk58KDLe4zWYUk8pgbVXiwyjXRdUjvbMeGSK9GlajgLk
	QyN+TUoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLt83-00000006508-1k3q;
	Wed, 28 Oct 2026 02:11:03 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLt80-000000064zb-18I5
	for linux-mediatek@lists.infradead.org;
	Wed, 28 Oct 2026 02:11:01 +0000
X-UUID: d04dbc40d27411f1afed4741b24580c9-20261027
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=0DV7tMjRSGpWgrPEB8r/sZahHaIcSHsSwlL4yELocFE=;
	b=VEECkWiL/4xjFxhdixNE5KRmJJK1xhyDGPD9dojVcMaLDCPz6ap/7Vm4GhYmpMK8qbERkwvnRHe7VtdJJqUh2qDhoe2n3TFq712RkezEb2mf1JL5njYhKicZXGX1hCbdvmhahr3TBKH7QqMdIdv+NP01rhp+AnjbKqdQN4mn1qk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.20,REQID:63b6a5c1-727b-426e-b2f4-e9a60a13c71c,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:291e20b,CLOUDID:5a4ea6d3-0590-4903-a326-8425b6d3214f,B
	ulkID:nil,BulkQuantity:0,SF:102|836|865|888|898,TC:-5,Content:0|15|50|99,E
	DM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0,OSA:0,
	AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: d04dbc40d27411f1afed4741b24580c9-20261027
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <eason.lai@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1838934688; Tue, 27 Oct 2026 19:10:57 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS14N2.mediatek.inc (172.21.101.76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 28 Oct 2026 10:10:55 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Wed, 28 Oct 2026 10:10:55 +0800
From: Eason Lai <eason.lai@mediatek.com>
To: <nbd@nbd.name>, <lorenzo@kernel.org>
CC: <linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<kun.wu@mediatek.com>, <deren.wu@mediatek.com>, <sean.wang@mediatek.com>,
	<quan.zhou@mediatek.com>, <ryder.lee@mediatek.com>, <leon.yen@mediatek.com>,
	<litien.chang@mediatek.com>, <jb.tsai@mediatek.com>,
	<lucid_duck@justthetip.ca>, <eason.lai@mediatek.com>,
	<stable@vger.kernel.org>
Subject: [PATCH v1 0/2] wifi: mt76: Fix UAF and SKB leaks in RX A-MSDU path
Date: Wed, 28 Oct 2026 10:10:51 +0800
Message-ID: <20261028021053.2220951-1-eason.lai@mediatek.com>
X-Mailer: git-send-email 2.45.2
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_191100_334508_4C8367D0 
X-CRM114-Status: UNSURE (   6.54  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This patch series addresses a Use-After-Free bug and SKB memory leaks
 occurring in the RX A-MSDU reassembly codepath of the mt76 driver.

Eason Lai (2):
  wifi: mt76: flush a partial rx A-MSDU when its station is removed
  wifi: mt76: free a partial rx A-MSDU when the phy is unregistered

 drivers/net/wireless/mediatek/mt76/mac80211.c | 65 +++++++++++++++++++
 drivers/net/wireless/mediatek/mt76/mt76.h     |  1 +
 2 files changed, 66 insertions(+)

-- 
2.45.2


