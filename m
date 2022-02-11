Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08A0DC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Feb 2022 16:59:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jkLsBpFqJch9aos31KdwiiSQkseeH56bxZxABPHfe+I=; b=YVHuBVUS5Gxfum
	FOqhGkqIxqrg8+GAUSlcwFjqWegGzkmmB6wiS+muFZwjuoMuHWhwy4oO+Mk5gIMo795poqBIiTt2w
	o1+I3kZntKDL+6O8mpPQ4z8ltQ9Qsm8/38UAseyeXu6W2N+peOQSYEt9KfRm4yjx64d2oIpEzXPe6
	QjGtzKwyNwq32oPPEVB2ftKA6//agMXFRsjIA1lEJjCDX048R9wfrmS3VznajaLJxGotsmAbBFh7L
	PwSPwclaKp7jfyDMCv86uglnSpDnPGEe+5OUMwUIUZFI0OV8+4Zn5DSuBoA7rqGVC4pFAMSwrN3Lh
	4n0XtM7TYkVMOusPhZ1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nIZGq-0089NQ-UV; Fri, 11 Feb 2022 16:59:44 +0000
Received: from mail-qk1-f178.google.com ([209.85.222.178])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nIZGa-0089F1-9d; Fri, 11 Feb 2022 16:59:29 +0000
Received: by mail-qk1-f178.google.com with SMTP id w8so8781933qkw.8;
 Fri, 11 Feb 2022 08:59:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=8yxTDG3L66sv6/x75/eI7qWhPShuWXXpishkPZKHjZQ=;
 b=GQ/c+CpgbqBekgIYK/+A8ffXD8SmuIKvpoTOB4Vf94Hg0MgRI7JY2hdFsHWxf4G/T+
 xUdnpqRofkfkWYGvB/y6OJj92dKcoVm90rALsMxsMP0fbPxdgnMJ01rOC/sd+AEm0tlQ
 ssVBNQ3ne+QqMylaHiKDBvOO8xFMVyHsiGmhFpwbScvRMhrMZfdzA8EMJo0o+4e1uZbH
 xCizyY5j7nPaYcQ1AeM03HRVK2faYH5IqdeXit7stxYvY9j5Osd6TdJUcGAcqD3sXDWH
 B1c/uS8mKKGz1CtW/xDTbXbSmrbKWuvMJGhazHtM/AEZuQgFYGM8JffStbdjIJHxNBmA
 0uBg==
X-Gm-Message-State: AOAM533UiPlpILuyIReTwauRj+8/oMTcNT0PAYXxfrb/j3+NDdQc0zJ+
 RufG6cje+7viVYB4GPkW0g==
X-Google-Smtp-Source: ABdhPJxkD6HcPp0yjhgHl6Xpz1CUtP20uJOD7KXrALJK1CT6iJ4t6RJgnsP1PtESdzRNUItNx1QrAw==
X-Received: by 2002:a05:620a:1712:: with SMTP id
 az18mr1225926qkb.626.1644598766892; 
 Fri, 11 Feb 2022 08:59:26 -0800 (PST)
Received: from robh.at.kernel.org ([2607:fb90:5fee:dfce:b6df:c3e1:b1e5:d6d8])
 by smtp.gmail.com with ESMTPSA id
 g20sm12384144qko.27.2022.02.11.08.59.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Feb 2022 08:59:26 -0800 (PST)
Received: (nullmailer pid 518102 invoked by uid 1000);
 Fri, 11 Feb 2022 16:59:23 -0000
Date: Fri, 11 Feb 2022 10:59:23 -0600
From: Rob Herring <robh@kernel.org>
To: Leilk Liu <leilk.liu@mediatek.com>
Cc: Mark Brown <broonie@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 5/6] dt-bindings: spi: support mediatek,need_ahb_clk flag
Message-ID: <YgaV6w1ooAzTpYNz@robh.at.kernel.org>
References: <20220209111938.16137-1-leilk.liu@mediatek.com>
 <20220209111938.16137-6-leilk.liu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220209111938.16137-6-leilk.liu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220211_085928_372745_65A08C52 
X-CRM114-Status: GOOD (  15.59  )
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

On Wed, Feb 09, 2022 at 07:19:37PM +0800, Leilk Liu wrote:
> this patch support mediatek,need_ahb_clk flag.
> 
> Signed-off-by: Leilk Liu <leilk.liu@mediatek.com>
> ---
>  .../devicetree/bindings/spi/mediatek,spi-mt65xx.yaml         | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/spi/mediatek,spi-mt65xx.yaml b/Documentation/devicetree/bindings/spi/mediatek,spi-mt65xx.yaml
> index 241c0f5880d3..af12c1711182 100644
> --- a/Documentation/devicetree/bindings/spi/mediatek,spi-mt65xx.yaml
> +++ b/Documentation/devicetree/bindings/spi/mediatek,spi-mt65xx.yaml
> @@ -71,6 +71,11 @@ properties:
>        specify which pins group(ck/mi/mo/cs) spi controller used.
>        This is an array.
>  
> +  mediatek,need_ahb_clk:

s/_/-/

But really, this should be implied by the compatible string or presence 
of the clock in 'clocks'.

Rob

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
