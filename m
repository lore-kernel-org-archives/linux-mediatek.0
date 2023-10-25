Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AE41C07545
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Oct 2023 13:10:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:References:In-Reply-To:Date:Content-Type:Subject:To
	:From:Message-ID:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IrvAV1obHso1O+ajYqrCb5vdUfaxx393rNDbhqEvVeA=; b=gCce6yOxMJC/H3
	zI+cFln3jCgB7Z4cKjH3S5tDQFIlF6XK5yNoI+JhSeGn2g+j6MZjF3ruP742K9tBpznVCp2XhWQpM
	fY41Y+WLwicqLeMn7FvwZAxhccGxkCua3iC9qltrcuIPl5CvZDHHobW3Bu6CMYZ9gv3FUX9khSZ95
	KuvLJcUclnfvxWxG9gjG7teY7/AIqygCJxziSxg751sX6UEvIjAN4Fjrfnq/ukIfrnkwQR4S6+Oig
	1v48kk3vvw/gpB18Xi3hiBCMOFRljrUDT3Vre/cOiWEMgzRyIfsM7KUncxC5bS4YUEQ5wOTj3Z73A
	wLdftcnROLmfaG1XBcnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvdeg-00CNUf-0M;
	Wed, 25 Oct 2023 13:10:38 +0000
Received: from mout.gmx.net ([212.227.15.18])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvdeZ-00CNTw-1v;
	Wed, 25 Oct 2023 13:10:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=public-files.de;
	s=s31663417; t=1698239426; x=1698844226; i=frank-w@public-files.de;
	bh=7jPZj6qMCgHOu6av6FIRfofY9VKc2ZV6MSDD2uvQnbs=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:
	 References;
	b=e2KRo06l685MDTT2IQ866oo13sQoPcQKg1FZDn+0sLUG1Ir8WbVybZpyqh6NAVc/
	 qHQekuYk0vyR4lmuAW7UrzYw3v8BfTqB8W3HG3wCW8YxiYbCThlUNVTp+D+m49f6H
	 GqOfMe0E6RUFLxKXSxiqu4seHtBHSddXqf3VWNeG6kFEPiBBO4lqQ287BPrsLSCoW
	 TW+5Pr6bFAG5u0kJtxjCqcWaSZ1G/2PiHEP33dm/F01Hy+7RO4OnfvIW2gMo1TrHH
	 p4aS5invnLjm2dlW0k69g8WJfytOfwlJ9QjDCn+keuzFz4v7UCw9eYu/03G+azAyY
	 p+d92eI3QQWt+tka+g==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [217.61.159.50] ([217.61.159.50]) by web-mail.gmx.net
 (3c-app-gmx-bs29.server.lan [172.19.170.81]) (via HTTP); Wed, 25 Oct 2023
 15:10:26 +0200
MIME-Version: 1.0
Message-ID: <trinity-90f622f9-7087-46fb-bdc8-f835f6953133-1698239425846@3c-app-gmx-bs29>
From: Frank Wunderlich <frank-w@public-files.de>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Aw: [RFC v1] arm64: dts: mediatek: add dtbs with applied overlays
 for bpi-r3
Content-Type: text/plain; charset=UTF-8
Date: Wed, 25 Oct 2023 15:10:26 +0200
Importance: normal
Sensitivity: Normal
In-Reply-To: <trinity-3fe161a2-70f1-4619-be28-199ea6201668-1696078629921@3c-app-gmx-bs36>
References: <20230916083214.7059-1-linux@fw-web.de>
 <trinity-3fe161a2-70f1-4619-be28-199ea6201668-1696078629921@3c-app-gmx-bs36>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:xBaV5gaQxcMH7sF3CwbQqcmcEOYpwqE2HKE6ZjVU3FZAoVImMFMjF0g6KxmeJOlU5mJOm
 WvWaESRS7SVw7/feimx5TLexZIAfMlzIiBc1YAjKxRnqw7vcoApcisc+7KS8k2vJDNSrV3TTwxSJ
 eM1ONTa84gFD0xI/zFlUWH7OA8IQ7GUmbmnnxhRd+pyuoDDVzCaw1bsGaavW2mw6r5On9MmPEVV0
 m1v4htPTZ/lZxuvLtYF3JR2TwD6HpP5bwbaPJGV3KwQjiOWgyRU4GUfz8PCUaMuaF/poIs6M6pWh
 vA=
UI-OutboundReport: notjunk:1;M01:P0:bRVUAUtmxag=;sy/FO8yvWMnVb45XOxGtb8pEu7z
 yTtrDC5R9wzMGtzA8EvwkC4cCIDzCKx9qSAesCRulHpygZqavJOSRSl42Kt3+g7KSLqqROMLS
 +E5bCOCPwjZX/4lMKaxP+AESzVroqADuPqDRobUT7fGbtexeTfp3CELUFXBX+Xp7zyhAvGFSm
 SpdLFTEcitZGzHlrwE/eHDNIb2uqtWmTRjav/e0kckQ/cqOfr2ue+crpfa0DpdNUeqZvfYVdG
 Vi0ihPzzoVfJGuXpmOMeHJaf22wYqwAlsJ0PcWd2rNdNVf0sJH0/Q7Ju7FWL+0/HFCX4OK08C
 8NrrNpDy/w2CgjTsBDcG5+gIdvrxGxPkXKn22GyvgdMqOX+dyBm1odRIRecWnOeVj9qNbWvBx
 d8KVdOmL17cUM61lloyrOYgoi5VYC9qOHFaVk6yyKIoxSgELxbhuqjwaRYiFK1NhzJesPjbOD
 X72DrJiiOMxraH6KSqyq/QpsRBuA2vbg9dOacVYyHy7QZGJNi+MMExMoYwfMmmxEK2Le18MAt
 duGFBI7XN0ylDDMSWYtP25A7j+yBpLZXuSRDzdUK+4WbrdH3JCWudAy7xbz0+ZKlOCmBxDBvN
 2reGIxXpCZEk1W9wgJmNmYpqDo+wxcspXiuPn4Uv/syeUaps/w982Pu2bUlWn8l70dNBmRMvc
 mMi8GgNYwZHN4LIIIpxh2v0LKJ6F/6TnyMBHvv+JKqnXd9tWndoifGDzZGmvDJcJ8aFsC0MPL
 P2WmA7id/lyYfRsR+QLNsfsRu+U+bEM+sa0fyCGfF4aO7WVDmT7XLBO8muAcW0tbIvy6Nq1vV
 dVYc7UAjDTOYv6plGeOQ3+2Q==
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231025_061032_259063_D23F9B92 
X-CRM114-Status: GOOD (  17.62  )
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
Cc: Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, Frank Wunderlich <linux@fw-web.de>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi

thinked a bit again on this Patch as i try to summarize sent patches
in 1 series to make it easier for maintainer to pick up.

> > Gesendet: Samstag, 16. September 2023 um 10:32 Uhr
> > Von: "Frank Wunderlich" <linux@fw-web.de>
> > An: linux-mediatek@lists.infradead.org
> > Cc: "Frank Wunderlich" <frank-w@public-files.de>, "Matthias Brugger" <=
matthias.bgg@gmail.com>, "AngeloGioacchino Del Regno" <angelogioacchino.de=
lregno@collabora.com>, "Rob Herring" <robh+dt@kernel.org>, "Krzysztof Kozl=
owski" <krzysztof.kozlowski+dt@linaro.org>, "Conor Dooley" <conor+dt@kerne=
l.org>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
> > Betreff: [RFC v1] arm64: dts: mediatek: add dtbs with applied overlays=
 for bpi-r3
> >
> > From: Frank Wunderlich <frank-w@public-files.de>
> >
> > Build devicetree binaries for testing overlays and providing users
> > full dtb without using overlays.
> >
> > Suggested-by: Rob Herring <robh+dt@kernel.org>
> > Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> > ---
> > based on discussion here:
> > https://lore.kernel.org/all/CAL_JsqK_3xxD0DFwipXO85P=3Dq=3DEYjUdjE1_8g=
1MKtvw3vVzx5A@mail.gmail.com/
> > https://lore.kernel.org/all/CAL_JsqJSi=3DkJSix=3Df3787ULZnaCy_Y26Phdhy=
5y9fat_vkDuUw@mail.gmail.com/
> > ---
> >  arch/arm64/boot/dts/mediatek/Makefile | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/mediatek/Makefile b/arch/arm64/boot/d=
ts/mediatek/Makefile
> > index c99c3372a4b5..18be027bf6b4 100644
> > --- a/arch/arm64/boot/dts/mediatek/Makefile
> > +++ b/arch/arm64/boot/dts/mediatek/Makefile
> > @@ -13,6 +13,14 @@ dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt7986a-bananapi-b=
pi-r3-emmc.dtbo
> >  dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt7986a-bananapi-bpi-r3-nand.dtbo
> >  dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt7986a-bananapi-bpi-r3-nor.dtbo
> >  dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt7986a-bananapi-bpi-r3-sd.dtbo
> > +mt7986a-bananapi-bpi-r3-emmc-nand-dtbs :=3D mt7986a-bananapi-bpi-r3.d=
tb mt7986a-bananapi-bpi-r3-emmc.dtbo mt7986a-bananapi-bpi-r3-nand.dtbo
> > +dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt7986a-bananapi-bpi-r3-emmc-nand.dt=
b
> > +mt7986a-bananapi-bpi-r3-emmc-nor-dtbs :=3D mt7986a-bananapi-bpi-r3.dt=
b mt7986a-bananapi-bpi-r3-emmc.dtbo mt7986a-bananapi-bpi-r3-nor.dtbo
> > +dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt7986a-bananapi-bpi-r3-emmc-nor.dtb
> > +mt7986a-bananapi-bpi-r3-sd-nand-dtbs :=3D mt7986a-bananapi-bpi-r3.dtb=
 mt7986a-bananapi-bpi-r3-sd.dtbo mt7986a-bananapi-bpi-r3-nand.dtbo
> > +dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt7986a-bananapi-bpi-r3-sd-nand.dtb
> > +mt7986a-bananapi-bpi-r3-sd-nor-dtbs :=3D mt7986a-bananapi-bpi-r3.dtb =
mt7986a-bananapi-bpi-r3-sd.dtbo mt7986a-bananapi-bpi-r3-nor.dtbo

maybe this is nicer?

mt7986a-bananapi-bpi-r3-emmc-nand-dtbs :=3D mt7986a-bananapi-bpi-r3.dtb \
					  mt7986a-bananapi-bpi-r3-emmc.dtbo \
					  mt7986a-bananapi-bpi-r3-nand.dtbo
dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt7986a-bananapi-bpi-r3-emmc-nand.dtb
mt7986a-bananapi-bpi-r3-emmc-nor-dtbs :=3D mt7986a-bananapi-bpi-r3.dtb \
					 mt7986a-bananapi-bpi-r3-emmc.dtbo \
					 mt7986a-bananapi-bpi-r3-nor.dtbo
dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt7986a-bananapi-bpi-r3-emmc-nor.dtb
mt7986a-bananapi-bpi-r3-sd-nand-dtbs :=3D mt7986a-bananapi-bpi-r3.dtb \
					mt7986a-bananapi-bpi-r3-sd.dtbo \
					mt7986a-bananapi-bpi-r3-nand.dtbo
dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt7986a-bananapi-bpi-r3-sd-nand.dtb
mt7986a-bananapi-bpi-r3-sd-nor-dtbs :=3D mt7986a-bananapi-bpi-r3.dtb \
				       mt7986a-bananapi-bpi-r3-sd.dtbo \
				       mt7986a-bananapi-bpi-r3-nor.dtbo
dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt7986a-bananapi-bpi-r3-sd-nor.dtb

here i tried to align the text on first name, but this results in visible =
stairs.
maybe only 1 tab to indent here (or anything else)? what do you think? In =
the end
better readable as 1 long line.

the SATA-Patch [1] will then add a line to each of the 4 blocks here (+5 l=
ines in total except changes by adding the backslash).

> > +dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt7986a-bananapi-bpi-r3-sd-nor.dtb
> >  dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt7986a-rfb.dtb
> >  dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt7986b-rfb.dtb
> >  dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt8167-pumpkin.dtb
> > --
> > 2.34.1
> >

regards Frank

[1] https://patchwork.kernel.org/project/linux-mediatek/patch/202309010727=
30.13571-1-linux@fw-web.de/

