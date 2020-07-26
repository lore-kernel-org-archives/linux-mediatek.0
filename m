Return-Path: <SRS0=eMNs=BF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23126C433E4
	for <linux-mediatek@archiver.kernel.org>; Sun, 26 Jul 2020 17:00:01 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E0A75206D8
	for <linux-mediatek@archiver.kernel.org>; Sun, 26 Jul 2020 17:00:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eQf8NWre"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E0A75206D8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ravnborg.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=9kkGpY9Iw5mAIhgxM8HtMxj91++uB4P2NXyV5v+FiiI=; b=eQf8NWreZ7GBoyfROwwGvR/Up
	5vAYUEP0E1MR95wlM+R5V1mPsK/MOBZRF2MGmdPF6oTxJG0boEhUTWDngm5rLWjrWLsXJ2r+06OPu
	5Ar6NwtPv5o2uIonUSNAAjTs0RYZoiE4Bgw1kkkOdgqku9L0KnPm+S7PTuMC67qBXmtrXd/PFiYNj
	NlH3rzi+n1GO6YWct7UKFCb1ps4B67Fd7/bXOvFTbXbmSyWbFb4781gvC+Pkf500Gt7WGe6pHoo+D
	ZZRFpRQXeG2/X9z0STC2up8bQf/uUkyZBKmMZDUifdJnUCKxKymJJCs17egRG4QyLFxvwINQAOptI
	1bpFbv4VQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jzk07-0001Zp-Sc; Sun, 26 Jul 2020 16:59:51 +0000
Received: from asavdk4.altibox.net ([109.247.116.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jzk06-0001Yn-94
 for linux-mediatek@lists.infradead.org; Sun, 26 Jul 2020 16:59:51 +0000
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id B617C804BA;
 Sun, 26 Jul 2020 18:59:40 +0200 (CEST)
Date: Sun, 26 Jul 2020 18:59:39 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Jitao Shi <jitao.shi@mediatek.com>
Subject: Re: [PATCH] drm/panel: Fix auo, kd101n80-45na horizontal noise on
 edges of panel
Message-ID: <20200726165939.GA3275923@ravnborg.org>
References: <20200714123332.37609-1-jitao.shi@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200714123332.37609-1-jitao.shi@mediatek.com>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=aP3eV41m c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=mpaa-ttXAAAA:8 a=UV5ITszz9WeBkyDU53UA:9
 a=CjuIK1q_8ugA:10 a=6heAxKwa5pAsJatQ0mat:22
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200726_125950_470436_0FE7B715 
X-CRM114-Status: GOOD (  14.34  )
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
 linux-mediatek@lists.infradead.org, Daniel Vetter <daniel@ffwll.ch>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

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

Applied to drm-misc-fixes.

	Sam

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
