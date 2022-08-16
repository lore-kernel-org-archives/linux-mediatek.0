Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B3CEC28D13
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Aug 2022 14:16:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ipYSdnHtEGC1qJEq9yMaN5uK8xzGfbStENG7194dhRs=; b=3RIPXr7aPd9XftHmGe7zBOphEt
	ZU/Q3/TgefTBhhhS/hZMsPQB7LewAyx+KEMNF4H9Jq+li5azBKwhvzGzkjkB26XTxz2astt1yPGtR
	cC5TR/gMf7LzQB46+p0x4wAxvuxTL/JH1BpiDoK1u488UcmhbvPnU8ptT543iV3nMsUSUbW+hgdcs
	oKm3V+5o0G7fC5UsC82FLsAf2pO2i3lB1Iq/hqspqs906VnalGSFIPCCXYxyfjQ+XfztjseoRQDra
	QgBXAZi40yuNqOoyM7gQwOYCj94pDl89lCfOvUHqWY/QkexgxTQMZH9d7deYa7VaLkoB5qIhhvLkw
	Nov4ZGiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQ8DT-00Asb7-Au; Mon, 22 Aug 2022 14:15:47 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNn1D-009gTH-MB
	for linux-mediatek@lists.infradead.org; Tue, 16 Aug 2022 03:13:29 +0000
X-UUID: 8e35fde332e84346a5181b7ee31ac8e1-20220815
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=ipYSdnHtEGC1qJEq9yMaN5uK8xzGfbStENG7194dhRs=;
	b=tOjME5BiKr9Egyf6M1xVeDAANJn03DF8QoQ+e58dDUcd5PkpMgjlhpNS2viJABPqNr66Uv2aBJ7VOiL5PrIu+Nz49TI1KW29RipWEqGxmR3Baw2pYHCnB1dY68Ln2hrhMwWHc7HGjNf0deTYLCFDZ6HclJNIUZmqcn0eiwRF4sA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.9,REQID:91258e44-8218-42c7-b2ba-ea0ad68ca2d8,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_
	Ham,ACTION:release,TS:-5
X-CID-META: VersionHash:3d8acc9,CLOUDID:0487eaae-9535-44a6-aa9b-7f62b79b6ff6,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 8e35fde332e84346a5181b7ee31ac8e1-20220815
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <tinghan.shen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 293656833; Mon, 15 Aug 2022 20:13:21 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3;
 Tue, 16 Aug 2022 10:22:43 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 16 Aug 2022 10:22:43 +0800
Message-ID: <573792ba92de237d23a9a1c99cb45d5ccdff5067.camel@mediatek.com>
Subject: [PULL linux-firmware] Clean up mediatek WHENCE licence terms
From: Tinghan Shen <tinghan.shen@mediatek.com>
To: <linux-firmware@kernel.org>
CC: <linux-mediatek@lists.infradead.org>, <allen-kh.cheng@mediatek.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Tue, 16 Aug 2022 10:22:43 +0800
In-Reply-To: <bee56d689e67b4bb4d46d14d07e93ab212a6bb6b.camel@mediatek.com>
References: <bee56d689e67b4bb4d46d14d07e93ab212a6bb6b.camel@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-Bad-Reply: References and In-Reply-To but no 'Re:' in Subject.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220815_201327_754213_37E675AA 
X-CRM114-Status: UNSURE (   7.20  )
X-CRM114-Notice: Please train this message.
X-Mailman-Approved-At: Mon, 22 Aug 2022 07:15:37 -0700
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

Hi maintainers,

This pull request cleans up the WHENCE for MediaTek firmwares.

Please let me know if there are any problems.

Best regards,
TingHan

---

The following changes since commit 8413c63c7a539a912be8851ce941eea32dcd1786:

  Merge branch 'lenovo-thinkpad-x13s' of https://github.com/mrhpearson/linux-firmware (2022-08-15
09:02:17 -0400)

are available in the Git repository at:

  https://github.com/tinghan-shen/linux_fw_scp mtk-20220816

for you to fetch changes up to a1c4b15986c07cdad873a72b1e130ea1fb02c5fa:

  mediatek: reference the LICENCE file for MediaTek firmwares (2022-08-16 10:13:16 +0800)

----------------------------------------------------------------
Tinghan Shen (1):
      mediatek: reference the LICENCE file for MediaTek firmwares

 WHENCE | 42 ++++++------------------------------------
 1 file changed, 6 insertions(+), 36 deletions(-)


