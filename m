Return-Path: <SRS0=0yQJ=AZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 768B1C433E0
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Jul 2020 13:06:05 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 43D30224B0
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Jul 2020 13:06:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="q9G8Afmq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 43D30224B0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ravnborg.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=gzCPhHulw8b5PiAht1e+by0811GUaAhTMObjVP33mAI=; b=q9G8Afmqe1fUR3/pX0nJp05aE
	2PQVwSxK60/V7oZ8d/zjn6Mrks8fJTP6K5ixNwArZM34hvU/oYz1s4VpIGNHopKCAtcQvLumCo0nV
	smla0N4zeW41iXXTq9J0cDkB1AMk3wT0EEQbEJcbKHFdMd/97pJ/8MTSUnusX/4P9UgkXLqcaMNfB
	FtYlc6jFe+QgUV5nbw7ONCsQ+HJYbJb8xDvQpDYD8Oh84l0ViO7eDlKE09vyeGByJvNwy9X3ddzTR
	5Gdqr/Cj9qAyRvIcSe0FGeV/yRgugoRjzuk+lVv0g54NIoK7ShhOl0s+Us8nV88f07i+/7h1Q5hp4
	43/0FIHvg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jvKdA-00009s-5x; Tue, 14 Jul 2020 13:05:56 +0000
Received: from asavdk4.altibox.net ([109.247.116.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jvKd6-000090-RL
 for linux-mediatek@lists.infradead.org; Tue, 14 Jul 2020 13:05:53 +0000
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 8261B804D0;
 Tue, 14 Jul 2020 15:05:48 +0200 (CEST)
Date: Tue, 14 Jul 2020 15:05:46 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Jitao Shi <jitao.shi@mediatek.com>
Subject: Re: [PATCH] drm/panel: Fix auo,kd101n80-45na horizontal noise on
 edges of panel
Message-ID: <20200714130546.GA1588550@ravnborg.org>
References: <20200714123332.37609-1-jitao.shi@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200714123332.37609-1-jitao.shi@mediatek.com>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=aP3eV41m c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=mpaa-ttXAAAA:8 a=al6dfsjdgZPfAsxNZ6YA:9
 a=CjuIK1q_8ugA:10 a=6heAxKwa5pAsJatQ0mat:22
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200714_090553_034504_F651CE49 
X-CRM114-Status: GOOD (  15.09  )
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

Material for -fixes or just -next?

	Sam

On Tue, Jul 14, 2020 at 08:33:32PM +0800, Jitao Shi wrote:
> Fine tune the HBP and HFP to avoid the dot noise on the left and right edges.
> 
> Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> ---
>  drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c b/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
> index 48a164257d18..3edb33e61908 100644
> --- a/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
> +++ b/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
> @@ -615,9 +615,9 @@ static const struct panel_desc boe_tv101wum_nl6_desc = {
>  static const struct drm_display_mode auo_kd101n80_45na_default_mode = {
>  	.clock = 157000,
>  	.hdisplay = 1200,
> -	.hsync_start = 1200 + 80,
> -	.hsync_end = 1200 + 80 + 24,
> -	.htotal = 1200 + 80 + 24 + 36,
> +	.hsync_start = 1200 + 60,
> +	.hsync_end = 1200 + 60 + 24,
> +	.htotal = 1200 + 60 + 24 + 56,
>  	.vdisplay = 1920,
>  	.vsync_start = 1920 + 16,
>  	.vsync_end = 1920 + 16 + 4,
> -- 
> 2.25.1

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
