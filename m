Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E2A7606A330
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Nov 2026 03:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=I22C7qcF;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=pDabrebX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:CC:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=mOW7wpw7pclv2woSYadjIG+K3Lf/RuEbJvV+kxBzPXI=; b=I22C7qcFTL/df2OILwS9hpPd0g
	zo/vcMC01FPqvUcS94RNtALgamFArAUCT9OTdpk+5lpA99n7XtDf64AsmTKpblIzvl3LSS/qBnvXE
	l/Gefy0jEYSWVDGDGAtAGvhKMhTOGsVUjRDK0p6y0VzdYfpkuvnYhs+dSeTlDyoMqIlN8JuUqmHig
	vb5mOkYl/OcR3rXi1LQEGNsmRXdeOLz4fcuOcTMGDuIOmzl09dZLeY+Quk+8qXZ9ndOzHMxMSgZ7Q
	db2HsayDKJXagd+YQcDhEMz+HFavmoSs6GPhYhXl7fDciezJi7ZNPGXUUP53F6X5Q8IM5oNjD29Jx
	8Qo4JnkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTtEN-0000000AnWX-3kDg;
	Thu, 19 Nov 2026 03:54:39 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTtEL-0000000AnW5-1KLu
	for linux-mediatek@lists.infradead.org;
	Thu, 19 Nov 2026 03:54:38 +0000
X-UUID: ed01f20ce3cc11f1afed4741b24580c9-20261118
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=mOW7wpw7pclv2woSYadjIG+K3Lf/RuEbJvV+kxBzPXI=;
	b=pDabrebXJUxCMWehX64IETRX14jtV66wlrIxOlPbhrEt48/31phBfP5K+xXuwk1BRmvZL5I1eMr+Z7NrX/Eck5qlDfLYA5m3KG/CjzdBJhrfqq844TVlg0dmZWw61HlP55ott1gW/nicPlkyMcXY6wpSguzLvqmJQn2UHPWGfZw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:c1ecacda-5ccf-4790-aac6-2ea34821ee04,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0318ac,CLOUDID:33fa7e66-4b51-4c95-bb1b-80ac6aad9c96,B
	ulkID:nil,BulkQuantity:0,SF:80|81|82|83|102|836|865|888|898,TC:-5,Content:
	0|15|50|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0
	,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: ed01f20ce3cc11f1afed4741b24580c9-20261118
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw01.mediatek.com
	(envelope-from <peter.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 397002954; Wed, 18 Nov 2026 20:54:31 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 19 Nov 2026 11:54:29 +0800
Received: from [10.233.130.16] (10.233.130.16) by mtkmbs13n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.2562.29 via Frontend
 Transport; Thu, 19 Nov 2026 11:54:29 +0800
Message-ID: <403821fa1be0c7ec5c0b2c0235957bfa9818fd7e.camel@mediatek.com>
Subject: Re: [PATCH v2 1/2] scsi: ufs-mediatek: use devm_regulator_get() for
 the va09 regulator
From: Peter Wang <peter.wang@mediatek.com>
To: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>,
	<chaotian.jing@mediatek.com>
CC: <chu.stanley@gmail.com>, <alim.akhtar@samsung.com>, <bvanassche@acm.org>,
	<stanley.chu@mediatek.com>, <sashiko-bot@kernel.org>,
	<linux-scsi@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Date: Thu, 19 Nov 2026 11:54:29 +0800
In-Reply-To: <20261118032015.974-2-laixiangwu@cmss.chinamobile.com>
References: <20261118032015.974-1-laixiangwu@cmss.chinamobile.com>
	 <20261118032015.974-2-laixiangwu@cmss.chinamobile.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1.1 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_195437_393203_4CE12BB4 
X-CRM114-Status: GOOD (  15.78  )
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

On Wed, 2026-11-18 at 11:20 +0800, Xiangwu Lai wrote:
> ufs_mtk_init_va09_pwr_ctrl() obtains the va09 regulator with
> regulator_get() but the reference is never released with
> regulator_put(), neither on driver unbind nor on probe failure. The
> other regulators handled by this driver (dvfsrc-vcore) are already
> obtained with devm_regulator_get_optional().
>=20
> Use devm_regulator_get() so that the reference is released
> automatically when the UFS device is detached.
>=20
> This alone is not enough, though: ufs_mtk_init() powers the M-PHY on,
> which enables the va09 regulator, and nothing powers it off again on
> the way out -- the variant operations have no .exit callback and
> ufshcd_pltfrm_remove() only resumes the device.=C2=A0 The devm release
> would then hit WARN_ON(regulator->enable_count) in _regulator_put()
> and leak the enable reference.
>=20
> Balance the use count by adding an .exit callback which powers the
> M-PHY off, in the same spirit as the .exit callbacks of ufs-exynos
> and ufs-qcom.=C2=A0 ufshcd_hba_exit() invokes it both on driver unbind an=
d
> on ufshcd_init() failure after the variant init, so the enable count
> is always balanced by the time devm releases the regulator.=C2=A0 It
> relies on the state tracking in ufs_mtk_mphy_power_on() and is a
> no-op if the M-PHY was never powered on.
>=20
> Fixes: cf137b3ea49a ("scsi: ufs-mediatek: Support VA09 regulator
> operations")
> Signed-off-by: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>
> ---

Hi Xiangwu,

Thanks for fix this bug.
Reviewed-by: Peter Wang <peter.wang@mediatek.com>



