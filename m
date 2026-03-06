Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B033F01835
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Mar 2026 12:53:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uYzPfZN2qeAjLGGk50fjPqz0/2wRXSpO4Mr/vCzfoHs=; b=FQAB+LkkHZ+qW2j+0vTeQDLYfB
	75IQDSetpTFbQB4sP9U/hDvRmgm+lYLzQg3J5nTPaKWM6CFrRoeS/kY6wlJ1nrTAtSKKnnNmTpkbO
	PA8qIrSdOIyEVVogCoX2KWwjUrLhSjYO9CGxN8NtQwZfRPbXFS0+o9jq2JeRn3fIIp/6X1jV2VMXn
	i+Jw4QSGjzKXiAEWU9nz2LhPtoX/7xL+f+geBOsDOaUTw6sZ3wKn+KoItvt81qTZBnzrcWhYOvc7k
	gUZk+bYwfsC1+XJYR2grv/j5W9dqxKxYKFdX0UcgpreqFqIB/bWSW7TcvyxjbNCiK7TbKmZBPU/PF
	nKciX5ZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyUgR-00000003h6l-2ki1;
	Fri, 06 Mar 2026 12:53:35 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyUgO-00000003h5S-3DFR;
	Fri, 06 Mar 2026 12:53:34 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1772801598; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=DcCFODHq3zWZyac4tQCBbiwF6DehbbPNr6onrgenuECF8OHu1KYWfysscwEOhS1eRXl5SOLhIV9xvyZbfUllQxT4GJzoLom7jwMDeNCm/uynpBkZdcfRdmdBEaPXD+sm0D/6bIYB16L0H5BT7AYVUUSa14ljYAGGe6gdizG32Ag=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1772801598; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=uYzPfZN2qeAjLGGk50fjPqz0/2wRXSpO4Mr/vCzfoHs=; 
	b=CpSurAyn4TOOjNQH62apNi4XeaN7NV3ivWhwL1sl3hnCa4SiYl7zeo7A6ljqnN3wTemBo2Gd6idNro/SV1YIOiM87/+QKLsg1fsF9QPqw7r8ckrnHtV8KxkMbTbNlnYmnIrjwMVYN+oHI3EY4ktDshu/Ul+bsK+y+o+oC3wXFn4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1772801598;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
	bh=uYzPfZN2qeAjLGGk50fjPqz0/2wRXSpO4Mr/vCzfoHs=;
	b=aq6bupk1sHIpctdxS3iewCaD7xxL2I9r868YhzsFM5rcG7u9fjmJdtTw52sjupZG
	mCBvRXwx3gaFndhJqLSHEuhBrhtbaRz9ycXHECbzjMcsJ0dzZXOEcaFbhsTsFHJHP7Q
	pqyHfvK0nJAEw+oIEBhL0gtwq/Jm5PrQ2PAK4GSU=
Received: by mx.zohomail.com with SMTPS id 1772801597239568.9469211924414;
	Fri, 6 Mar 2026 04:53:17 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: "chu.stanley@gmail.com" <chu.stanley@gmail.com>,
 "robh@kernel.org" <robh@kernel.org>,
 Chunfeng Yun =?UTF-8?B?KOS6keaYpeWzsCk=?= <Chunfeng.Yun@mediatek.com>,
 "kishon@kernel.org" <kishon@kernel.org>,
 "James.Bottomley@hansenpartnership.com"
 <James.Bottomley@hansenpartnership.com>,
 "bvanassche@acm.org" <bvanassche@acm.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Chaotian Jing =?UTF-8?B?KOS6leacneWkqSk=?= <Chaotian.Jing@mediatek.com>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "vkoul@kernel.org" <vkoul@kernel.org>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "alim.akhtar@samsung.com" <alim.akhtar@samsung.com>,
 "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "avri.altman@wdc.com" <avri.altman@wdc.com>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "martin.petersen@oracle.com" <martin.petersen@oracle.com>,
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
Date: Fri, 06 Mar 2026 13:53:09 +0100
Message-ID: <4282403.mvXUDI8C0e@workhorse>
In-Reply-To: <2a68eb32987c21b6a48547ce044ee38d1eb01fa5.camel@mediatek.com>
References: <20260304-mt8196-ufs-v8-0-5b0eac23314f@collabora.com>
 <3472277.mvXUDI8C0e@workhorse>
 <2a68eb32987c21b6a48547ce044ee38d1eb01fa5.camel@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_045332_850837_EE43BE69 
X-CRM114-Status: UNSURE (   9.99  )
X-CRM114-Notice: Please train this message.
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

On Friday, 6 March 2026 06:39:22 Central European Standard Time Peter Wang =
(=E7=8E=8B=E4=BF=A1=E5=8F=8B) wrote:
> On Thu, 2026-03-05 at 10:57 +0100, Nicolas Frattaroli wrote:
> >=20
> > Yes, these are the kinds of mistakes that happen when you ask someone
> > to pick apart patches for your downstream convenience.
> >=20
> > I'll hand dealing with any further fixups and variable naming
> > concerns
> > you have over to Angelo, as I can't be bothered to deal with you
> > anymore.
> >=20
>=20
> I thought ensuring that every patch builds successfully
> was a basic requirement.
>=20
>=20

And I thought putting bindings through bindings review was a basic
requirement, but apparently not for you when you can subvert the
kernel's review process and push your downstream crap into mainline
willy-nilly.



