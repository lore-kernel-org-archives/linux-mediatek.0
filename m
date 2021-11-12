Return-Path: <SRS0=l5E7=P7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 485D7C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Nov 2021 22:42:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 166EA61073
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Nov 2021 22:42:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 166EA61073
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hT/YkJioMPZjsu0D2QHldwMVQz9nxFHUahJDjUTRkao=; b=LT9ntDsVY82IS1
	nx+QN3IHw3Vp/HN4PTR0SvZVuLjGoDqWoMXyGuVnHzdWPmmVHq05+OyoKyqzmkaFa9HhJIhueuA5U
	yzBBecnFt9tg6SAjdxMcIk7zyifu+emj0wF/1lFj8gcp5Rivs9Y0is3KWp5bNAJhmsP01WV3dyfPJ
	OrL7/07E8G2g4mC58kBM3Wk0XOmGsH7M+kHCAwo1XygmXuFysywYP9z2cnJK33isUpA1MG1JtJOxS
	Fc5gIA1qqjmbjmB9mlJu2PrwmAppBNC6+yIBH5+3cKrvtRNm2wu+gTejgFQIjITJyKgmQNYRwoeQa
	/4xl6+nVKEp0PtYQwqwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mlfFu-00BmQI-8M; Fri, 12 Nov 2021 22:42:46 +0000
Received: from mail-ot1-f49.google.com ([209.85.210.49])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mlfF4-00Bm5m-Hj; Fri, 12 Nov 2021 22:41:55 +0000
Received: by mail-ot1-f49.google.com with SMTP id
 h19-20020a9d3e53000000b0056547b797b2so15150079otg.4; 
 Fri, 12 Nov 2021 14:41:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=7sz3TOFRSclMOhQuNheMU/d1++ANZOcSK5SUiv/6PVA=;
 b=I91Y48SQ/w2Lf5qGv4aBQ0bOhby13RiTJ/Lwwt+sJYSP/RbGfyDvG9CrnXltOapE/X
 yHWgeLyifCQNcZJ/Z9n2OF0wIQMwOWDi4PYmzadbaGyJ5bLCuT8khm2nI21tfLEeI2cb
 qFEQI2kKtLQWwgPmZ37N3NwFvBoOu5lFfRco4y3rtO9byn0YBgx9pUibLW9zjt+EvpJ6
 txqoU3/4Tx+IelMDlPfOTKm+suMnMYS8xglAWH0m7Gn83ksO5Q6JcEaAJNgb4hO9Vps3
 KGguUzPa6q6yiNIS9wp4JJBWmXfrn3nzuUyQ1BXTHSUmuknI7r0oP0LzhbmLTOhigEPh
 AYxw==
X-Gm-Message-State: AOAM533QcNp5hwVGF3QPbCScnmHjgtL2sI4NC5HsrWgCcL6iBaRx47Lr
 uPiVmBmpkw8sZD+OU8liiWbxxnP5qw==
X-Google-Smtp-Source: ABdhPJyBz7vyBfHFcHNXt6yZHSdVRM049pmejrMXMiHVLcKXJWruespk5icFKeEfqSflmThC3IazhA==
X-Received: by 2002:a9d:6405:: with SMTP id h5mr15227306otl.90.1636756913194; 
 Fri, 12 Nov 2021 14:41:53 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id h14sm1530253ots.22.2021.11.12.14.41.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Nov 2021 14:41:52 -0800 (PST)
Received: (nullmailer pid 3509128 invoked by uid 1000);
 Fri, 12 Nov 2021 22:41:51 -0000
Date: Fri, 12 Nov 2021 16:41:51 -0600
From: Rob Herring <robh@kernel.org>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-kernel@vger.kernel.org,
 Yz Wu <yz.wu@mediatek.com>, Eddie Hung <eddie.hung@mediatek.com>,
 linux-arm-kernel@lists.infradead.org, Vinod Koul <vkoul@kernel.org>,
 linux-phy@lists.infradead.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 linux-mediatek@lists.infradead.org, Kishon Vijay Abraham I <kishon@ti.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>
Subject: Re: [PATCH 1/6] dt-bindings: nvmem: mediatek: add support bits
 property
Message-ID: <YY7tr3frW8yZTmje@robh.at.kernel.org>
References: <20211107075646.4366-1-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211107075646.4366-1-chunfeng.yun@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211112_144154_629024_F32FDD39 
X-CRM114-Status: UNSURE (   8.80  )
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

On Sun, 07 Nov 2021 15:56:41 +0800, Chunfeng Yun wrote:
> Add support bits property, will satisfy more consumers.
> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
> Need convert mtk-efuse.txt into yaml first?
> ---
>  Documentation/devicetree/bindings/nvmem/mtk-efuse.txt | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
