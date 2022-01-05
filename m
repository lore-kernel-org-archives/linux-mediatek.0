Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92A4DC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Jan 2022 10:45:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HXu+zTlJAbIrMfTL7u/Va7uNBPyx6EvayesmlPFHue4=; b=pmwe0VKcs8rw3ohysdczB5tQYt
	bb1Cr0VVhCOIIkGP/JAVmV5w0YqkOFxdjE9ZCCdsFrFZq2JnTHpC9z2oRBTA0rx3lSy1Lmkucq04C
	Wxo+UMU2psoLAi8CgOIBvjpQp5Ojx0LL6Xrxu/rGhIo8ZGStLeD44eV5pD8ZS4IBZy2fPvXmF/eWX
	opaqG9hRhk8r3vbD7xr3/fVB7q84lLL5g1a+fRDvWbYlm284sipMvGK84agfoAYZrpjUcWz9ohAM0
	79GtKrJNxmeHUw8WcYsbCFUNqHY/QwTrozm8z9fsYEv+Jq9QXd/+LvY3QQa9wLvoWgd7JHdXn6wqx
	1wkAmUsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n53nC-00EYu3-MH; Wed, 05 Jan 2022 10:45:18 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n53mz-00EYpp-Si; Wed, 05 Jan 2022 10:45:07 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 5D6B31F444D6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1641379504;
 bh=j5jKYJLd2HHKiewIUKNMRt+js9u9s0ejQWXJ1s60ryk=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=BOyoPyVKMtE0zA0Cc1bsSHidcURJQGgB54S3tqNbWy+/3DAigDdUmHz0JNJueMiUx
 DM4ttHr38VthFPfpAMHfdZiiibAln9cd3JP5/Gzd2PbbPtg8+mJ6gWKut30fbz41QY
 kUD/MNRiEqthNTLWYqIBqtCRT+7PPw2OV0zQcxKP36uweA8bClsHIJgUC1Qb8Ol8BZ
 AnyKZLDlYWqqe45OAHoRKmrVTJCW+YP+YIqr17F76/6OOyJklyKmjsy/miOoEIhksX
 BKW+Brk0JAY8rhA7q679hcI026p42Ga9VkacyOlAcdTOrOVBIGsGmp20ju4/lBwVlT
 nAFzQ7zZGtiZA==
Subject: Re: [PATCH v10] drm/bridge: add it6505 driver
To: allen <allen.chen@ite.com.tw>
Cc: Hsin-Yi Wang <hsinyi@google.com>,
 Jau-Chih Tseng <Jau-Chih.Tseng@ite.com.tw>,
 Kenneth Hung <Kenneth.Hung@ite.com.tw>, Hermes Wu <Hermes.Wu@ite.com.tw>,
 Hsin-yi Wang <hsinyi@chromium.org>, Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>
References: <20211014033031.38459-1-allen.chen@ite.com.tw>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <9513a22c-5b84-88d9-ff5d-ac071df53ba3@collabora.com>
Date: Wed, 5 Jan 2022 11:45:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211014033031.38459-1-allen.chen@ite.com.tw>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220105_024506_137558_A67DF54C 
X-CRM114-Status: GOOD (  19.95  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 14/10/21 05:30, allen ha scritto:
> This adds support for the iTE IT6505.
> This device can convert DPI signal to DP output.
> 
> From: Allen Chen <allen.chen@ite.com.tw>
> Tested-by: Hsin-yi Wang <hsinyi@chromium.org>
> Signed-off-by: Hermes Wu <hermes.wu@ite.com.tw>
> Signed-off-by: Allen Chen <allen.chen@ite.com.tw>
> ---
> This patch depends on https://patchwork.kernel.org/project/linux-mediatek/patch/20210722062246.2512666-4-sam@ravnborg.org/
> ---
>   drivers/gpu/drm/bridge/Kconfig      |    8 +
>   drivers/gpu/drm/bridge/Makefile     |    1 +
>   drivers/gpu/drm/bridge/ite-it6505.c | 3335 +++++++++++++++++++++++++++
>   3 files changed, 3344 insertions(+)
>   create mode 100644 drivers/gpu/drm/bridge/ite-it6505.c

Hello Allen,

since the dependency that you mentioned seems to be requiring some time to get
merged in, can you please open-code the call to drm_bridge_new_crtc_state() as
to stop requiring the commit you pointed to?

We can perhaps update this driver later, whenever the series you mentioned will
get applied.

The reason for this request is due to a breakage on MT8183 Kukui: since DPI is
supported in the drm-mediatek driver for this SoC, on platforms that are using
a DSI<->DP/eDP bridge, a probe failure occurs for the DPI0 component.
Leaving apart that drm-mediatek should be fixed to account for this as a non
critical error (and keep going with DSI only, simply ignoring DPI0), the Kukui
family of devices do have this functionality and it should be brought up as
soon as possible at this point - especially since the driver that you've sent
is ok to have.

Looking forward to see a v11 without unsatisfiable dependencies!

Thank you.

Regards,
- Angelo

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
