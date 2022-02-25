Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB911C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Feb 2022 16:43:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/pG9Y58FWZulKxtgDubLzN1XkWAf+13WimEl8oOI+Hs=; b=n/sVvngGY9h+Ca
	1cRPGIg8H87j9IzAa/0w0uxnoJkLiUxono4E87Crf7Neg1AdFi3szOH+rBU3mLF/Z6ZFNe+eW71v1
	BYHDKOWPCvyhIyGehiJtwQbxlLBDxC81gsSOTrii2pyGWyQVk1cr7X1y5axTfZmghiKPXM5JI069S
	DILMDpA9qLTiMZZiPdm1ZBW5NJAxNGjBsttwzp9K1d+iD7oehvWXRhJXNcuUEzk2U3EWiX4scutB1
	Q352YXG/WR8nWEyCk1oTEDNADZ7lAwGCgHkvDUNHIZhACDo2MwiylYscu0OmSmxIqPANvWDJDOwFt
	oWZ1QEnLaph+GhV2NOOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nNdgt-005zK5-0C; Fri, 25 Feb 2022 16:43:35 +0000
Received: from mail-oo1-f41.google.com ([209.85.161.41])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nNdga-005zBn-1Y; Fri, 25 Feb 2022 16:43:17 +0000
Received: by mail-oo1-f41.google.com with SMTP id
 k13-20020a4a948d000000b003172f2f6bdfso6957017ooi.1; 
 Fri, 25 Feb 2022 08:43:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Si+iJ2zhKvF5YLvRPOXET3hV1fppMjzs+UaFXFDwI3Y=;
 b=l7645Idk23H/ZPNh356knjb/yWa1WNN9rO1WqL8BIw6IM2YZmwP19zw/MRvipxacKj
 d3Hb23Q8kzisjZndqyg4PUAuyM5jKv/3roNGJF6C7LOOAmih+MUtPpBU3jDiOTjprbnM
 h9oRTZOSIrx63eKZ4bu5e70+vMgvsOg6pIY7lZXTzRyXxEulKl705R9Nau5Wld4ePM5p
 5nCBcpxDLE8EhA+eMAK0OLshaXk2lLh18nXM7vqbrnxhQolVCn6z/c7zUwco3x37A744
 B688NFcON2Ehw8QSX8DX5HGIFEshVSusW3Zc1oGhGbOkBUdsPij2lD8ESaYb7FFTGN3Q
 1Ajg==
X-Gm-Message-State: AOAM533+YXGN5z5dCjaRaIdXq12ATb4NkNEn7GLjhKTHDguISmcf+Ipd
 ZJN67qQVfE7QvSNrs9XMrw==
X-Google-Smtp-Source: ABdhPJyVL64erAPpA8+nT5f7+kdz/RH/QaYjqSDhpt4WRNkeN4cGTxKxp8BLy29TQl4zF7yzzWSTlg==
X-Received: by 2002:a05:6870:b402:b0:d3:3712:efa7 with SMTP id
 x2-20020a056870b40200b000d33712efa7mr1652745oap.88.1645807395186; 
 Fri, 25 Feb 2022 08:43:15 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213]) by smtp.gmail.com with ESMTPSA id
 a7-20020a4aae47000000b0031d17643eaasm1198927oon.22.2022.02.25.08.43.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Feb 2022 08:43:14 -0800 (PST)
Received: (nullmailer pid 1063989 invoked by uid 1000);
 Fri, 25 Feb 2022 16:43:10 -0000
Date: Fri, 25 Feb 2022 10:43:10 -0600
From: Rob Herring <robh@kernel.org>
To: Jiaxin Yu <jiaxin.yu@mediatek.com>
Cc: matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org,
 tiwai@suse.com, devicetree@vger.kernel.org, perex@perex.cz, aaronyu@google.com,
 alsa-devel@alsa-project.org, linux-mediatek@lists.infradead.org,
 p.zabel@pengutronix.de, robh+dt@kernel.org, zhangqilong3@huawei.com,
 tzungbi@google.com, trevor.wu@mediatek.com, lgirdwood@gmail.com,
 broonie@kernel.org, linux-kernel@vger.kernel.org, geert+renesas@glider.be
Subject: Re: [v2 13/17] dt-bindings: mediatek: mt8186: add audio afe document
Message-ID: <YhkHHl8u02MY348o@robh.at.kernel.org>
References: <20220217134205.15400-1-jiaxin.yu@mediatek.com>
 <20220217134205.15400-14-jiaxin.yu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220217134205.15400-14-jiaxin.yu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220225_084316_110719_1CCB1685 
X-CRM114-Status: UNSURE (   9.39  )
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

On Thu, 17 Feb 2022 21:42:01 +0800, Jiaxin Yu wrote:
> This patch adds mt8186 audio afe document.
> 
> Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>
> ---
>  .../bindings/sound/mt8186-afe-pcm.yaml        | 175 ++++++++++++++++++
>  1 file changed, 175 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/mt8186-afe-pcm.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
