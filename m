Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9930C88E64
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Sep 2026 09:26:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Tb/KsUxM9jxkMjSRJHpE7KiQY8ZPLkB6sQ8Hi6kwrEk=; b=jJyezbyiRzedmI4RKLIy5DoVdY
	AOqd/YOH6f/wP2OayXR8EaHoQ6J9PWAeBcnx/PU1A8yDVgjXSkN3rNvpbnvCkmb03z3WiEVcdwXjN
	9UahEI19FSIlX4YBF2px6I9goCAkBtTPhFSCjCm/ZnEjSYwrfXZAVQZHOVH3sF1ckdz0aJR4FNv8r
	p0YHy8UWwSChoOEebf7pDDu6sU7YW7Fjyyh2V5K1wy5UfPKCJUvOJg/84SsFD1DSskC0/aimIE88Q
	x9GrCYa2ywunkIwTGWTY9yhdziQ34ohuz2JnNFTt8ahgbNgNqCF/EE7szsThvQ/HY3bT5/obh7ltW
	kQ/S/+JQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x62wx-00000002weF-0P8H;
	Mon, 14 Sep 2026 09:26:07 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x62wt-00000002wcJ-2lTF
	for linux-mediatek@lists.infradead.org;
	Mon, 14 Sep 2026 09:26:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789377961;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Tb/KsUxM9jxkMjSRJHpE7KiQY8ZPLkB6sQ8Hi6kwrEk=;
	b=dPaZuwUONbmnfqkF/nudUj5tYk5kvDFpPnwRsllmZDFgigEh8Z6z6OBmZZtEDmQtKneTdv
	RKISS2irpGQOky8W/CAmM0pTh3qVUx6AxAghUYbneRouHQiZMA7xBqtEkN2GDjjUonRWxI
	c8aDSzV14eA9yB5JC/NpwY2XoBUBbd8=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-573-pFqFrtfJPRi8vLryatq9MQ-1; Mon, 14 Sep 2026 05:23:56 -0400
X-MC-Unique: pFqFrtfJPRi8vLryatq9MQ-1
X-Mimecast-MFC-AGG-ID: pFqFrtfJPRi8vLryatq9MQ_1789377835
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-49953abe51fso16675965e9.1
        for <linux-mediatek@lists.infradead.org>; Mon, 14 Sep 2026 02:23:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789377835; x=1789982635;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Tb/KsUxM9jxkMjSRJHpE7KiQY8ZPLkB6sQ8Hi6kwrEk=;
        b=GtBi8n1DaYZlkgQUjlRSIVHoGLC/wBclo7bML3lOfV1womleHDK4yBq2Smt0ocNMbF
         +hf+w+xbaEmxkcPKvVUFm4TnzJmXPKDlmrFx0Wvy52MTJSDswkRJ3IO68NIT05jyutUi
         xHghsX2yERwaFIfqobHoxhzuEG8eG98S7gCc8bnkFG35VfFJR2WOknqwetiOfgKZzTdm
         gYQ/w2YpF22o4yuoINFx6DEEjnrvM9AYfPkb9dVex3DiFzcJLgptAywpghbB/hdV6c7A
         WPq64N+giYuxl1Ba1qKsUPSe0SCkaO34Dc+/SU1Zpn21Dk/x6XEBxL3ZgWlT7BhZ9WGS
         1nKw==
X-Forwarded-Encrypted: i=1; AKwUvBwBuhhWA8oothrFKgiKQbbcNfrwpB46d3voCeUm2RFTi3/dFnbqfjurE4Y88k3FtichTHixMMkd1WD52GGGGQ==@lists.infradead.org
X-Gm-Message-State: AFuF++mpv2lgptgSmD/ptUJerErhZPWzvBC6kV7Q1mH4FH9ycCsLNwN3
	obBigrwyeRNdSE9I4IIerAQpqWI/ZXc5su8Vci4v64rItyQpK9B5ANSReM2XMgT0gK1cZRQHXVm
	kziZ7pWDlN6HbtEnafnKccSewQ21rBAkvjl++E2NF3Z6qe2kWJ1wKnBNVRQ9zWZbuX5GZdLzutg
	==
X-Gm-Gg: AYBFou0blVRLDYc3J3TxzGBY2syc1XxA3nG5/5M85LaFSVxCI1WsobiGyDMeJ1c4zym
	fNIEWCsJp7FDzk7fhRnpkqdCusKZ+CgjZtpSHN0uEl2iEOCTZQP9jGRnIUWJokyEIHQZ1uOG3an
	pcrSlz9fJ+yfNZ/oPZlPZbrEY1DO1ZeGsPVNW1xPTjfUh8EOec+JWZBVHthMGTR989eW2I0GnfC
	gTzBHf3l9BMD49tSX3vsJLVGjuRbSJihDa7d5JCAJSnT+cBjoxxziyFI6zyFZavmHFJPXB32gqH
	ejfyL3n3tD0eAeodDw3XjYNdQAyBJ+eTU2LDf4jN30AadshIk51l/X74Few46+b57JC0kBnQg0q
	qJcgg3Ob//DDnFfrG3/XdJkfp/nwgjGq8ujUzdtoLwaw4BRTs+OXXQdUwTg==
X-Received: by 2002:a05:600c:628f:b0:49d:1df6:2592 with SMTP id 5b1f17b1804b1-49e7a66ae3dmr16857805e9.21.1789377835279;
        Mon, 14 Sep 2026 02:23:55 -0700 (PDT)
X-Received: by 2002:a05:600c:628f:b0:49d:1df6:2592 with SMTP id 5b1f17b1804b1-49e7a66ae3dmr16857405e9.21.1789377834915;
        Mon, 14 Sep 2026 02:23:54 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6576122bsm399519375e9.2.2026.09.14.02.23.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 02:23:54 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, Chen-Yu Tsai
 <wens@kernel.org>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann
 <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, Liu Ying
 <victor.liu@nxp.com>, Andrzej Hajda <andrzej.hajda@intel.com>, Neil
 Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Luca Ceresoli <luca.ceresoli@bootlin.com>, Frank Li
 <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 Francesco Dolcini <francesco@dolcini.it>, Philipp Zabel
 <p.zabel@pengutronix.de>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, Rob
 Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang
 <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>, Marcus Folkesson
 <marcus.folkesson@gmail.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Yannick Fertre
 <yannick.fertre@foss.st.com>, Raphael Gallais-Pou
 <raphael.gallais-pou@foss.st.com>, Philippe Cornu
 <philippe.cornu@foss.st.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Adrien Grassein <adrien.grassein@gmail.com>, Russell King
 <linux@armlinux.org.uk>, Simha BN <simhavcs@gmail.com>, CK Hu
 <ck.hu@mediatek.com>, Jitao shi <jitao.shi@mediatek.com>, Yongxing Mou
 <yongxing.mou@oss.qualcomm.com>, Abel Vesa <abelvesa@kernel.org>, Chris
 Morgan <macromorgan@hotmail.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-mediatek@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-stm32@st-md-mailman.stormreply.com
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH 1/2] dt-bindings: display: Use consistent indentation in
 the example
In-Reply-To: <20260913123331.100293-3-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260913123331.100293-3-krzysztof.kozlowski@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 11:23:52 +0200
Message-ID: <87pkyg1907.fsf@ocarina.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: hc6UZMiTPPp-jwN_id56WinGk1rxTnctv6UhSBFj-V8_1789377835
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_022603_774245_82ECA492 
X-CRM114-Status: UNSURE (   8.04  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com> writes:

> Correct indentation in the examples to consistent 2- or 4-spaces
> indentation to fix dt-check-style warnings ("example 0
> [indent-consistent] indent mismatch ...").  Preferred is 4-spaces, but
> re-indenting entire example just for that is too much churn.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat


