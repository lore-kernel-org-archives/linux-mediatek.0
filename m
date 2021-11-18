Return-Path: <SRS0=mmGE=QF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37ACBC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Nov 2021 05:55:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F1D8661B3D
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Nov 2021 05:55:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F1D8661B3D
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bJS40aJqUNCcBXELt1FVL76sCtQWSudrlGWeFwVm8WQ=; b=nfwTcByGBMs+Mp
	MtdrjYX6DtLXiI0gV3zOwXQDAwMTl/GaVvYFhZyU3kqn2jucHBpp/JjIhnw3SjvjnaKpW+h46IfzX
	y3qRoZMPQ5rqLcjt/6YRq93z5NJMDX/NiBOGCpMiJDko/1AzuTJXM/cZATmZgIJAdL03UFTJavvtl
	xF1hjc/MjwdvnGyPxRHCLXU9/gQzCQNnJABW3RLGzD5ZAqFDqLVUqtkWb82Xr029M6AMa1TvRofs/
	oBw3P62RRYS66uVEVz/Htal5umHEfzzROpFhb02FKgo5qfhg49h8b7HFW/AKD0JfM8SrscsK8iddT
	GVQspDYkIJTQRXEUtsfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mnaOd-006wEC-KN; Thu, 18 Nov 2021 05:55:43 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mnaOS-006w9c-Qp
 for linux-mediatek@lists.infradead.org; Thu, 18 Nov 2021 05:55:34 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 200so4412320pga.1
 for <linux-mediatek@lists.infradead.org>; Wed, 17 Nov 2021 21:55:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=M6fU9HCOMXaAwWu55zqsqx8GoNSHTp7qVG4HyvmThLM=;
 b=UHufCLPWyoOczeZ10rpOHREDHnb3KpiCBx3l1fTQm5RvUKFPfoiV3nIdNI1zko70SG
 /rKe8N7G0c0n05WH2WbNalEhgCbNcRUSas8ntyCf23nZUCkn6i9wCai27/OIwEMEJyOv
 ThePhBf4AWclUuOtatuS2nfw5iiz775JEIGgnd/uYe4rXrmhZLY9uVjezatexQW9zJlr
 f/ua1KJym4YKdxaoZO7i5Sm2rmE52E/ZEveHM3ZGMEyCS4qLoJEPYgizR4iGB0ez384E
 65/JeZxmXvJ2XZODMZNCnYNZLTvHyi9Vh/6xPx5IAmj5cvI8gu2XavIl9F9ECYt2hs+g
 UB9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=M6fU9HCOMXaAwWu55zqsqx8GoNSHTp7qVG4HyvmThLM=;
 b=N0WrgKzUwYH4AC8Gphxm9jboQnwsvKevZ+DZlfpLzGrZHdghcYdI3NIvo7mBkMU1WO
 Z+nuSBt8Lz/plAkYzhQ1vLEXXmHbxUSqVA6n9nrEjaGSXvAaUvmC5xDcl7BJwgaFxCAK
 Qu+VK9uXeg4yuSsh2mm2m1ZW38G4buqqr+cyrIrgrw4zmC7jOI143cdXLiZ79nczzd90
 F0LyWK4NIYrzONci4z08CRoTrF37mK5LFQuYA3rwbVAFUuBC+w4UOhRuIsrA9Vb/bxul
 sAw87UE8/Fp6zbtHSjcDMi+0+mDDMQoj/YXtN77aL7RG17vvX0eR7z7fMQmH/iClzBj1
 K90g==
X-Gm-Message-State: AOAM531HmYw8tuwjDHEG/8LhXIJL2OnUC2edwAbF/eLoieAU6uwbJ/Ge
 CQyBjcBHJmr0pv9qjVorUFjoFg==
X-Google-Smtp-Source: ABdhPJw1U92hefuFRAL0GmhDcNMuPQUVRaJ5rI4xhjzGg+pVLc+xkbJYl2Vby+uLLS0FJI1gYbeHXQ==
X-Received: by 2002:a05:6a00:23c8:b0:49f:e054:84d7 with SMTP id
 g8-20020a056a0023c800b0049fe05484d7mr53924075pfc.50.1637214931490; 
 Wed, 17 Nov 2021 21:55:31 -0800 (PST)
Received: from google.com ([2401:fa00:1:10:8f8:11d:a96a:74d2])
 by smtp.gmail.com with ESMTPSA id u9sm1547277pfi.23.2021.11.17.21.55.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Nov 2021 21:55:31 -0800 (PST)
Date: Thu, 18 Nov 2021 13:55:27 +0800
From: Tzung-Bi Shih <tzungbi@google.com>
To: "jason-jh.lin" <jason-jh.lin@mediatek.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Jassi Brar <jassisinghbrar@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 hsinyi@chromium.org, fshao@chromium.org, nancy.lin@mediatek.com,
 singo.chang@mediatek.com
Subject: Re: [PATCH 3/3] drm/mediatek: add devlink to cmdq dev
Message-ID: <YZXqz6XDChwscDC0@google.com>
References: <20211117064158.27451-1-jason-jh.lin@mediatek.com>
 <20211117064158.27451-4-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211117064158.27451-4-jason-jh.lin@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211117_215532_937042_0E526C0A 
X-CRM114-Status: GOOD (  13.32  )
X-Spam-Score: -15.7 (---------------)
X-Spam-Report: Spam detection software,
 running on the system "bombadil.infradead.org", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, Nov 17, 2021 at 02:41:58PM +0800, jason-jh.lin wrote:
 > @@ -158, 6 +159, 7 @@ static void mtk_drm_crtc_destroy(struct drm_crtc *crtc)
 > mtk_drm_cmdq_pkt_destroy(&mtk_crtc->cmdq_handle); > > if ( [...] 
 Content analysis details:   (-15.7 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [2607:f8b0:4864:20:0:0:0:52c listed in]
 [list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM
 white-list
 -7.5 USER_IN_DEF_SPF_WL     From: address is in the default SPF
 white-list
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.5 ENV_AND_HDR_SPF_MATCH  Env and Hdr From used in default SPF WL
 Match
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium trust sender
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

On Wed, Nov 17, 2021 at 02:41:58PM +0800, jason-jh.lin wrote:
> @@ -158,6 +159,7 @@ static void mtk_drm_crtc_destroy(struct drm_crtc *crtc)
>  	mtk_drm_cmdq_pkt_destroy(&mtk_crtc->cmdq_handle);
>  
>  	if (mtk_crtc->cmdq_client.chan) {
> +		device_link_remove(mtk_crtc->drm_dev, mtk_crtc->cmdq_client.chan->mbox->dev);
>  		mbox_free_channel(mtk_crtc->cmdq_client.chan);
>  		mtk_crtc->cmdq_client.chan = NULL;
>  	}
[...]
> @@ -956,6 +959,16 @@ int mtk_drm_crtc_create(struct drm_device *drm_dev,
>  	}
>  
>  	if (mtk_crtc->cmdq_client.chan) {
> +		struct device_link *link;
> +
> +		/* add devlink to cmdq dev to make sure suspend/resume order is correct */
> +		link = device_link_add(dev, mtk_crtc->cmdq_client.chan->mbox->dev,
> +				       DL_FLAG_PM_RUNTIME | DL_FLAG_STATELESS);
> +		if (!link) {
> +			dev_err(dev, "Unable to link dev=%s\n",
> +				dev_name(mtk_crtc->cmdq_client.chan->mbox->dev));
> +		}
> +

If device_link_add() failed, doesn't mtk_drm_crtc_create() need to return an error and exit?

OTOH, if device_link_add() failed, won't it bring any side effects to call device_link_remove()?

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
