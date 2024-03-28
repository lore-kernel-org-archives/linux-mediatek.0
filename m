Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7884ACD11DD
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Mar 2024 16:21:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TpQlnbUKf5vfOk3TpOVHNGMqh00k5XUuxEvlHT+naYc=; b=ey66Q6zgKKJWDJfUD4HHytG6uT
	/oKb3Kmm/1s6SRubh6bUgR0R9V6jqeIGK9zODt5WeekRe0lzGODfcWc1SZGJeGHWVY/mpR3YX4lD1
	ia9QzB0epLwBKJ4YrdU3A6Yhan+ea9Zb8q6EP1DjQq9MUnPFMnRYVYwNIxOmy7Is/tnVOjF+t6JSA
	cKcxNkrgg9noAu3mqD6O1Js52KWNK0Jx7774ujvPQ9aqYwVa6/OUptbH/gPDlyyhF6EIl0dsGqtKS
	G7Zz7TRJ5oAhlNWEjo8DEpbuMNU2pfcembSk0kE5DUMVZRnxrcH5sfWvtsyYezXaGTmftp77SkMFG
	gba/k50g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpsVa-0000000EiFw-0wi9;
	Thu, 28 Mar 2024 16:21:42 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpsVV-0000000EiEc-38dB;
	Thu, 28 Mar 2024 16:21:39 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-6e6f69e850bso1345023b3a.0;
        Thu, 28 Mar 2024 09:21:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711642896; x=1712247696; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TpQlnbUKf5vfOk3TpOVHNGMqh00k5XUuxEvlHT+naYc=;
        b=Ig3SMP60ASVOXkyNLoVUK6JkoHfOklt0Rvx49rNdr9d5Ekj69vKRSw12yZMvYaI4He
         PFpt8Bw0g9IeNo9Tk36T6HyE77gshqmN1z2fQY4icdZEcKCXoLAAwHtBFtsQQWNqIoz6
         IvllvcjdJ6w3n6j0tFfhDcL9KhRzY0HWmiqPqLERqR7VBcGTuIGWAEX5atNCoq1BIQuI
         MUUctWvlMpXMiHBLHzzdIwiX4NovfN6QY9Oq2kXY35Ex94eQ2OOssaJCeTsgGT8tJzR5
         wgdu9Y5PM4cZmbuIpxvfyM3HDkTmJVI9STp/0vuHKKYTlwtzkHO/gcTHHhXG4UMzMqfy
         dJPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711642896; x=1712247696;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TpQlnbUKf5vfOk3TpOVHNGMqh00k5XUuxEvlHT+naYc=;
        b=X30hsn9crZACZIOPfHpcLkZa/cTXyNqm428m8NVBfbk2ZRsUE2FQkGuLuqxyYzCOR6
         LjEK+Eh3JZvvc/2f1Gkoa732n2gUNa5U4JyWZxTVHX1nJLFlVtXbrheSntitAZOOtY5t
         3CL66qt+E+YntrPOxqkK9KJwlsiEUpdwEJChYmN6RU8mymxs0SX8amXMce2U+RwQJ7dm
         9ii+wmLnHnC03pdnPsMwnUIVS+Qf7DRkohcIKFb/PTKT2kD5eX1nSdFCn5Ng4B1aREjp
         BEV4YlelpQkzedxegJ1UVloFjDmzv1AQg0enKXrm2cEi1ktljVVAVwETybA/rBBGFIPN
         oJzA==
X-Forwarded-Encrypted: i=1; AJvYcCVKEJe2MiO/oW7R88gJhhEHBZlnUwa2rb9Fin6TDYkwvdsXtR67qeyxY0yGCh9OxdRq6SCvakTE2C9ee7moyLpJea+EHSyaK0u6+T86Zbmt9p5CPF9B4vB76AqLGjUb712FFC5YOMrPIPgz3GMlEx8+0uwqLFyg4+7ZLCh+f3VJZSomf5mHsZilYbHdWsWBhffUfbJ93aLHvsmrLmHJ4ELMdY5N71hmYvIYEKarT4b9Aqb46o9XO+x1WQ7xP+Ax2NHUqOWi+FnmUZ7D6EqUCPXVk+FuBhp8wMsCLgfYEQIsywvD
X-Gm-Message-State: AOJu0Yx0H7H4WkQOsjAybJ1HF204iUZWuOSceAlLC77Z/nhdLRHGCVET
	RPcUIdoPPWgnfw+ojrE6rGUlMkzddgSRIddmLh19/Zxx9huSp3gI
X-Google-Smtp-Source: AGHT+IHNLtSIfLiMjPgdNbH73n29Rqo4mQsh/oBERN464FH6NwbPkAtXL24hv7Aec7RU+H+HqkGb1w==
X-Received: by 2002:a05:6a20:7495:b0:1a5:7308:3297 with SMTP id p21-20020a056a20749500b001a573083297mr1591044pzd.0.1711642896210;
        Thu, 28 Mar 2024 09:21:36 -0700 (PDT)
Received: from localhost ([2620:10d:c090:400::5:4d4e])
        by smtp.gmail.com with ESMTPSA id fd37-20020a056a002ea500b006eab6ac1f83sm1576815pfb.0.2024.03.28.09.21.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Mar 2024 09:21:35 -0700 (PDT)
Date: Thu, 28 Mar 2024 06:21:34 -1000
From: Tejun Heo <tj@kernel.org>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Allen Pais <apais@linux.microsoft.com>, linux-kernel@vger.kernel.org,
	keescook@chromium.org, vkoul@kernel.org, marcan@marcan.st,
	sven@svenpeter.dev, florian.fainelli@broadcom.com,
	rjui@broadcom.com, sbranden@broadcom.com, paul@crapouillou.net,
	Eugeniy.Paltsev@synopsys.com, manivannan.sadhasivam@linaro.org,
	vireshk@kernel.org, Frank.Li@nxp.com, leoyang.li@nxp.com,
	zw@zh-kernel.org, wangzhou1@hisilicon.com, haijie1@huawei.com,
	shawnguo@kernel.org, s.hauer@pengutronix.de, sean.wang@mediatek.com,
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
	afaerber@suse.de, logang@deltatee.com, daniel@zonque.org,
	haojian.zhuang@gmail.com, robert.jarzmik@free.fr,
	andersson@kernel.org, konrad.dybcio@linaro.org, orsonzhai@gmail.com,
	baolin.wang@linux.alibaba.com, zhang.lyra@gmail.com,
	patrice.chotard@foss.st.com, linus.walleij@linaro.org,
	wens@csie.org, jernej.skrabec@gmail.com, peter.ujfalusi@gmail.com,
	kys@microsoft.com, haiyangz@microsoft.com, wei.liu@kernel.org,
	decui@microsoft.com, jassisinghbrar@gmail.com, mchehab@kernel.org,
	maintainers@bluecherrydvr.com, aubin.constans@microchip.com,
	manuel.lauss@gmail.com, mirq-linux@rere.qmqm.pl,
	jh80.chung@samsung.com, oakad@yahoo.com,
	hayashi.kunihiko@socionext.com, mhiramat@kernel.org,
	brucechang@via.com.tw, HaraldWelte@viatech.com, pierre@ossman.eu,
	duncan.sands@free.fr, stern@rowland.harvard.edu, oneukum@suse.com,
	openipmi-developer@lists.sourceforge.net, dmaengine@vger.kernel.org,
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-rpi-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
	imx@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
	linux-mediatek@lists.infradead.org,
	linux-actions@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-tegra@vger.kernel.org, linux-hyperv@vger.kernel.org,
	linux-rdma@vger.kernel.org, linux-media@vger.kernel.org,
	linux-mmc@vger.kernel.org, linux-omap@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, linux-s390@vger.kernel.org,
	netdev@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH 9/9] mmc: Convert from tasklet to BH workqueue
Message-ID: <ZgWZDtNU4tCwqyeu@slm.duckdns.org>
References: <20240327160314.9982-1-apais@linux.microsoft.com>
 <20240327160314.9982-10-apais@linux.microsoft.com>
 <CAPDyKFpuKadPQv6+61C2pE4x4FE-DUC5W6WCCPu9Nb2DnDB56g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPDyKFpuKadPQv6+61C2pE4x4FE-DUC5W6WCCPu9Nb2DnDB56g@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240328_092137_830801_AD3E69B7 
X-CRM114-Status: GOOD (  10.13  )
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

Hello,

On Thu, Mar 28, 2024 at 01:53:25PM +0100, Ulf Hansson wrote:
> At this point we have suggested to drivers to switch to use threaded
> irq handlers (and regular work queues if needed too). That said,
> what's the benefit of using the BH work queue?

BH workqueues should behave about the same as tasklets which have more
limited interface and is subtly broken in an expensive-to-fix way (around
freeing in-flight work item), so the plan is to replace tasklets with BH
workqueues and remove tasklets from the kernel.

The [dis]advantages of BH workqueues over threaded IRQs or regular threaded
workqueues are the same as when you compare them to tasklets. No thread
switching overhead, so latencies will be a bit tighter. Wheteher that
actually matters really depends on the use case. Here, the biggest advantage
is that it's mostly interchangeable with tasklets and can thus be swapped
easily.

Thanks.

-- 
tejun

