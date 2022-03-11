Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED39EC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Mar 2022 15:51:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T2btlBP4BXpn4kOwEoqZExPSSR6a2JGcaSWdysEn7c0=; b=sX22F9HZhk+Z5/
	l7fUQh8JIwUNZhCjIkZRKAfAD/tZ2CIzaeb63c9CamY99rKsKopjjuRDApWCgl1iSpsz1SxPLISgv
	LL2UXxZkMK0Im079z64v3AeGXoTRtLdrpigE4LRULTB58yClHZJfT+bZ/q48CVLeFnm0fRLo+YG5f
	FGQlUDFVM5u7j5EHCpd4g6HGb+BiO0VifVKplVTZCYP9Au6128IVWrVZIL0armmVvJJ3H0rE6/ueR
	fvC20A2GZrh5xgAjHIwXaOj+O2wTS91SX23E5csRyC/6gtGRJxxjSRpOGUG3z+C6wyj9AUi01QzPL
	DivkpuPhnOEuBiwDlxAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nShYC-00HCrb-3e; Fri, 11 Mar 2022 15:51:32 +0000
Received: from mail-oi1-f172.google.com ([209.85.167.172])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nShXh-00HCbc-Bp; Fri, 11 Mar 2022 15:51:02 +0000
Received: by mail-oi1-f172.google.com with SMTP id o83so2308479oif.0;
 Fri, 11 Mar 2022 07:51:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=6NEUsk0pZcf1ZvCBxSl99gFtqxiz2JOvHrLo+iX2PNw=;
 b=66RKGgMtAAOlmCG6dGJutKgm+Wy8eYcK5Nr/VBEoUta67IrVipksxri0O55FNyonfl
 7k6V6gnXmtVYrbk21sy+ly05/AOfoarceCaWV1Fgh1RUkA4QFbtDbtREiJVI7tBT3XMI
 TaF9TrsICfRzYudTuRa96C93uyeur+LQkfICHzYSHjFqukuBAaYiYVmp3Sj1psKxy9JJ
 TjaboniL7FgRp1FYFfrzJVjnsoTO7hy702vb68ohsPaINasspqEBk4bvvY9+bYx01ZQq
 vKoyTWYgISFwB2oApPTmkguDF2BYespWZRt5zNAsRbAnX9Ld+55SCCUjfcxYSLZwxTeU
 xZwg==
X-Gm-Message-State: AOAM533+vQ7J+xZ1lFj3Gapl/G63yexuhPZhSqlIRSxuwhkZMrKN/TuL
 GJ8OLq+YfWuSfg8C/7rNoQ==
X-Google-Smtp-Source: ABdhPJz2tFjP0i1YZqYFU0hfa5NCSKGTYu5YnNfXEZ09NUTvDUZh3jhw1aVDauubxBUJCcGUqbsMog==
X-Received: by 2002:a05:6808:2c4:b0:2d7:968c:dd37 with SMTP id
 a4-20020a05680802c400b002d7968cdd37mr13361942oid.146.1647013860505; 
 Fri, 11 Mar 2022 07:51:00 -0800 (PST)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 p67-20020acabf46000000b002d97bda3868sm3886508oif.45.2022.03.11.07.50.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Mar 2022 07:50:59 -0800 (PST)
Received: (nullmailer pid 3867630 invoked by uid 1000);
 Fri, 11 Mar 2022 15:50:58 -0000
Date: Fri, 11 Mar 2022 09:50:58 -0600
From: Rob Herring <robh@kernel.org>
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>,
 Allen-KH Cheng <Allen-KH.Cheng@mediatek.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Thomas Gleixner <tglx@linutronix.de>, linux-mediatek@lists.infradead.org,
 linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
 Kishon Vijay Abraham I <kishon@ti.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, hsinyi@chromium.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: [PATCH v4 2/4] dt-bindings: watchdog: Add compatible for
 Mediatek MT8186
Message-ID: <Yitv4sRQMuewLcfT@robh.at.kernel.org>
References: <20220311130732.22706-1-allen-kh.cheng@mediatek.com>
 <20220311130732.22706-3-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220311130732.22706-3-allen-kh.cheng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220311_075101_447505_E8F2AC75 
X-CRM114-Status: GOOD (  10.73  )
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

On Fri, 11 Mar 2022 21:07:30 +0800, Allen-KH Cheng wrote:
> From: Allen-KH Cheng <Allen-KH.Cheng@mediatek.com>
> 
> This commit adds dt-binding documentation of watchdog for Mediatek
> MT8186 SoC Platform.
> 
> Signed-off-by: Allen-KH Cheng <Allen-KH.Cheng@mediatek.com>
> ---
>  Documentation/devicetree/bindings/watchdog/mtk-wdt.txt | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
