Return-Path: <SRS0=oIsV=74=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1881BC433DF
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Jun 2020 16:10:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DBE99207FF
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Jun 2020 16:10:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RgZ4wfUN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DBE99207FF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+7cX7D84cljNyI9HZGQxHWNvkU6VXXgWbxF4Xp6BFOI=; b=RgZ4wfUNrst6zR
	f3bZ0O10F94R56am/6z2CB6jo8bChFvZDWSnKZLZEEwIh2HpHtB3Cjav5T3cLAuGL6nDvHx7XyIRE
	f9vu4MhPYp8PpxFi21iY2eQIwoS0P1o2Ng9IG9zBqivuxTQ0gH8VEsf1GamjYloB4ejlnvwYsde4i
	CjnBaPfnTJCL24Ad/O8UJvLP/RQDdcgzpE2C/jHLibWZOJQtTf6U0MJxXsMdWLnttVjHN+pRrbDlk
	M4LsXu6+oYV0qiez/q7eBt9BxJvjeLM2noiusljADPIBdAVx+XWkQQILFRdL3XaYZLFZF8Gvey2kh
	U6Pvts/ENpBlJMcGIgIg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jkrgP-00023d-O9; Mon, 15 Jun 2020 16:10:01 +0000
Received: from mail-io1-f66.google.com ([209.85.166.66])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jkrgN-00022M-3m; Mon, 15 Jun 2020 16:10:00 +0000
Received: by mail-io1-f66.google.com with SMTP id i25so18532867iog.0;
 Mon, 15 Jun 2020 09:09:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=6pcmdJx4HNdfvoURK0pS/uo9gcQBvUR51Fl9F7RD+2g=;
 b=qunwOCnxFH2WEkEgHQxWUuQ365jevJDunUfGlXcCI5O/H0rOmZzEU2Skw0rUygWqh8
 0ZwUPLnYpxVt5LQQJMeCiFbohgkAh5o2K/yusa0YDDK67CjZE+6iOe/rEYG5YUR/38J+
 Gm/jpoHi1vPzJwNsw2NhGXJWvvAF2xHP8JxMFdOXKiKKDO3EbVjgEoybORM7xE3eWoW7
 ybvXRPR8ToYg7xgy+pwCCJh+F6o4bStlqUylW/T2iVbzwYWsqAbLhQm5tShieYRWzhKl
 uMaUWP8aLtKmt78QXqdfbd/3QqhZd6ULF4vPsen5wJ2gNECA1W79INbWKNyBSAI0w3s0
 7OFw==
X-Gm-Message-State: AOAM533Wj6isBDAL9//t3h8svx1WXxjY31/SdCbfeOEV7Wz2kRurAgna
 ZKt1FXFvV2EOlxlA5Q10ew==
X-Google-Smtp-Source: ABdhPJxjLCBX9sKIbflLAfGJFvnKwPQdtJxMytSuki4Cyx5b84o8tX12LEkI1o1hSS+BanuS7tOEZQ==
X-Received: by 2002:a6b:4413:: with SMTP id r19mr27931825ioa.162.1592237397848; 
 Mon, 15 Jun 2020 09:09:57 -0700 (PDT)
Received: from xps15 ([64.188.179.251])
 by smtp.gmail.com with ESMTPSA id j63sm8448166ilg.50.2020.06.15.09.09.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Jun 2020 09:09:57 -0700 (PDT)
Received: (nullmailer pid 1861733 invoked by uid 1000);
 Mon, 15 Jun 2020 16:09:56 -0000
Date: Mon, 15 Jun 2020 10:09:56 -0600
From: Rob Herring <robh@kernel.org>
To: Jitao Shi <jitao.shi@mediatek.com>
Subject: Re: [PATCH v16 1/1] dt-bindings: display: mediatek: convert the dpi
 bindings to yaml
Message-ID: <20200615160956.GB1861039@bogus>
References: <20200614073036.63969-1-jitao.shi@mediatek.com>
 <20200614073036.63969-2-jitao.shi@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200614073036.63969-2-jitao.shi@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200615_090959_153885_C42AD727 
X-CRM114-Status: UNSURE (   9.20  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 srv_heupstream@mediatek.com, David Airlie <airlied@linux.ie>,
 huijuan.xie@mediatek.com, stonea168@163.com, cawa.cheng@mediatek.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 yingjoe.chen@mediatek.com, eddie.huang@mediatek.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sun, 14 Jun 2020 15:30:36 +0800, Jitao Shi wrote:
> Convert display/mediatek/mediatek,dpi.txt to display/mediatek/mediatek,dpi.yaml
> and remove the old text bindings.
> 
> Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> ---
>  .../display/mediatek/mediatek,dpi.txt         | 42 --------
>  .../display/mediatek/mediatek,dpi.yaml        | 97 +++++++++++++++++++
>  2 files changed, 97 insertions(+), 42 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.txt
>  create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
> 


My bot found errors running 'make dt_binding_check' on your patch:

/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.example.dt.yaml: example-0: dpi@1401d000:reg:0: [0, 335663104, 0, 4096] is too long


See https://patchwork.ozlabs.org/patch/1308901

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure dt-schema is up to date:

pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade

Please check and re-submit.


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
