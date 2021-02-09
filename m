Return-Path: <SRS0=ZAsA=HL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB35BC433DB
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Feb 2021 20:49:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5C04864E6F
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Feb 2021 20:49:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5C04864E6F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=plkbeRsKYHGN2AO/R11DFUXxPFJCt3DLlGgF3CiDDS8=; b=IQWlay1K8Pu4URgKPcYBpySk1
	wSzb4QvYn28kp8kGODKaOaSqytgWp+2s9yEZqh+WyrTw/lWvaYkAlB/NAIpN/C6dgrCwtmlyIkNSY
	54G+gdr80N/9oQt9SW4bLpfeboPF7IWeD8JsV1b9a2vXKRNvGyUcLwKofR2t/l3psMGc0xTe0qyMp
	hVe32pSOPJTnhJu0Dlhxl/XK4jPn7MTidNuDm05yNK6RcyoJxZQXRkI31y15k6IFElp4xZPH6DSWN
	R3cd2WqFwLJiD0/WKrP4B0xZHI6C3ne44b+6oUMfO7AmbdiR6wBz+gE1fXXJop2zbBogkE2EWOksD
	6a3HIdm5w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9Zx5-0005vP-HY; Tue, 09 Feb 2021 20:49:39 +0000
Received: from mail-ot1-f43.google.com ([209.85.210.43])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9Zx0-0005tY-5b; Tue, 09 Feb 2021 20:49:35 +0000
Received: by mail-ot1-f43.google.com with SMTP id e4so566823ote.5;
 Tue, 09 Feb 2021 12:49:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=/W1Gn4hxQtNB99JBDiBpqMrtEUA7Z2tTBFo11od6Dq0=;
 b=TEeWQT+Uyx8iw4plEolDltk06XGvG207rk4BCEwuEnxH13aaYSgS82HnwtlULzOQYj
 q0wp7AmR4QPQ8yVHu4ZIyJ6JNKKFipe25BSpwYH38q9UO7LEteX20H9m+t9nb6mbnhlU
 7OKrP67RvBrTvtnpJOwFwwhOUzV3EbzES7TwwEZLI31Uq0cyAaKrBv2IG+ckAdNvk2A3
 /gjK7jk+8Y7vqQLmnnEJTCT2igzbUopOV7jfQqDhh+skNjJoVFVdq3lM1KDbxEwBzEbJ
 srxX7BhzD0dSHYNfzKERhbEv+DuXKMg3JnxubyeQgOccNYtD9iyF+Cu9iBBFFQaH7YCX
 Tglg==
X-Gm-Message-State: AOAM533dDPR/QakLHwJCHt0XqVYeLIObNkwPtn6WVi9RRsnDApnewsrn
 71mGszkfrSE6PkhztVlXNg==
X-Google-Smtp-Source: ABdhPJyPT+UqiQpXCouB4drib6QDW/Lva0rnlvUnEysuBk1EhC8ytPiq8quZZkYVCOhE67HMCZ96EA==
X-Received: by 2002:a05:6830:2316:: with SMTP id
 u22mr4610464ote.324.1612903773115; 
 Tue, 09 Feb 2021 12:49:33 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id a63sm4594300otc.75.2021.02.09.12.49.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Feb 2021 12:49:32 -0800 (PST)
Received: (nullmailer pid 152989 invoked by uid 1000);
 Tue, 09 Feb 2021 20:49:30 -0000
Date: Tue, 9 Feb 2021 14:49:30 -0600
From: Rob Herring <robh@kernel.org>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: Re: [PATCH next v3 06/16] dt-bindings: usb: mtk-xhci: add optional
 assigned clock properties
Message-ID: <20210209204930.GA152956@robh.at.kernel.org>
References: <20210201070016.41721-1-chunfeng.yun@mediatek.com>
 <20210201070016.41721-6-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210201070016.41721-6-chunfeng.yun@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210209_154934_291939_E89D9C16 
X-CRM114-Status: GOOD (  12.68  )
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
Cc: devicetree@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Kishon Vijay Abraham I <kishon@ti.com>,
 Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Min Guo <min.guo@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, 01 Feb 2021 15:00:06 +0800, Chunfeng Yun wrote:
> Add optional property "assigned-clock" and "assigned-clock-parents"
> used by mt7629.
> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
> v3: no changes
> v2: separate compatible out of the patch
> ---
>  .../devicetree/bindings/usb/mediatek,mtk-xhci.yaml        | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
