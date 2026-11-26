Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1652D606A338
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Nov 2026 13:03:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Fy1e44kW;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=L9sZyiyH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:CC:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Fa6NXrsDozB7gjepeSR0YoULRjFFJmjFRwH3pYoOlpE=; b=Fy1e44kWPARrP8mXsgdscFJMe0
	yPT4LUOTPmPRu8mvVVxZtDe6UMqL3b95hxluyk7JfH1lgSLCZHcNFPqUz+CvpsXuPorvR58peO8R/
	oenQMEB8+ZFpGUm6v+5t4cdnwet/yMYTWEIQDlWsPvTAOXOtBDr9i71x67Nttb8J2Lka132nC7J78
	3HYRdHazSgYmd4nU61G1GKZjtrTUPScFGaUNTjK/RxszN1EAdRUXnsuz1Itt94c7x6CD1RNQHbUlN
	hYt5CCxY3tKUY/1n2ZnM10hcL5N0EuCEZ1JbVWiOtF7ejx9ks26nMTBcXjd0v6LLS1bjBPszlp4ZO
	uLrl+Ztw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWZ85-0000000DHq5-3Ncj;
	Thu, 26 Nov 2026 13:03:13 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWZ83-0000000DHpK-1kHx
	for linux-mediatek@lists.infradead.org;
	Thu, 26 Nov 2026 13:03:12 +0000
X-UUID: b8ea0be4e99911f1a36277631523a8d6-20261126
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=Fa6NXrsDozB7gjepeSR0YoULRjFFJmjFRwH3pYoOlpE=;
	b=L9sZyiyHsr3q9lywOqwHskdf/OW4mcIlcfaEkOM0KkwjKgi13ujvS0dVN1wuysk1/OlHufb3ETvCCuTYxB61n4FeuhTDwzr4vsFiW53cplED1fKK0h1nl+8FKM7YdrootPr4ZrcGPPqOok6WkIR3GKo1ce71IgD1wb1UeaqGg50=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:da47de81-80b7-4e72-8424-ed529c1ef7af,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0318ac,CLOUDID:c227191a-ae4c-4a2b-b1c4-72e411efd0c9,B
	ulkID:nil,BulkQuantity:0,SF:80|81|82|83|102|836|865|888|898,TC:-5,Content:
	0|15|50|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0
	,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: b8ea0be4e99911f1a36277631523a8d6-20261126
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw01.mediatek.com
	(envelope-from <peter.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 57269809; Thu, 26 Nov 2026 06:03:06 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 26 Nov 2026 21:03:04 +0800
Received: from [10.233.130.16] (10.233.130.16) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.2562.56 via Frontend
 Transport; Thu, 26 Nov 2026 21:03:04 +0800
Message-ID: <7b7d94ab4283b82aec13eae3f9c1d2e77873d88f.camel@mediatek.com>
Subject: Re: [PATCH v2 2/3] scsi: ufs: mediatek: allow clock scaling when
 ufs_fde is absent
From: Peter Wang <peter.wang@mediatek.com>
To: <iasnezhkov@gmail.com>, <stanley.chu@mediatek.com>,
	<martin.petersen@oracle.com>, <James.Bottomley@HansenPartnership.com>
CC: <matthias.bgg@gmail.com>, <angelogioacchino.delregno@collabora.com>,
	<louisalexis.eyraud@collabora.com>, <linux-scsi@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Date: Thu, 26 Nov 2026 21:03:04 +0800
In-Reply-To: <20261126031008.27506-3-iasnezhkov@gmail.com>
References: <20261126031008.27506-1-iasnezhkov@gmail.com>
	 <20261126031008.27506-3-iasnezhkov@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1.1 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_050311_527737_D8D6D547 
X-CRM114-Status: UNSURE (   8.49  )
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, 2026-11-26 at 03:10 +0000, Ilia Snezhkov via B4 Relay wrote:
> From: Ilia Snezhkov <iasnezhkov@gmail.com>
>=20
> ufs_mtk_is_clk_scale_ready() enables UFSHCD_CAP_CLK_SCALING whenever
> ufs_sel, ufs_sel_max_src, and ufs_sel_min_src are present, treating
> the
> FDE (AES) clock as optional. However, _ufs_mtk_clk_scale() bails out
> early on !fde_clki, so on SoCs without a ufs_fde clock (such as
> MT6789)
> ufshcd believes scaling succeeded and updates clki->curr_freq while
> the
> ufs_sel mux never switches parents.
>=20
> Only require clki (ufs_sel) in _ufs_mtk_clk_scale(), and gate
> clk_fde_scale on fde_clki being non-NULL alongside its min/max
> parents.

Hi Ilia,

The logic is basically fine, but I'm a bit curious:=20
would this change cause MT6789 to enable UFSHCD_CAP_CLK_SCALING?

Thanks
Peter

