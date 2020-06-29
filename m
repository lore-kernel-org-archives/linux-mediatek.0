Return-Path: <SRS0=EINh=AK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64C1FC433DF
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Jun 2020 16:58:47 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 304CE255A1
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Jun 2020 16:58:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DUNTAziP";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BdCW9dI6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 304CE255A1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=HoGCqFoMptcn2cEtb4bs0UCDFqycU3S4nWcqw/17/Gs=; b=DUNTAziPn6lASchbjbHNOS2Ts
	G0Exyb7CJOeEsfL+ONsnNSDIytJrVHU+so07+u6cx5G/wiQfRsRLvelzcvIK7GvrVrNpwRaWaxwHq
	E2+QiElakZMBpSCu+3ZhwY/hLe6EKi+JL9ZmOUsFLZX1Uca26kN1RTJUeD5yhvWnICcJbtsYXDppa
	F+J7EjFnKL1IdNKhHq0CGSmLlcmGqZz1taDmuLo2YbMFbi4TwaBBrn2Gruh5NE0vfwngArAvfzOPS
	9ZrcjcBWr4ZDLat1t+XkeU2Lo61++1IQkK8EnXix69UfMTDJRtNOuK0Rst+9uUE+H0P/CfbjuYFgk
	1r4MUIxOA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jpx75-00088s-7U; Mon, 29 Jun 2020 16:58:35 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jpx73-00088F-8q; Mon, 29 Jun 2020 16:58:34 +0000
Received: by mail-wr1-x442.google.com with SMTP id z13so17248779wrw.5;
 Mon, 29 Jun 2020 09:58:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=EXieR2sKCVcuynFXj2Dp91Rx/LX+vZuPzCYIluYGYqw=;
 b=BdCW9dI6O2ID3uqf56vYmvG7S+fdM8QNerUMd1X2JionIRz+qIPUlM5rWCSvL/+UCt
 zvwMhhwE/TXKbCYG9ID7I9ygUQH+8T9k9KYMvWu+JHNlTbJIFYwJIgVJs5BgGjKU86gf
 kXrJckQyt3K2z59k0OFjRJxmE0ADLVeSmMYS17m3Rhvdan9zDd7VM8GaaUTAw9fApXHP
 PE+lFtfE8xP6ROi7X2UXlG6lttCibWZW/LgUXkH+Sm/g9OgnJAeD57hVdtUg2iLX/Egu
 W9ZG/B64qi8wc2xkGhqiFdCxoPVcr1rpqZi1VS2u4Kt5v/33rcpSfb2H78HjL/acb7KJ
 4j8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=EXieR2sKCVcuynFXj2Dp91Rx/LX+vZuPzCYIluYGYqw=;
 b=WtAxtj7sDi8k5OKQl6qbDqGoB2sG9dY1u6ZIR1FgZsabvrv8ZCJL5+0zF7rG1WYYvF
 ar0QbL8sa5Vvx6GYIPZNb+AoMeJFx7kP/Ua4j6sH89pbO4YLKE1QMsSLZ2roIwfGZVUS
 paidRIOg+NlsZf2NG2OPL/iQUWcbiPESQWH87uUnvHt8IS3QfVVM3QKUv47RkhzDxDKv
 bTxIergl151uxhdBDX9d+jy4OX03YY+F++jXZVv++1iHBkv4iTQ4zDz7kwAVouGD2Kc4
 HIfQ6HNj0c7iZOXX5PL20ySk8Y1urbblpWslFaiY3lrFuuiStOhz118RGROoODRwvh8i
 cIaw==
X-Gm-Message-State: AOAM531RmmcOnReyxSnNiNYNdh8wsfUZu5x8iZtN+he52D64UunOjqqc
 wfsj/ZyFZvqgBBZRkQNcfI2CAyjI
X-Google-Smtp-Source: ABdhPJyJ5w3YtAo+uLmhSmj4foLwUKDf1M6Afay3gViElI8XhO8rG9IkHCGg5/fyGiENO61wD6cZDw==
X-Received: by 2002:a5d:6802:: with SMTP id w2mr17172707wru.88.1593449912197; 
 Mon, 29 Jun 2020 09:58:32 -0700 (PDT)
Received: from [10.230.30.107] ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id c20sm460651wrb.65.2020.06.29.09.58.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Jun 2020 09:58:31 -0700 (PDT)
Subject: Re: [PATCH v2 02/10] net: ethernet: ixgbe: don't call
 devm_mdiobus_free()
To: Bartosz Golaszewski <brgl@bgdev.pl>,
 Jeff Kirsher <jeffrey.t.kirsher@intel.com>,
 "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 John Crispin <john@phrozen.org>, Sean Wang <sean.wang@mediatek.com>,
 Mark Lee <Mark-MC.Lee@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Heiner Kallweit <hkallweit1@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
 Russell King <linux@armlinux.org.uk>, Rob Herring <robh+dt@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>
References: <20200629120346.4382-1-brgl@bgdev.pl>
 <20200629120346.4382-3-brgl@bgdev.pl>
From: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <daff86d4-f0f1-f4d8-2e7a-1535573f9ba1@gmail.com>
Date: Mon, 29 Jun 2020 09:58:26 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Firefox/68.0 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200629120346.4382-3-brgl@bgdev.pl>
Content-Language: en-US
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
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 6/29/2020 5:03 AM, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> 
> The idea behind devres is that the release callbacks are called if
> probe fails. As we now check the return value of ixgbe_mii_bus_init(),
> we can drop the call devm_mdiobus_free() in error path as the release
> callback will be called automatically.
> 
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
