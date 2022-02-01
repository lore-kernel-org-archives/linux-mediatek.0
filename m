Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33773C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Feb 2022 23:47:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fEnD72BRyzO9IGBPmqv82aoitog/EtawOsmDfiVn1xg=; b=a2RUr33AtwQmiz
	bWRfP/eNixCgZM9dFwqb1IuLgzptdHlr77kJ+Tbp2EpJXPo4AfKIUg6a5lsTiplT4Hc7JJappIJbD
	oP2P/L8BzfqSlVIsIQS1kqT/5auJi3UDkrEOdPkWlcV1RI+6TONAFeQg37+hsO4i+wC94k+8SpFLT
	0x3/efxtB+CbY2CE6J4Qd2KcvQ3yLi66fH1dw0vq8Fq/3nzZKNzkF9rl+q3I/AHsN7KTfD15nLKSI
	pfEKgSC339g4LSA9dv6ZdKzI+Y5t3OTLoR988K7wgNYGa3Sp3DbwNADSLJJV4H5fJl2eMI7Tdr+jM
	48pLpN4AnZRPLbsVyxew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nF2rY-00DqHs-7i; Tue, 01 Feb 2022 23:47:04 +0000
Received: from mail-oo1-f42.google.com ([209.85.161.42])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nF2rL-00DqFI-1m; Tue, 01 Feb 2022 23:46:52 +0000
Received: by mail-oo1-f42.google.com with SMTP id
 v17-20020a4ac911000000b002eac41bb3f4so4527614ooq.10; 
 Tue, 01 Feb 2022 15:46:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=LTyiwabigKmsdYC9HQNink5x9LNkFsxuP0xeUKbF8uk=;
 b=phsJo+ZaXLtmXQv+DGp2CvWHSSwjbeZVOM3ZM8/cR4hNEEucQNKJYXxGim+/lI5ZAR
 pYNeeltmhvTeo8ZTy6tZ/E2dv20fwSO4cfcRqI1MRoM+gzuLn/IeIF/0DVtYyWMwEqKS
 d5i2yJ7y0asZZvdKKiOk1l+Cei1o+q6PldrQ5sAVSPYEb7rctmrB5idjIZpIem/bVTTG
 fBUfeiok4QXjxN0ohQDp0C+yodarysKSfAGYFIq+rqlyhbZLsEpQqfu/IWyscSnU3ElM
 gBmixvnyu6Aik/R1QxJAlm4EW2dA6Z5LGxYpd+Yza1WZwrrN2MDQzcuY7L+shmdAqglS
 XYug==
X-Gm-Message-State: AOAM531o+yZ2ociNxcYGMRdG080pkaQwPjnBO9kWxasR9o+Z71+vy/9b
 hBDV97sLObRjLAZg2V0VfQ==
X-Google-Smtp-Source: ABdhPJx++uYA6DaX9YvhRINV+3ono/nKlgW1aE+hQqL8GMCoLzjLZVKOGkfwu6S8OcKabeYIdJGwqg==
X-Received: by 2002:a4a:b401:: with SMTP id y1mr13925543oon.95.1643759209668; 
 Tue, 01 Feb 2022 15:46:49 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id bg10sm7141928oib.33.2022.02.01.15.46.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Feb 2022 15:46:48 -0800 (PST)
Received: (nullmailer pid 993179 invoked by uid 1000);
 Tue, 01 Feb 2022 23:46:47 -0000
Date: Tue, 1 Feb 2022 17:46:47 -0600
From: Rob Herring <robh@kernel.org>
To: Mattijs Korpershoek <mkorpershoek@baylibre.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 Marco Felsch <m.felsch@pengutronix.de>, Kevin Hilman <khilman@baylibre.com>,
 Fabien Parent <fparent@baylibre.com>, Fengping Yu <fengping.yu@mediatek.com>,
 linux-input@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Yingjoe Chen <yingjoe.chen@mediatek.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 devicetree@vger.kernel.org
Subject: Re: [PATCH v20 1/3] dt-bindings: input: Add bindings for Mediatek
 matrix keypad
Message-ID: <YfnGZxD5jJxB+GXY@robh.at.kernel.org>
References: <20220127111526.3716689-1-mkorpershoek@baylibre.com>
 <20220127111526.3716689-2-mkorpershoek@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220127111526.3716689-2-mkorpershoek@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220201_154651_115076_335B6047 
X-CRM114-Status: GOOD (  11.56  )
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

On Thu, 27 Jan 2022 12:15:24 +0100, Mattijs Korpershoek wrote:
> From: "fengping.yu" <fengping.yu@mediatek.com>
> 
> This patch add devicetree bindings for Mediatek matrix keypad driver.
> 
> Signed-off-by: fengping.yu <fengping.yu@mediatek.com>
> Reviewed-by: Marco Felsch <m.felsch@pengutronix.de>
> Signed-off-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>
> ---
>  .../input/mediatek,mt6779-keypad.yaml         | 77 +++++++++++++++++++
>  1 file changed, 77 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/input/mediatek,mt6779-keypad.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
