Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 152B3C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Jun 2022 18:17:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X/Z1XjkZhqQBM9elVzkU/gZge4zjfTLHANDR+xGQcpQ=; b=ZtPJwbwAJXMsFN
	3q4eR9Ck6J2eHTCBMBVE4yuUmbbGPez7F0xDVcsJeqgHNI2iRkP81xNXiA9HdVUpuYP8ZdGR0leJ+
	/8NMZZGrcI1LgZ7WUBXeWSU6KsvxxgWcVrneqFB9kPRwkbWa7+7AlIHw/+DAF+hRQWYIkSeFFgwjT
	o5HWiTELkeL81lfSNas4VpNJbimqaygrG1xEBOBBU9Xw8HJ9Yj/kbUF8dq2YxqepEt77fm7FsIdlg
	VTegAcJVqUzfw+5j8u3LkybI1KIoxJw0g3g/hNYlTMGAYzTZjDBnV0GV5jVJFDTC52XvetdLjNGMK
	yWINC+St4iiKLlUoTuoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzMij-003VWB-Gh; Thu, 09 Jun 2022 18:17:25 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzMiY-003VQM-40; Thu, 09 Jun 2022 18:17:15 +0000
Received: from notapiano (unknown [169.150.201.35])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id BE44766017A8;
	Thu,  9 Jun 2022 19:17:02 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1654798624;
	bh=73Y/v8InPphxMIIyYusgiQmgRfQZkIA8g+2zCfS9xd8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=goJymFXpI7vGo2vU57POZtqsHzw1PpoQkonRZaV/x1GeP1CRRfbfwSYD+zZOU0MS4
	 vxqVooUWCc68dlgojJTXXYPSnzjfFkPX8yoUufLCtUoMPPSB/Ff2q4fUIHNdDVpPm4
	 Ei07wTVddxPDxLOvirTqGGp7vix41HO3QUX28RDQ9vslO65rIPNmxzUsAtyFx7lpBn
	 dwZB1AYpPVvh4GTmHx9495CssUjaGqp66NDM7APpD1zZZeuib+Tb2SosDJl5PLgU2T
	 9x4y62bQWke4bSN/3lLtUzXybMVRPfwKuaKWX/XI88PC2XVg1eoQ51BdjbnV672hMP
	 ULDU+5NWSvi5g==
Date: Thu, 9 Jun 2022 14:16:58 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Guodong Liu <guodong.liu@mediatek.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Sean Wang <sean.wang@kernel.org>,
	Sean Wang <sean.wang@mediatek.com>,
	Zhiyong Tao <zhiyong.tao@mediatek.com>, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v1 1/4] pinctrl: add generic driving setup property on
 mt8192
Message-ID: <20220609181658.s5qdm32f5vhwkkao@notapiano>
References: <20220608053909.1252-1-guodong.liu@mediatek.com>
 <20220608053909.1252-2-guodong.liu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220608053909.1252-2-guodong.liu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220609_111714_331631_8394488A 
X-CRM114-Status: GOOD (  18.15  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Guodong,

thank you for the patch.

On Wed, Jun 08, 2022 at 01:39:06PM +0800, Guodong Liu wrote:
> This patch provides generic driving setup, which support
> 2/4/6/8/10/12/14/16mA driving, original driver just set
> raw data setup setting when use drive-strength property

You should mention in the commit message that the dt-binding expects that
drive-strength arguments be passed in mA, but the driver was expecting raw
values. And that this commit changes the driver so that it is aligned with =
the
binding.

Thanks,
N=EDcolas

> =

> Signed-off-by: Guodong Liu <guodong.liu@mediatek.com>
> ---
>  drivers/pinctrl/mediatek/pinctrl-mt8192.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> =

> diff --git a/drivers/pinctrl/mediatek/pinctrl-mt8192.c b/drivers/pinctrl/=
mediatek/pinctrl-mt8192.c
> index acccde9262ba..9faf7001369d 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-mt8192.c
> +++ b/drivers/pinctrl/mediatek/pinctrl-mt8192.c
> @@ -1372,8 +1372,8 @@ static const struct mtk_pin_soc mt8192_data =3D {
>  	.gpio_m =3D 0,
>  	.bias_set_combo =3D mtk_pinconf_bias_set_combo,
>  	.bias_get_combo =3D mtk_pinconf_bias_get_combo,
> -	.drive_set =3D mtk_pinconf_drive_set_raw,
> -	.drive_get =3D mtk_pinconf_drive_get_raw,
> +	.drive_set	=3D mtk_pinconf_drive_set_rev1,
> +	.drive_get	=3D mtk_pinconf_drive_get_rev1,
>  	.adv_pull_get =3D mtk_pinconf_adv_pull_get,
>  	.adv_pull_set =3D mtk_pinconf_adv_pull_set,
>  	.adv_drive_get =3D mtk_pinconf_adv_drive_get,
> -- =

> 2.25.5
> =


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
