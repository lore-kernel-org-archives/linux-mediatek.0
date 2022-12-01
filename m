Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EB40C4332F
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Dec 2022 23:58:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MWVVNliZTYEWF5fFNtzs+9P9giHEjE14UGyme1WyflI=; b=2XHfcauetjpsV2/eebdFxQHCEa
	/pOC5LBS+vQ15owaNXZTmzE7QBSA4AyOTwPfXIWGgc7p40kSa36WdLZJ84UxmFnV5tzCC/8pfj8ES
	WKJ7YeeeFqkJhnG7+HEJLWMHJhsAGJJm/HmdW8tX8vf3JpAKzIAoHQ8SH08oWU6hi0J1BXQCWBpHA
	z63c5iSoYIye7A9eHuO3N6huD2u3ul4LsczJ9Nw0IOhYNO9YOJVMgqtwr+HJE2oWXXpQDed5MfLdl
	ps74Q7XUsW7mWHJy9BdOnmYBCrDPsbxVK5agxpH+rBSR7QcQEYLtEiiTvtNCsARKPrOFHa/3khJRp
	xecsoGvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0tRa-00Buc8-7q; Thu, 01 Dec 2022 23:58:18 +0000
Received: from mail-oi1-f174.google.com ([209.85.167.174])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0tRL-00BuRV-QZ; Thu, 01 Dec 2022 23:58:05 +0000
Received: by mail-oi1-f174.google.com with SMTP id h132so3788294oif.2;
        Thu, 01 Dec 2022 15:58:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MWVVNliZTYEWF5fFNtzs+9P9giHEjE14UGyme1WyflI=;
        b=ndDoF2i8o2XCw7aIvfKRD+T1Lhxt3wHkiMu2uC7aw+pxSgx1aOVqa7U2wCq+rn4LLH
         xKCKHEWUGWDZ9VutqPmOx9SfyybTQIqwZTdVR5qxdlsVT9bjKQI3a0/mNT6llL0TqExN
         JuhveyZy3rbgIZb/mQDEyZDv5ZPUMYyBXiZ8VKqLUGNDveVbjV+RC0ALaURLa+bqYFfz
         VSi2EE8kRIZyTyQcGnxXqofMqtSh5YBotZCSMSTVnYOeRIFmy+8nYPTR1PFmaXoRUYKD
         UvdQ8rCbd4tupSHdr/xmBKmEvTXYidWNaAd9QZ7wX2xpKmvo6t39EhoL6bxhBagpvXQ2
         Q8Rw==
X-Gm-Message-State: ANoB5pm4LUnFoPgoce+pQNJOiMUGhLC/qCbLPXkjKY+cXchIFZ2LEM1M
	E3z85r++LeOMrpoYlL7B7g==
X-Google-Smtp-Source: AA0mqf4YVTkuZvfflbzP+Mc3FwFsYD5Oo+5FxUcIgBACGlK4Na2GfKNmSrAZRDWlBHAEh8J3UbTh3A==
X-Received: by 2002:a05:6808:81:b0:354:b67e:611d with SMTP id s1-20020a056808008100b00354b67e611dmr34806088oic.210.1669939081714;
        Thu, 01 Dec 2022 15:58:01 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id ca19-20020a056830611300b00661a3f4113bsm2731191otb.64.2022.12.01.15.58.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Dec 2022 15:58:01 -0800 (PST)
Received: (nullmailer pid 1720098 invoked by uid 1000);
	Thu, 01 Dec 2022 23:58:00 -0000
Date: Thu, 1 Dec 2022 17:58:00 -0600
From: Rob Herring <robh@kernel.org>
To: Yunfei Dong <yunfei.dong@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Benjamin Gaignard <benjamin.gaignard@collabora.com>, linux-arm-kernel@lists.infradead.org, Project_Global_Chrome_Upstream_Group@mediatek.com, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, Chen-Yu Tsai <wenst@chromium.org>, devicetree@vger.kernel.org, Steve Cho <stevecho@chromium.org>, linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org, Hsin-Yi Wang <hsinyi@chromium.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-kernel@vger.kernel.org, Tiffany Lin <tiffany.lin@mediatek.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v3,2/3] media: dt-bindings: media: mediatek: vcodec:
 Change the max reg value to 2
Message-ID: <166993907978.1720037.12508933639302184491.robh@kernel.org>
References: <20221201121525.30777-1-yunfei.dong@mediatek.com>
 <20221201121525.30777-2-yunfei.dong@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221201121525.30777-2-yunfei.dong@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221201_155803_880744_E5D85B73 
X-CRM114-Status: GOOD (  11.31  )
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


On Thu, 01 Dec 2022 20:15:23 +0800, Yunfei Dong wrote:
> From: Yunfei Dong <yunfei.dong@mediatek.corp-partner.google.com>
> 
> Need to add racing control register base in device node for mt8195 support
> inner racing mode. Changing the max reg value from 1 to 2.
> 
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> ---
>  .../bindings/media/mediatek,vcodec-subdev-decoder.yaml      | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>

