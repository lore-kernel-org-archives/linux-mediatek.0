Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B80FC4345F
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Apr 2024 17:19:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pMzpM+93sB8KN+aihvsI4sj2s8RINAbT1I+ikFGc/QQ=; b=eXWK7NRwV6dwL3SGOPjfF297tm
	FF4b5jrPy6y20tr9sad+jOd0deFKk7Lte4X6Bd2m9vRNoecFdTgMeJ+KDRMIOawNgGwKWMtc5ZfQQ
	oX1MUrdZfvA4nc3ysTqg+7ZGXsRJRJlborx69/oHITb9UOIoMNCorW6h6cJLYUKnkGaaXOm53q3YG
	zSa8X6uvLpA5B/Fzx4FMs7/1oHZWk+2hEMiKxcyYKQ7FBWey548bo3b+jBarrP1zYKz1QhnPaSNuX
	UGs88L6xXNZWtsZMf/wt8y7schWlqJYR9XPfFEv+QHds5bO98O2aO0MBXMl6pUP2GyVU0NGk4dUXI
	A5223m4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwmSr-0000000D905-3IOx;
	Tue, 16 Apr 2024 17:19:25 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwmSn-0000000D8z7-0iEd
	for linux-mediatek@lists.infradead.org;
	Tue, 16 Apr 2024 17:19:22 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-1e3c89f3d32so15935ad.0
        for <linux-mediatek@lists.infradead.org>; Tue, 16 Apr 2024 10:19:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1713287958; x=1713892758; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pMzpM+93sB8KN+aihvsI4sj2s8RINAbT1I+ikFGc/QQ=;
        b=AtwtTA/wgEW5gs6ZAkYTUEo6rRxija4+kIbgw5aEdSaGPHH7hmn+/kYrOl1urglPw/
         gzUj78E//SyyABb0mLMfhOUTtMJeukbIvvVF/HfgiDqA0dN2WcKAZA+Frww1IeNHr9Dv
         wD7/hdh7sBdIV5yEd/CDY2AWg19rBqBYizirYMWiYBLrPFA3lN/rwspGWPsYGtiri00N
         59jInLZ1pZfDdH64Sy5C3bO+1YofkJlttrTbCzLG3AZzfpaImKYQ1D8Hn8P3mCcuXVyh
         dv/F/Fs1R7+Rwp6nrTc3mZufPcNUMTW6iSyHtpPrabbqHvrg6vLYVnWHlnThn6yHL3FG
         Zelw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713287958; x=1713892758;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pMzpM+93sB8KN+aihvsI4sj2s8RINAbT1I+ikFGc/QQ=;
        b=QwIQkqP94oGmntro5S2pVp35cJxNed+po55yFxPHvkFDlQ1s5HbwXv+E660WqVk2nF
         uqBqy3L1k+OOjS+AHiyN6DaZmiUSMpypVscal0+swgAkhVl6B16wyhkJyr8Dpt93+Di+
         s0gxsZHRrmVugiyaXcw0OnOyWwvx9McnE84wT3vXdKiVtDJAGOCPWIrNPoE3cZKF2vHR
         i1Em4lbhMYEDtRDYbQPezDCan6rXI0nCw6FhV+Kv51zaKkdwD0W6r5a7gnCCbeiMNMHg
         y3UIX24LkoKGLK60W83+xW+ICAAgHVFsqGvdnB4QFZn8drlyID8kRbF86uHkz/ZjQlZs
         I0dQ==
X-Forwarded-Encrypted: i=1; AJvYcCXmOzrz/srpz2k8N/ffgRIHVQF9y93rpkm8pi/YehlzsDd0kCt/nm1eOEbfpRalK4BYErCTivJHxd3st1jTngW9mBYv5trglfJ4n0CIHc3nUB7V
X-Gm-Message-State: AOJu0YyObQNojENuBWwy4nHPQtI32AMHRNnRdLD2N/KBvv7e7e+nH4i2
	zOQvW4lyj92poos+5WFPF4KBeBC5uDT24IxBzpVZL+9zniJ2eSIwSWMldPHqBWEsOrFOaRRkh7p
	Hd0Q/TuM3tx1+bRkZI5A3hTYpEd5MoDVKW1Q=
X-Google-Smtp-Source: AGHT+IE+6v3wDbegK+Ux9rAhzTqqKq8TNFIZbmfaam/cohc7jxMrIVpQZc4dbB+03Ft2nzo9gRjOdyXae1RXd7Onh9g=
X-Received: by 2002:a17:902:fc8b:b0:1e4:33a6:b0d4 with SMTP id
 mf11-20020a170902fc8b00b001e433a6b0d4mr258654plb.9.1713287958225; Tue, 16 Apr
 2024 10:19:18 -0700 (PDT)
MIME-Version: 1.0
References: <20240403102701.369-1-shawn.sung@mediatek.com> <20240403102701.369-2-shawn.sung@mediatek.com>
 <70733fe5c919527796bd3d9735ced522bcdd7a25.camel@ndufresne.ca>
In-Reply-To: <70733fe5c919527796bd3d9735ced522bcdd7a25.camel@ndufresne.ca>
From: Jeffrey Kardatzke <jkardatzke@google.com>
Date: Tue, 16 Apr 2024 10:19:02 -0700
Message-ID: <CA+ddPcMWein69X6U46pZbDy51gFHHxXV5d+6BvFq7ma6n0E22w@mail.gmail.com>
Subject: Re: [PATCH v5 1/9] drm/mediatek/uapi: Add DRM_MTK_GEM_CREATE_ENCRYPTED
 flag
To: Nicolas Dufresne <nicolas@ndufresne.ca>
Cc: Shawn Sung <shawn.sung@mediatek.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Sumit Semwal <sumit.semwal@linaro.org>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org, 
	"Jason-JH.Lin" <jason-jh.lin@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240416_101921_312971_2BBBB335 
X-CRM114-Status: GOOD (  16.82  )
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

I would argue 'restricted' is the proper name since that was what was
settled on for the dma-buf code.  :)  But you are definitely right
that this memory is not encrypted.


On Tue, Apr 16, 2024 at 7:09=E2=80=AFAM Nicolas Dufresne <nicolas@ndufresne=
.ca> wrote:
>
> Hi,
>
> Le mercredi 03 avril 2024 =C3=A0 18:26 +0800, Shawn Sung a =C3=A9crit :
> > From: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>
> >
> > Add DRM_MTK_GEM_CREATE_ENCRYPTED flag to allow user to allocate
>
> Is "ENCRYPTED" a proper naming ? My expectation is that this would hold d=
ata in
> a PROTECTED memory region but that no cryptographic algorithm will be inv=
olved.
>
> Nicolas
>
> > a secure buffer to support secure video path feature.
> >
> > Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
> > Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>
> > ---
> >  include/uapi/drm/mediatek_drm.h | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/include/uapi/drm/mediatek_drm.h b/include/uapi/drm/mediate=
k_drm.h
> > index b0dea00bacbc4..e9125de3a24ad 100644
> > --- a/include/uapi/drm/mediatek_drm.h
> > +++ b/include/uapi/drm/mediatek_drm.h
> > @@ -54,6 +54,7 @@ struct drm_mtk_gem_map_off {
> >
> >  #define DRM_MTK_GEM_CREATE           0x00
> >  #define DRM_MTK_GEM_MAP_OFFSET               0x01
> > +#define DRM_MTK_GEM_CREATE_ENCRYPTED 0x02
> >
> >  #define DRM_IOCTL_MTK_GEM_CREATE     DRM_IOWR(DRM_COMMAND_BASE + \
> >               DRM_MTK_GEM_CREATE, struct drm_mtk_gem_create)
>
>

