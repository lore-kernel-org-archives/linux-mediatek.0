Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2821EC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Dec 2021 19:48:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Pf3PXZd2+rKWZD17o3JI3ryyMNUQAZ4TL7WGx92U6Q8=; b=CTG9F+huDJdxz4
	lYeUIAbZ7ebEjcBKLLqM8xiq65c+Sr9MaKAey+TXTB0bKZotNXhfEmd6uMQK6LBble8CK0oK/oE4Q
	cbNafvSWDSciQ0MTrDlY2exPOEz8RGYYjv73oRCJFOwMD/7EritJgxjQae3lhsoOYwPfY24vp2R8Q
	jrVypROooOur6tCigKRYrL4gnjWrJqpiVSz2iuqXfWe5QrVG7DpZ605SF/0HlBJh1RyDNaEgP5dfn
	JKpw2GwUJ/WTBdFttRjN2baeAhBmA+wKRAZZ6N9aUkxH2QBMIVEI7y/jmgHXFx1zRBnbTJtU/Z/l0
	4ZSHabcHyG2rSN54qzfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mzl7z-008IxC-Fs; Tue, 21 Dec 2021 19:48:51 +0000
Received: from mail-qk1-f170.google.com ([209.85.222.170])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mzl7x-008IvR-0g; Tue, 21 Dec 2021 19:48:50 +0000
Received: by mail-qk1-f170.google.com with SMTP id m186so131767qkb.4;
 Tue, 21 Dec 2021 11:48:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=cr4ohkHw/sRSaSwbagnguCVynOjj/JGVHdxWebkI42I=;
 b=MY21ZwHOZir7s10jDkefCcIT216PjnAmF4P65hHeKAJeN1GMUUeF1aLDMfthnXdPz/
 KUkdbXkHF+1/8S80zsrfEev0VzBuWdSfHgQymPaAV2WcWgW0oWykD3UdEOxKMhG9o4uL
 kwPXl7vEnIZ0BWT84fN/igj0TNi7e+V/8f+HyaRIC3Ya+7W9PkwFjpYXpcG0VNhtdWKp
 FVu6Lg/fQaOVBZq0oKUi7rnHgj6xuBFeoCNOeI/t32hXRCjffojqRuVWYCNd8I4cx9IX
 lRxwn1cxpVbauUQjpmKSFM2YQjHdQVzrJApYyzO8v5PfJB5EUoVLcu/g8UA5jMkCMtqw
 uIMA==
X-Gm-Message-State: AOAM530bMHhI2R1EbhJv6wxWOG4jrjTQmUdUo5PoJKuzulDT6vG3uwb8
 xN99Vt9EGUkl1cLaV+t9Ug==
X-Google-Smtp-Source: ABdhPJwXk30eHl9BnaqFn+Na777MBuoDagY1LQ5wk8N+oJ0D32Y8XLTVh1ccwmJgdv6WmLuAi8Vhmg==
X-Received: by 2002:a37:9a94:: with SMTP id c142mr1649419qke.117.1640116125979; 
 Tue, 21 Dec 2021 11:48:45 -0800 (PST)
Received: from robh.at.kernel.org ([24.55.105.145])
 by smtp.gmail.com with ESMTPSA id d17sm17161839qtx.96.2021.12.21.11.48.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Dec 2021 11:48:45 -0800 (PST)
Received: (nullmailer pid 1635995 invoked by uid 1000);
 Tue, 21 Dec 2021 19:48:43 -0000
Date: Tue, 21 Dec 2021 15:48:43 -0400
From: Rob Herring <robh@kernel.org>
To: matthias.bgg@kernel.org
Cc: linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 robh+dt@kernel.org, groeck@chromium.org, matthias.bgg@gmail.com,
 lee.jones@linaro.org, Matthias Brugger <mbrugger@suse.com>,
 bleung@chromium.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mfd: google, cros-ec: fix property name for MediaTek rpmsg
Message-ID: <YcIvm/RaMxLL7gSK@robh.at.kernel.org>
References: <20211218081543.3851-1-matthias.bgg@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211218081543.3851-1-matthias.bgg@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211221_114849_079463_ED5EE7A8 
X-CRM114-Status: GOOD (  11.25  )
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

On Sat, 18 Dec 2021 09:15:43 +0100, matthias.bgg@kernel.org wrote:
> From: Matthias Brugger <mbrugger@suse.com>
> 
> The MediaTek rpmsg-name is defined as mediatek,rpmsg-name in
> mtk,scp.yaml. Fix the binding documentation to match the new property
> 
> Signed-off-by: Matthias Brugger <matthias.bgg@gmail.com>
> ---
>  Documentation/devicetree/bindings/mfd/google,cros-ec.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
