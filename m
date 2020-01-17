Return-Path: <SRS0=2M+Y=3G=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95696C33C9E
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Jan 2020 18:32:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6D48320728
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Jan 2020 18:32:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eX+HBskq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6D48320728
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ravnborg.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DFEw494K7duV25TG6VmE6KCTuz8hEcAtKvrVSfZUteA=; b=eX+HBskqGR84oT
	VKEEfEcen3zOWm66o+8Tw2WAPvNSeuGf3UITkI7n+saI4AxSY/Udf57CUTDKlJLjOXP8D98fnybSw
	zunr42vBctlpfMQWHM8Cpu1O56KP/dijeAn2s9VQxkza7GoG3Sx/BnOw+L17l3KDJqQVAoYOF1+XL
	+oOBh1sZx/F6IPgdieMdQT0kAfpwIj93iGtwP3YGWkbod8ia2Cn1effmQxADPX5AdpRmDqO0HilwH
	q3JYT1Q4tf3r3f7mF4rrvBEnkPoA+TUyaiqtYLaQHoxlfq0zb9XGpAq+bTQQpdJ5y1JDpjexjx6bb
	A1zQizAwPLzzMITsojGw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1isWPR-0003K5-JE; Fri, 17 Jan 2020 18:31:53 +0000
Received: from asavdk3.altibox.net ([109.247.116.14])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1isWPN-0003J7-Cj
 for linux-mediatek@lists.infradead.org; Fri, 17 Jan 2020 18:31:52 +0000
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 8CDEC20026;
 Fri, 17 Jan 2020 19:31:47 +0100 (CET)
Date: Fri, 17 Jan 2020 19:31:46 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Jitao Shi <jitao.shi@mediatek.com>
Subject: Re: [PATCH v9 0/5] add driver for "boe, tv101wum-nl6", "boe,
 tv101wum-n53", "auo, kd101n80-45na" and "auo, b101uan08.3" panels
Message-ID: <20200117183146.GB14298@ravnborg.org>
References: <20200116021511.22675-1-jitao.shi@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200116021511.22675-1-jitao.shi@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=eMA9ckh1 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=e5mUnYsNAAAA:8
 a=3tjGstHQEWMJ4ujXvacA:9 a=CjuIK1q_8ugA:10 a=Vxmtnl_E_bksehYqCbjh:22
 a=pHzHmUro8NiASowvMSCR:22 a=xoEH_sTeL_Rfw54TyV31:22
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200117_103149_612118_6956CFB6 
X-CRM114-Status: GOOD (  14.98  )
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
Cc: srv_heupstream@mediatek.com, David Airlie <airlied@linux.ie>,
 stonea168@163.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, cawa.cheng@mediatek.com,
 Thierry Reding <thierry.reding@gmail.com>, linux-mediatek@lists.infradead.org,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 yingjoe.chen@mediatek.com, eddie.huang@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Jitao.

Thanks for your perseverance on this.
With the minor issue on the binding file resolved everything is now fine
and patches are all applied to drm-misc-next.

Thanks,

	Sam

On Thu, Jan 16, 2020 at 10:15:06AM +0800, Jitao Shi wrote:
> Changes since v8:
>  - merge the panel documents to one.
>  - delay move the drm_panel_of_backlight after drm_panel_init
> 
> Changes since v7:
>  - base drm-misc-next branch
>  - fix document pass dt_binding_check
>  - remove backlight from panel driver
> 
> Changes since v6:
>  - fix boe_panel_init err uninit.
>  - adjust the delay of backlight on.
> 
> Changes since v5:
>  - covert the documents to yaml
>  - fine tune boe, tv101wum-n53 panel video timine
> 
> Changes since v4:
>  - add auo,b101uan08.3 panel for this driver.
>  - add boe,tv101wum-n53 panel for this driver.
> 
> Changes since v3:
>  - remove check enable_gpio.
>  - fine tune the auo,kd101n80-45na panel's power on timing.
> 
> Changes since v2:
>  - correct the panel size
>  - remove blank line in Kconfig
>  - move auo,kd101n80-45na panel driver in this series.
> 
> Changes since v1:
>  - update typo nl6 -> n16.
>  - update new panel config and makefile are added in alphabetically order.
>  - add the panel mode and panel info in driver data.
>  - merge auo,kd101n80-45a and boe,tv101wum-nl6 in one driver
> 
> Jitao Shi (5):
>   dt-bindings: display: panel: Add boe tv101wum-n16 panel bindings
>   drm/panel: support for boe tv101wum-nl6 wuxga dsi video mode panel
>   drm/panel: support for auo,kd101n80-45na wuxga dsi video mode panel
>   drm/panel: support for boe,tv101wum-n53 wuxga dsi video mode panel
>   drm/panel: support for auo,b101uan08.3 wuxga dsi video mode panel
> 
>  .../display/panel/boe,tv101wum-nl6.yaml       |  81 ++
>  drivers/gpu/drm/panel/Kconfig                 |   9 +
>  drivers/gpu/drm/panel/Makefile                |   1 +
>  .../gpu/drm/panel/panel-boe-tv101wum-nl6.c    | 854 ++++++++++++++++++
>  4 files changed, 945 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/boe,tv101wum-nl6.yaml
>  create mode 100644 drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
> 
> -- 
> 2.21.0
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
