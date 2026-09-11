Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 353D7C88E4A
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Sep 2026 10:43:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xHKh2ur1SC89+M37Jy0ih6zuudaICpT10+VsOS5BA6Y=; b=x/HPll1HMIRHvABxb7oDbdDfK9
	3fMYapni/IfmiU3QRy/1XF+wSylLpN1KDLuiMyt1E3PFMDl+F9ylOKy8NtdqGKfvJvtJ5deXBCYKa
	9ZcxILehezOt4ua7sF9xL8/ugtAO5KYbKhJgDOrhxZmjt98TtyY2uoSePgeQJHVV1/R/7WKllqdYq
	WSCqWA8zD6t358CoflTbtdCER+B71LvqNvO383GsUk8/CsO49yqXdb7K+Lg8hRwSAbCyfULijxaWF
	NuGPR2+0IRWh3tXyTsh7qJ3u9GgZmcOwSuhkdYtiuI+DuRqsMH5s6KV3uVWzveU6fw2bQ+NI2w83u
	mxf6/MYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4yij-0000000GPYl-0S2e;
	Fri, 11 Sep 2026 10:43:01 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4yie-0000000GPY2-2otp
	for linux-mediatek@bombadil.infradead.org;
	Fri, 11 Sep 2026 10:42:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=xHKh2ur1SC89+M37Jy0ih6zuudaICpT10+VsOS5BA6Y=; b=oA0ljgQ2EFn1+BaVdAEyylYzd2
	G/V2mgle5XrCGDj79sEtBQAw+1hz612zcByQJiQdFZr7rZ6YU8EaugTDGsv38CG/z/b/UccWeiUWo
	t52iJ2jjrEbQZO6MP1GelyDX63p/C7YRy1fY0Yw7Y7nfbd/hHEkR10xz8+VIBVU8lnWbly4Y+eAZV
	+uI3Cgn/bYuFrpfz7eBswBopGXbsf+5aMOJ6S6NCtZYqCqcThdWVsTtKUVC7pBluy7dlMHpTYr/50
	MLI3UtTBTX5lkSM2bjpGqhfSGV9fnd75EzefY6IJs1uqkzU6ikr2EsrQ0dV88KRvOEsjlCfzNiHDe
	DzVqn0uw==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x4yib-00000003TxN-1Djy
	for linux-mediatek@lists.infradead.org;
	Fri, 11 Sep 2026 10:42:55 +0000
X-UUID: 829ae1e2adcd11f1afed4741b24580c9-20260911
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=xHKh2ur1SC89+M37Jy0ih6zuudaICpT10+VsOS5BA6Y=;
	b=TEtnid3tCh4+fxf9e5ZcwVwGyCdQWamo+H6RoGoVvm0vjVABMHCuz5NKbnzK2QKViTiy0VqF/7ozDUaxGkh6vT3xsHg3xUk6nufOVmX4xAMwNV+Ae8mY+PiyreFNLrZYkhzdOKv4M6/U/3WevHYrKmC2jxbkAqVq8lVhiOZP0MI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:d7bc70c0-22eb-432e-9b07-3479abe09ea2,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:7db8b62,CLOUDID:84b7b4e2-72a5-4ba1-af40-18bbd6ea8ffd,B
	ulkID:nil,BulkQuantity:0,SF:102|136|836|865|888|898,TC:-5,Content:0|15|50|
	99,EDM:-3|-100,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI
	:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 829ae1e2adcd11f1afed4741b24580c9-20260911
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw01.mediatek.com
	(envelope-from <chris.lu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 35934865; Fri, 11 Sep 2026 03:42:39 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 11 Sep 2026 18:42:37 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Fri, 11 Sep 2026 18:42:36 +0800
From: Chris Lu <chris.lu@mediatek.com>
To: Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg
	<johan.hedberg@gmail.com>, Luiz Von Dentz <luiz.dentz@gmail.com>
CC: Sean Wang <sean.wang@mediatek.com>, Will Lee <will-cy.Lee@mediatek.com>,
	SS Wu <ss.wu@mediatek.com>, linux-bluetooth
	<linux-bluetooth@vger.kernel.org>, linux-kernel
	<linux-kernel@vger.kernel.org>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Chris Lu <chris.lu@mediatek.com>
Subject: [PATCH 0/3] Bluetooth: btmtk: firmware debug event routing and WMT FUNC_CTRL status fixes
Date: Fri, 11 Sep 2026 18:42:31 +0800
Message-ID: <20260911104234.2276126-1-chris.lu@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_114253_720244_F5C45BAE 
X-CRM114-Status: GOOD (  12.42  )
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

This series bundles three independent MediaTek Bluetooth driver fixes:

Patch 1 is a resend of a fix submitted on 25 Aug 2026
("Bluetooth: btmtk: Route firmware debug event to the diag channel")
that received no review feedback. There are no code changes since
that submission; resending it alongside the two related fixes below.

Patches 2-3 fix how btmtk_usb_hci_wmt_sync() (and its btmtksdio.c /
btmtkuart.c counterparts) interpret a WMT FUNC_CTRL event that carries
only the WMT header and no trailing 2-byte status word. Such an event
is a normal firmware ack for a plain enable/disable request, with the
result carried in the header's own flag byte, not a failure as the
current code assumes:

  - Patch 2 fixes this for btmtk.c, where a bounds check already
    existed (added by e3ac0d9f1a20) but defaulted to the wrong
    result.
  - Patch 3 applies the same fix to btmtksdio.c and btmtkuart.c, which
    never had a bounds check for this event at all and read 2 bytes
    past the end of the received SKB whenever firmware sent the short
    form. While there, it also adds the missing base WMT header length
    check that btmtk.c already has (skb_pull_data() before touching
    wmt_evt->whdr.op), since these two files were unconditionally
    dereferencing that field with no length validation at all.

Chris Lu (3):
  Bluetooth: btmtk: Route firmware debug event to the diag channel
  Bluetooth: btmtk: fix wrong status for short WMT FUNC_CTRL events
  Bluetooth: btmtksdio, btmtkuart: validate WMT event length before
    struct access

 drivers/bluetooth/btmtk.c     |  8 +++++++-
 drivers/bluetooth/btmtksdio.c | 20 +++++++++++++++++++-
 drivers/bluetooth/btmtkuart.c | 19 ++++++++++++++++++-
 3 files changed, 44 insertions(+), 3 deletions(-)

--
2.45.2

