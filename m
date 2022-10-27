Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D054ECAAA1
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Oct 2022 23:46:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=paXHZ98aSyfJJ6v60WHxASXnANWrRePFDt5trqmw3pk=; b=rP7E74oHNTrlS4GmGFEK+QgTUI
	WqqqwNud9NmI0nsyHOuSjurc5z85zcHzi8OLYFzWpXkFRbchqv1yHbWAQeNMvb7y9suBUkheFLyqu
	crzuHpyt38yY9xe20fsAPbLlgC78WtfOP2tRu2L2JwVLgRH7vxrEWj1Q1r03qNRtWxg2UCJGdtAhj
	lbL6oZCvz1EZK7kFdOLQRDuO4PfBpqx82udO+wryei44s/Hl8DZAxhIboJ9nzpQTxzoNO5XQjvTY8
	AiPnRWpT2l+vw2AnEdRggMhAciFy/9nLlOQm6LeVPzewHMO7exOAaYnxww5jOLsFxCg23U6NQhZUS
	yTxeVcHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooCa7-00FFqr-TE; Thu, 27 Oct 2022 23:46:39 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooCZu-00FFpT-LV; Thu, 27 Oct 2022 23:46:28 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id D0913CE2907;
	Thu, 27 Oct 2022 23:46:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14589C433D6;
	Thu, 27 Oct 2022 23:46:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1666914382;
	bh=vKyUpa6z1uRmhJcURUFkFkbLGb/GBvfWEJCcrU7tfqo=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=oXT8YtNrSRdfCCoSqjJfjvVD/CTH2tdzsgPEioQDOkJy0Wa41Ye/QlHnbD8jD5pvQ
	 EMNq+ymHApj/JfjgbVPtTdAt3wVL9QWLKOuu4RGnfwTyPRBRy6e7kgX+bsZjrc1BNo
	 0N1rt2MeucxNHbsQo0Egvw4AFBW5q1dAWqt6XhiWoT3+8Dj/1bElZqIzwTZFWjXlLI
	 U2xBEEAq0H+3fcJBsUPW/+UG3mNYA7Y8EHwRZP3tqNz2r4eJt/U0fiv0O3icebuYFg
	 4JMc0SvGf6kTBfU5CHDJ4w5DGxjOQU5yVCz8SX8R38gXtmtDfd0v/nFHftkj3ibdpi
	 OrQpBXaRcNU4g==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20221021104804.21391-3-rex-bc.chen@mediatek.com>
References: <20221021104804.21391-1-rex-bc.chen@mediatek.com> <20221021104804.21391-3-rex-bc.chen@mediatek.com>
Subject: Re: [PATCH v6 2/3] clk: mediatek: Add auxiliary bus support for sysclk reset
From: Stephen Boyd <sboyd@kernel.org>
Cc: runyang.chen@mediatek.com, miles.chen@mediatek.com, wenst@chromium.org, angelogioacchino.delregno@collabora.com, nfraprado@collabora.com, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, Project_Global_Chrome_Upstream_Group@mediatek.com, Bo-Chen Chen <rex-bc.chen@mediatek.com>
To: Bo-Chen Chen <rex-bc.chen@mediatek.com>, matthias.bgg@gmail.com, mturquette@baylibre.com, p.zabel@pengutronix.de
Date: Thu, 27 Oct 2022 16:46:19 -0700
User-Agent: alot/0.10
Message-Id: <20221027234622.14589C433D6@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221027_164626_897185_E963DCD8 
X-CRM114-Status: GOOD (  11.88  )
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

Quoting Bo-Chen Chen (2022-10-21 03:48:03)
> diff --git a/drivers/clk/mediatek/clk-mtk.c b/drivers/clk/mediatek/clk-mt=
k.c
> index 74408849ed86..61b7ee23738a 100644
> --- a/drivers/clk/mediatek/clk-mtk.c
> +++ b/drivers/clk/mediatek/clk-mtk.c
> @@ -444,6 +444,63 @@ void mtk_clk_unregister_dividers(const struct mtk_cl=
k_divider *mcds, int num,
[..]
> +int mtk_reset_controller_register(struct device *dev, const char *name)
> +{
> +       struct auxiliary_device *adev;
> +       int ret;
> +
> +       adev =3D mtk_reset_adev_alloc(dev, name);
> +       if (IS_ERR(adev))
> +               return PTR_ERR(adev);
> +
> +       ret =3D auxiliary_device_add(adev);
> +       if (ret) {
> +               auxiliary_device_uninit(adev);
> +               return ret;
> +       }
> +
> +       return devm_add_action_or_reset(dev, mtk_reset_unregister_adev, a=
dev);

Can we have devm_auxiliary_device_add() that sets the parent and
registers the device?

