Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A99CC47258
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Jan 2024 13:47:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SV8zvQg+IeuU1M/i86mIirQNLq+uWWo5TvM7QWvgQ9U=; b=FeNYFflZw4DtV3HjPhfOjPmPLe
	u5gCUXcMBf1cv4GkWr5OJDtOrXwkUn2VHTeVjNkJcEOMcUxK3iGgUVKdf6D3pcZPTGx3JbDFIpd+k
	9fz+r+6rYI4zIi4yC0OWUdiW2ypDcNHb90KzOXUuktmMixAzUxp1JyO0fuEbyWSdd5YCdPXuG/6mg
	Lht0lCb6fE6btcU5KdGsT8h7bMYaAqFECTrB4ozCHq9P9zBIMDcEDYZqrG5Ue03rq8YbzpoUkI89H
	ohY0oP8nidYn1YfrJZMzEkq7ruOqVEh2hWw1ZxRF2LXx+lvNbOfhZB3nm8PyCOmqYcfzQ/NkI8kDZ
	dvoubQ+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rQ6Gn-00GhCs-0Z;
	Wed, 17 Jan 2024 13:47:53 +0000
Received: from pidgin.makrotopia.org ([185.142.180.65])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rQ6Gi-00Gh6h-0e
	for linux-mediatek@lists.infradead.org;
	Wed, 17 Jan 2024 13:47:51 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_128_GCM_SHA256:128)
	 (Exim 4.96.2)
	(envelope-from <daniel@makrotopia.org>)
	id 1rQ6Gb-0003ey-0O
	for linux-mediatek@lists.infradead.org;
	Wed, 17 Jan 2024 13:47:42 +0000
Date: Wed, 17 Jan 2024 13:47:32 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 1/2] pinctrl: mediatek: mt7981: add additional uart group
User-Agent: K-9 Mail for Android
In-Reply-To: <20240117124234.3137050-1-jean.thomas@wifirst.fr>
References: <20240117124234.3137050-1-jean.thomas@wifirst.fr>
Message-ID: <8FECB2E8-CD37-434E-9F19-6CFE43C18364@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240117_054750_596007_2F6774C5 
X-CRM114-Status: UNSURE (   8.75  )
X-CRM114-Notice: Please train this message.
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



On 17 January 2024 12:42:33 UTC, Jean Thomas <jean=2Ethomas@wifirst=2Efr> =
wrote:
>Add uart1_3 (pins 26, 27) group to the pinctrl driver for the
>MediaTek MT7981 SoC=2E
>
>Signed-off-by: Jean Thomas <jean=2Ethomas@wifirst=2Efr>

Reviewed-by: Daniel Golle <daniel@makrotopia=2Eorg>

>---
> drivers/pinctrl/mediatek/pinctrl-mt7981=2Ec | 7 ++++++-
> 1 file changed, 6 insertions(+), 1 deletion(-)
>
>diff --git a/drivers/pinctrl/mediatek/pinctrl-mt7981=2Ec b/drivers/pinctr=
l/mediatek/pinctrl-mt7981=2Ec
>index 7e59a4407859=2E=2Eca667ed25a4d 100644
>--- a/drivers/pinctrl/mediatek/pinctrl-mt7981=2Ec
>+++ b/drivers/pinctrl/mediatek/pinctrl-mt7981=2Ec
>@@ -737,6 +737,9 @@ static int mt7981_uart1_1_funcs[] =3D { 2, 2, 2, 2, }=
;
> static int mt7981_uart1_2_pins[] =3D { 9, 10, };
> static int mt7981_uart1_2_funcs[] =3D { 2, 2, };
>=20
>+static int mt7981_uart1_3_pins[] =3D { 26, 27, };
>+static int mt7981_uart1_3_funcs[] =3D { 2, 2, };
>+
> /* UART2 */
> static int mt7981_uart2_1_pins[] =3D { 22, 23, 24, 25, };
> static int mt7981_uart2_1_funcs[] =3D { 3, 3, 3, 3, };
>@@ -871,6 +874,8 @@ static const struct group_desc mt7981_groups[] =3D {
> 	PINCTRL_PIN_GROUP("uart1_1", mt7981_uart1_1),
> 	/* @GPIO(9,10): UART1(2) */
> 	PINCTRL_PIN_GROUP("uart1_2", mt7981_uart1_2),
>+	/* @GPIO(26,27): UART1(2) */
>+	PINCTRL_PIN_GROUP("uart1_3", mt7981_uart1_3),
> 	/* @GPIO(22,25): UART1(3) */
> 	PINCTRL_PIN_GROUP("uart2_1", mt7981_uart2_1),
> 	/* @GPIO(22,24) PTA_EXT(4) */
>@@ -933,7 +938,7 @@ static const struct group_desc mt7981_groups[] =3D {
> static const char *mt7981_wa_aice_groups[] =3D { "wa_aice1", "wa_aice2",=
 "wm_aice1_1",
> 	"wa_aice3", "wm_aice1_2", };
> static const char *mt7981_uart_groups[] =3D { "net_wo0_uart_txd_0", "net=
_wo0_uart_txd_1",
>-	"net_wo0_uart_txd_2", "uart0", "uart1_0", "uart1_1", "uart1_2", "uart2_=
0",
>+	"net_wo0_uart_txd_2", "uart0", "uart1_0", "uart1_1", "uart1_2", "uart1_=
3", "uart2_0",
> 	"uart2_0_tx_rx", "uart2_1", "wm_uart_0", "wm_aurt_1", "wm_aurt_2", };
> static const char *mt7981_dfd_groups[] =3D { "dfd", "dfd_ntrst", };
> static const char *mt7981_wdt_groups[] =3D { "watchdog", "watchdog1", };

