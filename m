Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B452C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Mar 2022 23:06:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K/zrLNWBM4gpPfTryoGjdd8FFeauobTp6Xy7eWbdYps=; b=qAQu5BN6/vk9eb
	QzvXtd6NPOXADz2eUjp2AVFfsNe32lbgfo1xy+iEVR+zTad/EUnvMqwUge4tKxDOt3zQb2y44jJ4x
	c7TgJ9ZHJySElzvC6E//5+k1V2Q5gz7+15jb9sFJ1Tkdfc1s2Ee2lXy0RgAaD+PrV8s3CW9i5nNMD
	FRndebglWp/cdFGrHBQlVS0o3+Sot4jcTE7gHfZC7nKBS7ra/WL6cA9wj95G10CAsn8CUpiGz09qY
	LuH/ua57nhQwwQgJzy1h7Z1Ngjp6xoy9S6ghKT2e196q6OBVfIhJ+UV60x7Y1nQ81k9q3dH8f+lFO
	LsHzviLGGggmnGlScZ9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nQH08-00CGVl-Nh; Fri, 04 Mar 2022 23:06:20 +0000
Received: from mail-oo1-f49.google.com ([209.85.161.49])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nQH06-00CGUw-Eo; Fri, 04 Mar 2022 23:06:19 +0000
Received: by mail-oo1-f49.google.com with SMTP id
 j7-20020a4ad6c7000000b0031c690e4123so11094912oot.11; 
 Fri, 04 Mar 2022 15:06:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Wt8pADc1Xor517rfKpON9c9f/2mIwEXF0gypcO8fZOg=;
 b=bLc8xDiJjQBX7pWa6HAYmpgTP0KyBSoSKMuH67e5HmCihxuds3OE3uXYuSlNqZSGar
 wGjmFgQzzwXJPKXUQSy9qQPVF1gp/ACGyHsT/SPzHOKaB9z5rP4Ob6+RLL0DmXKaeiTt
 LuXcXia5OGXg+m9EkZ1hI+mQoVMecqx7WLSRNetH/2jzsrW5VXRtA5sK34dVYGGLb0J3
 ddzVTRuOIDZQtvbj0+kNLyMEyI8hXtQonsVusll/T4tcCj4ph1Q6B3AMFuWAQmYP9MAA
 K3BpWnjS6Kh0fY89lazCIAFnsQuLITVJpo4GVINPC/WhM6N0BcSlkVURclEFN+hiMuV4
 4YnQ==
X-Gm-Message-State: AOAM530he+6/om+UAjPlTsUAZd4Hj+JiBXJXLwb2QzH15dptimXPZZwd
 6V+FIVc09MvF/bnfsfVUog==
X-Google-Smtp-Source: ABdhPJxcHFc8pGWIPi9xglYELcNC4ePLZUFOeeyR3mGpf4U+jexVsZL+RpS2hNK3I//uPFqp5YAPcg==
X-Received: by 2002:a05:6870:7a3:b0:d7:5fbf:37b7 with SMTP id
 en35-20020a05687007a300b000d75fbf37b7mr401545oab.16.1646435177210; 
 Fri, 04 Mar 2022 15:06:17 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213]) by smtp.gmail.com with ESMTPSA id
 y28-20020a4aea3c000000b0031c0cddfbf9sm2936625ood.20.2022.03.04.15.06.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Mar 2022 15:06:16 -0800 (PST)
Received: (nullmailer pid 626164 invoked by uid 1000);
 Fri, 04 Mar 2022 23:06:15 -0000
Date: Fri, 4 Mar 2022 17:06:15 -0600
From: Rob Herring <robh@kernel.org>
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Cc: linux-mediatek@lists.infradead.org, Daniel Baluta <daniel.baluta@nxp.com>,
 cujomalainey@google.com, Allen-KH Cheng <Allen-KH.Cheng@mediatek.com>,
 Linux-ALSA <alsa-devel@alsa-project.org>, tzungbi@google.com,
 Jaroslav Kysela <perex@perex.cz>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org, sound-open-firmware@alsa-project.org,
 Jassi Brar <jaswinder.singh@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-kernel@vger.kernel.org, Jassi Brar <jassisinghbrar@gmail.com>,
 devicetree@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
 Chen-Yu Tsai <wenst@chromium.org>
Subject: Re: [PATCH v18 1/2] dt-bindings: mailbox: mtk,adsp-mbox: add mtk
 adsp-mbox document
Message-ID: <YiKbZ8NRyCbcm1Gi@robh.at.kernel.org>
References: <20220225132427.29152-1-allen-kh.cheng@mediatek.com>
 <20220225132427.29152-2-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220225132427.29152-2-allen-kh.cheng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220304_150618_517315_31384F15 
X-CRM114-Status: GOOD (  11.34  )
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

On Fri, 25 Feb 2022 21:24:26 +0800, Allen-KH Cheng wrote:
> From: Allen-KH Cheng <Allen-KH.Cheng@mediatek.com>
> 
> This patch adds document for mediatek adsp mbox
> 
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../bindings/mailbox/mtk,adsp-mbox.yaml       | 50 +++++++++++++++++++
>  1 file changed, 50 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mailbox/mtk,adsp-mbox.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
