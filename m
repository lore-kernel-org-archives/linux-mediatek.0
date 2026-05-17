Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9066CD4F21
	for <linux-mediatek@archiver.kernel.org>; Sun, 17 May 2026 13:02:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FhotB3WmZS4RdLDhV3zhLMq1HMhtHjJJYY8Fard8AIs=; b=eqMZIt2VFW69RyVRBzGU8YUnj7
	dO7elTm2oeXG/sQFSGm8yZ98aGMBJpjo/QIvxyIz+rfsgUckHMx+LKw5hC6uPzreTUna/WxRwEsbJ
	1Q4hCyLFigoPqlPBOvr//71xKD5yK7R4V0ZJi41jEK95GvG8elsaOgozrgc9u1/1ES/D/Tf2O+4RL
	2kWJrQmU2v//L81sSWQUPS3i9rRB3VXPr7Ak6QC55b2e9h74j/WmU7z7Ega2KpmqOZsCksnENdEow
	6IDsExSLRHUQn3rnd8q6qAYdmUuS0YE7uAzAKZXQFubtq7f/V3UFbkVQfglq2kspzpe2sHlUVPIej
	BvmPOwyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOb8L-0000000Cjou-3YYd;
	Sun, 17 May 2026 13:02:17 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOb8H-0000000CjoC-1HHK
	for linux-mediatek@lists.infradead.org;
	Sun, 17 May 2026 13:02:16 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-5a8cb92f26aso1545156e87.1
        for <linux-mediatek@lists.infradead.org>; Sun, 17 May 2026 06:02:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779022931; cv=none;
        d=google.com; s=arc-20240605;
        b=ELTbsXe6ZBGKP1nvdej9satCnpnsJoaiOXqyLVn0O20aBj0L+qAEGuKK47ES8gAPYp
         wwqhVNFflG2pl9fCMJQFolPBTnb6quAfk4OMvk03rWpQ5XyA84jtAv4KnVMycV+PpJC/
         AcL55mKvpkhiPa/+CFqvYUecAB6Nc56pNuznJZPk+kaOPS2nr0xdTYGpuC+uyi2odoFj
         3EkcfO+czscEthjjkzZRedvETiuyQIB41qwlnz+Thrl4no/xBnZj1N47+1IkaMcL0NDb
         UBMVoBxpZ82inObnPYivyubD0yOwJqt2hJazNcntAvypathQRX1F7TQM+C/Af493g+SE
         uTKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FhotB3WmZS4RdLDhV3zhLMq1HMhtHjJJYY8Fard8AIs=;
        fh=qYqYejqAwDgGHcOAgQ88Bvam0hOt+wHsFBWae6KcaxY=;
        b=Xy6NG8Wq9poAGM3iKwdusPfOVTXQu4xQTjRA5aQnoy48MW+wlDSFiFsQERswcUKKG8
         +fKwSYrNH5yBpa+L6pbDealaBm7dy0AxNjOFxKDVZRNZ+ixEZaPJYOL/NvK11NEgGf6J
         1j5xluO42BpnfHxnbJW4BU4+nWs489lMbZzHlztBKnuYr/BNlgbuuR4XH893chtKL/Oi
         liyee27I6CH1UOFPdsY2cXQ402mt3qwepAwPed1N23vI2SlTCTUdJIFb8xLvD+IDPPd1
         wWrpmwD5dZ4v+yEIuHh8YQJToLbrVuO3UqAzl/ABGsMm7ULXvcgPyRezx0K6ZKbzNrUA
         vl0A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779022931; x=1779627731; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FhotB3WmZS4RdLDhV3zhLMq1HMhtHjJJYY8Fard8AIs=;
        b=pRk9ChUinLym+7ub9N2F2acdZ1YCUTYreLmWUxbJSGX/Kkn23Y7GXRLfWGMAJJ3/5s
         8/Bp5UBxVG5oe1idN1oCHixHRNAkxN5RXR69IfqwPcmt3XExqNx+Qs8EqNQdnBvAS5X/
         9yHM8QQ+oUrdv/ABkabrWggZHuB/f/2gdkctGN9faB9Mb32OS6icpbXQarFEwLolvspO
         xABEOOoU5uMzHnisPF0cLBWHJ8ArijN06Eu0AUvqEsJlAgtVRMjquh5rrT9EOUFwquvB
         //P1frsU9cdWjzeZJ35l3ACQ+flIY1CnWjh3ER8ly5a33qg3+vg5hJrrbz3unE/+BmAm
         eTig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779022931; x=1779627731;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FhotB3WmZS4RdLDhV3zhLMq1HMhtHjJJYY8Fard8AIs=;
        b=nJynwmq3V4N2ITM5lwiKRT3QwHGeVKKe7892ZeeG24XmFFv3SuBQ2cgEM2zu3eygDe
         6UWKhh4YaBtnPoTv7tt+fHAv4uMoRUNa4d7lQFxzXGCDoKU+1k1qtufLAOijWKYLBVrI
         05RIW10ms+GtAxFNuLzJG9lo31vZEIje/u1/kgg9RR9GooE3wwHBYrph/p7Gii07LIuN
         UvQ6ClJCrPJcP4YQuxTWd/jPT46IslGe4XBxiTc49xHFWI0PRrXxoAIj4FWHlRM0UnV2
         qj8VJOwMxA2zeHTjWnGRJmLU/ojHLUtEN4niSeCY1sr/DgAEOFoIZXypgvSYhKz+Kq9X
         XXxg==
X-Forwarded-Encrypted: i=1; AFNElJ+wVJeZQTT2f0rabYgZOAIBzwZZ/5HTJtDthrY3kQ0A0TZLBmSUnlMY274Tr2Be+Y5VyUnP9T//yPLW8tu74A==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz5N9S652kKziwfWTFRsf1E+IbaSxfLRRE8J/2zEe0C44umwYHi
	l55x0OzF8MAvfOqIR/7ayzLXqohGVq/w2uuTXTgKiBrLjNjOd0A6Lm6MFLdT0nAdiPBUvAb+K5t
	KXOvme6zMOtEpUMNCvaGyRKBJGubdMJE=
X-Gm-Gg: Acq92OHAzkMfoT1MO4B/ywo2k/dGKoXb8RgnGYOkUPFnvcpWNsWn6CAewNDr9RvpPlg
	k1hjsUDqSKd8iCz5+R5LCn2SwUvp50Flg3Nonp4sSAg6gLRoBihyiWwR6PRvTY6PLyf0VFmiEfM
	ZIHPDByXFKM8iHQfZoJ+WGQnqz/YZWYGAexPUDPlzzhVgBVzNyGNZxl2V44xvJJjM3zARLD2/+e
	vYBdJjeRPw5IuSvRaHfhCPjvdhkxjY2xGWXcRgvhVevFrjTCKsaXKSsB0A5RP+55qWCgqLLk72w
	5eK4QF1BPFFi7YGbbw==
X-Received: by 2002:a05:6512:b9d:b0:5a9:d3a4:a25c with SMTP id
 2adb3069b0e04-5aa0e7470d1mr2980752e87.37.1779022930147; Sun, 17 May 2026
 06:02:10 -0700 (PDT)
MIME-Version: 1.0
References: <CACjnFagN9zeSkwEv3-CSPJDUENPcEcOLjKyQoLQ91Yjn=rq5ww@mail.gmail.com>
 <20260506200918.D68321EA006C@mailuser.phl.internal> <CAGp9LzqkJ8QoOnBAiGu=uum3-LmCB3yHr91sw1HoLw+7ewNx6A@mail.gmail.com>
 <CAN6xzWdsYY0eni7aHG2Q=i2zz-rVxFRJJhCJbUsn=Pn_oDY-bQ@mail.gmail.com>
In-Reply-To: <CAN6xzWdsYY0eni7aHG2Q=i2zz-rVxFRJJhCJbUsn=Pn_oDY-bQ@mail.gmail.com>
From: John Henry <jshenry1963@gmail.com>
Date: Sun, 17 May 2026 09:01:59 -0400
X-Gm-Features: AVHnY4IMQ_YzMKlit-aEQHdc_R-PD7schhIkAMTGveoOUQVZ-GY9WU5-GFVhZ9s
Message-ID: <CAN6xzWcetGmoWtBA1Rm2vFaFGT8efeTw5LH1KPLZeGOtfGj2fQ@mail.gmail.com>
Subject: Re: [bug report] wifi: mt76: mt7925: iw set txpower fixed accepted
 but ignored
To: Sean Wang <sean.wang@kernel.org>
Cc: Javier Tia <floss@jetm.me>, Bradley Pizzimenti <brad.pizzimenti@gmail.com>, 
	linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, nbd@nbd.name, 
	lorenzo@kernel.org, ryder.lee@mediatek.com, shayne.chen@mediatek.com, 
	sean.wang@mediatek.com, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, Deren Wu <deren.wu@mediatek.com>, 
	Nick Morrow <morrownr@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260517_060213_408298_CD09E524 
X-CRM114-Status: GOOD (  55.02  )
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

Just a kind reminder of this issue, has anyone been able to reproduce
this monitor mode issue?
When scanning through channels, and the list of channels is > 4, there
is a large transmit tick/burst coming from the MT7921u and the MT7925.
This can easily be seen on an RF Spectrum Analyzer.
Confirmed on an Alfa AWUS036AXML consumer product and the Netgear
Nighthawk A9000.
This can be reproduced with simple scripts.

Reproduction with stock iw commands (no custom code):

IFACE=3D$(iw dev | awk '/Interface wl/ {print $2; exit}')
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

# This does NOT (only 4 frequencies):
while true; do
  for f in 2412 2422 2462 2484; do
    iw dev "$IFACE" set freq "$f" HT20
  done
done

Bursts are ~800 kHz wide at the base, -30 to -50 dBm OTA at close
range, brief (estimated few hundred microseconds), at channel
frequency. tx_stats counters remain zero throughout.
On Mon, May 11, 2026 at 1:58=E2=80=AFPM John Henry <jshenry1963@gmail.com> =
wrote:
>
> Bradley/Sean,
>
> Thank you all very much for the information.
> I tested this on mt7921u based Alfa AWUS unit and also an mt7925 based
> Netgear Nighthawk unit.
> I can confirm that the RF tick issue is present on both models when in
> Monitor Mode. I'm assuming it is in the base mt76?
>
> I attempted sudo iw dev wlxxx set txpower fixed nn where nn is the
> minimum value, next few values up, and then a few near the max values,
> and see no change in the signal strength of the RF Ticks when scanning
> through 5 or more channels.
>
> Please keep this in mind when attempting to resolve the known txpower
> 3dBm issue if possible, or please generate a new bug report for that
> specifically so that I can track when it is patched, or in ??? version
> so that I can test here locally.
>
> Incidentally, I'd appreciate it if anyone could please attempt to
> repeat using the scripts I had shown in the previous posts and confirm
> it is indeed seen by others.
>
> Thank you very much for your time and assistance
>
> John Henry
>
>
>
>
> From: Bradley Pizzimenti <brad.pizzimenti@gmail.com>
> To: linux-wireless@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org, nbd@nbd.name, lorenzo@kernel.org,
> ryder.lee@mediatek.com, shayne.chen@mediatek.com,
> sean.wang@mediatek.com
> Subject: [bug report] wifi: mt76: mt7925: iw set txpower fixed
> accepted but ignored
> Date: Mon, 4 May 2026 15:04:35 -0700 [thread overview]
> Message-ID: <CACjnFagN9zeSkwEv3-CSPJDUENPcEcOLjKyQoLQ91Yjn=3Drq5ww@mail.g=
mail.com>
> (raw)
>
> Hi there maintainers,
>
> `iw dev <iface> set txpower fixed N` returns success on mt7925 for any
> N tested, but the reported txpower never changes from a stuck value of
> 3.00 dBm. The kernel accepts and ignores the call silently in both
> directions (above and below the displayed value), and well below the
> regulatory ceiling.
>
> I'm aware there's prior art on the cosmetic 3.00 dBm display issue
> (Razvan Grigore's v2 series, Feb 2025; Ming Yen Hsieh's txpower init
> refactor, Sept 2025). What seems potentially distinct here is that the
> user-issued `iw set txpower fixed N` itself is silently no-op'd,
> separate from the reported-value question. Reporting as breadcrumbs
> in case the second observation is a separate bug rather than the same
> one.
>
> Hardware
> --------
> MEDIATEK MT7925 [Filogic 360], 802.11be 2x2, PCI 14c3:7925
> ASIC revision 0x79250000
> Driver in use: mt7925e (in-tree)
>
> Firmware (from dmesg at probe)
> ------------------------------
> mt7925e 0000:01:00.0: HW/SW Version: 0x8a108a10,
>                      Build Time: 20260106153007a
> mt7925e 0000:01:00.0: WM Firmware Version: ____000000,
>                      Build Time: 20260106153120
> Files: mediatek/mt7925/WIFI_MT7925_PATCH_MCU_1_1_hdr.bin
>        mediatek/mt7925/WIFI_RAM_CODE_MT7925_1_1.bin
>
> Kernel
> ------
> 6.18.18-1-MANJARO (close to vanilla 6.18 stable; not yet tested on
> wireless-next or nbd168/wireless HEAD -- happy to retest if needed,
> but flagging the data point in case it helps as-is).
>
> Tools: iw version 6.17
>
> Regulatory
> ----------
> $ iw reg get
> country US: DFS-FCC
>    ...
>    (5730 - 5850 @ 80), (N/A, 30), (N/A), AUTO-BW
>    ...
>
> Connection context: 5GHz channel 161 (5805 MHz), 80 MHz, VHT-MCS,
> NSS 1. So we are on a band with a 30 dBm regulatory cap.
>
> Observed
> --------
> $ iw dev wlp1s0 info | grep txpower
>         txpower 3.00 dBm
>
> $ sudo iw dev wlp1s0 set txpower fixed 100   # 1 dBm
> $ iw dev wlp1s0 info | grep txpower
>         txpower 3.00 dBm
>
> $ sudo iw dev wlp1s0 set txpower fixed 1500  # 15 dBm
> $ iw dev wlp1s0 info | grep txpower
>         txpower 3.00 dBm
>
> $ sudo iw dev wlp1s0 set txpower auto
> $ iw dev wlp1s0 info | grep txpower
>         txpower 3.00 dBm
>
> All four `set` invocations return exit code 0. The reported value
> never moves.
>
> Expected
> --------
> Either:
>   - The reported txpower follows the requested value (or, where
>     capped, the actual applied value with extack indicating the
>     cap reason), or
>   - The set call returns an error rather than silently ignoring the
>     request.
>
> Caveats
> -------
> - Not yet tested on wireless-next or nbd168/wireless HEAD. If a
>   reproduction on a current dev tree would be useful, I can do that.
> - I have not verified whether the actual radiated TX power changes
>   in response to `set txpower fixed`; I am reporting only the
>   user-visible behavior.
>
> Thanks,
> Bradley
>
> On Wed, May 6, 2026 at 8:12=E2=80=AFPM Sean Wang <sean.wang@kernel.org> w=
rote:
> >
> > Hi,
> >
> > The TX power reporting issue has already been investigated by Lucid
> > from the Linux WiFi USB community, and there is a proposed solution.
> > I think we can continue checking whether there are any remaining
> > issues on top of that work. Please refer to the patches here:
> > https://lists.infradead.org/pipermail/linux-mediatek/2026-April/105726.=
html
> > Thanks everyone for reporting and raising these concerns.
> >
> > On Wed, May 6, 2026 at 3:09=E2=80=AFPM Javier Tia <floss@jetm.me> wrote=
:
> > >
> > > On Sun May  4 22:04:48 2026 Bradley Pizzimenti wrote:
> > > > `iw dev <iface> set txpower fixed N` returns success on mt7925 for
> > > > any N tested, but the reported txpower never changes from a stuck
> > > > value of 3.00 dBm.
> > >
> > > Hi Bradley,
> > >
> > > The 3 dBm display bug is a known issue we have seen when using mt7927
> > > and a tested fix has been working well so far. The root cause is that
> > > mt7925_mcu_set_rate_txpower() programs the per-band SKU tables into
> > > firmware but never assigns phy->txpower_cur. mt76_get_txpower() then
> > > computes:
> > >
> > >   DIV_ROUND_UP(0 + 6, 2) =3D 3
> > >
> > > regardless of the actual power level. The RF output is unaffected;
> > > it is a display-only bug.
> > >
> > > The fix reads the effective TX power back from the rate power limits
> > > after programming the SKU tables and writes it to phy->txpower_cur,
> > > following the same pattern used by mt7996:
> > >
> > >   https://github.com/jetm/mediatek-mt7927-dkms/blob/master/mt7927-wif=
i-14-fix-reported-txpower-always-showing-3-db.patch
> > >
> > > This is part of a series we are targeting for wireless-next; not
> > > yet upstream.
> > >
> > > > What seems potentially distinct here is that the user-issued
> > > > `iw set txpower fixed N` itself is silently no-op'd, separate
> > > > from the reported-value question.
> > >
> > > Agreed those are two separate issues. Our patch addresses the
> > > display-only side: after applying it, iw will report the value the
> > > firmware is actually using based on the SKU tables, rather than
> > > always 3 dBm. Whether `set txpower fixed N` propagates to firmware
> > > to change actual output power is orthogonal and not addressed here.
> > >
> > > If you can test the patch on your MT7925 and confirm the displayed
> > > value reflects the correct power after association, a Tested-by
> > > would be appreciated.
> > >
> > > Best,
> > > Javier
> > >
> >

