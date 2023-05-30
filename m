Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A9DBC7EE23
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 May 2023 05:04:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uNmD0Xv70JaEayy56+RdfAQyK0HPDkKOKowbsAERT+s=; b=o4jZ/6UGMUoxi5fNyp97LmAwez
	bsSmvxKpHi9MsySx+w7u8Fw9yw+EVCx3PekMFHMsLoPnwzUYXxWvlbh9XM9inRMqlKs6w+wCy0cKA
	1tIGaBNjsMSF1GphSIlk5OsGNLwWekpZA0i5EClocSfW8wXHyduSqanRFpl6WN5Tze4SGRJI10tPa
	/bEulgOGmWAcrcvtEcmtPm6f6QbizhFALreykRr3wXqXrIiHDG6E0MrsleT1PrDw9vnGVvWV230cg
	iGoWcesjEd6EpdIqOP84sIJFhlNoMPvk+LlUgyM0bgJxyP3nDrT2q4wMaPGxevinXgtNYqVlyEHoq
	2B0ILIgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3rX5-00CQgu-0e;
	Tue, 30 May 2023 05:04:31 +0000
Received: from sender4-op-o15.zoho.com ([136.143.188.15])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3rX1-00CQfP-0U;
	Tue, 30 May 2023 05:04:28 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1685423027; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=BHQkkWTAEr80M8lLmn638j1SsCDJ8tWONl9EP+zlrhSaXusGQavWAA1HAvLz6rzlydFDJliwPVSogf9K49Jrt2rPepOW6dDVs7itaVa2uYbiqUFxeP9xC18+VIVicy9OP9dn3EvbY8xYW6KAkkNrl6rI+EnrsmwX3AMHqSDV3T0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1685423027; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=uNmD0Xv70JaEayy56+RdfAQyK0HPDkKOKowbsAERT+s=; 
	b=imaaRTO7sMYIVbRDcAQSkEkNmVSjgAwBwW9AAp+RvAiKbh3IZnNPy49saesVsfGaBgITwEyA0qq0I8z/PYZmrIYX2YklCHER9T78EHRNlT09sOm0rLlRjMr8p5/YkZcWUs+/GQ995a3u7X3TYmlz73HeokW8XDMdf9H7VvQKX80=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1685423027;
	s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=uNmD0Xv70JaEayy56+RdfAQyK0HPDkKOKowbsAERT+s=;
	b=Hm79fKiieyxgpF7XgjhzkGDXE4Ekr2K5Nm10fJNvEv+aX1AeSpAk6kSMJrKF6vHv
	e5mq6QAUhwpU8dt6ZqybNhGaYM5r5GCe6SAK73p6XdEgX44Vgcs+1mCnEir2HzAaTka
	bdrNvAdKRMTZTcVaOLFmS1mKxnTpKItEmikmoFaQ1b2qSzhi7gMLHtT7ZvaKDkI9nUs
	KOOpQiF1vmxg7/XAyFFcsBLG12z5EZjaUGfTJW2kWyWJfGtRBtwgPM+E8KR8p0oYN9e
	nikXRztFB46nzbcZEO0i5LRBKtMdfndvFOCAfLAKbbELOC5mvpXbSdXy+58qvpxysUv
	ohwrrYe7yg==
Received: from edelgard.fodlan.icenowy.me (120.85.97.71 [120.85.97.71]) by mx.zohomail.com
	with SMTPS id 168542302470190.09283881679414; Mon, 29 May 2023 22:03:44 -0700 (PDT)
Message-ID: <d23b9b5defeb9399436df0674a04dfd2f90aad73.camel@icenowy.me>
Subject: Re: [PATCH] arm64: dts: mediatek: mt8173-elm: remove panel model
 number in DT
From: Icenowy Zheng <uwu@icenowy.me>
To: Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Doug Anderson
 <dianders@chromium.org>,  Pin-yen Lin <treapking@chromium.org>
Cc: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	 <krzysztof.kozlowski+dt@linaro.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org
Date: Tue, 30 May 2023 13:03:39 +0800
In-Reply-To: <3069dcf7-28e0-e7f6-11d5-9bc286d7d6e3@gmail.com>
References: <20230526100801.16310-1-uwu@icenowy.me>
	 <CAD=FV=UxrFVZXn+dtgamttTVopWMSVbxYsHCGG_tS+3OTXbHiw@mail.gmail.com>
	 <f4a9e090-3712-200e-bd09-70090c9cccbc@collabora.com>
	 <6996788b112f4795d2930a6664b3152cd9a380a8.camel@icenowy.me>
	 <3069dcf7-28e0-e7f6-11d5-9bc286d7d6e3@gmail.com>
Organization: Anthon Open-Source Community
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4 
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230529_220427_268137_F965D058 
X-CRM114-Status: GOOD (  41.78  )
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

=E5=9C=A8 2023-05-29=E6=98=9F=E6=9C=9F=E4=B8=80=E7=9A=84 18:28 +0200=EF=BC=
=8CMatthias Brugger=E5=86=99=E9=81=93=EF=BC=9A
>=20
>=20
> On 29/05/2023 10:45, Icenowy Zheng wrote:
> > =E5=9C=A8 2023-05-29=E6=98=9F=E6=9C=9F=E4=B8=80=E7=9A=84 10:02 +0200=EF=
=BC=8CAngeloGioacchino Del Regno=E5=86=99=E9=81=93=EF=BC=9A
> > > Il 26/05/23 16:24, Doug Anderson ha scritto:
> > > > Hi,
> > > >=20
> > > > On Fri, May 26, 2023 at 3:09=E2=80=AFAM Icenowy Zheng <uwu@icenowy.=
me>
> > > > wrote:
> > > > >=20
> > > > > Currently a specific panel number is used in the Elm DTSI,
> > > > > which
> > > > > is
> > > > > corresponded to a 12" panel. However, according to the
> > > > > official
> > > > > Chrome
> > > > > OS devices document, Elm refers to Acer Chromebook R13,
> > > > > which, as
> > > > > the
> > > > > name specifies, uses a 13.3" panel, which comes with EDID
> > > > > information.
> > > > >=20
> > > > > As the kernel currently prioritizes the hardcoded timing
> > > > > parameters
> > > > > matched with the panel number compatible, a wrong timing will
> > > > > be
> > > > > applied
> > > > > to the 13.3" panel on Acer Chromebook R13, which leads to
> > > > > blank
> > > > > display.
> > > > >=20
> > > > > Because the Elm DTSI is shared with Hana board, and Hana
> > > > > corresponds to
> > > > > multiple devices from 11" to 14", a certain panel model
> > > > > number
> > > > > shouldn't
> > > > > be present, and driving the panel according to its EDID
> > > > > information is
> > > > > necessary.
> > > > >=20
> > > > > Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
> > > > > ---
> > > > > =C2=A0=C2=A0 arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi | 2 +-
> > > > > =C2=A0=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)
> > > >=20
> > > > We went through a bunch of back-and-forth here but in the end
> > > > in
> > > > the
> > > > ChromeOS tree we have "edp-panel" as the "compatible" here in
> > > > the
> > > > ChromeOS 5.15 tree and this makes sense.
> > > >=20
> > > > Reviewed-by: Douglas Anderson <dianders@chromium.org>
> > > >=20
> > > > ...in theory one would wish for a "Fixes" tag, but I think in
> > > > previous
> > > > discussions it was decided that it was too complicated.
> > > > Hardcoding
> > > > the
> > > > other compatible string has always been technically wrong, but
> > > > I
> > > > guess
> > > > it worked at some point in time. The more correct way (as
> > > > you're
> > > > doing
> > > > here) needs the DP AUX bus support and the generic eDP panels,
> > > > both
> > > > of
> > > > which are significantly newer than the elm dts. So I guess
> > > > leaving
> > > > no
> > > > "Fixes" tag is OK, or perhaps you could do the somewhat weak:
> > > >=20
> > > > Fixes: c2d94f72140a ("arm64: dts: mediatek: mt8173-elm: Move
> > > > display
> > > > to ps8640 auxiliary bus")
> > >=20
> > > I remember I didn't change the compatible to panel-edp because it
> > > didn't
> > > work at that time, but it does now... I'm not sure what actually
> > > fixed that
> > > and if the commit(s) was/were backported to that suggested point,
> > > so
> > > I
> > > would leave the Fixes tag out, as that may break older kernel.
> >=20
> > Well at least I developed this patch on v6.3.
> >=20
> > (In fact the same kernel config do not boot to system at all on
> > v6.0/v6.1 when I do make olddefconfig then build)
> >=20
>=20
> I applied the patch without the fixes tag. Lets stay on the secure
> side to not=20
> break older kernels.

Well I think this patch is at least meaningful to get backported to
v6.3.

Should we cc stable@vger.kernel.org ?

>=20
> Regards,
> Matthias
>=20
> > >=20
> > > Anyway, for this commit:
> > >=20
> > > Reviewed-by: AngeloGioacchino Del Regno
> > > <angelogioacchino.delregno@collabora.com>
> >=20


