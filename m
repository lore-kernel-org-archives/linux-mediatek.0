Return-Path: <SRS0=H0vx=GQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10B3EC433DB
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Jan 2021 07:18:08 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A09522313C
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Jan 2021 07:18:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A09522313C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=S0ru8IYyLVuoyhfJvRmxWX7xxgisYYD2xdUbnbHZcIw=; b=OJWpbsbaU78R9QIQmFOZnl/9k
	KalgSqwLszRsjJZgL56g1NUbupn9iPDnQdcxF3anlZwjq5nl9Tpj2sGeVMkTiHmavlKfLr2Cr3x7d
	VAfTjCw4KSzh/u+oCBd3RXzzox09yC2dtYllL6l2ounLqRDGHm6tRq+epI0X1JE3TQyeVoj2f1QyF
	tzsVvhe77fnNIFROHKchQn6X1jK1wwVbEt17x7Yu+aS6ZbOErSzLCzDDVoFppQ027xiYq9a7oNWia
	8KAMy5UflVaNDtQVYEHB8R2+Z7HMRt+373N44Sf3u4dszu7Ab+xvs7CRnYBsMmz7Km+gM8kzPNb9u
	hSuSg3vEA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kzaPf-0004sm-7T; Wed, 13 Jan 2021 07:17:51 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kzaPZ-0004r8-KW; Wed, 13 Jan 2021 07:17:46 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: tomeu) with ESMTPSA id 5C62D1F455D0
Subject: Re: [PATCH v10 0/4] drm/panfrost: Add support for mt8183 GPU
To: Nicolas Boichat <drinkcat@chromium.org>, Rob Herring <robh@kernel.org>,
 Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
References: <20210113060703.3122661-1-drinkcat@chromium.org>
From: Tomeu Vizoso <tomeu.vizoso@collabora.com>
Message-ID: <3fa8f9c5-5956-73fc-e464-4df68a564b64@collabora.com>
Date: Wed, 13 Jan 2021 08:17:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210113060703.3122661-1-drinkcat@chromium.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210113_021745_788754_D1DB109C 
X-CRM114-Status: GOOD (  21.07  )
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
Cc: devicetree@vger.kernel.org, fshao@chromium.org,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, boris.brezillon@collabora.com,
 linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>, hsinyi@chromium.org,
 Matthias Brugger <matthias.bgg@gmail.com>, hoegsberg@chromium.org,
 linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 1/13/21 7:06 AM, Nicolas Boichat wrote:
> Hi!
> 
> Follow-up on the v5 [1], things have gotten significantly
> better in the last 9 months, thanks to the efforts on Bifrost
> support by the Collabora team (and probably others I'm not
> aware of).
> 
> I've been testing this series on a MT8183/kukui device, with a
> chromeos-5.10 kernel [2], and got basic Chromium OS UI up with
> mesa 20.3.2 (lots of artifacts though).

Btw, don't know if you plan to retest with a newer Mesa, but a recent 
master should have pretty good ES 3.0 compliance on the Duet.

Cheers,

Tomeu

> devfreq is currently not supported, as we'll need:
>   - Clock core support for switching the GPU core clock (see 2/4).
>   - Platform-specific handling of the 2-regulator (see 3/4).
> 
> Since the latter is easy to detect, patch 3/4 just disables
> devfreq if the more than one regulator is specified in the
> compatible matching table.
> 
> [1] https://patchwork.kernel.org/project/linux-mediatek/cover/20200306041345.259332-1-drinkcat@chromium.org/
> [2] https://crrev.com/c/2608070
> 
> Changes in v10:
>   - Fix the binding to make sure sram-supply property can be provided.
> 
> Changes in v9:
>   - Explain why devfreq needs to be disabled for GPUs with >1
>     regulators.
> 
> Changes in v8:
>   - Use DRM_DEV_INFO instead of ERROR
> 
> Changes in v7:
>   - Fix GPU ID in commit message
>   - Fix GPU ID in commit message
> 
> Changes in v6:
>   - Rebased, actually tested with recent mesa driver.
> 
> Nicolas Boichat (4):
>    dt-bindings: gpu: mali-bifrost: Add Mediatek MT8183
>    arm64: dts: mt8183: Add node for the Mali GPU
>    drm/panfrost: devfreq: Disable devfreq when num_supplies > 1
>    drm/panfrost: Add mt8183-mali compatible string
> 
>   .../bindings/gpu/arm,mali-bifrost.yaml        |  28 +++++
>   arch/arm64/boot/dts/mediatek/mt8183-evb.dts   |   6 +
>   .../arm64/boot/dts/mediatek/mt8183-kukui.dtsi |   6 +
>   arch/arm64/boot/dts/mediatek/mt8183.dtsi      | 105 ++++++++++++++++++
>   drivers/gpu/drm/panfrost/panfrost_devfreq.c   |   9 ++
>   drivers/gpu/drm/panfrost/panfrost_drv.c       |  10 ++
>   6 files changed, 164 insertions(+)
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
