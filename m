Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A31FC38A2D
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Oct 2022 14:55:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	References:In-Reply-To:Date:Content-Type:Subject:Cc:To:From:Message-ID:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SfMDNEl+KilgsRbIeSS/u5SZRuMIDzHpn3g5m6HeGsw=; b=C4AG/fZc26VN9Sfjx7vIER7Or7
	gkfQuJJ2ExMa5ZVULykljf0CL+VCsgHlqi5RuYj+LIHgLyAzc4MIf9Yh4kYAQk73k9d5BT5Jp6Xnz
	VsZKE8uv7eOXo3EBUo8fd717uXagvJe1nPAF+IfYYmHOD06s7BXFxKwGkoKNYC8QrkuvHir5eb+1r
	pGP4ipEft93lj0dsChEXi3dKcQvHodeKYByHhGKSpZ7nabUX+pFLAm9eCYlqjoEyc29hI4aLnnbAo
	y/rcMqVKVixu4OkAjUFlHndJyLRhKQOzBGsP48rxk+Edd967xOp2dkdtoQU/wz+zxUm7rmqIaVeL+
	PNt/2JzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omyrZ-0020Ex-Ld; Mon, 24 Oct 2022 14:55:37 +0000
Received: from mout.gmx.net ([212.227.17.21])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omyrW-0020DS-Gj; Mon, 24 Oct 2022 14:55:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
	s=badeba3b8450; t=1666623320;
	bh=38vTFzrZKf3FVvekYXAM+9K/QQ7KdRjbBzJUpJt6VgA=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
	b=dtvJVisITsF0EbznB+7Di1zYfXG7tQoyVlv1X5p47yph9tApZgmhfTfomGb/Deu50
	 fq2I7z8iZkcukHISr/E7srivCysTwzYLP2IFExoASwdiAy/8OagI4U+rHIDYQnf8lj
	 JvYhjdL9/o4Z6CDEoYf0CISxvcbmlTqppwVQmBwA=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [80.245.75.40] ([80.245.75.40]) by web-mail.gmx.net
 (3c-app-gmx-bap55.server.lan [172.19.172.125]) (via HTTP); Mon, 24 Oct 2022
 16:55:20 +0200
MIME-Version: 1.0
Message-ID: <trinity-95441a68-0025-49de-8c73-9730fb9cec42-1666623320110@3c-app-gmx-bap55>
From: Frank Wunderlich <frank-w@public-files.de>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Frank Wunderlich <linux@fw-web.de>, linux-mediatek@lists.infradead.org,
 Chaotian Jing <chaotian.jing@mediatek.com>, Ulf Hansson
 <ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Wenbin Mei <wenbin.mei@mediatek.com>,
 linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Aw: Re: [PATCH v3 3/7] dt-bindings: mmc: mtk-sd: add mt7986
Content-Type: text/plain; charset=UTF-8
Date: Mon, 24 Oct 2022 16:55:20 +0200
Importance: normal
Sensitivity: Normal
In-Reply-To: <a0121e0a-9f62-8630-45c5-d32eaa91d46f@linaro.org>
References: <20221023091247.70586-1-linux@fw-web.de>
 <20221023091247.70586-4-linux@fw-web.de>
 <a0121e0a-9f62-8630-45c5-d32eaa91d46f@linaro.org>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:IcIPaVgbRpByh7zwpXh4z9zY0VuCVJ0BaE6por2d9gpyO8zxW3t1fgd81QSE28VxLcD1u
 HkBl2H0ZLbUdRlcLxl9izmQuyB026eQFlnKdge9hDQBmNNJnN8hcAkNsaGap/6Ipdg280JwgdDsv
 z0t7GEoaowPjoBCs4a4gZcMVfxgSeFNFJukhgYCAxPgYN1LH4nZyf2rnyPbMZ6c6aSjVCcSVlIC/
 qeP+pr3BIEib7wR8/YVe/RFL/biv5BgnYFn/FDdVNvwui01qtL3tn/LD6zhyh13fQLNf0LEYBhQ4
 VA=
X-UI-Out-Filterresults: notjunk:1;V03:K0:znRvGzL+g5A=:5uyN0JGNRTW6mhDvDtYQRD
 kZtfmfs/QHUWqGBQHXv86LpWyWhSqU22/FdmdBW0jcOpGiSYaa6fASwbHakbHDL6CoK6iF5/R
 GZXrwot2tej9qq9fzMBngZbQaxhNq5FC/iHjBbUE6Vw5IRf17X69oIJaPQpCW416UkZX0nXwm
 TXqa49rNCelrhfGUpJJy0wYQ5FkKbBpLNRi58+9BkDjfGr2Y5OqvCy0k+K4O3p8evfigjWIit
 aRbs6yUBRvPJRpDgr6t75jCVaL1VDtCZUaFriOQ8KeXW8l5ITJeivxQghCAwt7LUcBU0TTUll
 WvwM4VJ2J+A2RRz0ThdgjHNa2Iwz8rvUm8S996b7uNDTqupx1g1ScVNTiZ73Qc9XtDrMPJaPd
 jAY1Q+TFjyOP6C67EWkV5U8LXnTdUwWwqUyTo/lsGA1xzxbvvJRS5gnvNKYHlQeHs3FI7j8W6
 5gDio/8A//+yIgsW9yxWoHYq+702CGCnPh7cUPoKQ/dYRCViXeLX5xddJEUlc13JlhCyCtL3M
 BQyLOJeqqOSjEMggk5xRnRvA8ld9NmzNWnS7bT78jQ/126NXGqnT4dR9up5SSIXA0GuoAmR+c
 XbiaCLAMXYAF4ZHZo2H53H4ZzQPMoBT0Zau98Nk7PLHrh/JeXFekC35TRhIpYEcweOtgMeQj2
 hd8OZwR9XPD1xqnEsxYUb/IhSbFMhPUdXBODWuYvWVgqVju3JuO5/fxYdj+yzrqnYgnrufrrO
 vgJ3fW8zDJX2Np7eMweaBn4JEY457UlOcuVTbk4e4DKAPhN7bd1EtdDs4Tjo2xSQtltB/rFB7
 IXUBsYMU3c5TeGQyibSjnV96jTdITvknMkDXqLmjIqUgaYbeAL5FXFN905AVydtQNhW9olJID
 RzmXcAfjF1uemF11gyYBiMt52XgCtAcjbfD3LmCYFGQiVPf6iiZq6PhYLxVjlTNr2XyRSqgFf
 6HWd5Oy1spKLYsa7m/r3Slos/wqe7TCyRHzHUmPJlwCQ9a7rWlKP0IuQqP5froldiEcQX/y4l
 hZFa/uBSBX9tdURucAmx/fZG1jXjk1zrh7IKiAsraz2Jfpw9Cgt+8wClStsVJZb0RCktkX3kN
 kwmOZx0oG92aQdj5BImoGMaBxLitINezlvcIi0d9sy2eBFZYYc5mHG6XR2wF+/KahQ8Ii1exp
 4DPchUa7rcp+3BXstW/TY8eeWb1A2WiP5QVFjpyOobEAfDICBiaI0NI/q7eJrNl7D2LKJTzld
 EHnxexwhcm98s+Re8dteAl+Ue7eR2NcS3D1hSWEVD5FwIl4SdDp8I8IgVo4pvX7SYPalmQlTm
 h6N7o7PR
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221024_075534_864169_0FD42B69 
X-CRM114-Status: GOOD (  10.43  )
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

Hi

> Gesendet: Sonntag, 23. Oktober 2022 um 14:56 Uhr
> Von: "Krzysztof Kozlowski" <krzysztof.kozlowski@linaro.org>
> An: "Frank Wunderlich" <linux@fw-web.de>, linux-mediatek@lists.infradead=
.org
> Cc: "Frank Wunderlich" <frank-w@public-files.de>, "Chaotian Jing" <chaot=
ian.jing@mediatek.com>, "Ulf Hansson" <ulf.hansson@linaro.org>, "Rob Herri=
ng" <robh+dt@kernel.org>, "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@li=
naro.org>, "Matthias Brugger" <matthias.bgg@gmail.com>, "Wenbin Mei" <wenb=
in.mei@mediatek.com>, linux-mmc@vger.kernel.org, devicetree@vger.kernel.or=
g, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
> Betreff: Re: [PATCH v3 3/7] dt-bindings: mmc: mtk-sd: add mt7986
>
> On 23/10/2022 05:12, Frank Wunderlich wrote:
> > From: Frank Wunderlich <frank-w@public-files.de>
> >
> > Add SoC specific section for defining clock configuration.
> >
> > Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
>
>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Hi,

got another config from mtk which requires changing binding a bit

                       clocks =3D <&topckgen CLK_TOP_EMMC_416M_SEL>,
                                <&infracfg CLK_INFRA_MSDC_HCK_CK>,
                                <&infracfg CLK_INFRA_MSDC_CK>,
                                <&infracfg CLK_INFRA_MSDC_133M_CK>,
                                 <&infracfg CLK_INFRA_MSDC_66M_CK>;
                       clock-names =3D "source", "hclk", "source_cg", "bus=
_clk",
                                     "sys_cg";
in binding:

+++ b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
@@ -241,15 +241,17 @@ allOf:
           items:
             - description: source clock
             - description: HCLK which used for host
-            - description: AXI bus clock gate
-            - description: AHB bus clock gate
+            - description: independent source clock gate
+            - description: bus clock used for internal register access (r=
equired for MSDC0/3).
+            - description: msdc subsys clock gate
         clock-names:
           minItems: 3
           items:
             - const: source
             - const: hclk
-            - const: axi_cg
-            - const: ahb_cg
+            - const: "source_cg"
+            - const: "bus_clk"
+            - const: "sys_cg"

will send an updated v4...old version was working but i should use the new=
 one.

@Krzysztof can i take your RB here or should i leave it as Patch was chang=
ed?

regards Frank

