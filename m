Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A21FAC531F8
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jul 2026 23:50:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pv0TSuxWUbLfyWJcf83pbitWWIKSiZQYxEH4kwn1yUY=; b=VDXU3S/+Tr0u8YQgbejYuMQ2YZ
	S4S84G/FriFvvI5thHWo777i4wy4tuGhfSLGy+umFXOA8bLMaGr9MIjR7Z7iLrzXtI5Z/gmV+2JfV
	wUTqVcLmfG2M2klttNZrJMhRId+sH+P530koA+epC2mWVVb3Z7eK4Sa3dLb8Df5vScb6F0wdp58Ec
	IKk6S0c0RhLO4xb4LNCCG3e1QlOmFA1yuIQ6AzB6vxkY4ITyxYG4YcXRTdCUAROPzZCVnt1lYglW2
	F9hiErIC6OE9Mc0sMlv57Mug5kIUCWlAq92uvI/00HBiIE1s6HvFDaU2GohbmgK3JWP//KiZhBNcj
	LTxHkg0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wn3Be-0000000FH62-2zvx;
	Thu, 23 Jul 2026 23:50:46 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wn3Bc-0000000FH5X-1tJi
	for linux-mediatek@lists.infradead.org;
	Thu, 23 Jul 2026 23:50:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1431844415
	for <linux-mediatek@lists.infradead.org>; Thu, 23 Jul 2026 23:50:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF9711F00A3E
	for <linux-mediatek@lists.infradead.org>; Thu, 23 Jul 2026 23:50:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784850644;
	bh=pv0TSuxWUbLfyWJcf83pbitWWIKSiZQYxEH4kwn1yUY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=M5tAzyky6AsZim7L7h8MTkZum1lNIFoFs0UhZOpZXGWFyG9lYeLL39L1TaHV2Ub0T
	 mpgEQDbCgmqRYDjYFVaP2gjt8N8mSMrVX+IVVLG6pHtFBTRyTwQk8IQlr3/2I9z2Mx
	 Sm0oNm51UFnXqfyODCckJKnMBMGH6a/e2gaW4nR5ngtlxo3XYNrv93ppCFSMrvyRWZ
	 buKpKQkbBBcl1T4XrOLssmdqEybohWFL+PCQLPYHvB/vonZyq9StxbLKf/xrU913me
	 t8C644gaiH2bLoJ8v19B+XpftSp4wBcl0wEZgGeCFeD6e6kH7q9eag1qfXxIatnJ6y
	 +/070I7ND34bA==
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-cb5a6aa8760so787602a12.1
        for <linux-mediatek@lists.infradead.org>; Thu, 23 Jul 2026 16:50:43 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpbNOC2gBRVkDMw/WiYUSEDwExynQbIEtWbRflEsSjZaAE2yr3f3FTZ+eN/FPXtQT3nBzLeptr3q3sDqa966Q==@lists.infradead.org
X-Gm-Message-State: AOJu0Yye65XSZE3KQowkKYR48g/xcss8MLSJiY+lnwtZ+k0IVmxc6sN7
	eSL3Dy0k5ebTWcyaeGBwU54EvaJt8Ls9kKQDo7rM0ARUkVIy/DVERxNEHJYLDMHWUrqPEIv2TXe
	Ist3OZ5TzpgGRmlld+MRCZVEXjBso6w==
X-Received: by 2002:a05:6a20:6a06:b0:3c3:a17c:1f77 with SMTP id
 adf61e73a8af0-3c44b245a28mr5768508637.51.1784850643482; Thu, 23 Jul 2026
 16:50:43 -0700 (PDT)
MIME-Version: 1.0
References: <20260713112957.884640-1-lgs201920130244@gmail.com>
In-Reply-To: <20260713112957.884640-1-lgs201920130244@gmail.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Thu, 23 Jul 2026 23:00:25 +0000
X-Gmail-Original-Message-ID: <CAAOTY_8nSZeVSyD9axg+7=j22408Qo6ECUiLVeLSPMnG2vvixQ@mail.gmail.com>
X-Gm-Features: AUfX_mzN_szIsR4Zx-5H9Zr7vUoQGqqfgU7Xy3zndft3JHX6RptvrPoQs8U9ltY
Message-ID: <CAAOTY_8nSZeVSyD9axg+7=j22408Qo6ECUiLVeLSPMnG2vvixQ@mail.gmail.com>
Subject: Re: [PATCH v3] drm/mediatek: mtk_hdmi: Fix DDC adapter double put in v2
To: Guangshuo Li <lgs201920130244@gmail.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, CK Hu <ck.hu@mediatek.com>, 
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Johan Hovold <johan@kernel.org>, 
	stable@vger.kernel.org
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

Guangshuo Li <lgs201920130244@gmail.com> =E6=96=BC 2026=E5=B9=B47=E6=9C=881=
3=E6=97=A5=E9=80=B1=E4=B8=80 =E4=B8=8A=E5=8D=8811:32=E5=AF=AB=E9=81=93=EF=
=BC=9A
>
> mtk_hdmi_common_probe() gets the DDC adapter with
> of_find_i2c_adapter_by_node() and registers a devm action to release the
> adapter device reference with put_device().
>
> The HDMI v2 remove callback also calls i2c_put_adapter() on the same DDC
> adapter. This is not paired with of_find_i2c_adapter_by_node(): it drops
> the adapter device reference before the devm action drops it again, and
> it also puts a module reference that was never taken.
>
> Remove the extra i2c_put_adapter() call and drop the now-empty HDMI v2
> remove callback. The common devm action releases the adapter device
> reference.

Applied to mediatek-drm-fixes [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-fixes

Regards,
Chun-Kuang.

>
> Fixes: 8d0f79886273 ("drm/mediatek: Introduce HDMI/DDC v2 for MT8195/MT81=
88")
> Cc: stable@vger.kernel.org
> Reviewed-by: Johan Hovold <johan@kernel.org>
> Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
> ---

