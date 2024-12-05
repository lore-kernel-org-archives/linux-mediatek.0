Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD651E7716C
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Dec 2024 16:25:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ItHEVA7I8S1EP8oyTKl1F93KEEHRVDFUauUtw/1Acb0=; b=BNxa0A0sME5+9ZvfFVCMjzjpxl
	zO9urAwCkMwX0rk15F4cKUNyCmQLuNQfCIQB7+dfo9+xqJbt+Q9JTZuLoh9hGNsyuolsazbrZDYlr
	giSU/AsdYg1EGNp4k8rd97I1X7sXxxoEc+EDYu47YaDlctIgBW5n9A0y9ra1VqGSQPbncq3aga3sl
	VHZxOUibgEt6wAbDt2+bw9gO3WKqoVjrQTkpNiImVdXOjxCJJcNcLUph6Cjzrdk25fixOtmB9c2A/
	yKpCSuHApYwwogDC/XacDw59wiEam0Bj4FkJb4P+3U9u0rupPGnXf9/e6WaSsnj6lfAtJXiIvFwZ2
	PangOZpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJEfd-0000000GjvU-3EaO;
	Thu, 05 Dec 2024 16:25:41 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJEey-0000000GjmC-0odw
	for linux-mediatek@lists.infradead.org;
	Thu, 05 Dec 2024 16:25:01 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-53e203d77a9so1020581e87.0
        for <linux-mediatek@lists.infradead.org>; Thu, 05 Dec 2024 08:24:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1733415897; x=1734020697; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ItHEVA7I8S1EP8oyTKl1F93KEEHRVDFUauUtw/1Acb0=;
        b=GEnvpTdOBgmA5jjsyIajRe8V0rOoZPBaerMbSxGiRnJyu2Uqr6/I9MKu1I+x8ThHLd
         OKEQq23VpTofmH/M6ih/6ZlXUfxUc8WHa7OsIWr1RW9K0CNr/QKM5MqFDu65PQRuPe2C
         Gg3l3/ElTvROD+/3ich9WPCArznJdT7w6kc9oHUZEl0dTG/lVWSMPrTQ+7L5Iyh0foAH
         S2iGLpmksNags014hD0uzHWRkZBt8p34mVP0bzsKKODnGn2yMhu3WEMK798JjtZQgdE6
         XLyR9kKbLJCcTIPO9KvgG5UzIVE1i38ZuWWsioklAe+diJE8B6jy5NETD71VLIE1QSsR
         ScIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733415897; x=1734020697;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ItHEVA7I8S1EP8oyTKl1F93KEEHRVDFUauUtw/1Acb0=;
        b=FmSbr+i0Bku6P4Ezl7r2OLi0cEMWNUm8oR6XDhuNuMnWjtlmGbhLDQq72PiviN5ilC
         luoSqqCSq98CYTEUMKB19512wfHuyXqlOKWpxle1WRXIKuM0ES5MfsNJC8J1SubHs4gT
         KSxEXDvJaiAG1n84NfulfcJBvhNWWTUAZW7HFYPOu7u99cRRhY38kmJ9sYSfAWiNhsRw
         LnLQmQd3/+LPOHcMwzvoCMFWP6sj911FBph1Ey0OLtrOV2Q7aVYg49tEP2pK+dmpeZpk
         tPSnIJZYLRS6ZOvATM6eO+lrhT3cOctzhY8L4PU4XrECRXY6k0AbuvPLaVMTzBO8CWv2
         9lQg==
X-Forwarded-Encrypted: i=1; AJvYcCUpv7Hna6dtouW9rh5acxJuK/bL5cUeqIFBZuLQoqQmhBiN2eYC0ij4DsGH6oIHx8Bk8wzN3VRLVXBhwGVEYA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw8u6RDC6gHTi8Jfvjgxh+4ZhzNfswEadDcxPt1j/xu9j5oPgHD
	IJ2CruKILnm/PgUQhJr5+j0r4TzZv2HNFxo857Cj+UDtgJ3h4ykSJE1n4mZLk6I+A0SZwEIZIl8
	x71byrTiDTTd1TLo0oUbHgZNE5tMU6EZ00PNf9A==
X-Gm-Gg: ASbGncsF1/oLozc71/7sgjl1k4nMFU4hs6CwrseTV7LdF10PLzagURldv4jw0hc5fPV
	NUKkMCUiQKZL3O0kwbXETHbPg0kO19qv+rWyws8cfdHyKp0GA3hKLaSPSZCUApA==
X-Google-Smtp-Source: AGHT+IErYJU9bnmgh/S4XgU0jcrMWfkUEiJSX94XfyJ1xliCjLlWQwaDM6P30GxT6teJ6fjjXCYzQKweIZQ1ynm3Yi8=
X-Received: by 2002:a05:6512:4006:b0:53d:f6bc:23ec with SMTP id
 2adb3069b0e04-53e216f74ecmr1077273e87.5.1733415897149; Thu, 05 Dec 2024
 08:24:57 -0800 (PST)
MIME-Version: 1.0
References: <20241205-const_dfc_done-v3-0-1611f1486b5a@quicinc.com> <20241205-const_dfc_done-v3-8-1611f1486b5a@quicinc.com>
In-Reply-To: <20241205-const_dfc_done-v3-8-1611f1486b5a@quicinc.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 5 Dec 2024 17:24:46 +0100
Message-ID: <CAMRc=Mf--vRm15N2au-zvP89obcxRuk+3OOLqFtrjgg61_LotA@mail.gmail.com>
Subject: Re: [PATCH v3 08/11] gpio: sim: Remove gpio_sim_dev_match_fwnode()
To: Zijun Hu <zijun_hu@icloud.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, 
	=?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas@t-8ch.de>, 
	linux-kernel@vger.kernel.org, nvdimm@lists.linux.dev, 
	linux-sound@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-block@vger.kernel.org, linux-cxl@vger.kernel.org, 
	linux1394-devel@lists.sourceforge.net, arm-scmi@vger.kernel.org, 
	linux-efi@vger.kernel.org, linux-gpio@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
	linux-hwmon@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-pwm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
	linux-scsi@vger.kernel.org, open-iscsi@googlegroups.com, 
	linux-usb@vger.kernel.org, linux-serial@vger.kernel.org, 
	netdev@vger.kernel.org, Zijun Hu <quic_zijuhu@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_082500_505662_613E3971 
X-CRM114-Status: GOOD (  14.84  )
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

On Thu, Dec 5, 2024 at 1:15=E2=80=AFAM Zijun Hu <zijun_hu@icloud.com> wrote=
:
>
> From: Zijun Hu <quic_zijuhu@quicinc.com>
>
> gpio_sim_dev_match_fwnode() is a simple wrapper of device_match_fwnode()
> Remvoe the unnecessary wrapper.
>
> Signed-off-by: Zijun Hu <quic_zijuhu@quicinc.com>
> ---
>  drivers/gpio/gpio-sim.c | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)
>
> diff --git a/drivers/gpio/gpio-sim.c b/drivers/gpio/gpio-sim.c
> index 370b71513bdb529112e157fa22a5451e02502a17..b1f33cbaaaa78aca324f99c45=
a868e7e79a9d672 100644
> --- a/drivers/gpio/gpio-sim.c
> +++ b/drivers/gpio/gpio-sim.c
> @@ -413,11 +413,6 @@ static int gpio_sim_setup_sysfs(struct gpio_sim_chip=
 *chip)
>         return devm_add_action_or_reset(dev, gpio_sim_sysfs_remove, chip)=
;
>  }
>
> -static int gpio_sim_dev_match_fwnode(struct device *dev, const void *dat=
a)
> -{
> -       return device_match_fwnode(dev, data);
> -}
> -
>  static int gpio_sim_add_bank(struct fwnode_handle *swnode, struct device=
 *dev)
>  {
>         struct gpio_sim_chip *chip;
> @@ -503,7 +498,7 @@ static int gpio_sim_add_bank(struct fwnode_handle *sw=
node, struct device *dev)
>         if (ret)
>                 return ret;
>
> -       chip->dev =3D device_find_child(dev, swnode, gpio_sim_dev_match_f=
wnode);
> +       chip->dev =3D device_find_child(dev, swnode, device_match_fwnode)=
;
>         if (!chip->dev)
>                 return -ENODEV;
>
>
> --
> 2.34.1
>
>

Please use get_maintainers.pl to get the complete list of addresses to Cc.

Bartosz

