Return-Path: <SRS0=Rt7e=MF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CF9FC07E95
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Jul 2021 21:50:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E2D6561361
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Jul 2021 21:50:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E2D6561361
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xRPKNeK89v0uSF1iatb6uVJwg1F+7mYHznEB++N8/tI=; b=CbSGyb+kQftTF2
	kq+vIDSxJzVkNX62OxK6gvZSfIDjz1GKYa1mMbUvbHHB0RL5Be7aWtNn5HRVmskxI4wuMoxZVHqqD
	vAhYyDygJk/qABgrrQPmqbeOorlCbxB8Kz+Bo2grjEjkVd8iKLsh1QH2c3M3vKJgVuUvEZ5CuTMXX
	ZLTNybEHvu92IpfShr1xSw1x1W2pwikE8zXMZfFvz/eYrrwn3BOnLnOlr5mlAwOE2cnoei/hSK719
	63ZBAjpqM5iiyEvxZebfxq4PgpUB1Wokj2RDenMNkwsWD0VYbIwdaZ9D2AgEzRGiIrzkUfdhGmaar
	2rdkojoQBVVc9AKSuHcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m3QIM-00BPfK-Tb; Tue, 13 Jul 2021 21:50:26 +0000
Received: from mail-io1-f49.google.com ([209.85.166.49])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m3QIJ-00BPdl-22; Tue, 13 Jul 2021 21:50:25 +0000
Received: by mail-io1-f49.google.com with SMTP id d9so29071528ioo.2;
 Tue, 13 Jul 2021 14:50:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=RnEa5dv+l7cOs0gPE0rTIeCxkfrj4i5OqfYNRI+rvCU=;
 b=m3dpbAO34rc6XgMnfQzAlfnOMXgbwggKv+q4oqW6Wz6C0VMJDjdJm3izUfmkQ8j1o/
 KJP6euwIcCx3hNp6wg1+yjZU61T0iOOxM5YVAQ8lbtaelcvnULy3wXWV470OHKlKv5ly
 P1Fpmjblhq4c1fkP0CPh4en9rbBHnvYC5LsWMBNSzPKJ/V+Ebd7S2Y8Qwbl1/NutDAz2
 LokGWw/DjzAzVAiNHAmbW8nEmDzTTGLiEFdUuOaUze8+L58wcPUO8pl6Cjdn+XlrbhNr
 nHO+tKHGL16Xm4WxeigVlWhFOC4v55saUdg49tLA2bAEu/w/CfVMPO++K4D7cFXnMEC1
 gapA==
X-Gm-Message-State: AOAM530udunDYo8aViOaB+wErlJvVY8S/O/9NSyqMdv1sqVdv57yZbNE
 k/eAdIWHyt3/RY6ySM5Uww==
X-Google-Smtp-Source: ABdhPJwUAQDIwsXCEWvWxZVw93gRVjeoG6rhcZoj9jDIJ5KLG3p6NJ2qY84PQCRKvmgrQGzfyty8nA==
X-Received: by 2002:a02:cd1a:: with SMTP id g26mr5976739jaq.38.1626213022168; 
 Tue, 13 Jul 2021 14:50:22 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id h13sm100447ila.44.2021.07.13.14.50.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jul 2021 14:50:21 -0700 (PDT)
Received: (nullmailer pid 904604 invoked by uid 1000);
 Tue, 13 Jul 2021 21:50:19 -0000
Date: Tue, 13 Jul 2021 15:50:19 -0600
From: Rob Herring <robh@kernel.org>
To: Chun-Jie Chen <chun-jie.chen@mediatek.com>
Cc: linux-mediatek@lists.infradead.org, Nicolas Boichat <drinkcat@chromium.org>,
 devicetree@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, linux-clk@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Stephen Boyd <sboyd@kernel.org>, srv_heupstream@mediatek.com
Subject: Re: [v13 03/21] dt-bindings: ARM: Mediatek: Add audsys document
 binding for MT8192
Message-ID: <20210713215019.GA904547@robh.at.kernel.org>
References: <20210706061920.16013-1-chun-jie.chen@mediatek.com>
 <20210706061920.16013-4-chun-jie.chen@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210706061920.16013-4-chun-jie.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210713_145023_145131_C92105C9 
X-CRM114-Status: GOOD (  10.51  )
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

On Tue, 06 Jul 2021 14:19:02 +0800, Chun-Jie Chen wrote:
> This patch adds the audsys document binding for MT8192 SoC.
> 
> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
> ---
>  .../devicetree/bindings/arm/mediatek/mediatek,audsys.txt         | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
