Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E71AC636CC
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 Jan 2023 17:16:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=daYJarqOS5IXFlEYyWXjTSmBtMVEh8HL6HtkTuMNdv0=; b=EP+wIN6tiX+c5SmvxjOH17JsQW
	ubbMTv+v5vtJ+hlyCVNB87v6WeZY72ALt1AOQEB3bO4hF8HidtpC6wLZIV0owrXQZNwEaId+u56vl
	fH3dWVW0P0rfEua1C7uytwXZJ1+nVikxi/SEg59R4wn/imalQ/HDwg2/1zf6YGA+sUep0w0RPsM5F
	mIHB7aA1nMxZ7yWWCV7662yqIYyQqdxWYijQdfUbiRw1yveWGGnA5T04iocNfAOBRNkQnvjdht+T9
	nTHTMTVJp3D7hYBKz9/CqmiSmgNMHeNd4D/YQgTQIf/IvyQdp3c24AhdEbAyxe2dzspiimpT3CJAc
	R3Lh4EQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMuF8-008pBW-4W; Tue, 31 Jan 2023 17:16:26 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMuEx-008pAA-TE; Tue, 31 Jan 2023 17:16:17 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C1E90615D3;
	Tue, 31 Jan 2023 17:16:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB571C433A0;
	Tue, 31 Jan 2023 17:16:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675185372;
	bh=Htn9YhYSlgRXffy3rT6sfQrDIlpLGqBXlf/agXBrdjw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Jd3P9INjEYDlOAf/nypZj15Bfx3IQXs0A/Bm7oulj21GQqkSV9CmHDaLE/uqqC8+Q
	 A34cwv3ogGiy4SyxiQOaOoF+URg3kNK7J1QkMv+J1MjUCPNb7pAwhv3jLsfg78gS6D
	 aeLJMPFBKnV4ntAA2+4VrIZ/n6PRCfblE7w/jeQP8R1/Il7dKHbxROF4S5Ak/NInK9
	 laX9Voh6RZP4wGrYaveQqR6XZl4xKQQ52OVktiUGv0QYqEHVA3tVH800AIE0VyjsKu
	 mk7EILMP9Y8VE0s2df5yAbsOFzEvneWmFBcN99XQbjn/7uPkUe598H25cPZCaeGg5c
	 c44wE13S3Yr7Q==
Received: by mail-ua1-f53.google.com with SMTP id a40so3039005uad.12;
        Tue, 31 Jan 2023 09:16:12 -0800 (PST)
X-Gm-Message-State: AO0yUKVDwTv2l7Pnar2yft3oTLCr+DfjiCoMj+bvsMhbx0CIhdW/Wsju
	NbFTZokMcvl/apUr7Wygkki2LEFZuCaabDpGSQ==
X-Google-Smtp-Source: AK7set+iQsvrBKzhLDAGubPW+WjufNqDgwcRXrUNOCRmNJyXpbrbxPa1dClHjP0DYEs+SdSGeyjnL1grO5hWlrX1kjY=
X-Received: by 2002:ab0:1603:0:b0:656:239b:8a1e with SMTP id
 k3-20020ab01603000000b00656239b8a1emr3410737uae.58.1675185371547; Tue, 31 Jan
 2023 09:16:11 -0800 (PST)
MIME-Version: 1.0
References: <cover.1674693008.git.daniel@makrotopia.org> <3f0fd0becc338eef66caeb7244c3c432b8d1ef7a.1674693008.git.daniel@makrotopia.org>
In-Reply-To: <3f0fd0becc338eef66caeb7244c3c432b8d1ef7a.1674693008.git.daniel@makrotopia.org>
From: Rob Herring <robh+dt@kernel.org>
Date: Tue, 31 Jan 2023 11:16:00 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLuMrZs-ggmT_c7Bwa6ERKAU4vDi2_QH5OzyjYbvMsREw@mail.gmail.com>
Message-ID: <CAL_JsqLuMrZs-ggmT_c7Bwa6ERKAU4vDi2_QH5OzyjYbvMsREw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: pinctrl: add bindings for MT7981 SoC
To: Daniel Golle <daniel@makrotopia.org>
Cc: devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Sean Wang <sean.wang@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Chen-Yu Tsai <wenst@chromium.org>, 
	Miles Chen <miles.chen@mediatek.com>, Edward-JW Yang <edward-jw.yang@mediatek.com>, 
	Johnson Wang <johnson.wang@mediatek.com>, Fabien Parent <fparent@baylibre.com>, 
	Sam Shih <sam.shih@mediatek.com>, Jianhui Zhao <zhaojh329@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230131_091616_023704_F4CB1196 
X-CRM114-Status: GOOD (  15.74  )
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

On Wed, Jan 25, 2023 at 6:34 PM Daniel Golle <daniel@makrotopia.org> wrote:
>
> Add bindings for the MT7981 pinctrl driver. As MT7981 has most features
> in common with MT7986 (but has a different layout in terms on pinctrl
> and clocks), the existing mediatek,mt7986-pinctrl.yaml was used as an
> example to create a similar document covering MT7981.
>
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> ---
>  .../pinctrl/mediatek,mt7981-pinctrl.yaml      | 475 ++++++++++++++++++
>  1 file changed, 475 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/mediatek,mt7981-pinctrl.yaml

Resending due to some header corruption:

Reviewed-by: Rob Herring <robh@kernel.org>

