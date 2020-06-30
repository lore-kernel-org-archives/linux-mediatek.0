Return-Path: <SRS0=AAZc=AL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C789C433DF
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Jun 2020 14:34:20 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 18DC420672
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Jun 2020 14:34:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SLgce0Ye"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 18DC420672
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=9QPIRisn7fb6IRCChWsHWnAZY8utQdShZLq+c9zKiwU=; b=SLgce0Ye1LkaV4MbFnS+02D0T
	Lse4DhNkSw3+NDNBpt3bhkWHGEdpAB0qESv4Of5MQiqIQH+me9gXaMYUby/SUPml3seCq3zwF8FM1
	n4BIhZ8rR6EM661lD3O7Undv8XkhYcRlofVZc9R2JQ9njebTNB7O7tL9e3Mpw21Qk08rglRt3OOSZ
	txgA7Ayh0WR1Jo3h5k9RNM3G++XsrSNoO1x/MwLM/olHHStAtSzWvCdnNg7YkP5ENZ86lrytV1z8I
	Etnf54lIwoiUmnGZYdrsEIMfIcogtzMR2m51jeRTaintFmKVLL3aMgdfbGd6I8UT8QJ/iXfzJ8Us0
	n7t69Pk8Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jqHKs-0004c1-DW; Tue, 30 Jun 2020 14:34:10 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jqHKp-0004bM-JE; Tue, 30 Jun 2020 14:34:08 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: eballetbo) with ESMTPSA id 7ACC42A4ED6
Subject: Re: [RESEND PATCH v4 0/7] Convert mtk-dsi to drm_bridge API and get
 EDID for ps8640 bridge
To: Sam Ravnborg <sam@ravnborg.org>
References: <20200615203108.786083-1-enric.balletbo@collabora.com>
 <20200620213302.GC74146@ravnborg.org>
From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Message-ID: <593a4666-d6aa-7d16-f3a0-ba3713047d84@collabora.com>
Date: Tue, 30 Jun 2020 16:33:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200620213302.GC74146@ravnborg.org>
Content-Language: en-US
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>, drinkcat@chromium.org,
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Andrzej Hajda <a.hajda@samsung.com>,
 linux-mediatek@lists.infradead.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, hsinyi@chromium.org,
 matthias.bgg@gmail.com, Collabora Kernel ML <kernel@collabora.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Sam, Chun-Kuan,

On 20/6/20 23:33, Sam Ravnborg wrote:
> Hi Enric
> 
> On Mon, Jun 15, 2020 at 10:31:01PM +0200, Enric Balletbo i Serra wrote:
>> (This resend is to fix some trivial conflicts due the merge window)
>>
>> The PS8640 dsi-to-eDP bridge driver is using the panel bridge API,
>> however, not all the components in the chain have been ported to the
>> drm_bridge API. Actually, when a panel is attached the default panel's mode
>> is used, but in some cases we can't get display up if mode getting from
>> eDP control EDID is not chosen.
>>
>> This series address that problem, first implements the .get_edid()
>> callback in the PS8640 driver (which is not used until the conversion is
>> done) and then, converts the Mediatek DSI driver to use the drm_bridge
>> API.
>>
>> As far as I know, we're the only users of the mediatek dsi driver in
>> mainline, so should be safe to switch to the new chain of drm_bridge API
>> unconditionally.
>>
>> The patches has been tested on a Acer Chromebook R13 (Elm) running a
>> Chrome OS userspace and checking that the valid EDID mode reported by
>> the bridge is selected.
>>
>> Changes in v4:
>> - Remove double call to drm_encoder_init(). (Chun-Kuang Hu)
>> - Cleanup the encoder in mtk_dsi_unbind(). (Chun-Kuang Hu)
>>
>> Changes in v3:
>> - Replace s/bridge/next bridge/ for comment. (Laurent Pinchart)
>> - Add the bridge.type. (Laurent Pinchart)
>> - Use next_bridge field to store the panel bridge. (Laurent Pinchart)
>> - Add the bridge.type field. (Laurent Pinchart)
>> - This patch requires https://lkml.org/lkml/2020/4/16/2080 to work
>>   properly.
>> - Move the bridge.type line to the patch that adds drm_bridge support. (Laurent Pinchart)
>>
>> Changes in v2:
>> - Do not set connector_type for panel here. (Sam Ravnborg)
>>
>> Enric Balletbo i Serra (7):
>>   drm/bridge: ps8640: Get the EDID from eDP control
>>   drm/bridge_connector: Set default status connected for eDP connectors
>>   drm/mediatek: mtk_dsi: Rename bridge to next_bridge
>>   drm/mediatek: mtk_dsi: Convert to bridge driver
>>   drm/mediatek: mtk_dsi: Use simple encoder
>>   drm/mediatek: mtk_dsi: Use the drm_panel_bridge API
>>   drm/mediatek: mtk_dsi: Create connector for bridges
> 
> Patch seems ready to apply. Will they be applied to a mediatek tree
> or to drm-misc-next?
> Or shall we take the first two patches via drm-misc-next, and the
> remaning via a mediatek tree? (I hope not)
> 

I think the only concern is from Chun-Kuan regarding patch 7/7 "drm/mediatek:
mtk_dsi: Create connector for bridges" whether we should support the old API or
not, but the discussion stalled.

Thanks,
 Enric



> 	Sam
> 
> 
>>
>>  drivers/gpu/drm/bridge/parade-ps8640.c |  12 ++
>>  drivers/gpu/drm/drm_bridge_connector.c |   1 +
>>  drivers/gpu/drm/mediatek/mtk_dsi.c     | 269 ++++++++-----------------
>>  3 files changed, 97 insertions(+), 185 deletions(-)
>>
>> -- 
>> 2.27.0
>>
>> _______________________________________________
>> dri-devel mailing list
>> dri-devel@lists.freedesktop.org
>> https://lists.freedesktop.org/mailman/listinfo/dri-devel
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
