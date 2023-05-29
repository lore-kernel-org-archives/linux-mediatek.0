Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF336C77B7A
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 May 2023 08:46:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rN6UaHs4ggHcS2A5CJI/CPXVvIQe2q2wnZMpU72p46E=; b=H2dzvue8iRerLk4RsHpK3Upkuo
	wetQnmYcq+8n/7GTdzq7jPitw01IbqoBQ0A+j+ZJH+6DgMynM3K5is9NB80/oUHb8BzmF51T09I6s
	F0wcBY3DbuH9qb5KgzAhPHFBTqvWzmMXVJe4j/Ia3JmB7bX8qJorGSsNeCiT30DRsWy0uyGFx373w
	cxyu02pvUPJg2V1iMHfol6OdQ9kuPKKsXK0dvDml0DrumW3LUutCS3RpRfHt3go8Fv6U92fR3zVRJ
	K/PtUPhIv6ee23BPMp/1UeZAqgedkd1wfNEb3ASKZISpCUD3yRi+v3zRfmn1xvN5EA6qrSWj/8bbO
	kXssW7QQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3YW1-009kms-0G;
	Mon, 29 May 2023 08:46:09 +0000
Received: from sender4-op-o15.zoho.com ([136.143.188.15])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3YVu-009kka-2J;
	Mon, 29 May 2023 08:46:07 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1685349926; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=UWDchVkEZiy1zgz7GOmGojV4k3GBe6B0J98/o/8VuWZImfM7kKhp+evlWTG/+wbLdsJ48ehE9ywSCra0uNGxZbhwSl3fLDHhXabD1T+CchT4/ig6hwhab1nphrL3/I0E12AZ2RpofM1EBRjZ32Q9nwPOuEvqeMp8sKfs81zSCMI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1685349926; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=rN6UaHs4ggHcS2A5CJI/CPXVvIQe2q2wnZMpU72p46E=; 
	b=U04yBJ6K+7f3xyXrBevDloZNd20L0TVYYzAqNYVrSiz8sVrOFzu3DZjl2EEZiWPS2lVH4b3ZGnChjhL01ZEiQQCcyAkFDh9Ryo0Rdax72hKpjRcDHPGP+vbTPke5Jv6nVSskWfo2pFFWE7v4uTPIPvchEk0fN831fpgDl5dUdNQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1685349926;
	s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=rN6UaHs4ggHcS2A5CJI/CPXVvIQe2q2wnZMpU72p46E=;
	b=nvT+YTQtDXzEyPmjNP5ayAWvRISvccnkg/aNGQk5OBtQBsDatWrwkwNIH8NFyyYe
	CDhzWq1bPZCMZaIOaHP8fdoHlYicWGzCQxWWX2WGSHrS8q8zn0wYWQJD/AdSSwEZMcI
	eZzcFClARRmsJ8lxp/drRGTeX1hYnaKjzEZ23cCEqJIHx0Kp/poS1sRQMGm+Qsl9yNA
	D4bvTBgIyB4jyxuDObQs0jbB52KfE7lYdTRRfS5Og/u33ie3XdY1GxnVHz7vP1rQz6K
	/nGacoEHLUEQr2uviIIn8ALAL50ucCBD8iPWtPazpAfij2ZYeKmLDXA6U8KXpe0DPwy
	2QvW3gZizw==
Received: from edelgard.fodlan.icenowy.me (120.85.97.71 [120.85.97.71]) by mx.zohomail.com
	with SMTPS id 1685349925541243.71967151550905; Mon, 29 May 2023 01:45:25 -0700 (PDT)
Message-ID: <6996788b112f4795d2930a6664b3152cd9a380a8.camel@icenowy.me>
Subject: Re: [PATCH] arm64: dts: mediatek: mt8173-elm: remove panel model
 number in DT
From: Icenowy Zheng <uwu@icenowy.me>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Doug Anderson <dianders@chromium.org>, Pin-yen Lin <treapking@chromium.org>
Cc: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
 <matthias.bgg@gmail.com>,  devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,  dri-devel@lists.freedesktop.org
Date: Mon, 29 May 2023 16:45:20 +0800
In-Reply-To: <f4a9e090-3712-200e-bd09-70090c9cccbc@collabora.com>
References: <20230526100801.16310-1-uwu@icenowy.me>
	 <CAD=FV=UxrFVZXn+dtgamttTVopWMSVbxYsHCGG_tS+3OTXbHiw@mail.gmail.com>
	 <f4a9e090-3712-200e-bd09-70090c9cccbc@collabora.com>
Organization: Anthon Open-Source Community
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4 
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230529_014602_788854_5844D57C 
X-CRM114-Status: GOOD (  33.64  )
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

=E5=9C=A8 2023-05-29=E6=98=9F=E6=9C=9F=E4=B8=80=E7=9A=84 10:02 +0200=EF=BC=
=8CAngeloGioacchino Del Regno=E5=86=99=E9=81=93=EF=BC=9A
> Il 26/05/23 16:24, Doug Anderson ha scritto:
> > Hi,
> >=20
> > On Fri, May 26, 2023 at 3:09=E2=80=AFAM Icenowy Zheng <uwu@icenowy.me>
> > wrote:
> > >=20
> > > Currently a specific panel number is used in the Elm DTSI, which
> > > is
> > > corresponded to a 12" panel. However, according to the official
> > > Chrome
> > > OS devices document, Elm refers to Acer Chromebook R13, which, as
> > > the
> > > name specifies, uses a 13.3" panel, which comes with EDID
> > > information.
> > >=20
> > > As the kernel currently prioritizes the hardcoded timing
> > > parameters
> > > matched with the panel number compatible, a wrong timing will be
> > > applied
> > > to the 13.3" panel on Acer Chromebook R13, which leads to blank
> > > display.
> > >=20
> > > Because the Elm DTSI is shared with Hana board, and Hana
> > > corresponds to
> > > multiple devices from 11" to 14", a certain panel model number
> > > shouldn't
> > > be present, and driving the panel according to its EDID
> > > information is
> > > necessary.
> > >=20
> > > Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
> > > ---
> > > =C2=A0 arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi | 2 +-
> > > =C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > We went through a bunch of back-and-forth here but in the end in
> > the
> > ChromeOS tree we have "edp-panel" as the "compatible" here in the
> > ChromeOS 5.15 tree and this makes sense.
> >=20
> > Reviewed-by: Douglas Anderson <dianders@chromium.org>
> >=20
> > ...in theory one would wish for a "Fixes" tag, but I think in
> > previous
> > discussions it was decided that it was too complicated. Hardcoding
> > the
> > other compatible string has always been technically wrong, but I
> > guess
> > it worked at some point in time. The more correct way (as you're
> > doing
> > here) needs the DP AUX bus support and the generic eDP panels, both
> > of
> > which are significantly newer than the elm dts. So I guess leaving
> > no
> > "Fixes" tag is OK, or perhaps you could do the somewhat weak:
> >=20
> > Fixes: c2d94f72140a ("arm64: dts: mediatek: mt8173-elm: Move
> > display
> > to ps8640 auxiliary bus")
>=20
> I remember I didn't change the compatible to panel-edp because it
> didn't
> work at that time, but it does now... I'm not sure what actually
> fixed that
> and if the commit(s) was/were backported to that suggested point, so
> I
> would leave the Fixes tag out, as that may break older kernel.

Well at least I developed this patch on v6.3.

(In fact the same kernel config do not boot to system at all on
v6.0/v6.1 when I do make olddefconfig then build)

>=20
> Anyway, for this commit:
>=20
> Reviewed-by: AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com>


