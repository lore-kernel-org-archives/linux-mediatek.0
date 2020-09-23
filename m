Return-Path: <SRS0=E7TL=DA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A064AC4727D
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Sep 2020 20:15:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C125C206D9
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Sep 2020 20:15:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Hb0PBXgV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C125C206D9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=m0frwYi6D8KLeUiuv7rYoK/yJOqrS1Dxl+tIlDVOUtU=; b=Hb0PBXgV0nhd2N301rNEUSIi1
	IE3mMZIRzS50+KP3RsiuCvn5u5+OpeN7U/yY3H3UOUyE0hKrdUgHys1PrZ2an0IzyG7d40AuGuGAx
	Tc5AnbLce0nzYDfESmFi1gocLlNTBU3rX2Shbg92JIG0OY7wuB2TX/6OqOxH0REaMbAx8b4FjJBRJ
	DP0vwf7XA5sae3Wn7otOuwgR2NZ7mteDKmXtywyoxOR/O3d6if2GwL9xP6fqIhwWs6i5m3NtPKecl
	2q1hpaSrBPLN85/e4bRqtmtTnhgWnBFj6kfDvtE7+MUV9NnxIRCfN3hxiturbKpgHFwuU9VtEi/3o
	GYc2bDSQw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kLBAi-0002y3-AN; Wed, 23 Sep 2020 20:15:24 +0000
Received: from mail-il1-f193.google.com ([209.85.166.193])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kLBAe-0002x3-G6; Wed, 23 Sep 2020 20:15:21 +0000
Received: by mail-il1-f193.google.com with SMTP id t13so839559ile.9;
 Wed, 23 Sep 2020 13:15:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=deoXjiCPJcgqhdsTvaj4st28nR1WxDgki8dvwLYWvok=;
 b=UHbndRn6pCJWLKFlANRF7WCydAYtuxpd7zX1Yq66KhpMwCl9/uKWb/ytQgToMjUPzv
 RbzfpyXILgBvEiXfIyZ/1nCHLQiZcDyyQAQ/QE3bk5Gyv4gftq0UiE/5/aYe9vDvvyEr
 pKFY0iK1LxFYN+P75Vvx880BIrQD7cdi8iQ2VAPlPr8fOOk0hj8FzpFKmY7fV2DNEKyn
 X5zws88xHda0fmeRk8fafHI5Qs+vjxBNuTP+irm0rTa/gWJSXnFW4r+xwYt61O5wvSTK
 nbw6HVlzjke3d4tc8m1Kia13Hwy76f5DeIt7i8MfpM1c9W4/6NlGz0futI6dPa5kOaEG
 zs7g==
X-Gm-Message-State: AOAM533Hcjs+EN9OMo2pXO0sBbkN7lTFtS7YvYQWo+l4mH0TfyyggRms
 VGyc4u5ONhIsPtS+yYyn0A==
X-Google-Smtp-Source: ABdhPJwaDK+zaodGN8kVQe2lXZuX+7m1JOY8bAoUaOFpvDMwzBbr0i3tjfuCtDUP871BlwHOy+AaKQ==
X-Received: by 2002:a92:bb0c:: with SMTP id w12mr1270941ili.199.1600892119215; 
 Wed, 23 Sep 2020 13:15:19 -0700 (PDT)
Received: from xps15 ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id t14sm361989ilj.45.2020.09.23.13.15.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Sep 2020 13:15:18 -0700 (PDT)
Received: (nullmailer pid 1227032 invoked by uid 1000);
 Wed, 23 Sep 2020 20:15:17 -0000
Date: Wed, 23 Sep 2020 14:15:17 -0600
From: Rob Herring <robh@kernel.org>
To: Jitao Shi <jitao.shi@mediatek.com>
Subject: Re: [v2 PATCH] dt-bindings: display: mediatek: convert the dpi
 bindings to yaml
Message-ID: <20200923201517.GA1226945@bogus>
References: <20200917073305.25738-1-jitao.shi@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200917073305.25738-1-jitao.shi@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200923_161520_546702_E66F70D8 
X-CRM114-Status: GOOD (  11.85  )
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
 huijuan.xie@mediatek.com, stonea168@163.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, cawa.cheng@mediatek.com,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 yingjoe.chen@mediatek.com, eddie.huang@mediatek.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 17 Sep 2020 15:33:05 +0800, Jitao Shi wrote:
> Convert display/mediatek/mediatek,dpi.txt to display/mediatek/mediatek,dpi.yaml
> and remove the old text bindings.
> 
> Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> ---
>  .../bindings/display/mediatek/mediatek,dpi.txt     | 42 ----------
>  .../bindings/display/mediatek/mediatek,dpi.yaml    | 97 ++++++++++++++++++++++
>  2 files changed, 97 insertions(+), 42 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.txt
>  create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
