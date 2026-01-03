Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBEA2FC6160
	for <linux-mediatek@archiver.kernel.org>; Sat,  3 Jan 2026 06:46:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V2PWIKgEkV1NGawCgJIVEicUqPHORZKXPhjGLbO2U3A=; b=G8KwkGGwkP9vK7uQTQn5+uIkCS
	61C9qtURq0DAI2tfPDeT0MMB2pPJS4KNf0ao2PREXCyr8l919GrM77p4L1WjRuVTlJ+EstznaKw0Z
	nKPdObBPvpnBi+2nCNQ2Gq6qPSzhV6gZIYdVfdgnvB6/SVOsEXlrjH0AgmB+6nidDn+Bu/cSq4UGl
	QsGFHJZInUKHlZ84CvweCmCQJpcHhBKQpWYZ5jUv1qxmRrU6QF84k2WVhAwWKcjVG0NtOMNsnBd4l
	EytTt5N2HbeznBt2vODdjbHiZBQYsCe7fe8pV6am6rozaTeAfBlVOkOIMFaelQchgH3qoit5CgsWs
	kwHpASDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbvP1-000000092Pa-25gG;
	Sat, 03 Jan 2026 06:46:19 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbvP0-000000092PP-0du7
	for linux-mediatek@lists.infradead.org;
	Sat, 03 Jan 2026 06:46:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0E5346013D
	for <linux-mediatek@lists.infradead.org>; Sat,  3 Jan 2026 06:46:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BF66C113D0
	for <linux-mediatek@lists.infradead.org>; Sat,  3 Jan 2026 06:46:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767422776;
	bh=fKyT9YQ1JG7A9UW+J+VZvz2mXTizPcVyVmn/tQIYOU8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=qOf8rGopTKafTAiQyIcVzPreI6PDPhP9AdJjJsPaDgk/If6fYJGnJ+y9WoqWHUw1B
	 gZqSLoAlSWuSgwPaT6eyTJOz6fAgJFTlt8v5FpGRji+pabrm/2Neb6RRO+vm7VWt5W
	 kQhQXMEeyfH5djCqloRe+FPoRTeD33mIiAZzFv0slUEraMxNR2yBUZNGFgO9njI34E
	 tDc7FgUkwfTbi+BmQn00vqc7ie17G08pIyrpGlKz7VzaKzXiyyz5gdEx/7bSl438Rl
	 jPZst0mL7XEf9Xt/c3TN53yNbcbGdxn5uNmfOmFouU8gdypszzxkvkJzsnOSZwMT0n
	 paieNo0M93dDw==
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-59a10ef758aso10603703e87.2
        for <linux-mediatek@lists.infradead.org>; Fri, 02 Jan 2026 22:46:16 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX/dErRq+m9d1+b+lYdTMjUG388PKkkjwl58CcBiceNbd8VeUlJgQVtntnNX0ZuWzCDyF51nU/zyKTTw8cOtA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyaAhwuL60q8GezqdgDOIIqzLrc4T90gcYqqfMtxtpKv0OVN0Pk
	RsS3QKNf1rx1+bCPJEHRGZ1OTZWX2e665rGQptreDsgY2qTiLBaiSdf7L6328kdmuERru/hFGJ5
	6ZYF/QcYPbMUnlfgvdXokGyl0vMvF60A=
X-Google-Smtp-Source: AGHT+IHXZ7D+FgPyIoTbZMNwsQhnnk+pRJDN0D/PxGXyy/t7T8KOZL5gpJOs2sze55vkNZd5OgU6UTSr6tnOuKvr2Bo=
X-Received: by 2002:a05:6512:220e:b0:594:2f72:2f7b with SMTP id
 2adb3069b0e04-59a17d00274mr13419800e87.6.1767422774918; Fri, 02 Jan 2026
 22:46:14 -0800 (PST)
MIME-Version: 1.0
References: <20260101062543.186499-1-zbowling@gmail.com> <20260102200315.290015-1-zbowling@gmail.com>
 <20260102200315.290015-5-zbowling@gmail.com>
In-Reply-To: <20260102200315.290015-5-zbowling@gmail.com>
From: Sean Wang <sean.wang@kernel.org>
Date: Sat, 3 Jan 2026 00:46:03 -0600
X-Gmail-Original-Message-ID: <CAGp9LzrdvaPPLUi9TgenXvD6jWdOK-=95D_Fo2UYOppyzGPprw@mail.gmail.com>
X-Gm-Features: AQt7F2pIoQVOw-nvZQpZLafgk1Bl34hZ8-Lvcuuid17YYwHEJSDX5uwl3bFn_5g
Message-ID: <CAGp9LzrdvaPPLUi9TgenXvD6jWdOK-=95D_Fo2UYOppyzGPprw@mail.gmail.com>
Subject: Re: [PATCH] wifi: mt76: mt792x: fix firmware reload failure after
 previous load crash
To: Zac Bowling <zbowling@gmail.com>
Cc: deren.wu@mediatek.com, kvalo@kernel.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-wireless@vger.kernel.org, 
	lorenzo@kernel.org, nbd@nbd.name, ryder.lee@mediatek.com, 
	sean.wang@mediatek.com
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

On Fri, Jan 2, 2026 at 2:03=E2=80=AFPM Zac Bowling <zbowling@gmail.com> wro=
te:
>
> If the firmware loading process crashes or is interrupted after
> acquiring the patch semaphore but before releasing it, subsequent
> firmware load attempts will fail with 'Failed to get patch semaphore'
> because the semaphore is still held.
>
> This issue manifests as devices becoming unusable after suspend/resume
> failures or firmware crashes, requiring a full hardware reboot to
> recover. This has been widely reported on MT7921 and MT7925 devices.
>
> Apply the same fix that was applied to MT7915 in commit 79dd14f:
> 1. Release the patch semaphore before starting firmware load (in case
>    it was held by a previous failed attempt)
> 2. Restart MCU firmware to ensure clean state
> 3. Wait briefly for MCU to be ready
>
> This fix applies to both MT7921 and MT7925 drivers which share the
> mt792x_load_firmware() function.
>
> Fixes: 'Failed to get patch semaphore' errors after firmware crash
> Signed-off-by: Zac Bowling <zac@zacbowling.com>
> ---
>  mt792x_core.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>
> diff --git a/mt792x_core.c b/mt792x_core.c
> index cc488ee9..b82e4470 100644
> --- a/mt792x_core.c
> +++ b/mt792x_core.c
> @@ -927,6 +927,20 @@ int mt792x_load_firmware(struct mt792x_dev *dev)
>  {
>         int ret;
>
> +       /* Release semaphore if taken by previous failed load attempt.
> +        * This prevents "Failed to get patch semaphore" errors when
> +        * recovering from firmware crashes or suspend/resume failures.
> +        */
> +       ret =3D mt76_connac_mcu_patch_sem_ctrl(&dev->mt76, false);
> +       if (ret < 0)
> +               dev_dbg(dev->mt76.dev, "Semaphore release returned %d (ma=
y be expected)\n", ret);
> +
> +       /* Always restart MCU to ensure clean state before loading firmwa=
re */
> +       mt76_connac_mcu_restart(&dev->mt76);
> +
> +       /* Wait for MCU to be ready after restart */
> +       msleep(100);
> +

Hi Zac,

This is a good finding. Since this is a common mt792x code path, have you
also had a chance to test it on MT7921?

One small nit: the Fixes tag should reference the actual commit being
fixed, e.g.

  Fixes: <commit-sha> ("mt76: mt792x: ...")

instead of the error string.

                  Sean

>         ret =3D mt76_connac2_load_patch(&dev->mt76, mt792x_patch_name(dev=
));
>         if (ret)
>                 return ret;
> --
> 2.51.0
>
>
>

