Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72343C77B6E
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Apr 2023 14:54:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q1ld4A+EyaOJZgwE8soDndJOLjPy4G9o1T3qC2VEjLU=; b=q9UPUzEYQEDiQTFHqf6t7wDr+4
	b6hu3WQeGQTe6W6QLDEe3kuuR7g4M9XkB8TKs+mtTrv6DC6a++VwdKIP8ELZH7YeTx7HIgePU30pL
	v1ZnZ04u6Jy+LQ/4jq/oRyIu0lGLKxydDFmK/JoXHVaeJyScn7BXZrGf5BMxAKuKW9WLYcRjtzoAR
	wGfmyaGX7DFGtIJpnS0O5A1SxOhlmL9qALQZQNthu9eQxbecGmP0YSX9iwNkl4z7VD+395606E/y7
	5mGxWOTJ/MspEVo1sU58YEavT9ohLCtSYlErA3VmomKiWWmJ67txM0CGBbuDkPAB4U5Qhbv5GD9C8
	QyEw486Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmbrR-003Y3O-1z;
	Wed, 12 Apr 2023 14:54:13 +0000
Received: from mail-oa1-f54.google.com ([209.85.160.54])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmbrO-003Y2F-0c;
	Wed, 12 Apr 2023 14:54:11 +0000
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-18447b9a633so11363465fac.7;
        Wed, 12 Apr 2023 07:54:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681311248; x=1683903248;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q1ld4A+EyaOJZgwE8soDndJOLjPy4G9o1T3qC2VEjLU=;
        b=iyoetxTsfgLp0ZgJ39u65qrWeQ01c8QREA1ZhHGjIv7hsHTk+bG6YCOzr20yBixy7J
         jg6jscuubrqcEgaAdqNTvf64nd4z48qgW59zYKjLwuoUXLwa0M+1r36ylK1epvNWFYAQ
         S+a9JOmyKuDMGIP01MVstrOunFyN7JZXk2xRLrSA+HjmfwSL5ZEskEZCMtnZMDLs3xpy
         h0LOkcAFRr2arFVQvsWO6a0z5nOD+ED5tsPJ4kGA+aIQoOQbpf9wku33u4fAKnMCHXU7
         9tFOH+Qi+AqtLnt6hRliTGzFYYNe+z6er99INxf+iNnqOViMP0elghaOZMAcwd7fgqD7
         99YQ==
X-Gm-Message-State: AAQBX9dZpsD3Beq7CN/PjWVRstfNWq0yHl/clhLT/zqLKfcrN/NnfgBY
	TBfmBwN+zpLMsvLWqCzBtA==
X-Google-Smtp-Source: AKy350at9PyNT3M+ayDldLAfkYAQQX91gENPKVxW3VTEOJNxL5dGtdL3HANsRimXIALqRDVmi7e/EA==
X-Received: by 2002:a05:6870:4687:b0:17e:7d94:8b39 with SMTP id a7-20020a056870468700b0017e7d948b39mr12087755oap.41.1681311247820;
        Wed, 12 Apr 2023 07:54:07 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id s32-20020a05687050e000b001729072f759sm6290375oaf.0.2023.04.12.07.54.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Apr 2023 07:54:07 -0700 (PDT)
Received: (nullmailer pid 2352212 invoked by uid 1000);
	Wed, 12 Apr 2023 14:54:06 -0000
Date: Wed, 12 Apr 2023 09:54:06 -0500
From: Rob Herring <robh@kernel.org>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org, Tianping Fang <tianping.fang@mediatek.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-kernel@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v2 6/7] dt-bindings: usb: mtu3: add two optional clocks
Message-ID: <168131124617.2352153.5564680427072213630.robh@kernel.org>
References: <20230407082937.14558-1-chunfeng.yun@mediatek.com>
 <20230407082937.14558-6-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230407082937.14558-6-chunfeng.yun@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230412_075410_230684_261EFA0F 
X-CRM114-Status: UNSURE (   9.47  )
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


On Fri, 07 Apr 2023 16:29:36 +0800, Chunfeng Yun wrote:
> Add optional clock 'xhci_ck' and 'frmcnt_ck';
> Add optional property "assigned-clock" and "assigned-clock-parents";
> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
> v2: remove assigned-clocks* properties suggested by Rob
> ---
>  Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>


