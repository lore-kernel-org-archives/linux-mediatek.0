Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1099CE7D12
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Oct 2024 11:54:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BqHNgIjHzrZHI2dQBjjO379OemwM/JjQFwgZWw/lvBw=; b=ehK/6AtP8ZeBzfavV7mggue5Mj
	uKmVnhLOfJjYbU2VjZFagwD+mdCaszIl7Lonj3be0bJ1tEa6pPZ8yyjfZ/H/biCsOo52ThVfo8vxu
	9QCrXv88x0hw2rr4FiYd2Lk5+JpLJbiu3JLXCF4Sp/di6U2XK+BKJy4jOiKtAMP8LRjzMkIl+4GUk
	QG+WXOiznTMgT0a9gSy5OQKJuquY+IqkZJEjpm0N8Lz8g9TBDknAJbzkxH6u8Gvw6MU+83x8YfoOi
	TmG2L2+BGls8rApQ88/NnJnBzcn9Bf04tE5wfb2m7TDcTxYVEATJEtKMb8PHltQ82OCEd9vJrYXQs
	iQBW/upQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svbS4-00000002bLF-3h9i;
	Tue, 01 Oct 2024 11:54:00 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svbGz-00000002YkZ-2IzP
	for linux-mediatek@lists.infradead.org;
	Tue, 01 Oct 2024 11:42:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6CF8C5C4C62
	for <linux-mediatek@lists.infradead.org>; Tue,  1 Oct 2024 11:42:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B056C4CEC6
	for <linux-mediatek@lists.infradead.org>; Tue,  1 Oct 2024 11:42:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727782952;
	bh=ARtefMh24v7+jgn+p21E+waDQzHelUX4A47ryHja1Uw=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=YQMkQDxDugSAL16nBCD41yZkFQC+DivDisIstJIwOvPllMPCD8f9K8uyY5678NWQ3
	 GCL8CwmefvCOBhKsOE3i9Q7oCpA4FXlJgkyLS5Hg5+qv5j5vSBjr2MVWwxzF3gLvKg
	 H1joeushCLPIzNmcDXwuxA/OcrcSi5p+s7TFd96Q9Znu1x6I7AUtM9hgNXQfmjSWCv
	 9Qr7dGTKG8rWBw1JQG0TFQyYKXU5q/zHt5PB1zNlZtCwE6BQL63bd+3rCZqfyau6AZ
	 togxn9GdZujmROFT3Y18Lr+DhbJ1aEn9hUFGeTgoPjUlp2hd3WcldgTTGK6DDWZceZ
	 bAT164TI9BKsw==
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-68518bc1407so51180777b3.2
        for <linux-mediatek@lists.infradead.org>; Tue, 01 Oct 2024 04:42:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXOnwQN2EP4dXrgJCfnLeHARb173z7yp/oD2n6hywr9uzp873LY3/FAXFux+XiRLTi2dWNR5svPIrFfQzEDIA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwHqNcFP4S0FgJgYxBwc1GTMIX9b9qKh3xaNNoodLAknjest6+m
	QXzwjU9f2N/E8l8W5fd9JIlPcryToeCpIOXH85pG5xNX/WkoKigUgeCOdex8e8BNJxPAJ6yuhNA
	VM0P3JNL3i/Jikp1/wHd664GjQkw=
X-Google-Smtp-Source: AGHT+IGJeeAdGIP87cC95cStz9qeE3dupp7klnnAVTcjKHX6vpKBoLiUQEfoXRFEvhZrgtMMb6LXot438NCltsrGMdk=
X-Received: by 2002:a05:690c:60c7:b0:6dd:d407:4568 with SMTP id
 00721157ae682-6e24dc611f1mr87383497b3.26.1727782951444; Tue, 01 Oct 2024
 04:42:31 -0700 (PDT)
MIME-Version: 1.0
References: <20240926034802.28294-1-shayne.chen@mediatek.com>
In-Reply-To: <20240926034802.28294-1-shayne.chen@mediatek.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Tue, 1 Oct 2024 07:42:20 -0400
X-Gmail-Original-Message-ID: <CA+5PVA7EvtafLhceuZoXzb9n57of0q4gz5khgKA7JWjOWFzPCg@mail.gmail.com>
Message-ID: <CA+5PVA7EvtafLhceuZoXzb9n57of0q4gz5khgKA7JWjOWFzPCg@mail.gmail.com>
Subject: Re: [PULL,linux-firmware] mt76 firmware 20240926
To: Shayne Chen <shayne.chen@mediatek.com>
Cc: linux-firmware <linux-firmware@kernel.org>, Felix Fietkau <nbd@nbd.name>, 
	Evelyn Tsai <evelyn.tsai@mediatek.com>, linux-wireless <linux-wireless@vger.kernel.org>, 
	linux-mediatek <linux-mediatek@lists.infradead.org>, Daniel Golle <daniel@makrotopia.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241001_044233_839252_A2F92CA6 
X-CRM114-Status: GOOD (  18.74  )
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

On Wed, Sep 25, 2024 at 11:48=E2=80=AFPM Shayne Chen <shayne.chen@mediatek.=
com> wrote:
>
> Hi,
>
> Here's a pull request for adding WiFi firmware files for mt7996 and
> mt7992 chipset variants.
>
> Please let me know if there are any problems.
>
> Shayne
>
> The following changes since commit 8306534b8a7265bee2f4323b45fd2a22a7c8b9=
b6:
>
>   Merge branch '8922a' into 'main' (2024-09-23 12:36:21 +0000)
>
> are available in the Git repository at:
>
>   https://github.com/csyuanc/linux-firmware.git mt76-20240926

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/306

josh

>
> for you to fetch changes up to 85ce6f7afdd3b63398990e53f67c653fc66ad271:
>
>   mt76: mt7996: add firmware files for mt7992 chipset (2024-09-26 00:59:5=
4 +0800)
>
> ----------------------------------------------------------------
> Shayne Chen (2):
>       mt76: mt7996: add firmware files for mt7996 chipset variants
>       mt76: mt7996: add firmware files for mt7992 chipset
>
>  WHENCE                                       |  43 +++++++++++++++++++++=
+++++++++++++++++++++-
>  mediatek/mt7996/mt7992_dsp.bin               | Bin 0 -> 63536 bytes
>  mediatek/mt7996/mt7992_dsp_23.bin            | Bin 0 -> 63536 bytes
>  mediatek/mt7996/mt7992_eeprom.bin            | Bin 0 -> 7680 bytes
>  mediatek/mt7996/mt7992_eeprom_23.bin         | Bin 0 -> 7680 bytes
>  mediatek/mt7996/mt7992_eeprom_23_2i5i.bin    | Bin 0 -> 7680 bytes
>  mediatek/mt7996/mt7992_eeprom_2i5e.bin       | Bin 0 -> 7680 bytes
>  mediatek/mt7996/mt7992_eeprom_2i5i.bin       | Bin 0 -> 7680 bytes
>  mediatek/mt7996/mt7992_rom_patch.bin         | Bin 0 -> 20640 bytes
>  mediatek/mt7996/mt7992_rom_patch_23.bin      | Bin 0 -> 20640 bytes
>  mediatek/mt7996/mt7992_wa.bin                | Bin 0 -> 536240 bytes
>  mediatek/mt7996/mt7992_wa_23.bin             | Bin 0 -> 536240 bytes
>  mediatek/mt7996/mt7992_wm.bin                | Bin 0 -> 1712336 bytes
>  mediatek/mt7996/mt7992_wm_23.bin             | Bin 0 -> 1672256 bytes
>  mediatek/mt7996/mt7996_eeprom_233.bin        | Bin 0 -> 7680 bytes
>  mediatek/mt7996/mt7996_eeprom_233_2i5i6i.bin | Bin 0 -> 7680 bytes
>  mediatek/mt7996/mt7996_eeprom_2i5i6i.bin     | Bin 0 -> 7680 bytes
>  mediatek/mt7996/mt7996_rom_patch_233.bin     | Bin 0 -> 23968 bytes
>  mediatek/mt7996/mt7996_wa_233.bin            | Bin 0 -> 516272 bytes
>  mediatek/mt7996/mt7996_wm_233.bin            | Bin 0 -> 2620960 bytes
>  20 files changed, 42 insertions(+), 1 deletion(-)
>  create mode 100644 mediatek/mt7996/mt7992_dsp.bin
>  create mode 100644 mediatek/mt7996/mt7992_dsp_23.bin
>  create mode 100644 mediatek/mt7996/mt7992_eeprom.bin
>  create mode 100644 mediatek/mt7996/mt7992_eeprom_23.bin
>  create mode 100644 mediatek/mt7996/mt7992_eeprom_23_2i5i.bin
>  create mode 100644 mediatek/mt7996/mt7992_eeprom_2i5e.bin
>  create mode 100644 mediatek/mt7996/mt7992_eeprom_2i5i.bin
>  create mode 100644 mediatek/mt7996/mt7992_rom_patch.bin
>  create mode 100644 mediatek/mt7996/mt7992_rom_patch_23.bin
>  create mode 100644 mediatek/mt7996/mt7992_wa.bin
>  create mode 100644 mediatek/mt7996/mt7992_wa_23.bin
>  create mode 100644 mediatek/mt7996/mt7992_wm.bin
>  create mode 100644 mediatek/mt7996/mt7992_wm_23.bin
>  create mode 100644 mediatek/mt7996/mt7996_eeprom_233.bin
>  create mode 100644 mediatek/mt7996/mt7996_eeprom_233_2i5i6i.bin
>  create mode 100644 mediatek/mt7996/mt7996_eeprom_2i5i6i.bin
>  create mode 100644 mediatek/mt7996/mt7996_rom_patch_233.bin
>  create mode 100644 mediatek/mt7996/mt7996_wa_233.bin
>  create mode 100644 mediatek/mt7996/mt7996_wm_233.bin

