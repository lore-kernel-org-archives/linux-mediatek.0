Return-Path: <SRS0=3kTb=B5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B0DBC433DF
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Aug 2020 15:58:57 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 077192078D
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Aug 2020 15:58:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mG+GOFxz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 077192078D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=qyqAWLIVAVE1UA3sEDAXbPyA/vf7Z/+hv1w2x/+LF4M=; b=mG+GOFxzHGICQPJPb/ixlVwcA
	ob41MCFC3yAlHRDBaDY+eGQ/M8gGsiU1wg7Y/DwvJRRvEKfwnSOqBtqVjr6SYrC9ObMyA7PMkmZ/h
	LB4BwdTf26J2hQCVAfVc0ejhYCJc1bcVTk0sAK/mVl+JhVnEJMo1I3Rj63fbd0q0aEEVupO1x4QvV
	JKbd4RROPpjaaWgeHw6glgq5SQCYmdykmjBjR0vtfTKs0ZUWau267YNXXjkaLSQTr/tx8w0Ni3qxw
	je7A3iOm3JHpAYnNRLOHn28+F5FSTBzwlSaoXY0sD20FksdRoBdpeSWimUwlRkCGLx79mJsW1tuHD
	l2WgTxybw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k8QUC-0001Xw-JR; Wed, 19 Aug 2020 15:58:48 +0000
Received: from [2601:1c0:6280:3f0::19c2]
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8QU9-0001XB-6B; Wed, 19 Aug 2020 15:58:45 +0000
Subject: Re: [PATCH v4 2/4] drm/mediatek: Separate mtk_hdmi_phy to an
 independent module
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Kishon Vijay Abraham I <kishon@ti.com>
References: <20200819154421.7013-1-chunkuang.hu@kernel.org>
 <20200819154421.7013-3-chunkuang.hu@kernel.org>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <eec33300-f921-03d1-5bcf-788e4e2ce342@infradead.org>
Date: Wed, 19 Aug 2020 08:58:39 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200819154421.7013-3-chunkuang.hu@kernel.org>
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
Cc: CK Hu <ck.hu@mediatek.com>, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 8/19/20 8:44 AM, Chun-Kuang Hu wrote:
> diff --git a/drivers/gpu/drm/mediatek/Kconfig b/drivers/gpu/drm/mediatek/Kconfig
> index aa74aac3cbcc..ca3cd871a350 100644
> --- a/drivers/gpu/drm/mediatek/Kconfig
> +++ b/drivers/gpu/drm/mediatek/Kconfig
> @@ -24,6 +24,13 @@ config DRM_MEDIATEK_HDMI
>  	tristate "DRM HDMI Support for Mediatek SoCs"
>  	depends on DRM_MEDIATEK
>  	select SND_SOC_HDMI_CODEC if SND_SOC
> -	select GENERIC_PHY
> +	select PHY_MTK_HDMI
>  	help
>  	  DRM/KMS HDMI driver for Mediatek SoCs
> +
> +config PHY_MTK_HDMI
> +    tristate "MediaTek HDMI-PHY Driver"
> +    depends on ARCH_MEDIATEK && OF
> +    select GENERIC_PHY
> +    help
> +          Enable this to support HDMI-PHY

Please fix all of these newly added lines.

from Documentation/process/coding-style.rst:

Lines under a ``config`` definition
are indented with one tab, while help text is indented an additional two
spaces.


-- 
~Randy


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
