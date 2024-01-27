Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FA49C46CD2
	for <linux-mediatek@archiver.kernel.org>; Sat, 27 Jan 2024 09:48:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h3j1f2nFT/FM+fCIzcmVTXPL1EIRhYTbwlMX2+s7BIA=; b=RnqpTv/+ta95SVvWA202cUVC7/
	SmbM6pvj71hxsgTjaB6nQzduNoFpt88Lq0/Nl4rotR6o6ByDRv8STUYjd120i6OXEhz+xHeJV1TvX
	O+cs+OSw3UZCcXPzeYOpoJXSyX+tkU6LA4cxr1ztwQKvxLgGPVO1fizWvfXE1+DH8dTCHdP2VYkH1
	pWegfDG8RoFvq8U4v8HOqZL89AIguTBCM8Ou7WYkBOHxjoA1UFhmDQ29p8+D0RIHPT+GWsKYk/e8b
	TBY3A29U4uHZvvOSjx90AoDg2rtv+ENEGikLxxnI9yiU2SrXBN1DX+yhU38WrFvN1rnRgeAp/6/Do
	uUyiqqxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTfIn-00000007Iqj-3U3d;
	Sat, 27 Jan 2024 09:48:41 +0000
Received: from meesny.iki.fi ([195.140.195.201])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTfIi-00000007ImD-0T83;
	Sat, 27 Jan 2024 09:48:38 +0000
Received: from hillosipuli.retiisi.eu (80-248-247-191.cust.suomicom.net [80.248.247.191])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4TMV9q1pKtzyVX;
	Sat, 27 Jan 2024 11:48:15 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1706348900;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=h3j1f2nFT/FM+fCIzcmVTXPL1EIRhYTbwlMX2+s7BIA=;
	b=bu8mtCypj3iKYSK8u3lAX+QQ250DLbOWZj32mwDctcU2VEdE8P9xjEsSnmFGusE95DZD+M
	nZ09JcB1/E79Bse6Dw3zkgw9S+IWYqR4+46NLBBvPUUPQNSdOngS3k6SQfGZmXvBiVv430
	gPhxxOaSpZvgBpeDOfqJL8Dh7lp8L1g=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1706348900;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=h3j1f2nFT/FM+fCIzcmVTXPL1EIRhYTbwlMX2+s7BIA=;
	b=h4ZTQ+TfYqtfZOmMzVQYGWDkCYo25ZZ22GwkWSAK1uv0CNwQuyLIoDMtVulEbeY0XRi1am
	VilpHrGEQ5EO/WBpH0t56i57nuTXNInYwJ6AQbe1CPU/aRoRrIUy1B0MHRnA74IYX6HIdk
	jEVxFlf9SUZNxajkpivFC6iSjR9X/Tk=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1706348900; a=rsa-sha256; cv=none;
	b=uWyNSJYVd7TmfFi961ft1zXeW02/wtihzLSqbhgIJCjkTgT2g3uMjhC5F9d9he4mYO7Avj
	MzjcJNVmHEgiu2R7OCRlHlHMTW9qGuIXKq8WEkLy1y2zX53xsdRqpr5zp3KYFZZEFizv9L
	zrug8y9uME9az3LvAvLOb8qMkl5VuJw=
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 7C8FB634C93;
	Sat, 27 Jan 2024 11:48:14 +0200 (EET)
Date: Sat, 27 Jan 2024 09:48:14 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Tiffany Lin <tiffany.lin@mediatek.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Yunfei Dong <yunfei.dong@mediatek.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Bin Liu <bin.liu@mediatek.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
	Vikash Garodia <quic_vgarodia@quicinc.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-amlogic@lists.infradead.org
Subject: Re: [PATCH 03/17] media: media-entity.h: Fix kerneldoc
Message-ID: <ZbTRXgnBnb-hHKK_@valkosipuli.retiisi.eu>
References: <20240126-gix-mtk-warnings-v1-0-eed7865fce18@chromium.org>
 <20240126-gix-mtk-warnings-v1-3-eed7865fce18@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240126-gix-mtk-warnings-v1-3-eed7865fce18@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240127_014836_433719_5C7A28DB 
X-CRM114-Status: GOOD (  14.83  )
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

Hi Ricardo,

Thanks for the patchset.

On Fri, Jan 26, 2024 at 11:16:02PM +0000, Ricardo Ribalda wrote:
> The fields seems to be documented twice.
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  include/media/media-entity.h | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/include/media/media-entity.h b/include/media/media-entity.h
> index 2b6cd343ee9e..c79176ed6299 100644
> --- a/include/media/media-entity.h
> +++ b/include/media/media-entity.h
> @@ -337,10 +337,6 @@ enum media_entity_type {
>   * @info.dev:	Contains device major and minor info.
>   * @info.dev.major: device node major, if the device is a devnode.
>   * @info.dev.minor: device node minor, if the device is a devnode.
> - * @major:	Devnode major number (zero if not applicable). Kept just
> - *		for backward compatibility.
> - * @minor:	Devnode minor number (zero if not applicable). Kept just
> - *		for backward compatibility.

A similar patch by Randy Dunlap was recently merged. You can drop this one.

>   *
>   * .. note::
>   *
> 

-- 
Kind regards,

Sakari Ailus

