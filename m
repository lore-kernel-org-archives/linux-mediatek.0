Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B9BEC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 May 2022 22:33:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h2E97hqbsHh44IVa3TJikkelL9yBTKI0eVimbV6ZgUU=; b=qfQBZ5vJGmsB9X
	iOjiG7SGDkma8AzXEpK/VhytXOBGB+vGn0i1OeMHa3wZqUKLZWvGWtmuZFLDOv9LCKR3RP9HlzUyC
	wZ7kJoW6NZmy1axK6E0hxfyqMSFsRobpsyFat2YFHyLmS/z5O+TewlCa1HOyao9YLMJrF4zsvmmid
	6bbz3waaz2L40ZEdtKxFSlGVKNjF7LkDoK313yrMG/r5N8ggwHY6mOu8Ud+mPQ3RXL6MJ4UpSQZku
	RMBBopsGdawLVOOOpnn16e0uDq3Va6CGHsGxcRyJ4Y98YvSWRnkYFd0UFPptopOW9JE4HoIpi/1Pb
	l2PUwOZJOCKw7PYgiGtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nsBB8-00EmZx-3l; Fri, 20 May 2022 22:33:02 +0000
Received: from mail-oa1-f47.google.com ([209.85.160.47])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nsBB5-00EmYZ-B8; Fri, 20 May 2022 22:33:00 +0000
Received: by mail-oa1-f47.google.com with SMTP id
 586e51a60fabf-e93bbb54f9so11812517fac.12; 
 Fri, 20 May 2022 15:32:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=S+A8nYno3K9fjfGCVzllAZ4bC8ICFLl/EZ6hiaypTZ0=;
 b=zs4kp2F5/3vaD/tyT83Lt+wgqY3y1eITISJoz7k9+U/LJ+SkG5ZTfwJfCvQcxBWuVC
 Q5HKUqkDryoeCa8Src+xyT/bRFW7tuOyZHyyCLReTT9evwA4sUcxFKI5AL5qZWZVKNbm
 Xn7qFoPURTssA8ql/XwxCTxxY/Tn18dTvmqf5kAt0bLKqphWKupOWhJHtVAomwfTQWed
 49NvSycaop7vBeVD8SMrfQa06nvlEruezLTOQYASVoibAEATAkOKNazvhQyQY/vtb96I
 VxgDJMhv2bJvRMvinySFJBSnYcMAtZwsnK7TYvzXCcN7Amua0oPQaY99J3JgVH4IWCFr
 4Liw==
X-Gm-Message-State: AOAM533IH5OWTGQ02NVwvbp0qhNCSl8MMRCA832/6HFZmaa5ULZrR52o
 ArPgEPFAjwlQcC4Wkw1N9A==
X-Google-Smtp-Source: ABdhPJxAYBhJ/Opqa1MfmSNj+qtDt0LMPMLf7JCAo8KdxjvZj/7iZqkk839Elkm3pETPKoROUJKHXg==
X-Received: by 2002:a05:6870:4619:b0:f1:e78d:fd54 with SMTP id
 z25-20020a056870461900b000f1e78dfd54mr7360868oao.195.1653085977332; 
 Fri, 20 May 2022 15:32:57 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 x26-20020a056830245a00b0060afe803e5bsm356937otr.35.2022.05.20.15.32.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 May 2022 15:32:56 -0700 (PDT)
Received: (nullmailer pid 373515 invoked by uid 1000);
 Fri, 20 May 2022 22:32:55 -0000
Date: Fri, 20 May 2022 17:32:55 -0500
From: Rob Herring <robh@kernel.org>
To: Rex-BC Chen <rex-bc.chen@mediatek.com>
Cc: krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 sboyd@kernel.org, mturquette@baylibre.com, linux-clk@vger.kernel.org,
 runyang.chen@mediatek.com, Project_Global_Chrome_Upstream_Group@mediatek.com,
 robh+dt@kernel.org, p.zabel@pengutronix.de,
 angelogioacchino.delregno@collabora.com, wenst@chromium.org,
 devicetree@vger.kernel.org, chun-jie.chen@mediatek.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v7 17/19] dt-bindings: reset: mediatek: Add infra_ao
 reset index for MT8186
Message-ID: <20220520223255.GA373481-robh@kernel.org>
References: <20220519125527.18544-1-rex-bc.chen@mediatek.com>
 <20220519125527.18544-18-rex-bc.chen@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220519125527.18544-18-rex-bc.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220520_153259_419190_13D87ED5 
X-CRM114-Status: UNSURE (   9.05  )
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

On Thu, 19 May 2022 20:55:25 +0800, Rex-BC Chen wrote:
> To support reset of infra_ao, add the index of infra_ao reset of
> thermal/svs for MT8186.
> 
> Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> ---
>  include/dt-bindings/reset/mt8186-resets.h | 5 +++++
>  1 file changed, 5 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
