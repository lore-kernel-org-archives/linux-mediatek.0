Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BC96C624A5
	for <linux-mediatek@archiver.kernel.org>; Mon, 31 Aug 2026 15:29:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MODz/yvQ0Z27mNvvvXpyLpRUHE/JQSAV0LJ+Rig2AKg=; b=alEWSM1c0vMw3ZCFtjytuDKpDD
	WpbgW2do0s1L4ZwF3ew67mgbCgt/J4LwWXepPknxYMB+TpVODEih9vsNRk1zelmemQNY9tBvj8qGl
	lEmAN8uN+eYLzokoxsFTaCsJT4RrnXPnv0EAmbIn957PlNfoUlJ1H7xDSfnr+keCjKNnxp1U9xeCr
	xqVioOuyW4BKA04TTh8I14XEQvhFD/QIVsJLZb9Ppme8OR9lHyWlzbi8AOunN2vDf/HmWKw5kOtaH
	wh3G/yoKHRenJewL8yjss53HX0yduNcbHot2ehvVSF0drSTh1qBjvoXRMPz4SXsTWQJNnLkKqK4nH
	GdX32VoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x13wV-00000009rZW-4BJQ;
	Mon, 31 Aug 2026 15:29:03 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x13wP-00000009rWL-3utS
	for linux-mediatek@lists.infradead.org;
	Mon, 31 Aug 2026 15:28:59 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-c252e703fa3so536300066b.3
        for <linux-mediatek@lists.infradead.org>; Mon, 31 Aug 2026 08:28:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1788190136; x=1788794936; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MODz/yvQ0Z27mNvvvXpyLpRUHE/JQSAV0LJ+Rig2AKg=;
        b=D/2BOLP8TQcQVJSoMvFKPFmKXqskGNQRhOdn/Bni7b2NK6ERZEDVF9OWBMoFwRV02x
         67zUioUVjqL/TbbRtJBMzytVOj2mRvZ6ltcqsp3S7YbidOcl5UqB57GrBnB/TLP4yOsP
         jgtkt2h0mZgeLCCpZP7Plb0EMDKHPhuyaY++g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788190136; x=1788794936;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MODz/yvQ0Z27mNvvvXpyLpRUHE/JQSAV0LJ+Rig2AKg=;
        b=dI5G+fdqVLKE29Tk9ELq7NIftxF4kc//uNtO87h+RRCK3Ys+ex6eZu4UQsxmzBzhqD
         KAjzxuxCH3HCScDM+QHKjoQknv0aZ+c45yWXA2kRN0CQ4PHIYr1RJAV2Q7wu/s+G77GK
         hboSqojVg6oWtAiPNyfa27wrMRhQPYmc7pVvEa69FLw0Jf4eatemcuYcCptS8scN6Itf
         IAVfX7br//IRmi8dZPIMQKKcO27N/rcX4hvpN1iVYO6i8uqNEKXluiSo+t9d48fWGket
         Lwu7dWRxcSlzgsSEL/kL+4artBLkYnvq64GFrjqxAYOOk79Mz39Ar5cOiKlf2oxomVtH
         cYsw==
X-Forwarded-Encrypted: i=1; AHgh+RqzXFoP6f3CMhEQ5Z61vOoRowWAme7Gyy9YJy3LkECNVrCl05Mv7OmqbWR9hES/k8rrfmcM4N6RjyXZlCU7eA==@lists.infradead.org
X-Gm-Message-State: AFuF++lJGbua+DkINIpLNhBntJs2yvJfoibhumfmbLP+RxJ9OVZdDWfg
	pmw140D6vLAQgRUv+1ktcLc2PJN2XigDrOcUWkAX8PCm5ihFZOPTvA+4M0Fh8IMEwtFfXSvLukW
	uHt8IkrvY
X-Gm-Gg: AR+sD10i26C6g3th/8K+cux93B9iX7LElrPDM9PVCJg9NIrcx/w2mLL9N+sdVQIM7Fp
	qSngHmpytm3EyRo+6gwOQxP3EUUCZAKdpunQGZ0IqMnHmyOiTkc3vyJQ9SL1UGHdGB2N7HEvKiy
	blrNUnoQQxXrCM+AktJ2sfeqF/xGwC+9xyIAq6wLm/4+8/QLdxZD8mTXerUcaQMuk7djGcCq26t
	62U5TfNSrEdYjHuWJ45ObSE+/Q1hev3dahTXXWPJ6vcu13GSo638mn72fShB4K4ZOGms7ta3Jm+
	+Hd2etsANaa2uNA9fAfV5r7YU5fGNZDcNd/TtSaWQBvt4HbWtshgee9eDYLDaG+gguVB1i6hk0C
	6cZNYMwUvpAxKWdVpy+N+0X6LUt93xYPR+dRS4ITd4hD52WFWhfcLKmMh5BjUIknS6ds+PLahEg
	AUtLBSpN1PrMAksiiaswM8MkRqWIPg3PRYb6zyHHQULNWJd4pemJ6YNUi9C/A38nzEJzw58R929
	zm16BNVWaPII9EMaT+xzSFLB1vU
X-Received: by 2002:a17:906:b816:b0:c1f:983f:d8a with SMTP id a640c23a62f3a-c25b3d93374mr72232066b.24.1788190135898;
        Mon, 31 Aug 2026 08:28:55 -0700 (PDT)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com. [209.85.221.47])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25ab254f49sm94865266b.10.2026.08.31.08.28.52
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 08:28:55 -0700 (PDT)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-47f96c5b722so2277001f8f.0
        for <linux-mediatek@lists.infradead.org>; Mon, 31 Aug 2026 08:28:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByNwH+MmmTpYSpU/meKx385uTzTs02XCQLVls/45B5UKrKsrMCihSZ3zMTvxrSpnhsjw/WEFQXbMqhZZ0g8Ug==@lists.infradead.org
X-Received: by 2002:a05:6000:46cb:b0:484:3600:35b2 with SMTP id
 ffacd0b85a97d-48440fcee03mr2458557f8f.5.1788190129893; Mon, 31 Aug 2026
 08:28:49 -0700 (PDT)
MIME-Version: 1.0
References: <20260825-drm-bridge-drm_panel-cleanup-v2-0-c6c88ba7ffd2@bootlin.com>
 <20260825-drm-bridge-drm_panel-cleanup-v2-8-c6c88ba7ffd2@bootlin.com>
 <CAD=FV=Xdj_foBqt9A9EVVoCA2BxAV3UZNz3SuVPu2ZoNXgnS=w@mail.gmail.com>
 <DL308Z0JXJ31.2V3H29DTG4MSM@bootlin.com> <CAD=FV=UOwWdVc8p1js+28C1u7=iRqRpv86PkwWf5g8yL-Uq5kw@mail.gmail.com>
 <DL38FWMPAVYW.3H964111WXW4T@bootlin.com>
In-Reply-To: <DL38FWMPAVYW.3H964111WXW4T@bootlin.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 31 Aug 2026 08:28:38 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VPzExBjY6KrNR_cDJTofua1nZtPNOhNciu+Y7awwaCTQ@mail.gmail.com>
X-Gm-Features: AcwNN1Vw4mO8ILYq4ZDFw7i23F9T4GMkIdNzC_wyAjuyFKPOHb3FlBTxENhm96k
Message-ID: <CAD=FV=VPzExBjY6KrNR_cDJTofua1nZtPNOhNciu+Y7awwaCTQ@mail.gmail.com>
Subject: Re: [PATCH v2 08/12] drm/bridge: parade-ps8640: select DRM_PANEL_BRIDGE
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Hui Pu <Hui.Pu@gehealthcare.com>, 
	Ian Ray <ian.ray@gehealthcare.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Jitao Shi <jitao.shi@mediatek.com>, CK Hu <ck.hu@mediatek.com>, 
	Pin-yen Lin <treapking@chromium.org>, Enric Balletbo i Serra <eballetbo@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_082857_996839_E657EDD3 
X-CRM114-Status: GOOD (  15.13  )
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

On Mon, Aug 31, 2026 at 8:26=E2=80=AFAM Luca Ceresoli <luca.ceresoli@bootli=
n.com> wrote:
>
> > Ah, indeed! I missed that since it didn't have "panel" in the name.
> > FWIW, then I think for this patch:
> >
> > Reviewed-by: Douglas Anderson <dianders@chromium.org>
> >
> > ...but, ironically, that means that for the other patch I looked at
> > (ti-sn65dsi86.c) we're missing the "select DRM_PANEL_BRIDGE" since it
> > uses the same API call, doesn't it?
>
> Ouch, indeed! Thanks for noticing.

That was part of what confused me initially. I saw one of the drivers
selecting DRM_PANEL_BRIDGE and the other one not doing so, even though
(as far as I could tell) whey were both using the same API calls. ;-)


> I will send v3 with that fixed, can I keep your R-by if there's just that
> change to the sn65dsi86 patch?

Yeah, it's fine to keep my R-b.


-Doug

