Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD838C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Apr 2022 18:51:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DFZh4h/9qA7bTFvtIrq/wkCe8AlRTXGo2FtTbJW7hnI=; b=FNEH+iEG2brCZS
	j56pX4G8fDZUHoGBKjlTlWC5ujPnuDHQKcA5eU5v70gxKMFTnDuMQRPUm1Bf9cYS6Bhhfz9u+6V9k
	Kl7YS1OLizyA1qJnAuxo3Tnl/9lsjTDDtFSF/nTdbsOD+nMCbImG7qN4nXLJCxJAKqZKoAj3wMZUv
	0tGS/knwMXSsFYrN9Kb/4DqYiv5+4dqzkG7JN3wQY4lOYssywI23f9tMAT4mYvCQjT0pk0zLnNb3v
	XFcoAFcZhClS9WdSZgrZm4TFBhxIMXgBZxYTlASzmw04wJo9yBdEnE5HWMBQooQ9fQrNwWrFLIFE3
	kue+O563mMtfQjk9ARlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njmlI-0038zL-FI; Wed, 27 Apr 2022 18:51:40 +0000
Received: from mail-oi1-f173.google.com ([209.85.167.173])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njmky-0038rQ-GA; Wed, 27 Apr 2022 18:51:21 +0000
Received: by mail-oi1-f173.google.com with SMTP id v65so2945981oig.10;
 Wed, 27 Apr 2022 11:51:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=AGqch3bATlGRMhd+ZKwzHi93QGO4MV6rf3Gggs9S8RU=;
 b=Q7C/p7zXE9kfFaPc8v/vjQNP1UT67HcEiRCYz/H2Ge21tpRTz/DlEZuqdeCuND2wnJ
 q4kJBmg6LF5Wiu+oNGOzSGi2ukTNqIB4bDcaFvS6Vm1ISQU5KkW0GzT1g9bvSRUThhfy
 r05WpHaF0WpT6iXv51vaHw7lg6a6pO+MzfCotG4EIQ6oQAh2czGJJ9ohzQU3QZOzMsGf
 3mwABNhYhx0JBGemUwTNNMwVsANCY8SAeQlh+pjTtNQhjjC4ijslcY4EquoV6oVzk8V3
 LQMxVJrpFiuoL+FrPy4jSYV4yVCib3X9Xr06SKDG2+OjPHtTo+HOvvxmwkfmtGFVP1Y4
 PptA==
X-Gm-Message-State: AOAM533zxl8setWhN/oeKC5O/Nzz3lBqeIEPcrZ8bi7Wfn37AzLjby5N
 /aagp19lIuKzWPNr6SBTyw==
X-Google-Smtp-Source: ABdhPJzzy7JvgYRMGnamDwMItt3zlMQk/ii3fBauzE+PpVYc6O+WSGeQ6iaBSdKNZRgfSiaKBYadIQ==
X-Received: by 2002:aca:4246:0:b0:322:8eea:1049 with SMTP id
 p67-20020aca4246000000b003228eea1049mr13729426oia.73.1651085479761; 
 Wed, 27 Apr 2022 11:51:19 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 q34-20020a056808202200b0032545864b89sm2911778oiw.14.2022.04.27.11.51.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Apr 2022 11:51:18 -0700 (PDT)
Received: (nullmailer pid 446568 invoked by uid 1000);
 Wed, 27 Apr 2022 18:51:18 -0000
Date: Wed, 27 Apr 2022 13:51:18 -0500
From: Rob Herring <robh@kernel.org>
To: Gene Chen <gene.chen.richtek@gmail.com>
Cc: lee.jones@linaro.org, krzysztof.kozlowski+dt@linaro.org,
 matthias.bgg@gmail.com, pavel@ucw.cz, devicetree@vger.kernel.org,
 linux-leds@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 gene_chen@richtek.com, cy_huang@richtek.com
Subject: Re: [PATCH 2/2] dt-bindings: mfd: Add bindings for the Mediatek MT6360
Message-ID: <YmmQpg/Hh6qTNhj2@robh.at.kernel.org>
References: <20220427080330.40136-1-gene.chen.richtek@gmail.com>
 <20220427080330.40136-3-gene.chen.richtek@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220427080330.40136-3-gene.chen.richtek@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220427_115120_601188_12AF4CD3 
X-CRM114-Status: GOOD (  11.39  )
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

On Wed, Apr 27, 2022 at 04:03:30PM +0800, Gene Chen wrote:
> From: Gene Chen <gene_chen@richtek.com>
> 
> Add bindings for the Mediatek MT6360
> 
> Signed-off-by: Gene Chen <gene_chen@richtek.com>
> ---
>  .../devicetree/bindings/mfd/mt6360.yaml       | 258 ++++++++++++++++++
>  1 file changed, 258 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/mt6360.yaml

As I mentioned, I applied your previous version. Please send a patch on 
top of it adding the child nodes.

Rob

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
