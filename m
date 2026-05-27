Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85A11CD4F54
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 May 2026 23:08:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0WVyQig7ZuVGJIY/+WC97L19CBbGyFEtfGtUCmnpbbM=; b=wZeG07AAvzB5eog8CL7O8CFCcl
	2cX5RbKyVxaCauN3U81tM4msvXWDMAZ2rgxpfcoSNDSKabC2tpRpf0CbYGho8RLCWHYXgtbk5omOU
	bueK+QuzZL5BFpLcKRMj705hFml61Hd/aUQ8jKa2NDl6NZMGKikkk7C5qwQ3ZxD3SG7xs9qgXUTRA
	k1W23NknWDE/e8sxk7nvCc9GZJb02L2kLJOMIFGNSBvm8y4Gf8MgdkCiFbkQpUFIjLkOg4y/H/r25
	MGfHI7Au5izGQ0XyqWJ4BhXYMVbyLsJQn9yK9+ow4AfC9dehNp35vrTCygWXuybtXMpZrXk02mzhs
	J3wwDOlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSNMR-00000004pJ2-3A7F;
	Wed, 27 May 2026 23:08:27 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSNMQ-00000004pIv-2MPA
	for linux-mediatek@lists.infradead.org;
	Wed, 27 May 2026 23:08:26 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9A4BC605C4
	for <linux-mediatek@lists.infradead.org>; Wed, 27 May 2026 23:08:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F4431F00A3F
	for <linux-mediatek@lists.infradead.org>; Wed, 27 May 2026 23:08:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779923305;
	bh=0WVyQig7ZuVGJIY/+WC97L19CBbGyFEtfGtUCmnpbbM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=KxUUcd8Lhf65q3HZzVf4uEZauOiWVruOaU1fgY6QiX/G8xDOgncAXWg7XbVeNSdSt
	 tT4hcwrARxt+b/VpYAt33U0yC7WHn8aS1n+SaOe0p1gUuuy85WO2Sp8Mw8iGFKNZvX
	 dwZzk/BCPncZCHGNT6wZUY65unalhaZhj0hRXzjwBsLZqvYq2DTsTQLxH6bqowkj91
	 LqQFGknWUB91Hj6gLmP6xO2fCdEjpH2nHH3O7R1L9BnW6kOaZlxSdiGPve19KAuXa8
	 V63t59vSGAlB0sESK0y3jtPOl61gaqZ6rktoaajRagddglX+I4+uYAU/WbxwR5genO
	 NbpeIfGq0fztg==
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-394413a63d3so92312641fa.1
        for <linux-mediatek@lists.infradead.org>; Wed, 27 May 2026 16:08:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9/meENZlJiHiV4zrT9tCP9G/lbiFM7CDjOgZxfsNlsapoaTUHUDR46ECTNJ78ktuXy9c7xkZ1HYTFBz+CDNA==@lists.infradead.org
X-Gm-Message-State: AOJu0YytJZo2L2KiqFwyzHLNFls0/F1lRkpSDsI/VS7aX5vOxqJi7Efp
	Ay9kz2hEse/MXNH3Nw2mKPmX0bZK1NJWePgok0QXe+RdTZYzEqAgGfvTvBr/H1JKtvJqVAz2eoH
	zLaQVMwiv68m0UBSGWgBwYc0mR02/zzo=
X-Received: by 2002:a05:651c:1595:b0:395:c810:a61e with SMTP id
 38308e7fff4ca-395d8bbc310mr92717411fa.6.1779923303504; Wed, 27 May 2026
 16:08:23 -0700 (PDT)
MIME-Version: 1.0
References: <CAN6xzWcVDRLVTV-SQcs6osZjnfhLM728NP7+W8+sFcTDmeVipw@mail.gmail.com>
In-Reply-To: <CAN6xzWcVDRLVTV-SQcs6osZjnfhLM728NP7+W8+sFcTDmeVipw@mail.gmail.com>
From: Sean Wang <sean.wang@kernel.org>
Date: Wed, 27 May 2026 18:08:12 -0500
X-Gmail-Original-Message-ID: <CAGp9LzrmUGQLK5giHVgOjJ5pzGNnfLaV02iWdodT7aDNBbNUqg@mail.gmail.com>
X-Gm-Features: AVHnY4I4tlMigaJEVngJSC5_0I6ePShr2YjyerB-J8-6H0yep3I8zxUIWqpRafE
Message-ID: <CAGp9LzrmUGQLK5giHVgOjJ5pzGNnfLaV02iWdodT7aDNBbNUqg@mail.gmail.com>
Subject: Re: [bug report] wifi: mt76: mt7921: mt7925monitor-mode per-channel
 retune emits narrowband RF burst
To: John Henry <jshenry1963@gmail.com>
Cc: Javier Tia <floss@jetm.me>, Bradley Pizzimenti <brad.pizzimenti@gmail.com>, 
	linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, nbd@nbd.name, 
	lorenzo@kernel.org, ryder.lee@mediatek.com, shayne.chen@mediatek.com, 
	sean.wang@mediatek.com, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, Deren Wu <deren.wu@mediatek.com>, 
	Nick Morrow <morrownr@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

Hi John,

On Wed, May 27, 2026 at 7:24=E2=80=AFAM John Henry <jshenry1963@gmail.com> =
wrote:
>
> Just a kind reminder of this issue.
>
> Please advise if this is already taken up in a separate issue I am
> unaware of, but it is not directly related to the "iw set txpower
> fixed accepted but ignored" issue.
>
> On products available in the market, e.g.  the Alfa AWUS036AXML
> consumer product and the Netgear Nighthawk A9000, in Monitor Mode
> there is RF generated when scanning through channels and we get to 5
> or more channels in succession.
> This does not seem to occur at all in managed mode.
>
> This means if we scan the 2.4GHz channel list, an RF Spectrum analyzer
> will show a narrow pulse generated on each channel as we progress
> through the channels.
> This can 100% be reproduced using standard iw set channel commands as
> shown below:
> FACE=3D$(iw dev | awk '/Interface wl/ {print $2; exit}')
> iw reg set US ; sleep 1
> ip link set "$IFACE" down
> iw dev "$IFACE" set type monitor
> ip link set "$IFACE" up
>
> # This triggers narrowband bursts at channel center on each retune:
> while true; do
>   for f in 2412 2417 2422 2427 2432; do
>     iw dev "$IFACE" set freq "$f" HT20
>   done
> done
>

I have thought about this issue for a while. A possible workaround
would be to reset WFSYS / firmware after five consecutive `set
channel` operations in monitor mode, then restore the current monitor
channel context. The WFSYS reset may take hundreds of milliseconds to
complete, which is the cost we would need to pay.

> No special software required to reproduce.
> I have shown that this occurs on all MT7921 based products, along with
> MT7925 based products.
> It does not occur if the channel list is set to the same 4 over and
> over, no RF generated.
>
> There are no calibration channel commands going from the driver to the
> firmware, so I believe this is a firmware bug.
>
> Best Regards,
> John Henry
>
> On Sun, May 17, 2026 at 9:01=E2=80=AFAM John Henry <jshenry1963@gmail.com=
> wrote:
> >
> > Just a kind reminder of this issue, has anyone been able to reproduce
> > this monitor mode issue?
> > When scanning through channels, and the list of channels is > 4, there
> > is a large transmit tick/burst coming from the MT7921u and the MT7925.
> > This can easily be seen on an RF Spectrum Analyzer.
> > Confirmed on an Alfa AWUS036AXML consumer product and the Netgear
> > Nighthawk A9000.
> > This can be reproduced with simple scripts.
> >
> > Reproduction with stock iw commands (no custom code):
> >
> > IFACE=3D$(iw dev | awk '/Interface wl/ {print $2; exit}')
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
> > # This does NOT (only 4 frequencies):
> > while true; do
> >   for f in 2412 2422 2462 2484; do
> >     iw dev "$IFACE" set freq "$f" HT20
> >   done
> > done
> >
> > Bursts are ~800 kHz wide at the base, -30 to -50 dBm OTA at close
> > range, brief (estimated few hundred microseconds), at channel
> > frequency. tx_stats counters remain zero throughout.
> > On Mon, May 11, 2026 at 1:58=E2=80=AFPM John Henry <jshenry1963@gmail.c=
om> wrote:
> > >
> > > Bradley/Sean,
> > >
> > > Thank you all very much for the information.
> > > I tested this on mt7921u based Alfa AWUS unit and also an mt7925 base=
d
> > > Netgear Nighthawk unit.
> > > I can confirm that the RF tick issue is present on both models when i=
n
> > > Monitor Mode. I'm assuming it is in the base mt76?
> > >
> > > I attempted sudo iw dev wlxxx set txpower fixed nn where nn is the
> > > minimum value, next few values up, and then a few near the max values=
,
> > > and see no change in the signal strength of the RF Ticks when scannin=
g
> > > through 5 or more channels.
> > >
> > > Please keep this in mind when attempting to resolve the known txpower
> > > 3dBm issue if possible, or please generate a new bug report for that
> > > specifically so that I can track when it is patched, or in ??? versio=
n
> > > so that I can test here locally.
> > >
> > > Incidentally, I'd appreciate it if anyone could please attempt to
> > > repeat using the scripts I had shown in the previous posts and confir=
m
> > > it is indeed seen by others.
> > >
> > > Thank you very much for your time and assistance
> > >
> > > John Henry
> > >
> > >
> > >
> > >
> > > From: Bradley Pizzimenti <brad.pizzimenti@gmail.com>
> > > To: linux-wireless@vger.kernel.org
> > > Cc: linux-kernel@vger.kernel.org, nbd@nbd.name, lorenzo@kernel.org,
> > > ryder.lee@mediatek.com, shayne.chen@mediatek.com,
> > > sean.wang@mediatek.com
> > > Subject: [bug report] wifi: mt76: mt7925: iw set txpower fixed
> > > accepted but ignored
> > > Date: Mon, 4 May 2026 15:04:35 -0700 [thread overview]
> > > Message-ID: <CACjnFagN9zeSkwEv3-CSPJDUENPcEcOLjKyQoLQ91Yjn=3Drq5ww@ma=
il.gmail.com>
> > > (raw)
> > >
> > > Hi there maintainers,
> > >
> > > `iw dev <iface> set txpower fixed N` returns success on mt7925 for an=
y
> > > N tested, but the reported txpower never changes from a stuck value o=
f
> > > 3.00 dBm. The kernel accepts and ignores the call silently in both
> > > directions (above and below the displayed value), and well below the
> > > regulatory ceiling.
> > >
> > > I'm aware there's prior art on the cosmetic 3.00 dBm display issue
> > > (Razvan Grigore's v2 series, Feb 2025; Ming Yen Hsieh's txpower init
> > > refactor, Sept 2025). What seems potentially distinct here is that th=
e
> > > user-issued `iw set txpower fixed N` itself is silently no-op'd,
> > > separate from the reported-value question. Reporting as breadcrumbs
> > > in case the second observation is a separate bug rather than the same
> > > one.
> > >
> > > Hardware
> > > --------
> > > MEDIATEK MT7925 [Filogic 360], 802.11be 2x2, PCI 14c3:7925
> > > ASIC revision 0x79250000
> > > Driver in use: mt7925e (in-tree)
> > >
> > > Firmware (from dmesg at probe)
> > > ------------------------------
> > > mt7925e 0000:01:00.0: HW/SW Version: 0x8a108a10,
> > >                      Build Time: 20260106153007a
> > > mt7925e 0000:01:00.0: WM Firmware Version: ____000000,
> > >                      Build Time: 20260106153120
> > > Files: mediatek/mt7925/WIFI_MT7925_PATCH_MCU_1_1_hdr.bin
> > >        mediatek/mt7925/WIFI_RAM_CODE_MT7925_1_1.bin
> > >
> > > Kernel
> > > ------
> > > 6.18.18-1-MANJARO (close to vanilla 6.18 stable; not yet tested on
> > > wireless-next or nbd168/wireless HEAD -- happy to retest if needed,
> > > but flagging the data point in case it helps as-is).
> > >
> > > Tools: iw version 6.17
> > >
> > > Regulatory
> > > ----------
> > > $ iw reg get
> > > country US: DFS-FCC
> > >    ...
> > >    (5730 - 5850 @ 80), (N/A, 30), (N/A), AUTO-BW
> > >    ...
> > >
> > > Connection context: 5GHz channel 161 (5805 MHz), 80 MHz, VHT-MCS,
> > > NSS 1. So we are on a band with a 30 dBm regulatory cap.
> > >
> > > Observed
> > > --------
> > > $ iw dev wlp1s0 info | grep txpower
> > >         txpower 3.00 dBm
> > >
> > > $ sudo iw dev wlp1s0 set txpower fixed 100   # 1 dBm
> > > $ iw dev wlp1s0 info | grep txpower
> > >         txpower 3.00 dBm
> > >
> > > $ sudo iw dev wlp1s0 set txpower fixed 1500  # 15 dBm
> > > $ iw dev wlp1s0 info | grep txpower
> > >         txpower 3.00 dBm
> > >
> > > $ sudo iw dev wlp1s0 set txpower auto
> > > $ iw dev wlp1s0 info | grep txpower
> > >         txpower 3.00 dBm
> > >
> > > All four `set` invocations return exit code 0. The reported value
> > > never moves.
> > >
> > > Expected
> > > --------
> > > Either:
> > >   - The reported txpower follows the requested value (or, where
> > >     capped, the actual applied value with extack indicating the
> > >     cap reason), or
> > >   - The set call returns an error rather than silently ignoring the
> > >     request.
> > >
> > > Caveats
> > > -------
> > > - Not yet tested on wireless-next or nbd168/wireless HEAD. If a
> > >   reproduction on a current dev tree would be useful, I can do that.
> > > - I have not verified whether the actual radiated TX power changes
> > >   in response to `set txpower fixed`; I am reporting only the
> > >   user-visible behavior.
> > >
> > > Thanks,
> > > Bradley
> > >
> > > On Wed, May 6, 2026 at 8:12=E2=80=AFPM Sean Wang <sean.wang@kernel.or=
g> wrote:
> > > >
> > > > Hi,
> > > >
> > > > The TX power reporting issue has already been investigated by Lucid
> > > > from the Linux WiFi USB community, and there is a proposed solution=
.
> > > > I think we can continue checking whether there are any remaining
> > > > issues on top of that work. Please refer to the patches here:
> > > > https://lists.infradead.org/pipermail/linux-mediatek/2026-April/105=
726.html
> > > > Thanks everyone for reporting and raising these concerns.
> > > >
> > > > On Wed, May 6, 2026 at 3:09=E2=80=AFPM Javier Tia <floss@jetm.me> w=
rote:
> > > > >
> > > > > On Sun May  4 22:04:48 2026 Bradley Pizzimenti wrote:
> > > > > > `iw dev <iface> set txpower fixed N` returns success on mt7925 =
for
> > > > > > any N tested, but the reported txpower never changes from a stu=
ck
> > > > > > value of 3.00 dBm.
> > > > >
> > > > > Hi Bradley,
> > > > >
> > > > > The 3 dBm display bug is a known issue we have seen when using mt=
7927
> > > > > and a tested fix has been working well so far. The root cause is =
that
> > > > > mt7925_mcu_set_rate_txpower() programs the per-band SKU tables in=
to
> > > > > firmware but never assigns phy->txpower_cur. mt76_get_txpower() t=
hen
> > > > > computes:
> > > > >
> > > > >   DIV_ROUND_UP(0 + 6, 2) =3D 3
> > > > >
> > > > > regardless of the actual power level. The RF output is unaffected=
;
> > > > > it is a display-only bug.
> > > > >
> > > > > The fix reads the effective TX power back from the rate power lim=
its
> > > > > after programming the SKU tables and writes it to phy->txpower_cu=
r,
> > > > > following the same pattern used by mt7996:
> > > > >
> > > > >   https://github.com/jetm/mediatek-mt7927-dkms/blob/master/mt7927=
-wifi-14-fix-reported-txpower-always-showing-3-db.patch
> > > > >
> > > > > This is part of a series we are targeting for wireless-next; not
> > > > > yet upstream.
> > > > >
> > > > > > What seems potentially distinct here is that the user-issued
> > > > > > `iw set txpower fixed N` itself is silently no-op'd, separate
> > > > > > from the reported-value question.
> > > > >
> > > > > Agreed those are two separate issues. Our patch addresses the
> > > > > display-only side: after applying it, iw will report the value th=
e
> > > > > firmware is actually using based on the SKU tables, rather than
> > > > > always 3 dBm. Whether `set txpower fixed N` propagates to firmwar=
e
> > > > > to change actual output power is orthogonal and not addressed her=
e.
> > > > >
> > > > > If you can test the patch on your MT7925 and confirm the displaye=
d
> > > > > value reflects the correct power after association, a Tested-by
> > > > > would be appreciated.
> > > > >
> > > > > Best,
> > > > > Javier
> > > > >
> > > >

