Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39EA3C46CD2
	for <linux-mediatek@archiver.kernel.org>; Sat, 27 Jan 2024 09:57:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UAj93A+QldIc2BlOVJOBkygnNhIiKNVEocFWLbjrq44=; b=xGdttPbkx+/YQubXlhgL7rOR1o
	vDfPa4b7FpKA+xxEknvhVfsp2kLNxNz+TCKDFvSpT6Wvz7ZlBode1C5W0J4xApKRhbREHLCcWo1D0
	2rSpfVGl6Shn+P7u9ex+Nzi8Q8eHLKlPwOwwzuUpWugmXAULVFCwiCG+aoQOZ1XxtpTr4LKGrK4nx
	QfYVs7QVez+k2Io9eoydJkjl1Qmms5gxlBEJP7H6A3DzKp5r8ohyqO+NOkBXLCXaGZFpiNNxzlsi2
	gWmfkdmX1XljxSnSlPbrF/GArsHWwD76AYblp+Puj6Zu4YdAJDsYru9YlSgXCecI5/B3nn+qDjfV8
	YNdfQlgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTfR0-00000007Jxr-3gVy;
	Sat, 27 Jan 2024 09:57:10 +0000
Received: from meesny.iki.fi ([195.140.195.201])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTfQx-00000007JxD-2Bxy;
	Sat, 27 Jan 2024 09:57:08 +0000
Received: from hillosipuli.retiisi.eu (2a00-1190-d1dd-0-c641-1eff-feae-163c.v6.cust.suomicom.net [IPv6:2a00:1190:d1dd:0:c641:1eff:feae:163c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4TMVN020rqzyPp;
	Sat, 27 Jan 2024 11:57:04 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1706349424;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UAj93A+QldIc2BlOVJOBkygnNhIiKNVEocFWLbjrq44=;
	b=NhI2acQ1O4J7xZMn0vxDy8AsXgy5iOSZLbslZXaEFG7Lm3WiP4d9HQgxKlv9pKIZXqfitW
	JX54ndZ8TEsE+QpN/C6fy01whRVK9LqnhbRyzMZUQO5WFLzLYxisKWkTDJx/d8rmHa8Gvi
	TaVyx/W7YDoo8w1ZFsPJSIGVTE0b6Bg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1706349424;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UAj93A+QldIc2BlOVJOBkygnNhIiKNVEocFWLbjrq44=;
	b=m5Afe8MEqZqYfQ7DsoCfsbTinjVAmnmLBU8rNzuv9udyXlHrhZXaS3mEOQHJOqcmiewyzF
	fRgYXOHQjzUTOWlujiymp1Wte6IdetR83dQuN86Ib4/u8wHyoha75sp28/u+e7dkWZFHBk
	fj/dpnp2t7MzQU1oXNFueKAnW3dOws4=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1706349424; a=rsa-sha256; cv=none;
	b=cuM4Wm24bJ+zli7jFhPml/vGiMkLf7Mx4y1JSql7NWzDMObPe8xmwGI1sk58uB95Yih6lJ
	AFsCph2L2PqQDvxd3l2qDs9GVbhsaUZRTB28h1qM7+iUeEJhxm0LUcY0hRcw/XsV+j8DYu
	NZ/tFKPGsRG853g4AKokaRvVeYY6DdI=
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 9319C634C93;
	Sat, 27 Jan 2024 11:57:03 +0200 (EET)
Date: Sat, 27 Jan 2024 09:57:03 +0000
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
Subject: Re: [PATCH 17/17] linux: v4l2-vp9.h: Fix kerneldoc
Message-ID: <ZbTTb-SdK-EubGdc@valkosipuli.retiisi.eu>
References: <20240126-gix-mtk-warnings-v1-0-eed7865fce18@chromium.org>
 <20240126-gix-mtk-warnings-v1-17-eed7865fce18@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240126-gix-mtk-warnings-v1-17-eed7865fce18@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240127_015707_747718_6447A05A 
X-CRM114-Status: UNSURE (   8.17  )
X-CRM114-Notice: Please train this message.
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

On Fri, Jan 26, 2024 at 11:16:16PM +0000, Ricardo Ribalda wrote:
> Kerneldoc cannot understand arrays defined like
> v4l2_frame_symbol_counts.
> 
> Adding an asterisk to the name does do the trick.
> 
> Disable the kerneldoc notation for now, it is already ignored:
> https://docs.kernel.org/search.html?q=v4l2_vp9_frame_symbol_counts

Wouldn't it be nicer to fix kerneldoc instead? It might not be difficult at
all.

Feel free to, but I can also give it a try.

-- 
Regards,

Sakari Ailus

