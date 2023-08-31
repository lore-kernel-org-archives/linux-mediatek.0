Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF797C83F10
	for <linux-mediatek@archiver.kernel.org>; Thu, 31 Aug 2023 13:34:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	References:In-Reply-To:Date:Content-Type:Subject:Cc:To:From:Message-ID:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KSB7lQCHaeF8Mz8+pf6byhF3khjV6D4NIjmrfxvK5Zo=; b=hUgXwswBpXXYKymAKQqyhNViDP
	GIB2zbi4a6qIQiory3L0JYF8KNO3H12S/8yucVeSqnzlFz3QBDLPXLi8BkZ8+h3i1HKbt5J7kinvT
	9Fo92ESoE1ONYqE2WCQ2tkQX/UUACJiAhFJxMP+VhyG3XBwuBDCxfQSApi2XBw8AerS2XULPpy8ed
	EOZPw9hHE6CIefXCEjpyyVfHxiXVVCa5BaIixw8qFoOqBXFn1KtRkzKIVeo+0Do7AfgLK37XqPJ0x
	Q8x9soVRVjXaqPe3MteSSLp7JwBpY/7Oz1NmiAWM4eMMR7M347MIMH+2cfUGnxt9D9PTyeumbiEWO
	GV0JbodA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qbhom-00FNKA-2P;
	Thu, 31 Aug 2023 13:34:40 +0000
Received: from mout.gmx.net ([212.227.15.18])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qbhoj-00FNJj-2A
	for linux-mediatek@lists.infradead.org;
	Thu, 31 Aug 2023 13:34:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=public-files.de;
 s=s31663417; t=1693488871; x=1694093671; i=frank-w@public-files.de;
 bh=HMDb6+RioAHke7j9RSJ/2v9RMCbqej1Z9hJqWh6sXGI=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=sCuHdZdmaz0Bww5gYVmD69aGrl+4ULyboz9dPO4xYrTcCzS+QQF5xeYF6MZuQR4a34MHtTL
 S2JnbfnO3zhy7DOiyA8/wNhhsZ6TUyft5ZMavlsQIQVCdWz3VdaLw8StuefIk95zLdQ41xHWL
 R2TeJB+LSJA8/ONtXht4U4pFeTGabSFh8Xu1bD3AYm52Z7F6FkdyPq26cKeSxpWY5xUQuIzG/
 +gP+Jft1Dv82nuWqUiLiO5qVQNdZeJ4vSrmJ1cVVykpBak2/opg9f6XZ2UJ/QqPpSJRYj6Drg
 9ZrjPavY79EqmLbhyTVryOhxplSDUJN22pP0N80rCWGA83MsUkTw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [217.61.156.102] ([217.61.156.102]) by web-mail.gmx.net
 (3c-app-gmx-bs12.server.lan [172.19.170.63]) (via HTTP); Thu, 31 Aug 2023
 15:34:31 +0200
MIME-Version: 1.0
Message-ID: <trinity-f3e7d8e0-2e93-4e84-a489-3993c819d2c3-1693488871086@3c-app-gmx-bs12>
From: Frank Wunderlich <frank-w@public-files.de>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: Markus Schneider-Pargmann <msp@baylibre.com>, Fabien Parent
 <fparent@baylibre.com>, Amjad Ouled-Ameur <aouledameur@baylibre.com>,
 Daniel Golle <daniel@makrotopia.org>, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, Alex Riabchenko <d3adme4t@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Daniel Lezcano
 <daniel.lezcano@linaro.org>
Subject: Aw: regression with 33140e668b10 thermal/drivers/mediatek: Control
 buffer enablement tweaks
Content-Type: text/plain; charset=UTF-8
Date: Thu, 31 Aug 2023 15:34:31 +0200
Importance: normal
Sensitivity: Normal
In-Reply-To: <trinity-6713557b-fe0a-4dae-84aa-1aa86f7619fa-1693473911557@3c-app-gmx-bs12>
References: <trinity-6713557b-fe0a-4dae-84aa-1aa86f7619fa-1693473911557@3c-app-gmx-bs12>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:eP/i3AepHzHiRNAom7jECnpS1u2vDlFap7n1KSAqYjWklDExb61WSqDcQnfMEfkOwfDiY
 sNo+uiX2QYb22S6mlM+hz6qOa9SpX7CP0Wefp4KREiNQ1rTrQHB66Tcnq+X+yNr8TM3o5Y7bZv4L
 CM46SD9g9Vx8b6BmAL1sYEVhBYdoZ/bD7EEmks/SCKsjzhz8dlhPTYlHjhcPdCmO6ft09BUXHY/s
 IyuMlSjICF1PAuE6D+GSOumLObj2arw7kWjTFXjDvmQIpJUGDmXAG3tFRumpGNpCdDu2tzeVY+fg
 lY=
UI-OutboundReport: notjunk:1;M01:P0:LkEhvTJkhsg=;P3MZdiEy8f/h0RrrKZCv/RiTxaP
 KmdipGDFp+WDtamBOX35oJAMlGxucryUTElChItGfSflRxao2X2WWzOD7Hs2yTyO124A9m03d
 T0IKGc/yGCUzqT80MRtCeCNYQkwQc1/0YVvWBUbBAZofH1L8K4zcIzSBAXzNA3e6QAtJPQG4z
 WYdhr3TUIbKlNnzB9RBuO45CLb1lSbVJ9NGhnqnHYJYP3SDC3lBJPAbtuSXSnZou6pyXgr4n3
 0xyj9KrP+L6DWWhNHUbeS3vY8o10l+AmfINgxFDIot0IfGr0m5KK93uIXulvGhAKrjqoj2eE0
 tZzte5RiR7kha+li2LwFR4FXQ3rIUOe444bwNBoEti+HKsQXxi7DrFDVXSxsOHwOWjKBdxfEe
 zbgtBbJc5LkX7nC9gPF77GLH0ZCaqsX7kn59OE6V//I9fROC/ilyTO9lb5FNB6g/NV0804p8q
 /v3ilhw5euma/XNGivkfOsEHiAnDVrqLyKUk9p3/wt4oWiLoP9dtCh60aZhLroPPXraTU6R7+
 3L2lq8umERA5GpkiAvEbCENKMTtv0w9/iVMXgDHiuKHPf7MozqFNsk8jKf8L82ni5vNe6MQ+Q
 71SXP4gZoikx1unw9U9GuowZMnNCy8fZDaFPQcPddCZPLQyP7DenSFVUq0LTpro5ALQjKxxzM
 3xGL4HO3fAlbVZhJcQb47cAXu7BT6BXiA6Re8tzZxXsrjhI8UrRrJ6QupeZJnLJ/N9Bk6qoj1
 rSkAULm5msu5RKPPnj6Qc6zIivGx6eHejgELdLe8Y7lMMEy6Ns99nLZhGguvELXHBo/RfzVGT
 53ztBt1GT4bEQycXbrQbFoig==
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230831_063437_990877_F5F1230B 
X-CRM114-Status: GOOD (  10.20  )
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

Hi,

looked a bit deeper into it and it looks like i only need to add the field=
s in the mtk_thermal_data struct

=2D-- a/drivers/thermal/mediatek/auxadc_thermal.c
+++ b/drivers/thermal/mediatek/auxadc_thermal.c
@@ -690,6 +690,9 @@ static const struct mtk_thermal_data mt7986_thermal_da=
ta =3D {
        .adcpnp =3D mt7986_adcpnp,
        .sensor_mux_values =3D mt7986_mux_values,
        .version =3D MTK_THERMAL_V3,
+       .apmixed_buffer_ctl_reg =3D APMIXED_SYS_TS_CON1,
+       .apmixed_buffer_ctl_mask =3D GENMASK(31, 6) | BIT(3),
+       .apmixed_buffer_ctl_set =3D BIT(0),
 };

in my quick test the temprature can be read again and i'm near room temper=
ature...i though it was a bit higher before, but as far as i understand th=
e code, the values were fixed before and only made it configurable.

if someone can confirm that i'm right, i can send official patch.

regards Frank


> Gesendet: Donnerstag, 31. August 2023 um 11:25 Uhr
> Von: "Frank Wunderlich" <frank-w@public-files.de>
> Hi,
>
> The commit 33140e668b10 "thermal/drivers/mediatek: Control buffer enable=
ment tweaks" is merged between 6.3 and 6.4 and causes a regression where t=
emperature cannot be read correctly at least for mt7986/Bpi-R3.
>
> bpi-r3 ~ # cat /sys/class/thermal/thermal_zone0/temp
> -274000
>
> after reverting the commit and fixing some build-errors in 6.5-rc7 becau=
se new members used in mt8365_thermal_data too, we can read temperature on=
 mt7986 again.
>
> i guess reverting the commit is not the right way, so i ask here for a b=
etter solution
>
> regards Frank

