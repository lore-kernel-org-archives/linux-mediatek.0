Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21036C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Mar 2022 11:52:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MHd0l7mdjeoaTxbH8sAIcLSeZe+dgjZxyvmDfm/eXPE=; b=g3EMVZaX45cPux
	Zj6Y7C08N/+acHDaiV4l7nhRIBjGiL3ugC7F7OYMLvXhvQnWQMMW2E6LdkIFZZDEbAI9pc04dPqoP
	ab7fJHml58tKQrxz+Rx9oqNspfdkwnrcSF1dvtrFG48pFDTV1E8mLycIQ/A0gpoMnb0ulywhogvMz
	qyCG+deaC3ZS1rxizhH2eQjTOYd7LoeBuT9EFIwwpvrwMmTVw1H7EyWfHQI5IzD+tHPKCHOyYSjO4
	vZi9d+1/RF6MASnZFLB1l6n2nESTcR8UuMmh45ZdghnnjMM8ec6HcJoThJvvD/FSSmkqOkfgIC3qa
	+lvKwcNM6pOaLukNvMjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nQ6Tq-009q1C-9U; Fri, 04 Mar 2022 11:52:18 +0000
Received: from mga14.intel.com ([192.55.52.115])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nQ6Td-009pwG-HS; Fri, 04 Mar 2022 11:52:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646394725; x=1677930725;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=8qonJSlfQ2SH4N0PAPavG8blHvf2Yzd8yazg7xcB6rs=;
 b=JbmDiQk3Vu2pz9p/KxxImpVLoIAPUy6yfLs1HTs1AnXDhV2fOLf5cdkK
 optTrf0KuzWt+IbvmRynTb9OXz/JZbdxFvbyjddM/4MQ0ShnXmt5P2mcl
 WaMxXqzF1aGzWSkOWMTdqtB7CFWfH3zoAj09uDQQksw3Ig5GfZFg1XNTr
 AmhnO586/l/f77ne222dMj4aTwoIcKkP2gnhFQNdoP8v2WnY2SdhwnSj+
 KQJAYKljigcFA2CbxtcYlTiUOCdRXSvTDReTQ9fua5wz1PFePPFvGME4u
 IOlsNYSaPkcx+GVi53VtBTZ6mi9Gl33TMyRNh/vLhM86GZv8a+Yk52xJv A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10275"; a="254153116"
X-IronPort-AV: E=Sophos;i="5.90,155,1643702400"; d="scan'208";a="254153116"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2022 03:52:02 -0800
X-IronPort-AV: E=Sophos;i="5.90,155,1643702400"; d="scan'208";a="511827595"
Received: from pruilobx-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.28.174])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2022 03:51:57 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: xinlei.lee@mediatek.com, chunkuang.hu@kernel.org,
 p.zabel@pengutronix.de, airlied@linux.ie, daniel@ffwll.ch,
 matthias.bgg@gmail.com
Cc: jitao.shi@mediatek.com, allen-kh.cheng@mediatek.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, rex-bc.chen@mediatek.com,
 linux-arm-kernel@lists.infradead.org, Xinlei Lee <xinlei.lee@mediatek.com>
Subject: Re: [PATCH v2, 0/4] Cooperate with DSI RX devices to modify dsi
 funcs and delay mipi high to cooperate with panel sequence
In-Reply-To: <1646388956-8033-1-git-send-email-xinlei.lee@mediatek.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <1646388956-8033-1-git-send-email-xinlei.lee@mediatek.com>
Date: Fri, 04 Mar 2022 13:51:55 +0200
Message-ID: <87lexq2aw4.fsf@intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220304_035205_671893_CE638C41 
X-CRM114-Status: UNSURE (   8.71  )
X-CRM114-Notice: Please train this message.
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


Please also prefix cover letters with drm/mediatek if that's the only
place you're touching.

BR,
Jani.


On Fri, 04 Mar 2022, <xinlei.lee@mediatek.com> wrote:
> From: Xinlei Lee <xinlei.lee@mediatek.com>
>
> In upstream-v5.8, dsi_enable will operate panel_enable, but this
> modification has been moved in v5.9. In order to ensure the timing of
> dsi_power_on/off and the timing of pulling up/down the MIPI signal,
> the modification of v5.9 is synchronized in this series of patches.
>
> Changes since v1:
> 1. Dsi sequence marked with patch adjustment
> 2. Fixes: mtk_dsi: Use the drm_panel_bridge
>
> Jitao Shi (3):
>   drm/mediatek: Adjust the timing of mipi signal from LP00 to LP11
>   drm/mediatek: Separate poweron/poweroff from enable/disable and define
>     new funcs
>   drm/mediatek: keep dsi as LP00 before dcs cmds transfer
>
> Xinlei Lee (1):
>   drm/mediatek: Add pull-down MIPI operation in mtk_dsi_poweroff
>     function
>
>  drivers/gpu/drm/mediatek/mtk_dsi.c | 73 ++++++++++++++++++++----------
>  1 file changed, 49 insertions(+), 24 deletions(-)

-- 
Jani Nikula, Intel Open Source Graphics Center

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
