Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59E23CCD184
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Oct 2025 05:57:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hCx0QGvWJlappQiiwfM+JyQIFBWuuuDTnj5rzSd9Mfw=; b=MsJFGjo070ooRfhxwulxylmT/Q
	82C9mO0zZwR5PN9HbcHidZ8LtggXoPzPgNpACRIZ2NQds4d/Gsjhg88UYKrvC8l0FwYrKDTGItvBz
	5Vc25McZ/HJVSFS0DjVbWR5FpnzzHIL7Ehsc4N8ImMJQGCdTbuhgL61Q8jxEDMdEIK3qjnuvWjSXJ
	KLbyuxisJzGzxThBskY/3v/JCNhgQf+VwB15htxz5Jn/OmPhOzbaAf8Fz9J7KpjlD8DBuWHXkgT7R
	y+3qvOx0P8eyaVrLd+jt1TJtbxtm53k+u4mPZCxChMghKLrn2LLkpxE4RALCpRvIYZlvR2GYLs9tr
	ZTL91MdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8Y2O-0000000FFki-05rR;
	Tue, 14 Oct 2025 05:57:32 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8Y2L-0000000FFkM-0EGj
	for linux-mediatek@lists.infradead.org;
	Tue, 14 Oct 2025 05:57:30 +0000
X-UUID: a6c7886aa8c211f09f706fa2197c6ceb-20251013
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:To:From:Subject:Message-ID; bh=hCx0QGvWJlappQiiwfM+JyQIFBWuuuDTnj5rzSd9Mfw=;
	b=UE4R2FSLz+LAVk80qO9nVmFU97nU/912A+Oho9JxIN3eQfD3NkiFOeO/lOUcG9c87Te4RKOehUuYGYnIQsyYbxGyOahXkH+D7mnfAUXX/amkehEivewyQ1cdkBW7i/D8hxdUspdIu1zr8X/LBL7ZdPQdSWGdTeRfSMyANzbKszY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:db4c4936-92c6-4870-8307-12a41e7b2de7,IP:0,UR
	L:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:-5
X-CID-META: VersionHash:a9d874c,CLOUDID:87b15c02-eaf8-4c8c-94de-0bc39887e077,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|836|888|898,TC:-5,Co
	ntent:0|15|50,EDM:-3,IP:nil,URL:99|1,File:130,RT:nil,Bulk:nil,QS:nil,BEC:n
	il,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: a6c7886aa8c211f09f706fa2197c6ceb-20251013
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw01.mediatek.com
	(envelope-from <chui-hao.chiu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1732878655; Mon, 13 Oct 2025 22:57:22 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Tue, 14 Oct 2025 13:57:19 +0800
Received: from [10.233.130.16] (10.233.130.16) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Tue, 14 Oct 2025 13:57:19 +0800
Message-ID: <0b7d9222e432955c8f287119b3f1eaf6f47b9014.camel@mediatek.com>
Subject: Re: [report] wifi: mt76: mt7996: fix FCS error flag check in RX
 descriptor
From: Peter Chiu <chui-hao.chiu@mediatek.com>
To: Ben Greear <greearb@candelatech.com>, ALOK TIWARI
	<alok.a.tiwari@oracle.com>, <Bo.Jiao@mediatek.com>,
	<howard-yh.hsu@mediatek.com>, <meichia.chiu@mediatek.com>,
	<Money.Wang@mediatek.com>, <StanleyYP.Wang@mediatek.com>,
	<ryder.lee@mediatek.com>, <shayne.chen@mediatek.com>,
	<linux-mediatek@lists.infradead.org>,
	=?UTF-8?Q?=E7=8F=8A=E9=88=BA_=E8=94=A1?= <Evelyn.Tsai@mediatek.com>,
	=?UTF-8?Q?=E6=B4=A5=E7=B7=AF_=E6=9E=97?= <Benjamin-jw.Lin@mediatek.com>
Date: Tue, 14 Oct 2025 13:57:19 +0800
In-Reply-To: <f2c4c835-bc90-c4d1-b1e0-f85b8a945ee9@candelatech.com>
References: <ba082ece-a6a6-4287-9cb9-b216b865b8f4@oracle.com>
	 <96f5ff922d22d66ad271a37f2babd60bd2cfb7dc.camel@mediatek.com>
	 <f2c4c835-bc90-c4d1-b1e0-f85b8a945ee9@candelatech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_225729_104834_6A916A22 
X-CRM114-Status: GOOD (  36.04  )
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

On Mon, 2025-10-13 at 11:11 -0700, Ben Greear wrote:

Hi Ben,

The incorrect bit is MT_RXD1_NORMAL_CLM.
It is only set when there is a decryption error so most of the time
this bit is zero.

Thanks,
Peter Chiu

>=20
> External email : Please do not click links or open attachments until
> you have verified the sender or the content.
>=20
>=20
> Hello Peter,
>=20
> To help understand the severity of this problem, can you let us know
> when
> the incorrect bit is set?=C2=A0 In other words, would looking at the wron=
g
> bit
> erroneously cause good frames to be dropped, or was the bit always
> zero and
> it just allowed bad frames to be accepted?
>=20
> Thanks,
> Ben
>=20
> On 10/12/25 20:19, Peter Chiu wrote:
> > On Sun, 2025-10-12 at 22:02 +0530, ALOK TIWARI wrote:
> >=20
> > Hi Alok,
> >=20
> > Thanks for your mail.
> > Your understanding is correct.
> > There is a typo in mt7996.
> >=20
> > Thanks,
> > Peter Chiu
> >=20
> > >=20
> > > External email : Please do not click links or open attachments
> > > until
> > > you have verified the sender or the content.
> > >=20
> > >=20
> > > Hi,
> > >=20
> > > While looking through the FCS error handling in the mt76 drivers,
> > > I noticed that mt7996 uses rxd1 to check the
> > > MT_RXD3_NORMAL_FCS_ERR
> > > bit,
> > > whereas other Connac3-based drivers (such as mt7925) use rxd3.
> > >=20
> > > According to the definitions, MT_RXD3_NORMAL_FCS_ERR is located
> > > in
> > > the
> > > fourth
> > > RX descriptor word (rxd3), so I prepared a small patch to switch
> > > the
> > > check from
> > > rxd1 to rxd3 for consistency and correctness.
> > >=20
> > > Before sending it formally, I wanted to confirm whether this
> > > understanding is correct.
> > > is mt7996 indeed supposed to use rxd3 for this flag, like mt7925?
> > >=20
> > > Fixes: 98686cd21624 ("wifi: mt76: mt7996: add driver for MediaTek
> > > Wi-
> > > Fi
> > > 7 (802.11be) devices")
> > >=20
> > > Thanks,
> > > Alok
> > >=20
> > > ---
> > > =C2=A0 drivers/net/wireless/mediatek/mt76/mt7996/mac.c | 2 +-
> > > =C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)
> > >=20
> > > diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
> > > b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
> > > index 9501def3e0e3..59744e5593b6 100644
> > > --- a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
> > > +++ b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
> > > @@ -527,7 +527,7 @@ mt7996_mac_fill_rx(struct mt7996_dev *dev,
> > > enum
> > > mt76_rxq_id q,
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 !(csum_status & (BIT(0) | BIT(2) | BIT(3))))
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 skb->ip_summed =3D CHECKSUM_UNNECESSARY;
> > >=20
> > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (rxd1 & MT_RXD3_NORMAL_FCS_E=
RR)
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (rxd3 & MT_RXD3_NORMAL_FCS_E=
RR)
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 status->flag |=3D RX_FLAG_FAILED_FCS_CRC;
> > >=20
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (rxd1 & MT_RXD1_N=
ORMAL_TKIP_MIC_ERR)
> > > --
> > > 2.50.1
> >=20
> > ************* MEDIATEK Confidentiality Notice
> > =C2=A0 ********************
> > The information contained in this e-mail message (including any
> > attachments) may be confidential, proprietary, privileged, or
> > otherwise
> > exempt from disclosure under applicable laws. It is intended to be
> > conveyed only to the designated recipient(s). Any use,
> > dissemination,
> > distribution, printing, retaining or copying of this e-mail
> > (including its
> > attachments) by unintended recipient(s) is strictly prohibited and
> > may
> > be unlawful. If you are not an intended recipient of this e-mail,
> > or believe
> >=20
> > that you have received this e-mail in error, please notify the
> > sender
> > immediately (by replying to this e-mail), delete any and all copies
> > of
> > this e-mail (including any attachments) from your system, and do
> > not
> > disclose the content of this e-mail to any other person. Thank you!
> >=20
>=20
> --
> Ben Greear <greearb@candelatech.com>
> Candela Technologies Inc=C2=A0
> https://urldefense.com/v3/__http://www.candelatech.com__;!!CTRNKA9wMg0ARb=
w!kqzkHZoLin2hRuz5nWsnd8WZ4M-4HouFcKGVf4pC7KWdV8u0t0p2yxxigivg90pEO6fACMrQN=
uRD0RK8z19PvhZOFA$
>=20
>=20


