Return-Path: <SRS0=1z9j=NJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B9ACC4338F
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Aug 2021 00:09:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C3E27606A5
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Aug 2021 00:09:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C3E27606A5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7Pvryh7lDNxQX8YWXxznDYmLoQsQ1w4vjkeT24gSdJU=; b=x/GLj2iYdCWoju
	Fa2K0qsoH691MhmepqcKgC2yXkqcfs/uzAGpIhmPT4ZLZLGjE3+2YkZIVVKODnPBtCN/umtGLX36V
	rJ0W2l3RNvYok0AGQZ8VButiOieLOytmWZGq+OHtDq2yhglUD28oLlMhGwOCap5edbJojAcJeySZ8
	Hgb5GALZ+5gbgpO1UhHGskhsqqOI1Xqj7VYW6i3sdYJxQe7kjDyhZdClSlLpczGWgRiSV0e81pSKN
	6/nr+TFzLDcrZfjgaZJ+fSw2JRhPrQvt1nPU9G8hRYgjOsT8kroIgXjzN5QYTemhGfvxzt+srRPWy
	j/ABzQfneY4acKAPz3oA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mG98w-003jiv-PF; Wed, 18 Aug 2021 00:09:18 +0000
Received: from mail-oi1-f176.google.com ([209.85.167.176])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mG98k-003jfk-1T; Wed, 18 Aug 2021 00:09:07 +0000
Received: by mail-oi1-f176.google.com with SMTP id t128so1913014oig.1;
 Tue, 17 Aug 2021 17:09:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=eDBf4HzWzpVkE1SU7HXUHyb2HdTJRgC3GqHbYNcFo5I=;
 b=nUbyGSsubeSpGAybQo8k0XvETwzcM/Fff2tYMDWu9eTFIa7hKLFoSl0v2M4QpaL5hT
 6eiE44DqgAxkheZkav0Ia6yI3bNcCbXNtakoVS+PnR7/msIuUVIdLC8t79nFjhHhn/yP
 pR57vSR8ij5E/wQfGuq0cliDyG8G5r2COAxETDyZr4Hen3bxWbzENUZgDjkAVm4ARE1F
 VtpvlR1FR43pCjTpCvwe/x0OePxSlNWXI86HUdBmCv6Gy+VeLuNCEQTas+T+MrqDuxsH
 omJD5THWl5r1qwumYQFqaVSqLMLk2SmidsoCKWwNjkSLVI2f3BKpErNlVdg8cxjdyYhT
 V4CA==
X-Gm-Message-State: AOAM5330CAZkf8AUWQBr6L0Dq9V40x5GFoFu7+y8Ds9Q0q9L0tm3CWY0
 SEeEvwSqUtyjxiZWhkMqKw==
X-Google-Smtp-Source: ABdhPJzCNktKjCUlnDUCdBAcVfHU3+pFvJ9azk9tr2qfnql+0DXml7WDoPY0HuD1CexzuSC5qgwnfw==
X-Received: by 2002:a05:6808:5c7:: with SMTP id
 d7mr3066905oij.147.1629245345168; 
 Tue, 17 Aug 2021 17:09:05 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id u127sm878209oib.16.2021.08.17.17.09.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Aug 2021 17:09:04 -0700 (PDT)
Received: (nullmailer pid 1088706 invoked by uid 1000);
 Wed, 18 Aug 2021 00:09:03 -0000
Date: Tue, 17 Aug 2021 19:09:03 -0500
From: Rob Herring <robh@kernel.org>
To: Irui Wang <irui.wang@mediatek.com>
Cc: linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 srv_heupstream@mediatek.com, linux-arm-kernel@lists.infradead.org,
 Tzung-Bi Shih <tzungbi@chromium.org>, Yunfei Dong <yunfei.dong@mediatek.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Yong Wu <yong.wu@mediatek.com>,
 Maoguang Meng <maoguang.meng@mediatek.com>, devicetree@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Longfei Wang <longfei.wang@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Tiffany Lin <tiffany.lin@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-mediatek@lists.infradead.org,
 Tomasz Figa <tfiga@google.com>, linux-media@vger.kernel.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Fritz Koenig <frkoenig@chromium.org>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Alexandre Courbot <acourbot@chromium.org>
Subject: Re: [PATCH 1/9] dt-bindings: media: mtk-vcodec: Add binding for
 MT8195 two venc cores
Message-ID: <YRxPn1agQMdJtcpI@robh.at.kernel.org>
References: <20210816105934.28265-1-irui.wang@mediatek.com>
 <20210816105934.28265-2-irui.wang@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210816105934.28265-2-irui.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210817_170906_126386_7B842A78 
X-CRM114-Status: GOOD (  10.37  )
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

On Mon, 16 Aug 2021 18:59:26 +0800, Irui Wang wrote:
> Enable MT8195 two H.264 venc cores, updates vcodec binding document.
> 
> Signed-off-by: Irui Wang <irui.wang@mediatek.com>
> ---
>  Documentation/devicetree/bindings/media/mediatek-vcodec.txt | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
