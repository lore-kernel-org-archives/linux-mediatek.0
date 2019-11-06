Return-Path: <SRS0=ljL/=Y6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56F28C5DF63
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Nov 2019 04:17:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 11CFE2077C
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Nov 2019 04:17:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IY003fR/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 11CFE2077C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rLdJR+7AZ2Wkce1PCXluH70dv4bvbxwtXX2RDscVvrY=; b=IY003fR/0FeuAd
	hUSZYzvURs+UkdZBtqWr9loIX6LFnbOqD8FxREPMV0vRTEEZNM+Hjmqepjdv6qhqywqIZvw/prPq3
	ibByDROwywIog3czH4YALrz1mv1anPQtSrdWWae+i7VM4dxCtoAi3p8KZbq4R76Rb6XWpzfeh0a9R
	/W36yejoPdQWZBpRN++IApr4Vn+WCcpwFbOop5pxUqNTR2P5iSuojJWiwm9doGgQS4DCsDqFksuup
	CdK+UL0yHgshwv2XBstGRLa9TR4//MBC3TeyF5jGM6r5UsRghrPDTaS9LCRZtrZxEf88+VRUgp0UC
	Y07EkV2GOjpS8ANnjYuQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iSCkr-000827-SB; Wed, 06 Nov 2019 04:17:13 +0000
Received: from mail-ot1-f66.google.com ([209.85.210.66])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iSCko-00081U-Hz; Wed, 06 Nov 2019 04:17:13 +0000
Received: by mail-ot1-f66.google.com with SMTP id v24so14413848otp.5;
 Tue, 05 Nov 2019 20:17:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Pasjx8CSERkmvokF+MIWXBinQV2inOneX0DH/i8NKYE=;
 b=J9Ij3boPUbXHvFDIUHSoBpCPioLd+28r7dM05+/pJwGYf8F3u0KSMTaloOXsVu/Uvy
 sZoZOGffX5PmAnqSxEzQu5zan0pN4hPV4kfrmMGA2P9mq8UFJvujZvqSv1YJ/ER1jp2Q
 ItBNo19eoIwznsIYMzuB1ttfZ3vYsX8JZVxyrkYLsHjY+sdVwXOzvcwlcorfeVpnMded
 zakmsQQ+9338s9YPbM1C0pUi57/vtBOGA6Sa9wmREERxi+csgoOD7IIoFZlFtGYB+OOQ
 0VUMBmTpn5VFCov1Z5JVhzMTu9+0yeU5HaBxqdMbAjD6vrIgXO+ielwpuuMnkaUg+lIL
 peog==
X-Gm-Message-State: APjAAAVD4PH+lvZxwfGfHA8toaVAiEkslHYh9ZAdS3R/9RTVXUvLG6LT
 rKaVir1tHjFG5HLuQTiIbg==
X-Google-Smtp-Source: APXvYqymW3STVwrnKyM7oB8B3KKofNBMHecjlu2u2+qn0yFU8UaxgzxpuvOLNAN28Z1FkkCBVB69Ew==
X-Received: by 2002:a05:6830:1e84:: with SMTP id
 n4mr262047otr.233.1573013829794; 
 Tue, 05 Nov 2019 20:17:09 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id e193sm837103oib.53.2019.11.05.20.17.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Nov 2019 20:17:09 -0800 (PST)
Date: Tue, 5 Nov 2019 22:17:08 -0600
From: Rob Herring <robh@kernel.org>
To: Chun-Hung Wu <chun-hung.wu@mediatek.com>
Subject: Re: [PATCH 3/3] [3/3] dt-bindings: mmc: mediatek: Add document for
 mt6779
Message-ID: <20191106041708.GA26489@bogus>
References: <1572590582-11056-1-git-send-email-chun-hung.wu@mediatek.com>
 <1572590582-11056-3-git-send-email-chun-hung.wu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1572590582-11056-3-git-send-email-chun-hung.wu@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191105_201710_592565_7D8899B5 
X-CRM114-Status: GOOD (  14.98  )
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Kate Stewart <kstewart@linuxfoundation.org>,
 Ulf Hansson <ulf.hansson@linaro.org>, wsd_upstream@mediatek.com,
 devicetree@vger.kernel.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Kuohong Wang <kuohong.wang@mediatek.com>, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Pavel Machek <pavel@ucw.cz>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-mmc@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 Stanley Chu <stanley.chu@mediatek.com>, Pan Bian <bianpan2016@163.com>,
 Chaotian Jing <chaotian.jing@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Nov 01, 2019 at 02:43:02PM +0800, Chun-Hung Wu wrote:
> Add compatible node for mt6779 mmc
> 
> Change-Id: Id36a136a75e892c9360ec95c7f52db06f5b308a4
> CR-Id:
> Feature:

Remove these tags.

> Signed-off-by: Chun-Hung Wu <chun-hung.wu@mediatek.com>
> ---
>  Documentation/devicetree/bindings/mmc/mtk-sd.txt | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/mmc/mtk-sd.txt b/Documentation/devicetree/bindings/mmc/mtk-sd.txt
> index 8a532f4..0c9cf6a 100644
> --- a/Documentation/devicetree/bindings/mmc/mtk-sd.txt
> +++ b/Documentation/devicetree/bindings/mmc/mtk-sd.txt
> @@ -12,6 +12,7 @@ Required properties:
>  	"mediatek,mt8173-mmc": for mmc host ip compatible with mt8173
>  	"mediatek,mt8183-mmc": for mmc host ip compatible with mt8183
>  	"mediatek,mt8516-mmc": for mmc host ip compatible with mt8516
> +	"mediatek,mt6779-mmc": for mmc host ip compatible with mt6779
>  	"mediatek,mt2701-mmc": for mmc host ip compatible with mt2701
>  	"mediatek,mt2712-mmc": for mmc host ip compatible with mt2712
>  	"mediatek,mt7622-mmc": for MT7622 SoC
> -- 
> 1.9.1
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
