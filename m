Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8634606A320
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Nov 2026 08:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2OubsANJ;
	dkim=pass (1024-bit key, unprotected) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=fH1ocq9V
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:CC:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=AqkzVLGrEHHH2cGeDiEnwkkdjUHz1gM1+JaYx+muEzU=; b=2OubsANJoTe3sO3MHc6v3XXdvq
	wtFERUdO0JTPmcsHNCtjdrgeOChL8PAQBVTT6wWFN6mgvECK/pyq/jv/ktxlRny6H3ABm4UX+Bn6j
	j4pBZ5zcHq010Xzs4W2zZW+Z9pnIfs7TsD+OyOGmiSCZZ+qNPeSfuxTOiNqg+QaQ99xOUwiY6R0Dj
	u/UK2RGHMu61TImxbtJQX/I0WnvmNoas5grQR+oisd/uTLS8A4tBqpBq6xnRxss8ZL1zJAwvr5HJT
	YPM3ODX9Q1Z7m/IqVkaw+EUjPLFe0tY+dDg7kldxXnJihsLoGzER1wJxIB+BfCa5YsoGOfYltZoLi
	u0a4Lsdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTxdH-0000000BC0A-217H;
	Thu, 19 Nov 2026 08:36:39 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTxdE-0000000BBzX-23yV
	for linux-mediatek@lists.infradead.org;
	Thu, 19 Nov 2026 08:36:37 +0000
X-UUID: 513ca560e3f411f1afed4741b24580c9-20261119
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=AqkzVLGrEHHH2cGeDiEnwkkdjUHz1gM1+JaYx+muEzU=;
	b=fH1ocq9V370zm2BPfFIJE9Y0IgYyVcW3q/J8HQ8tOV3YBFwbyF0U4jMdrkbJnz2J8jkvJmUFTfJHs4qYRDMpISj247y88/a9DCwLf8KFPe3o8SjLTlG9rmSGgPTUVZdrONHPhEag+l8NLl9kI924W760ANBW4vIItKPJULSPiM8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:338785cd-84f8-47a8-90e9-01b784af3d7c,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0318ac,CLOUDID:a2f91031-f289-4656-bb36-27baf4489f11,B
	ulkID:nil,BulkQuantity:0,SF:80|81|82|83|102|836|865|888|898,TC:-5,Content:
	0|15|50|99,EDM:-3,IP:nil,URL:99|1,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,CO
	L:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 513ca560e3f411f1afed4741b24580c9-20261119
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <peter.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1827495572; Thu, 19 Nov 2026 01:36:29 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 19 Nov 2026 16:36:27 +0800
Received: from [10.233.130.16] (10.233.130.16) by mtkmbs13n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.2562.29 via Frontend
 Transport; Thu, 19 Nov 2026 16:36:27 +0800
Message-ID: <2a83ef7d6fd36085ff4140a894f51e0a9c50caac.camel@mediatek.com>
Subject: Re: [PATCH v3 2/2] scsi: ufs-mediatek: restore the M-PHY power
 state when va09 disable fails
From: Peter Wang <peter.wang@mediatek.com>
To: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>,
	<chaotian.jing@mediatek.com>
CC: <chu.stanley@gmail.com>, <alim.akhtar@samsung.com>, <bvanassche@acm.org>,
	<sashiko-bot@kernel.org>, <linux-scsi@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Date: Thu, 19 Nov 2026 16:36:27 +0800
In-Reply-To: <20261119071611.117-3-laixiangwu@cmss.chinamobile.com>
References: <20261119071611.117-1-laixiangwu@cmss.chinamobile.com>
	 <20261119071611.117-3-laixiangwu@cmss.chinamobile.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1.1 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_003636_562330_FC84D0D2 
X-CRM114-Status: GOOD (  14.90  )
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, 2026-11-19 at 15:16 +0800, Xiangwu Lai wrote:
> In ufs_mtk_mphy_power_on(), the power-off path tears the M-PHY down
> in
> two steps before regulator_disable() is called: phy_power_off() puts
> the PHY PLL and its clocks down, and ufs_mtk_va09_pwr_ctrl() asks the
> firmware to drop the VA09 supply.=C2=A0 If regulator_disable() then fails=
,
> the M-PHY stays physically off while host->mphy_powered_on is left
> set, so the next power-on attempt bails out through the
> !(on ^ host->mphy_powered_on) check and never powers the M-PHY back
> up, leaving the UFS host with an unpowered PHY (I/O timeouts,
> controller lockups).
>=20
> Simply forcing mphy_powered_on to false would trade this for two more
> problems.=C2=A0 First, the regulator core drops the consumer enable count
> only after a successful disable, so the count stays at 1, the next
> power-on raises it to 2 and it never returns to zero: va09 is then
> never physically disabled and the devm-acquired regulator would hit
> WARN_ON(enable_count) again on release.=C2=A0 Second, when the power-off
> fails during ufs_mtk_suspend(), the error recovery in
> __ufshcd_wl_suspend() runs ufshcd_host_reset_and_restore() without
> powering the M-PHY back on, which would run against an unpowered PHY.
> (Both points were raised by the Sashiko AI review of v2.)
>=20
> Since the va09 regulator stays enabled when its disable fails,
> restore
> the M-PHY power state instead: power the PHY back on through
> ufs_mtk_va09_pwr_ctrl() and phy_power_on() and leave mphy_powered_on
> set.=C2=A0 The next power-off attempt then retries the full sequence and
> the enable count stays balanced.
>=20
> Found by code inspection while reviewing the va09 error paths of the
> driver; the failure has not been observed on real hardware.
>=20
> Suggested-by: Peter Wang <peter.wang@mediatek.com>
> Link: https://lore.kernel.org/r/sashiko-outbox-220026@kernel.org
> Fixes: cf137b3ea49a ("scsi: ufs-mediatek: Support VA09 regulator
> operations")
> Signed-off-by: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>
> ---

Reviewed-by: Peter Wang <peter.wang@mediatek.com>


