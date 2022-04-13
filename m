Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5672FC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Apr 2022 23:03:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8cBlHoV1Mi2kNpQC1BS/l6PECYAaFCRHmlsDoYJfUHk=; b=g9owTSQUifkVdA
	RRMC6xPRJ1eEja3sow5HTEpxdl/4H+740uN8PGKO9i4ax3dV6uEM3yiFXeB+OIiHt6/uH9RVbu7iF
	M5PY/cABy2D26dm0flqeYlka6JXIaPAzi9Wjf9HS78j28k17SzkdehoR6pinK0crh95xkoNq4BWI1
	T8avA4bo6zuQ3zojE+J3J3KSwC6E/R6Jb/bh1i0seo3VLRgds8NyZ14LAUgwMUXBT2suNevXsoKvh
	2K/DP9hhuNBDVZhACuC17TvZjrFb2Ca8RaMcWg5ze/IybaBRITUjqPqLx/2uKr2BA/U/rrz3c5lhX
	sm5iUyDL3LPZyLpF4f2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nem1b-0032OA-LC; Wed, 13 Apr 2022 23:03:47 +0000
Received: from mail-ot1-f45.google.com ([209.85.210.45])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nem1Z-0032MQ-Dc; Wed, 13 Apr 2022 23:03:46 +0000
Received: by mail-ot1-f45.google.com with SMTP id
 m16-20020a9d73d0000000b005f8edc0599eso493344otk.11; 
 Wed, 13 Apr 2022 16:03:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=e6n2orThYJMK64yUyZXxxDzaxl2UslTETHJ5TJ4xxPU=;
 b=sjtX1fRafTBcutAQbDP5il2dDSwhycaNq7zIycu00lmXTQjstibvUFfTWpzxHLCF2Q
 7wCT6PvgbGV3USJ9TvVgeK49e3RWqu00tWZl71LOEGzWKLdfI0KCsW3q73H99YT0nybS
 9oic+4IqOjlYDL3sM/tvcw56+rQIB3C+LSJ2WJkmiVvf5MMYCwuhBGRn9KJdTXcjt/zb
 2/tITlLUQiq2fIIqTdKpleGj/0n/G+Jr9rucCVHj3iGk0dKrTrmFWDIW5AwfSeUvJgVE
 Lpi/oHc1QQyoFoc4SGWm6hFfBQuoBLd9GKf/8LCckAZvvsu193QwBBQ9DU8AFSJbxc6h
 zOYg==
X-Gm-Message-State: AOAM530KVQkBUj0NX4QBNzEkAk8N5AZF/5TL3a16yZtDFLVnwwlx3F3F
 7wlaDrR2CWfkINTK64sBAg==
X-Google-Smtp-Source: ABdhPJx4S2rZ6YIF3m+FvOThc9/KLWF8G4Kb7iko6OSV2RpyAjSqfaz7em5gsvnl9O5ufXXm0kcohA==
X-Received: by 2002:a9d:6047:0:b0:5b2:4003:cfcb with SMTP id
 v7-20020a9d6047000000b005b24003cfcbmr15452834otj.59.1649891024123; 
 Wed, 13 Apr 2022 16:03:44 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 o18-20020a9d7652000000b005cbf6f5d7c5sm152356otl.21.2022.04.13.16.03.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Apr 2022 16:03:43 -0700 (PDT)
Received: (nullmailer pid 4104301 invoked by uid 1000);
 Wed, 13 Apr 2022 23:03:42 -0000
Date: Wed, 13 Apr 2022 18:03:42 -0500
From: Rob Herring <robh@kernel.org>
To: Moudy Ho <moudy.ho@mediatek.com>
Cc: jason-jh.lin@mediatek.com, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Alexandre Courbot <acourbot@chromium.org>, srv_heupstream@mediatek.com, 
 allen-kh.cheng@mediatek.com, devicetree@vger.kernel.org, 
 linux-media@vger.kernel.org, daoyuan huang <daoyuan.huang@mediatek.com>, 
 tfiga@chromium.org, xiandong.wang@mediatek.com, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Ping-Hsun Wu <ping-hsun.wu@mediatek.com>, river.cheng@mediatek.com, 
 Matthias Brugger <matthias.bgg@gmail.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com, 
 Rob Herring <robh+dt@kernel.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 drinkcat@chromium.org, randy.wu@mediatek.com, roy-cw.yeh@mediatek.com, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 hsinyi@google.com, 
 Rob Landley <rob@landley.net>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 pihsun@chromium.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v15 4/6] dt-bindings: soc: mediatek: add gce-client-reg
 for MUTEX
Message-ID: <YldWzq2oiRxUdPz4@robh.at.kernel.org>
References: <20220411074925.25539-1-moudy.ho@mediatek.com>
 <20220411074925.25539-5-moudy.ho@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220411074925.25539-5-moudy.ho@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220413_160345_501049_4083484E 
X-CRM114-Status: GOOD (  10.06  )
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

On Mon, 11 Apr 2022 15:49:23 +0800, Moudy Ho wrote:
> In order to allow modules with latency requirements such as MDP3
> to set registers through CMDQ, add the relevant GCE property.
> 
> Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Reviewed-by: CK Hu <ck.hu@mediatek.com>
> ---
>  .../bindings/soc/mediatek/mediatek,mutex.yaml        | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
