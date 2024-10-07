Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00BC1CFB43F
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Oct 2024 08:21:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	References:In-Reply-To:Date:Content-Type:Subject:Cc:To:From:Message-ID:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aWRckGpPlClWXWLlLN+tiFUkn8w9XI5KUDE1QFwaEQk=; b=T5IE+mKzkyi1nuxahuXZnfrdav
	ixjpJ9tIIFNg2E7zChc7yO8GhCwm2cN5hDE9Elnniau0z8ldShaDTkRu69fJOYpRHZ2Ggw5eIm4C1
	AjOx3+XM8z5y2IuqHXCZe644OVArwzNH96kSATVvjyPJYcOe2RLy19wCcgd/DuThPbUy9qRQZ8KXI
	/LSvGxMF/gDJlul/lmtyEEek+njmEuMAXlRyEtzq3jwtPMzouQ2TPeHTFI/vtrYppmVk933wj5Jp8
	oVH8mCmMN/fCjBm8wEP5LOEN3PAGpiZ6kch954fAKF5YUduhu4E8GZ+ezREFHGTHveHYPP/S8c3jm
	d1p8R6DQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sxizj-00000001k2F-2hdT;
	Mon, 07 Oct 2024 08:21:31 +0000
Received: from mout.gmx.net ([212.227.17.22])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sxic6-00000001gHR-0De0;
	Mon, 07 Oct 2024 07:57:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=public-files.de;
	s=s31663417; t=1728287815; x=1728892615; i=frank-w@public-files.de;
	bh=aWRckGpPlClWXWLlLN+tiFUkn8w9XI5KUDE1QFwaEQk=;
	h=X-UI-Sender-Class:MIME-Version:Message-ID:From:To:Cc:Subject:
	 Content-Type:Date:In-Reply-To:References:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=cJ2vT8TMTcoIe4ueB8NAz1JOX6UVll0T81S7D+vyvypx+R6VJee98Du7kwwrXNe1
	 BV47plGQVUGfNdl0HCTFaFBagsT5nCTJNDBvVfRb17xMW5qyB8FAmR2B0D09nbGjq
	 M5PeLb996gaxQy6iuYDEbmB0VNk5heXKEHw830ds316MXchi1Q68P0r1ca0GcjRN0
	 TfHzwpxUzbIMhn+7AsLXGQC2im2OXJZyPkGyNmq6Q1OQJm3hlOyxE72fPJ2Q+fjXo
	 QhWz8JrbbkdpwGTDsvo2aOZoznwfdc02uC4FwhelaPu1iPDQO2U1ff30o5DjXw/Tf
	 MPeMLR55s0vAcek7nA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [217.61.153.101] ([217.61.153.101]) by web-mail.gmx.net
 (3c-app-gmx-bap03.server.lan [172.19.172.73]) (via HTTP); Mon, 7 Oct 2024
 09:56:55 +0200
MIME-Version: 1.0
Message-ID: <trinity-c35964a7-f0d4-435a-ac76-586e90c666ed-1728287815279@3c-app-gmx-bap03>
From: Frank Wunderlich <frank-w@public-files.de>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Frank Wunderlich <linux@fw-web.de>, Chaotian Jing
 <chaotian.jing@mediatek.com>, Ulf Hansson <ulf.hansson@linaro.org>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Wenbin Mei <wenbin.mei@mediatek.com>, linux-mmc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 daniel@makrotopia.org, john@phrozen.org, eladwf@gmail.com,
 ansuelsmth@gmail.com
Subject: Aw: Re:  Re: [PATCH v2 1/2] dt-bindings: mmc: mtk-sd: Add mt7988
 SoC
Content-Type: text/plain; charset=UTF-8
Date: Mon, 7 Oct 2024 09:56:55 +0200
Importance: normal
Sensitivity: Normal
In-Reply-To: <486a85cb-8e09-493b-93f8-6610855b5f7e@kernel.org>
References: <20241006153447.41377-1-linux@fw-web.de>
 <20241006153447.41377-2-linux@fw-web.de>
 <p7lqqhet6ahmvieh5xaws6ugsnasmuw6k4oajkmfcctuhrs4dn@quvrkmyof5ss>
 <trinity-57600902-afb6-42f3-8cf5-54a07710f979-1728284364104@3c-app-gmx-bap03>
 <486a85cb-8e09-493b-93f8-6610855b5f7e@kernel.org>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:n6jvowWeY9OPnSLi7BVINuNe/LC0IYJRWMIhKNkJshpxKZMv4cJiUbGEOrFJmMTBiwg21
 PyYiAz8aH+rVqwlLL65Anr6la9n0pFwTBn+qcVXMe0Vrx3ayKWuW728U07tyBbHVMvZXcLw7l4mx
 hGX01rUlL6vujA90vYjD20gUllv1n0IrYVagmHhWbgrB3P4d2bGdjRl7THwtXP0gaCGLGbnBdwmd
 OJ+zbmPX/VnlZbY5Wp38ZCw6kJf65gg8bVu2oMtuqZ+5Zy5KJJFsWsSYMbazCvrICwUSZKaoYCCm
 dU=
UI-OutboundReport: notjunk:1;M01:P0:UoCxcf+vtco=;NOMDgFbtuMli4t8K+pGge72+Bzc
 pVbp3Gi1YbvPknFZOQv1tv+9kkSDOtyL3KXvvl6AUGD7hpZF3BtVKdctB3Zb5LYqU/J1aGpBj
 iUFY76Z80zhu3Etfgc581TngWEsgociT9T3HiZNSEcKSonQpn8+IX/ZbOGYfxrfAnMU2F1950
 cz7kZz7GCzF6DuQnfLzmxY+9kE5EA72k1wMo0TgzDTIVClxr7tB/kTaq4qnTxJstxphBkURIi
 ZirUZGDdfIWoDSVY6VSOw0cwTUfEpCJom785oMr9hqso4JvPvlaD50yuwc4njSYBhVcad6GmU
 mp9+AV9JQvSf/bXsLHvs9k23Yfx8q5ImMa0oULDwqxbeqdKvwiiVrgnpC6IoeOxpuvDhdvOTF
 EgMPVZBTebvcbf4QSs0OkiinbNZTzWIA/+YcBQEsFrpVZ33ZC6rTGRtf7FNpuGSWbvVRcAXoO
 YfmEBF76QlWgdHsDieTSJsQZIr84uCH18FyANadm1vTKwCTGwf+BvZU0zk04XmyPEXM7//8eV
 8Zxgum6gmM9xyTEUnjel9QxjZf6yyGmYp/Ia2N7iM4WlEl6OxpxaQbanQJSZT/kCBO8wj3D9k
 o5C7AVVoEyItVVynqGg7klMhPI+eV1VLDPMB/ckVVVQVwABP63kxo6GmphlqwTPgNGwtq42bU
 ABgxyXqhgfbWm8EY7rK5b+U3XgR0s6TYjyghygoNYg==
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241007_005706_409607_791F5D39 
X-CRM114-Status: GOOD (  19.36  )
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
> Gesendet: Montag, 07. Oktober 2024 um 09:04 Uhr
> Von: "Krzysztof Kozlowski" <krzk@kernel.org>
> Betreff: Re: Aw: Re: [PATCH v2 1/2] dt-bindings: mmc: mtk-sd: Add mt7988=
 SoC
>
> On 07/10/2024 08:59, Frank Wunderlich wrote:
> >> Gesendet: Montag, 07. Oktober 2024 um 07:55 Uhr
> >> Von: "Krzysztof Kozlowski" <krzk@kernel.org>
> >> An: "Frank Wunderlich" <linux@fw-web.de>
> >> Betreff: Re: [PATCH v2 1/2] dt-bindings: mmc: mtk-sd: Add mt7988 SoC
> >>
> >> On Sun, Oct 06, 2024 at 05:34:45PM +0200, Frank Wunderlich wrote:
> >>> From: Frank Wunderlich <frank-w@public-files.de>
> >>>
> >>> Add binding definitions for mmc on MT7988 SoC.
> >>>
> >>> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> >>> ---
> >>> v2:
> >>> - fixed minItems to 4
> >>> ---
> >>>  .../devicetree/bindings/mmc/mtk-sd.yaml       | 24 ++++++++++++++++=
+++
> >>>  1 file changed, 24 insertions(+)
> >>>
> >>> diff --git a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml b/Doc=
umentation/devicetree/bindings/mmc/mtk-sd.yaml
> >>> index c532ec92d2d9..7380f72ea189 100644
> >>> --- a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
> >>> +++ b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
> >>> @@ -21,6 +21,7 @@ properties:
> >>>            - mediatek,mt7620-mmc
> >>>            - mediatek,mt7622-mmc
> >>>            - mediatek,mt7986-mmc
> >>> +          - mediatek,mt7988-mmc
> >>>            - mediatek,mt8135-mmc
> >>>            - mediatek,mt8173-mmc
> >>>            - mediatek,mt8183-mmc
> >>> @@ -263,6 +264,29 @@ allOf:
> >>>              - const: bus_clk
> >>>              - const: sys_cg
> >>>
> >>> +  - if:
> >>> +      properties:
> >>> +        compatible:
> >>> +          contains:
> >>> +            enum:
> >>> +              - mediatek,mt7988-mmc
> >>> +    then:
> >>> +      properties:
> >>> +        clocks:
> >>> +          minItems: 4
> >>
> >> Drop
>
> Drop this line.
>
> >>
> >>> +          items:
> >>> +            - description: source clock
> >>> +            - description: HCLK which used for host
> >>> +            - description: Advanced eXtensible Interface
> >>> +            - description: Advanced High-performance Bus clock
> >>> +        clock-names:
> >>> +          minItems: 3
> >>
> >> This is still wrong... anyway, drop.
> >
> > arg, sorry again...i should triple-check all before resending.
>
> Drop this line.
>
> >
> > but dropping means the global 2 is used (making axi+ahb optional), or =
am i wrong? afaik "minItems: 4" is right here
>
> How minItems:4 is right here?

mt7988 needs all 4 clocks, tested with only first 2 (based on global minit=
ems) and got this (similar with first 3 clocks):

[   10.826271] mtk-msdc 11230000.mmc: msdc_request_timeout: aborting cmd/d=
ata/mrq
[   10.833485] mtk-msdc 11230000.mmc: msdc_request_timeout: aborting mrq=
=3D(____ptrval____) cmd=3D18
[   10.842006] mtk-msdc 11230000.mmc: msdc_request_timeout: aborting cmd=
=3D23
[   10.848704] mtk-msdc 11230000.mmc: msdc_track_cmd_data: cmd=3D18 arg=3D=
00036402; host->error=3D0x00000002
[   15.866269] mtk-msdc 11230000.mmc: msdc_request_timeout: aborting cmd/d=
ata/mrq
[   15.873480] mtk-msdc 11230000.mmc: msdc_request_timeout: aborting mrq=
=3D(____ptrval____) cmd=3D13
[   15.881998] mtk-msdc 11230000.mmc: msdc_request_timeout: aborting cmd=
=3D13
[   15.888694] mtk-msdc 11230000.mmc: msdc_track_cmd_data: cmd=3D13 arg=3D=
00010000; host->error=3D0x00000002

so minItems:4 is imho right here

> Best regards,
> Krzysztof
>
>

