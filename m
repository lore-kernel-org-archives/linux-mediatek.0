Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85614C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Jan 2022 01:49:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QGDKkpu+3GwW06mKtqg5AJTRZcldfhH5fRPfo5RsXUU=; b=rW1ZhHmRBm2U4Z
	YePhQBZ1tQyqGVIFK/mts3TpADkjO4+ILzcMTtWwIwFI00e6kH1jsCuy0VgIRoBLU1IAlMm0+sXrG
	WlB5JyYcL8mmS1accXxI0eaLfSl6PF5+yqaHXADa1zXkiHfs4OhXivRvpn6IG+A5fzZrt7aaEuiA3
	GzaQYtgJGqGIHn4lrpcCWWerrwDndYPYop+wI43vMxqqaYZox5J8g41IjpCCSmfdI5hAjNPnI0Sw3
	KVSUYP3CJzZK24IAN9Je8ld+dblaiG1qWjWMfqs546SyjK8ozZTIAiS////4gZtYctzGhF4NIY0mQ
	KSaU5c2pVxLfW0ReINbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7Slb-000hG3-4W; Wed, 12 Jan 2022 01:49:35 +0000
Received: from mail-ot1-f47.google.com ([209.85.210.47])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7SlC-000h0N-A7; Wed, 12 Jan 2022 01:49:11 +0000
Received: by mail-ot1-f47.google.com with SMTP id
 i5-20020a05683033e500b0057a369ac614so879902otu.10; 
 Tue, 11 Jan 2022 17:49:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=UPHuh7nUlNhunmzxkS2DT0Z6Udi668Vku2E5vSgqzcg=;
 b=KvL4/aHMbbcJ5pQdz7AS7pQC5XIr/2uBkJx2CP/YaNAty7e0iAWg1zu25rM4UYi4S9
 /O4g3df6HIjY3lMckVSytb60R/fBSIavREFdNz/pKxlp6DxGwVYoZIIFKR6IOD3eERn2
 IJJeJ+jcUcP2+E6QKX/eWnboGsrcRw5Q2TlkAezSyl/y1s+HtbnV4PC2Jl3Hyf9/xK7X
 aw9tOsgOdAQZCRulPdAVVAaIDJ1KcjLXeytpWC9W1DwTNEVnjt/Hd7dQROAxbcGE43Bq
 sQnYYtDMguah4xDwIe2VDwz1BCNLTUStVPrJFODsjRmwwedMdSDYptvvYFVPYkvXsuVw
 HHqg==
X-Gm-Message-State: AOAM531rcpE6KMebVm6Ebfgh8iOrrPP4WFOPZtf3dRd9Xbouh6lxp9/X
 Fy/Rx/VTExm3TLx/ZPfMHg==
X-Google-Smtp-Source: ABdhPJy+ZFeAfKBEgUiTlEDgUViJcPBXuLvv1l8zGjnO3HBnks6uNg5GCI3tJ/t8bhYXkYflB9kZlQ==
X-Received: by 2002:a05:6830:2785:: with SMTP id
 x5mr5269374otu.187.1641952149704; 
 Tue, 11 Jan 2022 17:49:09 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id d3sm2133809oiw.52.2022.01.11.17.49.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jan 2022 17:49:08 -0800 (PST)
Received: (nullmailer pid 3896384 invoked by uid 1000);
 Wed, 12 Jan 2022 01:49:08 -0000
Date: Tue, 11 Jan 2022 19:49:08 -0600
From: Rob Herring <robh@kernel.org>
To: Johnson Wang <johnson.wang@mediatek.com>
Cc: linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 devicetree@vger.kernel.org, Project_Global_Chrome_Upstream_Group@mediatek.com,
 matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org,
 angelogioacchino.delregno@collabora.com, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2 2/2] dt-bindings: mediatek: add compatible for MT8186
 pwrap
Message-ID: <Yd4zlMykh8GfZQtH@robh.at.kernel.org>
References: <20220107104633.7500-1-johnson.wang@mediatek.com>
 <20220107104633.7500-3-johnson.wang@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220107104633.7500-3-johnson.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220111_174910_395605_40D0E114 
X-CRM114-Status: UNSURE (   9.26  )
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

On Fri, 07 Jan 2022 18:46:33 +0800, Johnson Wang wrote:
> This adds dt-binding documentation of pwrap for Mediatek MT8186
> SoCs Platform.
> 
> Acked-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Signed-off-by: Johnson Wang <johnson.wang@mediatek.com>
> ---
>  Documentation/devicetree/bindings/soc/mediatek/pwrap.txt | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
