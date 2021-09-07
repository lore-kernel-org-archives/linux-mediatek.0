Return-Path: <SRS0=gwp9=N5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE65BC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Sep 2021 19:28:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A32D66109D
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Sep 2021 19:28:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A32D66109D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ym9MSEhcXvTI2Y3gt6nCulBxTxWS7WzRzBHCybQ496E=; b=btKx+9uOGEAhvo
	UjBU59KcXFiY9+UrFZ8RAq9CTXy686pHPeanJtWnrVzqBZNk02QZeJCI45S6+GWfuHFa1oQCd5IUx
	82aebiStox1HO1PnNylA9dpG8wqV+cSt8NDO73yyqTdKPgNr9aY887/T5Yfr1GFaRdLulXO7R6d2z
	sgRw4CZMOs+orhC2PAAFkeWCpS6qZ7/CHmRSAbwvouYyFxAHWJDqd4xI7OEKp0mjNXDm0QJz4fp5P
	U5HiDwOT0/X0rj69vd3Z2kW5E8aaC0oQKhENFtfHLCHm0XZi1zewEeG/dVVPzC6n3zwXez4S8gyrp
	ffurL95iNXMtPmlb0UMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mNglj-004ZPV-FZ; Tue, 07 Sep 2021 19:28:31 +0000
Received: from mail-oo1-f48.google.com ([209.85.161.48])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mNglW-004ZLS-KA; Tue, 07 Sep 2021 19:28:19 +0000
Received: by mail-oo1-f48.google.com with SMTP id
 g4-20020a4ab044000000b002900bf3b03fso127111oon.1; 
 Tue, 07 Sep 2021 12:28:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=TFNxI/th+I6c8v2S1JhOFknsclAVoGZJrQS33g8IB4s=;
 b=Ialx2aKrAFbflWKqici9IL1UqJIylve7iFCrUgCzCjYILhg+ZLO4iMxwEs9E8Q2K7x
 j39MzB20TcLFBjM49DgWsqT6JsI/0aY+CzBPs9Bx5CiK6nwDEN1F1decU3FeEXPainoF
 giGT1oFsA98mft7ulyNhc14h2Gt4OpvL6a0SR20YoAiIXGvm6u4RS6cJMHWZixbUJWok
 wbbgs1xs7LvYSOdPH92iZJ7so2wZwsnkPQ6qc3OGF3RbK3jxGyxU6/4xO4ihwVnBPVm7
 9B0x4kEApGmgZB1cUuxq6Y0nG0ezJn7DXyK4vqFbVFWEvMofhiiVogy49apjp2/eW8x4
 4ClQ==
X-Gm-Message-State: AOAM531T9GBHoDbq5pYcEQmZzHHJU4Sk2P4yHqc6jrZ5HUvgADi1+gbt
 kbK7WYsgDy1yiKmLWiSWFA==
X-Google-Smtp-Source: ABdhPJyw2cjiz04Vl4DlvrU3cwBlg7+DslpHmlBuvmJuxSQy2fZDpW50Db/BYzeqQzzFQUqSJMu3hw==
X-Received: by 2002:a4a:ab0c:: with SMTP id i12mr1342573oon.24.1631042897722; 
 Tue, 07 Sep 2021 12:28:17 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id c14sm2582754otd.62.2021.09.07.12.28.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Sep 2021 12:28:16 -0700 (PDT)
Received: (nullmailer pid 205682 invoked by uid 1000);
 Tue, 07 Sep 2021 19:28:15 -0000
Date: Tue, 7 Sep 2021 14:28:15 -0500
From: Rob Herring <robh@kernel.org>
To: Fengquan Chen <Fengquan.Chen@mediatek.com>
Cc: randy.wu@mediatek.com, Rob Herring <robh+dt@kernel.org>,
 linux-watchdog@vger.kernel.org, rex-bc.chen@mediatek.com,
 Guenter Roeck <linux@roeck-us.net>, christine.zhu@mediatek.com,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 zhishuang.zhang@mediatek.com, fengquan.chen@mediatek.com,
 tinghan.shen@mediatek.com, joe.yang@mediatek.com
Subject: Re: [v2,2/2] dt-bindings: watchdog: mtk-wdt: add disable_wdt_extrst
 support
Message-ID: <YTe9T/oqpwN5CHKR@robh.at.kernel.org>
References: <20210903061623.10715-1-Fengquan.Chen@mediatek.com>
 <20210903061623.10715-3-Fengquan.Chen@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210903061623.10715-3-Fengquan.Chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210907_122818_706462_6001B4CC 
X-CRM114-Status: GOOD (  11.10  )
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

On Fri, 03 Sep 2021 14:16:23 +0800, Fengquan Chen wrote:
> This patch add a description and example of disable_wdt_extrst
> element for watchdog on MTK Socs
> 
> Signed-off-by: fengquan.chen <fengquan.chen@mediatek.com>
> ---
>  Documentation/devicetree/bindings/watchdog/mtk-wdt.txt | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
