Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7F17F3092B
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Mar 2026 09:58:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t+dM/ivqOh9qFQC6P4MhMScrDFmdYfA44gwq4G7yKZA=; b=EO6Wgff9o3hGLbRZ1mEjgMWb9Y
	X8pjlN4m1YJBwBpA6BVOh7cg4dq74rpCLLq3SpwAM2eYASht53XdJDKEPdhmOzs70HyehqqsMV79H
	9Ym+6XBfi25NQM8BR+gGzNGEezgiKzxbiJN6LODJzBp7kYf2ZJMXp15XjG79QTTpm51Umo+jF2x+l
	9UokVF2Q4ZM5EsooZJWBjD9FnhOwHDSJzMUji5NGpVnKObsvrJwqgHfd+ZwR1tUy3nNu3mvuOLBfK
	G1w1AbMN0yDy/BPu8KW4chDgbDyfphobkPGpgmafDsVLDBnGeE2Sy3dQhXmCippjg/nzhUMcvSWeW
	lBWasRjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy5TC-00000001Tun-2zi2;
	Thu, 05 Mar 2026 09:58:14 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy5TA-00000001Tsg-10Qo;
	Thu, 05 Mar 2026 09:58:13 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1772704683; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=kBoMhSSPZC5RsRfS4lwUYt+DXbeKYd998viSF8OfQgMUxb/zXbxyemZauGhuLeYTbPBelQjuTfEL9D0+cWo40OIheo5HwWCwpwlhtF3FhqUusAxKkTY416Dmd3KJxG3Sfv/E4HjLm8ThGO3Xq0gjfknscHV4kjjKHfgvW8ob+Yc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1772704683; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=t+dM/ivqOh9qFQC6P4MhMScrDFmdYfA44gwq4G7yKZA=; 
	b=fK4RwTEpB/dukN63XUnC6gB0R4xTNhIruor1iiIurQIm8TsF4kKFxi+gMjRHWSoxFymTAVKJ+sVEYYCSrvj5kS8FLsPP41vixq+SkwRlXPTwlKClaT5CvK20ffWU7wnncuAFyu8PJwB95ylrXrsozTseCxJZpS1ZLScgCqos7R4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1772704683;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
	bh=t+dM/ivqOh9qFQC6P4MhMScrDFmdYfA44gwq4G7yKZA=;
	b=J/301NWaZdxu3OBlGpm+tcT8tF32LtInDWcbPlcVv41C/2xK55Pi9n2RO8pJgD/l
	wkCpA7kwqrt9OFuobYiiO8tC+AKWML/dxJuO+AITRr9jlC6DgJvNBBrTSC2C5FGya/f
	yyvNJiQC2PXlDeManSvq/+q1AWUAAinyKmpE1e2Y=
Received: by mx.zohomail.com with SMTPS id 1772704680982221.39391748095557;
	Thu, 5 Mar 2026 01:58:00 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: "chu.stanley@gmail.com" <chu.stanley@gmail.com>,
 "robh@kernel.org" <robh@kernel.org>,
 Chunfeng Yun =?UTF-8?B?KOS6keaYpeWzsCk=?= <Chunfeng.Yun@mediatek.com>,
 "kishon@kernel.org" <kishon@kernel.org>,
 "James.Bottomley@HansenPartnership.com"
 <James.Bottomley@hansenpartnership.com>,
 "bvanassche@acm.org" <bvanassche@acm.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 Chaotian Jing =?UTF-8?B?KOS6leacneWkqSk=?= <Chaotian.Jing@mediatek.com>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "vkoul@kernel.org" <vkoul@kernel.org>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "alim.akhtar@samsung.com" <alim.akhtar@samsung.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "avri.altman@wdc.com" <avri.altman@wdc.com>,
 "martin.petersen@oracle.com" <martin.petersen@oracle.com>,
 "broonie@kernel.org" <broonie@kernel.org>,
 Peter Wang =?UTF-8?B?KOeOi+S/oeWPiyk=?= <peter.wang@mediatek.com>
Cc: "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
 "kernel@collabora.com" <kernel@collabora.com>
Subject: Re: [PATCH v8 11/23] scsi: ufs: mediatek: Remove undocumented downstream
 reset cruft
Date: Thu, 05 Mar 2026 10:57:53 +0100
Message-ID: <3472277.mvXUDI8C0e@workhorse>
In-Reply-To: <3aeee75e78fed2be92038c776463a231b94462f3.camel@mediatek.com>
References: <20260304-mt8196-ufs-v8-0-5b0eac23314f@collabora.com>
 <20260304-mt8196-ufs-v8-11-5b0eac23314f@collabora.com>
 <3aeee75e78fed2be92038c776463a231b94462f3.camel@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_015812_342931_7E6ED6EF 
X-CRM114-Status: GOOD (  11.28  )
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

On Thursday, 5 March 2026 10:14:47 Central European Standard Time Peter Wan=
g (=E7=8E=8B=E4=BF=A1=E5=8F=8B) wrote:
> On Wed, 2026-03-04 at 15:53 +0100, Nicolas Frattaroli wrote:
> > @@ -2383,38 +2383,12 @@ MODULE_DEVICE_TABLE(of, ufs_mtk_of_match);
> >  static int ufs_mtk_probe(struct platform_device *pdev)
> >  {
> >  	int err;
> > -	struct device *dev =3D &pdev->dev, *phy_dev =3D NULL;
> >=20
>=20
> Will there be a build error if phy_dev is removed?
> Please make sure that each patch can build successfully, one by one.
>=20
> Thanks
> Peter
>=20
>=20
>=20
>=20

Yes, these are the kinds of mistakes that happen when you ask someone
to pick apart patches for your downstream convenience.

I'll hand dealing with any further fixups and variable naming concerns
you have over to Angelo, as I can't be bothered to deal with you
anymore.



