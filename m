Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25419C5AD55
	for <linux-mediatek@archiver.kernel.org>; Sun,  9 Aug 2026 20:33:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JKlBoJdds1FSyyPDGWKzuyJx/ZI/SpDQ5zKS7eJFwdA=; b=b/36ToNu3/Kd2rk2YCLg6ROyn6
	irf6b0FzZOQ2YKhZ2t8Xk+fidesUhbj53JGLSBM3kvZA/OFZanN9BRCRNXG6WV/5GvA41W8NagNP9
	dRaM15IT/CdqLnj7EhMM/t012Iu57+WM7+O8v9TkXTY+L8iX5HDtPfbF0OnnoTAkPTwkaXYQgHrwi
	c5eyZP3Zgqrnnp/z0rWKqC9Net+xt4LdBc3EUlxM/s0AwRJet6QFeV2MbZVlw/+mGMH7vsD0V1kyv
	Yop8/EDU0raGU7BwbZIIwnKSw2WTTbnuSyRRljnYrQtpszlmLxI+sE56c3JixPnmncvR7oLRffQtU
	0RgU1Veg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtAD2-0000000AhUw-3mFd;
	Sun, 09 Aug 2026 20:33:28 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtAD0-0000000AhU4-3YRH
	for linux-mediatek@lists.infradead.org;
	Sun, 09 Aug 2026 20:33:28 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4954aff6088so10688805e9.3
        for <linux-mediatek@lists.infradead.org>; Sun, 09 Aug 2026 13:33:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786307605; x=1786912405; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JKlBoJdds1FSyyPDGWKzuyJx/ZI/SpDQ5zKS7eJFwdA=;
        b=EaiTx6mDDnOUKEqbtfoZOoC4blAL2nZNEQLFZQrCESXtPMMRvlWoSy7ziXyi5OoT6g
         qeLpFAXzLdw7QBjL8hwoDODDjsJa3DI7mUb+ZycnWcmU5pjvf7zlrok52WtSq4QQCc/Y
         2pjggMHMfHMwhlhJhV83RN+/5fU4q0ldyIBfBvg3X71VFWlQ04RCkhcENgDtlCjrc/wb
         z0MO6I0SBkrd6geozcP70lNWh9miAbHomt8tqFt6XnZ3nDmHNhw6ZcQzdjGe/3a35BFO
         mAHNsgSaiZJT4l/6m61ja7dDvNf6xxIJl0T0DRl5vAsVJFwKRQxoB4Baccq9k3XJlsTz
         7hqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786307605; x=1786912405;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JKlBoJdds1FSyyPDGWKzuyJx/ZI/SpDQ5zKS7eJFwdA=;
        b=Ajj3d4c/HLWDtKWIV9HQOtRtl0IJWxd4ZTn5y9b4NJYMc4KrRTJjGNOwNJLoQ0GqZM
         B/F22Fp70X/8rjpsFN948JGXd5PFGyq+qqYpex/1VwvZXYQ0VsbKqttdi+D19P+U4W4L
         Awudj7mBqDEtf3C9igPn441BwcktnU5HcWDs4alcCO8DelWuELzS/xCvJ1z5BIKFiemF
         LOX5QxcW34vWremfNMegeYrb7G+tJ8QOuyFNcl3VBM9X0MX2z0f8bzVMlIfVkkiZ+1Au
         ukRgY5Z54/o9vqJj7nI9pqTxjySB66D5brbibxe63u2m59Wd0v7BbfoRaAKYFcebRe0g
         FeBg==
X-Forwarded-Encrypted: i=1; AHgh+RpKMDbfM3OBMCnrECQBYsUlhFbFxQodRzYaJ2RV4pVnmPJfLw2nYhKE1qpAs3LLFwhyXgevkVKjf2WxzrRwIQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzLjJ6YuIDr0tXyxd3DfMYXT+eQG/Z51lqbQ1kWFNRYkyBqpLS4
	/wSo6Fy7jtfN9MMUqUnocs8k7GRJXVoVEf+P81Op2DV5ID2tJUW7k+TY
X-Gm-Gg: AR+sD10y0RRcL1WGsz9MTbEVGDYnL4tpL11cyGLCbX88uX0Djn/CuJu+dpf11C3DNGl
	y0NDxB+y6jSC9/k3JwOoYT0PiTBMW1zU98ArLGTw4n9ETBxGxDHV5/+lm5Zhpb0FTlfmh1F6JuX
	/7EYJkjt8zhJtYv9uv9wVZXb2ZAtnfoYYGpA1hT1FvJA650mirE7QfdiLhiAjIzI0RFpV/Kuhu3
	GjIQFNle66LWBGPX/QvVrvUll6njI+1Mz5SOYJ9QDeBgRiqnDHLqlY6rDbaF/O12dAz/wHgV2JC
	M8OtgGzaWpA7RMav2OfiWYio/cQ79U7zFq9ViA+9ImeMKW+xC8u5rdN7HHdEygWXPwPUtfA6RMW
	lZjxTmgQPeDR13VYQlQ58ZwuxWVoaxEz5cX64Krt4MnATrC+Hy6Tnf1wViW6ydyIJZrnjICXfuE
	YXBlxzgTboqWRXfKE6xttMwl6k4qnZzfoTRAD0mYi8pW4GpjjhXGm330e4PhhMnjqSZyxQPQhgW
	0aH+obTexc=
X-Received: by 2002:a05:600c:8b35:b0:493:c634:952 with SMTP id 5b1f17b1804b1-4994e79e668mr477347155e9.7.1786307604765;
        Sun, 09 Aug 2026 13:33:24 -0700 (PDT)
Received: from foxbook (bgt135.neoplus.adsl.tpnet.pl. [83.28.83.135])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4995dee21dcsm231804045e9.0.2026.08.09.13.33.23
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Sun, 09 Aug 2026 13:33:24 -0700 (PDT)
Date: Sun, 9 Aug 2026 22:33:20 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: "Chris Lu (=?UTF-8?B?6Zm456ia5rOT?=)" <Chris.Lu@mediatek.com>
Cc: "luiz.dentz@gmail.com" <luiz.dentz@gmail.com>, "i@rong.moe"
 <i@rong.moe>, "Will-CY Lee (=?UTF-8?B?5p2O5pS/56mO?=)"
 <Will-CY.Lee@mediatek.com>, "marcel@holtmann.org" <marcel@holtmann.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, "SS
 Wu (=?UTF-8?B?5ber5oay5qyj?=)" <ss.wu@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-bluetooth@vger.kernel.org"
 <linux-bluetooth@vger.kernel.org>, "patchwork-bot+bluetooth@kernel.org"
 <patchwork-bot+bluetooth@kernel.org>, "linux-mediatek@lists.infradead.org"
 <linux-mediatek@lists.infradead.org>, "matthias.bgg@gmail.com"
 <matthias.bgg@gmail.com>
Subject: Re: [PATCH] Bluetooth: btmtk: Disable remote wakeup for
 MT7922/MT7925
Message-ID: <20260809223320.24431a4a.michal.pecio@gmail.com>
In-Reply-To: <99fb847b8fdedb1464798230407719912d6585c6.camel@mediatek.com>
References: <20260603-btmtk-remote-wakeup-v1-1-5c1006442f36@rong.moe>
	<178050901239.1520440.2026593395539384648.git-patchwork-notify@kernel.org>
	<3f9c376a5dbfc9d737e2a7f83c5db8e591fb8793.camel@mediatek.com>
	<17FE08E9-2229-4C97-846F-6FA099E22C90@rong.moe>
	<CABBYNZ+rR71SKUEuZBTf+E3SwRNzV2-s-zt8EwNJM3PSx9qB_A@mail.gmail.com>
	<fd8587e97a48e49332a4ad36e51e18739d000250.camel@mediatek.com>
	<4e96132bcfb267af05c06dc277b5ba6895e3ddde.camel@rong.moe>
	<99fb847b8fdedb1464798230407719912d6585c6.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260809_133326_920213_E7FE62EF 
X-CRM114-Status: GOOD (  11.77  )
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

On Mon, 29 Jun 2026 03:01:19 +0000, Chris Lu (=E9=99=B8=E7=A8=9A=E6=B3=93) =
wrote:
> Hi Rong,
>=20
> Thanks for your understanding. We hope to find a better way to handle
> this issue.
>=20
>=20
> Hi Luiz,
>=20
> Regarding this issue, MediaTek Bluetooth team has already initialed an
> internal investigation for problematic combination and will seek
> assistance from AMD SOC team to investigate the root cause of this
> issue.

Hi,

I have seen multiple reports on Arch Linux forum of MTK Bluetooth chips
sporadically locking up and no longer enumerating on AMD systems, also
desktops, which had to be unplugged from power to restore operation.

I have also seen claims that auto power management is broken in btusb:
https://lore.kernel.org/linux-bluetooth/cover.1774348119.git.berto@igalia.c=
om/T/#u

This, if true, offers a plausible theory because:
- URBs issued to suspended devices may fail, drivers may not notice,
  make wrong assumptions about their HW state and confuse the chip
- USB core doesn't reliably block submission of such URBs
- they were also seen to break some xHCI controllers, in theory this
  might be an HC problem - power cycling resets both device and HC

Regards,
Michal

