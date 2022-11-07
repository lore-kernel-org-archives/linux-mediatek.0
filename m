Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C45DEC4332F
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Nov 2022 15:07:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:MIME-Version:In-Reply-To:References:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=msJlygCwztcKRCpl1OXcVZ463IWdf/JAulr8vPXr8uc=; b=E1HMNRyvhBwxFf//TLHjSzGlCi
	jwWZY3wti34Ixv6ek3Z2x3xIKks7ObI9FhIWmmXarohmVbWcDwgdhG/MIffTkZhXgZCAoEkmYTb46
	EXK5lmGoHkaeGQrCKi8M0Xgx5+8HzcphWqJXGdYq7uEsJfvROeV4bv7heQ6ukdSvJ+RqTV0YzbxmJ
	X362u+mC0so0I1MjzVfnqXlG3Bsnka8mjFeg3kELSRFG/inRH9Qz3AjAzLRtQvouo2wZV7VwUfwJw
	VnEUvf365efLng6zkYYkYGuH7+q70eOIL1439SSJ4sC4qGNAvhxl+t1zI1RSMh4Z9S9EQBQa74yDL
	eW2yeaaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1os3iI-00FXkr-Dh; Mon, 07 Nov 2022 15:07:02 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1os3hV-00FXJQ-O7
	for linux-mediatek@lists.infradead.org; Mon, 07 Nov 2022 15:06:16 +0000
Received: by mail-lf1-x12d.google.com with SMTP id d6so17140666lfs.10
        for <linux-mediatek@lists.infradead.org>; Mon, 07 Nov 2022 07:06:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:mime-version:in-reply-to:references
         :user-agent:from:from:to:cc:subject:date:message-id:reply-to;
        bh=msJlygCwztcKRCpl1OXcVZ463IWdf/JAulr8vPXr8uc=;
        b=kw/1CVr1CvRVBN7ppDzHuBwXNvTpjmdU+210GrNG3Nc4b7E6jprzvZIHSr8pmgM/I3
         Ooumonhq2AA5Z/bDkgOMmb2uuM0HYdIO4QfNzuv00lDToNyHDOw36qPCZqLGXo4Ny3Rv
         8GkkhYRZVPrpYZIyCy0c/BpWEycFDPgrnqVXz0/oGqCFsBGaXEqVwjB2ectF8uoWJPDw
         cqsZOPBXQ8MKkKJ4OYLi5exG/8EufN0ybQVFN2TtQD6A6dL7rQVdsIKxIZG1aTs5d6oI
         3O2K+mIJ1o8KaZwC8/MgU6kRcp+hsoW+as5mFzAkuL6pYASSSpWkf57h2MlRn8yzVn5+
         jiqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:mime-version:in-reply-to:references
         :user-agent:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=msJlygCwztcKRCpl1OXcVZ463IWdf/JAulr8vPXr8uc=;
        b=ZLgOscLkrmKbQl5qqn61Cw3aybZ9KmydvLTr5FVMVxrWkDfwIYhs3NVeWBe4pRqqDK
         JJPP8YxwhI2UNfUWFrWjvsSkHHYq5NRTm6oVxrKOx1r9FReE08VzeREAikwSoBwf7Wvk
         9iq175qZd+q0jzjjDvzmliFt3lSdfryD5EyIjaZIkXoQKaTmvDGspDpG49wdrU0CWEqA
         8H+3dGOvS/f4Vvo7icOzfBNbGq4NatXTFp5IPO19vvvlaxuxFdXVEaeLa0CJxvxPAG/p
         C59Osm8sfKLMHTzxyd7GwSquHEeP6Fnv8ol+ieRA5rLTale/6jD00zOE5EliONCQHCui
         7PhQ==
X-Gm-Message-State: ACrzQf31NQBvgVe4eEa4vpRWndI+JIXxHCFUqAm47T3c2K62mhQ0i8Yq
	AyooD1meol65/taF8irJHftmZKGXNpoNVNOaHz1qDg==
X-Google-Smtp-Source: AMsMyM4/hRdV6PUceQjYTAr5VlJwQq0PJWF/plhX/TikjJfOvo1/P9XLmwGDedaShVJ1ltmLlfA5kP20+nvh1Rr9HWY=
X-Received: by 2002:a05:6512:a93:b0:4a2:a5b3:fbb4 with SMTP id
 m19-20020a0565120a9300b004a2a5b3fbb4mr17334447lfu.346.1667833571328; Mon, 07
 Nov 2022 07:06:11 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 7 Nov 2022 15:06:10 +0000
From: Guillaume Ranquet <granquet@baylibre.com>
User-Agent: meli 0.7.2
References: <20220919-v3-0-a803f2660127@baylibre.com> <20220919-v3-12-a803f2660127@baylibre.com>
 <988b0a7a-69bb-34e4-e777-1d9516221077@collabora.com>
In-Reply-To: <988b0a7a-69bb-34e4-e777-1d9516221077@collabora.com>
MIME-Version: 1.0
Date: Mon, 7 Nov 2022 15:06:10 +0000
Message-ID: <CABnWg9t0KznQG1Mix=jSchk99Xj-h3Bf28WTaP9gc8AC6yLr7Q@mail.gmail.com>
Subject: Re: [PATCH v3 12/12] drm/mediatek: dpi: Add mt8195 hdmi to DPI driver
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Kishon Vijay Abraham I <kishon@ti.com>, Rob Herring <robh+dt@kernel.org>, 
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, Chunfeng Yun <chunfeng.yun@mediatek.com>, 
	Jitao shi <jitao.shi@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Vinod Koul <vkoul@kernel.org>, CK Hu <ck.hu@mediatek.com>, Daniel Vetter <daniel@ffwll.ch>, 
	David Airlie <airlied@gmail.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, linux-arm-kernel@lists.infradead.org, 
	stuart.lee@mediatek.com, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
	devicetree@vger.kernel.org, mac.shen@mediatek.com, 
	linux-phy@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221107_070613_821831_9809BFD5 
X-CRM114-Status: GOOD (  15.77  )
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

On Mon, 07 Nov 2022 12:20, AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>Il 04/11/22 15:09, Guillaume Ranquet ha scritto:
>> Add the DPI1 hdmi path support in mtk dpi driver
>>
>> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
>> ---
>>   drivers/gpu/drm/mediatek/mtk_dpi.c      | 143 ++++++++++++++++++++++++++++++--
>>   drivers/gpu/drm/mediatek/mtk_dpi_regs.h |   5 ++
>>   2 files changed, 141 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
>> index 508a6d994e83..8052b47042b8 100644
>> --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
>> +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
>> @@ -14,7 +14,10 @@
>>   #include <linux/of_graph.h>
>>   #include <linux/pinctrl/consumer.h>
>>   #include <linux/platform_device.h>
>> +#include <linux/reset.h>
>>   #include <linux/types.h>
>> +#include <linux/regmap.h>
>> +#include <linux/mfd/syscon.h>
>>
>>   #include <video/videomode.h>
>>
>> @@ -65,10 +68,14 @@ struct mtk_dpi {
>>   	struct drm_bridge *next_bridge;
>>   	struct drm_connector *connector;
>>   	void __iomem *regs;
>> +	struct reset_control *reset_ctl;
>>   	struct device *dev;
>>   	struct clk *engine_clk;
>> +	struct clk *dpi_ck_cg;
>>   	struct clk *pixel_clk;
>> +	struct clk *dpi_sel_clk;
>>   	struct clk *tvd_clk;
>> +	struct clk *hdmi_cg;
>
>I admit that I didn't really check these clocks, but judging by the names,
>it is highly possible that one (or more) of them are supposed to be parents
>of some others.
>
>The first suspicious ones are dpi_ck_cg and dpi_sel_clk: please check.
>
>I'm also not sure about the hdmi_cg, shouldn't the DPI have a HDMI port in
>the graph that you'd declare in devicetree?
>
>Besides... you're doing a lot of work to check if (is_internal_hdmi) for
>power up/down paths, but seeing that you're introducing this change after
>adding the HDMI driver makes me mostly sure that the internal hdmi that we're
>talking about here is the one that is managed by the HDMIV2 driver... and
>this means that you should really, really, really rely on connecting inputs
>and outputs the right way in the devicetree, as that will most probably make
>you able to write practically 0 code to manage power for the DPI... and may
>also remove the need of adding the hdmi_cg clock here...
>
>Regards,
>Angelo
>
>

I don't have access to a clock tree documentation or anything that permits
me to answer those questions with confidence. I'll ask mediatek for some input
and I'll also check how those clocks are declared in the clock framework.

You are right in assuming that the "is_internal_hdmi" is in fact the V2 IP.
I like the idea of removing code, I'll try to make sense of your suggestion
and see if there's anything I can do better for v4.

Thx,
Guillaume.

