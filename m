Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40642C47258
	for <linux-mediatek@archiver.kernel.org>; Sun, 28 Jan 2024 11:01:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KC5P7t4gKrTR0YzDyDWzKYwIv/MVNwJXRJM7IN60R1U=; b=lyk3pp/1DJFgrqMJWNJ4SwrbIR
	iR9OEj2RElc3/vAVC4hxgPDPECOHE3/i9OqfvO83a9lPOfD9kDRXdwBFyB5PXd/WLzckTE1LUezHh
	e9QE/0ylgI+CgQBWDg7M7ZI+a8wx8gs+mPCXlLamNDnpr8+RI1BT+OovWr9jar3qwKua4D45+FxeS
	l5COqpHaiCAWt5z+ibuiibpINsn+RwngODc9frFF2EuQ4ZT+gTS5dopZnc8YsAToVH6TlMXu/MVKR
	UCO8v9mV1YovVn98HaoxQ4WCIczcNssMvW4uvtkJO+KjtIoT+ReFJo+1TRwR7EpVh7/2r2paaWMMz
	wQ9XvJYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rU2um-00000009H9V-14Lj;
	Sun, 28 Jan 2024 11:01:28 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rU2uh-00000009H7Z-3noB;
	Sun, 28 Jan 2024 11:01:25 +0000
Received: from pendragon.ideasonboard.com (aztw-30-b2-v4wan-166917-cust845.vm26.cable.virginm.net [82.37.23.78])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0639A3D9;
	Sun, 28 Jan 2024 11:59:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1706439599;
	bh=5srCU8mALld93XXZWkuO9wczxnN7Mp+AiQKKleufIJY=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=RkhbdvRHlz1v8jg4VujoVEvuFFQwER/Of6VU8hgYvGxSJ6sauMOpigUM9jwIZggbM
	 ovsTDbzG216rVaHmdrHBTfja6Y/1kngp8TZl25L/sIL9hjrprl+/lEEC7ofAXjaoqi
	 ogP2fskaRCqFSgwLOtdxTIoWzpGtryil4ewfj2mk=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240126-gix-mtk-warnings-v1-7-eed7865fce18@chromium.org>
References: <20240126-gix-mtk-warnings-v1-0-eed7865fce18@chromium.org> <20240126-gix-mtk-warnings-v1-7-eed7865fce18@chromium.org>
Subject: Re: [PATCH 07/17] media: i2c: adv748: Fix kerneldoc
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-staging@lists.linux.dev, linux-amlogic@lists.infradead.org, Ricardo Ribalda <ribalda@chromium.org>
To: Alim Akhtar <alim.akhtar@samsung.com>, Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Andrzej Hajda <andrzej.hajda@intel.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Bin Liu <bin.liu@mediatek.com>, Bingbu Cao <bingbu.cao@intel.com>, Bjorn Andersson <andersson@kernel.org>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, Hans Verkuil <hverkuil@xs4all.nl>, Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, Konrad Dybcio <konrad.dybcio@linaro.org>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Matthias Brugger <matthias.bgg@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, Philipp Zab
 el <p.zabel@pengutronix.de>, Ricardo Ribalda <ribalda@chromium.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Tianshu Qiu <tian.shu.qiu@intel.com>, Tiffany Lin <tiffany.lin@mediatek.com>, Vikash Garodia <quic_vgarodia@quicinc.com>, Yunfei Dong <yunfei.dong@mediatek.com>
Date: Sun, 28 Jan 2024 11:01:13 +0000
Message-ID: <170643967334.1879520.13311953581412781310@ping.linuxembedded.co.uk>
User-Agent: alot/0.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240128_030124_108082_B0DB2B63 
X-CRM114-Status: GOOD (  12.11  )
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

Quoting Ricardo Ribalda (2024-01-26 23:16:06)
> The field is gone, remove the documentation.

Looking at 3e89586a64df ("media: i2c: adv748x: add adv748x driver")
confims it was never added. Must have been an old leftover when I
upstreamed.

Thanks for the fix.

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/i2c/adv748x/adv748x.h | 1 -
>  1 file changed, 1 deletion(-)
>=20
> diff --git a/drivers/media/i2c/adv748x/adv748x.h b/drivers/media/i2c/adv7=
48x/adv748x.h
> index 6f90f78f58cf..d2b5e722e997 100644
> --- a/drivers/media/i2c/adv748x/adv748x.h
> +++ b/drivers/media/i2c/adv748x/adv748x.h
> @@ -173,7 +173,6 @@ struct adv748x_afe {
>   *
>   * @endpoints:         parsed device node endpoints for each port
>   *
> - * @i2c_addresses:     I2C Page addresses
>   * @i2c_clients:       I2C clients for the page accesses
>   * @regmap:            regmap configuration pages.
>   *
>=20
> --=20
> 2.43.0.429.g432eaa2c6b-goog
>

