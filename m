Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EEB1D132CF
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Nov 2024 14:27:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LsymmwIGsuVs7v1n+LWpRRRaG0hjIy9yDhaEU8VEsww=; b=CTXAwMmnETSV1vOHyOjk5rXYnp
	3XIZLbGB3tDQz9cKpxLUgH9+xDS14nHgW7NAOXDDaaX5m7lOwVMUSYRtlCVwzh9RfpIiTFyNpEK+/
	KhKDceqMImu5D+oFWn/jkiQlMG4r2n81dsOoi5hTxax868uXs4I6malGYQPkD/oLTfd3yxyI1sgOz
	A8HzumhVhkau6CIf3MMXlEYSURSvxsCjsFeyVVLWBCfV7RihtwAXufjy6WrHIX7jpfJSqOK3PWZ+5
	zIhymbR6kf+lAeZ4SOKpMYNVAOXm55AgOZMFwZL89fMm+8Fwp98dsOgx+Y7XP4S3nwVBVBTNWz4Wh
	chR1CIwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7y31-0000000E2mj-0lO4;
	Mon, 04 Nov 2024 14:27:15 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7xQl-0000000Dvlg-28dB
	for linux-mediatek@lists.infradead.org;
	Mon, 04 Nov 2024 13:47:44 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-539e3f35268so5227766e87.3
        for <linux-mediatek@lists.infradead.org>; Mon, 04 Nov 2024 05:47:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1730728061; x=1731332861; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LsymmwIGsuVs7v1n+LWpRRRaG0hjIy9yDhaEU8VEsww=;
        b=PJEDeqgmyyq7+jF1ZWC6npCD5y2xiXanmVl9115qF04uLJ3dpZP2c83mlGLh4BKPXy
         XT0rcShCEccEXhAfan/bNc9b3pXp6aVxSPqIiFKmkQ32PgJ8Zp/yeVsMFSsPOhjOSh3U
         cdVL5q2SyrEt/WaDuRHt7xQHscMbeL0roCE6M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730728061; x=1731332861;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LsymmwIGsuVs7v1n+LWpRRRaG0hjIy9yDhaEU8VEsww=;
        b=PJFff1sHaSRNNKjtR7o0TSRcsiF08mLt95ggEq5F2XHLVjKCBay/ZBbj0YGqwpZT28
         ecHn7zkXc8KRQKpllb6Ei1JnlfAdzXrenmSueUI1zRIZ/Jjlc986mf5Qeo16zY8OjTN3
         y/5ZhOvUtTC8r7ORId9UA4Yi5zkD4ktYtgmte4ItOqa0q57tBd1VTmi+p+Fm/tmBnBB0
         OtYKgQJQZwVLYJg2iWGWCp2mQsn7Gy6I2oaOq3QG6/0A3gOFH4lzNhgJdbffiva+2v9Y
         FeUW0D+S2l0KHXetV33Iu6CBFOHrVw04IlxQnkWr1C3YfFFHCL7qkHj4xjkltA23nNJd
         PHnQ==
X-Forwarded-Encrypted: i=1; AJvYcCWF7SW8N3NF2iXEHddEjAHZiPYC6WjdLjESdEbZk5rueQCdvXEoot73JM/bMmgzklKiZFn5TE/zcPAFVSpBAg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyzNa9qmQuCk5t31ube0W7dXoc+jtLggNeU8Kee3gcFqb0wo9js
	atD0eYd7tMTFheUJ8W8OXnMAX+CgGC7uHrulAVn78xyE5204aVR7GFidCcLKUCwWcLm7IWpGvAQ
	1RaeFh5gZWhB0NSqhtmWZBEMca5T7oXclHMX2/PUdIdSfh3A=
X-Google-Smtp-Source: AGHT+IG6XUFtsKbcLLl53KOkLywI84S6ITEyyTl9D7WkFTQfnMFACCzmN85bTtyfiBZP6XY2rRglSKd6AWN+dPBO6zo=
X-Received: by 2002:a05:6512:230b:b0:539:9645:97ab with SMTP id
 2adb3069b0e04-53d65dfee01mr4788487e87.33.1730728061055; Mon, 04 Nov 2024
 05:47:41 -0800 (PST)
MIME-Version: 1.0
References: <20241030070224.1006331-1-wenst@chromium.org> <20241030070224.1006331-2-wenst@chromium.org>
 <CAGXv+5HVy41qee6kwVUeLV_DfA0=wk2X77kv81rBKAZDGE6mww@mail.gmail.com> <bbaa0c8f-9702-4252-a674-e46fb51f0a2a@collabora.com>
In-Reply-To: <bbaa0c8f-9702-4252-a674-e46fb51f0a2a@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 4 Nov 2024 21:47:30 +0800
Message-ID: <CAGXv+5GHP1M1rKwR8j+bN8GmpxWtpkfLTnvBdkg5wOvWanc-kw@mail.gmail.com>
Subject: Re: [PATCH 1/4] arm64: dts: mediatek: mt8183-kukui-jacuzzi: Drop
 pp3300_panel voltage settings
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, devicetree@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_054743_606401_81764178 
X-CRM114-Status: GOOD (  28.59  )
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

On Mon, Nov 4, 2024 at 9:19=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 04/11/24 14:00, Chen-Yu Tsai ha scritto:
> > On Wed, Oct 30, 2024 at 3:02=E2=80=AFPM Chen-Yu Tsai <wenst@chromium.or=
g> wrote:
> >>
> >> The pp3300_panel fixed regulator is just a load switch. It does not ha=
ve
> >> any regulating capabilities. Thus having voltage constraints on it is
> >> wrong.
> >>
> >> Remove the voltage constraints.
> >>
> >> Fixes: cabc71b08eb5 ("arm64: dts: mt8183: Add kukui-jacuzzi-damu board=
")
> >> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> >
> > I see that the other three patches were merged and included in the pull
> > request, but not this one. Were there any concerns?
> >
>
> Sorry I forgot to actually provide an explanation for that - yes, I do ha=
ve some
> comment about this one.
>
> Despite this being a load switch, it's still switching power from regulat=
or A to
> target device X, so this is technically still providing 3.3V to device X.
>
> Think about how a "regular" full-fledged regulator works: you can (someti=
mes) set
> a voltage, and then you can ENABLE the VOUT for said regulator (/rail): t=
his kind
> of "load switch" does exactly the same as the ENABLE switch for a full-fl=
edged
> regulator.

But it does not provide regulation. One cannot "set" the voltage on a load
switch; one can only set it on its upstream supply, if that supply provides
regulation.

IIRC Mark said some years ago that if a regulator doesn't regulate the
voltage, then the voltage constraints should not be given. The constraints
are then derived from its upstream supply.

That's the guideline I've followed for all the regulator related changes
I've done over the years. Does that work for you?

> So, this is switching on and off a power rail that is derived from a sour=
ce rail,
> practically creating... well, a "new" rail, with...
>
>   VIN=3Dsomewhere-3.3v,
>   VOUT=3Dsomewhere-still-3.3v
>
> Any objections/doubts/etc? :-)

I agree with most of it, except the part that I laid out above about the
load switch not providing regulation.

> P.S.: I'm writing fast, sorry if anything appears unclear, feel free to s=
hoot more
>        questions in case :-)

No, it's pretty clear, and I believe one of the common interpretations
I see. Thank you for the quick response.


Thanks
ChenYu

> Cheers,
> Angelo
>
> >
> > ChenYu
> >
> >> ---
> >>   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi | 2 --
> >>   1 file changed, 2 deletions(-)
> >>
> >> diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi b/=
arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi
> >> index 783c333107bc..7bbafe926558 100644
> >> --- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi
> >> +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi
> >> @@ -35,8 +35,6 @@ pp1800_mipibrdg: pp1800-mipibrdg {
> >>          pp3300_panel: pp3300-panel {
> >>                  compatible =3D "regulator-fixed";
> >>                  regulator-name =3D "pp3300_panel";
> >> -               regulator-min-microvolt =3D <3300000>;
> >> -               regulator-max-microvolt =3D <3300000>;
> >>                  pinctrl-names =3D "default";
> >>                  pinctrl-0 =3D <&pp3300_panel_pins>;
> >>
> >> --
> >> 2.47.0.163.g1226f6d8fa-goog
> >>
>

