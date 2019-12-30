Return-Path: <SRS0=GpGz=2U=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 633F9C2D0C2
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Dec 2019 17:56:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 36F0D2071E
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Dec 2019 17:56:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="g5PTvHbg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 36F0D2071E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CPaObcpJGAW3iLxlXKe2CKl7SvctoK4P+jdT8MCJ3Kg=; b=g5PTvHbgO1GKZq
	YWwD4SPWkM2EDMZJNMZIOGZcS17PZ/ecoU3fGuE8SBPZS44ax0CskkbEU5P0pfVmg/ynJ4y2RjWT6
	cvdRrUDByLYBWkCIQs9StDa+jwjT7q5x78JUVQPftjURqplNmH8QVYuje3oz8oi1+rD3SuM0/eCUc
	hx3dpvjFVuZREXXwIzvg6IR6l5/SP3xxBg/qWGkm69U+/nvqvRUli2OlkCDmp24UNaUv3Ox4gsc0H
	UlDK5ZXmRv01WFiZa8aOQGYiFWKd6r2ifgzZBvD1ZjzGQIeVedZe80E3rY1wY+hIk9pLPwUv21yn7
	YbJr7IXPzd4GmvCKUBMA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ilzHj-0006t1-D0; Mon, 30 Dec 2019 17:56:55 +0000
Received: from mail-ed1-f65.google.com ([209.85.208.65])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ilzHZ-0006k1-N9; Mon, 30 Dec 2019 17:56:46 +0000
Received: by mail-ed1-f65.google.com with SMTP id r21so33330122edq.0;
 Mon, 30 Dec 2019 09:56:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=cygsGGkDeAamm3MSoLJvChT4FcSCrOxKMla51D5XTzY=;
 b=oG9maRcjYfH7XbaX6qtUyFPMZ2NO06ZojJd+HymgtY9htcNT+wciKUL64HyVSgYFro
 gTGJiNs9jie8xVRQguEWyH1Z3YuretEJ5v789rF5oHRf4+BFe1hYctjcoGtQY/vcsdNU
 L0eW0HcqvZ6+SoAg6JSJCy7GUulnbmfeBRENd0tYK2A7rqPiAZ2E3yZUKJh85nC+yi1B
 slNKxFBonV0WsH8zrhyJMeQHXnUcOwgBuasKT4W04+LqCspBz6/kkRXSYukureiIywci
 GgaD55X68Sj3fiWzwKIb/yWxBR9WDqxAbBkKcYNJCziBC6g5sHYzKmvgp8Nq53ZJrmKa
 SBNA==
X-Gm-Message-State: APjAAAWYgpZ3fxt481/bRP15JTH4y9z2ab0bNy1WZSdO5E5RnE8Pi/tE
 QxnNJxgVFmAAeZZiEiEg+IQ=
X-Google-Smtp-Source: APXvYqzr5OU0/SLj/QhAWD0LTF1mLjy+UZqJa/pEeT9a7+Demos5yAW/kVgxn9NAx+dQPM1xMT5+uQ==
X-Received: by 2002:a17:906:a84a:: with SMTP id
 dx10mr70871987ejb.61.1577728603531; 
 Mon, 30 Dec 2019 09:56:43 -0800 (PST)
Received: from kozik-lap ([194.230.155.138])
 by smtp.googlemail.com with ESMTPSA id m5sm5423715ede.10.2019.12.30.09.56.41
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 30 Dec 2019 09:56:42 -0800 (PST)
Date: Mon, 30 Dec 2019 18:56:40 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Yangtao Li <tiny.windzz@gmail.com>
Subject: Re: [PATCH 7/9] memory: samsung: exynos5422-dmc: convert to
 devm_platform_ioremap_resource
Message-ID: <20191230175640.GA29380@kozik-lap>
References: <20191222185034.4665-1-tiny.windzz@gmail.com>
 <20191222185034.4665-7-tiny.windzz@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191222185034.4665-7-tiny.windzz@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191230_095645_756450_A2C70F90 
X-CRM114-Status: UNSURE (   7.75  )
X-CRM114-Notice: Please train this message.
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
Cc: kstewart@linuxfoundation.org, tony@atomide.com, ssantosh@kernel.org,
 paul@crapouillou.net, rfontana@redhat.com, thierry.reding@gmail.com,
 digetx@gmail.com, linux-samsung-soc@vger.kernel.org, evgreen@chromium.org,
 jonathanh@nvidia.com, kgene@kernel.org, allison@lohutok.net, jroedel@suse.de,
 linux-tegra@vger.kernel.org, linux-pm@vger.kernel.org,
 alexios.zavras@intel.com, linux-mediatek@lists.infradead.org, john@phrozen.org,
 matthias.bgg@gmail.com, tglx@linutronix.de, linux-omap@vger.kernel.org,
 yong.wu@mediatek.com, rogerq@ti.com, linux-arm-kernel@lists.infradead.org,
 sboyd@kernel.org, pdeschrijver@nvidia.com, linux-kernel@vger.kernel.org,
 info@metux.net, lukasz.luba@arm.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sun, Dec 22, 2019 at 06:50:32PM +0000, Yangtao Li wrote:
> Use devm_platform_ioremap_resource() to simplify code.
> 
> Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
> ---
>  drivers/memory/samsung/exynos5422-dmc.c | 7 ++-----

Thanks, applied.

Best regards,
Krzysztof


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
