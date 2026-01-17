Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE852C98306
	for <linux-mediatek@archiver.kernel.org>; Sat, 17 Jan 2026 00:24:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Db/w/ndP0/YmMrTixmEW0XL65vVvpJoSOBjEcS/pWrI=; b=TQKv1qUlURTRVOzRkc55UCpefB
	cH2o1OrSrO8hFvDf7kFrYF3a4/u82XyWgR3HTzJWWKImD/lbw81zK+5h2n6FeOWSIAMlX2qhz2BX5
	QEcVGUjIO1G+ZzIKmZPU3tB3UC+FfxWmTLiwY6JCwXKWIjoo38/WSkE2oK6am4aIjCO8ltSJou5DX
	zCwp9rwX+QnhMshsEOyN2g7XsTuiGmNoGWo8wVs6ByNxf++5bKd0nMQrjc4oUW35XoOLwxdLJz7WZ
	oQbfMDLcz4jcz/VfAFxZt5PenbxF5yzjEny4bW5QTFxdzwjqAf3+64hLOIv5BJ85ajjbnt7Sc97LS
	4Vpqiz/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgu6z-0000000F37y-3vH5;
	Sat, 17 Jan 2026 00:24:17 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgu6x-0000000F36r-0MtR
	for linux-mediatek@lists.infradead.org;
	Sat, 17 Jan 2026 00:24:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BC39444244
	for <linux-mediatek@lists.infradead.org>; Sat, 17 Jan 2026 00:24:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96585C2BCB0
	for <linux-mediatek@lists.infradead.org>; Sat, 17 Jan 2026 00:24:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768609453;
	bh=U6A5F66/8wNeQzB5YOqAPM9qiLWuTBzYGYXMcYaBqBA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=fBqqNAYi7nbIuYUiNgJZmh1dgDVoDnmqPByeNNo6Jrxv5usPZVXBqNftzLuWkuhdJ
	 FTm2LhOrFL2n9Fb69gD7wTUf8eptdKImIga8BEup3eUnssoWIR6l1HcHV8cLoChtL6
	 02wAcTOzNnBq1TmCU13cJbzBffcj7xAaXqNXA7KsGp7FTuddHl28cOkCgcvlw1nbF1
	 3E5AueiSveP62C3hwfxxKrKQY6TSdoPgO2eFw5yAmJU30G71ngdO0yRS2Cibgr5QZF
	 g8koAqI0Uu0kvmYzwEOjKslKwN0HXIfHXaAA9YnUlvDY9mYKC/rgG6YmDEk6xl1HVK
	 PNjFP/PPiZkog==
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-1233b953bebso1770990c88.1
        for <linux-mediatek@lists.infradead.org>; Fri, 16 Jan 2026 16:24:13 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXsPIoXbsDMB4vszYLHk3SVAPXp+4mnhFjcHMSnnQ7XMQ274V/zVqhpxSvuP7DQ8lYjKt6StuodU6f2aVKa2g==@lists.infradead.org
X-Gm-Message-State: AOJu0YyQcR8cAJQ8Sj87cDxintieV4mdufmsQHjKwL/UcxNvYi5WD8Jw
	N/id6+sehR5FOzgV28rphnbpNukZ2QttFgjTmPVJGmkH5xvVsnd4/XYTimH2PVdchldVT0WlGnd
	lZbxPFzXMMXVokk9/1W4tR8dge+sPLw==
X-Received: by 2002:a05:7022:221a:b0:119:e56b:c73d with SMTP id
 a92af1059eb24-1244a6d7e40mr4659486c88.2.1768609452861; Fri, 16 Jan 2026
 16:24:12 -0800 (PST)
MIME-Version: 1.0
References: <20251217-mtk-genio-evk-hdmi-support-v2-0-a994976bb39a@collabora.com>
 <20251217-mtk-genio-evk-hdmi-support-v2-1-a994976bb39a@collabora.com>
In-Reply-To: <20251217-mtk-genio-evk-hdmi-support-v2-1-a994976bb39a@collabora.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sat, 17 Jan 2026 00:24:00 +0000
X-Gmail-Original-Message-ID: <CAAOTY__5MX0bsuW2r4V3Chg4H=_HqNJLCLQkzL7EhYgHmp94cA@mail.gmail.com>
X-Gm-Features: AZwV_QhrVWk7cGaynTa_jr48veRrDR3eq9SxYYQUvBNFuYXcjhmjYCg6uHpV0TE
Message-ID: <CAAOTY__5MX0bsuW2r4V3Chg4H=_HqNJLCLQkzL7EhYgHmp94cA@mail.gmail.com>
Subject: Re: [PATCH v2 01/12] dt-bindings: phy: mediatek,hdmi-phy: Fix clock
 output names for MT8195
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Guillaume Ranquet <granquet@baylibre.com>, kernel@collabora.com, 
	Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260116_162415_170104_7D5DE77D 
X-CRM114-Status: GOOD (  16.79  )
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

Hi, Louis:

Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com> =E6=96=BC 2025=E5=B9=
=B412=E6=9C=8817=E6=97=A5=E9=80=B1=E4=B8=89
=E4=B8=8A=E5=8D=8810:19=E5=AF=AB=E9=81=93=EF=BC=9A
>
> From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com=
>
>
> For all of the HDMI PHYs compatible with the one found on MT8195
> the output clock has a different datasheet name and specifically
> it is called "hdmi_txpll", differently from the older HDMI PHYs
> which output block is called "hdmitx_dig_cts".
>
> Replace clock output name string check by max item number one to allow
> the new name on all of the HDMI PHY IPs that are perfectly compatible
> with MT8195.
>
> [Louis-Alexis Eyraud: split patch, addressed previous feedback from
> mailing list, and reworded description]

Applied the binding patches of this series to mediatek-drm-next [1], thanks=
.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-next

Regards,
Chun-Kuang.

>
> Fixes: c78fe548b062 ("dt-bindings: phy: mediatek: hdmi-phy: Add mt8195 co=
mpatible")
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
> ---
>  Documentation/devicetree/bindings/phy/mediatek,hdmi-phy.yaml | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/phy/mediatek,hdmi-phy.yaml=
 b/Documentation/devicetree/bindings/phy/mediatek,hdmi-phy.yaml
> index f3a8b0b745d13ffc55d391570bff20830d925ed3..10f1d9326f18dba85b92b4c88=
f4c0f6cdddc4c25 100644
> --- a/Documentation/devicetree/bindings/phy/mediatek,hdmi-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/mediatek,hdmi-phy.yaml
> @@ -42,8 +42,7 @@ properties:
>        - const: pll_ref
>
>    clock-output-names:
> -    items:
> -      - const: hdmitx_dig_cts
> +    maxItems: 1
>
>    "#phy-cells":
>      const: 0
>
> --
> 2.52.0
>

