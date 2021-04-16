Return-Path: <SRS0=rcQv=JN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8769DC433B4
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Apr 2021 14:24:42 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E5159610FC
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Apr 2021 14:24:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E5159610FC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References:In-Reply-To:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=aWKCjmqhJx/i/ePI36SYvfbZLAkphmV0clvGLzAquis=; b=pkoPUV4++oH8KWmWIy11i9xq6
	R6CuVagTXTXuOuMh+1cs9lJX+zjJuJhypKcwJKtYbsyFMx+bBXZ5ms2aGDpeFkhmiu9crQIuhXyQq
	+r3K8YAbFOMFfXrO9rZtJ+h56EtMf2+PVuF8pHJpfjjaFO5QRlAa4L3sMJn10qYFstOHN/fLL8XID
	/wIKCeOXFmvolaJd1GrnjWypQU/xojl1RLQTghhf4Ag20ky24nFR8u9flD48nto2WoIQhwYc7IFXo
	/wTnRBkvYpURXTK4wmktbtf6rmUZx4xnopKY4ULN3HmNOVfnShcXkFOjJVxQzXcyiMIKDnUkrZR5c
	vgtQBr7Yw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lXPOX-002O6T-Hm; Fri, 16 Apr 2021 14:24:29 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXPNz-002Nsi-Jv; Fri, 16 Apr 2021 14:23:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:MIME-Version:Message-ID:
 Date:References:In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=O/J5mGCQPFSimO8CyoBTFlMKq1oaHWOqDrXmwcobRtw=; b=fyO23ilSAkVJE7IxBKsRIOx/Lp
 SgQg7LnDAvws0rf1n45Sg7XI44MfUPRIbJt2xWBQhzw2YyD6pk4CUdpnQSFswxD6CSEOxLvetizNd
 +sDDB4a5b9sSqq60zg5jjrrI1XRGZCQT/XuOqV4CQb4IGPtbN4ktno8UuHBRClSUVJTmrDoS+mgDR
 M2gR6dedptkPrdDN//YwjsSedVUkb9E1IGLYzgeqlnvvkymzNab1m60/nGCI/QXupFbyVVmqB7wgM
 5pj2VkKvWLG0ReseKG9gYBhu8vZoGp7lxjT3j5IjmS71uvYBx6zE4vOiElufqiFy7a7jGhirlqTdF
 3bF/7c6w==;
Received: from mga09.intel.com ([134.134.136.24])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXPNt-009RGm-3E; Fri, 16 Apr 2021 14:23:53 +0000
IronPort-SDR: xzHgAL77cW+BjXj/M/KFJod5muH3wNHXGixM1LTlGcMv4WSdyPqQboCNozvuVY64ibYmdlmXtG
 v1lAvcYbwAiA==
X-IronPort-AV: E=McAfee;i="6200,9189,9956"; a="195158283"
X-IronPort-AV: E=Sophos;i="5.82,226,1613462400"; d="scan'208";a="195158283"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2021 07:23:46 -0700
IronPort-SDR: c+FI3oydeo1UnYvVMy7D0CuxTiDIzFiG/ULHSqqKGuFXsu/k0ae4CcJ8Zv7aU0bzsx9FKqgiGB
 TrXX879pyXsQ==
X-IronPort-AV: E=Sophos;i="5.82,226,1613462400"; d="scan'208";a="425615875"
Received: from lelicken-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.249.37.239])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2021 07:23:40 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Hsin-Yi Wang <hsinyi@chromium.org>, Wolfram Sang <wsa@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc: linux-i2c@vger.kernel.org, Qii Wang <qii.wang@mediatek.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Mark Brown <broonie@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>,
 Bibby Hsieh <bibby.hsieh@mediatek.com>, Arnd Bergmann <arnd@arndb.de>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH v19 6/6] drm/i915/selftests: Rename functions names
In-Reply-To: <20210414172916.2689361-7-hsinyi@chromium.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20210414172916.2689361-1-hsinyi@chromium.org>
 <20210414172916.2689361-7-hsinyi@chromium.org>
Date: Fri, 16 Apr 2021 17:23:37 +0300
Message-ID: <87y2dicnpy.fsf@intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210416_072349_196437_B0F51DB1 
X-CRM114-Status: GOOD (  17.01  )
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

On Thu, 15 Apr 2021, Hsin-Yi Wang <hsinyi@chromium.org> wrote:
> pm_resume and pm_suspend might be conflict with the ones defined in
> include/linux/suspend.h. Rename pm_resume{suspend} to
> i915_pm_resume{suspend} since they are only used here.

I agree with the rationale here.

Do you need this to be part of your series, or shall we just pick this
up for i915? (We might consider renaming to something else or prefix the
functions with _ though, as we also have existing i915_pm_suspend and
i915_pm_resume elsewhere.)

BR,
Jani.

>
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> Reported-by: kernel test robot <lkp@intel.com>
> ---
>  drivers/gpu/drm/i915/selftests/i915_gem.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/selftests/i915_gem.c b/drivers/gpu/drm/i915/selftests/i915_gem.c
> index dc394fb7ccfa..525afda9d31f 100644
> --- a/drivers/gpu/drm/i915/selftests/i915_gem.c
> +++ b/drivers/gpu/drm/i915/selftests/i915_gem.c
> @@ -94,7 +94,7 @@ static int pm_prepare(struct drm_i915_private *i915)
>  	return 0;
>  }
>  
> -static void pm_suspend(struct drm_i915_private *i915)
> +static void i915_pm_suspend(struct drm_i915_private *i915)
>  {
>  	intel_wakeref_t wakeref;
>  
> @@ -116,7 +116,7 @@ static void pm_hibernate(struct drm_i915_private *i915)
>  	}
>  }
>  
> -static void pm_resume(struct drm_i915_private *i915)
> +static void i915_pm_resume(struct drm_i915_private *i915)
>  {
>  	intel_wakeref_t wakeref;
>  
> @@ -152,12 +152,12 @@ static int igt_gem_suspend(void *arg)
>  	if (err)
>  		goto out;
>  
> -	pm_suspend(i915);
> +	i915_pm_suspend(i915);
>  
>  	/* Here be dragons! Note that with S3RST any S3 may become S4! */
>  	simulate_hibernate(i915);
>  
> -	pm_resume(i915);
> +	i915_pm_resume(i915);
>  
>  	err = switch_to_context(ctx);
>  out:
> @@ -192,7 +192,7 @@ static int igt_gem_hibernate(void *arg)
>  	/* Here be dragons! */
>  	simulate_hibernate(i915);
>  
> -	pm_resume(i915);
> +	i915_pm_resume(i915);
>  
>  	err = switch_to_context(ctx);
>  out:

-- 
Jani Nikula, Intel Open Source Graphics Center

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
