Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34B6CC5DF86
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Aug 2026 20:18:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=juNQ1Ri6l95QwdEXhHnYdn7aFisOSy5EEtGzSyCI12U=; b=lX0cHm2/FMI1CIwRZvxMJ2TStj
	ewdJepZhz67PR54cVJMj8OPtKcBdO/bgWAWUSxHqO3x81X5fuO4xMavpin+sbEtv4udD0fwOk+VlJ
	3qTYSZFyAoTXAX+eGcaA2qelV/KVj7dinwylxRa5EgIDjtC/k+jB/nYiDgAafgq7VmGNM+mgQ5iJe
	bAYZWIFEuie8D4gCgN4Ye2rHDcYa3t/qW6FraquCaOdhRXwk+9E+NsMWy+lgQnSH5E0GulAObdoiA
	pZx+mJuh1A4Gt8IedUuDxArIewr48vFul/iT0Z4KxFQf4K4NExjHumYtOGi2/HWn6zIo/8mO6jL/9
	i5q2i5qQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx9Dl-0000000C9yG-0iOg;
	Thu, 20 Aug 2026 20:18:41 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx9Dh-0000000C9xP-1zxR
	for linux-mediatek@lists.infradead.org;
	Thu, 20 Aug 2026 20:18:39 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-c1c50c1e29bso39525066b.3
        for <linux-mediatek@lists.infradead.org>; Thu, 20 Aug 2026 13:18:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787257115; cv=none;
        d=google.com; s=arc-20260327;
        b=JmSpG6/R/c+jOFp4UVKgHDr8zTWEXLsDx966k6Q9t9idPMfAKG9MiZyZgWx8Q/H9IL
         W3F573MXbxCYLYD/YI7OEpo7wG+yLjntgtsfZkANtAOPTQJvGuzVsxnxwnmmXX35KfE3
         g+XWdrQx6ALaj981tBX6uAfOzG2TxKKNc4ARsdKBzEldOAzX2Mcjwgw+gswsjv194Yab
         d+fzMRmxApf1VXjIdJjL9kux+XzDyQKYQJ16vN/bMV4MLmB7E8NYYYMUSmugG+7IhEGn
         F5ISv+i8YGrtdtdEWVWdsceU9NKR2ZbkuzmCJwZWFIehL+6p/RpBkqX0fmRFC/Qc/DzC
         OVGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=juNQ1Ri6l95QwdEXhHnYdn7aFisOSy5EEtGzSyCI12U=;
        fh=E3LcKkcKndpW13kDQ5QxeYrVuerNPp1gYPXt2PeSqJQ=;
        b=gCr5niBcplaNZktNZamDFq0NrGPvQQPLblkjRIJfU4kv4pEGXpkB5HMWMZJm0U8V2R
         AUoFLCQ8313r52HD/TyUYCUKuD6cKGBm+4FHH5QkX4O0Yr7A1+o5yINaoHrFhb5eug/P
         ohB6QTIQyDIsqp4PFG7ZiZ59al9Q0VYp1S7U+16/btoijvCj6nHv1s9aHFyDAM/O2e9/
         oNFHCQofkgTNEFXlhQlq0sczhFucGiXbOa3YDYj8Swu2xhyKcuxHVJ2SUnoC3tCkxxAP
         rxQbcBJwvHbGs0IbxjSc6ZJpksQ+Ci2Jd4mH/Id0Stm5SfC6yUCcfcx/fC8PXpXNbgLV
         Ux3w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787257115; x=1787861915; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=juNQ1Ri6l95QwdEXhHnYdn7aFisOSy5EEtGzSyCI12U=;
        b=eOI2b3YszeE/+KTuZSi2/decbn089dzgnz/6ToKDi6za3UvK+TxW26COpXGGa6mk5f
         lNwz6/YtiapoK5SNpgYbvqdynkPGehmr2TlsR07AgbSgjtJFGa4DPs0a8UBJ1uMOPmuY
         0/Isc2Wmmuxpv9aPImA01f0LMHmYXMQ8DmCIgasJm7vy+91WMtNjoyIqyQ2lPPo0asSZ
         B4DYwZ3CQ/DmaY13BLIPtwsWIdTbEBRTygABQLJzbmWl1AJD3eVDe7VoIcO0mLrYuyel
         ZKZUIVyi2V03/vDnhccwciyeZ6siAui/gHclDw/eDrscq7IapOj7OdZwiJIkyenlg2h3
         9EIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787257115; x=1787861915;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=juNQ1Ri6l95QwdEXhHnYdn7aFisOSy5EEtGzSyCI12U=;
        b=eV0E7GLsg2B5d335z6M8w2exPacNXpqnKkLLYWXHl2JwEZ+IZxWDZsRQlf5Fb9tjnW
         agrg5bUUw+xhOCdr/gioMQ6RdL87crKxwbwbJilIXqopsvF/IUwSeTXnh1z1EBqzPhiS
         n4AjYVgDFBR9h7OGYczFhm8TFlF2rpmNmZ3tcZ1BerQ7W47EPjBsq2ujIEeQ0rQz7lI1
         pDQykw2sfk5oFxRsJGoT6CrGujeEKLM9TR3Z6vJQIizsalcVqoua+p4Eg9DFPjlySei5
         qfRvr6jQ75a70sOcX4ln0kfrHHo2dEas5Izj+oeE5BRuu1D3eYTVgJWqBNwnRVZ8q0Ff
         ZOFA==
X-Forwarded-Encrypted: i=1; AHgh+RournJ40jN8eeX4K4AhaWwX2dzJLyhHBsxSlOXoOYlCmpno8d0fSIAkw0lIPaLvhF6ElI/sDJT0NES2L6pGiA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzzq5zjnIR/u4ELOs61tmv310vwZFFITN2uR/oaYhynhrhngPwi
	9JbMJuhcDflj1SmPUOyT5HMoUW9NddtpfLchxr1eAInMbzXpnT1zwHds+GgIUCvbt21l6+EABhU
	qsTasmpHLn3XYZGPE4fY7JV0z9RJ+lw==
X-Gm-Gg: AR+sD11T1Rjgu8qS54JipLfoSiND3blHQLjSnpwGUODym7DdftmYJFKWgPrbla+zTN4
	PeALQ2SaoDgTfpTxXaWuMIVbshXclwePCXuTBXyDeUSQdwFyX5qGk1bFZwHX/OmQmI26Xc9TI04
	wQ1PI7KFILD5vgfe4NBk8TDdu+h5zN6bwLVaqvGH1bW2VPfNUJOlTNZ9ftKFfkFER0nHfREgMmA
	1vsyoEnpAYyfuSEgt9Rya/A7CDbixatugD1hVuKDGcmdujKbUKI0htfTymZoq1vY6V4cGj7/qE3
	61eKtJinVQyLuR8cjMzQfLklLTUSOv56z+tJu7XSh22DKa1qhcjZvAyshq4wBw==
X-Received: by 2002:a17:906:ee89:b0:c20:f95c:9088 with SMTP id
 a640c23a62f3a-c246a30c3b5mr104918666b.4.1787257114733; Thu, 20 Aug 2026
 13:18:34 -0700 (PDT)
MIME-Version: 1.0
References: <20260818182829.1580811-1-vladislav.karmanov.dev@gmail.com> <aoSnqurLLgdVT_Eu@makrotopia.org>
In-Reply-To: <aoSnqurLLgdVT_Eu@makrotopia.org>
From: Vladislav Karmanov <vladislav.karmanov.dev@gmail.com>
Date: Thu, 20 Aug 2026 23:18:23 +0300
X-Gm-Features: AcwNN1UY78trrCBEnBsV4RrWx-VvGxpQcnmILGMnFCzTNSxNa9AqTH-okMtaf4k
Message-ID: <CADDoYm63JMq=5CyNvqkTo65BgS927iURKMmhvhD=B-ytqq3Ygg@mail.gmail.com>
Subject: Re: [PATCH net] net: dsa: mt7530: do not advertise EEE on MT7621 switch
To: Daniel Golle <daniel@makrotopia.org>
Cc: netdev@vger.kernel.org, chester.a.unal@arinc9.com, dqfext@gmail.com, 
	sean.wang@mediatek.com, andrew@lunn.ch, olteanv@gmail.com, 
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, yangshiji66@outlook.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_131837_551396_4A6142EE 
X-CRM114-Status: GOOD (  37.36  )
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

Hi Andrew, Hi Daniel,

Thanks for the review.

> Do we know what is broken here? MAC or PHY? If it is the PHY which is
> broken, it would be better to put the workaround into the PHY driver.

It is the PHY that is broken -- the MT7530 internal GE PHY (PHY ID
0x03a29412, driven by mediatek-ge). Landen Chao (MediaTek, 2021) puts the
root cause there: "EEE of the 10-year-old MT7530 internal gephy has many
IOT problems, so it is recommended to disable its EEE."

That would point to the PHY driver as the natural home, but I think the
DSA side is actually the right place, and af3b4b0e59de -- the commit this
patch fixes -- is itself the evidence: it removed the early EEE disable
from mtk_gephy_config_init() on the rationale that the disable done there
"is somehow enabled afterwards", i.e. a PHY-driver-side disable does not
stick (something re-enables EEE advertisement after config_init). What
does stick is the disable done earlier in the DSA setup path -- which is
why MT7531 does it in mt7531_setup() and why af3b4b0e59de considered the
mtk-ge disable redundant for MT7531. The catch is that mt7530_setup()
never had that loop, so MT7621 (and MT7530) lost their only effective
early disable when af3b4b0e59de dropped the mtk-ge one. Putting the
disable back into the PHY driver would reintroduce the "gets re-enabled
afterwards" problem af3b4b0e59de removed it for. So I'd keep it on the
DSA side

> I'd recommend disabling EEE advertisement on MT7621 and MT7530;
> Hence I'd suggest to extend 'struct mt753x_info' with a 'broken_eee'
> bool instead of maintaining an in-code list of EEE-broken silicon IDs.

Agreed on both. ID_MT7530 (the dedicated MT7530 IC, e.g. BananaPi R2)
uses the same mt7530_setup() and the same internal GE PHY, so it should
be covered too. I have prepared  v2 that adds a broken_eee bool to
struct mt753x_info and sets it for ID_MT7621 and ID_MT7530, gating the
MDIO_AN_EEE_ADV clear loop on priv->info->broken_eee instead of the
open-coded ID check.

v2 follows as a fresh thread with a lore link back to v1.

Regarding older Trendnet/Econet SoCs sharing the lineage: I don't have
that hardware, so I'd rather not guess the flag makes it trivial to
extend later if someone with access can confirm

=D0=B2=D1=82, 18 =D0=B0=D0=B2=D0=B3. 2026=E2=80=AF=D0=B3. =D0=B2 21:43, Dan=
iel Golle <daniel@makrotopia.org>:
>
> Hi,
>
> On Tue, Aug 18, 2026 at 09:28:29PM +0300, Vladislav Karmanov wrote:
> > There are hardware defects in the MT7621 (MT7530) EEE support: with EEE
> > advertised, some link partners cannot establish a stable connection.
> > Notably, on a 2-pair (4-wire) cable where both ends advertise gigabit,
> > 1000BASE-T training cannot succeed, and instead of falling back to
> > 100 Mbps the port flaps in a loop and no link/DHCP lease is obtained.
> > This is confined to the WAN / phylib bring-up path; the DSA/LAN side on
> > the same device is unaffected.
> >
> > The MT7530 internal GE PHY advertises EEE by hardware default. The
> > eee-broken-100tx / eee-broken-1000t device-tree properties only take
> > effect during the late PHY config_init path, which is too late for thes=
e
> > link partners: they negotiate EEE before the OS disables it and then
> > fail to fall back cleanly.
> >
> > Commit af3b4b0e59de ("net: phy: mediatek-ge: do not disable EEE
> > advertisement") removed the early EEE-advertisement disable from
> > mtk_gephy_config_init(), on the rationale that "disabling EEE
> > advertisement before the PHY driver initialises keeps it off", i.e. tha=
t
> > the DSA subdriver already performs that early disable. That rationale
> > holds for MT7531, whose mt7531_setup() clears MDIO_AN_EEE_ADV on each
> > switch PHY -- but it does not hold for MT7621, whose mt7530_setup()
> > never had such a loop. So af3b4b0e59de removed the only early EEE
> > disable that covered MT7621, reintroducing the flapping on MT7621-based
> > boards (regression reported on ramips/mt7621).
> >
> > MediaTek's own recommendation (Landen Chao, 2021) confirms the hardware
> > is the root cause: "EEE of the 10-year-old MT7530 internal gephy has ma=
ny
> > IOT problems, so it is recommended to disable its EEE."
> > [...]
> > --- a/drivers/net/dsa/mt7530.c
> > +++ b/drivers/net/dsa/mt7530.c
> > @@ -2518,6 +2518,15 @@
> >       if ((val & MT7530_XTAL_MASK) =3D=3D MT7530_XTAL_40MHZ)
> >               mt7530_pll_setup(priv);
> >
> > +     if (priv->id =3D=3D ID_MT7621) {
>
> It'd be very surprising if this limitation doesn't also apply for the
> nearly identical decicated MT7530 IC (found eg. on BananaPi R2).
>
> I'd recommend disabling EEE advertisement on MT7621 and MT7530; and I
> suspect that some of the older Trendnet/Econet SoCs which share common
> linage with the MediaTek's Ethernet switch and PHY designs could also
> be affected.
>
> Hence I'd suggest to extend 'struct mt753x_info' with a 'broken_eee'
> bool instead of maintining an in-code list of EEE-broken silicon IDs.
>
> > +             /* Disable EEE advertisement on the switch PHYs. */
> > +             for (i =3D MT753X_CTRL_PHY_ADDR(priv->mdiodev->addr);
> > +                  i < MT753X_CTRL_PHY_ADDR(priv->mdiodev->addr) + MT75=
30_NUM_PHYS;
> > +                  i++) {
> > +                     mt7530_phy_write_c45(priv, i, MDIO_MMD_AN, MDIO_A=
N_EEE_ADV, 0);
> > +             }
> > +     }
> > +
>

