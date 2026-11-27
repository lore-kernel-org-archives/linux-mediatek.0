Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5554606A33C
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Nov 2026 06:45:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=STILuoOG;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=o+SPqwlp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:CC:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=773F4lyJ6saT/RbUKk1mmsiaJd9WVNhH/WCIiJ+eX08=; b=STILuoOGtUiuSF4bYI3qLEZcKv
	E1z9zxuLwqoDJ5qwstPhx9DRJkAfeJc3Y0sGm94Fg4iOCwT7ykhenfvkhPAsFimc71xHtZxXmEBjz
	a8/bSeh7MsKJcCYq14cjE6AIEyvMbsZWAbvjk37fdIdAY2Be4hOPUrB1CmVdZ+TRCm4D1UdBlsPhQ
	amU/OxNhpLfOaZp4VM1yQW2W+Dw98Pi/91xwjvZGVW999h1tfCpMhKWtph98mYR81SfvDexXA779b
	MnMRQRyGzVqSOGmjZWRtuYZxAThVMBKjhRXZQm5kyMGxfm2L1yH1w2UM46Y2zP9gqVevAp6VnhNVK
	ARTnHOPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWphk-0000000F4bz-1vkl;
	Fri, 27 Nov 2026 06:45:08 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWphi-0000000F4bO-3PHY
	for linux-mediatek@lists.infradead.org;
	Fri, 27 Nov 2026 06:45:08 +0000
X-UUID: 11d4d4a2ea2e11f1a36277631523a8d6-20261126
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=773F4lyJ6saT/RbUKk1mmsiaJd9WVNhH/WCIiJ+eX08=;
	b=o+SPqwlpszB1NcPgKkLn4CW3CLu0BLqz2CkpgkOdTkqWeVRgTsL9HLb/MyJNO6UAnnsYxC51wefBb0cATYqEIGXJxmAIC3Rk3L+jKlyKFqRhHzMSeSiw654003/cxAdYkA1sCm73dv4L6ogl83l5TInl1Ekpkx3m1dXCpHCJL1g=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:2f1fc01c-e8cc-4d45-95f8-2d93b0015f15,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0318ac,CLOUDID:02506a31-f289-4656-bb36-27baf4489f11,B
	ulkID:nil,BulkQuantity:0,SF:80|81|82|83|102|836|865|888|898,TC:-5,Content:
	0|15|50|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0
	,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 11d4d4a2ea2e11f1a36277631523a8d6-20261126
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw01.mediatek.com
	(envelope-from <peter.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 329101209; Thu, 26 Nov 2026 23:45:01 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 27 Nov 2026 14:44:59 +0800
Received: from [10.233.130.16] (10.233.130.16) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.2562.56 via Frontend
 Transport; Fri, 27 Nov 2026 14:44:59 +0800
Message-ID: <484a58e10c4bc9cde24ef731a4bd3051b9decac6.camel@mediatek.com>
Subject: Re: [PATCH v2 2/3] scsi: ufs: mediatek: allow clock scaling when
 ufs_fde is absent
From: Peter Wang <peter.wang@mediatek.com>
To: Ilia Snezhkov <iasnezhkov@gmail.com>
CC: <martin.petersen@oracle.com>, <James.Bottomley@HansenPartnership.com>,
	<matthias.bgg@gmail.com>, <angelogioacchino.delregno@collabora.com>,
	<louisalexis.eyraud@collabora.com>, <linux-scsi@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Date: Fri, 27 Nov 2026 14:44:59 +0800
In-Reply-To: <179574184161.52486.4990124402659702610@gmail.com>
References: <20261126031008.27506-1-iasnezhkov@gmail.com>
	 <20261126031008.27506-3-iasnezhkov@gmail.com>
	 <7b7d94ab4283b82aec13eae3f9c1d2e77873d88f.camel@mediatek.com>
	 <179574184161.52486.4990124402659702610@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1.1 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_224507_115897_9F44A0C5 
X-CRM114-Status: GOOD (  11.74  )
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, 2026-11-27 at 09:10 +0800, Ilia Snezhkov wrote:
> Hi Peter,
>=20
> No =E2=80=94 this patch does not change whether UFSHCD_CAP_CLK_SCALING is
> enabled.
>=20
> ufs_mtk_is_clk_scale_ready() only checks ufs_sel, ufs_sel_max_src,
> and
> ufs_sel_min_src, so on any platform (including MT6789) whose DT
> provides those three clocks, UFSHCD_CAP_CLK_SCALING is already
> enabled
> today and devfreq already runs. Platforms that omit
> ufs_sel_{min,max}_src
> still have UFSHCD_CAP_CLK_SCALING cleared as before.
>=20
> What was broken without this patch is that when a DT provides ufs_sel
> and its min/max sources without ufs_fde, _ufs_mtk_clk_scale()
> returned
> early on `!fde_clki`, so ufs_sel never actually switched parents
> while
> ufshcd still treated the scaling transition as successful and updated
> clki->curr_freq.
>=20
> With this change, MT6789's already-enabled clock scaling actually
> switches ufs_sel between 26 MHz (tck_26m_mx9) and 192 MHz
> (msdcpll_d2)
> as intended.
>=20
> Best regards,
> Ilia

Hi Ilia,

Sorry, my question was not clear.
Because MediaTek sets the minimum gear to G4:
hba->clk_scaling.min_gear =3D UFS_HS_G4;
So if the host does not support UFS 4.0 or above, there=20
should be no reason to enable clock scaling.
And MT6789 is UFSHCI 2.1, as I remember, so clock scaling
should be disabled and ufs_sel_max_src/ufs_sel_min_src=20
should not be set. So I am curious why they have been set,=20
and what behavior would clock scaling change in the power mode?

Thanks
Peter

