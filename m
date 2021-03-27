Return-Path: <SRS0=FzvZ=IZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EA04C433DB
	for <linux-mediatek@archiver.kernel.org>; Sat, 27 Mar 2021 17:58:54 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C473C61984
	for <linux-mediatek@archiver.kernel.org>; Sat, 27 Mar 2021 17:58:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C473C61984
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Zr50Ww2kJOrH9Y76AMJmCBpTEwZnocrSO9uyQj/HCIY=; b=TqOPh5jFx291qEgMjJE8adUom
	l4gydMOO3RbI7vnJEoVsud+tpOgd+Uc0hjr4qOitab9U7+5SQekokp+11NWv84iMhLpCzNDe8bZEF
	irVaxWnBaP5wbLeHIPg83+u9h7UOONNhXplyxMQANXpw0qcXSiHwa8H3ZqNSt6szad3COM8jv357j
	kxvoQNu5o1WCD2vC9KYJpzd4NEzC91NY9EZXrBtco/4oaEaAq6BiWdMzY7wmVDc7dLIws00p0Y6wF
	Z90y+PymsOoXqOTdEKj0B8SelnxOin41Tnk62Y0d3bGo3LUcqtIIuwImKuQvceUnK9ZVh1BdF5jRa
	Ssdd7YK/A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lQDCw-005NXm-4H; Sat, 27 Mar 2021 17:58:46 +0000
Received: from mail-oi1-f180.google.com ([209.85.167.180])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lQDCl-005NVh-6n; Sat, 27 Mar 2021 17:58:37 +0000
Received: by mail-oi1-f180.google.com with SMTP id d12so9051466oiw.12;
 Sat, 27 Mar 2021 10:58:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=X92yyW4gj/Ixj9WOOMpMQLD7ZBl0h5UrxBeJHhj7Hng=;
 b=fcIPKAfnHCaw3O9leGS8SXDsLKml8fSzXddc8+ieMDJoKAriLgggzTvGZ7sIo+rWGh
 MWKj7qepjF8yNl+bNm26+awvUDSnSbUN97ZMsQwjKeXuNdFjo4crswzLlme72R8fbh0I
 UKGqpml/o5ARKKUERSq8lpTrCw5err5565MNxZckF6fOXIpmguSdcR8JTCrjbGN73YWy
 XIt6cGBHWIh6Hu20LWrFxfI5yq2mhFohUwOOOunPQSuR6bdGu2dg6fKalnjN4T0oTP8A
 mLKtEyHzWiVG3ynNDnwpBx+J+YzoEbSU2G8dMoKwsxOyW2Bw0qSoBfq3J4tK67GmoUpn
 7iyA==
X-Gm-Message-State: AOAM532VyrNGqgAA8wYlGohXakhRyXE92KxA9ehCWUZphioHneljT+lF
 xiUm2QOUpcdPBOxtjaeM8w==
X-Google-Smtp-Source: ABdhPJxWsTy7jNrkEpQRK11hrj800jQczR6iF/j+pU4/oE6CruCZ74LdF0ABoat3X4QZHn7sFWK7iw==
X-Received: by 2002:a05:6808:68a:: with SMTP id
 k10mr11723680oig.120.1616867914087; 
 Sat, 27 Mar 2021 10:58:34 -0700 (PDT)
Received: from robh.at.kernel.org ([172.58.107.88])
 by smtp.gmail.com with ESMTPSA id q67sm2474459oic.55.2021.03.27.10.58.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Mar 2021 10:58:33 -0700 (PDT)
Received: (nullmailer pid 321671 invoked by uid 1000);
 Sat, 27 Mar 2021 17:58:30 -0000
Date: Sat, 27 Mar 2021 11:58:30 -0600
From: Rob Herring <robh@kernel.org>
To: Seiya Wang <seiya.wang@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, srv_heupstream@mediatek.com,
 linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 "Rafael J . Wysocki" <rjw@rjwysocki.net>, linux-mediatek@lists.infradead.org,
 Viresh Kumar <viresh.kumar@linaro.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 2/2] dt-bindings: cpufreq: update cpu type and clock name
 for MT8173 SoC
Message-ID: <20210327175830.GA321641@robh.at.kernel.org>
References: <20210326031227.2357-1-seiya.wang@mediatek.com>
 <20210326031227.2357-2-seiya.wang@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210326031227.2357-2-seiya.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210327_175835_453264_7513F482 
X-CRM114-Status: UNSURE (   9.03  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, 26 Mar 2021 11:12:27 +0800, Seiya Wang wrote:
> Update the cpu type of cpu2 and cpu3 since MT8173 used Cortex-a72.
> 
> Signed-off-by: Seiya Wang <seiya.wang@mediatek.com>
> ---
>  Documentation/devicetree/bindings/cpufreq/cpufreq-mediatek.txt | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
