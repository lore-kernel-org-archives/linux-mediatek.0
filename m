Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34414CFB440
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Oct 2024 07:01:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	References:In-Reply-To:Date:Content-Type:Subject:Cc:To:From:Message-ID:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R0AGuj5yIrzDKc34jGDi7Sop1ytF0WoQFQCgEomR2do=; b=G7bbvbPpxatJauWcRoePN2PQOc
	YImfxpNyx/YnQS54zRn/FWbRwINLL25HfjtbGJ/q94U1DU/HFCvxnAV8UO0GLpML8tXqif6B99Xug
	Tzngh0dwv6vtrhnfVV1hNkDxN23GxolVoL4VOj1OBG6jbgWhiYL+yWRXJIqc9pA9EYTBFf9EoVFrE
	d6QhiFqZ2sFavTc+IabsFZvxERzcTwssSZDOFYXP8BGmQ4LS+AIgWsv/zhe5E4O/sXfz5gCF1ErXc
	hd+VzAIuagnELbIwfQKYuyz6Oy3bDzxPpDnmZKPkfjXRKJo1991N8iYRw3LhHwQDxU4ZpKUMLTVfp
	3cSBcDvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sxhk8-00000001VzB-3Seu;
	Mon, 07 Oct 2024 07:01:20 +0000
Received: from mout.gmx.net ([212.227.17.22])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sxhiU-00000001VYM-1KwC;
	Mon, 07 Oct 2024 06:59:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=public-files.de;
	s=s31663417; t=1728284364; x=1728889164; i=frank-w@public-files.de;
	bh=R0AGuj5yIrzDKc34jGDi7Sop1ytF0WoQFQCgEomR2do=;
	h=X-UI-Sender-Class:MIME-Version:Message-ID:From:To:Cc:Subject:
	 Content-Type:Date:In-Reply-To:References:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=a504at3T4RFK9vS1K5OsHuRPpDQ3D09FXnEbT2tAP8XH8Hzm+O8ljIuQUaltyRFz
	 GxXIbwB9AJFWK2ehw86IQBlXi0XHwIbKl+E5cJQGsjC5qWgtg99Hv8mrjpZ/et6/Z
	 qq+aGAwkACQ+5lwX6bJSr84aIAJW7+Q1GOpjciEY6nho8y8c8Nt5VEaCGtabLg/k7
	 OBLj9bHjVhL1gg8UD31We4jvPacu9x53m+XUB2aOaoc2FCVe2T4Pzfq40+RlpZRLh
	 1psQ8Eul0d35DS3B14bwoE6Ue3xfytpk3PSV7scZMpttyDkWmq1afZCGB8xCnITir
	 jAOF62e5bLO1lzw6lg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [217.61.153.101] ([217.61.153.101]) by web-mail.gmx.net
 (3c-app-gmx-bap03.server.lan [172.19.172.73]) (via HTTP); Mon, 7 Oct 2024
 08:59:24 +0200
MIME-Version: 1.0
Message-ID: <trinity-57600902-afb6-42f3-8cf5-54a07710f979-1728284364104@3c-app-gmx-bap03>
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
Subject: Aw: Re: [PATCH v2 1/2] dt-bindings: mmc: mtk-sd: Add mt7988 SoC
Content-Type: text/plain; charset=UTF-8
Date: Mon, 7 Oct 2024 08:59:24 +0200
Importance: normal
Sensitivity: Normal
In-Reply-To: <p7lqqhet6ahmvieh5xaws6ugsnasmuw6k4oajkmfcctuhrs4dn@quvrkmyof5ss>
References: <20241006153447.41377-1-linux@fw-web.de>
 <20241006153447.41377-2-linux@fw-web.de>
 <p7lqqhet6ahmvieh5xaws6ugsnasmuw6k4oajkmfcctuhrs4dn@quvrkmyof5ss>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:NJAHfrORCcCOW2WN7H4bEoinSF2FWIRros/25USaRXG8LWD+9GYkr8WuevawXQ3d+J4U3
 Vr2C+PSULryIEv5iClhfCZN+53sAfZc+AL/mrTFcusc+1juiHHrgXf2vX3X1CkuSpBvSzTFgIfsQ
 BH6/dRvkxdPuW3Dypod9GtfKpOfdWR78bsu2Diu/HBwsJB2tYb+QrkMaNpDk25uddO8CdSxfiZhg
 ccbiMYchPo4zoNk5bTkMjuQ/IUOgbRVoxpTqDYF/zZORH4XmZkMDww7yaqVWTX3Uy70TxR1ljSE3
 /w=
UI-OutboundReport: notjunk:1;M01:P0:zD0Pvuez3Bs=;Po0PEr/OdsOQdAkD0FLE28bTugq
 Xpu/NvntrZGibvMH6upFmsHmHqwxchB/+RSy4RD9dA5LiJOi5OzvTPMMlrhgx47eLAnqk+/M/
 3sMDLKZUY5MI5Ab5VGZSUZZ1oEqo2Iu5opMvGCyuLjhxBtYIRui3iZoiEN/9q8/UTnC58vuPj
 /9Jrligsv6r2F0cNWWomgpaErws9JutZjvhLpIdir7nP3ORYlMqCVnYnvSVBWkNQusLrfoT6G
 DZ3zUafDXhbLV9sIj4N4cxmOQJmtKM5GEXXkJx5hIU80HG3RDmm//oARnkwnzwgbDaUvWCASf
 kKSgx4xPZyg+xKw4cg4BQkDIoJQ5r3fBQY5LH+In1t/5s5npWmrdraZXvrT9xEV/aGe6Jl7VQ
 rWIK7UCSfsIHYwIx4LkDLLpSD4NXRXJF8w1uYKvcJ2/zuk5xmBstMYbG9+C3KDloGb5uDYm/S
 ggLg+OfKtdf6jlJJUUCAXjDvd2vq1dPJ++Pck695F01WtTXyToUJ8d7FuKaieqIxPFs46C822
 pvUo7sAFUP0gTaPhBl8t1Apz1EY5bx/Tk2KIe8OaM8Fby+oCF73s5eXr7SV0oWdg7nj+O+lph
 v5sX98c9muDq6kPRg8q5pTMUKTvGdnck1hLp6cE2WNvNNcbYBlxKz8jfQUb34A2MxG9i3pva/
 EAdpp5xRoGP2U7rnqqwEZZTyQsB/xSzSRv/XdbB2oQ==
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241006_235938_877247_3224D54F 
X-CRM114-Status: GOOD (  18.02  )
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

> Gesendet: Montag, 07. Oktober 2024 um 07:55 Uhr
> Von: "Krzysztof Kozlowski" <krzk@kernel.org>
> An: "Frank Wunderlich" <linux@fw-web.de>
> Betreff: Re: [PATCH v2 1/2] dt-bindings: mmc: mtk-sd: Add mt7988 SoC
>
> On Sun, Oct 06, 2024 at 05:34:45PM +0200, Frank Wunderlich wrote:
> > From: Frank Wunderlich <frank-w@public-files.de>
> >
> > Add binding definitions for mmc on MT7988 SoC.
> >
> > Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> > ---
> > v2:
> > - fixed minItems to 4
> > ---
> >  .../devicetree/bindings/mmc/mtk-sd.yaml       | 24 ++++++++++++++++++=
+
> >  1 file changed, 24 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml b/Docum=
entation/devicetree/bindings/mmc/mtk-sd.yaml
> > index c532ec92d2d9..7380f72ea189 100644
> > --- a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
> > +++ b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
> > @@ -21,6 +21,7 @@ properties:
> >            - mediatek,mt7620-mmc
> >            - mediatek,mt7622-mmc
> >            - mediatek,mt7986-mmc
> > +          - mediatek,mt7988-mmc
> >            - mediatek,mt8135-mmc
> >            - mediatek,mt8173-mmc
> >            - mediatek,mt8183-mmc
> > @@ -263,6 +264,29 @@ allOf:
> >              - const: bus_clk
> >              - const: sys_cg
> >
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            enum:
> > +              - mediatek,mt7988-mmc
> > +    then:
> > +      properties:
> > +        clocks:
> > +          minItems: 4
>
> Drop
>
> > +          items:
> > +            - description: source clock
> > +            - description: HCLK which used for host
> > +            - description: Advanced eXtensible Interface
> > +            - description: Advanced High-performance Bus clock
> > +        clock-names:
> > +          minItems: 3
>
> This is still wrong... anyway, drop.

arg, sorry again...i should triple-check all before resending.

but dropping means the global 2 is used (making axi+ahb optional), or am i=
 wrong? afaik "minItems: 4" is right here

> Best regards,
> Krzysztof
>

regards Frank

