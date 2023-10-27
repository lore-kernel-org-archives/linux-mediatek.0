Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E245C25B47
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Oct 2023 21:28:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XdTt8PHQuQvOBpC1eoOsFL8Yp23vOfTSoEW4AkdQHjg=; b=AuK8mIJ3SXLvH80qz6rWagty5X
	Srpe1sSVVtSKjsfLy1thNb05ZnPMlSwTPkZeOBUTgvup/jS6Fg9MUELFaIUSgs/+l9DKjdCQdYMgK
	djdNipX6N1oGqZMeGUU//Icfx3Vd4A/rLwNITPRm5QCR4pmry3qYPm9Zrbi0Z6J1MgDnw6bGOVx3D
	RjI1zvvxroIcE6SXInrG1/w9plDVoiq7XLj6PeVYlOtJTJA8cMyP3NOfvzMyALk6wnReFcTh3avfA
	T25gRNascNGlOQPG5uqXTak/TDq4GHOu1PmHuN4jOwP23SUdFJSRHm5UY0zFV6IdtDBk15RSjZp6z
	zU/sp4sA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qwUNy-00HEkC-0G;
	Fri, 27 Oct 2023 21:28:54 +0000
Received: from mail-ot1-f43.google.com ([209.85.210.43])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qwUNv-00HEjU-1B;
	Fri, 27 Oct 2023 21:28:52 +0000
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-6ce353df504so1574694a34.3;
        Fri, 27 Oct 2023 14:28:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698442126; x=1699046926;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XdTt8PHQuQvOBpC1eoOsFL8Yp23vOfTSoEW4AkdQHjg=;
        b=muVR13T2m4iM5oXHGAAGpHak5c7K/e+B8iB6cISwMvoTlOv8e5A1BKyw8raG1Hpg+q
         SEoh+ckouwYWsHCzgpU3vQDDZ+ZB3iewWLX3nfZV/u+yiXEAIN7d4oywuHzC+2iXEopr
         pas2z4Nk0cgUU/KAKwRB1LawvtmNc8eVCOLzhbpgQvzZ8x/Ny2txasx/P3gtwLoVpLIV
         bIVgZELMpU/8ZjfqvBjqyA1WwUcN0+xA/LZrzd/FUP0F9XmnKxmlwG746FLXI6zH3pQV
         T9ul6iXBzwDgYiPZDQxih8i/3ty5A6oXQ/QQebC4nBTupO3549tYoYmmR//lvpjQgWE+
         P9bA==
X-Gm-Message-State: AOJu0YzgOvzIldXdDqXJOWmY/+FAgPeJ0oJU9W9g2SxYtzdmQY/KAMWT
	QduydI4w+LOxfefCzXLROw==
X-Google-Smtp-Source: AGHT+IH3L+ldv23BqrbLR5j2Gob04xH3oLMKR+tpIoBoSpo4Bj82KhLgNfRTveofQx3CPQG3Kk+lXQ==
X-Received: by 2002:a05:6830:6b47:b0:6ce:2a70:c76c with SMTP id dc7-20020a0568306b4700b006ce2a70c76cmr3705297otb.23.1698442125686;
        Fri, 27 Oct 2023 14:28:45 -0700 (PDT)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id b2-20020a056830310200b006ce1f9c62a1sm422025ots.39.2023.10.27.14.28.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Oct 2023 14:28:44 -0700 (PDT)
Received: (nullmailer pid 3403056 invoked by uid 1000);
	Fri, 27 Oct 2023 21:28:43 -0000
Date: Fri, 27 Oct 2023 16:28:43 -0500
From: Rob Herring <robh@kernel.org>
To: Hsin-Yi Wang <hsinyi@chromium.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Conor Dooley <conor+dt@kernel.org>, =?iso-8859-1?Q?N=EDcolas_F_=2E_R_=2E_A_=2E?= Prado <nfraprado@collabora.com>, Macpaul Lin <macpaul.lin@mediatek.com>, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Bernhard =?iso-8859-1?Q?Rosenkr=E4nzer?= <bero@baylibre.com>
Subject: Re: [PATCH v4 4/7] dt-bindings: arm64: mediatek: Add
 mt8183-kukui-jacuzzi-makomo
Message-ID: <169844212339.3402995.3814643307780522383.robh@kernel.org>
References: <20231026191343.3345279-1-hsinyi@chromium.org>
 <20231026191343.3345279-5-hsinyi@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231026191343.3345279-5-hsinyi@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231027_142851_409625_12634A16 
X-CRM114-Status: UNSURE (   9.49  )
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


On Thu, 26 Oct 2023 12:09:13 -0700, Hsin-Yi Wang wrote:
> Add makomo sku0 and sku1 which uses different audio codec.
> 
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> ---
> v3->v4: remove error const.
> ---
>  Documentation/devicetree/bindings/arm/mediatek.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>


