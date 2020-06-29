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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F429C433DF
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Jun 2020 17:20:09 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 298872559E
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Jun 2020 17:20:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="B9o3zUVB";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pyiSRomZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 298872559E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=c7WKn47izsHDWv2f3q2sVtmrnjLbAdKR1RnANiQXc6o=; b=B9o3zUVBgLskSeI9hpWur6WeX
	PtKDOkPAwURsClXkxT7Dlddp0LmH+0ADaMODkMASB8lwUv8+BtNRRQxLHMiebx+HjAJmbsDNgnWp3
	eCK+auYEp5Ug1DysTufrr/itPi0zaIooYrQsCCZHLdIn7fhnsI80coBsUrEeT7v+mSO1L61XyCLnV
	YdhfD2kwTkSY1K2id7R9GW2yvnLTd3kumesSs86LgONu956xTpoCy2QzfZgpYpLg6uZeUWWNrp2JD
	XkoMS+N9dXQduqRFlXNoITE1cWtf3ZZaVu0hYvykso8tax8h2xm0Zq/yui/1Q2YaVQUNG839yiaAQ
	5U1ZaJpaA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jpxRo-0002d3-JD; Mon, 29 Jun 2020 17:20:00 +0000
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jpxRm-0002c4-IY; Mon, 29 Jun 2020 17:19:59 +0000
Received: by mail-pl1-x642.google.com with SMTP id j4so7353667plk.3;
 Mon, 29 Jun 2020 10:19:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=jpuhbA135WXku8iFW2x2VvwuaDgLtebbBEPR7YXw648=;
 b=pyiSRomZfO/v5T2TO4PBu72bMxJtvlvYt9qn0So/n2vOJYsgca9/r25apCJ18O7EDf
 vMfcp3cOVV4rme9OvMqo4DoUTOCALh92vvYyuW/kq7eVEZkajTgshIYvr6szi5sOUp98
 fKrhTrRne6uAZt8ZSE1vZsLqQrJynXAP4nSJsO1UAdlErlGfFyohaWi2RuTHux7PGM4w
 iTuXu8hG5PMzmB+tz/SO5gSusxCCQHv/uC0RZk5Z39E9g9c9/58mKt8U15k5+y7S0MSk
 M0p9mDLrAq7H1AShxkuLAcd1zTKgsv4JK+vlwR4egy1rNiWkdYDLNysTunTFO091fvMJ
 eexA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=jpuhbA135WXku8iFW2x2VvwuaDgLtebbBEPR7YXw648=;
 b=psYfv7H9rzo/aHCdtDeGgy321/9h/ENIRX+7e8C24Blbts41TitRAP0IfTbDlcUkJd
 t3HdZ2plQn4TMUgsj9no2sxUc8IeskJhw+34hfXh7qxpACWnEobX9JoViErIzFesuYp7
 n0ej0tb26BSRZAOoHqoDzR0mWqa0YoZi2nc/zz6CfEU/0kliIVJHBi5vXLWGp5FPIePU
 STSKZNznueGgNRmR276cRm0T30YRBpjq19DBD5WGcTQuy4YXV+F5AK8FeIUwmlt2t9St
 STsOcRckfl1b1tn9uKIvsflYc9vt8zmaXtlWL5koQcsP9j7F2JPwT7GSc2Jdh9L20X+v
 xABg==
X-Gm-Message-State: AOAM532oo0hX+uU6pEzvW6AMQGXmo0jwNSfrsAuRFRXEUo65FZUVU4u7
 Y3Dvi5L92oYwMEdu7UNj9Os=
X-Google-Smtp-Source: ABdhPJycUnUhTacxELkkzMTHqJCc1AEZ6djKxUQSXRPs+TD5RBzndAEK/awekMblZLe8/TYOxfN4dQ==
X-Received: by 2002:a17:90a:d48a:: with SMTP id
 s10mr1743434pju.116.1593451196167; 
 Mon, 29 Jun 2020 10:19:56 -0700 (PDT)
Received: from [10.230.30.107] ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id u128sm257548pfu.148.2020.06.29.10.19.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Jun 2020 10:19:55 -0700 (PDT)
Subject: Re: [PATCH v2 06/10] phy: mdio: add kerneldoc for
 __devm_mdiobus_register()
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
 <20200629120346.4382-7-brgl@bgdev.pl>
From: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <1ad2dbe6-ed87-4be0-f431-b5f223b9dd6c@gmail.com>
Date: Mon, 29 Jun 2020 10:19:53 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Firefox/68.0 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200629120346.4382-7-brgl@bgdev.pl>
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
> This function is not documented. Add a short kerneldoc description.
> 
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
