Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A679CD4F54
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 May 2026 12:24:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:To:Subject:Message-ID:Date:From:MIME-Version:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RUZRWrbEXU24iyCbbrl77+mYjH0y6gf2VXfudYwaXFo=; b=ZrKIQgoIWKkiw1batGjfXP3KLm
	qE3hZ2c/6SyQxYp2jcu/vxLf42+HEUtGkgTfBsapox8dWpSbYr163vyTlcY+weNI+DaWvg651hc2w
	aOAl2rHzzfFczxTBVtWwv4UVJmQVMNVHcfAN7KDzTDZRgaoN+l1veIAJnBEHfXT8HHcqN8TIZBuXn
	I/IOZZrZ44mOE86tE9E6mn80+qkQ05Au/azImeTrfyM6BWtFK+AyYXQB3oCyfK2bmtSUcWyFU/Ntk
	N0gCw3fuVwbi9YQG1b33FWKiEOCEyt52UbGNOsXyZ6bfxl4EJCBNSzsbTPdPwuYCRcpHGteWmzgZ/
	vj+oDozA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSDJh-000000045GA-1zsj;
	Wed, 27 May 2026 12:24:57 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSDJe-000000045FZ-35fJ
	for linux-mediatek@lists.infradead.org;
	Wed, 27 May 2026 12:24:56 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-5a8891febd2so15419356e87.1
        for <linux-mediatek@lists.infradead.org>; Wed, 27 May 2026 05:24:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779884693; cv=none;
        d=google.com; s=arc-20240605;
        b=D/B2E7/yAHsRaI5y483EyDMeovKuCMCS7HmUg46jJx8DiJvQe0iMWfCn5bsYVLnn+U
         qDd/RhS/Ee9bxsVPQ45uw+nGJmDc+F37iVNjCWc1Vd0yvAqNET3Wp3se/3om/PvsDkjh
         BGTb6FiDkod9wKyeHCWcDO/CeTDpZaG122E0VLtUsJG3oWGl1WTCziPOyKN0acv7PPfD
         8ZfSFFxZSExk0DQQRXbbyy+JirWfVkJ8a7p6Fm7FTSvcXR+QrpwiE3nxAzEIeCt2M82c
         rrARwN+oDRLonCpxIFme+KGBXUK0maRkMDuy6vubUWDuAY5Kj/bqtCYkLeo0YNPP5gNi
         xVYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=RUZRWrbEXU24iyCbbrl77+mYjH0y6gf2VXfudYwaXFo=;
        fh=Fw33Q/1D66eSNiTwH2CY/uk2ZGd+KmaL98lttvI+KmI=;
        b=O8LJEjw8CnvcNZqHwnb12zD5cVBuGnRZ+2AO5kWXXDCxLatjbk6ivRiAuHlrXYm6io
         ZlFZunlAxSpVe14RV4PhLyzF3EBquDvJDmiXwJwWNrBEHHp5SHWIwhgfeeEBYzeSTGHR
         n+IL1cPYgpXVA7YQziAXke/ncj3SII7pH00PDx/eW9tDphM4wtu5rtGjr42JattRNjwE
         dOSLONylPeC60lZlcICtqXDxlZevFNMBH0rnmYGZiaME9Zr3dU0H4acyWXaJcDSaqDo5
         i/eOJK0sMbap24u2r5i5rfzHX1RUaNmQMxjeu1+ydTWNQ/9KKUHNskUOWdqh0pq2wgiG
         UNCw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779884693; x=1780489493; darn=lists.infradead.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=RUZRWrbEXU24iyCbbrl77+mYjH0y6gf2VXfudYwaXFo=;
        b=mi616l8+qwtIxjI40XIPWSOAgjr8Fx5RPEzZ8cZrfrp1ynKzgD9JIw0JovNsIMYswY
         XpJfj8fsS+LKW6VUQ8/MENMHI1tT9SUa3/50EOavKJ1KrRE88TYRm+HZMPpKtyq0ZVpf
         QFa+HVZvnLrqm73xqfzlv35FMpJkuJix4v3MUlcO1C+xnBmKm7DVEeaVr9vV1A/Yf48w
         XzQ/YzhY8MNJUl6+lh5LHE+MktV4lGSFu4vdF68PyuRnLWCuxzgBOE5oNAIW0lF4K9Sd
         du1vevBs41dliE92jVnJG3DV2o6whSJ1OgYQUKwwuxZ1gbYtxvwplDvV4UUH2vXc1zXK
         SB3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779884693; x=1780489493;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RUZRWrbEXU24iyCbbrl77+mYjH0y6gf2VXfudYwaXFo=;
        b=D3sM0Oxo4z+Kq67bBlsZIAyNmihfBIFuPt+ChpiHUT20Kf1AM9Uwlx0/u4ComZKosU
         2jVund3Vz/k4mXE0j6kuuV6zBZeV2r3q0PvZS2Hxm4qR10puXyZ4EB95DVSPXiXhorMp
         vmX31qKYh5bcdrpJhIb2XBbQ1izo5tZorl2e1xWNvFcr72v/O2OMB1rKjaiQtzSwwev2
         5dgFdazAiBWLRrEt4yDoajAlKYGCwxT8SYxrLRK+xKYRL/FN46fcOrXvLDHZfkmnxJ/u
         YMXfVxoSmor2H/Y+GoDA0dlBkPycsyCWUw2BWvN7qCkBPw0dK1Eh7jmsYDWGtwl/HtRL
         xuJg==
X-Forwarded-Encrypted: i=1; AFNElJ82XfU/3IZxB6g4zDZlmqo1zCDtj93NKbcWKpmajP1erkgDTA/Miv2xIMvGZUFrciTVY9IJKXA/WZOyAFlrYQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwMOZEzu2yE3AZKj2PYrTv6j4XrGY3t6Yk2660hyLvisEvZ/xOJ
	SPZ1ao1IJkTT1EaM4+dColHY9oKEJw9sjOk1+u4luQVg8SK8WK21dHkKegqBCQt29zP2HljSyRX
	s0E1mbrfWPKxoj1jdM8vXMtvhqFu7Ux8=
X-Gm-Gg: Acq92OFWyi0YYcYYgyJeQPFj134/j7ipRhSW0dEAO0kPFf08LZAUQh6tQz1A6rW0EUA
	a4X+L09YHcEwhDlB9SI803XZ7X4It4tP+aYjY5+krXmerV0dhwJMaTjHLJSKZlIW7SLuMPSXn2I
	RJGLtLxj0rfjGvbZt+aHFpQfHecLvAImFJiLtjDa5vLz3Zvxy3Hflc5mFWYEHpfGqhSB2ILwHZ+
	v2pOl5ZQfTsh+qbU2nB5QLtDxbof6+tjQQkAB7ME/rp40sH08Fi9zA/eCBD7plqhfaLnlzvWCxL
	wybqBnSq7B8tiNfa4A==
X-Received: by 2002:ac2:5625:0:b0:5a8:7701:b815 with SMTP id
 2adb3069b0e04-5aa3237d537mr5419916e87.8.1779884692286; Wed, 27 May 2026
 05:24:52 -0700 (PDT)
MIME-Version: 1.0
From: John Henry <jshenry1963@gmail.com>
Date: Wed, 27 May 2026 08:24:39 -0400
X-Gm-Features: AVHnY4JkDJI6tcD9rdJGDYLvoe374uGsxsOSvUe06lI88pIIqwfblneWcp6ZKVw
Message-ID: <CAN6xzWcVDRLVTV-SQcs6osZjnfhLM728NP7+W8+sFcTDmeVipw@mail.gmail.com>
Subject: [bug report] wifi: mt76: mt7921: mt7925monitor-mode per-channel
 retune emits narrowband RF burst
To: Javier Tia <floss@jetm.me>, Bradley Pizzimenti <brad.pizzimenti@gmail.com>, 
	linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, nbd@nbd.name, 
	lorenzo@kernel.org, ryder.lee@mediatek.com, shayne.chen@mediatek.com, 
	sean.wang@mediatek.com, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, Deren Wu <deren.wu@mediatek.com>, 
	Nick Morrow <morrownr@gmail.com>, Sean Wang <sean.wang@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_052454_853426_96458E01 
X-CRM114-Status: GOOD (  67.08  )
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

Just a kind reminder of this issue.

Please advise if this is already taken up in a separate issue I am
unaware of, but it is not directly related to the "iw set txpower
fixed accepted but ignored" issue.

On products available in the market, e.g.  the Alfa AWUS036AXML
consumer product and the Netgear Nighthawk A9000, in Monitor Mode
there is RF generated when scanning through channels and we get to 5
or more channels in succession.
This does not seem to occur at all in managed mode.

This means if we scan the 2.4GHz channel list, an RF Spectrum analyzer
will show a narrow pulse generated on each channel as we progress
through the channels.
This can 100% be reproduced using standard iw set channel commands as
shown below:
FACE=3D$(iw dev | awk '/Interface wl/ {print $2; exit}')
iw reg set US ; sleep 1
ip link set "$IFACE" down
iw dev "$IFACE" set type monitor
ip link set "$IFACE" up

# This triggers narrowband bursts at channel center on each retune:
while true; do
  for f in 2412 2417 2422 2427 2432; do
    iw dev "$IFACE" set freq "$f" HT20
  done
done

No special software required to reproduce.
I have shown that this occurs on all MT7921 based products, along with
MT7925 based products.
It does not occur if the channel list is set to the same 4 over and
over, no RF generated.

There are no calibration channel commands going from the driver to the
firmware, so I believe this is a firmware bug.

Best Regards,
John Henry

On Sun, May 17, 2026 at 9:01=E2=80=AFAM John Henry <jshenry1963@gmail.com> =
wrote:
>
> Just a kind reminder of this issue, has anyone been able to reproduce
> this monitor mode issue?
> When scanning through channels, and the list of channels is > 4, there
> is a large transmit tick/burst coming from the MT7921u and the MT7925.
> This can easily be seen on an RF Spectrum Analyzer.
> Confirmed on an Alfa AWUS036AXML consumer product and the Netgear
> Nighthawk A9000.
> This can be reproduced with simple scripts.
>
> Reproduction with stock iw commands (no custom code):
>
> IFACE=3D$(iw dev | awk '/Interface wl/ {print $2; exit}')
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
> # This does NOT (only 4 frequencies):
> while true; do
>   for f in 2412 2422 2462 2484; do
>     iw dev "$IFACE" set freq "$f" HT20
>   done
> done
>
> Bursts are ~800 kHz wide at the base, -30 to -50 dBm OTA at close
> range, brief (estimated few hundred microseconds), at channel
> frequency. tx_stats counters remain zero throughout.
> On Mon, May 11, 2026 at 1:58=E2=80=AFPM John Henry <jshenry1963@gmail.com=
> wrote:
> >
> > Bradley/Sean,
> >
> > Thank you all very much for the information.
> > I tested this on mt7921u based Alfa AWUS unit and also an mt7925 based
> > Netgear Nighthawk unit.
> > I can confirm that the RF tick issue is present on both models when in
> > Monitor Mode. I'm assuming it is in the base mt76?
> >
> > I attempted sudo iw dev wlxxx set txpower fixed nn where nn is the
> > minimum value, next few values up, and then a few near the max values,
> > and see no change in the signal strength of the RF Ticks when scanning
> > through 5 or more channels.
> >
> > Please keep this in mind when attempting to resolve the known txpower
> > 3dBm issue if possible, or please generate a new bug report for that
> > specifically so that I can track when it is patched, or in ??? version
> > so that I can test here locally.
> >
> > Incidentally, I'd appreciate it if anyone could please attempt to
> > repeat using the scripts I had shown in the previous posts and confirm
> > it is indeed seen by others.
> >
> > Thank you very much for your time and assistance
> >
> > John Henry
> >
> >
> >
> >
> > From: Bradley Pizzimenti <brad.pizzimenti@gmail.com>
> > To: linux-wireless@vger.kernel.org
> > Cc: linux-kernel@vger.kernel.org, nbd@nbd.name, lorenzo@kernel.org,
> > ryder.lee@mediatek.com, shayne.chen@mediatek.com,
> > sean.wang@mediatek.com
> > Subject: [bug report] wifi: mt76: mt7925: iw set txpower fixed
> > accepted but ignored
> > Date: Mon, 4 May 2026 15:04:35 -0700 [thread overview]
> > Message-ID: <CACjnFagN9zeSkwEv3-CSPJDUENPcEcOLjKyQoLQ91Yjn=3Drq5ww@mail=
.gmail.com>
> > (raw)
> >
> > Hi there maintainers,
> >
> > `iw dev <iface> set txpower fixed N` returns success on mt7925 for any
> > N tested, but the reported txpower never changes from a stuck value of
> > 3.00 dBm. The kernel accepts and ignores the call silently in both
> > directions (above and below the displayed value), and well below the
> > regulatory ceiling.
> >
> > I'm aware there's prior art on the cosmetic 3.00 dBm display issue
> > (Razvan Grigore's v2 series, Feb 2025; Ming Yen Hsieh's txpower init
> > refactor, Sept 2025). What seems potentially distinct here is that the
> > user-issued `iw set txpower fixed N` itself is silently no-op'd,
> > separate from the reported-value question. Reporting as breadcrumbs
> > in case the second observation is a separate bug rather than the same
> > one.
> >
> > Hardware
> > --------
> > MEDIATEK MT7925 [Filogic 360], 802.11be 2x2, PCI 14c3:7925
> > ASIC revision 0x79250000
> > Driver in use: mt7925e (in-tree)
> >
> > Firmware (from dmesg at probe)
> > ------------------------------
> > mt7925e 0000:01:00.0: HW/SW Version: 0x8a108a10,
> >                      Build Time: 20260106153007a
> > mt7925e 0000:01:00.0: WM Firmware Version: ____000000,
> >                      Build Time: 20260106153120
> > Files: mediatek/mt7925/WIFI_MT7925_PATCH_MCU_1_1_hdr.bin
> >        mediatek/mt7925/WIFI_RAM_CODE_MT7925_1_1.bin
> >
> > Kernel
> > ------
> > 6.18.18-1-MANJARO (close to vanilla 6.18 stable; not yet tested on
> > wireless-next or nbd168/wireless HEAD -- happy to retest if needed,
> > but flagging the data point in case it helps as-is).
> >
> > Tools: iw version 6.17
> >
> > Regulatory
> > ----------
> > $ iw reg get
> > country US: DFS-FCC
> >    ...
> >    (5730 - 5850 @ 80), (N/A, 30), (N/A), AUTO-BW
> >    ...
> >
> > Connection context: 5GHz channel 161 (5805 MHz), 80 MHz, VHT-MCS,
> > NSS 1. So we are on a band with a 30 dBm regulatory cap.
> >
> > Observed
> > --------
> > $ iw dev wlp1s0 info | grep txpower
> >         txpower 3.00 dBm
> >
> > $ sudo iw dev wlp1s0 set txpower fixed 100   # 1 dBm
> > $ iw dev wlp1s0 info | grep txpower
> >         txpower 3.00 dBm
> >
> > $ sudo iw dev wlp1s0 set txpower fixed 1500  # 15 dBm
> > $ iw dev wlp1s0 info | grep txpower
> >         txpower 3.00 dBm
> >
> > $ sudo iw dev wlp1s0 set txpower auto
> > $ iw dev wlp1s0 info | grep txpower
> >         txpower 3.00 dBm
> >
> > All four `set` invocations return exit code 0. The reported value
> > never moves.
> >
> > Expected
> > --------
> > Either:
> >   - The reported txpower follows the requested value (or, where
> >     capped, the actual applied value with extack indicating the
> >     cap reason), or
> >   - The set call returns an error rather than silently ignoring the
> >     request.
> >
> > Caveats
> > -------
> > - Not yet tested on wireless-next or nbd168/wireless HEAD. If a
> >   reproduction on a current dev tree would be useful, I can do that.
> > - I have not verified whether the actual radiated TX power changes
> >   in response to `set txpower fixed`; I am reporting only the
> >   user-visible behavior.
> >
> > Thanks,
> > Bradley
> >
> > On Wed, May 6, 2026 at 8:12=E2=80=AFPM Sean Wang <sean.wang@kernel.org>=
 wrote:
> > >
> > > Hi,
> > >
> > > The TX power reporting issue has already been investigated by Lucid
> > > from the Linux WiFi USB community, and there is a proposed solution.
> > > I think we can continue checking whether there are any remaining
> > > issues on top of that work. Please refer to the patches here:
> > > https://lists.infradead.org/pipermail/linux-mediatek/2026-April/10572=
6.html
> > > Thanks everyone for reporting and raising these concerns.
> > >
> > > On Wed, May 6, 2026 at 3:09=E2=80=AFPM Javier Tia <floss@jetm.me> wro=
te:
> > > >
> > > > On Sun May  4 22:04:48 2026 Bradley Pizzimenti wrote:
> > > > > `iw dev <iface> set txpower fixed N` returns success on mt7925 fo=
r
> > > > > any N tested, but the reported txpower never changes from a stuck
> > > > > value of 3.00 dBm.
> > > >
> > > > Hi Bradley,
> > > >
> > > > The 3 dBm display bug is a known issue we have seen when using mt79=
27
> > > > and a tested fix has been working well so far. The root cause is th=
at
> > > > mt7925_mcu_set_rate_txpower() programs the per-band SKU tables into
> > > > firmware but never assigns phy->txpower_cur. mt76_get_txpower() the=
n
> > > > computes:
> > > >
> > > >   DIV_ROUND_UP(0 + 6, 2) =3D 3
> > > >
> > > > regardless of the actual power level. The RF output is unaffected;
> > > > it is a display-only bug.
> > > >
> > > > The fix reads the effective TX power back from the rate power limit=
s
> > > > after programming the SKU tables and writes it to phy->txpower_cur,
> > > > following the same pattern used by mt7996:
> > > >
> > > >   https://github.com/jetm/mediatek-mt7927-dkms/blob/master/mt7927-w=
ifi-14-fix-reported-txpower-always-showing-3-db.patch
> > > >
> > > > This is part of a series we are targeting for wireless-next; not
> > > > yet upstream.
> > > >
> > > > > What seems potentially distinct here is that the user-issued
> > > > > `iw set txpower fixed N` itself is silently no-op'd, separate
> > > > > from the reported-value question.
> > > >
> > > > Agreed those are two separate issues. Our patch addresses the
> > > > display-only side: after applying it, iw will report the value the
> > > > firmware is actually using based on the SKU tables, rather than
> > > > always 3 dBm. Whether `set txpower fixed N` propagates to firmware
> > > > to change actual output power is orthogonal and not addressed here.
> > > >
> > > > If you can test the patch on your MT7925 and confirm the displayed
> > > > value reflects the correct power after association, a Tested-by
> > > > would be appreciated.
> > > >
> > > > Best,
> > > > Javier
> > > >
> > >

