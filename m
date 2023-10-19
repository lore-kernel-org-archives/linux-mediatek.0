Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56EFBCDB484
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Oct 2023 08:22:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6JocWFvICwQAu51spYQ9UkYkn/vFA+DgKSrhAcOeN84=; b=P7r02oWDyN93UQTSx+EpgnW5LO
	/31KGiJIppc/bpzIaf9qvTD/uQm0S87zgwtKVncdeidVFLzPQSGZbobXAyy2CHBLJsgX5UG+hziDs
	GjuoPF8Q3SwK+sX0fZ20FRK/oIOZLdNKcP+1TUOTm8GVkHoyDu63S7xPz/RHXf7OJTQr8pzTaAztI
	pSnd+kkxV/i+eRHxJi59POjnk9+JOiG0d0WaiEa9IGtGJE+z4TOqwyQ1Dbv/nGCu2w7l+AfbqswlM
	1ZKgpZqu0eGKlXdGFXrs05vJzi7lB4jZwMtPDaVzxJRknM6x9S+1OrWqgHIQiguikOcGqPN24RTFx
	8kKqZfoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtOIl-00GhQc-0R;
	Thu, 19 Oct 2023 08:22:43 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtOIL-00GhDV-2G
	for linux-mediatek@lists.infradead.org;
	Thu, 19 Oct 2023 08:22:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1697703735;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6JocWFvICwQAu51spYQ9UkYkn/vFA+DgKSrhAcOeN84=;
	b=gEVcq8vIybTNYurjtxpBsSia4IwH29VGU5myeiiwMECo2CDZgWOR0ObrymUYAfJXOEPaTv
	MSqNxz9C6McSlDUDNe235d0L86dWf+U3JZTtdRefpm6r9VmJCzjPvkt7htIE8FxJqQGQCE
	27stwpw5k2mBd9uIaUkRkbZxrJOQrJE=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-472-ZSGcRnwwMLWXWruC5TXZPw-1; Thu, 19 Oct 2023 04:20:28 -0400
X-MC-Unique: ZSGcRnwwMLWXWruC5TXZPw-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-99bcb13d8ddso568358866b.0
        for <linux-mediatek@lists.infradead.org>; Thu, 19 Oct 2023 01:20:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697703627; x=1698308427;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6JocWFvICwQAu51spYQ9UkYkn/vFA+DgKSrhAcOeN84=;
        b=YI81T6sJvRpUSr6NZnaQ4Myp5XK0zYxkOghgFp64BngEcpx0lo9FmtvxFH4fp2wPDJ
         pP1YCqPHfkwv0JdJhnKBR+DZIwy+eJWvHMLdGHIgunh78AfkbHCuqVR5Cnh8GCP2TbZI
         YzZgfwep4RKyI8cauwl112lAn5uAu6pNuyG1seiUWyVEoM8ugsfkbvQe6180lyaFHHpT
         1ztUyOy9QqQhHh1P0ehcE6ZV9/gIWyHzfLinOpwa8BOVaMNsjbU6X9I9+ZxJGE5Vi0xa
         zswrxGkkozbE53LGQpXtbtkkGgE1TOB/6ggbnzeIcJ4Ut0psuXm0rSYo/VkPxXol6hWi
         upjw==
X-Gm-Message-State: AOJu0YxEZFbEnKFWFrNzUbol0xrKj+i57g5yZ0gHSMQn8kR8kOojpylj
	MerFePIiZNL/PdLwu4f0xoOxBkdtGO27X/GUpDf9NaU48YIbBouqeVfdlN5C7LH5hYz7QYRa2yp
	8p3NQdehnJNJdtfppzKXEmeT/05frFaRV
X-Received: by 2002:a17:907:7b89:b0:9c5:844f:a7f4 with SMTP id ne9-20020a1709077b8900b009c5844fa7f4mr1416925ejc.35.1697703627226;
        Thu, 19 Oct 2023 01:20:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGTnMKXbHzCyh0CpWl8FqNt59EDAGlNA5Kw8X7mQsKbdb09VixEWWMGkJGLb9zHxDpsNDg2ag==
X-Received: by 2002:a17:907:7b89:b0:9c5:844f:a7f4 with SMTP id ne9-20020a1709077b8900b009c5844fa7f4mr1416904ejc.35.1697703626942;
        Thu, 19 Oct 2023 01:20:26 -0700 (PDT)
Received: from localhost ([193.32.126.216])
        by smtp.gmail.com with ESMTPSA id rn1-20020a170906d92100b0099d45ed589csm3040281ejb.125.2023.10.19.01.20.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Oct 2023 01:20:26 -0700 (PDT)
Date: Thu, 19 Oct 2023 10:20:25 +0200
From: Maxime Ripard <mripard@redhat.com>
To: Vignesh Raman <vignesh.raman@collabora.com>
Cc: helen.koike@collabora.com, airlied@gmail.com, daniel@ffwll.ch, 
	david.heidelberg@collabora.com, sergi.blanch.torne@collabora.com, guilherme.gallo@collabora.com, 
	daniels@collabora.com, gustavo.padovan@collabora.com, emma@anholt.net, 
	robdclark@gmail.com, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, virtualization@lists.linux-foundation.org, 
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v5 9/9] drm: ci: Update xfails
Message-ID: <clpne3ctm2aptl6whv4nxqsjcrqfggkdckocusxjksjirvflsm@6dppwwlqg4bt>
References: <20231019070650.61159-1-vignesh.raman@collabora.com>
 <20231019070650.61159-10-vignesh.raman@collabora.com>
MIME-Version: 1.0
In-Reply-To: <20231019070650.61159-10-vignesh.raman@collabora.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231019_012217_811572_BFF5528E 
X-CRM114-Status: GOOD (  10.39  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi,

On Thu, Oct 19, 2023 at 12:36:50PM +0530, Vignesh Raman wrote:
> diff --git a/drivers/gpu/drm/ci/xfails/mediatek-mt8173-flakes.txt b/drivers/gpu/drm/ci/xfails/mediatek-mt8173-flakes.txt
> new file mode 100644
> index 000000000000..8b12e97d59f3
> --- /dev/null
> +++ b/drivers/gpu/drm/ci/xfails/mediatek-mt8173-flakes.txt
> @@ -0,0 +1,9 @@
> +# https://gitlab.freedesktop.org/vigneshraman/linux/-/pipelines/1013138
> +# https://gitlab.freedesktop.org/vigneshraman/linux/-/pipelines/1012894
> +# https://gitlab.freedesktop.org/vigneshraman/linux/-/pipelines/1013011
> +# https://gitlab.freedesktop.org/vigneshraman/linux/-/pipelines/1013055
> +kms_cursor_legacy@cursor-vs-flip-atomic-transitions
> +kms_force_connector_basic@force-edid
> +kms_force_connector_basic@prune-stale-modes
> +kms_prop_blob@invalid-set-prop
> +kms_prop_blob@invalid-set-prop-any

We agreed recently to provide more context to flakes going forward, see:
https://lore.kernel.org/dri-devel/ax6tspeffujmk2vpvh6rwclqkkavpezvcubra25vs2ev7f5njs@2rpnycg2rgnj/

I'll send a doc update to make that formal (and discuss it at XDC if needed)

Maxime


