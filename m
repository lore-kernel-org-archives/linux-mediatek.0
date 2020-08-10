Return-Path: <SRS0=/jeW=BU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD074C433DF
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Aug 2020 14:46:35 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AEAEE208A9
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Aug 2020 14:46:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EC8pKKji";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="qZT9QL55"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AEAEE208A9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=//TEM9rVWBbbhD/uXEIDasudNGX8XP8lgvpXs+DzZxY=; b=EC8pKKjiroZ3v7DWRjhSXapk7
	eQU1pQQXutFdJyiCT8ZnoqwY19oC3R/S0kSkoUScF15xkxUkSAtShaEpWJI+ivXGgjO1v+048XmD9
	Jo42fOZZo7LOuuqDzL0M6BPE8mWEK7+7JoOjy+gqdOeDys8yvD7rqwb++VTiilZAycUNk+hjsgod6
	dd4wWsyeikuO1vB9bzNm5nDFP2aGyZtlcnw9ZVg+RkpNZp8kqvWr+Ip+7KPp3PJncKBirSnU8njV5
	qlFfZmjlzYjxx/7usHdvb0H8Ca2Sf/yX6s5FeOkx9t+CWeNnaluVQzTb++7PSOOj7QzSZQsdOI+me
	3lirgkv4g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k5949-0000Fy-HE; Mon, 10 Aug 2020 14:46:21 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k5947-0000DL-Fy; Mon, 10 Aug 2020 14:46:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=ST9uT/svvVM3VjFTpOnQ2kyruMHX89YknoXDFMfmz1Y=; b=qZT9QL55N+ijZXxNUmmIYQWYhb
 Lc0Q5kjGV5uOUCjTc7bCMc1r5n1sVNI8Oi2b7MjyvSM5oW/LNxCYuWqFt24HpwQ+8Bv5r2myUh+iO
 an1I6A9x+qWeG1wWg9BjpojyJfNsS1UIVoc7K23JNUruJVYaxe+ctqarlZIfbVzrAiUJdj4XUBLhW
 VWk54u+046uij8MID3XcTjDwZlfUP5L7MiopALQcI5P55o3ZlKqAJ0gZ3Exfmk18auTFGFmvW8JY3
 kSGXst3aYKKCvg/TPD5IMmcfZBIFb4EYwuakEVJp4vkgSs2rL3Ju523SMsIDCTJi3UP7WDUvRTdTj
 IyEDzyEQ==;
Received: from [2601:1c0:6280:3f0::19c2]
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k593z-0004Lv-91; Mon, 10 Aug 2020 14:46:11 +0000
Subject: Re: [PATCH v1 2/2] drm/bridge: add refactored it6505 driver
To: allen <allen.chen@ite.com.tw>
References: <1597054312-25538-1-git-send-email-allen.chen@ite.com.tw>
 <1597054312-25538-3-git-send-email-allen.chen@ite.com.tw>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <dab6261e-708b-b832-17cb-833023383156@infradead.org>
Date: Mon, 10 Aug 2020 07:46:06 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1597054312-25538-3-git-send-email-allen.chen@ite.com.tw>
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
Cc: Kenneth Hung <Kenneth.Hung@ite.com.tw>, Jitao Shi <jitao.shi@mediatek.com>,
 Daniel Vetter <daniel@ffwll.ch>, Jau-Chih Tseng <Jau-Chih.Tseng@ite.com.tw>,
 Yilun Lin <yllin@google.com>, David Airlie <airlied@linux.ie>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>, Andrzej Hajda <a.hajda@samsung.com>,
 Hermes Wu <Hermes.Wu@ite.com.tw>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Pi-Hsun Shih <pihsun@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>, Jonas Karlman <jonas@kwiboo.se>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 8/10/20 3:11 AM, allen wrote:
> diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
> index 43271c2..a9f49c7 100644
> --- a/drivers/gpu/drm/bridge/Kconfig
> +++ b/drivers/gpu/drm/bridge/Kconfig
> @@ -48,6 +48,13 @@ config DRM_DISPLAY_CONNECTOR
>  	  on ARM-based platforms. Saying Y here when this driver is not needed
>  	  will not cause any issue.
>  
> +config DRM_ITE_IT6505
> +	tristate "ITE IT6505 DP bridge"
> +	depends on OF
> +	select DRM_KMS_HELPER
> +	help
> +	  ITE IT6505 DP bridge chip driver.

Maybe it's just me, but I would appreciate it if somewhere in the
Kconfig entry here, it said DisplayPort instead of just DP.

> +
>  config DRM_LVDS_CODEC
>  	tristate "Transparent LVDS encoders and decoders support"
>  	depends on OF

thanks.
-- 
~Randy


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
