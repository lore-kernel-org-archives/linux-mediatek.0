Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FA47C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Jun 2022 12:12:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u2O9St6/cp2sLtIArT2+QmDPPlECD5AIo6tjm9d2/I0=; b=t35rcV28Ne0qduFbEs8z7UA5OD
	r9BmAQMHSQ/x7Q76rbS78tjPJVO5UlIJyhHjY/ow1HBrUcsrEadJtyFXXJXo96IuqB1/slzcTjkKJ
	YdqdYYkRtfB9v/EPj8bwmgBz8AF+Fsob7Hylwwhj8FQz9RPpYL5KLJgLvbHlWivfIPQXIv/mQvV9N
	RiG6yxGOurhfyO13KXD2eLZyIMlGXSgn4DgxdFo8/uo8xGUJWFFQGeZN0OdA/FsfXdNVv0FU88ZLL
	skiIKW+HBJGLircSoIcyttZf3z2iT/ffZYTT7KIjFCYGTIFFEvez7ykv+l91Sr3WN/4cdcXv02rzI
	GMIJ66ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3cjm-005Eqt-AS; Tue, 21 Jun 2022 12:12:06 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3cjN-005EdQ-Ue; Tue, 21 Jun 2022 12:11:44 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id C68D96601795;
	Tue, 21 Jun 2022 13:11:39 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1655813500;
	bh=DKwtRGko3s5x/gAEoSQN2wLREgvcMu85ngMm3S7JYTo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=RU8k6ptkWXi/VlsfNEeonqcHZ+3DSgxSgiDRQ67KyoHDfrOWVfRB77VoeXy0YqlA2
	 Mandvf5OUdDTtzOGPfvBSjD9pj0KNxEnA3flVT7hfINGK44mnlcozfLAbl8AOuGeLR
	 Yfkahl2xmpLifqJrbwMUFptUspYq79F+ffMQcR3a0UBkZj1xwcS8JEEk5PpcctE1UC
	 Pc78W8mcAmAwhw4IczNjEBJsyZAyBtQmmiRYM+1ktwnkevNVusS6LpOp9/EOmKxx/+
	 QnT6ycnQo2XkQRWrWg3q6NtdABnJh0gvD2wlMAdzUOkL6gksxEnl/33+kA+kJ1VbBK
	 BrTtygaCgqV5w==
Message-ID: <55c98626-9b95-7721-94cf-8c471580a53b@collabora.com>
Date: Tue, 21 Jun 2022 14:11:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v13 12/14] drm/mediatek: dpi: add config to control
 setting of direct connection to pins
Content-Language: en-US
To: Bo-Chen Chen <rex-bc.chen@mediatek.com>, chunkuang.hu@kernel.org,
 p.zabel@pengutronix.de, daniel@ffwll.ch, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com, airlied@linux.ie
Cc: msp@baylibre.com, granquet@baylibre.com, jitao.shi@mediatek.com,
 wenst@chromium.org, ck.hu@mediatek.com, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220621113732.11595-1-rex-bc.chen@mediatek.com>
 <20220621113732.11595-13-rex-bc.chen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220621113732.11595-13-rex-bc.chen@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220621_051142_164929_2B01762A 
X-CRM114-Status: GOOD (  12.87  )
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

Il 21/06/22 13:37, Bo-Chen Chen ha scritto:
> MediaTek dpi supports direct connection to pins while dp_intf does not
> support. Therefore, add a config "support_direct_pin" to control this.
> 
> Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
> ---
>   drivers/gpu/drm/mediatek/mtk_dpi.c | 17 +++++++++++++----
>   1 file changed, 13 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
> index 438bf3bc5e4a..ef7f828a4b1e 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
> @@ -129,6 +129,8 @@ struct mtk_dpi_yc_limit {
>    * @is_ck_de_pol: Support CK/DE polarity.
>    * @swap_input_support: Support input swap function.
>    * @color_fmt_trans_support: Enable color format transfer.
> + * @support_direct_pin: Dpi can directly connect pins, and enable this config
> + *			to do this.

@support_direct_pin: IP supports direct connection to pins

or

@support_direct_pin: IP has direct connection to DP pins

or

@support_direct_pin: IP connects directly to DP pins

pick one, after which:

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



