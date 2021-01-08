Return-Path: <SRS0=tvhu=GL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9349C433E0
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Jan 2021 03:07:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8FC1B208B3
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Jan 2021 03:07:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8FC1B208B3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=NchPuyX29nLJ38/ZhqXMwSBUf8H/FmC9KCQ5QjaPdec=; b=sn2G5NqCqQlU7PNvpkLW42ift
	d93IGHBdW9CdCiXmKv/EUjMXCVtmFd5DcLkh2tV2/tGH+rMB+24ngB8mRYx74PUi9q0vXXnhMzgng
	zQBlTR2SiBumTQHAZspWX7hRG0UxTEMkRDBpDmK7+NLUj8pStcwJ7VHIa013qJ5TgmQKQplhcOh2A
	MJmQs8nUChI3JkTL1aH5zdTaMkb+L/EgMtBlcFhTEkWCcyjmMprmPQh9h9YgqTfjCj1n/mMjqskdO
	OPwySwagnKvng1qk03h17Z1kWQvWFofw9zsPHPPEvwpXGtRrPYPw7rYGqf74RzIVON6JaqrBrY1sb
	IFyQZolxw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kxi7L-0002M1-Ti; Fri, 08 Jan 2021 03:07:11 +0000
Received: from mail-io1-f43.google.com ([209.85.166.43])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kxi7D-0002JQ-GG; Fri, 08 Jan 2021 03:07:09 +0000
Received: by mail-io1-f43.google.com with SMTP id o6so8351174iob.10;
 Thu, 07 Jan 2021 19:07:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=8KcxnzAs3ni/01L1eWgKza5Z0B+3uDNHSn0G445YVHg=;
 b=rHZUycwSXjS6ETJMyBX9hE6FEnbe190J8ou5qmAi6zP1buA5r3jjJnXTjB2zhwmtqq
 5bt1H33Kj5Z/uUsp8LToCRKOv5umYt9wOJbLbcQhb8b9FOYBLdIl5Yy/3pjWlIJTnqc1
 Z69LO6G/2BYuZKtlbwERP64sMUvG9FyB3VRsev3VhLO0QfaUHqUgpM4hjFJshTQmTf+I
 45951CZsH6wd+7v//rXydlTUoC7o+30qCd/C0kRr+toYAkO79ltN9v4sLFGS/zaCNXz6
 iLMdZa/R+spUeGDJmnE3AFiSI5xMTLTvXnMNAsv/Lqi752MUxwU9jOraiNH8uzMMpCMu
 kzbw==
X-Gm-Message-State: AOAM5336lNEj1j6gXRp3wC8C0fSmZYop5ru/6/XGKTgRbx3CrV5t7NLP
 5+uamxzC4hy5VxgOvfcsgg==
X-Google-Smtp-Source: ABdhPJxfKaoaAn2T5WBaPEv5PLxKzEgHV8iS3F793MOnICO4dRtjruSucVwbpui6WwUnMMVGHMmVLw==
X-Received: by 2002:a5d:9c91:: with SMTP id p17mr3801573iop.36.1610075222485; 
 Thu, 07 Jan 2021 19:07:02 -0800 (PST)
Received: from robh.at.kernel.org ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id x5sm5939782ilm.22.2021.01.07.19.06.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jan 2021 19:07:01 -0800 (PST)
Received: (nullmailer pid 1802363 invoked by uid 1000);
 Fri, 08 Jan 2021 03:06:57 -0000
Date: Thu, 7 Jan 2021 20:06:57 -0700
From: Rob Herring <robh@kernel.org>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: Re: [PATCH v5 09/11] dt-bindings: usb: convert mediatek,
 mtk-xhci.txt to YAML schema
Message-ID: <20210108030657.GA1802097@robh.at.kernel.org>
References: <20201225075258.33352-1-chunfeng.yun@mediatek.com>
 <20201225075258.33352-9-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201225075258.33352-9-chunfeng.yun@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210107_220703_590748_AC44D0D3 
X-CRM114-Status: GOOD (  14.00  )
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Kishon Vijay Abraham I <kishon@ti.com>,
 Serge Semin <Sergey.Semin@baikalelectronics.ru>, Vinod Koul <vkoul@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Min Guo <min.guo@mediatek.com>, netdev@vger.kernel.org,
 Matthias Brugger <matthias.bgg@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Stanley Chu <stanley.chu@mediatek.com>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, 25 Dec 2020 15:52:56 +0800, Chunfeng Yun wrote:
> Convert mediatek,mtk-xhci.txt to YAML schema mediatek,mtk-xhci.yaml
> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
> v5: changes suggested by Rob
>   1. refer to usb-xhci.yaml instead of usb-hcd.yaml
>   2. remove unnecessary maxItems
>   3. add items for all phys may be supported
>   4. change pattern, and limit pattern length of patternProperties
> 
> v4: update it according to Rob's suggestion
>   1. modify dictionary of phys
>   2. fix endentation in "mediatek,syscon-wakeup" items
>   3. remove reference to usb-hcd.yaml
> 
> v3:
>   1. fix yamllint warning
>   2. remove pinctrl* properties supported by default suggested by Rob
>   3. drop unused labels
>   4. modify description of mediatek,syscon-wakeup
>   5. remove type of imod-interval-ns
> 
> v2: new patch
> ---
>  .../bindings/usb/mediatek,mtk-xhci.txt        | 121 ------------
>  .../bindings/usb/mediatek,mtk-xhci.yaml       | 178 ++++++++++++++++++
>  2 files changed, 178 insertions(+), 121 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.txt
>  create mode 100644 Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
