Return-Path: <SRS0=eP1B=K4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6DBBC4708F
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Jun 2021 18:50:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 93B7361396
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Jun 2021 18:50:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 93B7361396
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JJu4heQ5gG5ESw5FOYnpAUBm+MCUGbGc1o6hZEAIhsg=; b=RfrDMBhAAE6FBI
	ka9jMUWY97sP1ETpdGjIw8CcLqZkqJrU4vWi6dueipBH6VbumjoGxslLUROJnbCuHhHkiAv2RV34N
	rQETQovIEt9yoNrJz3EOEZ3UTO+4+k0i7J5yk/7dJtmYh6v2Kds1xV8QxXDQjA6x3j67SEII4I0fc
	6QBbeHF18t3F6GbtqICnP5zpgF41eNmLhuSCgU8502fqjvAqWfO0RjMwKZ0y56avQl2P9jAEq0jg3
	Fx3pXfnRW/eo2ZqQB+Zw7N7AyU+gvFzDxxkOhyJwc5+8jw2RAGQH+NVBl8/ByKrkuzMzIw1E2KmvC
	TH36HAWTFVbq1DooMkYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1loVwc-005ohP-Fc; Wed, 02 Jun 2021 18:50:22 +0000
Received: from mail-ot1-f54.google.com ([209.85.210.54])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1loVwZ-005og8-PE; Wed, 02 Jun 2021 18:50:21 +0000
Received: by mail-ot1-f54.google.com with SMTP id
 t10-20020a05683022eab0290304ed8bc759so3331285otc.12; 
 Wed, 02 Jun 2021 11:50:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=6JSBLV3AbgQUQqZ+//+KR0chbfSCGefVmTRUF4wGaZM=;
 b=R7ht+kNqmmPqjEYh9kvYmLABSRklRwOLZfJbvoeO4z17YIOMDGrVr6WaVvVAccmzBh
 gL1mbjxaJnQVnkGzmUhNbgjMlar12tL9g+7LIp3+asd8hS24P9XUqzFhcvdS99wLUFyw
 fgWot4ldxHn+Biit8RPcofr6zMVNIOHPbZPqe52Z3k9/0xFtcVzvmzzkkiB0TindPgq8
 BgE3SaQh7t2GwRnRar8h628cq5Afo4WDN57sHjTxsVc96X724ye33GyjpxieqCfAuell
 umFPWGxdOslnORnOsowDKUmzuhWCzMjDwqWuiqIJzXgJXxwUDzKWk55hazB7by4mnojd
 dc4g==
X-Gm-Message-State: AOAM533pLhzgcT9/bl9rqwWwtDXtULrVcyhf+Hop1XAliKXMWaSxf6Mo
 0pJDvOJ3+I+kaXz20mkIfQ==
X-Google-Smtp-Source: ABdhPJz6z2k5H2t3bFOQMZBDPa55Sf1dUHpBxRc7unbKawa8fBP3+CT+MRJzYKeSxsOqNbDBtjkziA==
X-Received: by 2002:a05:6830:18ee:: with SMTP id
 d14mr2298198otf.347.1622659818966; 
 Wed, 02 Jun 2021 11:50:18 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id x9sm130135ooo.27.2021.06.02.11.50.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jun 2021 11:50:18 -0700 (PDT)
Received: (nullmailer pid 3763838 invoked by uid 1000);
 Wed, 02 Jun 2021 18:50:17 -0000
Date: Wed, 2 Jun 2021 13:50:17 -0500
From: Rob Herring <robh@kernel.org>
To: Irui Wang <irui.wang@mediatek.com>
Cc: Tiffany Lin <tiffany.lin@mediatek.com>,
 Maoguang Meng <maoguang.meng@mediatek.com>,
 Alexandre Courbot <acourbot@chromium.org>, linux-media@vger.kernel.org,
 Longfei Wang <longfei.wang@mediatek.com>, Yong Wu <yong.wu@mediatek.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Tomasz Figa <tfiga@google.com>, linux-mediatek@lists.infradead.org,
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, devicetree@vger.kernel.org,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Tzung-Bi Shih <tzungbi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, srv_heupstream@mediatek.com,
 linux-arm-kernel@lists.infradead.org, Yunfei Dong <yunfei.dong@mediatek.com>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4,2/6] dt-bindings: media: mtk-vcodec: Add dma-ranges
 property
Message-ID: <20210602185017.GA3763804@robh.at.kernel.org>
References: <20210521070139.20644-1-irui.wang@mediatek.com>
 <20210521070139.20644-3-irui.wang@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210521070139.20644-3-irui.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210602_115019_863359_3CF4D125 
X-CRM114-Status: GOOD (  13.53  )
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

On Fri, 21 May 2021 15:01:35 +0800, Irui Wang wrote:
> The mt8192 iommu support 0~16GB iova. We separate it to four banks:
> 0~4G; 4G~8G; 8G~12G; 12G~16G.
> 
> The "dma-ranges" could be used to adjust the bank we locate.
> If we don't set this property. The default range always is 0~4G.
> 
> Here we don't have actual bus/parent concept here.  And the iova
> requirement is for our HW. Thus put the property in our node.
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
