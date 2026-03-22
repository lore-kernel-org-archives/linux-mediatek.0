Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FAE8FC72C2
	for <linux-mediatek@archiver.kernel.org>; Sun, 22 Mar 2026 13:30:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u19R6ZmH2fb3IPSy31GLs1B3r1txPLZcYLK808fTUqg=; b=kZkOo4wvlHVdo/87Xf0j6u1ZT0
	M6dvvwvNT15sGV6aTbPXSYPiBvXDeylWrDVDNFFRlmuFhgYbRCWSuBPRwkemlaJ8PlxrwiqgmzZOg
	hal+VkNHi3h2R5tfKNtNOxsrIZbSAGgkgdYmobKnTpyhIobSoMF3D3AVSzMO1Selyo4h2cZS4CFqP
	ARY1gjqXBiEtyD3AGVqDxA/0E/i/E/8nQeese3818k5rWPgfRjrp1Kd65ofUe+A1cwjMI+kSht7Jt
	z7I+tN+VBhdd70JZTN486jwB8aZgk9nUHUBOJx2Eu4B0EQ5H1UO69TkZtzzQpdZ5xfEfo/lLamNih
	kMHEeNnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4Iso-0000000FMrM-065J;
	Sun, 22 Mar 2026 13:30:22 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4Ism-0000000FMqP-0hSa
	for linux-mediatek@lists.infradead.org;
	Sun, 22 Mar 2026 13:30:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 37C0B60120
	for <linux-mediatek@lists.infradead.org>; Sun, 22 Mar 2026 13:30:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE525C2BCB0
	for <linux-mediatek@lists.infradead.org>; Sun, 22 Mar 2026 13:30:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774186218;
	bh=+r4DJixed9qR03jrcBvB9qDQ5jUMnFCb5a5xczMslvQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=t7IpZlnROV0e1DCl+84kGg5osfHKgXcocBKtSBG7gA6yyaPgWxIonLs1CChM+T5YG
	 tiqlfp1agbFL2+oR3k2F80AMmDAdVAn5HaFHIDjXi2MiIiVuIdmjA23HsVNfqPSZQM
	 Q9xjlXAIbg7I9lbti2tQPbHw8e/tOPlNN4vc1/SMiJsAVMus3W4t+n3FpHr9mP6kEo
	 YAL+B4mX+GW684f9nRhUiqYai2XqbdPY1+MIzmHlzBlHOg0yXlawOjh3gF6QJ41fUc
	 4OpzOE1E0CO+EPOcduFEoxeyiH4YNLPXLMUDWa/Luiq5Z9l3R6wMO51Yk2rM/Gj0+u
	 ISYjXp5xZcMsQ==
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-128b9b7e3edso4411654c88.0
        for <linux-mediatek@lists.infradead.org>; Sun, 22 Mar 2026 06:30:18 -0700 (PDT)
X-Gm-Message-State: AOJu0YxUBGCmvzPlYFzc7oTuNWQYvKZ/uDEBSoGFm8iuJKEkbFDTlwJX
	FLPtSDbnyUjDi2RTLNTgkDKx3r0Wm7g4cSFFYWzDApizPZXudHa/yqDzlmPIZA1B6y2PxozC+kc
	FmsoCbT7iNUQk1cBo3oWoSO8J/CGZ+Q==
X-Received: by 2002:a05:7022:10f:b0:11e:f6ef:4988 with SMTP id
 a92af1059eb24-12a726e7fb3mr3981540c88.36.1774186218230; Sun, 22 Mar 2026
 06:30:18 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1771863641.git.l.scorcia@gmail.com> <92530e0a31eca1feb822f5c5fd4ac894937dd6c7.1771863641.git.l.scorcia@gmail.com>
In-Reply-To: <92530e0a31eca1feb822f5c5fd4ac894937dd6c7.1771863641.git.l.scorcia@gmail.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sun, 22 Mar 2026 13:30:06 +0000
X-Gmail-Original-Message-ID: <CAAOTY_8JiyK0jbRsKfFkSguMNBgLXrMF07fZZ=7iNZWCb3p7Qg@mail.gmail.com>
X-Gm-Features: AaiRm51_S1J__pLk1a4D71_Q_McB7o8n-vG8FQQ5qEkWpejUVhVFdJ1R0hMpTzo
Message-ID: <CAAOTY_8JiyK0jbRsKfFkSguMNBgLXrMF07fZZ=7iNZWCb3p7Qg@mail.gmail.com>
Subject: Re: [PATCH v3 3/6] dt-bindings: phy: mediatek,dsi-phy: Add support
 for mt8167
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Cc: linux-mediatek@lists.infradead.org, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-phy@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

Hi, Luca:

Luca Leonardo Scorcia <l.scorcia@gmail.com> =E6=96=BC 2026=E5=B9=B42=E6=9C=
=8823=E6=97=A5=E9=80=B1=E4=B8=80 =E4=B8=8B=E5=8D=884:26=E5=AF=AB=E9=81=93=
=EF=BC=9A
>
> Add support for the MediaTek mt8167 SoC: the DSI PHY found
> in this chip is fully compatible with the one found in the mt2701 SoC.

Applied to mediatek-drm-next [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-next

Regards,
Chun-Kuang.

>
> Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/phy/mediatek,dsi-phy.yaml | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/phy/mediatek,dsi-phy.yaml =
b/Documentation/devicetree/bindings/phy/mediatek,dsi-phy.yaml
> index acdbce937b0a..c6d0bbdbe0e2 100644
> --- a/Documentation/devicetree/bindings/phy/mediatek,dsi-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/mediatek,dsi-phy.yaml
> @@ -23,6 +23,7 @@ properties:
>        - items:
>            - enum:
>                - mediatek,mt7623-mipi-tx
> +              - mediatek,mt8167-mipi-tx
>            - const: mediatek,mt2701-mipi-tx
>        - items:
>            - enum:
> --
> 2.43.0
>

