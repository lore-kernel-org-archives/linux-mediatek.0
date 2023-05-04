Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12353C77B7F
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 May 2023 01:02:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s7NrV4G8na4Xxto46bFuiPDfi4MWEN0iwsnSjgvxz40=; b=QWYzP3fIhha2LflmZuI9zrhRo2
	zuK8TbCG0uSJatgGpcMAUfWayHSRq2PU+AEgq+QeZ2KI3a676ZzvNUo7rxhGRIJ7qJt/rb2F2pJUK
	b5A3dt85Dd+ASHJjIi/uM+U8tqPR/qtOtUMZqbeioiIWV6Ef2Q0mq2xwbr1J8ry2n2yBDymCckMYk
	J1yJZOlC61G+nCb7tl2J3H/WWZJZGzhGI3J/zwbfb9uKgoeXftEX5qHIxOTUg1vOIDN1mZgovLZrz
	JTc+Xq8cq+6HWzfUSxkBGhtbD6cXe9JkWTeDtCZhOC/eNLrARPPkRQOtRbkFupeJxxqHU6l+1W2Xy
	bn9ZCsDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1puNM9-006FdT-2k;
	Thu, 04 May 2023 01:02:01 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1puNM6-006Fcc-2W;
	Thu, 04 May 2023 01:02:00 +0000
Received: from notapiano (unknown [IPv6:2600:4041:5b1a:cd00:524d:e95d:1a9c:492a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id F093E6603050;
	Thu,  4 May 2023 02:01:54 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1683162117;
	bh=QIc5SJMWqFHScIbXxCJ80FSyeGnnxhBPq9Nglpv16dY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GoF7tKks+0r9w3slMFA52UCUjtZji0S1Ro4Z+f0NOCspw0LEGjEyhfuXwdqEPPBpf
	 SobHoYAenMMDr2lVWHc79h7Uf2s2Y9HldVbYu5Aaq2bamlRXs6Uh/3MFwABByfekwj
	 WdOuqPQS27hMEc8e9LxER0LliWjfJqcBfs3OafA0RYS7WeRuiD3bPwHE9a2+JM7Ozq
	 G+kKuTi09O1TfRRAg51BcdpAFUD4iIJ0T+BL2s+X9pnpRGM8JabIsTIBurfXQMlojG
	 jb/rCJ5LASS2Wnxqnrw81mZycTqW4tNO5FuvREGs1fRkx+2ABLIYgdirnRcu+g7gIq
	 3EETfeDuWI7KA==
Date: Wed, 3 May 2023 21:01:51 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: bchihi@baylibre.com
Cc: daniel.lezcano@linaro.org, angelogioacchino.delregno@collabora.com,
	rafael@kernel.org, amitk@kernel.org, rui.zhang@intel.com,
	matthias.bgg@gmail.com, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, rdunlap@infradead.org,
	ye.xingchen@zte.com.cn, p.zabel@pengutronix.de,
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
	wenst@chromium.org, james.lo@mediatek.com, rex-bc.chen@mediatek.com,
	abailon@baylibre.com, amergnat@baylibre.com, khilman@baylibre.com
Subject: Re: [PATCH v2 5/5] thermal/drivers/mediatek/lvts_thermal: Update
 calibration data documentation
Message-ID: <b120f52a-38c4-4f06-86d5-503a67bb1dab@notapiano>
References: <20230425133052.199767-1-bchihi@baylibre.com>
 <20230425133052.199767-6-bchihi@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230425133052.199767-6-bchihi@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230503_180158_949901_0E42B523 
X-CRM114-Status: GOOD (  16.05  )
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

On Tue, Apr 25, 2023 at 03:30:52PM +0200, bchihi@baylibre.com wrote:
> From: Balsam CHIHI <bchihi@baylibre.com>
> 
> Update LVTS calibration data documentation for mt8192 and mt8195.
> 
> Signed-off-by: Balsam CHIHI <bchihi@baylibre.com>
> ---
>  drivers/thermal/mediatek/lvts_thermal.c | 59 ++++++++++++++++++-------
>  1 file changed, 43 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/thermal/mediatek/lvts_thermal.c b/drivers/thermal/mediatek/lvts_thermal.c
> index 8df7b4c72a658..3df4989f9902b 100644
> --- a/drivers/thermal/mediatek/lvts_thermal.c
> +++ b/drivers/thermal/mediatek/lvts_thermal.c
> @@ -531,30 +531,57 @@ static int lvts_sensor_init(struct device *dev, struct lvts_ctrl *lvts_ctrl,
>   * The efuse blob values follows the sensor enumeration per thermal
>   * controller. The decoding of the stream is as follow:
>   *
> - * stream index map for MCU Domain :
> + * MT8195 :
> + * Stream index map for MCU Domain mt8195 :
>   *
> - * <-----mcu-tc#0-----> <-----sensor#0-----> <-----sensor#1----->
> - *  0x01 | 0x02 | 0x03 | 0x04 | 0x05 | 0x06 | 0x07 | 0x08 | 0x09
> + * <-----sensor#0-----> <-----sensor#1----->
> + *  0x04 | 0x05 | 0x06 | 0x07 | 0x08 | 0x09

I don't think you need to remove the controller calibration data from this
comment, even though you don't use it in the code. Could come in handy in the
future.

>   *
[..]
> + * MT8192 :
> + * Stream index map for MCU Domain mt8192 :
> + *
> + * <--------sensor#0---------> <--------sensor#1--------->
> + *  0x04 | 0x05 | 0x06 | 0x07 | 0x08 | 0x09 | 0x0A | 0x0B

Each sensor data is 3 bytes long, just like for MT8195. The fourth byte contains
the controller calibration data, but it is spread across these fourth bytes. I'd
just leave these bytes undocumented for now since they're not currently used.

So,

  + * <-----sensor#0----->        <-----sensor#1----->       
  + *  0x04 | 0x05 | 0x06 | 0x07 | 0x08 | 0x09 | 0x0A | 0x0B

etc.

With that fixed,

Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Thanks,
Nícolas

