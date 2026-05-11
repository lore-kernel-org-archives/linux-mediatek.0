Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16D6DCD4840
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 May 2026 17:58:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SY9JiJtIYDNHwNHrC1dYRjhPzwG3k19YHr9rjoF6vFE=; b=T4iI11RQ/1TX5LPu1L4/my9+kP
	TxkTHOhu34SC0QcqWGEn2iVVjR0NS7EctNjxGeXUMHJ3sFb2XNE6heVhC4hEMzxZ6zIM2jU+OeaUt
	ce6rsqL1pALboWU4CmIuTM4ShWDmMKDL/rQh+c+0bexy7D9deatenTQ/kuBAlkgE4df/ZpVH0x0os
	bIkIixTB9os9/EASryCnRn3XKrV4mQmGp9fC0YIhRqewpgICMsfRsuryAHM/N1sFpZGxvPrn0AZiE
	p3FWHNg1/NQQQtjy6gUh2Xh//r6qQg7/KB1FkuGTEl1nZi+Q/G/f5iF9cKc8v8bBgtaRbp4bC0N8s
	AYyl2yYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMUtc-0000000EQvW-0sxv;
	Mon, 11 May 2026 17:58:24 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMUtY-0000000EQuh-3h2N
	for linux-mediatek@lists.infradead.org;
	Mon, 11 May 2026 17:58:22 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-5a40d02b58bso3453822e87.3
        for <linux-mediatek@lists.infradead.org>; Mon, 11 May 2026 10:58:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778522298; cv=none;
        d=google.com; s=arc-20240605;
        b=W46do49Iu0mlMIDmAUe/gkmGyFRcKuyP0JbxSdUKvs/IczzodpNAiNWU+XLw8307MU
         9a/zXMDrXQTYHAB6jKYeruI80Zr+z3WSZ1EJ+l3aFsOWoLLoSCHgrxujZloJ5JxxmM5X
         A2G/FvZg5pe2//k04Buhk5OeyEWrPobQwb0+f4AbYj8WnZ8aPAwpZKS0FrKSI1xd9hMO
         Sxo9+IsFLgrgHiUvROn0yFzbKfdwbpbzSh3RrXPpyEwZQue80AfcZial6RpRlquDnm4H
         eibabBqy7pv9M17N1MfAK5P58mDmmPG46c2xECAokkjr6Gw6pdIsoDAM3U1Vv+ImbviU
         ljVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SY9JiJtIYDNHwNHrC1dYRjhPzwG3k19YHr9rjoF6vFE=;
        fh=CW2Y9X6e8cFsNW+j40hC1LLfLXVBBB/m3AUaZ2yzv4A=;
        b=RkxK1OsGAqx/SXtG6xHR4FXdKWfG50XZ7bDQF0xZtmgKhptxCTplKCwtCNX+gG4Q4l
         +MPEe7AYqZIs1S8KJ7EFAdMss4xrGQeqK4H4FGr4n8fpDRKb6SH+m86tGWFkmEdmw7Qr
         c5/wnOGzjBH85K7BHheG7WSTDBeZRYtVxlO9souyiM8II1yeyeZRdwn8qKxo1E8R0nLA
         NTHLQtbrphdDv4TcRCZJ7PjmBWweMH4VVpezV+MNMFz2LpyGa75suywhHvhg7P98o/hk
         iKmjzqw61TOgTAHP9j53H5JTCXIZzAixzVLkyOfPmb+9wrNbrBfcRyXKV4Py0UfDLsZR
         5vdA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778522298; x=1779127098; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SY9JiJtIYDNHwNHrC1dYRjhPzwG3k19YHr9rjoF6vFE=;
        b=Co0XPkh3lAcbM2ElIx2Ajz1JZb92h0e+GAl/PHz6GT+qa8qmbokJ25Etdwv0BiJhXl
         hXfeFljRO1VOg7fQv7nicy1GD1Zk6fdvxL0CrBvcWBYQN/FX86VMOYaP0Ce1yBt/of4B
         t0MtRTUS1Bm/MHVumWLFgBbCGk/fcvavr9KU22ojE7pJI63SW5M5821ELgV8mDN/AwtF
         qH+6aEYwb0dG1fsR4NZNEdjZvXOZGRP4bnZwO+Wv9oKV3Q9lC/VjJoxNWiXZGkayCr3Z
         OmjetM14sBFfeIhxNTu2N8xMMKNgoU4RnO7uyPW932UcCMY8bKfpvzxrGJHsXTl7cTIL
         VtLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778522298; x=1779127098;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SY9JiJtIYDNHwNHrC1dYRjhPzwG3k19YHr9rjoF6vFE=;
        b=g3OCA6dkyxO/HNf1ClE4Kdm3mav8Sa+GnzsGVm02L+ngT+KDGXM560JEDd/s4B4Y8S
         NDHhYiqNsan2Y9OVXPY/l1JT226aKkZrMFFNwXGlKtzOYvmav8ztvRzxzYyRi+pHwral
         84zfyMlIYKLjfPFrqM35NQfhoXlwUDxlRQmu4V50B/2xiuGNBltVldDQxsM0dvc3AJgq
         j3H8F4WaS5P2mDpp/TL+WxXeRyp9/nuEMuVq/2GzEEGusKlDVhD0dHmZOfCpsBCr5Wbi
         ImCVvHv8eH5yw2sz8pXOoTxVYjlPImAXeEf1CCcyLLsWGy2ccbVOuh+swNf3FMuqoa9B
         lk3w==
X-Forwarded-Encrypted: i=1; AFNElJ+q8M1TCIYa2uYHavUgRFVlzeNpyOc9EkJkkIoVrTxrZQOl1S1ITqStPlswcaUl6L88FdVQuQbhvVQj1xoP2Q==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw2aTsAW/vhWr4Mv9/ILjeJOSPoJHKWPw4hXIDsgy77hInWFbkt
	SjXsBtvTr3Sa7vVbes+iOUvG56cq1KTymqq28FAR0z7WiFsVZsn7vy53XKICCDlGGDa94e7m/Xb
	siFrJ1fHih3mpd9V1AiAv/40baIfbEvU=
X-Gm-Gg: Acq92OEZYIwvHIkkcNbAqFAuussfSY7zJl0ubLaUjlsinmcDyt2lGXf/DambZdS9ZGB
	748sMpHXj33pE1e5RP+dHnzqY7DfeBQtdNd1MPyuPLTMlTDzfHiODHEsZcEGmfiDkeVWBy77EP/
	OhYO+RIcSYnozAze1JSkZux2kgKf+uJzTXjAFKE6+K30yMyDJW2yroJGsV275Sp61s6e7HwgVAV
	Slui+0bI/kYu/75VOJNALK2KEN7ikwfiJKYKw/NwMOpPWGBWZlxISoPtb5/uUAk4RUQzos4I0a/
	szSiEF4=
X-Received: by 2002:a05:6512:10cf:b0:5a8:9fd7:c248 with SMTP id
 2adb3069b0e04-5a89fd7c28cmr7353682e87.37.1778522297853; Mon, 11 May 2026
 10:58:17 -0700 (PDT)
MIME-Version: 1.0
References: <CACjnFagN9zeSkwEv3-CSPJDUENPcEcOLjKyQoLQ91Yjn=rq5ww@mail.gmail.com>
 <20260506200918.D68321EA006C@mailuser.phl.internal> <CAGp9LzqkJ8QoOnBAiGu=uum3-LmCB3yHr91sw1HoLw+7ewNx6A@mail.gmail.com>
In-Reply-To: <CAGp9LzqkJ8QoOnBAiGu=uum3-LmCB3yHr91sw1HoLw+7ewNx6A@mail.gmail.com>
From: John Henry <jshenry1963@gmail.com>
Date: Mon, 11 May 2026 13:58:05 -0400
X-Gm-Features: AVHnY4K5s9op3gblhN4NTbgI2jjORItyQKxqE8drbRi9J1gF2iMeHy5tqEB-kgA
Message-ID: <CAN6xzWdsYY0eni7aHG2Q=i2zz-rVxFRJJhCJbUsn=Pn_oDY-bQ@mail.gmail.com>
Subject: Re: [bug report] wifi: mt76: mt7925: iw set txpower fixed accepted
 but ignored
To: Sean Wang <sean.wang@kernel.org>
Cc: Javier Tia <floss@jetm.me>, Bradley Pizzimenti <brad.pizzimenti@gmail.com>, 
	linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, nbd@nbd.name, 
	lorenzo@kernel.org, ryder.lee@mediatek.com, shayne.chen@mediatek.com, 
	sean.wang@mediatek.com, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_105820_968846_B0673651 
X-CRM114-Status: GOOD (  41.36  )
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

Bradley/Sean,

Thank you all very much for the information.
I tested this on mt7921u based Alfa AWUS unit and also an mt7925 based
Netgear Nighthawk unit.
I can confirm that the RF tick issue is present on both models when in
Monitor Mode. I'm assuming it is in the base mt76?

I attempted sudo iw dev wlxxx set txpower fixed nn where nn is the
minimum value, next few values up, and then a few near the max values,
and see no change in the signal strength of the RF Ticks when scanning
through 5 or more channels.

Please keep this in mind when attempting to resolve the known txpower
3dBm issue if possible, or please generate a new bug report for that
specifically so that I can track when it is patched, or in ??? version
so that I can test here locally.

Incidentally, I'd appreciate it if anyone could please attempt to
repeat using the scripts I had shown in the previous posts and confirm
it is indeed seen by others.

Thank you very much for your time and assistance

John Henry




From: Bradley Pizzimenti <brad.pizzimenti@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, nbd@nbd.name, lorenzo@kernel.org,
ryder.lee@mediatek.com, shayne.chen@mediatek.com,
sean.wang@mediatek.com
Subject: [bug report] wifi: mt76: mt7925: iw set txpower fixed
accepted but ignored
Date: Mon, 4 May 2026 15:04:35 -0700 [thread overview]
Message-ID: <CACjnFagN9zeSkwEv3-CSPJDUENPcEcOLjKyQoLQ91Yjn=3Drq5ww@mail.gma=
il.com>
(raw)

Hi there maintainers,

`iw dev <iface> set txpower fixed N` returns success on mt7925 for any
N tested, but the reported txpower never changes from a stuck value of
3.00 dBm. The kernel accepts and ignores the call silently in both
directions (above and below the displayed value), and well below the
regulatory ceiling.

I'm aware there's prior art on the cosmetic 3.00 dBm display issue
(Razvan Grigore's v2 series, Feb 2025; Ming Yen Hsieh's txpower init
refactor, Sept 2025). What seems potentially distinct here is that the
user-issued `iw set txpower fixed N` itself is silently no-op'd,
separate from the reported-value question. Reporting as breadcrumbs
in case the second observation is a separate bug rather than the same
one.

Hardware
--------
MEDIATEK MT7925 [Filogic 360], 802.11be 2x2, PCI 14c3:7925
ASIC revision 0x79250000
Driver in use: mt7925e (in-tree)

Firmware (from dmesg at probe)
------------------------------
mt7925e 0000:01:00.0: HW/SW Version: 0x8a108a10,
                     Build Time: 20260106153007a
mt7925e 0000:01:00.0: WM Firmware Version: ____000000,
                     Build Time: 20260106153120
Files: mediatek/mt7925/WIFI_MT7925_PATCH_MCU_1_1_hdr.bin
       mediatek/mt7925/WIFI_RAM_CODE_MT7925_1_1.bin

Kernel
------
6.18.18-1-MANJARO (close to vanilla 6.18 stable; not yet tested on
wireless-next or nbd168/wireless HEAD -- happy to retest if needed,
but flagging the data point in case it helps as-is).

Tools: iw version 6.17

Regulatory
----------
$ iw reg get
country US: DFS-FCC
   ...
   (5730 - 5850 @ 80), (N/A, 30), (N/A), AUTO-BW
   ...

Connection context: 5GHz channel 161 (5805 MHz), 80 MHz, VHT-MCS,
NSS 1. So we are on a band with a 30 dBm regulatory cap.

Observed
--------
$ iw dev wlp1s0 info | grep txpower
        txpower 3.00 dBm

$ sudo iw dev wlp1s0 set txpower fixed 100   # 1 dBm
$ iw dev wlp1s0 info | grep txpower
        txpower 3.00 dBm

$ sudo iw dev wlp1s0 set txpower fixed 1500  # 15 dBm
$ iw dev wlp1s0 info | grep txpower
        txpower 3.00 dBm

$ sudo iw dev wlp1s0 set txpower auto
$ iw dev wlp1s0 info | grep txpower
        txpower 3.00 dBm

All four `set` invocations return exit code 0. The reported value
never moves.

Expected
--------
Either:
  - The reported txpower follows the requested value (or, where
    capped, the actual applied value with extack indicating the
    cap reason), or
  - The set call returns an error rather than silently ignoring the
    request.

Caveats
-------
- Not yet tested on wireless-next or nbd168/wireless HEAD. If a
  reproduction on a current dev tree would be useful, I can do that.
- I have not verified whether the actual radiated TX power changes
  in response to `set txpower fixed`; I am reporting only the
  user-visible behavior.

Thanks,
Bradley

On Wed, May 6, 2026 at 8:12=E2=80=AFPM Sean Wang <sean.wang@kernel.org> wro=
te:
>
> Hi,
>
> The TX power reporting issue has already been investigated by Lucid
> from the Linux WiFi USB community, and there is a proposed solution.
> I think we can continue checking whether there are any remaining
> issues on top of that work. Please refer to the patches here:
> https://lists.infradead.org/pipermail/linux-mediatek/2026-April/105726.ht=
ml
> Thanks everyone for reporting and raising these concerns.
>
> On Wed, May 6, 2026 at 3:09=E2=80=AFPM Javier Tia <floss@jetm.me> wrote:
> >
> > On Sun May  4 22:04:48 2026 Bradley Pizzimenti wrote:
> > > `iw dev <iface> set txpower fixed N` returns success on mt7925 for
> > > any N tested, but the reported txpower never changes from a stuck
> > > value of 3.00 dBm.
> >
> > Hi Bradley,
> >
> > The 3 dBm display bug is a known issue we have seen when using mt7927
> > and a tested fix has been working well so far. The root cause is that
> > mt7925_mcu_set_rate_txpower() programs the per-band SKU tables into
> > firmware but never assigns phy->txpower_cur. mt76_get_txpower() then
> > computes:
> >
> >   DIV_ROUND_UP(0 + 6, 2) =3D 3
> >
> > regardless of the actual power level. The RF output is unaffected;
> > it is a display-only bug.
> >
> > The fix reads the effective TX power back from the rate power limits
> > after programming the SKU tables and writes it to phy->txpower_cur,
> > following the same pattern used by mt7996:
> >
> >   https://github.com/jetm/mediatek-mt7927-dkms/blob/master/mt7927-wifi-=
14-fix-reported-txpower-always-showing-3-db.patch
> >
> > This is part of a series we are targeting for wireless-next; not
> > yet upstream.
> >
> > > What seems potentially distinct here is that the user-issued
> > > `iw set txpower fixed N` itself is silently no-op'd, separate
> > > from the reported-value question.
> >
> > Agreed those are two separate issues. Our patch addresses the
> > display-only side: after applying it, iw will report the value the
> > firmware is actually using based on the SKU tables, rather than
> > always 3 dBm. Whether `set txpower fixed N` propagates to firmware
> > to change actual output power is orthogonal and not addressed here.
> >
> > If you can test the patch on your MT7925 and confirm the displayed
> > value reflects the correct power after association, a Tested-by
> > would be appreciated.
> >
> > Best,
> > Javier
> >
>

