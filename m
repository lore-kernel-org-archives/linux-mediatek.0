Return-Path: <SRS0=Vfzs=O6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83144C433F5
	for <linux-mediatek@archiver.kernel.org>; Sun, 10 Oct 2021 17:35:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4FFEF603E5
	for <linux-mediatek@archiver.kernel.org>; Sun, 10 Oct 2021 17:35:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4FFEF603E5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ravnborg.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3Q3RMHLEc5INPPBVZIv8q8l8yZCGxXpcb4ZxaPukE3A=; b=SoKMeuS873z5VB
	nR6znJzg9pf0T3MhscYx8G3mFjytWAAWwgCkyg/2CPKLEEOgbp/FgRjzNV/48msnJg/K3yMbmlXfx
	CxLWfLp1YbWeZmg5aORMbhKH4DpEg4wbAbwokaBtfY7y1qbAjSOhQ5pCci9ThrnEdJsMtmSlGw47y
	FGwB773SzJSw6/5Dmkq4tlHLw3gwFdooDqr7KQV4vOu2qUhF4TtqMBTl7Me0e3eTlXgQio+FV2iyl
	VReHZ4T8UJg5EWUuGu6Q+ABLX0ZzlX9fj0TJtE8doz7NrgkSIYYUhj7lqQNAqyTnShZKB8WBrz96z
	/6JFHtCVIZJHz/HgFyHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mZcjX-007CfZ-Jq; Sun, 10 Oct 2021 17:35:35 +0000
Received: from mx1.smtp.larsendata.com ([91.221.196.215])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mZcjT-007Cdz-M8
 for linux-mediatek@lists.infradead.org; Sun, 10 Oct 2021 17:35:33 +0000
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx1.smtp.larsendata.com (Halon) with ESMTPS
 id 6b5d2bcc-29f0-11ec-9c3f-0050568c148b;
 Sun, 10 Oct 2021 17:35:11 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 2ADED194BA6;
 Sun, 10 Oct 2021 19:35:10 +0200 (CEST)
Date: Sun, 10 Oct 2021 19:35:21 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Rex-BC Chen <rex-bc.chen@mediatek.com>
Cc: thierry.reding@gmail.com, matthias.bgg@gmail.com, airlied@linux.ie,
 daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [v2] drm/panel: panel-simple: Add delay for LG LP120UP1
Message-ID: <YWMkWSi83118QMrz@ravnborg.org>
References: <20211007110547.455-1-rex-bc.chen@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211007110547.455-1-rex-bc.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211010_103531_894470_46E43A03 
X-CRM114-Status: GOOD (  15.44  )
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

Hi Rex-BC
On Thu, Oct 07, 2021 at 07:05:47PM +0800, Rex-BC Chen wrote:
> Add power sequence for LG LP120UP1.
> 
> Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>

Patch failed to apply to drm-misc-next.
Please fix and resend.

	Sam

> ---
>  drivers/gpu/drm/panel/panel-simple.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index 9b6c4e6c38a1..9f6544450b56 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -3045,6 +3045,11 @@ static const struct panel_desc lg_lp120up1 = {
>  		.width = 267,
>  		.height = 183,
>  	},
> +	.delay = {
> +		.prepare = 200,
> +		.enable = 50,
> +		.unprepare = 500,
> +	},
>  	.connector_type = DRM_MODE_CONNECTOR_eDP,
>  };
>  
> -- 
> 2.18.0

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
