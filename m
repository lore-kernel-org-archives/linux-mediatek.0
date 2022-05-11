Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25EE5C433FE
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 May 2022 08:03:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:Date:Subject:Cc:
	To:From:Message-ID:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LlapvQSKs0udRzUo/VbYmI5CNEksnsZIiVV6uDZex5M=; b=hidKjjnDwUbW9f
	2x0lSHZKVulMFqxX7c7CAWkH3fF3RFxton2gX+owJAogoVk9RY4d517nZWpLLCF+OlyWym6lD1H9d
	z+1+U2ebK4Mmo7WEMpkg9nOkodesW+cf5rCWMH1b44PExXKOJor1QqKRGqmwoET1Y5O6A+halj47l
	pzr1AmwxegHAUJaHMIUdh+Rkh0ckqHmnBlWzN1w1p/S7htqELvoU4tfJI9js3Mklen+wPwCmtdarD
	iMjAjKEzPPCCJqcnwvTlNPhhRC41pzKbxTtoPLln1xMTpYc1ZQW70oqZhOAgyORLSMB+eFwioCZuW
	ImZlgYqq5WsJ8NOHk8pQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nohJv-005njq-2Q; Wed, 11 May 2022 08:03:43 +0000
Received: from mout.gmx.net ([212.227.17.22])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nohJe-005ndI-MH; Wed, 11 May 2022 08:03:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1652256165;
 bh=B8FTFbkEKSq9FU1nYtmjnKVxghiXhAC0tTT4mBqiWNo=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=aJuH3WpsbGssY0jxWTz6NtSsyJj/F0xB3cw1/JLXp51ddDUIpUqmQD5Wdp4TqBz2q
 CyjAL6KdVYo2Ky8npof7tVC9Rz3ydTCsz0+V5soEV9cGcl3c5snAF9lfbdd+Oqk7jz
 o3Dv6CHPzzSk2VO22pirR0DPXkoP6QVPNaqeZdlQ=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [80.245.76.65] ([80.245.76.65]) by web-mail.gmx.net
 (3c-app-gmx-bap47.server.lan [172.19.172.117]) (via HTTP); Wed, 11 May 2022
 10:02:45 +0200
MIME-Version: 1.0
Message-ID: <trinity-68761fe5-fcca-456b-ba50-ead759f0fb54-1652256165646@3c-app-gmx-bap47>
From: Frank Wunderlich <frank-w@public-files.de>
To: Rob Herring <robh@kernel.org>
Cc: Frank Wunderlich <linux@fw-web.de>, linux-rockchip@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Andrew Lunn <andrew@lunn.ch>, Vivien
 Didelot <vivien.didelot@gmail.com>, Florian Fainelli
 <f.fainelli@gmail.com>, Vladimir Oltean <olteanv@gmail.com>, "David S.
 Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paolo
 Abeni <pabeni@redhat.com>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Heiko Stuebner <heiko@sntech.de>, Sean Wang
 <sean.wang@mediatek.com>, Landen Chao <Landen.Chao@mediatek.com>, DENG
 Qingfang <dqfext@gmail.com>, Peter Geis <pgwipeout@gmail.com>,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Greg
 Ungerer <gerg@kernel.org>, =?UTF-8?Q?Ren=C3=A9_van_Dorst?=
 <opensource@vdorst.com>, Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Subject: Aw: Re: [PATCH v3 1/6] dt-bindings: net: dsa: convert binding for
 mediatek switches
Date: Wed, 11 May 2022 10:02:45 +0200
Importance: normal
Sensitivity: Normal
In-Reply-To: <YnqymzCbabEjV7GQ@robh.at.kernel.org>
References: <20220507170440.64005-1-linux@fw-web.de>
 <20220507170440.64005-2-linux@fw-web.de>
 <YnqymzCbabEjV7GQ@robh.at.kernel.org>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:eV/uQqPXza9IH9Y6Gv0NJsaSRebtJEgsDYaeyvL96Y4T6fYpr0o3B2H8VkA557m4XfuMP
 EJm8YxcfAdgzGs60GWOyMLLyOLwpHUmbcx+QBI57BblTcXBCv083UmF50AdAZIM3kIVCwTi/9e6S
 RZ31tWDNSxRFhYErWSOsYivD8eVR/a8PeaGq7XD3uTo325JmaNm68SgIKTNEqUSN38nYYXYf2/KT
 mxvT4xypcXMmCQ4hX3DmI53H0fBjFxbp3EhsginVvb+AQXve2LPZbAm22l28+vdqt1gTW2Vyz3jw
 7s=
X-UI-Out-Filterresults: notjunk:1;V03:K0:IOaqh5ngyBI=:d3wI83YyXXlAM5qDVFD0Bx
 cMUtUb2TC50x2gRAAJG8+Zg6pLpPDiDW9a92hECLC/VqDTv6yKkWZBeDp/qwthXNsa9xm6kVR
 LkII6/vwvDGV3DD1wFHaWMKvAH18z0Ufgo41xshVPfGu2lmUbxzjT3RaBtSXyvKTopRWP3gsx
 sPnFcGXfaVmXoA0AN9//S+VV/PVQ90jQ+9dTtsPEkgTpiGVgCs6FIWGjcyQ7u3tVEaCkNSUyi
 6RjE/M2Bo17O3Jb282h/qPFdHf4GS4k2Rq+BaBq7teOgLe/Y8oVScC45CVtGe2j/0XkJ1dbNM
 LBk4Ts7/2cO8h6hX9BydCCEiX5lwqRNX1rDXTgVxqwdFdpbnnw/l2Pm6Kst1VA2ba4zjjKgJw
 ZbrTNSqpt2lqPQiymgBt/e5NLYYn4GaUcTofI0j7jaGTiz0UOUMGzZg0uQwWCQoPtuf0afZHR
 HvYfLGzpoYO3eEkT6DkOM2l4GOQdTADBRzPPl5ExffJfpBVk+rCMG1ZIwsLnBnwz/aOvUv+Hz
 kctcK4jKKYPSSY+6LgGRFcR/wL2v7ZPEClOrrQE4GJgK0mN8lN66cTCSCP6eVNLjQsd8EuwhD
 RrKqo97HwEmf5fMgTpUYoefC1aQi9DTIRS3RTk6o82BI9ay5kJO5zy428FX+UX8EVPmZzOC/+
 22GIwYHZnZnJrLv7AQAjNoYXx4ZxcMo207iAE1fbEPbcrm6gSuWWnUAdW0VmdjnmFYt4aZ6g5
 E668W/8r4WDOpD8roFZvuJ12jZJ9N8wm0OhM2CsyQ0j2006xHt3m5PC63Ej5TtMF0KO2MgWMp
 nupH2rG
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220511_010327_289143_2B500170 
X-CRM114-Status: GOOD (  16.41  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi

thanks for review

> Gesendet: Dienstag, 10. Mai 2022 um 20:44 Uhr
> Von: "Rob Herring" <robh@kernel.org>
> On Sat, May 07, 2022 at 07:04:35PM +0200, Frank Wunderlich wrote:
> > From: Frank Wunderlich <frank-w@public-files.de>

> > +++ b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml

> > +properties:
> > +  compatible:
> > +    enum:
> > +      - mediatek,mt7530
> > +      - mediatek,mt7531
> > +      - mediatek,mt7621
> > +
>
> > +  "#address-cells":
> > +    const: 1
> > +
> > +  "#size-cells":
> > +    const: 0
>
> I don't see any child nodes with addresses, so these can be removed.

dropping this (and address-cells/size-cells from examples) causes errors like this (address-/size-cells set in mdio
node, so imho it should inherite):

Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.example.dts:34.25-35: Warning (reg_format):
/example-0/mdio/switch@0/ports/port@0:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.example.dtb: Warning (pci_device_reg): Failed prerequisite 'reg_format'

> > +  interrupt-controller:
> > +    type: boolean
>
> Already has a type. Just:
>
> interrupt-controller: true
>
> > +
> > +  interrupts:
> > +    maxItems: 1

> > +patternProperties:
> > +  "^(ethernet-)?ports$":
> > +    type: object
>
>        additionalProperties: false

imho this will block address-/size-cells from this level too. looks like it is needed here too (for port-regs).

> > +
> > +    patternProperties:
> > +      "^(ethernet-)?port@[0-9]+$":
> > +        type: object
> > +        description: Ethernet switch ports
> > +
> > +        unevaluatedProperties: false
> > +
> > +        properties:
> > +          reg:
> > +            description:
> > +              Port address described must be 5 or 6 for CPU port and from 0
> > +              to 5 for user ports.
> > +
> > +        allOf:
> > +          - $ref: dsa-port.yaml#
> > +          - if:
> > +              properties:
> > +                label:
> > +                  items:
> > +                    - const: cpu
> > +            then:
> > +              required:
> > +                - reg
> > +                - phy-mode
> > +

> > +  - if:
> > +      required:
> > +        - interrupt-controller
> > +    then:
> > +      required:
> > +        - interrupts
>
> This can be expressed as:
>
> dependencies:
>   interrupt-controller: [ interrupts ]

ok, i will change this

> > +            ports {
>
> Use the preferred form: ethernet-ports

current implementation in all existing dts and examples from old binding are "ports" only.
should they changed too?

> > +                #address-cells = <1>;
> > +                #size-cells = <0>;
> > +                port@0 {

regards Frank

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
