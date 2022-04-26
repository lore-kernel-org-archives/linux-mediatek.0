Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B70E7C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Apr 2022 16:57:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ig2LF9iSOkRTrHZuMKcqgQ2uk8wgu+cJBLeg9zbIJUw=; b=aQcuodX87J5kag
	M6aUym4p5jCpNxCSrBbKezYrEM/WYH9sPu4gozM6PLZ/4xuHrUcUKfNdlR28Wo9vVvKkACfr/zQIc
	zK8PupUZ2HCQGjpmb/a52jZI3s9v8NLI3uStuPTr5i6thuEev2hnd+AcwRNQ0x+217DJwtZMZd0iw
	pf6XeLGMr7/hjesMte5xdh8jrlDNYB9ZRzVcA5wY+g8Asqc5xCBFFkStAluAs+cDnZDDb/zW+QzT4
	0LqtQNRwVrx0+I7rnw3neAM9a41iQAOCu7KyN58BRlKT86BJHJwHZR1zf0DK4XC4MtVQTnD8WHREk
	abeYN3HfOJUO+fQU2W0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njOV3-00FRqr-Rh; Tue, 26 Apr 2022 16:57:17 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njOV1-00FRpO-I2
 for linux-mediatek@lists.infradead.org; Tue, 26 Apr 2022 16:57:16 +0000
Received: by mail-pl1-x62d.google.com with SMTP id p6so2891888plf.9
 for <linux-mediatek@lists.infradead.org>; Tue, 26 Apr 2022 09:57:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=DTPMRMeWBAzanCmBx6cBcukiqX2leSLOdPLeBw+/mc4=;
 b=kOgwKw2JD0gfI0he7V3lrFfb/ewU0fph/RfUDZAE5UZgmOw59W9UZVTDHcF5OtPDnU
 3Ek/n41/pC7tY/P2oF0XPaNdkxfsDElNuiCvLaQRNzjDEVFhTWKTjGAFvj0NktS0cWYW
 8QbryrEBzZytP6eS/ePMzqSsm7l3TmwsbGlvHkavrnG8xyeUn2HNGKDkQlTIc8vberJD
 LNm5aWrZUL2Ji8sV8vswlGKowjXOoLGcL0OSsUguwBkO8xD0DTUA9htAL4nKaIPwOeHY
 UjV5GuaN+j1REKUhm0cEY0lYzyYkpNc0QNiYEQny5d6LJZwkWJXu6LH5AAjiuRWwwk3C
 Bsfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=DTPMRMeWBAzanCmBx6cBcukiqX2leSLOdPLeBw+/mc4=;
 b=y2ONQDMII7zW0YpTMcUMQeC/PwaxH1GFwLSOgP3tB+u+SkMccxkupj2GON10SUeEfq
 Cs/HrJYMNN8IEkL/U8RslU2UvgxNmCTFFu53MOlUBoCvN4t47Klzbh5wwjbcvBCie8cZ
 8oeXuiUCL7vs9SPHTV/k/UPLDRjEeHKv0GvBFIOl4ijjUKzNJPOkLTwJ5NQwolNNcS5+
 Iz42ssEn2RlgyBtKVt0XHlO4Mve/eWN5McpfB+tcdlRcaNEgqd8N4Veq5oqnZ6bWNU0R
 ZOTO+Lk/radeha1+Vxof66B/4NHY/5iQ9mPKeRGHi7F9cpu8jfMeO1lC7IJ4h+ezJYmt
 MVRg==
X-Gm-Message-State: AOAM5334zrqLQQsPYeUn0NnGxeTkVS6iQhlTHLDxqXmbMNoOzYdGtCvH
 1wZNpdVo3n4xb1Tv5/yImh+3aoTQDYWCWQ==
X-Google-Smtp-Source: ABdhPJwak3kS8aqfMggQA5aK6zxJOCtJWtrUoPhsxApZzL252nhjxcJxzOc/Ln00Y20h5uCULPrk4Q==
X-Received: by 2002:a17:90b:1b03:b0:1d2:a577:d52 with SMTP id
 nu3-20020a17090b1b0300b001d2a5770d52mr27494002pjb.58.1650992231904; 
 Tue, 26 Apr 2022 09:57:11 -0700 (PDT)
Received: from p14s (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
 by smtp.gmail.com with ESMTPSA id
 i127-20020a62c185000000b0050d4869918csm6461120pfg.216.2022.04.26.09.57.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 09:57:10 -0700 (PDT)
Date: Tue, 26 Apr 2022 10:57:08 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Cc: Ohad Ben-Cohen <ohad@wizery.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v3 0/2] remoteproc: mediatek: allow different SCP
 firmware names
Message-ID: <20220426165708.GB2007637@p14s>
References: <20220419123331.14377-1-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220419123331.14377-1-allen-kh.cheng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220426_095715_627052_7B3EC4C9 
X-CRM114-Status: GOOD (  14.50  )
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

On Tue, Apr 19, 2022 at 08:33:29PM +0800, Allen-KH Cheng wrote:
> The SCP needs firmware which differs between platforms and SoCs. Add a new
> property "firmware-name" to allow the DT to specify the platform/board specific
> path to this firmware file.
> 
> The firmware-name property is optional and the code falls back to the
> old filename if the property isn't present.
> 
> Base on remoteproc/linux.git, rproc-next (58b7c856519f)
> 
> changes since v2:$
> - use rproc_of_parse_firmware instead of of_property_read_string
> changes since v1:
> - fix a misspelled word in commit title
> 
> Allen-KH Cheng (2):
>   dt-bindings: remoteproc: mediatek: add firmware-name property
>   remoteproc: mediatek: allow reading firmware-name from DT
> 
>  Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml | 7 +++++++
>  drivers/remoteproc/mtk_scp.c                              | 6 +++++-

I have applied this set.

Thanks,
Mathieu

>  2 files changed, 12 insertions(+), 1 deletion(-)
> 
> -- 
> 2.18.0
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
