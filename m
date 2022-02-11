Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B10FC433FE
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Feb 2022 16:24:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dHdV0ZJQ50bM4Kvc9+u0RxLGx36qmMaZUUzD0VfyZtg=; b=b1H8KR/NNJW18j
	MSmBKdrUlpXM+i3jPgfueIR/rkAE6cwTqDW5ELSd3oR0BgNQcw7bZT9xbbyXTXkIYY8X+nT9FAEJd
	sP75RvV/YHf4bbYpLPiLOc+PLmhqCohEYqw8HvcvqceY7hgPgWpydEVvAP5t66CyZLjMKES0mbI0Y
	/e9uXjybXcA7+TM9P8b+7xZuGDOUkZ67GYe6oDPJmaWkndH202nrWGfN1Cpi9ymtydBwOj0nq0A0d
	CX8Cj+ZOEKFzsOA0jlLe9gvk5qsRrRVCqGpALw6MqEN8Sv4CDbuw6qrptLd3uQ48gDdynJOBJPKaI
	orXoaPZv6feW1y0qtpCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nIYit-007zDN-Km; Fri, 11 Feb 2022 16:24:39 +0000
Received: from mail-oo1-f42.google.com ([209.85.161.42])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nIYig-007z9Q-TI; Fri, 11 Feb 2022 16:24:29 +0000
Received: by mail-oo1-f42.google.com with SMTP id
 r15-20020a4ae5cf000000b002edba1d3349so10961416oov.3; 
 Fri, 11 Feb 2022 08:24:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=kk86tqsUEpDxDSxl+QDVY+d5jMkdIEVlk+S99jE+nwY=;
 b=RJGKjNH2oVfSkJQG1fpZKb8t/d3jTKeo+86FoJMJIRCn2hq59aGI9KBE7W3i6bKr4Q
 TImQ3VGt7jj00frpnIOKda/jn9srktsjkCHQyxrclR8jPyOfxVMNysd6mQXTH+JM3XUY
 8jo/pK0sLfpcuEjEwm9ig73pesmcVD+L0Mz4APvchjzILzTqCQj2AKFJkCXIAggfy81V
 sOWhXVBw8GYj1EAP9C0IbuB4jHQZFDOPLMddGUHJwoIgINA6qyDCYNjef6r8OcYWxbGk
 qAe8q0W0vl993JvLkP0mGzfPsSmCmiGiAfE/7SjuvxoMqUM/WhgUedK79v/uqH6no0dU
 Id3Q==
X-Gm-Message-State: AOAM532JYXFKedywHvfW/en1g+0hyi8iMHMS3MsFZ6Q2ts/VKjFfkurm
 lxdKU0NCr2MVDHsAsbD1Hg==
X-Google-Smtp-Source: ABdhPJwKruKy6RoVrRIbIioHuouwXc6h8IL6hYm+OIbFE+u/d+PwHhNYbAkPHqMG6SHemeIcPu1jZQ==
X-Received: by 2002:a05:6870:5795:: with SMTP id
 i21mr405221oap.284.1644596665526; 
 Fri, 11 Feb 2022 08:24:25 -0800 (PST)
Received: from robh.at.kernel.org ([2607:fb90:5fee:dfce:b6df:c3e1:b1e5:d6d8])
 by smtp.gmail.com with ESMTPSA id
 4sm9809239oon.21.2022.02.11.08.24.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Feb 2022 08:24:24 -0800 (PST)
Received: (nullmailer pid 465268 invoked by uid 1000);
 Fri, 11 Feb 2022 16:24:20 -0000
Date: Fri, 11 Feb 2022 10:24:20 -0600
From: Rob Herring <robh@kernel.org>
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, linux-pwm@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-kernel@vger.kernel.org,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 Lee Jones <lee.jones@linaro.org>, Allen-KH Cheng <Allen-KH.Cheng@mediatek.com>
Subject: Re: [PATCH] dt-bindings: pwm: mtk-disp: add compatible string for
 MT8183 SoC
Message-ID: <YgaNtPOGlX0hZpWw@robh.at.kernel.org>
References: <20220207112657.18246-1-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220207112657.18246-1-allen-kh.cheng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220211_082426_965297_A70A5103 
X-CRM114-Status: GOOD (  10.46  )
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

On Mon, 07 Feb 2022 19:26:57 +0800, Allen-KH Cheng wrote:
> From: Allen-KH Cheng <Allen-KH.Cheng@mediatek.com>
> 
> Add compatible string for MT8183 SoC in device tree binding.
> 
> Signed-off-by: Allen-KH Cheng <Allen-KH.Cheng@mediatek.com>
> ---
>  Documentation/devicetree/bindings/pwm/pwm-mtk-disp.txt | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
