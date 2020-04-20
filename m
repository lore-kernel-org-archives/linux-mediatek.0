Return-Path: <SRS0=eXAR=6E=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FF27C54FCF
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Apr 2020 18:46:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 62B482084D
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Apr 2020 18:46:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="m2yx1otY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 62B482084D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AMkJz06LnDdluDVhE3Vv8l48Pn0ptyDsbfHovUzyTag=; b=m2yx1otYi6rWKX
	HDu7/xWSPXegEnjErXsg52CoxoWtdXRZqlFkwO8BiF/EI/8E7Bh8fMo1hD86q3C/UJhnPuwQ6QcJR
	c8eAmCbMcp/MEAUC72SgdldJ3BGGukFUXzPryTtRnOIDg5NoulYptHy0P94GifYEQSs4zLj/gMR1G
	/pkNV4ZpSe0Y2+qy2cSnMf0NHaNhPbrmLh5pe7td4np0RhdkMrKDdudBI7m8DzzXUAFdNRg2AbhT/
	3eSdT7Y54P/J5Folf6SOvUftBjZqHzMbxKThOYGSFBbgvZusttVg2k/6S4L9nsjbiAjkYIlwq2OGF
	hHLPBxOnmSEXAXNrQrig==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jQbRM-0002AL-Kx; Mon, 20 Apr 2020 18:46:44 +0000
Received: from mail-ot1-f67.google.com ([209.85.210.67])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jQbRK-00029b-2p; Mon, 20 Apr 2020 18:46:43 +0000
Received: by mail-ot1-f67.google.com with SMTP id q9so2427938otf.5;
 Mon, 20 Apr 2020 11:46:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=dJDN6ZSVBrwBuPPhD+aSfFRw6fiy4PnYxRMXPYH5eJE=;
 b=IOHSpeX69tfZ62dh4me8mspHjjdpOc9Cp5MBDC5l0YWH2gxX4PH3aUELUj7rFyYy4p
 XGj6jNcquQGdOjlDytPN2muz6S2UzcbSobc0SmCv7n4AFwAHGDEeQ0OVidja/q2RpUd7
 pfR7A4USb9podtJeeKfbIzGvFcWl5HBgNcN74cGxvZjKcEtoXiDfm06C0PVufgsNHKVw
 Xegvh5ivQpM82Bf1H7EAsN1551KUWj3SAym5dAJKS3PJxqY0C59bSEHzkn/khHVyQRxt
 NmynJR18QtRyTE7Ijrl0neKhd38uxjmk9DdMOzCbkQsrCeUT7c4rjYSSLxxjibaDun2f
 693g==
X-Gm-Message-State: AGi0PuYg4blRg7GE5+d9PGgcDp04reQzDCap78Db05r176YnW4CkuGTD
 1MtUQxUjL+HbjmgzkGiZOA==
X-Google-Smtp-Source: APiQypJKBNzrWvr1SWwVwphT9YqgirBWXMbyZeBvPDgavXh+P8/XkilfFXtYjOgYCLzIiuXOqrckdA==
X-Received: by 2002:a05:6830:1e45:: with SMTP id
 e5mr10543687otj.236.1587408400603; 
 Mon, 20 Apr 2020 11:46:40 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id q11sm61919ooc.19.2020.04.20.11.46.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Apr 2020 11:46:40 -0700 (PDT)
Received: (nullmailer pid 27429 invoked by uid 1000);
 Mon, 20 Apr 2020 18:46:38 -0000
Date: Mon, 20 Apr 2020 13:46:38 -0500
From: Rob Herring <robh@kernel.org>
To: Jitao Shi <jitao.shi@mediatek.com>
Subject: Re: [PATCH v6 1/4] dt-bindings: display: mediatek: add property to
 control mipi tx drive current
Message-ID: <20200420184638.GA27394@bogus>
References: <20200411074408.38090-1-jitao.shi@mediatek.com>
 <20200411074408.38090-2-jitao.shi@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200411074408.38090-2-jitao.shi@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200420_114642_123906_4DEEB9B5 
X-CRM114-Status: UNSURE (   7.80  )
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
 Jitao Shi <jitao.shi@mediatek.com>, bibby.hsieh@mediatek.com,
 srv_heupstream@mediatek.com, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 David Airlie <airlied@linux.ie>, huijuan.xie@mediatek.com, stonea168@163.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 cawa.cheng@mediatek.com, ck.hu@mediatek.com,
 linux-mediatek@lists.infradead.org, Daniel Vetter <daniel@ffwll.ch>,
 Matthias Brugger <matthias.bgg@gmail.com>, yingjoe.chen@mediatek.com,
 eddie.huang@mediatek.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sat, 11 Apr 2020 15:44:05 +0800, Jitao Shi wrote:
> Add a property to control mipi tx drive current:
> "drive-strength-microamp"
> 
> Reviewed-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
> Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> ---
>  .../devicetree/bindings/display/mediatek/mediatek,dsi.txt    | 5 +++++
>  1 file changed, 5 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
