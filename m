Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAAE0C6FD1F
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Mar 2023 22:45:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WGmqBO8tvtG99/0k+ELulYxIgVhet2LAkasG7nMBflU=; b=Y8cZjmbMyr8ruQQ3adtNOEFUpR
	Esp90UJspPg1ZhMWl/rysNqzGGWBQqeqE3l5OzovSNAmlavQDO5PHu4IKxK0ANjMBywqrz0afYCyx
	7yPWiQmxupIzWQdPIimjPIYxWByavciqcQp+1wGd1mBK8cCXq7UVhL9oQRuFev3Wtufh1Ci67MSWJ
	QaCoSon84KzfmtaRoxCxZTEsah7kIs2IYLbo3JMCQyGSS+9xgCnowMUixF8sDfLH66sPyZ39Bs47K
	mft0bls2+x/4v4Ma41qtUgQp94XPkkAMwh/OcdnDNnLEq+tfEerd2Caj+RYtN2U0hyT5HmJgPu13j
	NuTPrHrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pcwLm-000DnS-0B;
	Thu, 16 Mar 2023 22:45:34 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pcwLj-000Dmh-22;
	Thu, 16 Mar 2023 22:45:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=WGmqBO8tvtG99/0k+ELulYxIgVhet2LAkasG7nMBflU=; b=qhGEX0UCPH2WnW/tpLuebXbE3k
	KLOZFAxsaKAha6bbMhzVAMT0nMoGFqVsbq8o1UgGsMMK/eI9lBkoI60ly1+oKSqMv8WrswuwbCKyr
	MMHPFUzXgrj3MHbVMYqOdk2OhGlvIXQpwU4IG6wfYX7Ph8rVDY5IbDuOnqVUXPBMuMZawK8kuMzBF
	F7TS215EVvpCpK4Lt2bvE10gePUGSgb9kRQGSpsJxkIOu+h03q/VvBb9z803d0JBWjN8AwaITCGyw
	Zmku77+JoqXOTmPyXPAQksnQiYBw2zYQ4W1MEOpYjUdimaXcZ09MxYcmLDBLM6zTMrM04+ZBOYq0U
	pUHQeJ7w==;
Received: from mail-il1-f174.google.com ([209.85.166.174])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pcwCf-002Znk-28;
	Thu, 16 Mar 2023 22:36:12 +0000
Received: by mail-il1-f174.google.com with SMTP id r4so1846903ila.2;
        Thu, 16 Mar 2023 15:36:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679006165;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WGmqBO8tvtG99/0k+ELulYxIgVhet2LAkasG7nMBflU=;
        b=gBmSyjs7P5vBOjuCbiP4EE52zBvkrhZGwGE9Sa2C/tR9lbcoeH6q3ONwCN/ZZzwGxt
         nKIkqjCBkZyQEP+dsSqjFo3JxhbvROuKNgm9ILOmJJo2uEIoOpW1/eLYy4lmiapyrkac
         rGSeqb6BJyVXwhyfpzIGKtpc2QKdAYHyBT5ANJ6TVSd1jKMs/vVSq72vn8od+sgTwtaY
         RN78xGbpXjj49KB6Vu8bJFyXyVb2PByweG+NXtnhvS8r8ds1yPLmGvzxI015EkvOZWVZ
         nze3BmWVE8j2i54MTcr6OICYbKRNEE4vt98XTAU6iyRDupRx1VNXPLO4iprQakCRJMmu
         5Iqw==
X-Gm-Message-State: AO0yUKXHOb3Apmk9y/AkSW4mcYMyfZfnc5G9jYWfKD0C/SRodz1N8oGA
	7SLqCD/xMjcUWTEvSDNsJg==
X-Google-Smtp-Source: AK7set/CrJeH6VccMrXbVdIiMGuP3h22tHMJ9Qj/yyC9FRABV2twpZnJk9b3XH2fZ4Qmu2QJFA8b9g==
X-Received: by 2002:a05:6e02:f86:b0:318:1cff:5e18 with SMTP id v6-20020a056e020f8600b003181cff5e18mr597404ilo.3.1679006164805;
        Thu, 16 Mar 2023 15:36:04 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.249])
        by smtp.gmail.com with ESMTPSA id u19-20020a02b1d3000000b004054a9c3fb8sm155566jah.89.2023.03.16.15.36.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Mar 2023 15:36:04 -0700 (PDT)
Received: (nullmailer pid 4013517 invoked by uid 1000);
	Thu, 16 Mar 2023 22:36:02 -0000
Date: Thu, 16 Mar 2023 17:36:02 -0500
From: Rob Herring <robh@kernel.org>
To: bchihi@baylibre.com
Cc: ye.xingchen@zte.com.cn, rdunlap@infradead.org, linux-kernel@vger.kernel.org, rafael@kernel.org, matthias.bgg@gmail.com, rui.zhang@intel.com, daniel.lezcano@linaro.org, devicetree@vger.kernel.org, amitk@kernel.org, james.lo@mediatek.com, rex-bc.chen@mediatek.com, linux-arm-kernel@lists.infradead.org, robh+dt@kernel.org, linux-mediatek@lists.infradead.org, angelogioacchino.delregno@collabora.com, khilman@baylibre.com, p.zabel@pengutronix.de, linux-pm@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org
Subject: Re: [PATCH 1/4] dt-bindings: thermal: mediatek: Add AP domain to
 LVTS thermal controllers for mt8195
Message-ID: <167900616235.4013462.1734891901730113817.robh@kernel.org>
References: <20230307154524.118541-1-bchihi@baylibre.com>
 <20230307154524.118541-2-bchihi@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230307154524.118541-2-bchihi@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230316_223609_877117_CEDD877C 
X-CRM114-Status: UNSURE (   8.71  )
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


On Tue, 07 Mar 2023 16:45:21 +0100, bchihi@baylibre.com wrote:
> From: Balsam CHIHI <bchihi@baylibre.com>
> 
> Add AP Domain to LVTS thermal controllers dt-binding definition for mt8195.
> 
> Signed-off-by: Balsam CHIHI <bchihi@baylibre.com>
> ---
>  include/dt-bindings/thermal/mediatek,lvts-thermal.h | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>


