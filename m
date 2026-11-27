Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5821E606A338
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Nov 2026 07:11:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1mQRu29K;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=KAyNRYEc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:CC:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=3QOsyC3d/SLSTb/1ylJFJGSRibhbpTAj/BABfWdbacQ=; b=1mQRu29K2IaUFzMEqXvXdCmpDP
	na6vc/NaZX2Ln4tjbaa44J3xptEFEZkl3llbVZ9X/y1shhB1oVRhNI4xmGtuTqBBU4mokrpY+Q1hD
	wR2pRJeWZGeh9tflWYRZyCqXNXb4RMBd2FdNFZEE4ViD9il9THMU4FZn5PH7jDbLIiu5ceB0cXPmt
	NKM30uzuWTeoedLWH3kbxjU8pj3s4vmqDU45quk6G51yAWo/R7OLtedddQXRYuhRRwoxXluEKPeEA
	pu+kFhPdiyK26wRFssfqycEEP4S+Yztl0sF2p9i4u8HT8nLoC/wXl0PX3JP/08FgHQvvaq3iHafok
	XrHkQ8fA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWq7B-0000000F66U-49Vk;
	Fri, 27 Nov 2026 07:11:25 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWq79-0000000F65b-34DI
	for linux-mediatek@lists.infradead.org;
	Fri, 27 Nov 2026 07:11:24 +0000
X-UUID: bcea52f6ea3111f1a170bf5142e12a73-20261127
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=3QOsyC3d/SLSTb/1ylJFJGSRibhbpTAj/BABfWdbacQ=;
	b=KAyNRYEc0yxSK1mEAif+XKz27wXZeW2TkzNp4Is/8C+yPUkd9E85iVjOKKejlArwpwyMWj889U/kPoGmRyMeJv1Dnw204fur2uQ6fxPaW3uJwYGxbfBQnuFkpy9t8Xm08VPu4NmmUon7j6q6idiLAg7bMqdwI5gLGoBXVkmthFc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:7d7fbeab-18ba-43a3-85b7-055d05b426f9,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0318ac,CLOUDID:9661221a-ae4c-4a2b-b1c4-72e411efd0c9,B
	ulkID:nil,BulkQuantity:0,SF:80|81|82|83|102|836|865|888|898,TC:-5,Content:
	0|15|50|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0
	,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: bcea52f6ea3111f1a170bf5142e12a73-20261127
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <peter.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1393304081; Fri, 27 Nov 2026 00:11:16 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 27 Nov 2026 15:11:14 +0800
Received: from [10.233.130.16] (10.233.130.16) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.2562.56 via Frontend
 Transport; Fri, 27 Nov 2026 15:11:14 +0800
Message-ID: <57233f9eb3071e5393e2b4d84603303c0de39d28.camel@mediatek.com>
Subject: Re: [PATCH v2 3/3] scsi: ufs: mediatek: round scalable clock bounds
 to clk_round_rate()
From: Peter Wang <peter.wang@mediatek.com>
To: Ilia Snezhkov <iasnezhkov@gmail.com>
CC: <stanley.chu@mediatek.com>, <martin.petersen@oracle.com>,
	<James.Bottomley@HansenPartnership.com>, <matthias.bgg@gmail.com>,
	<angelogioacchino.delregno@collabora.com>,
	<louisalexis.eyraud@collabora.com>, <linux-scsi@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Date: Fri, 27 Nov 2026 15:11:14 +0800
In-Reply-To: <179574206826.56397.7920531590189565888@gmail.com>
References: <20261126031008.27506-1-iasnezhkov@gmail.com>
	 <20261126031008.27506-4-iasnezhkov@gmail.com>
	 <00ba0aec941a72c8401eab7c3d4036caa2ae8aee.camel@mediatek.com>
	 <179574206826.56397.7920531590189565888@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1.1 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_231123_788736_20E6FDF1 
X-CRM114-Status: GOOD (  11.01  )
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

On Fri, 2026-11-27 at 09:14 +0800, Ilia Snezhkov wrote:
> Hi Peter,
>=20
> It is not a missing hardware calibration =E2=80=94 it comes directly from=
 the
> fractional-N PLL PCW quantization against the 26 MHz reference
> crystal
> (clk26m).
>=20
> On MT6789, msdcpll has pcwbits =3D 22 and pcwibits =3D 8 (14 fractional
> bits, 2^14 =3D 16384), with VCO range 1500..3800 MHz, and
> ufs_sel_max_src
> is msdcpll_d2 (msdcpll / 2). To target msdcpll =3D 384 MHz (msdcpll_d2
> =3D
> 192 MHz) at postdiv =3D 4, VCO =3D 1536 MHz, so the required multiplier
> is:
>=20
> =C2=A0 1536 / 26 =3D 768 / 13 =3D 59 + 1/13
>=20
> Because 1/13 is a non-terminating binary fraction, no integer PCW
> value
> can represent 384 MHz exactly in 14 fractional bits:
>=20
> =C2=A0 pcw =3D 0xec4ec (967916) -> vco =3D 1535999512 Hz -> msdcpll =3D
> 383999878 Hz -> msdcpll_d2 =3D 191999939 Hz (-61 Hz)
> =C2=A0 pcw =3D 0xec4ed (967917) -> vco =3D 1536001099 Hz -> msdcpll =3D
> 384000275 Hz -> msdcpll_d2 =3D 192000137 Hz (+137 Hz)
>=20
> (With postdiv =3D 8, VCO =3D 3072 MHz =3D 26 MHz * (118 + 2/13), the
> closest
> PCW values give 191999939 Hz and 192000038 Hz =E2=80=94 still never exact=
ly
> 192000000 Hz.)
>=20
> So the CCF __mtk_pll_recalc_rate() / clk_round_rate() result for
> msdcpll_d2 is deterministically 191999939 Hz, which never matches a
> nominal 192000000 Hz entry in freq-table-hz under
> ufshcd_devfreq_target()'s
> exact `freq =3D=3D clki->max_freq` check.
>=20
> Best regards,
> Ilia

Thank you for your detailed explanation.
Reviewed-by: Peter Wang <peter.wang@mediatek.com>

