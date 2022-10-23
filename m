Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08087ECAAA1
	for <linux-mediatek@archiver.kernel.org>; Sun, 23 Oct 2022 19:22:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	References:In-Reply-To:Date:Content-Type:Subject:Cc:To:From:Message-ID:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r4YvaDhwEy5iYQJBIxEJxOJo3WiVpsAeeBn6dAp5NRs=; b=jwNTaRyDq7d6CjPqAtKrlGToEA
	vIVBWZTN/4MhSXJ04T/UD4YJtd/e7qJyDUzthiqrx+1EnyNI5Vhqlm8YsLKKLF0S7ByZxteYOXhRQ
	RyuccvZxOYpVe9HNXA4yb/wnACUtCjoE2EbTtgfJOBKsEjPOMcfjFL+8VEJRFCENsuEqZ90sY7KBw
	FGnIfqGchtklCXeQfYboFoQqItCWeHmSQbBlW+UPZUIVUYNHWWKVbg7k4kJw4XVMg6nq/vb9CBmD4
	ZqgUGP9yBuQV8Af2AlwLqBSwLQusBNxZj2s62qdo9aNXo3wHXKIlhfJjPW2LZSqoy3hjOkFoWU/Tt
	k1CPtkQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omgY7-00G53L-EC; Sun, 23 Oct 2022 19:22:19 +0000
Received: from mout.gmx.net ([212.227.17.21])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omgXw-00G51p-4Q; Sun, 23 Oct 2022 19:22:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
	s=badeba3b8450; t=1666552897;
	bh=2jJEvmHSP6qPd7XxMz1AxdJbkheHxQEUt+1NyVik1qw=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ZS24O87PTKbDXd1ulCGQiI3NI14Se4l1Qw/O+11MQrW3roytC3pjbDL4gHm/91Fzn
	 NdboUlmOuKjtcJf/ASI8F9HpIOSHmBOxo/1UEhEIeW32SS4a2iwcd6eBDQLlwuZFNd
	 mz3wQoL9sAapY57xGnlrhucG/dGSQ7epUXgh74+I=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [80.245.79.234] ([80.245.79.234]) by web-mail.gmx.net
 (3c-app-gmx-bs01.server.lan [172.19.170.50]) (via HTTP); Sun, 23 Oct 2022
 21:21:37 +0200
MIME-Version: 1.0
Message-ID: <trinity-169e3c3f-3a64-485c-9a43-b7cc595531a9-1666552897046@3c-app-gmx-bs01>
From: Frank Wunderlich <frank-w@public-files.de>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: "Russell King (Oracle)" <linux@armlinux.org.uk>, Frank Wunderlich
 <linux@fw-web.de>, linux-mediatek@lists.infradead.org, Alexander Couzens
 <lynxis@fe80.eu>, Felix Fietkau <nbd@nbd.name>, John Crispin
 <john@phrozen.org>, Sean Wang <sean.wang@mediatek.com>, Mark Lee
 <Mark-MC.Lee@mediatek.com>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo
 Abeni <pabeni@redhat.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Aw: Re: Re: [PATCH v2] net: mtk_sgmii: implement mtk_pcs_ops
Content-Type: text/plain; charset=UTF-8
Date: Sun, 23 Oct 2022 21:21:37 +0200
Importance: normal
Sensitivity: Normal
In-Reply-To: <trinity-ac9a840b-cb06-4710-827a-4c4423686074-1666551838763@3c-app-gmx-bs01>
References: <Y1Ozp2ASm2Y+if3Q@shell.armlinux.org.uk>
 <trinity-4470b00b-771b-466e-9f3a-a3df72758208-1666435920485@3c-app-gmx-bs49>
 <Y1Qi55IwJZulL1X/@shell.armlinux.org.uk>
 <trinity-164dc5a6-98ce-464c-a43d-b00b91ca69e5-1666461195968@3c-app-gmx-bs49>
 <Y1RCA+l2OHkrFfhB@shell.armlinux.org.uk>
 <trinity-ff9bb15b-b10c-46d6-8af2-09a03563c3c8-1666509999435@3c-app-gmx-bap20>
 <Y1UMrvk2A9aAcjo5@shell.armlinux.org.uk>
 <trinity-5350c2bc-473d-408f-a25a-16b34bbfcba7-1666537529990@3c-app-gmx-bs01>
 <Y1Vh5U96W2u/GCnx@shell.armlinux.org.uk>
 <trinity-1d4cc306-d1a4-4ccf-b853-d315553515ce-1666543305596@3c-app-gmx-bs01>
 <Y1V/asUompZKj0ct@shell.armlinux.org.uk>
 <trinity-ac9a840b-cb06-4710-827a-4c4423686074-1666551838763@3c-app-gmx-bs01>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:wnlv6cT7DXECeaYmAyNFfLMpT8nVTt9ODcAJNv437ha20MFzbjN+Dt/birFLYC0Qzrh3n
 eIEUhh4j9jBPcBOIJE0jXkXXVYYu3H+3uyUH8uxlcKcUgKIwW9XMGz25i+rtreTo3Z2b0E6CQTkN
 0yj0LrIXd3v9oBQeuEgYldLLF5+a5gtE6yhnzf1BVJgprHq+xaGWNX0WlFlVz1K+117tFjS9YYV7
 WcIwOpfQXOU3uaQcpgKhjRWNaykut341YA9UC1RqQmDV5kmz7Ud/oi1gTaJmJMRaEItmI9bvOtk9
 iM=
X-UI-Out-Filterresults: notjunk:1;V03:K0:X0wHvMwV6ZE=:mSau9Xq/zRtQppHOurG6uG
 wBdmXwWBK2aBzu5WwwAAVG/lcnTgDVH4D9LvXHrk1+FyuGWXDtLdWo6mrXrDzMwxf1NI+aZMy
 kEwaf/MemFIQnt6kDLbOSaRjBDb0qMiM2AFN0N7mQB3jCBFxbM/mI7W27Zpwq8wnyqp9/RmA6
 AyD6TKoHUXBldxXTGZ4qDYTtgyJMYE4GYpxO4SKXE/A+6NbGmJnPdBfVJrZofADBrKc8DL6rl
 mzO7XwO2wjBplyhu77gB4sVj5zrnOvWYgmC+RjO8syh64pSRsVzudpTgW5RvosQQe+gbyvsje
 CPtwz8rXRarHC9eetg9DlCv950ZEMj7phGtQ1pMcmCymt+InJahzKAzgpAXGNxxT/5XjAxUrg
 3EBsZ8jU5C89b6/7e00uIt3O1UtTBny8uTT06dKKB3pdPLgDIqNZFfnnP7paeOX44n33Yj6rc
 xMLvSlf7gu6qMCJdOgcBd31HOn/asy1d8Q+TfSbH07wY/Rz5jhRt6KQ45v9OIsOP/cMDxL7Nr
 DLI269zIESo1P29jpTUjj7na9lnaoqdorTWohIdSOKlvLJwFWDAtI1dFWegYxf1MJogTLsTel
 9zUqSTJLn8Tr2Spj+NAGl9rfysRQ8edCOzS7i222+fZpfKewMx8Gw7S/fHpP4BVaxKzsZgaXa
 +DmyuO0gOmAzBbWZOQcRl4GVkvyzwtvRND5tSdL91QgzlqCAv5EvAIgAEzg0ktcdxw87DkqP4
 VXd4I3E29sUc3bS3Ufk3U/P+GfvtTI9XiJDFk6O91e6YLW3XdRrs67lJ1n7i47s6C3EY7E7sB
 SBd012E0JFG0JLrZ7SRl4gJOcnEs95GbLot90MxDeQmypSm2DK/wstnX/IZzez5N1jmYDUXSv
 Q1rNYObyhi1895q1/n/KPRzMioz9BEKjsGM1epsQpgmjvcw8K+jYzXBTKN70M31LXPez6XYHD
 7u9Rak1ojLkuXu5u32gZK7olW0zLqLxkJP2/RnHO/bJSikPuCazgbgk1A2yN2k/6Ztx6qnh/N
 HW0Cf94UClhIEgVUp14iCWCx+ESGVZ+BCUUcHUlS8gd4bgYeLproxGvCMzfH9AA1TC7PSw8B9
 mVr4ObNX0FgKUvVmOXnSK1HpMUIijGMsU0ogfYhMjzGBi5WMjdz1gk7zKWB/qWdC2h4D79gd/
 onaPzYd7Ny00uc5oYTNZBLbf51yFDs3L8m8T+Oh7NlJ0pfdOTWWYqRKXKS4frJ9Tuu+HgydZu
 kS2ZSqrklyYruwYAnXrhSnbV6VDGn/l/SyjsdrVtzLuoJdUD0orXriYxswVWDFRbgbBOD82WX
 8+LcsKVw
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221023_122208_651759_AC332277 
X-CRM114-Status: GOOD (  11.07  )
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

> Gesendet: Sonntag, 23. Oktober 2022 um 21:03 Uhr
> Von: "Frank Wunderlich" <frank-w@public-files.de>

> if you fix this typo you can send the patch and add my tested-by:
>
>         regmap_read(mpcs->regmap, SGMSYS_SGMII_MODE, &val);
> -       if (interface =3D =3D=3D PHY_INTERFACE_MODE_SGMII)
> +       if (interface =3D=3D PHY_INTERFACE_MODE_SGMII)
>                 val |=3D SGMII_IF_MODE_BIT0;
>         else
>                 val &=3D ~SGMII_IF_MODE_BIT0;
>
> should i send an update for my patch including this:
>
> state->duplex =3D DUPLEX_FULL;
>
> or do you want to read the duplex from the advertisement like stated bef=
ore?
>
> regmap_read(mpcs->regmap, SGMSYS_PCS_CONTROL_1, &bm);
> regmap_read(mpcs->regmap, SGMSYS_PCS_CONTROL_1 + 8, &adv);
>
> phylink_mii_c22_pcs_decode_state(state, bm >> 16, adv >> 16);

with the phylink-helper it works too

https://github.com/frank-w/BPI-R2-4.14/commits/6.1-r3-sgmii2

regards Frank

