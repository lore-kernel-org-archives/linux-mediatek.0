Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93A9DC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 May 2022 16:27:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	MIME-Version:In-Reply-To:References:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=u0T2yZB/7/K3F2ri+MTI0f6nRWyAyUI5Q7XWM+GE/EQ=; b=fVHe+PxQN4Ky8WsOdcqq8WBhSr
	yoFn+7eiJsXlUToo9l7WzKWZBTa8rnwMAQdW2jtfhQgU+tFySwUsrn5C9JlIHG5KcJ+GJeMZRFe3b
	RXcJVUkn2S00WW0IWKqtFKTLFzJiQSwogJb8Sby6L+zsfVvoejslddiNMWX6q6pGoHtorH1pkF/s7
	0pNfEXy6yUtM7QexPa0Oy2iSg5TzM9Pi9Xf1OlgAQx/+Xngx7niejO7FvyTQL7IeidKYGwgSnO+Tg
	2K/Wfhae+nzZSo+z8oWPn/5gF0GAHd6k2wiMzarmasi33uQpgqj+CetaA9dwnlNqlid9878yTZb3D
	P5zjljIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nrizg-008N6y-Fu; Thu, 19 May 2022 16:27:20 +0000
Received: from mail-vs1-xe2a.google.com ([2607:f8b0:4864:20::e2a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrizT-008N0l-6p
 for linux-mediatek@lists.infradead.org; Thu, 19 May 2022 16:27:09 +0000
Received: by mail-vs1-xe2a.google.com with SMTP id e19so5925933vsu.12
 for <linux-mediatek@lists.infradead.org>; Thu, 19 May 2022 09:27:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:user-agent:references:in-reply-to:mime-version:date:message-id
 :subject:to:cc;
 bh=D3BsvTGZmL9aXn8JC2DlxbBhxOaQqmVN5f5pOf4WE4o=;
 b=Wdbve9pVOQfTCQ8qHIZq21Qqz+xsUOAaavE8ZtUJ9EblcqE54EBHnNXjuCxpwYGpor
 x4JgBbxZg77ZEAnCTT0kqlEZ/o/n17D8A0eVw1bfm2qy1z6ki8Rk1os7osw5nwYQtmDJ
 dWe7PFxstS5Yi5ZvCBNqRNNi55N7BlBUXf4UbrdAgQFpVWfVo7+Qk0uy/cnuWKCmsn1F
 B7HDdWZgo2ml5tOL/yDMoTEHgTVr2MA4oll4/SoapPprGkcSufMBge8WouN5+m6vPQ49
 A+4KWf4Mi66zOuv/wwToUPvT+BZC3ilqbBHUO6PSVKpTz/Hmp8QRDEB6XzvnVrGrAt6Y
 o6eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:user-agent:references:in-reply-to
 :mime-version:date:message-id:subject:to:cc;
 bh=D3BsvTGZmL9aXn8JC2DlxbBhxOaQqmVN5f5pOf4WE4o=;
 b=GMkYJ570GgkqcUjDSIA+EMBeH/61glf8o2cBkz0VZqNR0oHcoKmwhEHgWNtKmVXeFN
 hwJjPZZwz9ka6+mcOLEl6zt/ONnIfBjKKMKCzF9VYgqSDx+35MW4oWCtJWJo1OBSte1k
 gALEnjy/L+y8jhrl1U8A5JAvRGwC7St/2kwq7r8Xc4kOm1HQVXHkkqmay2tPPSEJ71hQ
 0xNKfn6jqB8O4UZVyzCqs40P1rL03I9q59F/hJXATOl9iHbJDjhyNy6K0evS0/fCYgDB
 c92cmsxE1sS3DsOWLrYy8QaOEP+eP5BTQMeolbqV86SIX6SvmioVvp01EigNHBs+q1zC
 NZKA==
X-Gm-Message-State: AOAM530ARuci6qklAEdaRBJr6NSy+MdreMrmcnodqTOajLBdMosBWznZ
 +GHMncu3Cz1T+mnewP08ble8Bmbk3CukheY1EOsJpw==
X-Google-Smtp-Source: ABdhPJx+NNr1h6VgTuwMD1Bhi8EcRUBgWUvE0krCGgcnnrPzo4cs17ylt6Dfy/iIo/Qh4cdkDItrCl7KQ2kO/HmmW/M=
X-Received: by 2002:a67:d516:0:b0:335:c0b5:1e5d with SMTP id
 l22-20020a67d516000000b00335c0b51e5dmr2517279vsj.13.1652977620240; Thu, 19
 May 2022 09:27:00 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 19 May 2022 09:26:59 -0700
From: Guillaume Ranquet <granquet@baylibre.com>
User-Agent: meli 0.7.2
References: <20220327223927.20848-1-granquet@baylibre.com>
 <20220327223927.20848-19-granquet@baylibre.com>
 <20220429083933.q3w75q3zuyyuvo4w@houat>
 <CABnWg9tzhZjrdKT4chkDrY-uH8BMUoxyNLUSwfuG6Sv1J+8ddg@mail.gmail.com>
 <20220512074446.ihilbbnbuwesxbbg@houat>
In-Reply-To: <20220512074446.ihilbbnbuwesxbbg@houat>
MIME-Version: 1.0
Date: Thu, 19 May 2022 09:26:59 -0700
Message-ID: <CABnWg9tHRc_7VZ1z6NeMEDfQvxam_xOimBnM=hzBUqkhzPOSCA@mail.gmail.com>
Subject: Re: [PATCH v9 18/22] drm/mediatek: Add mt8195 Embedded DisplayPort
 driver
To: Maxime Ripard <maxime@cerno.tech>
Cc: airlied@linux.ie, angelogioacchino.delregno@collabora.com, 
 chunfeng.yun@mediatek.com, chunkuang.hu@kernel.org, ck.hu@mediatek.com, 
 daniel@ffwll.ch, deller@gmx.de, jitao.shi@mediatek.com, kishon@ti.com, 
 krzk+dt@kernel.org, maarten.lankhorst@linux.intel.com, matthias.bgg@gmail.com, 
 p.zabel@pengutronix.de, robh+dt@kernel.org, tzimmermann@suse.de, 
 vkoul@kernel.org, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-fbdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-phy@lists.infradead.org, markyacoub@google.com, 
 Markus Schneider-Pargmann <msp@baylibre.com>, kernel test robot <lkp@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220519_092707_276055_911D06F4 
X-CRM114-Status: GOOD (  32.51  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 12 May 2022 09:44, Maxime Ripard <maxime@cerno.tech> wrote:
>Hi,
>
>On Wed, May 11, 2022 at 05:59:13AM -0700, Guillaume Ranquet wrote:
>> >> +#include <drm/drm_atomic_helper.h>
>> >> +#include <drm/drm_bridge.h>
>> >> +#include <drm/drm_crtc.h>
>> >> +#include <drm/dp/drm_dp_helper.h>
>> >> +#include <drm/drm_edid.h>
>> >> +#include <drm/drm_of.h>
>> >> +#include <drm/drm_panel.h>
>> >> +#include <drm/drm_print.h>
>> >> +#include <drm/drm_probe_helper.h>
>> >> +#include <linux/arm-smccc.h>
>> >> +#include <linux/clk.h>
>> >> +#include <linux/delay.h>
>> >> +#include <linux/errno.h>
>> >> +#include <linux/kernel.h>
>> >> +#include <linux/mfd/syscon.h>
>> >> +#include <linux/nvmem-consumer.h>
>> >> +#include <linux/of.h>
>> >> +#include <linux/of_irq.h>
>> >> +#include <linux/of_platform.h>
>> >> +#include <linux/phy/phy.h>
>> >> +#include <linux/platform_device.h>
>> >> +#include <linux/pm_runtime.h>
>> >> +#include <linux/regmap.h>
>> >> +#include <sound/hdmi-codec.h>
>> >> +#include <video/videomode.h>
>> >> +
>> >> +#include "mtk_dp_reg.h"
>> >> +
>> >> +#define MTK_DP_AUX_WAIT_REPLY_COUNT 20
>> >> +#define MTK_DP_CHECK_SINK_CAP_TIMEOUT_COUNT 3
>> >> +
>> >> +//TODO: platform/device data or dts?
>> >
>> >DTS :)
>>
>> It's probably going to be a platform_data struct for v10...
>> If I have time, I'll change it to a dts property for v10.
>
>I can't really imagine a case where we would need platform_data
>nowadays. If you have a device tree, then it should be part of the
>binding.
>
>What issue would you like to address by using a platform_data?
>

Ok, I'll migrate to dt then. I didn't realize platform_data were depreciated.

Angelo wants the MAX_LINRATE and MAX_LANES defines to be configurable.
I imagined platform_data would be more appropriate as (per my understanding) the
limitation is associated with a specific SoC.

>> >> +static enum drm_connector_status mtk_dp_bdg_detect(struct drm_bridge *bridge)
>> >> +{
>> >> +	return connector_status_connected;
>> >> +}
>> >
>> >I'm not quite sure what's going on there. You seem to have some support
>> >for HPD interrupts above, but you always report the display as
>> >connected?
>> >
>> >I'd assume that either you don't have HPD support and then always report
>> >it as connected, or you have HPD support and report the current status
>> >in detect, but that combination seems weird.
>>
>> The HPD logic needs more work, some things have been broken when I split
>> the driver into three patches eDP - DP - Audio
>> The assumption at first was that eDP didn't need any HPD handling... but it
>> seems I was wrong and the eDP driver needs to be reworked.
>
>That can be made into a patch of its own if you prefer.
>
>You first introduce the driver without status reporting (always
>returning connected or unknown), and then add the needed bits for HPD.
>
>However, that first patch shouldn't contain the interrupt plumbing and
>so on, it's just confusing.
>

After discussing a while with Mediatek, it appears that hot plug detection
needs to be handled even for eDP... (which is always connected).
So I'll revert to the split I made earlier in v8 where hot plug detection was
part of the eDP patch the addition of the External display port was a
trivial patch [1].

>> >> +static struct edid *mtk_dp_get_edid(struct drm_bridge *bridge,
>> >> +				    struct drm_connector *connector)
>> >> +{
>> >> +	struct mtk_dp *mtk_dp = mtk_dp_from_bridge(bridge);
>> >> +	bool enabled = mtk_dp->enabled;
>> >> +	struct edid *new_edid = NULL;
>> >> +
>> >> +	if (!enabled)
>> >> +		drm_bridge_chain_pre_enable(bridge);
>> >> +
>> >> +	drm_dp_dpcd_writeb(&mtk_dp->aux, DP_SET_POWER, DP_SET_POWER_D0);
>> >> +	usleep_range(2000, 5000);
>> >> +
>> >> +	if (mtk_dp_plug_state(mtk_dp))
>> >> +		new_edid = drm_get_edid(connector, &mtk_dp->aux.ddc);
>> >> +
>> >> +	if (!enabled)
>> >> +		drm_bridge_chain_post_disable(bridge);
>> >
>> >Are you sure we can't get a mode set while get_edid is called?
>> >
>> >If we can, then you could end up disabling the device while it's being
>> >powered on.
>>
>> I'm a bit unsure, I need to spend more time in the drm stack to make sure.
>> I'll get back to you when I have a definitive answer.
>
>So, it looks like it's ok.
>
>get_edid is your implementation of get_modes, which is called by
>drm_helper_probe_single_connector_modes
>
>https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/drm_probe_helper.c#L416
>
>This is the standard implemantion of fill_modes, which is called
>whenever the get_connector ioctl is called (or similar paths, like
>drm_client_modeset_probe)
>
>drm_helper_probe_single_connector_modes is under the assumption that the
>mode_config.mutex is held though, and that the big lock. So it should be
>serialized there.
>
>Just for future proofing though, it would be better to use refcounting
>there. Would runtime_pm work for you there?
>

Thx for looking into this for me.
Not sure runtime_pm works here as it would only refcount if compiled
with CONFIG_PM?
I'd rather use the enabled field as a refcounter instead of a boolean.

Unless I'm totally missing your point?

Thx,
Guillaume.

>> >> +static void mtk_dp_parse_drm_mode_timings(struct mtk_dp *mtk_dp,
>> >> +					  struct drm_display_mode *mode)
>> >> +{
>> >> +	struct mtk_dp_timings *timings = &mtk_dp->info.timings;
>> >> +
>> >> +	drm_display_mode_to_videomode(mode, &timings->vm);
>> >> +	timings->frame_rate = mode->clock * 1000 / mode->htotal / mode->vtotal;
>> >
>> >drm_mode_vrefresh()
>> >
>> >> +	timings->htotal = mode->htotal;
>> >> +	timings->vtotal = mode->vtotal;
>> >> +}
>> >
>> >It's not really clear to me why you need to duplicate drm_display_mode
>> >here?
>> >
>> It's saved to be re-used in mtk_dp_set_msa().
>> It's not ideal, I'll check if I can get the mode directly from mtk_dp_set_msa()
>
>Yeah, it looks like mtk_dp_set_msa() uses fairly straightforward values,
>this will be just as easy with drm_display_mode.
>
>Maxime


[1] https://patchwork.kernel.org/project/linux-mediatek/patch/20220218145437.18563-17-granquet@baylibre.com/

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
