Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A97F106FD7D
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Mar 2026 06:01:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:CC:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=osjqpkcUGH04w/bazaArwGn2fG6Xlho1hcQWsHgcK/E=; b=qX1uDpOM/S0/n8RSYTOUevphNT
	QSJ/Th23xw4QII4RYoXHBdVkWb3l0/7882kP0C0IbFamydaXIegxIrqGzdj5fAUm6Q3/xRRtKUNIB
	2AvsXERoURP/tyf4f6wh4l1Ko2iUvcwPRRJjYp78qL0Gq3SCSlyk+fCR/JRoIGY6gJMGRooaQHaTt
	3M70e7w5xTYosmbdWKzd8FFldnZl3YoJ9AdWPKknxA6MDkXrRklH0kOlfvi1nbzF/VeSUXfAKmEPA
	17a9kUCGdysnwcbx8BiVCCBh2RQgg1+3v5CqErHrXhH2LRqYgw4dPrLGdBU/eYTSJ95f8I+El36gV
	UNd8rR5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0va9-0000000GiUv-3IMR;
	Fri, 13 Mar 2026 06:01:09 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0va6-0000000GiTs-0JRg
	for linux-mediatek@lists.infradead.org;
	Fri, 13 Mar 2026 06:01:07 +0000
X-UUID: 02b1cdfc1ea211f19e7563141e833ce8-20260312
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=osjqpkcUGH04w/bazaArwGn2fG6Xlho1hcQWsHgcK/E=;
	b=k7nnHI1H7N4d6YDuAFOOImkCIDNCZmQtA5JXQLSJvZFzW209TAavrB2zXsv6kKEZ/gn8rURUNoQ8EP+rFwe1Ov6rOndrp0Pa6gojH9CZj/FNwavtBg7kC3yC2fTl2wwLxjX8VVBcMQUVNvAcaCwRjD/zWXQWFYj81DnQZu+9D9Y=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:5dca50c9-2fd4-4f85-9e6a-aefd92277e85,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e7bac3a,CLOUDID:b763f6f9-dfaf-419f-9dd3-d093c7e8f968,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|836|888|898,TC:-5,Co
	ntent:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL
	:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 02b1cdfc1ea211f19e7563141e833ce8-20260312
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <shayne.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1804373448; Thu, 12 Mar 2026 23:01:00 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 13 Mar 2026 14:00:58 +0800
Received: from [10.233.130.16] (10.233.130.16) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.2562.29 via Frontend
 Transport; Fri, 13 Mar 2026 14:00:58 +0800
Message-ID: <35014cbb30533d7d73a25540b4b283ee67b87e39.camel@mediatek.com>
Subject: Re: [PATCH mt76 6/6] wifi: mt76: mt7996: fix issues with manually
 triggered radar detection
From: Shayne Chen <shayne.chen@mediatek.com>
To: Lorenzo Bianconi <lorenzo@kernel.org>
CC: Felix Fietkau <nbd@nbd.name>, linux-wireless
	<linux-wireless@vger.kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, Evelyn
 Tsai <evelyn.tsai@mediatek.com>, Money Wang <money.wang@mediatek.com>,
	linux-mediatek <linux-mediatek@lists.infradead.org>, StanleyYP Wang
	<StanleyYP.Wang@mediatek.com>
Date: Fri, 13 Mar 2026 14:00:57 +0800
In-Reply-To: <abKbwL6jgtKtLFdD@lore-desk>
References: <20260312095724.2117448-1-shayne.chen@mediatek.com>
	 <20260312095724.2117448-6-shayne.chen@mediatek.com>
	 <abKbwL6jgtKtLFdD@lore-desk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_230106_142737_480F5337 
X-CRM114-Status: GOOD (  18.37  )
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

On Thu, 2026-03-12 at 11:56 +0100, Lorenzo Bianconi wrote:
> > From: StanleyYP Wang <StanleyYP.Wang@mediatek.com>
> >=20
> > Disallow triggering radar detection on non-DFS channels to prevent
> > paused
> > TX queues from failing to resume, as a channel switch is not
> > performed in
> > this case.
>=20
> I guess we are missing a Fixes tag here.
>=20
> >=20
> > Signed-off-by: StanleyYP Wang <StanleyYP.Wang@mediatek.com>
> > Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
> > ---
> > =C2=A0.../wireless/mediatek/mt76/mt7996/debugfs.c=C2=A0=C2=A0 | 22
> > +++++++++++++++----
> > =C2=A01 file changed, 18 insertions(+), 4 deletions(-)
> >=20
> > diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/debugfs.c
> > b/drivers/net/wireless/mediatek/mt76/mt7996/debugfs.c
> > index 76d623b2cafb..e26bed6b97e7 100644
> > --- a/drivers/net/wireless/mediatek/mt76/mt7996/debugfs.c
> > +++ b/drivers/net/wireless/mediatek/mt76/mt7996/debugfs.c
> > @@ -226,14 +226,23 @@ mt7996_radar_trigger(void *data, u64 val)
> > =C2=A0#define RADAR_BACKGROUND	2
> > =C2=A0	struct mt7996_dev *dev =3D data;
> > =C2=A0	struct mt7996_phy *phy =3D mt7996_band_phy(dev,
> > NL80211_BAND_5GHZ);
> > -	int rdd_idx;
> > +	struct cfg80211_chan_def *chandef;
> > +	int rdd_idx, ret;
> > =C2=A0
> > =C2=A0	if (!phy || !val || val > RADAR_BACKGROUND)
> > =C2=A0		return -EINVAL;
> > =C2=A0
> > -	if (val =3D=3D RADAR_BACKGROUND && !dev->rdd2_phy) {
> > -		dev_err(dev->mt76.dev, "Background radar is not
> > enabled\n");
> > -		return -EINVAL;
> > +	if (test_bit(MT76_SCANNING, &phy->mt76->state))
> > +		return -EBUSY;
> > +
> > +	if (val =3D=3D RADAR_BACKGROUND) {
> > +		if (!dev->rdd2_phy ||
> > !cfg80211_chandef_valid(&dev->rdd2_chandef)) {
> > +			dev_err(dev->mt76.dev, "Background radar
> > is not enabled\n");
>=20
> nit: I guess it is better to specify a different error message if
> rdd2_chandef
> is=C2=A0 invalid.
>=20
Will split the error message in v2.

Thanks,
Shayne

> Regards,
> Lorenzo
>=20
> > +			return -EINVAL;
> > +		}
> > +		chandef =3D &dev->rdd2_chandef;
> > +	} else {
> > +		chandef =3D &phy->mt76->chandef;
> > =C2=A0	}
> > =C2=A0
> > =C2=A0	rdd_idx =3D mt7996_get_rdd_idx(phy, val =3D=3D
> > RADAR_BACKGROUND);
> > @@ -242,6 +251,11 @@ mt7996_radar_trigger(void *data, u64 val)
> > =C2=A0		return -EINVAL;
> > =C2=A0	}
> > =C2=A0
> > +	ret =3D cfg80211_chandef_dfs_required(dev->mt76.hw->wiphy,
> > chandef,
> > +					=C2=A0=C2=A0=C2=A0 NL80211_IFTYPE_AP);
> > +	if (ret <=3D 0)
> > +		return ret;
> > +
> > =C2=A0	return mt7996_mcu_rdd_cmd(dev, RDD_RADAR_EMULATE, rdd_idx,
> > 0);
> > =C2=A0}
> > =C2=A0
> > --=20
> > 2.51.0
> >=20


