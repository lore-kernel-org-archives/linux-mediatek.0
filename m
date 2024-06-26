Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A190BC27C4F
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Jun 2024 17:57:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9ZM4co7+zgQAd1qBwWCVAAvV8TVVgRW2ezKZ6IWngwg=; b=luB1O75z+oUkPN+91hC1EQRvSY
	oywYVwGpPHDU2qm+VKWBcwLt5PFOV54eAnBNzQFM53lRKzkFf6xel7eu7WBDdbfu6uCjD9DLKDxU0
	9o2LjaG9lgUVPTPCCiJXHtHo/kXxrjEWF6yA4amQWeRHha2yXeFToLs86c6YbUfTGsN2Yeu5NoTob
	7ZcB206RiVf3jQB1D/WnwlUagT9w4hF6nZTgjaflDWRi9EGOmQnQXCshQDbvH8Vr4pnhJ0OUchjQf
	TDBSH3qMSvVXd9kP16SRi5MP35o/29ox9Q+84JWL1U/MhJCYLGkn9AAT6Uu6FhWs7GeO0RwYa4T0I
	g+GwrU7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMWtA-00000007po4-3hoM;
	Wed, 26 Jun 2024 17:57:00 +0000
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMWsz-00000007pkE-2S9d
	for linux-mediatek@lists.infradead.org;
	Wed, 26 Jun 2024 17:56:52 +0000
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-2ec5f72f073so3811101fa.0
        for <linux-mediatek@lists.infradead.org>; Wed, 26 Jun 2024 10:56:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1719424607; x=1720029407; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:mail-followup-to:message-id:subject:cc:to
         :from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9ZM4co7+zgQAd1qBwWCVAAvV8TVVgRW2ezKZ6IWngwg=;
        b=CKkrJgmiWAwmmKn0qhTwxgvKbbg/isyAUUgeLdwm3DOk0hZ/J7pq7HE5o2phmyY9V1
         GL9V4qB0hSinGG0Xti6CU1Lzf+hRD9GyXIyz5ODbtQ28E7CT3NRKVfI+bp4RLbRHxJw5
         hNe4fMdZyRn8crEJz7zvjfttJRzzdhta5qU48=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719424607; x=1720029407;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:mail-followup-to:message-id:subject:cc:to
         :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9ZM4co7+zgQAd1qBwWCVAAvV8TVVgRW2ezKZ6IWngwg=;
        b=iBW2us0HsKvFqG/X/xVP0SdhiKYyTeEciYEmjV2NGh0M4/OqloOIqVOgBVrOC+jPZ+
         s76uzNw+iuiliDTQtjfDht3qEdr0UrNB4CX8VXQUUvCCx+NMfAxg2NgH6ErjBft79MZV
         QEv+YZCCU0PCHGqWsQCRanR5imaP4YRRLg75LTenDyX0yCzk8u1kSkfkNj85QFkO8qtY
         zWoJaQioUFS62nEsWgaMLRyYHy8Rqp/3cayY09lX8449NE4BfF5OQQsvFWd3IM1mWwav
         dIi6HpbBylffFQhTU7B0Sky/nljJdk/u3slyRHQCDtsYdqU1qXttbpQeDn94pWaQUU5h
         CExw==
X-Forwarded-Encrypted: i=1; AJvYcCV/DCENnNXqm3G2Ih9cyAfrpHc314oGbVj0MVyCFw9yT8yGOZkSA8YU/w0wNCq5KhE2HUnWyB5oaSq/sySguk4fIYQBznFA/dhrfQmUgmpFZh6Q
X-Gm-Message-State: AOJu0Yx+TwSrKkICa4KTKJBihYEm683gD2A8SzRNpw2n+NXwGj8UolBE
	O+e7K1w+d1SouQRJcG62MEdwX5aGq8XOogNVsowL0HLozGR5oZSgHFagMyc41Zg=
X-Google-Smtp-Source: AGHT+IHpT050wLlCJMuYquS/RZZlwvPNrgj194MZbf2u4dKv3AnFWfObCpyKJAMPQnTOJYHQGnJJZA==
X-Received: by 2002:a2e:9903:0:b0:2ec:4176:dcaf with SMTP id 38308e7fff4ca-2ec54ce1c2bmr76783881fa.3.1719424605371;
        Wed, 26 Jun 2024 10:56:45 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-424c84245f0sm34437855e9.33.2024.06.26.10.56.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jun 2024 10:56:44 -0700 (PDT)
Date: Wed, 26 Jun 2024 19:56:42 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc: Jason-JH Lin =?utf-8?B?KOael+edv+elpSk=?= <Jason-JH.Lin@mediatek.com>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	Yong Wu =?utf-8?B?KOWQtOWLhyk=?= <Yong.Wu@mediatek.com>,
	"sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
	"robh+dt@kernel.org" <robh+dt@kernel.org>,
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>,
	"mripard@kernel.org" <mripard@kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"jstultz@google.com" <jstultz@google.com>,
	"linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	Jianjiao Zeng =?utf-8?B?KOabvuWBpeWnoyk=?= <Jianjiao.Zeng@mediatek.com>,
	"willy@infradead.org" <willy@infradead.org>,
	Kuohong Wang =?utf-8?B?KOeOi+Wci+m0uyk=?= <kuohong.wang@mediatek.com>,
	"quic_vjitta@quicinc.com" <quic_vjitta@quicinc.com>,
	"pavel@ucw.cz" <pavel@ucw.cz>,
	"robin.murphy@arm.com" <robin.murphy@arm.com>,
	"contact@emersion.fr" <contact@emersion.fr>,
	"logang@deltatee.com" <logang@deltatee.com>,
	"daniel@ffwll.ch" <daniel@ffwll.ch>,
	"jkardatzke@google.com" <jkardatzke@google.com>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"Brian.Starkey@arm.com" <Brian.Starkey@arm.com>,
	"benjamin.gaignard@collabora.com" <benjamin.gaignard@collabora.com>,
	"tjmercier@google.com" <tjmercier@google.com>,
	"krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"joakim.bech@linaro.org" <joakim.bech@linaro.org>,
	"ppaalanen@gmail.com" <ppaalanen@gmail.com>,
	"angelogioacchino.delregno@collabora.com" <angelogioacchino.delregno@collabora.com>,
	Youlin Pei =?utf-8?B?KOijtOWPi+aelyk=?= <youlin.pei@mediatek.com>
Subject: Re: [PATCH v5 2/9] scatterlist: Add a flag for the restricted memory
Message-ID: <ZnxWWtdShekGSUif@phenom.ffwll.local>
Mail-Followup-To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Jason-JH Lin =?utf-8?B?KOael+edv+elpSk=?= <Jason-JH.Lin@mediatek.com>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	Yong Wu =?utf-8?B?KOWQtOWLhyk=?= <Yong.Wu@mediatek.com>,
	"sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
	"robh+dt@kernel.org" <robh+dt@kernel.org>,
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>,
	"mripard@kernel.org" <mripard@kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"jstultz@google.com" <jstultz@google.com>,
	"linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	Jianjiao Zeng =?utf-8?B?KOabvuWBpeWnoyk=?= <Jianjiao.Zeng@mediatek.com>,
	"willy@infradead.org" <willy@infradead.org>,
	Kuohong Wang =?utf-8?B?KOeOi+Wci+m0uyk=?= <kuohong.wang@mediatek.com>,
	"quic_vjitta@quicinc.com" <quic_vjitta@quicinc.com>,
	"pavel@ucw.cz" <pavel@ucw.cz>,
	"robin.murphy@arm.com" <robin.murphy@arm.com>,
	"contact@emersion.fr" <contact@emersion.fr>,
	"logang@deltatee.com" <logang@deltatee.com>,
	"jkardatzke@google.com" <jkardatzke@google.com>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"Brian.Starkey@arm.com" <Brian.Starkey@arm.com>,
	"benjamin.gaignard@collabora.com" <benjamin.gaignard@collabora.com>,
	"tjmercier@google.com" <tjmercier@google.com>,
	"krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"joakim.bech@linaro.org" <joakim.bech@linaro.org>,
	"ppaalanen@gmail.com" <ppaalanen@gmail.com>,
	"angelogioacchino.delregno@collabora.com" <angelogioacchino.delregno@collabora.com>,
	Youlin Pei =?utf-8?B?KOijtOWPi+aelyk=?= <youlin.pei@mediatek.com>
References: <20240515112308.10171-1-yong.wu@mediatek.com>
 <20240515112308.10171-3-yong.wu@mediatek.com>
 <98721904-003d-4d0d-8cfe-1cecdd59ce01@amd.com>
 <779ce30a657754ff945ebd32b66e1c644635e84d.camel@mediatek.com>
 <cef8f87d-edab-41d8-8b95-f3fc39ad7f74@amd.com>
 <1050c44512374031d1349b5dced228d0efc3fbde.camel@mediatek.com>
 <3104b765-5666-44e4-8788-f1b1b296fe17@amd.com>
 <98c11bad7f40bcc79ed7a2039ddb3a46f99908f5.camel@mediatek.com>
 <75dc1136-7751-4772-9fa7-dd9124684cd2@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <75dc1136-7751-4772-9fa7-dd9124684cd2@amd.com>
X-Operating-System: Linux phenom 6.8.9-amd64 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240626_105649_655648_6932FA09 
X-CRM114-Status: GOOD (  31.20  )
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

On Wed, Jun 26, 2024 at 12:49:02PM +0200, Christian König wrote:
> Am 26.06.24 um 10:05 schrieb Jason-JH Lin (林睿祥):
> > > > I think I have the same problem as the ECC_FLAG mention in:
> > > > > > https://lore.kernel.org/linux-media/20240515-dma-buf-ecc-heap-v1-0-54cbbd049511@kernel.org/
> > > > > > I think it would be better to have the user configurable private
> > > > information in dma-buf, so all the drivers who have the same
> > > > requirement can get their private information from dma-buf directly
> > > > and
> > > > no need to change or add the interface.
> > > > > > What's your opinion in this point?
> > >  > Well of hand I don't see the need for that.
> > > > What happens if you get a non-secure buffer imported in your secure
> > > device?
> > 
> > We use the same mediatek-drm driver for secure and non-secure buffer.
> > If non-secure buffer imported to mediatek-drm driver, it's go to the
> > normal flow with normal hardware settings.
> > 
> > We use different configurations to make hardware have different
> > permission to access the buffer it should access.
> > 
> > So if we can't get the information of "the buffer is allocated from
> > restricted_mtk_cma" when importing the buffer into the driver, we won't
> > be able to configure the hardware correctly.
> 
> Why can't you get this information from userspace?

Same reason amd and i915/xe also pass this around internally in the
kernel, it's just that for those gpus the render and kms node are the same
driver so this is easy.

But on arm you have split designs everywhere and dma-buf import/export, so
something else is needed. And neither current kms uapi nor
protocols/extensions have provisions for this (afaik) because it works on
the big gpus, and on android it's just hacked up with backchannels.

So yeah essentially I think we probably need something like this, as much
as it sucks. I see it somewhat similar to handling pcip2pdma limitations
in the kernel too.

Not sure where/how it should be handled though, and maybe I've missed
something around protocols, in which case I guess we should add some
secure buffer flags to the ADDFB2 ioctl.
-Sima
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

