Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AFEEC43334
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Jul 2022 22:29:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ydROe5Yeqe7LKLvisIFiWDBcUFI7G/LxHrwDl1ZPZes=; b=G3KZz9WUQZZkPf/Q0It8iytEfn
	xnrPynTN5M7gWk6dqn0MIMXsau+W7tChJ/z3wCji06xfrJAogeJWb+5HA/Ji2Y1I035CPzKagwQJt
	CsC8tHIwWiOtc2YYBQ9wzxLFkHp9xRZGL/d86QM/k7X4epVZ1LdK/fyqkGPS9KTVhwU3GZ54yVO8p
	5gXJKTewrAFDRC8pHb6dm3zT1IKbGUQkWpMP8CxjErLJy5yW7IsQAtKL0hWfJC0/A3fWanslkdheH
	wn7l8BFsZDi7S5Gdci3qAQYbD4qR1+nelxXFRvJPuQSVpK5Ha9ZPDxuv3qY5BTeAhVjkPq5n3Q4xs
	fQ+I+R7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oG6ZM-003DBJ-Ny; Mon, 25 Jul 2022 22:28:56 +0000
Received: from mail-oi1-f176.google.com ([209.85.167.176])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oG6Z1-003Cm5-O0; Mon, 25 Jul 2022 22:28:37 +0000
Received: by mail-oi1-f176.google.com with SMTP id j70so15183201oih.10;
        Mon, 25 Jul 2022 15:28:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ydROe5Yeqe7LKLvisIFiWDBcUFI7G/LxHrwDl1ZPZes=;
        b=R/WWximNqBNanmOlMVfOH2k2M3oUX3LCNZQJW2j9KS4Xvne6z3dKNdsnm13IJD/ea8
         ExUzFsG7OqcoEzWC3Pw4CwHOu2zlRuDz7+F+2+FHF4l3ejyX+LPB5SeNe859izeW7mm9
         8T8MBM4WZRm+TDVlg8qjE0uKcQK5yS2TW8HBbLIQGAtOkSxOD8eMsNnH1MTiM9Aor7bN
         3Q2Ir43waYB3FmhKXdkhRw6vlNVX0YCnjjncoFeCbzRH2G89An1MBIiXwKkg+QQsrKnW
         5jNIRj7qKXdpzf7pkR+tw8E2C+Hy1J6LmmVmgMezprkkQuauDvkERmfyLKBSCOHN3bnJ
         Ejng==
X-Gm-Message-State: AJIora9pWR5CM4UMhpi2J/RDi+auoTQTOW0otK9HfTGEoxtcGbyHA/VD
	qJUntVZM+XABLaKp43/T2g==
X-Google-Smtp-Source: AGRyM1s71mYHjgRvajARzt6yUDLac3slJauP/Yk6irLnti0u1tVfqTcvRz9lQPTSlzY1oaeDkp/SWA==
X-Received: by 2002:a05:6808:bce:b0:33a:c6c8:9d6f with SMTP id o14-20020a0568080bce00b0033ac6c89d6fmr6219832oik.135.1658788114842;
        Mon, 25 Jul 2022 15:28:34 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id b17-20020a056808011100b0033a9f4c13cesm5322861oie.13.2022.07.25.15.28.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Jul 2022 15:28:34 -0700 (PDT)
Received: (nullmailer pid 2859320 invoked by uid 1000);
	Mon, 25 Jul 2022 22:28:32 -0000
Date: Mon, 25 Jul 2022 16:28:32 -0600
From: Rob Herring <robh@kernel.org>
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Jitao shi <jitao.shi@mediatek.com>, Project_Global_Chrome_Upstream_Group@mediatek.com, Rob Herring <robh+dt@kernel.org>, dri-devel@lists.freedesktop.org, Matthias Brugger <matthias.bgg@gmail.com>, Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>, linux-arm-kernel@lists.infradead.org, hsinyi@chromium.org, linux-mediatek@lists.infradead.org, fparent@baylibre.com, CK Hu <ck.hu@mediatek.com>
Subject: Re: [PATCH v2 1/1] dt-bindings: display: mediatek: dpi: add
 power-domains property
Message-ID: <20220725222832.GA2859262-robh@kernel.org>
References: <20220720130604.14113-1-allen-kh.cheng@mediatek.com>
 <20220720130604.14113-2-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220720130604.14113-2-allen-kh.cheng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220725_152835_849642_574149A4 
X-CRM114-Status: GOOD (  11.60  )
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

On Wed, 20 Jul 2022 21:06:04 +0800, Allen-KH Cheng wrote:
> DPI is part of the display / multimedia block in MediaTek SoCs
> and is managed using power controller in some platforms. We add
> the power-domains property to the binding documentation.
> 
> Fixes:9273cf7d3942("dt-bindings: display: mediatek: convert the dpi bindings to yaml")
> 
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../devicetree/bindings/display/mediatek/mediatek,dpi.yaml   | 5 +++++
>  1 file changed, 5 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

