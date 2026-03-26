Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90FC0109E529
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Mar 2026 04:48:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pK8IitOhj+qJYRG0RQz1aH3TD26+Pq23VmPLgDzAB1g=; b=EjBzq5Kw2YUU3NgK24qGCkuShk
	m6jpQYZlSWz1KOjO/e79LqeAcXfEaiZLpCjpr10jx14uk/rrDLx4JYmMsAJn11SJF+CqD0XRN3PRp
	4+aoxAtdv1g0r0/qwLLJ1KGiN8TbtbMv9FMN802iCsfFnjmkhG0dbnVkkBz4ggCPk6xTGVlzMub8W
	4NRJGPll6pNKmsah+tyUCyvfN8PR9oHoBcAQPoFI19d2Hic2nUEnZXDqvAg5L4tkPW66AxYC7tC+B
	Pmf7BNA8uMq3NOJi1oEioRk02Ed83S2p296RLIeEtLR55N+QgGLMAIK8g3aVXmdcvWAGrN40BOpLF
	5nqust4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5cdv-00000004gvN-3EW6;
	Thu, 26 Mar 2026 04:48:27 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5cdu-00000004gvH-2Sf6
	for linux-mediatek@lists.infradead.org;
	Thu, 26 Mar 2026 04:48:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A41B360053
	for <linux-mediatek@lists.infradead.org>; Thu, 26 Mar 2026 04:48:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AE65C2BC87
	for <linux-mediatek@lists.infradead.org>; Thu, 26 Mar 2026 04:48:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774500505;
	bh=pK8IitOhj+qJYRG0RQz1aH3TD26+Pq23VmPLgDzAB1g=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=A8s9pbqj4y9Rc3OBhR3hAU67szsVAjaMru7+kpQ5U8oQeGlsjKG+jem5YBUTiXak1
	 FOeV9VjTnCHTFNbuu5F95RzEihJ/7zXGOeinIZEuPpu+qwINJVzDJ7aEWq6NGAPvGl
	 3DFstdd2OlW9hfcOl2yuPClPur51CEtko397EluLjyTIZpvUSnn6ijE3EHPPOmxbf/
	 Qzgjf/um+dUDXCogYmF69IiSjN7lrAYFf+sSjIuxWZPlBOXnAfrHKRX5Ulc0DkfyVQ
	 BjAw7jT/9UCzwgTHM9R8P4SjJnv4e7i3hB7+o3/Jj60W3rGFHoQ4lYmVQRn8mJaMnK
	 Q5Y51O2mi93FQ==
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-38a42a0d7f7so14566701fa.1
        for <linux-mediatek@lists.infradead.org>; Wed, 25 Mar 2026 21:48:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXAZpUZFKEv3+czTaNxNyXVBZzFXsiEOwYDOCesy5V75gA6Rtex/5gsso3NGAK+53NW5pY5SeIVK12/iRKiYg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzXeFSYtyDa9GHt/DfUul8eolISbIdOfZpOnWj9818b1y1U/mLk
	jpL95SyRom9mDAY6DUZ7aOpJquKzA+OtD8ItJmwuCKt/JNG4YSspuyWd9VmV+SEhuWqFNglFsu8
	+X4JqKk9E58gbpPt8mdLQySZdVQxDSJY=
X-Received: by 2002:a05:651c:3250:b0:38a:539b:f67 with SMTP id
 38308e7fff4ca-38c653a066fmr716601fa.14.1774500503745; Wed, 25 Mar 2026
 21:48:23 -0700 (PDT)
MIME-Version: 1.0
References: <20260326002348.4F98B1EA006B@mailuser.phl.internal>
In-Reply-To: <20260326002348.4F98B1EA006B@mailuser.phl.internal>
From: Sean Wang <sean.wang@kernel.org>
Date: Wed, 25 Mar 2026 23:48:14 -0500
X-Gmail-Original-Message-ID: <CAGp9LzpHUANcUVavpZi-jNhJRWuYdtJ0HvV2q0ACjR5JNkswZg@mail.gmail.com>
X-Gm-Features: AQROBzAJJTKkWQ4SvTldkO6SARCPPoUpJ15E3gt3p4fwVPZPpa31nGQitjyq8iY
Message-ID: <CAGp9LzpHUANcUVavpZi-jNhJRWuYdtJ0HvV2q0ACjR5JNkswZg@mail.gmail.com>
Subject: Re: [PATCH 1/2] Bluetooth: btmtk: Add MT6639 (MT7927) Bluetooth support
To: Javier Tia <floss@jetm.me>
Cc: linux-bluetooth@vger.kernel.org, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, 
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>
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

Hi, Javier

On Wed, Mar 25, 2026 at 7:23=E2=80=AFPM Javier Tia <floss@jetm.me> wrote:
>
> Hi Sean,
>
> On Fri, Mar 7, 2026 Sean Wang wrote:
> > BT and WiFi use separate firmware.
> > I'm not sure why those WiFi sections are included in the binary.
> > Another concern is whether it is appropriate to upload the firmware
> > used in Windows to the linux-firmware repository,
> > The firmware files are probably intended for dedicated OEMs.
>
> The section filtering remains in v2 since the binary from the ASUS
> driver package does contain mixed BT+WiFi sections. The firmware
> upload question is being tracked separately in linux-firmware
> MR !946.
>
> On that topic - would it be possible for MediaTek to provide a
> proper BT firmware binary for linux-firmware, or to sign off on
> the one extracted from the ASUS driver package? That would resolve
> the firmware provenance concern. If a formal submission from
> MediaTek is required, could you help coordinate that?
>

Yes, this has been under internal coordination for some time already.
I also hope we can have a Linux-dedicated firmware binary rather than
relying on one extracted from a Windows driver package, as that would
be a cleaner upstream path.
For now, the practical step is to make the driver-side handling robust
and consistent first, so it is ready once the proper firmware is
available.

> > This is common logic for the other mediatek chips. It only takes
> > longer on the first power-on.
>
> [...]
>
> > If the firmware download is properly handled in
> > btmtk_setup_firmware_79xx, we don't need the extra bit.
>
> Understood. The BTMTK_FIRMWARE_LOADED flag and skip logic are
> removed in v2. Firmware persistence is handled by the existing
> framework as you suggested.
>

Good, it looks better after removing BTMTK_FIRMWARE_LOADED flags

> v2 is sent with these changes addressed.
>
> Best,
> Javier

