Return-Path: <SRS0=Yo4y=AQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29CFFC433E0
	for <linux-mediatek@archiver.kernel.org>; Sun,  5 Jul 2020 08:07:00 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EA4F32075D
	for <linux-mediatek@archiver.kernel.org>; Sun,  5 Jul 2020 08:06:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VBXfkcsi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EA4F32075D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ravnborg.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=/hYWc9SP2VKFeVzXcpDDc2Uunpp0VY3VjzabqzXlEAY=; b=VBXfkcsiC03A8s3lOcMPIAF2Q
	sPZE9gXVyLm/4A7s1XF8FPkG2jWK+ya0c5w4M3X2TpsSR+49eupblngxAQpPMN++j4prCWRCNrh1z
	RgXTgrpl2V2LRpYOV8Ace7ZiKvnmEDRZ2ysIXlPE9PTCk7sB4wMKaIhXmb1VpIX0kof2AJF4WQ1JG
	xmNmNrIuL8YnAfJyLOxU3Droz3ReFjByRjaXkN2pPvIhnIVUtlW4w3dQy5QRGlvxvctTDtA9BWIdY
	ZoWrbuXuoYCOa3WwzN+ISVFM5lW23m3DSL37vtI4hPmb51F3PZy7SHKLoQ5TSDtV16ldMg/l0tzuC
	HVSvjl/3Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jrzfl-0007Wy-D4; Sun, 05 Jul 2020 08:06:49 +0000
Received: from asavdk4.altibox.net ([109.247.116.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jrzfj-0007Vw-K4
 for linux-mediatek@lists.infradead.org; Sun, 05 Jul 2020 08:06:48 +0000
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 97B27804E6;
 Sun,  5 Jul 2020 10:06:38 +0200 (CEST)
Date: Sun, 5 Jul 2020 10:06:37 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Jitao Shi <jitao.shi@mediatek.com>
Subject: Re: [PATCH] drm/panel: auo,b116xw03: fix flash backlight when power on
Message-ID: <20200705080637.GA1745670@ravnborg.org>
References: <20200703095113.55712-1-jitao.shi@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200703095113.55712-1-jitao.shi@mediatek.com>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=aP3eV41m c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=mpaa-ttXAAAA:8 a=zYKW7BbRKYs78E-HfYEA:9
 a=CjuIK1q_8ugA:10 a=6heAxKwa5pAsJatQ0mat:22
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200705_040647_799046_1ADA25A4 
X-CRM114-Status: GOOD (  13.95  )
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
Cc: David Airlie <airlied@linux.ie>, huijuan.xie@mediatek.com,
 stonea168@163.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 linux-mediatek@lists.infradead.org, Daniel Vetter <daniel@ffwll.ch>,
 ck.hu@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Jitao.

On Fri, Jul 03, 2020 at 05:51:13PM +0800, Jitao Shi wrote:
> Delay the backlight on to make sure the video stable.
> 
> Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> ---
>  drivers/gpu/drm/panel/panel-simple.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index 3ad828eaefe1..18f34f286d3d 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -734,6 +734,9 @@ static const struct panel_desc auo_b116xw03 = {
>  		.width = 256,
>  		.height = 144,
>  	},
> +	.delay = {
> +		.enable = 400,
> +	},
>  };
>  
>  static const struct drm_display_mode auo_b133xtn01_mode = {

Patch did not apply to drm-misc-next.
Please update - and when you do so also add:
.bus_flags
.bus_format
.connector_type

So we have this panel properly defined.

	Sam

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
