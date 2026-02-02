Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E7D6E73158
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Feb 2026 11:46:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:CC:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jPm6BjDd61B05/hcvtCJNk1OntONvb4+WoR4F+Z/gj8=; b=f2Q0z4VKF/JcAJ1tj42NRYRdMm
	uLKordyxTe2V7DZ53yLhcQjMs/9UrLCTDSWZ/J1fzMYrNz9e3JhoDG3vaB8b41SHXKlBfuaMn+L2i
	IDcNBZxJ4EFtb8+PKtDagO3Ri/jWicLXawN2H1SYQatnBOcYrtl2+VhE46UNQQL4VZ2Rgv80RbgL6
	myE69SGJtDD+FGLCaE5OTkW+tIevuedELDpxrQ227NJTaBQMg2h5JDClvqdP66nRFPpgVIb/kZKPa
	rAnfaznMqFcN4SYzCjSCjGf1oPVtAR63obUl2Uwf1K2MBFTWvFnM6qf7/+k3c3W56i2F+fi7nCTeM
	Tf162aJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmsNl-00000004vV0-0Vg7;
	Mon, 02 Feb 2026 11:46:17 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmsNi-00000004vUd-2CAe
	for linux-mediatek@lists.infradead.org;
	Mon, 02 Feb 2026 11:46:15 +0000
X-UUID: c3b8c5b2002c11f1a16f0188aa809bee-20260202
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=jPm6BjDd61B05/hcvtCJNk1OntONvb4+WoR4F+Z/gj8=;
	b=uUqpZLrO/g5AD1vpXB1qxKTIBGEYnZhrf4IRYHqDOCNP8sFdXNL/l66eJ026LHAEIhvi+OMZHMY8nymuMhIMZvLTAy5mzKRYskUAadWKNFV3CGU7NoXncYM/73U8MYo0ynTtg0cboPcX97QRd2J9+j7viMIheGPKtzN5evk4zLk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.11,REQID:a6c0e8b7-54f0-43b5-b809-6ada8e96fb7d,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:89c9d04,CLOUDID:13a37e7a-8c8a-4fc4-88c0-3556e7711556,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|836|888|898,TC:-5,Co
	ntent:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL
	:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: c3b8c5b2002c11f1a16f0188aa809bee-20260202
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw01.mediatek.com
	(envelope-from <shayne.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2019696362; Mon, 02 Feb 2026 04:46:08 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 2 Feb 2026 19:46:06 +0800
Received: from [10.233.130.16] (10.233.130.16) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.2562.29 via Frontend
 Transport; Mon, 2 Feb 2026 19:46:06 +0800
Message-ID: <1d327fad53675a7193c81e9c0ae2e91c2aa4e74d.camel@mediatek.com>
Subject: Re: [PATCH 1/5] wifi: mt76: fix potential deadlock caused by rx_lock
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Lorenzo Bianconi
	<lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, Evelyn Tsai
	<evelyn.tsai@mediatek.com>, Money Wang <money.wang@mediatek.com>,
	linux-mediatek <linux-mediatek@lists.infradead.org>
Date: Mon, 2 Feb 2026 19:46:06 +0800
In-Reply-To: <e785fe7c-eb3c-4697-9ea6-705c8c9dcfe1@nbd.name>
References: <20260202075311.365673-1-shayne.chen@mediatek.com>
	 <e785fe7c-eb3c-4697-9ea6-705c8c9dcfe1@nbd.name>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_034614_693409_879A4A52 
X-CRM114-Status: GOOD (  21.24  )
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

On Mon, 2026-02-02 at 09:52 +0100, Felix Fietkau wrote:
> On 02.02.26 08:53, Shayne Chen wrote:
> > A deadlock will occur if both of the following conditions are met,
> > because they each attempt to acquire the rx_lock:
> > - mac80211 receives an unexpected BAR control frame, which triggers
> > =C2=A0=C2=A0 a BA deletion
> > - A transmission failure happens due to an abnormality in DMA
> >=20
> > Since ieee80211_tx_status_ext() is primarily used to address AQL
> > issues,
> > avoid potential deadlocks by restricting calls to
> > ieee80211_tx_status_ext
> > only for data frames.
>=20
> First of all, ieee80211_tx_status_ext is not primarily used to
> address=20
> AQL, ieee80211_free_txskb handles it as well. The reason for it is tx
> status handling, e.g. for management frames sent by hostapd that
> require=20
> an ACK status report, so limiting the status calls for data frames
> seems=20
> wrong to me.
>=20
> I don't really understand how the scenario you're describing leads to
> a=20
> deadlock. From my understanding, if something in the mac80211 rx path
> triggers a tx, it should end up calling mt76_tx(), which queues the
> skb=20
> to wcid->tx_list and triggers the tx worker. So the actual dma tx
> callls=20
> are expected to come from the worker kthread.
> How does this lead to a deadlock on rx_lock?

Hi Felix,

Thanks for the explanation.
I've re-checked the codebase used by the customer when the issue was
reported, and I found that the wcid->tx_list structure was not present
in that version. So yes, this problem should not occur in the current
codebase.

Will drop this patch in v2.

Thanks,
Shayne
>=20
> - Felix


