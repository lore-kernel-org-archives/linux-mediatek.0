Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3944CCF9F0
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Oct 2025 08:21:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+RRQ3mnvpw4ptRfYD4hKfaf3ngNiZ/ZLRKANhoAh4Ck=; b=kQrR/iPLVO9jgSdyiECFgm2Ca+
	YMGyDP2MsFcp7LR71KYpj5xgyhKQLh4ZGEkPfUjp904iD99dGNVpxnCx9zGkh0Xs9bj6tQY2c6bBG
	rd0NmygBz9G1bJI7L5GH/HBxD2fV68C53Y9AAxjubvRxQo4y7c8nbB2SEjRgeTLSUxgc75iM4TP/5
	9WyE+5BS//y0jLzK1wYzkbQrESYtlklZc+yI0HbLeNHvweLmNIDnsnNA5w80zMz0bbw2EdqGZCxmR
	Y9qg3/m0XL4uDufLvDVzYN5L1HCoqr5N2LNHWtQ3yUMIwF8U9A712OXT9/NkueFQSR+lIGzPfDO/E
	cGo06uSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vENur-00000003gba-43qR;
	Thu, 30 Oct 2025 08:21:53 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vENun-00000003gYO-3FCi
	for linux-mediatek@lists.infradead.org;
	Thu, 30 Oct 2025 08:21:52 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-586883eb9fbso912474e87.1
        for <linux-mediatek@lists.infradead.org>; Thu, 30 Oct 2025 01:21:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1761812508; x=1762417308; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+RRQ3mnvpw4ptRfYD4hKfaf3ngNiZ/ZLRKANhoAh4Ck=;
        b=j0C54z0yN6E41IRVObCHh8LsNGXAxkuczNNjudn9qqtaukAsv7cHmxLcmR27czSNWA
         jdKUI90vssHcYPHZ3+0ovw60Vx9lEZZicBxAlDrKdJNNA0BLotCDxfNsKR4QXbmYd3NB
         QTFpvtKGxpgP2sjiVtOKCUQwr+nOnfosJ97HY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761812508; x=1762417308;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+RRQ3mnvpw4ptRfYD4hKfaf3ngNiZ/ZLRKANhoAh4Ck=;
        b=NejMQMMH8fcx/40Hf0Xxm/nciSlwSAsdkMSg9VzErXSbI/K6hQZbG7DPg1B6rs7X35
         avBnGSc+RITUMgkh7jH/VpXQ3k5RJCU/4ZTimm4/Wji0R7hr14dEu73b7MSdA7wmBBDB
         9m4OFCMo/VrVl6F3wx4Ygri41qigDrpn4tpYY9h3TZyvMl5XvoPEqVEicotLPaEiZAWu
         MR7gM/EgBeb6ocoElK+UMNiESl0JYPjzTt2ji43RKwDFbTzdNSj/+8aRQXt04VcfoRTb
         T1T62p0klrBU3J18LelGWAD+jmJAoiLkzCs/RyY1NNqfJvaM8NwJAX4y3bTWRU7vitUR
         5L6w==
X-Forwarded-Encrypted: i=1; AJvYcCVUckgnGNdb9lWiTznq7NFrRJU97AhmIWVKFjrSjn8TSlYfT2OqVEcAEqqIILJfzCqYtr+ElJtIJZecwZ0ukg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwA23YC+WT2sTCpT7nSqaFZES9YVCbNOmcxTTqfGepPBx/ox7mY
	TwdWmJMFK5q1ynaByoEaD7LemK7bzOtywwNcMnqyqjCQ4HnL03Z86Moxobc6MCcNYuBqgPpl2ug
	omwGtP2xcxJ8nwLjyhcxH4z9pVvmSVe/Z+fwONCQ5
X-Gm-Gg: ASbGncu6Aj/3WFZ5RMumUlC6Dpa1Vk/Hp02WCT5vs3hvBR7M9VYCHq0CGg9xEkuvZz5
	aNnJ/B4pu71EBFqk2ls5pNirC4nBTtHEhiEEHxWc55wvWpsNBjwhkaiP0nPJC1Gz84rNWxQpo/4
	n94t6r39Fs4bsT6iqXKCNSLLZNV4fjWCRuwgdmy/ayZlxo/KOsl3Z1qI3w4+WjFnOQzpjN1vKPL
	i3op3LOyLa33eTC2kei37GWitqcT5McFTQV+2E+LzgfD4DAzZRd0wOKsKnCUkLV9Th2BEa/twjQ
	T6lGXUORSWLdHhU=
X-Google-Smtp-Source: AGHT+IFU82eFD7KyMUajMtRnh3g0OAFBir+9otZR0HYwHlQYMDmXZxQQJ8cv/9zylVMsVzxv/6PO4ARJDSX3YbcKhTo=
X-Received: by 2002:a05:6512:ad6:b0:592:fe0f:d9e with SMTP id
 2adb3069b0e04-594128655a1mr1896419e87.7.1761812507765; Thu, 30 Oct 2025
 01:21:47 -0700 (PDT)
MIME-Version: 1.0
References: <20251015084103.10737-1-angelogioacchino.delregno@collabora.com>
 <CAGXv+5Gs5_j5L3+HT7K-XYwVG6S8ZGhHZkEcS0HpdkcjRQq2oQ@mail.gmail.com> <9f5a3dc5-d0f8-4172-a4b4-867919612a2d@collabora.com>
In-Reply-To: <9f5a3dc5-d0f8-4172-a4b4-867919612a2d@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 30 Oct 2025 16:21:35 +0800
X-Gm-Features: AWmQ_bmkpHdrIvgnJ7LYrPcYtpiVGscoJE_DrNSX0WTZVJCZr-WNnyLSiVAsWFM
Message-ID: <CAGXv+5Ge-uZHKATOvqQF25DRTcHFJkopUk-JUXDtpEen=BwCiA@mail.gmail.com>
Subject: Re: [PATCH v2] remoteproc: mtk_scp: Construct FW path if
 firmware-name not present
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: mathieu.poirier@linaro.org, linux-remoteproc@vger.kernel.org, 
	arnd@arndb.de, andersson@kernel.org, matthias.bgg@gmail.com, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_012149_823095_25BDB329 
X-CRM114-Status: GOOD (  34.40  )
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

On Wed, Oct 29, 2025 at 7:05=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 29/10/25 10:14, Chen-Yu Tsai ha scritto:
> > On Wed, Oct 15, 2025 at 4:41=E2=80=AFPM AngeloGioacchino Del Regno
> > <angelogioacchino.delregno@collabora.com> wrote:
> >>
> >> After a reply on the mailing lists [1] it emerged that the DT
> >> property "firmware-name" should not be relied on because of
> >> possible issues with firmware versions.
> >> For MediaTek SCP, there has never been any firmware version vs
> >> driver version desync issue but, regardless, the firmwares are
> >> always using the same name and they're always located in a path
> >> with a specific pattern.
> >>
> >> Instead of unconditionally always relying on the firmware-name
> >> devicetree property to get a path to the SCP FW file, drivers
> >> should construct a name based on what firmware it knows and
> >> what hardware it is running on.
> >>
> >> In order to do that, add a `scp_get_default_fw_path()` function
> >> that constructs the path and filename based on two of the infos
> >> that the driver can get:
> >>   1. The compatible string with the highest priority (so, the
> >>      first one at index 0); and
> >>   2. The type of SCP HW - single-core or multi-core.
> >>
> >> This means that the default firmware path is generated as:
> >>   - Single core SCP: mediatek/(soc_model)/scp.img
> >>     for example:     mediatek/mt8183/scp.img;
> >>
> >>   - Multi core SCP:  mediatek/(soc_model)/scp_c(core_number).img
> >>     for example:     mediatek/mt8188/scp_c0.img for Core 0, and
> >>                      mediatek/mt8188/scp_c1.img for Core 1.
> >
> > I know this patch has been applied, but this scheme doesn't actually
> > follow what is already in the linux-firmware repository.
> >
> > For all the supported platforms, the first core, even for multi core SC=
P,
> > already have their firmware uploaded as just "scp.img". Multicore SCP
> > is seen in MT8195 and MT8188.
>
> The only one that is affected is MT8188, which needs a rename or a symlin=
k in
> linux-firmware.
>
> MT8195 is not affected by this change, because the SCP is used as single-=
core,
> hence this code will look for scp.img and not for scp_c0.img.
>
> >
> > I guess I can send a followup patch?
>
> The only followup patch that I deem to be necessary is one adding a symli=
nk
> or renaming for MT8188's SCP and nothing else.

The firmware was uploaded in March of 2025, and is packaged in Debian
Trixie, and was also backported to Bookworm. Either adding a symlink or
renaming it won't trickle down to users for some time. So this seems
like a possible ABI break, where the ABI is the file name.

Or maybe you don't consider it as such because SCP hasn't been enabled
in the kernel in any release yet?

> Please remember that some of those SoCs (including MT8195) allow the SCP =
to be
> configured as *either* single-core *or* dual-core - and usually firmwares=
 for
> single-core configurations are not compatible with dual-core ones, becaus=
e of
> the SRAM carveout/usage.

For MT8188, whether the current blob is dual core compatible needs to be
checked. The blob upstreamed to linux-firmware was built locally by
MediaTek engineers and is not what we ship with ChromeOS devices.


ChenYu

