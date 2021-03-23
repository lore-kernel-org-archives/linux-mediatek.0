Return-Path: <SRS0=7DfI=IV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B85B5C433C1
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Mar 2021 20:20:49 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 51E7D61864
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Mar 2021 20:20:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 51E7D61864
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=2BN2PVsoX8gCfBkQ9oniKn5z8y+CULKMAmGIelGCLnk=; b=ffsJhHno0qH9TKZQ8AEsIovay
	Z/MwrJErfsgeZJ/eZDCBC0MStnbWPIS/DciTv/jRfA0li4QYp5n9JpslKNZnkhKscHlJNvXlV9LWK
	KOxioqzybvZnY0RlzaramPePbTyFTnRLxM7wUsz+MByOYOGgQR9vI88Ns/evSN/lPR57I2Na/ATmX
	rxamfcYv0AMpOfyRU19HrukZJZrQ6CPE4bqUjCgtEkqLErP7thPvPbB6OVRqJRsIPqGG/l7LnSgDf
	aB2tbl3dKtXBlHxWy/6FEPh/VyWagP1Tb1Ukmi0T4EJGTyAxmhfwc9VyosIFNH1FTflzfglksvU+0
	iIibVDi/w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lOnW0-00FeOr-7a; Tue, 23 Mar 2021 20:20:36 +0000
Received: from mail-io1-f54.google.com ([209.85.166.54])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lOnVo-00FeNJ-UH; Tue, 23 Mar 2021 20:20:27 +0000
Received: by mail-io1-f54.google.com with SMTP id f19so19088161ion.3;
 Tue, 23 Mar 2021 13:20:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=9Tp80gy+0OkNwU5Jvc6Bj62i4jpwSRXTDIXhxrL5nq0=;
 b=R6OxJ+yW6WQ0i0TA4lthxlXQf0Ml2ICR7ruhAgSrjnbSMgJD/M2z6oaWUnfmwBVNGA
 K0/UGBmxpi49qgPTk0ww5WYUNYanNvNW+BXUW1SJcsMV73DoZhE4Dg6T01FtzEuEznX+
 M4ZhKjhvTtCMajobe9KQl33YiGhh7Huzgc5jAQHgJT8zDQEQXauMHoShvBV0+fl+37PQ
 crLAgRAVTjIVNSu0gvtYVCcJ1iWHmWZKOWqnreW7V2h47vmjYsKvUZS26buB6PrvlmUv
 +xwFi3EmECLw/ttSwJ2ivcbK+Wp9toWPRlElBNUt6diyrYop9IGxkOA6CYBM6rQ2rqgV
 FVhQ==
X-Gm-Message-State: AOAM532l/H6vNWcPx5ZDyryAHDuEd2sAQDH1ywXLDm3whAvL/cZ/TSkn
 7e/fcTYpux/fZKqw4o5m4EmQLpL/hw==
X-Google-Smtp-Source: ABdhPJwiamQiJEfKQT0y+jbtus3lBMMGGCM3cCXWnYFJsj5T/y8a7/HZNP8JHP80rewyR1hKdB3KaQ==
X-Received: by 2002:a5e:d901:: with SMTP id n1mr5947919iop.84.1616530823835;
 Tue, 23 Mar 2021 13:20:23 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id f13sm9614313ila.51.2021.03.23.13.20.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Mar 2021 13:20:23 -0700 (PDT)
Received: (nullmailer pid 1250413 invoked by uid 1000);
 Tue, 23 Mar 2021 20:20:20 -0000
Date: Tue, 23 Mar 2021 14:20:20 -0600
From: Rob Herring <robh@kernel.org>
To: Michael Kao <michael.kao@mediatek.com>
Cc: Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, hsinyi@chromium.org,
 Zhang Rui <rui.zhang@intel.com>, devicetree@vger.kernel.org,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Eduardo Valentin <edubezval@gmail.com>, linux-pm@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, srv_heupstream@mediatek.com
Subject: Re: [v3, 3/3] dt-bindings: thermal: Add binding document for mt6873
 thermal controller
Message-ID: <20210323202020.GA1250358@robh.at.kernel.org>
References: <20210312034018.17437-1-michael.kao@mediatek.com>
 <20210312034018.17437-4-michael.kao@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210312034018.17437-4-michael.kao@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210323_202025_170127_369E9B14 
X-CRM114-Status: GOOD (  12.22  )
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

On Fri, 12 Mar 2021 11:40:18 +0800, Michael Kao wrote:
> This patch adds binding document for mt6873 thermal controller.
> 
> Signed-off-by: Michael Kao <michael.kao@mediatek.com>
> ---
> This patch depends on [1].
> 
> [1]https://patchwork.kernel.org/project/linux-mediatek/cover/1608642587-15634-1-git-send-email-weiyi.lu@mediatek.com/
> ---
>  .../thermal/mediatek-thermal-lvts.yaml        | 81 +++++++++++++++++++
>  1 file changed, 81 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/thermal/mediatek-thermal-lvts.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
