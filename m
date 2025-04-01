Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FFD3C36010
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Apr 2025 13:26:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:CC:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WnbTGdC1nckjCkTxkzO584mZEF4AjiIhUXBjL+x1FQ4=; b=ZLxve2s/YNUvNU6IKL2wpRqVEJ
	5+m1BE+VtfySMypXnM01u0sB216yyRdsGDWhn18SK8N80Eboh70i+cuU5z50hyuoVQJruwUqnXxQf
	nXNnLMGBANjzzqW9Z2z+fU0yhxTdYRQKsU5VUuT9s3xiNVYXLA2R7Q6MUjvRMt2VMy5ceRdQWmL2I
	8Vwlq2/0P7wB8nj5hRivhc+KkO4tqD4sT0oGJNU/zq3+vCiuRQ0TSqTTuFPF6UdQYmZaHvrQGgMQ8
	FMvDpqHhEBzVdmH22weXH2VyZnL/gW0Sg8PhGdSsP2ZO/5Vm7TXp9ADGMmMGfqAKzRgsdreaPT9Vw
	K4g/4Ymg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzbdp-00000003QzD-1jxA;
	Tue, 01 Apr 2025 13:26:57 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzbcq-00000003Qv3-1ejX
	for linux-mediatek@lists.infradead.org;
	Tue, 01 Apr 2025 13:25:57 +0000
X-UUID: d2f6aaf20efc11f0a1e849db4cc18d44-20250401
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=WnbTGdC1nckjCkTxkzO584mZEF4AjiIhUXBjL+x1FQ4=;
	b=aB1wUZ4pWWfH+Y7OVC8HvPzvh6LWzC24sdKKJ+XzlerXN0CSkOve9XRfROo3uAKIEIQoyzq5djp+kouHWaFMdmVvs/Q+WO6OMQbUh09nDuuJ5uzF9loUclrF0vis3FylFCkcQ+6cQCV60cNtQ5QLtEHGdhhgZEXxq8P7qG58pLk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:4b98db64-3d7d-4a9e-9829-c090afa8132a,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:0ef645f,CLOUDID:441d91a5-c619-47e3-a41b-90eedbf5b947,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0|50,
	EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: d2f6aaf20efc11f0a1e849db4cc18d44-20250401
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <shayne.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 387509353; Tue, 01 Apr 2025 06:25:48 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Tue, 1 Apr 2025 21:25:45 +0800
Received: from [10.233.130.16] (10.233.130.16) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.1258.39 via Frontend
 Transport; Tue, 1 Apr 2025 21:25:45 +0800
Message-ID: <2cb3376205353e98384ca8faa4454fa0511d47b5.camel@mediatek.com>
Subject: Re: [PATCH 02/10] wifi: mt76: connac: add support to load firmware
 for mt7990
From: Shayne Chen <shayne.chen@mediatek.com>
To: Ping-Ke Shih <pkshih@realtek.com>, Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Lorenzo Bianconi
	<lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, Evelyn Tsai
	<evelyn.tsai@mediatek.com>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, StanleyYP Wang
	<StanleyYP.Wang@mediatek.com>, Peter Chiu <chui-hao.chiu@mediatek.com>
Date: Tue, 1 Apr 2025 21:25:45 +0800
In-Reply-To: <7ec7c486728d490caef7dcdac3c1c8e4@realtek.com>
References: <20250328055058.1648755-1-shayne.chen@mediatek.com>
	 <20250328055058.1648755-3-shayne.chen@mediatek.com>
	 <7ec7c486728d490caef7dcdac3c1c8e4@realtek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250401_062556_440782_11307D6A 
X-CRM114-Status: GOOD (  11.55  )
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

Hi Ping-Ke,

On Mon, 2025-03-31 at 04:40 +0000, Ping-Ke Shih wrote:
>=20
> External email : Please do not click links or open attachments until
> you have verified the sender or the content.
>=20
>=20
> Shayne Chen <shayne.chen@mediatek.com> wrote:
> > --- a/drivers/net/wireless/mediatek/mt76/mt76_connac.h
> > +++ b/drivers/net/wireless/mediatek/mt76/mt76_connac.h
> > @@ -232,9 +232,14 @@ static inline bool is_mt7992(struct mt76_dev
> > *dev)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return mt76_chip(dev) =3D=3D=
 0x7992;
> > =C2=A0}
> >=20
> > +static inline bool is_mt7990(struct mt76_dev *dev)
> > +{
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return mt76_chip(dev) =3D=3D 0x79=
93;
>=20
> It seems like patch 01/10 want to avoid this kind of confusion.
>=20
This helper is added in mt76_connac.h, which can be used by mt76 common
part and mt7996 per-chip folder.

> Also, there are two IDs for MT7990:
>=20
> #define MT7990_DEVICE_ID=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x7993
> #define MT7990_DEVICE_ID_2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x799b
>=20
These two are only used by mt7996 per-chip folder.

Regards,
Shayne

> > +}
> > +
> > =C2=A0static inline bool is_mt799x(struct mt76_dev *dev)
> > =C2=A0{
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return is_mt7996(dev) || is_mt799=
2(dev);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return is_mt7996(dev) || is_mt799=
2(dev) || is_mt7990(dev);
> > =C2=A0}
> >=20


