Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 462E0CCD187
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Oct 2025 03:19:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VEyUNALeKZReCOUeEy61moOcKcs1mVltWxuE+1mDomk=; b=ztP4p4Bx9F1dj3RKKM5hFIEw1D
	7qrw5Ljzt5TTf8iyxj5oKen2HTyJwhcWUlFlwvWmgZFiuHPl9Q2ej/+WyKdzLYhsi/6WW30MuqlN/
	+WEZSsDH7di3oHrr2N4yA6/rkcxbAjzvKeASM1K/UN6Qw92Vua4Mg/sw/MorW0tmkTis+Ur+JHvBV
	BY45m5LKVg8xUoDTSWwJH8LeGVMR+xLWJciiWVs4T7W9IpW9pPHn/wjyTi9t5Wsw/rwCCH+VZl2Tu
	5mULMHz6XVqSV3oK3Rk0T6meOwii4NOBAxIa9xTjUbMH5vNtSwPHtZF3CzBY72WPeHipUiVIPJljZ
	98ehuoHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v895e-0000000C9mR-0Vp5;
	Mon, 13 Oct 2025 03:19:14 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v895c-0000000C9m6-1G7l
	for linux-mediatek@lists.infradead.org;
	Mon, 13 Oct 2025 03:19:13 +0000
X-UUID: 61123f84a7e311f0a52f393f94899d25-20251012
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:To:From:Subject:Message-ID; bh=VEyUNALeKZReCOUeEy61moOcKcs1mVltWxuE+1mDomk=;
	b=XxorBs+4gr9Oud+eSwLiIoZFi4WA9V5AvQY+mvjgh0QnHjX9qc7rT77E6Be7GZx95nOUj2Id9beWZ9j2uTQqXLF7B+pwpg4v+tX6+43Re5tcaqV0DPCf5174MA2gZ3X1xNq5P8bDtSPYH0F5mx8E4MnK2F8Tw7e3kDPOwu04p/A=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:04d35333-2761-4d98-a1e3-710c3c905769,IP:0,UR
	L:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:-5
X-CID-META: VersionHash:a9d874c,CLOUDID:2d50fb50-c509-4cf3-8dc0-fcdaad49a6d3,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|836|888|898,TC:-5,Co
	ntent:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:nil,Bulk:nil,QS:nil,BEC:nil,
	COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 61123f84a7e311f0a52f393f94899d25-20251012
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw02.mediatek.com
	(envelope-from <chui-hao.chiu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 293858982; Sun, 12 Oct 2025 20:19:07 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Mon, 13 Oct 2025 11:19:03 +0800
Received: from [10.233.130.16] (10.233.130.16) by mtkmbs13n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Mon, 13 Oct 2025 11:19:03 +0800
Message-ID: <96f5ff922d22d66ad271a37f2babd60bd2cfb7dc.camel@mediatek.com>
Subject: Re: [report] wifi: mt76: mt7996: fix FCS error flag check in RX
 descriptor
From: Peter Chiu <chui-hao.chiu@mediatek.com>
To: ALOK TIWARI <alok.a.tiwari@oracle.com>, <Bo.Jiao@mediatek.com>,
	<howard-yh.hsu@mediatek.com>, <meichia.chiu@mediatek.com>,
	<Money.Wang@mediatek.com>, <StanleyYP.Wang@mediatek.com>,
	<ryder.lee@mediatek.com>, <shayne.chen@mediatek.com>,
	<linux-mediatek@lists.infradead.org>,
	=?UTF-8?Q?=E7=8F=8A=E9=88=BA_=E8=94=A1?= <Evelyn.Tsai@mediatek.com>,
	<greearb@candelatech.com>
Date: Mon, 13 Oct 2025 11:19:05 +0800
In-Reply-To: <ba082ece-a6a6-4287-9cb9-b216b865b8f4@oracle.com>
References: <ba082ece-a6a6-4287-9cb9-b216b865b8f4@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251012_201912_368701_F38F9DC3 
X-CRM114-Status: GOOD (  17.94  )
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

On Sun, 2025-10-12 at 22:02 +0530, ALOK TIWARI wrote:

Hi Alok,

Thanks for your mail.
Your understanding is correct.
There is a typo in mt7996.

Thanks,
Peter Chiu

>=20
> External email : Please do not click links or open attachments until
> you have verified the sender or the content.
>=20
>=20
> Hi,
>=20
> While looking through the FCS error handling in the mt76 drivers,
> I noticed that mt7996 uses rxd1 to check the MT_RXD3_NORMAL_FCS_ERR
> bit,
> whereas other Connac3-based drivers (such as mt7925) use rxd3.
>=20
> According to the definitions, MT_RXD3_NORMAL_FCS_ERR is located in
> the
> fourth
> RX descriptor word (rxd3), so I prepared a small patch to switch the
> check from
> rxd1 to rxd3 for consistency and correctness.
>=20
> Before sending it formally, I wanted to confirm whether this
> understanding is correct.
> is mt7996 indeed supposed to use rxd3 for this flag, like mt7925?
>=20
> Fixes: 98686cd21624 ("wifi: mt76: mt7996: add driver for MediaTek Wi-
> Fi
> 7 (802.11be) devices")
>=20
> Thanks,
> Alok
>=20
> ---
> =C2=A0 drivers/net/wireless/mediatek/mt76/mt7996/mac.c | 2 +-
> =C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
> b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
> index 9501def3e0e3..59744e5593b6 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
> @@ -527,7 +527,7 @@ mt7996_mac_fill_rx(struct mt7996_dev *dev, enum
> mt76_rxq_id q,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
!(csum_status & (BIT(0) | BIT(2) | BIT(3))))
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 skb->ip_summed =3D CHECKSUM_UNNECESSARY;
>=20
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (rxd1 & MT_RXD3_NORMAL_FCS_ERR)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (rxd3 & MT_RXD3_NORMAL_FCS_ERR)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 status->flag |=3D RX_FLAG_FAILED_FCS_CRC;
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (rxd1 & MT_RXD1_NORMA=
L_TKIP_MIC_ERR)
> --
> 2.50.1


