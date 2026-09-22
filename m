Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16818C982F1
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Sep 2026 10:07:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:CC:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=85S4rWiem6CyLieZW1eyWV3CVYhRqDyl1639/63dg8I=; b=KuT+ViBRWEobd9vGvdP5FmAVkh
	Sf3LryFL/TR11By+VaCIAoeUH0qo3+mbI/1/hxnAJ2SFy99wf1i43U5ycFHPko2ikKoT272PhNNJe
	L0236JYV0g8stPXwunEIkANXnO1jAEocOmG+4HtLVzZLYAR5Eb4XJO0PRFuJcmQ8ijES7i27HN/tO
	B0RUn+fVDdnyCkAv1Wt63+0OQMN6EhTkoq2I0uMLAkBDoZXirUHNYeVpntRMF1cL12vUgWgwQL1l+
	OWmGPrEHP1mPQiIdHdklKYoRO+NJlVuJxLO7m7gkgoBckPCeGvUri7gvRfypYbm10Q4UJkdu4MOEd
	k7+CylJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8xP4-000000050UM-2J0V;
	Tue, 22 Sep 2026 10:07:10 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8xP3-000000050U7-0TDF
	for linux-mediatek@bombadil.infradead.org;
	Tue, 22 Sep 2026 10:07:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=85S4rWiem6CyLieZW1eyWV3CVYhRqDyl1639/63dg8I=; b=ZWLDnOvpD2B10gAJyBW1mgUst8
	KU84K2SOJnJtsfwkI9GS5Ik55fl25jQwL9xeOI686wqATsmZ+xiiRJ17nE0ySZSoxvJuvwBRrVRaW
	osiL4molvcGvTyNQLi3KJm66dU18bCoC8qDk3Lku60ITY7MeT+RfRzJfeQNNLYYsxlZB39Ibn+73M
	1Coq/Jwf87AoTcVUZZPXCCoG6Od+1hIxNh7Jqk1Hc2um1UA5dHTwWSKDZuEsNUpOm6CNV1WDO9aJS
	+t12zUnMjDql/VqaryMtl8rXobQUTPtbMTnMnjOTB1sUc6dpEOlJtqL9FOK8+8MdjUF0gTJ/kPZdg
	ba4wrRCQ==;
Received: from [216.200.240.185] (helo=mailgw02.mediatek.com)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x8xOy-0000000DPvk-3r9Y
	for linux-mediatek@lists.infradead.org;
	Tue, 22 Sep 2026 10:07:07 +0000
X-UUID: 5728f4e2b66d11f1acbe4559397dec65-20260922
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=85S4rWiem6CyLieZW1eyWV3CVYhRqDyl1639/63dg8I=;
	b=M1e1hN6yDjag6hNjIl/iINHhx96n3PIXaLJOEVu+7Xk+E1bQC7mK0XgpwZzZvsostzlAF1i3AWaYq/8vf5/PSh8bM6Q+kC76YrWVJjK4Lwm1pFbOaSkhQVdrhdmnTed6fFXaWtpaPqmKku17HtBFErG6HyQ4xCEl+r096nhq7g0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:06f31f82-0ffc-46be-878f-7111caf3cb12,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:7db8b62,CLOUDID:fb6427e3-72a5-4ba1-af40-18bbd6ea8ffd,B
	ulkID:nil,BulkQuantity:0,SF:80|81|82|83|102|836|865|888|898,TC:-5,Content:
	0|15|50|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,
	OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 5728f4e2b66d11f1acbe4559397dec65-20260922
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw02.mediatek.com
	(envelope-from <chun-hung.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1765307403; Tue, 22 Sep 2026 03:06:55 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 22 Sep 2026 18:06:53 +0800
Received: from [10.233.130.16] (10.233.130.16) by mtkmbs13n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.2562.29 via Frontend
 Transport; Tue, 22 Sep 2026 18:06:53 +0800
Message-ID: <0fc34494c4d37c1ab15db32d021d3f96869bab78.camel@mediatek.com>
Subject: Re: [PATCH v2 0/2] ufs: fix POST_CHANGE pairing and AHIT race
 condition
From: chun-hung.wu <chun-hung.wu@mediatek.com>
To: <peter.wang@mediatek.com>, <linux-scsi@vger.kernel.org>,
	<martin.petersen@oracle.com>, <avri.altman@sandisk.com>,
	<alim.akhtar@samsung.com>, <bvanassche@acm.org>, <santosh.sy@samsung.com>,
	<h.vinayak@samsung.com>
CC: <wsd_upstream@mediatek.com>, <linux-mediatek@lists.infradead.org>,
	<alice.chao@mediatek.com>, <cc.chou@mediatek.com>,
	<chaotian.jing@mediatek.com>, <tun-yu.yu@mediatek.com>,
	<naomi.chu@mediatek.com>, <ed.tsai@mediatek.com>
Date: Tue, 22 Sep 2026 18:06:53 +0800
In-Reply-To: <20260914085148.136429-1-peter.wang@mediatek.com>
References: <20260914085148.136429-1-peter.wang@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_110705_712507_E1B7141D 
X-CRM114-Status: GOOD (  12.75  )
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

On Mon, 2026-09-14 at 16:49 +0800, peter.wang@mediatek.com wrote:
> From: Peter Wang <peter.wang@mediatek.com>
>=20
> Patch 1 fixes a bug where POST_CHANGE was skipped on a failed gear
> switch, leaving the host in an inconsistent state if resources
> acquired
> in PRE_CHANGE were never released.
>=20
> Patch 2 fixes a race between the sysfs AHIT update path and the
> MediaTek host driver's power mode change path. A mutex and depth
> counter are introduced to serialize AHIT register access and ensure
> AHIT is correctly restored after the last disabler completes.
>=20
> The two patches are related: patch 1 guarantees POST_CHANGE is always
> called, ensuring the depth counter introduced in patch 2 is always
> properly decremented.
>=20
> Peter Wang (2):
> =C2=A0 ufs: always notify POST_CHANGE even on gear switch failure
> =C2=A0 ufs: serialize AHIT register access between sysfs and host driver
>=20
> =C2=A0drivers/ufs/core/ufshcd.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 22 =
+++++++++++++++++++---
> =C2=A0drivers/ufs/host/ufs-exynos.c=C2=A0=C2=A0 |=C2=A0 4 +++-
> =C2=A0drivers/ufs/host/ufs-mediatek.c | 16 ++++++++++++----
> =C2=A0drivers/ufs/host/ufshcd-pci.c=C2=A0=C2=A0 |=C2=A0 3 ++-
> =C2=A0include/ufs/ufshcd.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 8 ++++++++
> =C2=A05 files changed, 44 insertions(+), 9 deletions(-)
>=20

Reviewed-by: Chun-Hung Wu <chun-hung.wu@mediatek.com>

