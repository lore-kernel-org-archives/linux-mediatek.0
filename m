Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7F63606A32A
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Nov 2026 13:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=TbzG3qKT;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=Xc1E496O
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:CC:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=WUvvXrsa8EZV4ZQ48zTHQQIBWcM+QD2e7+pOO8N3CPI=; b=TbzG3qKTnnSzwodMmmyDDvddB1
	DaSQQOOrgNxoxa9sbY7xcGz3jkakkvUjc+tauNJ0KcllDwk8ZYfQ7jbEE/BbLO4Yf373SPKgx16Cw
	wO316yF2tVBOVRvxhTQvb39D+en91nXMyNRmFFwOnLRXhCRRki8Dwi32Yl6Urwoc9+irPA5kz+nOH
	JUPPEWL/hJC8tzF6iApDS5Dr+xQJi7dhrdKVwrUiUp5dH5Fw9ECCY/KTQF51nnjnJ93bVZbmdCKk8
	bOw45OOzywmddK+0NbbLvDSSVnixPHUzjf0pzRmRFzfLa2VrLtxhKh37Nqx09tDtA9beGdlyRkfqW
	GFBQZhAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWZ6p-0000000DHer-2q8B;
	Thu, 26 Nov 2026 13:01:55 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWZ6l-0000000DHdM-3K1r
	for linux-mediatek@lists.infradead.org;
	Thu, 26 Nov 2026 13:01:53 +0000
X-UUID: 80e08afce99911f1a36277631523a8d6-20261126
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=WUvvXrsa8EZV4ZQ48zTHQQIBWcM+QD2e7+pOO8N3CPI=;
	b=Xc1E496O+z8bQRUhw/meNCbP5KI8N13tczDWPAJA2R+U2b13CwCHG9jnZCrFarBIlmBcgamf+6Rl8Y5CUrVWgcYXjYCEdl+I10RztC1dGdVJoi6Yn57bUHSnidjTAW2RpIPdfmFjnuCWCa0YYi5jTY6GDChRsGYckmXGKQub2O4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:b3e560f3-f581-4ea2-bd29-17925392871d,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0318ac,CLOUDID:3724191a-ae4c-4a2b-b1c4-72e411efd0c9,B
	ulkID:nil,BulkQuantity:0,SF:80|81|82|83|102|836|865|888|898,TC:-5,Content:
	0|15|50|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0
	,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 80e08afce99911f1a36277631523a8d6-20261126
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw01.mediatek.com
	(envelope-from <peter.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 548917701; Thu, 26 Nov 2026 06:01:32 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 26 Nov 2026 21:01:30 +0800
Received: from [10.233.130.16] (10.233.130.16) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.2562.56 via Frontend
 Transport; Thu, 26 Nov 2026 21:01:30 +0800
Message-ID: <4cd159bd4204d92dc0d9a79e6f7aa53c1fa9f2de.camel@mediatek.com>
Subject: Re: [PATCH v2 1/3] scsi: ufs: mediatek: skip PA_TXHSADAPTTYPE on
 pre-UniPro-1.8 hosts
From: Peter Wang <peter.wang@mediatek.com>
To: <iasnezhkov@gmail.com>, <stanley.chu@mediatek.com>,
	<martin.petersen@oracle.com>, <James.Bottomley@HansenPartnership.com>
CC: <matthias.bgg@gmail.com>, <angelogioacchino.delregno@collabora.com>,
	<louisalexis.eyraud@collabora.com>, <linux-scsi@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Date: Thu, 26 Nov 2026 21:01:30 +0800
In-Reply-To: <20261126031008.27506-2-iasnezhkov@gmail.com>
References: <20261126031008.27506-1-iasnezhkov@gmail.com>
	 <20261126031008.27506-2-iasnezhkov@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1.1 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_050151_838990_C6F85C96 
X-CRM114-Status: GOOD (  10.37  )
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

On Thu, 2026-11-26 at 03:10 +0000, Ilia Snezhkov via B4 Relay wrote:
> From: Ilia Snezhkov <iasnezhkov@gmail.com>
>=20
> ufs_mtk_pre_pwr_change() calls ufshcd_dme_configure_adapt() on every
> power mode change, which writes PA_TXHSADAPTTYPE (0x15d4) even when
> passing PA_NO_ADAPT. PA_TXHSADAPTTYPE was introduced in UniPro 1.8,
> and
> ufs_mtk_get_controller_version() sets host->hw_ver.major =3D 3 only
> when
> PA_LOCALVERINFO >=3D UFS_UNIPRO_VER_1_8 (leaving older hosts at major =3D
> 2).
>=20
> On pre-UniPro-1.8 MediaTek hosts such as MT6789 (UFS 2.2, HS-G3 rate
> B),
> the DME write fails on every gear change with
> "dme-set: attr-id 0x15d4 val 0x3 failed 0 retries". While mainline
> ufshcd_change_power_mode() ignores the PRE_CHANGE return value after
> commit d3eba21c7170 ("scsi: ufs: core: Introduce a new ufshcd vops
> negotiate_pwr_mode()"), older stable kernels still discard the
> negotiated parameters on PRE_CHANGE failure, and mainline still emits
> spurious DME-SET errors on every power-mode transition.
>=20
> Return early from ufs_mtk_pre_pwr_change() when host->hw_ver.major <
> 3
> so pre-UniPro-1.8 hosts do not write PA_TXHSADAPTTYPE, and simplify
> the
> remaining major >=3D 3 branch.
>=20
> Fixes: 7212d624f863 ("scsi: ufs: host: mediatek: Fix PWM mode switch
> issue")
> Signed-off-by: Ilia Snezhkov <iasnezhkov@gmail.com>
> ---

Hi Ilia,

Thank you for fixing this bug.

Reviewed-by: Peter Wang <peter.wang@mediatek.com>


