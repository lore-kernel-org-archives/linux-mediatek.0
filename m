Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 044EAC433FE
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Oct 2022 17:49:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	References:In-Reply-To:Date:Content-Type:Subject:Cc:To:From:Message-ID:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sdTIdZA7A1KXiUwp6aUKOq6Vlx+eBadgevHZSisZQqc=; b=IvyY4WK95CITobSknMPgSOjW3G
	AbAfYzRIexE0HlNxyw5NC4wx5buwNQnITzKocKdQCVoQTtn9QcE54VVrqGFz1dgi1aV8xSQelLj9E
	Ejmcpv+gRZtL5xmc9klVYPeltheZCW5AZer/pyaPCmU91/53cUVJKKEoDydyASirgPLUJ2JgkejEe
	GWctPUOQd+2xYVtHOwmJN4lcgWanxpnGaaQR8NhepgtHSpbWkNm+0md0y+wPJ/lTJQRDSYe1ZXnGV
	C1m7s97OXRd+MHw0OUDrHRvv/8OSgFKIq1hj+TJB7w2A/kyPMz1YWjNbHEHCbP/2o7FW75043T1QX
	/hH/zFYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olw8j-009ITX-Bf; Fri, 21 Oct 2022 17:49:01 +0000
Received: from mout.gmx.net ([212.227.17.20])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olw7v-009I4F-T7; Fri, 21 Oct 2022 17:48:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
	s=badeba3b8450; t=1666374467;
	bh=5QbrjKqljxqksy5puufmiF+jXfgBlAoOUGXFjbxtpbQ=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
	b=hBhbJF4jc8rovTo6jtdQzC4jf96E2Y2BZGDCj8OOv7uVvPAtWDWe+3+lPpVpqHrev
	 hY9tNEpZhA+/wv2jZa3PpEH8ZQJdqKYbhdWH0+HSxxEf75JFo5UvX6IwA2NDbo8QAI
	 GemWHbXMEq5LAqIIq8xXe6n/MtZ3Pq7ekSGRAHN8=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [217.61.146.132] ([217.61.146.132]) by web-mail.gmx.net
 (3c-app-gmx-bap55.server.lan [172.19.172.125]) (via HTTP); Fri, 21 Oct 2022
 19:47:47 +0200
MIME-Version: 1.0
Message-ID: <trinity-e60759de-3f0f-4b1e-bc0f-b33c4f8ac201-1666374467573@3c-app-gmx-bap55>
From: Frank Wunderlich <frank-w@public-files.de>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Frank Wunderlich <linux@fw-web.de>, linux-mediatek@lists.infradead.org,
 Alexander Couzens <lynxis@fe80.eu>, Felix Fietkau <nbd@nbd.name>, John
 Crispin <john@phrozen.org>, Sean Wang <sean.wang@mediatek.com>, Mark Lee
 <Mark-MC.Lee@mediatek.com>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo
 Abeni <pabeni@redhat.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Aw: Re: [PATCH v2] net: mtk_sgmii: implement mtk_pcs_ops
Content-Type: text/plain; charset=UTF-8
Date: Fri, 21 Oct 2022 19:47:47 +0200
Importance: normal
Sensitivity: Normal
In-Reply-To: <Y1JhEWU5Ac6kd2ne@shell.armlinux.org.uk>
References: <20221020144431.126124-1-linux@fw-web.de>
 <Y1F0pSrJnNlYzehq@shell.armlinux.org.uk>
 <02A54E45-2084-440A-A643-772C0CC9F988@public-files.de>
 <Y1JhEWU5Ac6kd2ne@shell.armlinux.org.uk>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:GDNCzu2w9Sb5SdqBgz4X6STf3+fSzJrSEUCB66OPIVCQTyPLjBmzWXa+MHHuTXv8u2sXQ
 wv0U9DyOfKYtSk5dkjolBQH+zi0xwerN7oZZ1mnTi1VgLvzFy6d5w3gGB1lefJlC0ngncQP9cR+f
 faqLtGrwoWJB/rtIX77qXr05Ge0JgMY88wOBBCzUJHWt+pOhMnQXP965uB27Tu61/CCNRb+tV2fb
 JQgslHLsGwhJZvKoEXtXLFRK3sVmSuTrXKhFXXWS4nYmJM8Uy0OKCikiIkBatnm8+kS2OrRRXYHW
 vo=
X-UI-Out-Filterresults: notjunk:1;V03:K0:TD+n0rJeT4w=:XljR1f4x6ydGS0+XhQ/B3s
 4iL/C3Ttc33hzqTmSeQBqBxxQygsToOCMuS6YO/U2W99Eek1iEGBKaaSRuITP/8Z2piCd2kLw
 h0FSeCTwNO9viA0yBcnj74cyEYEh/7Y/nIShtgHOGADsCYg3AzZmE5CBJ7vRtsaQYX4WtrdxH
 0t/VaEWSHVeSXHV+WiHwZNBJE4bgUOgXDZOX4u8fPxcNgtfcqYvuqNkCIto0u5hOukEtdX9Lq
 4Wm/op2idY2BjsDhNkIQoa5KGUX6gz4M+ZoyJ0Fmu0w4aEJAe4/LvH/VH5UDva4tIH5ugxHkB
 ixtyU/Sksric7WCLFoZHdsPU1Yt7NJJxcl+EtQdnOsd6e04XHwEytM9UfQi0OaeCvvXcmPsi5
 LB2t3QsdRpWyOfbXYhB9r8Zx4iRn3A6E3ktm0yDor2k8lek/gD34QW6BA/0/4ZEXz8GezbIYV
 gp6ZsHzuYBZK1AYou9WipXwKM2vTc9cktZ0cnA9hMXSdH+Q4imggKUhI2+aDKirSfjLJS35gY
 XRP09F4y7pOX/pXCYrRK/104+mP9ImyPYq/zhZGcPQTCFsFtZZFVq7KTVqcRVkeIko8hclYvu
 6MIDhe/CBAcWSVsa9b0DkhHtetX911dwD7hSgsU+YDXhEdfBrt2IfsH5TJLtPmcevZ7v95RPC
 +20bj4sOrn/uFeJzCK6seCPiNq56e7gOflBqi+WQP8IHmW4XcDDPg3MJRsQ3zRtmLhrGG5uIM
 TFVjedpHshrzrVZi9imF4GC0sd5HfaRSrJlPC0YRjqygTmt/IjKIJS66/D5POW9dplPCI32OG
 Kt5Dk+IQZZi4GN7n+LNVOxUVQU9iB8kLLiC5qbh8Q/TmHpBZYxO9TuSSEvlBSuPGkXATm0AdT
 OlRfs4IuzT3gCW5Gv5lcZEyuvT2483fACpBHgwBZeq2Cyi00asOoG2lhrFGG9k4G3g3VhB96X
 g77inuxSwS2Ti1wsbrm0CZ4OmQYYgH1WUoxu8emEAdRLKIbOMWAfKZ5naC2fl6pCd6bmYQQDP
 ttRxfHmFn6cVBmWjPtzibuf7AAaGej0eeZ0cUKrls8mkQ7jWkv/djJ15KPxfgg/BExN40725/
 MzOSoxkZIMtz+17lo7EeR0TB/fB3XuByH0n4bKl+8eDNTKnzC86u5qEwYDvdNY+ox0SaTfkD5
 T1k5UztsrsfmfJtPd6/2+/yBLlj7Z/kfY3HRQuRa2jMXbi4+xRSFJrJbnBvYbUDDJnr2vRlKq
 01u1v22a4Mylfincmx3D1WLW8XFsmFsmsGY69vdp8ff9YQuxmoctq93XehSN3dJIq2rLgFCO4
 JZHHdhaO
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221021_104812_435432_6F438E34 
X-CRM114-Status: GOOD (  15.29  )
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

> Gesendet: Freitag, 21. Oktober 2022 um 11:06 Uhr
> Von: "Russell King (Oracle)" <linux@armlinux.org.uk>
> An: "Frank Wunderlich" <frank-w@public-files.de>
> On Fri, Oct 21, 2022 at 08:04:51AM +0200, Frank Wunderlich wrote:
> > I have no register documentation to check if there is any way to read =
out pause/duplex setting. Maybe MTK can answer this or extend function lat=
er.
>
> I suspect we can probably guess.
>
> Looking at SGMSYS_PCS_CONTROL_1, this is actually the standard BMCR in
> the low 16 bits, and BMSR in the upper 16 bits, so:
>
> At address 4, I'd expect the PHYSID.
> At address 8, I'd expect the advertisement register in the low 16 bits
> and the link partner advertisement in the upper 16 bits.
>
> Can you try an experiment, and in mtk_sgmii_init() try accessing the
> regmap at address 0, 4, and 8 and print their contents please?

is this what you want to see?

 int mtk_sgmii_init(struct mtk_sgmii *ss, struct device_node *r, u32 ana_r=
gc3)
 {
        struct device_node *np;
+       unsigned int val;
        int i;

        for (i =3D 0; i < MTK_MAX_DEVS; i++) {
@@ -158,6 +159,12 @@ int mtk_sgmii_init(struct mtk_sgmii *ss, struct devic=
e_node *r, u32 ana_rgc3)
                if (IS_ERR(ss->pcs[i].regmap))
                        return PTR_ERR(ss->pcs[i].regmap);

+               regmap_read(ss->pcs[i].regmap, SGMSYS_PCS_CONTROL_1, &val)=
;
+               printk(KERN_ALERT "dev: %d offset:0 0x%x",i,val);
+               regmap_read(ss->pcs[i].regmap, SGMSYS_PCS_CONTROL_1+4, &va=
l);
+               printk(KERN_ALERT "dev: %d offset:4 0x%x",i,val);
+               regmap_read(ss->pcs[i].regmap, SGMSYS_PCS_CONTROL_1+8, &va=
l);
+               printk(KERN_ALERT "dev: %d offset:8 0x%x",i,val);
                ss->pcs[i].pcs.ops =3D &mtk_pcs_ops;
        }


[    1.083359] dev: 0 offset:0 0x840140
[    1.083376] dev: 0 offset:4 0x4d544950
[    1.086955] dev: 0 offset:8 0x1
[    1.090697] dev: 1 offset:0 0x81140
[    1.093866] dev: 1 offset:4 0x4d544950
[    1.097342] dev: 1 offset:8 0x1

> --
> RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
> FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
>

regards Frank

