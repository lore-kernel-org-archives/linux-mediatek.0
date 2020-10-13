Return-Path: <SRS0=564r=DU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D883DC433E7
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Oct 2020 16:57:35 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6408B25300
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Oct 2020 16:57:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eja2t4KZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6408B25300
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=8zNsEv/MkeEDCZWDWTCG3YGkQTd1JzpWyu0QSr+5ajU=; b=eja2t4KZbKNBwZ+oTjTWkWNzJ
	eWkL8RzdJcQKquV3tCosVNb46jjYoR5gI3KaSnIe73CtungjF72gIF72yvD0uhHlURuD+hsL20iL2
	qFgAPFGOxjZHoYWfi4UugRtbA+3m81ku7Jjn7+I7+zqS2cmdZ6Eb7CopVg8vjBQBQbS9AYCTjsc0N
	SO1113U3lGTRzjh+nERc4r1IW8UCE1lPotfijRKyS9IqqSWH3egMIDpfUzujfH8CkgbGEtVbfLXku
	tdJX+siZxtGujpBK2ZtDiHKYsxtKrgwQL6MOlJLZHEN/sKDwSQcBpLkHh2l8NY8rNsz0FdqUEv+c5
	TY6tuNb8A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kSNc7-0008Sl-MJ; Tue, 13 Oct 2020 16:57:27 +0000
Received: from mail-oi1-f193.google.com ([209.85.167.193])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kSNc1-0008QV-HK; Tue, 13 Oct 2020 16:57:22 +0000
Received: by mail-oi1-f193.google.com with SMTP id w141so124139oia.2;
 Tue, 13 Oct 2020 09:57:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ta4GdvuvHmi0S7nFmW+Yiy1nhXEJzHrWRU11UeLVa/g=;
 b=FD+ufJCN4jgSIrhwVFR6BiTU4c0bGb74lPJGREPPFXX1p4YxWemnHcJ0cOlhxYDhLK
 v3FcSLJwRFNnRIAlt8mZm/S1UNKKHr6abr0/z61UT464e0lyPjC4QwPssOXRMCV51BjN
 yXOqajbk2vrWEG+BGwKWcwQxq97+W6dap7/ieaMtrXqNMpnaTtPU6nTfOB1iSvc9joB3
 q2sBLzsbwuTC4DwYXLPweTRf/y4RmRC3nVXrZl9yF/ie79Toip8Z+bSjYazSl5zGcXAW
 7o88vLY/pkcUBnT3yNg3VkZcPcNwc2QhCdwaCbgw2/lGHsICK6tC+a5QK4yY8IdsyK4Y
 w9Pg==
X-Gm-Message-State: AOAM531GAJ/FdWiB4+KbfV3zcuhVDSp+RcVF97mYM+ZrK+9LBxUVh+Rh
 RcnerdCgddYTTyNi1Tf/+Q==
X-Google-Smtp-Source: ABdhPJyc1iqysH0fM7XE3YiQYs9B9724pxdYSxpfEhRtBijv2YxICdy4kOOGJVrhiD+itYChMQXtwg==
X-Received: by 2002:aca:3145:: with SMTP id x66mr379807oix.41.1602608240433;
 Tue, 13 Oct 2020 09:57:20 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id h15sm112140ots.31.2020.10.13.09.57.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Oct 2020 09:57:19 -0700 (PDT)
Received: (nullmailer pid 3686793 invoked by uid 1000);
 Tue, 13 Oct 2020 16:57:18 -0000
Date: Tue, 13 Oct 2020 11:57:18 -0500
From: Rob Herring <robh@kernel.org>
To: Wenbin Mei <wenbin.mei@mediatek.com>
Subject: Re: [PATCH v6 2/4] mmc: dt-bindings: add support for MT8192 SoC
Message-ID: <20201013165718.GA3686690@bogus>
References: <20201012124547.16649-1-wenbin.mei@mediatek.com>
 <20201012124547.16649-3-wenbin.mei@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201012124547.16649-3-wenbin.mei@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201013_125721_604756_89AF37E3 
X-CRM114-Status: GOOD (  12.02  )
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
Cc: devicetree@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>,
 srv_heupstream@mediatek.com, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Chaotian Jing <chaotian.jing@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, 12 Oct 2020 20:45:45 +0800, Wenbin Mei wrote:
> MT8192 mmc host ip is compatible with MT8183.
> Add support for this.
> 
> Signed-off-by: Wenbin Mei <wenbin.mei@mediatek.com>
> ---
>  Documentation/devicetree/bindings/mmc/mtk-sd.yaml | 15 +++++++++++++--
>  1 file changed, 13 insertions(+), 2 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
