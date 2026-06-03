Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36884CD6E60
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Jun 2026 23:47:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IrsB5qlB9vbQ42mMffRvNtPBkwXix0VEJXwI5BRhHFo=; b=rFbNx7BQnr8lChkQb2WIhI9OC4
	+3xzifqu9iGJcRO1wJf/8R2twgkQpKw87D7pGwIat0ff9R4d906Hj/9huzcimetjb/HVIbhiJXcwT
	Xsr/eD0Rw1RtPOvobqEqZhdBJhm1qAXYUdVmIhIiIfIMC5pfTQ9i/raSi+hM7DUoQfBqXo5UnpHMG
	MLp0iPmwCybgxwjkys/cLg6LhkYkraCSCjiE3TaHEKNvlCsYaH6GSxr+OvXkAD4c3r2PmrrdVra1G
	tDHGzMyZIJE17rRfMqbSCEsxD2c+YFtfceLhC75G2s6Ahd1zZCLXAN/rZy98U3Ly+7rhRrgR9vLgB
	dgRWDVkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUvIo-0000000Fwq4-1O3a;
	Wed, 03 Jun 2026 23:47:14 +0000
Received: from mail-qt1-x82c.google.com ([2607:f8b0:4864:20::82c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUvIl-0000000Fwph-2V9q
	for linux-mediatek@lists.infradead.org;
	Wed, 03 Jun 2026 23:47:13 +0000
Received: by mail-qt1-x82c.google.com with SMTP id d75a77b69052e-517654b8dd4so166751cf.3
        for <linux-mediatek@lists.infradead.org>; Wed, 03 Jun 2026 16:47:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780530429; cv=none;
        d=google.com; s=arc-20240605;
        b=N0YdsPUHsOv5CtC5dOQHRc/zjpfoieBa8IfpDyqL6W8ImMSCQiA4/NQJC0TszCYOIC
         tucPumfbkC5XOZmsRln3XJtWZD4OguG3CY/SgxGiYIRBIlWAb5snr8fxDSzxNeS8dDtu
         zF+JsT52TyHqfwT69uELsUC50rJ8E+NGuzhzcWJmhMWsZGGMYPPmAuVcMFV11+03yTm1
         YMUEhPbwpNE6lpz7N8NMXgfTw8G0Ex1ACcox9oGlOZpeT4ScJsr63+yDcuVSfFvr5yDW
         280gozW5GIc/mENC/gv82v6KWRGrfgmIEMQu1GBBT83hxPmr7HeWMaIRtiLhqrn1A4mb
         fZtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IrsB5qlB9vbQ42mMffRvNtPBkwXix0VEJXwI5BRhHFo=;
        fh=CgHDSCjOhxPpsUTFWMeM5ri2NgfCflqsptwq9muizKU=;
        b=S0DH0TDKq4ctbyZkj30hSVhjnfmr0eQZMl2byHY4aiE1y+rQmBzfvM8QHjsOBPeZlF
         a3UO1GBPm+/uBrtAP4FltDEWivUE+OBChcH87AzS4oIOP1SP0Jf9FU9/g56IgxRyrOVu
         MvDAVkdla7y+687G0P6a8ysc8gq0yRbiV3YpstziQIvMJMPI6HBUEhvhPqVsrlBTCAyD
         pwegU3ZjZ4H4wKfAtiqA2YTKsB2M6Uy+jTOf/C1e4Fbno59NYsD9BlQnYawRlmYK8Ul7
         izAitXhWRYV5Fp+1exewGwFo9qmsxth4c8EQHRuDjOIOxI6SSTWzo8LQ7T5EDey1u20q
         sBUA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780530429; x=1781135229; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IrsB5qlB9vbQ42mMffRvNtPBkwXix0VEJXwI5BRhHFo=;
        b=QnCgzS4A9kpw05BZvNmESfphlnvTdd+q/7PRqpjhUkh3VXFaNgDQgVhRzYbmNAMdGS
         fvABVfA8ATFYKoh6L1/QGAE96oBcWmkQ5QPD0v1FahX1Ul1KVUIjWQV5U7YuMXqPAXLT
         aGoq+InuNMW7Jbku+VgdIJXAH91ZcLXi2nxUWVqK64G9BLoUl1jQXov8/U170whiIapE
         98yTm42sfUvcJBG0UUYEzyIG+qaiccl+15WBSbJQRhT8mVykeZbGJxM5gPkn6fzApIxJ
         g4e2vXykJgLGov5j0lsnWvZAC7A4cOCSgt7cS3MCIB62kBV5L9fSjx6F1LDzjsHwXemt
         t+YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780530429; x=1781135229;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IrsB5qlB9vbQ42mMffRvNtPBkwXix0VEJXwI5BRhHFo=;
        b=Fp6ux/ictaPMdGfSK5/N7VavKKNoMUdx0I+MTsyTveydfFSEgQtBQZnS0l3iuhM60+
         wTktlRgAmFOgLm3qzL3vm5vXPiNzQtJOPiQnJS4YuDKhcLivYtD6FIzi7C0HpzPC6OAN
         88YuAM1RNhCAXMOj7D5/j2xqo455AjjByORj0IQsAagfKt8zuL13eTA+hcZO2z44Bgnp
         ZyD7xe+Snt/KrSP/UINvPGFBzd6DJ9H+wLs/KAb65a4FsiSj/rRS1ZamfmR+PYBhGKrt
         UBVMrszBJ9hIEF3L5oiAQrfi6umrPclB+x2gYmjLtLgM07IuN/UwP2rjmj5USULc6KUp
         Nrpg==
X-Forwarded-Encrypted: i=1; AFNElJ9Vq5aJDMXWW4fytI8ylFlD5YQ2PGgDxCYVcYoDd9wlX058lU4qLiY2QJa5NjyHN/nGZh60e4vJ1FW4TL8BSg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzXpl5L71e6eAkW/0JF5QoRAqpudtIyYMyeNAfud36p+HAy7ZVA
	VM8OiP8fRWEPtgmAyeMoUx68JuOez5zC1HpJKu9iTl3BpiNV7dsT47nWiY7+wx6caemaJksaRW3
	oatJojrThLse8AwRAe2SW/6ZNJtGODmA=
X-Gm-Gg: Acq92OHRiXZ/R/gOXH5QayGO4M3wSLOdLmI9Tgn7monaDZSJ5dLVwXkZ0cgUjPOPjLI
	CaEOj12trMPJ9H074AKIvajAbCaFqzQSdA08nRRJGsUYJdQmZEnmiT9+UAe/k7P1375RB11PCFX
	o/qiTYD9X+pFCTy8SHi+gsk59MI/guklMuWVO9HaCBSfBY4vtBvffPBFEOfBvhxlRz9dCtTS9Vl
	FX4J3SQJyP5zL6CjDlDZ/C6YA2DrdTgCZ6sPA4dtC3x3BtryFQfZ7Y7ogavRkNLe6hsyuF/pqR4
	MRvPxn4mAuM12Ym441jy14RHnUL4QU76H01961cAoQkRzDo=
X-Received: by 2002:a05:622a:54f:b0:50e:6311:7380 with SMTP id
 d75a77b69052e-5178a00cdc1mr3981031cf.6.1780530429438; Wed, 03 Jun 2026
 16:47:09 -0700 (PDT)
MIME-Version: 1.0
References: <CAN6xzWcVDRLVTV-SQcs6osZjnfhLM728NP7+W8+sFcTDmeVipw@mail.gmail.com>
 <CAGp9LzrmUGQLK5giHVgOjJ5pzGNnfLaV02iWdodT7aDNBbNUqg@mail.gmail.com>
In-Reply-To: <CAGp9LzrmUGQLK5giHVgOjJ5pzGNnfLaV02iWdodT7aDNBbNUqg@mail.gmail.com>
From: Bradley Pizzimenti <brad.pizzimenti@gmail.com>
Date: Wed, 3 Jun 2026 16:46:58 -0700
X-Gm-Features: AVHnY4J9XV6wrdzDm41yteKNeBZCLKN_1ZB_hg37PDE9Gq8_o-lWRPTjxswvSgU
Message-ID: <CACjnFahYMyRc1yfb-yA-iiMk_SUOXPx0GrOBbDUEyMtbSqv9iA@mail.gmail.com>
Subject: Re: [bug report] wifi: mt76: mt7921: mt7925monitor-mode per-channel
 retune emits narrowband RF burst
To: Sean Wang <sean.wang@kernel.org>
Cc: John Henry <jshenry1963@gmail.com>, Javier Tia <floss@jetm.me>, linux-wireless@vger.kernel.org, 
	linux-kernel@vger.kernel.org, nbd@nbd.name, lorenzo@kernel.org, 
	ryder.lee@mediatek.com, shayne.chen@mediatek.com, sean.wang@mediatek.com, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, Deren Wu <deren.wu@mediatek.com>, 
	Nick Morrow <morrownr@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_164711_696687_060CD5A2 
X-CRM114-Status: GOOD (  66.77  )
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

Hi there,
Are all of these fixes going into kernel 7.1+ or introduced earlier?

On Wed, May 27, 2026 at 4:08=E2=80=AFPM Sean Wang <sean.wang@kernel.org> wr=
ote:
>
> Hi John,
>
> On Wed, May 27, 2026 at 7:24=E2=80=AFAM John Henry <jshenry1963@gmail.com=
> wrote:
> >
> > Just a kind reminder of this issue.
> >
> > Please advise if this is already taken up in a separate issue I am
> > unaware of, but it is not directly related to the "iw set txpower
> > fixed accepted but ignored" issue.
> >
> > On products available in the market, e.g.  the Alfa AWUS036AXML
> > consumer product and the Netgear Nighthawk A9000, in Monitor Mode
> > there is RF generated when scanning through channels and we get to 5
> > or more channels in succession.
> > This does not seem to occur at all in managed mode.
> >
> > This means if we scan the 2.4GHz channel list, an RF Spectrum analyzer
> > will show a narrow pulse generated on each channel as we progress
> > through the channels.
> > This can 100% be reproduced using standard iw set channel commands as
> > shown below:
> > FACE=3D$(iw dev | awk '/Interface wl/ {print $2; exit}')
> > iw reg set US ; sleep 1
> > ip link set "$IFACE" down
> > iw dev "$IFACE" set type monitor
> > ip link set "$IFACE" up
> >
> > # This triggers narrowband bursts at channel center on each retune:
> > while true; do
> >   for f in 2412 2417 2422 2427 2432; do
> >     iw dev "$IFACE" set freq "$f" HT20
> >   done
> > done
> >
>
> I have thought about this issue for a while. A possible workaround
> would be to reset WFSYS / firmware after five consecutive `set
> channel` operations in monitor mode, then restore the current monitor
> channel context. The WFSYS reset may take hundreds of milliseconds to
> complete, which is the cost we would need to pay.
>
> > No special software required to reproduce.
> > I have shown that this occurs on all MT7921 based products, along with
> > MT7925 based products.
> > It does not occur if the channel list is set to the same 4 over and
> > over, no RF generated.
> >
> > There are no calibration channel commands going from the driver to the
> > firmware, so I believe this is a firmware bug.
> >
> > Best Regards,
> > John Henry
> >
> > On Sun, May 17, 2026 at 9:01=E2=80=AFAM John Henry <jshenry1963@gmail.c=
om> wrote:
> > >
> > > Just a kind reminder of this issue, has anyone been able to reproduce
> > > this monitor mode issue?
> > > When scanning through channels, and the list of channels is > 4, ther=
e
> > > is a large transmit tick/burst coming from the MT7921u and the MT7925=
.
> > > This can easily be seen on an RF Spectrum Analyzer.
> > > Confirmed on an Alfa AWUS036AXML consumer product and the Netgear
> > > Nighthawk A9000.
> > > This can be reproduced with simple scripts.
> > >
> > > Reproduction with stock iw commands (no custom code):
> > >
> > > IFACE=3D$(iw dev | awk '/Interface wl/ {print $2; exit}')
> > > iw reg set US ; sleep 1
> > > ip link set "$IFACE" down
> > > iw dev "$IFACE" set type monitor
> > > ip link set "$IFACE" up
> > >
> > > # This triggers narrowband bursts at channel center on each retune:
> > > while true; do
> > >   for f in 2412 2417 2422 2427 2432; do
> > >     iw dev "$IFACE" set freq "$f" HT20
> > >   done
> > > done
> > >
> > > # This does NOT (only 4 frequencies):
> > > while true; do
> > >   for f in 2412 2422 2462 2484; do
> > >     iw dev "$IFACE" set freq "$f" HT20
> > >   done
> > > done
> > >
> > > Bursts are ~800 kHz wide at the base, -30 to -50 dBm OTA at close
> > > range, brief (estimated few hundred microseconds), at channel
> > > frequency. tx_stats counters remain zero throughout.
> > > On Mon, May 11, 2026 at 1:58=E2=80=AFPM John Henry <jshenry1963@gmail=
.com> wrote:
> > > >
> > > > Bradley/Sean,
> > > >
> > > > Thank you all very much for the information.
> > > > I tested this on mt7921u based Alfa AWUS unit and also an mt7925 ba=
sed
> > > > Netgear Nighthawk unit.
> > > > I can confirm that the RF tick issue is present on both models when=
 in
> > > > Monitor Mode. I'm assuming it is in the base mt76?
> > > >
> > > > I attempted sudo iw dev wlxxx set txpower fixed nn where nn is the
> > > > minimum value, next few values up, and then a few near the max valu=
es,
> > > > and see no change in the signal strength of the RF Ticks when scann=
ing
> > > > through 5 or more channels.
> > > >
> > > > Please keep this in mind when attempting to resolve the known txpow=
er
> > > > 3dBm issue if possible, or please generate a new bug report for tha=
t
> > > > specifically so that I can track when it is patched, or in ??? vers=
ion
> > > > so that I can test here locally.
> > > >
> > > > Incidentally, I'd appreciate it if anyone could please attempt to
> > > > repeat using the scripts I had shown in the previous posts and conf=
irm
> > > > it is indeed seen by others.
> > > >
> > > > Thank you very much for your time and assistance
> > > >
> > > > John Henry
> > > >
> > > >
> > > >
> > > >
> > > > From: Bradley Pizzimenti <brad.pizzimenti@gmail.com>
> > > > To: linux-wireless@vger.kernel.org
> > > > Cc: linux-kernel@vger.kernel.org, nbd@nbd.name, lorenzo@kernel.org,
> > > > ryder.lee@mediatek.com, shayne.chen@mediatek.com,
> > > > sean.wang@mediatek.com
> > > > Subject: [bug report] wifi: mt76: mt7925: iw set txpower fixed
> > > > accepted but ignored
> > > > Date: Mon, 4 May 2026 15:04:35 -0700 [thread overview]
> > > > Message-ID: <CACjnFagN9zeSkwEv3-CSPJDUENPcEcOLjKyQoLQ91Yjn=3Drq5ww@=
mail.gmail.com>
> > > > (raw)
> > > >
> > > > Hi there maintainers,
> > > >
> > > > `iw dev <iface> set txpower fixed N` returns success on mt7925 for =
any
> > > > N tested, but the reported txpower never changes from a stuck value=
 of
> > > > 3.00 dBm. The kernel accepts and ignores the call silently in both
> > > > directions (above and below the displayed value), and well below th=
e
> > > > regulatory ceiling.
> > > >
> > > > I'm aware there's prior art on the cosmetic 3.00 dBm display issue
> > > > (Razvan Grigore's v2 series, Feb 2025; Ming Yen Hsieh's txpower ini=
t
> > > > refactor, Sept 2025). What seems potentially distinct here is that =
the
> > > > user-issued `iw set txpower fixed N` itself is silently no-op'd,
> > > > separate from the reported-value question. Reporting as breadcrumbs
> > > > in case the second observation is a separate bug rather than the sa=
me
> > > > one.
> > > >
> > > > Hardware
> > > > --------
> > > > MEDIATEK MT7925 [Filogic 360], 802.11be 2x2, PCI 14c3:7925
> > > > ASIC revision 0x79250000
> > > > Driver in use: mt7925e (in-tree)
> > > >
> > > > Firmware (from dmesg at probe)
> > > > ------------------------------
> > > > mt7925e 0000:01:00.0: HW/SW Version: 0x8a108a10,
> > > >                      Build Time: 20260106153007a
> > > > mt7925e 0000:01:00.0: WM Firmware Version: ____000000,
> > > >                      Build Time: 20260106153120
> > > > Files: mediatek/mt7925/WIFI_MT7925_PATCH_MCU_1_1_hdr.bin
> > > >        mediatek/mt7925/WIFI_RAM_CODE_MT7925_1_1.bin
> > > >
> > > > Kernel
> > > > ------
> > > > 6.18.18-1-MANJARO (close to vanilla 6.18 stable; not yet tested on
> > > > wireless-next or nbd168/wireless HEAD -- happy to retest if needed,
> > > > but flagging the data point in case it helps as-is).
> > > >
> > > > Tools: iw version 6.17
> > > >
> > > > Regulatory
> > > > ----------
> > > > $ iw reg get
> > > > country US: DFS-FCC
> > > >    ...
> > > >    (5730 - 5850 @ 80), (N/A, 30), (N/A), AUTO-BW
> > > >    ...
> > > >
> > > > Connection context: 5GHz channel 161 (5805 MHz), 80 MHz, VHT-MCS,
> > > > NSS 1. So we are on a band with a 30 dBm regulatory cap.
> > > >
> > > > Observed
> > > > --------
> > > > $ iw dev wlp1s0 info | grep txpower
> > > >         txpower 3.00 dBm
> > > >
> > > > $ sudo iw dev wlp1s0 set txpower fixed 100   # 1 dBm
> > > > $ iw dev wlp1s0 info | grep txpower
> > > >         txpower 3.00 dBm
> > > >
> > > > $ sudo iw dev wlp1s0 set txpower fixed 1500  # 15 dBm
> > > > $ iw dev wlp1s0 info | grep txpower
> > > >         txpower 3.00 dBm
> > > >
> > > > $ sudo iw dev wlp1s0 set txpower auto
> > > > $ iw dev wlp1s0 info | grep txpower
> > > >         txpower 3.00 dBm
> > > >
> > > > All four `set` invocations return exit code 0. The reported value
> > > > never moves.
> > > >
> > > > Expected
> > > > --------
> > > > Either:
> > > >   - The reported txpower follows the requested value (or, where
> > > >     capped, the actual applied value with extack indicating the
> > > >     cap reason), or
> > > >   - The set call returns an error rather than silently ignoring the
> > > >     request.
> > > >
> > > > Caveats
> > > > -------
> > > > - Not yet tested on wireless-next or nbd168/wireless HEAD. If a
> > > >   reproduction on a current dev tree would be useful, I can do that=
.
> > > > - I have not verified whether the actual radiated TX power changes
> > > >   in response to `set txpower fixed`; I am reporting only the
> > > >   user-visible behavior.
> > > >
> > > > Thanks,
> > > > Bradley
> > > >
> > > > On Wed, May 6, 2026 at 8:12=E2=80=AFPM Sean Wang <sean.wang@kernel.=
org> wrote:
> > > > >
> > > > > Hi,
> > > > >
> > > > > The TX power reporting issue has already been investigated by Luc=
id
> > > > > from the Linux WiFi USB community, and there is a proposed soluti=
on.
> > > > > I think we can continue checking whether there are any remaining
> > > > > issues on top of that work. Please refer to the patches here:
> > > > > https://lists.infradead.org/pipermail/linux-mediatek/2026-April/1=
05726.html
> > > > > Thanks everyone for reporting and raising these concerns.
> > > > >
> > > > > On Wed, May 6, 2026 at 3:09=E2=80=AFPM Javier Tia <floss@jetm.me>=
 wrote:
> > > > > >
> > > > > > On Sun May  4 22:04:48 2026 Bradley Pizzimenti wrote:
> > > > > > > `iw dev <iface> set txpower fixed N` returns success on mt792=
5 for
> > > > > > > any N tested, but the reported txpower never changes from a s=
tuck
> > > > > > > value of 3.00 dBm.
> > > > > >
> > > > > > Hi Bradley,
> > > > > >
> > > > > > The 3 dBm display bug is a known issue we have seen when using =
mt7927
> > > > > > and a tested fix has been working well so far. The root cause i=
s that
> > > > > > mt7925_mcu_set_rate_txpower() programs the per-band SKU tables =
into
> > > > > > firmware but never assigns phy->txpower_cur. mt76_get_txpower()=
 then
> > > > > > computes:
> > > > > >
> > > > > >   DIV_ROUND_UP(0 + 6, 2) =3D 3
> > > > > >
> > > > > > regardless of the actual power level. The RF output is unaffect=
ed;
> > > > > > it is a display-only bug.
> > > > > >
> > > > > > The fix reads the effective TX power back from the rate power l=
imits
> > > > > > after programming the SKU tables and writes it to phy->txpower_=
cur,
> > > > > > following the same pattern used by mt7996:
> > > > > >
> > > > > >   https://github.com/jetm/mediatek-mt7927-dkms/blob/master/mt79=
27-wifi-14-fix-reported-txpower-always-showing-3-db.patch
> > > > > >
> > > > > > This is part of a series we are targeting for wireless-next; no=
t
> > > > > > yet upstream.
> > > > > >
> > > > > > > What seems potentially distinct here is that the user-issued
> > > > > > > `iw set txpower fixed N` itself is silently no-op'd, separate
> > > > > > > from the reported-value question.
> > > > > >
> > > > > > Agreed those are two separate issues. Our patch addresses the
> > > > > > display-only side: after applying it, iw will report the value =
the
> > > > > > firmware is actually using based on the SKU tables, rather than
> > > > > > always 3 dBm. Whether `set txpower fixed N` propagates to firmw=
are
> > > > > > to change actual output power is orthogonal and not addressed h=
ere.
> > > > > >
> > > > > > If you can test the patch on your MT7925 and confirm the displa=
yed
> > > > > > value reflects the correct power after association, a Tested-by
> > > > > > would be appreciated.
> > > > > >
> > > > > > Best,
> > > > > > Javier
> > > > > >
> > > > >

