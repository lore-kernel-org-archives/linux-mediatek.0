From: Markus Elfring <Markus.Elfring@web.de>
Subject: Re: [PATCH 3/5] mt76: fix a leaked reference by adding a missing
 of_node_put
Date: Fri, 5 Apr 2019 15:15:49 +0200
Message-ID: <799adbb0-23a6-bf20-f22d-4af68e9d0012@web.de>
References: <1550819742-32155-3-git-send-email-wen.yang99@zte.com.cn>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1550819742-32155-3-git-send-email-wen.yang99@zte.com.cn>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Wen Yang <wen.yang99@zte.com.cn>, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-wireless@vger.kernel.org, netdev@vger.kernel.org
Cc: UNGLinuxDriver@microchip.com, Alexandre Belloni <alexandre.belloni@bootlin.com>, Andrew Lunn <andrew@lunn.ch>, Anirudha Sarangi <anirudh@xilinx.com>, "David S. Miller" <davem@davemloft.net>, Florian Fainelli <f.fainelli@gmail.com>, Kalle Valo <kvalo@codeaurora.org>, Linus Walleij <linus.walleij@linaro.org>, Lorenzo Bianconi <lorenzo.bianconi83@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, Michal Simek <michal.simek@xilinx.com>, Felix Fietkau <nbd@nbd.name>, vivien.didelot@gmail.com, John Linn <John.Linn@xilinx.com>, Yi Wang <wang.yi59@zte.com.cn>, linux-kernel@vger.kernel.org
List-Id: linux-mediatek@lists.infradead.org

> @@ -54,22 +54,30 @@  mt76_get_of_eeprom(struct mt76_dev *dev, int len)
>  		part =3D np->name;
>
>  	mtd =3D get_mtd_device_nm(part);
=E2=80=A6
> +	if (retlen < len) {
> +		ret =3D -EINVAL;
> +		goto out_put_node;

I find a jump to an immediately following source code place unnecessary.
Would you like to delete it?


> +	}
>
> -	return 0;
> +out_put_node:
> +	of_node_put(np);
> +	return ret;
>  #else

Can another bit of fine-tuning matter here?
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/d=
rivers/net/wireless/mediatek/mt76/eeprom.c?id=3D34e022d8b780a03902d82fb399=
7ba7c7b1f40c81#n73

Regards,
Markus
