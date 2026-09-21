Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D25D2C982EE
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Sep 2026 13:21:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:CC:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DMmrU7374bXu7rpn27MZ+FOc1NoZqY19Bvh/QjgStqo=; b=FNzL+sXkdm6BT9ofPK6cMc/3EB
	qJuiGL1lJ1gJRZSQtNzuRMJX8DL01nStyRhn3VxieiiEO0BvNB8fvW+3gAN57/jkYT+yV5+8vI1uE
	fkTjeZ847yPkAAUAUM21JSFyeHV8X2lMWozXv9G6UJoTu4pvUiOWIEam/v1jjHoVbFyySN1yyNE+i
	C+ATFT2WIDHNU+sqNEce40fHqK39gVCE+1KZdhk6kE0yEfKU1C0e0YbjN5C7sIogrhQmzIx4YsHEE
	ePTprtbLe3Jo4WVD2/MVnpUmMfMfSQUjtDhjFQFFyo32rSOWB4ASfl8G49NFOwRQ75RVG3PBei3Xt
	0pQtFldg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8dxF-00000002E6a-3A90;
	Mon, 21 Sep 2026 13:21:09 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8dxC-00000002E5t-2QPB
	for linux-mediatek@lists.infradead.org;
	Mon, 21 Sep 2026 13:21:07 +0000
X-UUID: 4b233e2cb5bf11f1afed4741b24580c9-20260921
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=DMmrU7374bXu7rpn27MZ+FOc1NoZqY19Bvh/QjgStqo=;
	b=DV1UxTr03H8GCBIx3mQ+Vw3MVf1aGm4xa8AcR977qfxTfiORCJIvDDSMOkBNzgb9LyYt1R9rZmCkUrKyn1pfc5Zn1aMd6O9wWH9BBSBSkNyLm1HJelv5qmKZOmUHJFNaDJSanFctwTQek1wbaSD8VHaJx7fJlKkJD9cFLVxu76Y=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:46e109fe-77a4-46db-8e31-5e856d53f89e,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:7db8b62,CLOUDID:da831de3-72a5-4ba1-af40-18bbd6ea8ffd,B
	ulkID:nil,BulkQuantity:0,SF:80|81|82|83|102|836|865|888|898,TC:-5,Content:
	0|15|50|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,
	OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 4b233e2cb5bf11f1afed4741b24580c9-20260921
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <peter.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 157353867; Mon, 21 Sep 2026 06:21:02 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 21 Sep 2026 21:21:00 +0800
Received: from [10.233.130.16] (10.233.130.16) by mtkmbs13n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.2562.29 via Frontend
 Transport; Mon, 21 Sep 2026 21:21:00 +0800
Message-ID: <21231fed9487b88316da067d9a7f6fbb812e7f98.camel@mediatek.com>
Subject: Re: [PATCH v1] scsi: ufs: core: Hold a clock reference across the
 probe
From: Peter Wang <peter.wang@mediatek.com>
To: Naomi Chu <naomi.chu@mediatek.com>, <linux-scsi@vger.kernel.org>,
	<mkp@kernel.org>, <avri.altman@sandisk.com>, <alim.akhtar@samsung.com>,
	<James.Bottomley@HansenPartnership.com>, <bvanassche@acm.org>
CC: <wsd_upstream@mediatek.com>, <alice.chao@mediatek.com>,
	<chun-hung.wu@mediatek.com>, <linux-mediatek@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <ed.tsai@mediatek.com>
Date: Mon, 21 Sep 2026 21:21:00 +0800
In-Reply-To: <20260909091045.1134956-1-naomi.chu@mediatek.com>
References: <20260909091045.1134956-1-naomi.chu@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_062106_625563_BF6DD21B 
X-CRM114-Status: GOOD (  17.81  )
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

On Wed, 2026-09-09 at 17:10 +0800, Naomi Chu wrote:
> Clock gating becomes possible as soon as ufshcd_init_clk_gating() has
> run, and from that point on the probe keeps accessing host registers
> without ever taking a clock reference. This has been safe only
> because
> of the state check in __ufshcd_release(): gate_work is not queued
> unless hba->ufshcd_state is UFSHCD_STATE_OPERATIONAL, and the
> promotion
> to that state used to happen after the last register access of the
> probe, at the end of ufshcd_probe_hba().
>=20
> That is fragile: it only works while the promotion happens after the
> register accesses. Commit a390e6677f41 ("scsi: ufs: core: Expand the
> ufshcd_device_init(hba, true) call") changed that ordering by moving
> the promotion into ufshcd_init(), which schedules ufshcd_async_scan()
> afterwards. ufshcd_probe_hba() therefore now runs with the state
> already promoted, and it accesses host registers without holding a
> clock reference:
>=20
> =C2=A0- on hosts with UFSHCD_QUIRK_REINIT_AFTER_MAX_GEAR_SWITCH it calls
> =C2=A0=C2=A0 ufshcd_hba_stop() and ufshcd_hba_enable() before
> =C2=A0=C2=A0 ufshcd_device_init() sets the state back to UFSHCD_STATE_RES=
ET,
> and
> =C2=A0=C2=A0 both read REG_CONTROLLER_ENABLE, so gated clocks stall there
> instead
> =C2=A0=C2=A0 of just losing a write.
> =C2=A0- it ends with an ufshcd_configure_auto_hibern8() write, which its
> =C2=A0=C2=A0 other callers do take a clock reference for.
>=20
> Take a clock reference as soon as clock gating has been initialised
> and
> keep it until the probe is over. It then does not matter who drops a
> clock reference while the probe is running, and the register accesses
> of the probe no longer depend on hba->ufshcd_state. The reference is
> dropped by ufshcd_async_scan() once the scan has finished, or by the
> new out_release label if the probe fails after it was taken.
>=20
> Fixes: a390e6677f41 ("scsi: ufs: core: Expand the
> ufshcd_device_init(hba, true) call")
> Signed-off-by: Naomi Chu <naomi.chu@mediatek.com>
> ---

Reviewed-by: Peter Wang <peter.wang@mediatek.com>

