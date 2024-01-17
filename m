Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E029C47258
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Jan 2024 14:09:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sV2Grr2tlb7X2G287qID2IrutYqvlrN3v6O4pI/jHLA=; b=djAjpbDTJgy3pI1pwYIGKxiSpa
	bNQRwuLyyrfZuLXiTeGGqQDA9qheHK4FjdMSwtShD850owwWJOsaB9ATk2usjsasADRHcAuXaYTAd
	fCbSh7eM33KrCeNmYdBqo6eI5rXMWG5YxPOBD0VOzJEjGSw8VcFzxQpM5V0gVARDKqgJA/7DboVvX
	UL9f5gaKznrPgST81i2e9D2cwNIMfjH4jKskglf17yZ9xGkwVwG19FQeQYS1qWpcX0bUI57ZCiOvu
	Ep+DzL4tjedcc82wYEg0gpw/ItqsJC5OA21G+H3vSKZ2p3TX9Podp/0Sh+KslfekeJar6n+zzlkhV
	jLuD786A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rQ6bM-00Gu79-2G;
	Wed, 17 Jan 2024 14:09:08 +0000
Received: from pidgin.makrotopia.org ([185.142.180.65])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rQ6bK-00Gu4q-0a;
	Wed, 17 Jan 2024 14:09:07 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_128_GCM_SHA256:128)
	 (Exim 4.96.2)
	(envelope-from <daniel@makrotopia.org>)
	id 1rQ6bH-0003kO-0n;
	Wed, 17 Jan 2024 14:09:04 +0000
Date: Wed, 17 Jan 2024 14:08:56 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: linux-mediatek@lists.infradead.org, Jean Thomas <jean.thomas@wifirst.fr>,
 sean.wang@kernel.org, linus.walleij@linaro.org, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/2] pinctrl: mediatek: mt7981: add additional emmc groups
User-Agent: K-9 Mail for Android
In-Reply-To: <20240117124234.3137050-2-jean.thomas@wifirst.fr>
References: <20240117124234.3137050-1-jean.thomas@wifirst.fr> <20240117124234.3137050-2-jean.thomas@wifirst.fr>
Message-ID: <B51A9EE5-1C7A-48C9-A546-61C269AD266F@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240117_060906_220692_6B5C3FC3 
X-CRM114-Status: UNSURE (   9.86  )
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



On 17 January 2024 12:42:34 UTC, Jean Thomas <jean=2Ethomas@wifirst=2Efr> =
wrote:
>Add new emmc groups in the pinctrl driver for the
>MediaTek MT7981 SoC:
>* emmc reset, with pin 15=2E
>* emmc 4-bit bus-width, with pins 16 to 19, and 24 to 25=2E
>* emmc 8-bit bus-width, with pins 16 to 25=2E
>
>The existing emmc_45 group is kept for legacy reasons, even
>if this is the union of emmc_reset and emmc_8 groups=2E
>
>Signed-off-by: Jean Thomas <jean=2Ethomas@wifirst=2Efr>

Reviewed-by: Daniel Golle <daniel@makrotopia=2Eorg>

>---
> drivers/pinctrl/mediatek/pinctrl-mt7981=2Ec | 17 ++++++++++++++++-
> 1 file changed, 16 insertions(+), 1 deletion(-)
>
>diff --git a/drivers/pinctrl/mediatek/pinctrl-mt7981=2Ec b/drivers/pinctr=
l/mediatek/pinctrl-mt7981=2Ec
>index ca667ed25a4d=2E=2Eef6123765885 100644
>--- a/drivers/pinctrl/mediatek/pinctrl-mt7981=2Ec
>+++ b/drivers/pinctrl/mediatek/pinctrl-mt7981=2Ec
>@@ -700,6 +700,15 @@ static int mt7981_drv_vbus_pins[] =3D { 14, };
> static int mt7981_drv_vbus_funcs[] =3D { 1, };
>=20
> /* EMMC */
>+static int mt7981_emmc_reset_pins[] =3D { 15, };
>+static int mt7981_emmc_reset_funcs[] =3D { 2, };
>+
>+static int mt7981_emmc_4_pins[] =3D { 16, 17, 18, 19, 24, 25, };
>+static int mt7981_emmc_4_funcs[] =3D { 2, 2, 2, 2, 2, 2, };
>+
>+static int mt7981_emmc_8_pins[] =3D { 16, 17, 18, 19, 20, 21, 22, 23, 24=
, 25, };
>+static int mt7981_emmc_8_funcs[] =3D { 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, };
>+
> static int mt7981_emmc_45_pins[] =3D { 15, 16, 17, 18, 19, 20, 21, 22, 2=
3, 24, 25, };
> static int mt7981_emmc_45_funcs[] =3D { 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2,=
 };
>=20
>@@ -854,6 +863,12 @@ static const struct group_desc mt7981_groups[] =3D {
> 	PINCTRL_PIN_GROUP("udi", mt7981_udi),
> 	/* @GPIO(14) DRV_VBUS(1) */
> 	PINCTRL_PIN_GROUP("drv_vbus", mt7981_drv_vbus),
>+	/* @GPIO(15): EMMC_RSTB(2) */
>+	PINCTRL_PIN_GROUP("emmc_reset", mt7981_emmc_reset),
>+	/* @GPIO(16,17,18,19,24,25): EMMC_DATx, EMMC_CLK, EMMC_CMD */
>+	PINCTRL_PIN_GROUP("emmc_4", mt7981_emmc_4),
>+	/* @GPIO(16,17,18,19,20,21,22,23,24,25): EMMC_DATx, EMMC_CLK, EMMC_CMD =
*/
>+	PINCTRL_PIN_GROUP("emmc_8", mt7981_emmc_8),
> 	/* @GPIO(15,25): EMMC(2) */
> 	PINCTRL_PIN_GROUP("emmc_45", mt7981_emmc_45),
> 	/* @GPIO(16,21): SNFI(3) */
>@@ -957,7 +972,7 @@ static const char *mt7981_i2c_groups[] =3D { "i2c0_0"=
, "i2c0_1", "u2_phy_i2c",
> static const char *mt7981_pcm_groups[] =3D { "pcm", };
> static const char *mt7981_udi_groups[] =3D { "udi", };
> static const char *mt7981_usb_groups[] =3D { "drv_vbus", };
>-static const char *mt7981_flash_groups[] =3D { "emmc_45", "snfi", };
>+static const char *mt7981_flash_groups[] =3D { "emmc_reset", "emmc_4", "=
emmc_8", "emmc_45", "snfi", };
> static const char *mt7981_ethernet_groups[] =3D { "smi_mdc_mdio", "gbe_e=
xt_mdc_mdio",
> 	"wf0_mode1", "wf0_mode3", "mt7531_int", };
> static const char *mt7981_ant_groups[] =3D { "ant_sel", };

