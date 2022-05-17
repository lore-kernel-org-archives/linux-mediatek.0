Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 458D9C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 May 2022 18:36:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gdZrCVxpDfEXS3A6THWjrcLAkgO6HTiHup+Thd4eHtQ=; b=oDEX9OQvjPtPQ/
	XaDUMhGWLLZo8ngPgtj0ZqnbGPJfANQNewO72BS4l/5BayLa0aY5BnCbwGHXaEwXExsF5DXHYQb8p
	YJiCymbNGYAXaw1j7m0j6QhH4u9oiph/d4hgr+d3g7dEJE7NbI/gRVaTv8PWiwwXAGNX7/nTjRFw2
	mnkswoVz27OZw4cPwRL1eD76YabnTk3jzeG+p7AV4Vc3oUktM27D3YzbqDxvWGshhbCJI0vFCqPyo
	2thdy2vUsYyQ3z6ahMQm+rugdGzDsOBggbnbVSizGW9JQi2xQ+STwVjeJhK9JHlkoJPDYOeK0N8it
	/pmhKfJbu9+kAotoaPxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nr235-00FKuA-HP; Tue, 17 May 2022 18:35:59 +0000
Received: from mail-oa1-f52.google.com ([209.85.160.52])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nr232-00FKrL-Bz; Tue, 17 May 2022 18:35:57 +0000
Received: by mail-oa1-f52.google.com with SMTP id
 586e51a60fabf-f16a3e0529so14967692fac.2; 
 Tue, 17 May 2022 11:35:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=uT4mlGSo9wkGcsmi1CtjInRJB/kA6igNndb7eOFpdHc=;
 b=PLtVxWOv2jzp84PLg41YKlX6wasYtNR34Fsev6Wx359boCEMCrmyWWM2czFi0wn0Zt
 LtQqKTiC9mvSLWiVR4bPlpbdEXav90QDUStA9hhtakb6RJ2k20Siotf+/9P8sHZbM1lc
 G1K5tRSYrEOy6d341L1SxdOveMZApLemGFyTwDMi9cbZyjBxSnHV6LpZFRil8YVOSU/c
 yPzuAM3pncA14PVc8X3qT5v6zSh+FUtxNP21gGP2JiJh4aBG2sIclUsyXt/UKGDY8fHW
 lGirBHZkMtf3BGguDZe+Ial3A+eb6zFRBAv/dT5E6EifHEDi4hFD6mgtCuxvus6iJj5x
 jUvw==
X-Gm-Message-State: AOAM533NBU7BZsjA1eTBvfQNq9mQul2n+2Y/TXlk6EM1oJxDOrkiyuqk
 DN7WWLmv/LC7V8Sv/iyF2g==
X-Google-Smtp-Source: ABdhPJzUR8Qm1+s37SFKkN3y3YVTp69fOdZZUeq8CYIbwWDdBHEW2LD9zUy8Dm7A0l84PqMmkVSVww==
X-Received: by 2002:a05:6870:b40a:b0:d7:5c87:64ab with SMTP id
 x10-20020a056870b40a00b000d75c8764abmr13350053oap.168.1652812552134; 
 Tue, 17 May 2022 11:35:52 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 l10-20020a4a434a000000b0035eb4e5a6d2sm47454ooj.40.2022.05.17.11.35.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 May 2022 11:35:51 -0700 (PDT)
Received: (nullmailer pid 1387304 invoked by uid 1000);
 Tue, 17 May 2022 18:35:50 -0000
Date: Tue, 17 May 2022 13:35:50 -0500
From: Rob Herring <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 kernel@collabora.com, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org, robh+dt@kernel.org,
 nfraprado@collabora.com, sean.wang@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org,
 linux-gpio@vger.kernel.org, linus.walleij@linaro.org
Subject: Re: [PATCH v4 1/2] dt-bindings: pinctrl: Add MediaTek MT6795 pinctrl
 bindings
Message-ID: <20220517183550.GA1387243-robh@kernel.org>
References: <20220517083957.11816-1-angelogioacchino.delregno@collabora.com>
 <20220517083957.11816-2-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220517083957.11816-2-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220517_113556_452798_C2A15C3B 
X-CRM114-Status: UNSURE (   8.76  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, 17 May 2022 10:39:56 +0200, AngeloGioacchino Del Regno wrote:
> Add devicetree and pinfunc bindings for MediaTek Helio X10 MT6795.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../pinctrl/mediatek,pinctrl-mt6795.yaml      | 224 +++++
>  include/dt-bindings/pinctrl/mt6795-pinfunc.h  | 908 ++++++++++++++++++
>  2 files changed, 1132 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/mediatek,pinctrl-mt6795.yaml
>  create mode 100644 include/dt-bindings/pinctrl/mt6795-pinfunc.h
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
