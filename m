Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A77AC46CD3
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Dec 2023 14:38:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/RMVDjdy2AMGMArMXCmvLqCMRNUiVOi2O/RLyPtFV+s=; b=ninEe2Wew0uG+KzjKRVwBlB3LT
	jjbyH9y0Ly7e3umQyDhMX4RjFEaLNsZt3PcXME5vHXj3KsViF3tJcFTutfiHrj4QJXYhAEXG2Bsqu
	WxZo6ywYodU6o+4PGf6iiNWMhrOdPYItD8U+u2DMB4nY/VYTNrlfqkWzeHjShC8OXc6h9ixBSpn1U
	IhdLbp1yqYIzvZdFpZnMkkL5QqZz71Zeddcq9UfLZTK853yxPtlpkliDUNi5s/8vEpe3RxegmgZ8d
	K9BqraBHDvIH9biGDe/DkmeCOTDhrEsCE9u7yc10pwD0nU+BWC/CSanCPfQ1OroFojnTivDcjyMRX
	5InrTEew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFEle-00B4Jn-0f;
	Mon, 18 Dec 2023 14:38:50 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFEla-00B4Id-0F;
	Mon, 18 Dec 2023 14:38:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D1CA461027;
	Mon, 18 Dec 2023 14:38:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54F8DC433B7;
	Mon, 18 Dec 2023 14:38:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702910322;
	bh=kSzzS+rE3ZFEys64qw4zoAxJseoPrLHcYBpQolk4UeI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=OLKOMdydbi6vyVhuOEDgdeX5gGnEoJCNZi1PkTEUWYWpp/b6ddUKbFq2O+Yneo5+O
	 /BuXAQ5+QWgW+oOfUZjE6aRujhz5uiXERoAdmu/dmvueV6u5LtQnQa+5tEZeR0/1Wu
	 Dbbqmt3/GTQtKP9MqNJoH7XkyINUAhO1/RlR62UcjlmO3HbgnoS7M1wqT9azJULsk7
	 ehKKzlAfbp0j7y7550kXk4IGR0/8UP+89YRYhP4x9mMQbYda3pjN6ulj8Rsibo69x+
	 7GcA0/w4BQeGKZBf+ju3QBuLhRHlYtbONRjBNCnBKmKWQqJYNDvbKCow4zP2K2Rtxz
	 rSFEePnWh4BUQ==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-50e305530baso1792544e87.3;
        Mon, 18 Dec 2023 06:38:42 -0800 (PST)
X-Gm-Message-State: AOJu0Yze7FtWwmt7yispJDzZj1T9ffshMUi3TsxI5rm8QyTs6rek/Ctf
	EUBv8gtZI4pEwsWHp0DfjYVKNmclUOwVhcBpog==
X-Google-Smtp-Source: AGHT+IFVvXy/HULTWkwoWcQfaNrNUCb4i1BcigWcwb36HZhNpUO1zDKEOTu4PVk3/ddgjO9u+X5Q9oQvmLo6pfDG8Dc=
X-Received: by 2002:a05:6512:3044:b0:50e:1daa:6705 with SMTP id
 b4-20020a056512304400b0050e1daa6705mr3478799lfb.6.1702910320486; Mon, 18 Dec
 2023 06:38:40 -0800 (PST)
MIME-Version: 1.0
References: <20231121142938.460846-1-nfraprado@collabora.com>
In-Reply-To: <20231121142938.460846-1-nfraprado@collabora.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Mon, 18 Dec 2023 22:38:29 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9g-9qTaja6dV5uD4Gbjw3fusRVnmucUeKUYtMpreVORg@mail.gmail.com>
Message-ID: <CAAOTY_9g-9qTaja6dV5uD4Gbjw3fusRVnmucUeKUYtMpreVORg@mail.gmail.com>
Subject: Re: [PATCH v2] drm/mediatek: dp: Add phy_mtk_dp module as pre-dependency
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, kernel@collabora.com, 
	Bo-Chen Chen <rex-bc.chen@mediatek.com>, CK Hu <ck.hu@mediatek.com>, 
	Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>, 
	Dmitry Osipenko <dmitry.osipenko@collabora.com>, Guillaume Ranquet <granquet@baylibre.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231218_063846_216654_D261E169 
X-CRM114-Status: GOOD (  18.01  )
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

Hi, Nicolas:

N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com> =E6=96=BC 2023=E5=B9=
=B411=E6=9C=8821=E6=97=A5 =E9=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=8810:29=E5=AF=
=AB=E9=81=93=EF=BC=9A
>
> The mtk_dp driver registers a phy device which is handled by the
> phy_mtk_dp driver and assumes that the phy probe will complete
> synchronously, proceeding to make use of functionality exposed by that
> driver right away. This assumption however is false when the phy driver
> is built as a module, causing the mtk_dp driver to fail probe in this
> case.
>
> Add the phy_mtk_dp module as a pre-dependency to the mtk_dp module to
> ensure the phy module has been loaded before the dp, so that the phy
> probe happens synchrounously and the mtk_dp driver can probe
> successfully even with the phy driver built as a module.

Applied to mediatek-drm-next [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-next

Regards,
Chun-Kuang.

>
> Suggested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@colla=
bora.com>
> Fixes: f70ac097a2cf ("drm/mediatek: Add MT8195 Embedded DisplayPort drive=
r")
> Signed-off-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
>
> ---
>
> Changes in v2:
> - Added missing Suggested-by tag
>
>  drivers/gpu/drm/mediatek/mtk_dp.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek=
/mtk_dp.c
> index e4c16ba9902d..2136a596efa1 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dp.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dp.c
> @@ -2818,3 +2818,4 @@ MODULE_AUTHOR("Markus Schneider-Pargmann <msp@bayli=
bre.com>");
>  MODULE_AUTHOR("Bo-Chen Chen <rex-bc.chen@mediatek.com>");
>  MODULE_DESCRIPTION("MediaTek DisplayPort Driver");
>  MODULE_LICENSE("GPL");
> +MODULE_SOFTDEP("pre: phy_mtk_dp");
> --
> 2.42.1
>

