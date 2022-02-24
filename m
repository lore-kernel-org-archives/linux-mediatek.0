Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B599C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Feb 2022 19:16:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5hznH3xhU0+vPBQ5gvOnJJ+AqE6Kj8liuaeYimjD5y8=; b=VLF/OkOr9Sdf9H
	3m3SeBWM5fb0HGtDvQIpg/04+dGFUwFvRKw7JRXJHDi3v6g+QLAEVJUqTlRbxOez/XKGW4P1VCmlA
	Ui76KMSwFJqwzIJh+KWAFAnDYYg3IeOd5D+Qr0RQWMhaLszG2uTUkNNBmlw28gNdDiU/vexefC2u+
	2MBafZpbn+Y87B53CVxqNsq+xlpnGMaPdAVk3MCnJZLxdkJ05imAzw16nn+XaVZ4XGJHiMfGG10J3
	VtyoXU+dklhZjCWfQxRFg/EZbHp6LkCuKI34/xwgrsq5nh/sVuKdZABpViMjnw3s5IV5muur4JVqn
	Xq38hhnmygLnnAPkEkNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nNJb9-0026Gi-LQ; Thu, 24 Feb 2022 19:16:19 +0000
Received: from mail-oi1-f172.google.com ([209.85.167.172])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nNJb7-0026F8-CY; Thu, 24 Feb 2022 19:16:18 +0000
Received: by mail-oi1-f172.google.com with SMTP id 12so4310426oix.12;
 Thu, 24 Feb 2022 11:16:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=CIZ8l9ggHI+ksF9ySGra6oc3DHVzkCgMYu8j36TV9TY=;
 b=6tQLaF0VqXAeqS8bGpxMtZOuvvGrM/llOn7yLZ3a36ah+BlT+Uo8Icb/FfaqnXzo+d
 UVXRCg3I5nWXNkp+pdWGSir0HtrY/rdczbE24Qx1g4OLkH9UroFnF7HrYRPJ1WwdeJm+
 nAVRedxzrf4JqhSf3f0TqYOHvnpBgBhcxURGwYJtsyzsv5dYwVM6zqXpX1E1KjuEBiyg
 OfjVvzwiohlNE6HDhWz/3jyApjn5gvsOh1ciber0M+AopPjQoZ08c+m3XJ5Vyc7spnAp
 VZBelIkEBFpPYIdw6JdrhRczLjOKg9qIi+PksC3CdzJmDI9SL1STWIng484xumNiG55n
 ibyw==
X-Gm-Message-State: AOAM531DDfnVP8iV0s8z6D/H0OM0jPfvnaxfPbTbZDFpu4vX7KFEa2I5
 S3L2uJysHtzKb4GVUHRLQQ==
X-Google-Smtp-Source: ABdhPJwxUu9mkz92flMo29/vSvMvRas73bEu7/GHucHHjC7qW5h3B9JoZfONOkccBnWTGnjHJiY6/g==
X-Received: by 2002:aca:6083:0:b0:2cb:5570:7564 with SMTP id
 u125-20020aca6083000000b002cb55707564mr8499482oib.57.1645730175518; 
 Thu, 24 Feb 2022 11:16:15 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213]) by smtp.gmail.com with ESMTPSA id
 9-20020a9d0c09000000b005afabd759cfsm80036otr.65.2022.02.24.11.16.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Feb 2022 11:16:14 -0800 (PST)
Received: (nullmailer pid 3428805 invoked by uid 1000);
 Thu, 24 Feb 2022 19:16:13 -0000
Date: Thu, 24 Feb 2022 13:16:13 -0600
From: Rob Herring <robh@kernel.org>
To: Rex-BC Chen <rex-bc.chen@mediatek.com>
Cc: linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org,
 p.zabel@pengutronix.de, hsinyi@chromium.org, devicetree@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, yongqiang.niu@mediatek.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, matthias.bgg@gmail.com, fparent@baylibre.com,
 daniel@ffwll.ch, airlied@linux.ie, jassisinghbrar@gmail.com,
 chunkuang.hu@kernel.org
Subject: Re: [PATCH v4,1/5] dt-bindings: arm: mediatek: mmsys: add support
 for MT8186
Message-ID: <YhfZff2KIPdOm53H@robh.at.kernel.org>
References: <20220222052803.3570-1-rex-bc.chen@mediatek.com>
 <20220222052803.3570-2-rex-bc.chen@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220222052803.3570-2-rex-bc.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220224_111617_445250_6FB0B075 
X-CRM114-Status: UNSURE (   9.02  )
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

On Tue, 22 Feb 2022 13:27:59 +0800, Rex-BC Chen wrote:
> Add "mediatek,mt8186-mmsys" to binding document.
> 
> Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> ---
>  .../devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml         | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
