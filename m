Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 109DCC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 May 2022 16:18:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X4gWcx8R2Q1whXTXakIEIdVLXpyflmQW2IKKnYiXXlU=; b=Wl6vPZ1l4upV2T
	AcYo5p168x81vKP0QOLyLo1UiOUov9rVFvRBoHi3wxiZJLA+3piLupIrMuplm2M/BrsXah8qnLjjP
	BEISpfRTj7SqOl/mny8Jswk/4UMyUiju1C0OHGtLwHdMBa4JSlzbSHUekg9CABPVb8b4FQxOkPOUO
	APvv93/oGlulkShJfgTMrDi2m0N/9NrDaJTfZlOV7Zxxhx0wsg7+AriwhCRoIFoPa9bs4tpy3d1aH
	3+5bjCZm3+A2wBrVUD4Q6rk3eSPh9eK+3y0/rmfurIGXUGpXjhQKLBSztkq/M4ZX5mKyc1ZjeNjNw
	Oh41o8RmGi6ZFX9DBFeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1noSZ0-0030Mh-4C; Tue, 10 May 2022 16:18:18 +0000
Received: from mail-oa1-f44.google.com ([209.85.160.44])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1noSWR-002z2b-HR; Tue, 10 May 2022 16:15:40 +0000
Received: by mail-oa1-f44.google.com with SMTP id
 586e51a60fabf-ed9ac77cbbso18878279fac.1; 
 Tue, 10 May 2022 09:15:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=n14QA1P7oePz3evcHmzcIhg/DgJOsOv+Y1omuVu5O5E=;
 b=UpPakxc5ZVgciqd47JVLIFfmiAReS1JMIh0ZSxhDpaSHfvIlL7DZ6ezmOuSNCDGYKM
 FzBtvzFdEdnF0a23re0HcccxjGmkbuIdS+j1wRR+qKJEuup8G1iGhBZ7T9joWmX8yPPh
 +3/uNrb9jkiyWBLrGOOeWN6kJCeoRD9345tclU9t2HwNbDtTMqAcXb/TXw6TovspbxX3
 qEhd97OvfVToIG0al3dhcqA22IvrnlNVjFR6q+Wk/GIajM1A1vzClrRXcd4VE4su4j6F
 sYKpWNhYtQ11MxrjFZXNsiNm/KB094rDFkE//SWHxkRwHGA1uCsLm0wMfzURMly2Be1A
 E/6w==
X-Gm-Message-State: AOAM530eMxJFMQYilya/aVjT7apHazGiqMxl9BU1otjMf+1JHgfZQsGC
 YbZSsj2KHFVrTSWyvrWIVw==
X-Google-Smtp-Source: ABdhPJxNS+UjPDxklWYP51TqZo2548RbxbsF6xlX21sdxq74zE7u6VaG+tkilA/diznI1DPUxmaTTA==
X-Received: by 2002:a05:6870:898f:b0:e2:c13a:44d9 with SMTP id
 f15-20020a056870898f00b000e2c13a44d9mr469850oaq.170.1652199337418; 
 Tue, 10 May 2022 09:15:37 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 r11-20020a9d7ccb000000b005b2353c5f4fsm5926580otn.0.2022.05.10.09.15.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 May 2022 09:15:36 -0700 (PDT)
Received: (nullmailer pid 2122351 invoked by uid 1000);
 Tue, 10 May 2022 16:15:35 -0000
Date: Tue, 10 May 2022 11:15:35 -0500
From: Rob Herring <robh@kernel.org>
To: =?iso-8859-1?Q?N=EDcolas_F=2E_R=2E_A=2E?= Prado <nfraprado@collabora.com>
Cc: kernel@collabora.com, Chen-Yu Tsai <wenst@chromium.org>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Luca Weiss <luca@z3ntu.xyz>, Maxim Kutnij <gtk3@inbox.ru>,
 linux-kernel@vger.kernel.org, Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Sean Wang <sean.wang@mediatek.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Fabien Parent <fparent@baylibre.com>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Sam Shih <sam.shih@mediatek.com>
Subject: Re: [PATCH v2 01/16] dt-bindings: arm64: dts: mediatek: Add
 mt8192-asurada-spherion
Message-ID: <YnqPp6KbZpSdvCN5@robh.at.kernel.org>
References: <20220505194550.3094656-1-nfraprado@collabora.com>
 <20220505194550.3094656-2-nfraprado@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220505194550.3094656-2-nfraprado@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220510_091539_621166_D280EA12 
X-CRM114-Status: GOOD (  11.19  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 05 May 2022 15:45:35 -0400, N=EDcolas F. R. A. Prado wrote:
> Add binding for the Google Spherion board, which is used for Acer
> Chromebook 514 (CB514-2H).
> =

> Signed-off-by: N=EDcolas F. R. A. Prado <nfraprado@collabora.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> =

> ---
> =

> Changes in v2:
> - Added this patch
> =

>  Documentation/devicetree/bindings/arm/mediatek.yaml | 8 ++++++++
>  1 file changed, 8 insertions(+)
> =


Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
