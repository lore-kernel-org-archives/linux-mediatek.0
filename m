Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6F75C4332F
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Oct 2022 19:34:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QfKY6wRs5DX/nBwR6bSysvUzWBr3pwHzNK/uKJ79NdM=; b=m+RXmcqqp2flfjX9Ox7LgRM5Ew
	5PPg7Tzei6G1NV6+CYEA8busDVlmDkh6qL9c77kaR/2ufPjrNXjc+sorVaMbIVo/t54tYHkytY1CN
	V/oSd/83zBMzOHYbAUmoHXLoMq1eMe3SKMXfrykp+nP6RnHknYWoen7/BJjtyU6XWEAooI+9lm5b4
	e2AkTJyDzjLLGdCdtjvMQmo4QOIXduu1aQcU8BxwRBy3Sz1L06mYA3dKIqDgoSYfyinXgbsKcSEZM
	JhkSNNk2zJEk0ieGP5V3ZHs3pdKKnPICEjjCE8BqO/0hM26y6apN5iyvfORr5KZHwA73czSeM5ceg
	QMEJYv/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ojQRj-00FiBN-JY; Fri, 14 Oct 2022 19:34:15 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ojQRf-00FiAL-6k
	for linux-mediatek@lists.infradead.org; Fri, 14 Oct 2022 19:34:12 +0000
Received: by mail-wm1-x334.google.com with SMTP id iv17so3764173wmb.4
        for <linux-mediatek@lists.infradead.org>; Fri, 14 Oct 2022 12:34:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QfKY6wRs5DX/nBwR6bSysvUzWBr3pwHzNK/uKJ79NdM=;
        b=yjeEDa1/BJTrKFihAE/iVnfBSzA4NB+cXDIau+vtc7TnNiGa21F/9d/xANOM2Y5836
         2VEpHUi7KNscrN6Crx247kvOZx+gn1aHK6KTmjqCt54lT23lQoBITOtCYsGblaCPakym
         QBYl+EzOQj6fXKS8xGmfnlmuWP6auRUfmN/31MHNMWbGXbd/RMmmNzjyZUBQARBDCv0Z
         rnzQs27DEykEHf8Ab+7Sp5y4d7H5InDUXFuAYib0gjgIet5Hy4h7yiGNq+5uT/FLBwo3
         rrek/5H6soO13bZEPMbWWKf/FYKnw5OCjhdrvilyhCDDmFc1IonDm8OIqknJRvTORwOP
         nKkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QfKY6wRs5DX/nBwR6bSysvUzWBr3pwHzNK/uKJ79NdM=;
        b=Q7HFvfJSOogLwJvFb+449Wyze5duS4aObe96RgopmZIdgk93tUbDpzJ00P5hM0oCVx
         rUJtKOr8LkSlT4Zzg6WmsDktQ16ZEsN514uIU7RjfG0cdO9CHH2uKrwps23js3DGEHki
         mIwIU3JDRrPzz5ELyN3OnlvwA/RrShVplFOYHFmb02PEa7X9WJF7foRLMhKD/8YtpSqn
         xtWkyZ4kGzaSC1eblR+6MnRNNRii5zp785G+kKMraMOhftLLcltNQrYnn8ECyMa6EZYq
         7+dDEA/qI4w6xwtgPbqqkIgVGlojlINVp8m+g8ivLP+6ExArtwEj2RxESs89XlXPzyMF
         K5qQ==
X-Gm-Message-State: ACrzQf053p7enJLg0QFSZJxkIH1vBBK9caekmAGuYd18OMxVrYSFIV+u
	4rzvPC2bVt84KH8x4WfacI7bRw==
X-Google-Smtp-Source: AMsMyM6npKryELVjs18ibh73/XOtLrZazbqbNoEmp4mOVV7lkfgOXajay/3cCNk2FQiMTazPfSIXig==
X-Received: by 2002:a7b:c051:0:b0:3a6:36fc:8429 with SMTP id u17-20020a7bc051000000b003a636fc8429mr4680582wmc.78.1665776048115;
        Fri, 14 Oct 2022 12:34:08 -0700 (PDT)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net. [80.7.220.175])
        by smtp.gmail.com with ESMTPSA id bz13-20020a056000090d00b00228cd9f6349sm2566032wrb.106.2022.10.14.12.34.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Oct 2022 12:34:07 -0700 (PDT)
Date: Fri, 14 Oct 2022 20:34:05 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux-kernel@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 3/9] gpiolib: of: tighten selection of gpio renaming
 quirks
Message-ID: <Y0m5rRd1EqGSX5Dl@maple.lan>
References: <20221011-gpiolib-quirks-v2-0-73cb7176fd94@gmail.com>
 <20221011-gpiolib-quirks-v2-3-73cb7176fd94@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221011-gpiolib-quirks-v2-3-73cb7176fd94@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221014_123411_307185_3989C94B 
X-CRM114-Status: UNSURE (   7.76  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Oct 14, 2022 at 10:54:27AM -0700, Dmitry Torokhov wrote:
> Tighten selection of legacy gpio renaming quirks so that they only
> considered on more relevant configurations.
>
> Suggested-by: Daniel Thompson <daniel.thompson@linaro.org>
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.

