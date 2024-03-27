Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36B4FC54E67
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Mar 2024 20:48:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aojaArSnA0JfedDto4elyer8YODIKcUTNNFpLzMMgW8=; b=RSqg1pF8Geyek0YJBvdWPi6mx8
	BTIPY4RgM4dB6IeVKrEohKEVlpVDCSh1Lw7WXpX8X8Ow4Sg/Tu19CKUtBp8J3+9KUUIUqo2I3rcR/
	jsxndHbwke94qcfYKQ11kG0cbPzyQt3uU6vs65QgW84/havwC6zJINIHGER68Z53w5Yj0xLbbAqlZ
	Eq33DftWczhI4fhR5Bf8yIWj5U25v0Ck0uyqB+DfPRTbHetuH3vhYxs/Yq8wPz6C28EuGnGDQ4qlZ
	a7FUIEWtzOkANC0mj6r33tyM4Fmi6ngpnh9cL/znSF4q548+zLIIIgDX2mNgrhm4TkIGhdHeRndJm
	TmcNMEsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpaCA-0000000B5vN-249u;
	Wed, 27 Mar 2024 20:48:26 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpZ46-0000000ApAP-2NYP;
	Wed, 27 Mar 2024 19:36:04 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-565c6cf4819so2131091a12.1;
        Wed, 27 Mar 2024 12:36:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711568159; x=1712172959; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aojaArSnA0JfedDto4elyer8YODIKcUTNNFpLzMMgW8=;
        b=gj7h8bxL5pkkDrDyiAZ/ODjEyfj9Hf6/cJiRpSgRPSVZ77mbwyFlkihVzpUBT/vS3w
         LucfohibIZAWHcQkUYEJ6gvGSPisbjLlQ06/wl3UK6cgS5u7FEncR8hzPSnLOKK9hqvs
         dSQyD88jPNYjncpxq8zqFW2ouO/NR/DDrpzxqYTJLw9qMH3ygSSsGKbcgotSsepeig8F
         jSb0c0c9eHcSotlbb17yvMQqex6BlGajZC257JPStgy29beMYt3ZUmupi0BNyQ1rUXuY
         bvheiuy/hIjV5Cw11KRiSQNX0QmYzg8kBdBlVNSe+K9XITrDP46nQtcEfpECPmieGsUk
         h2Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711568159; x=1712172959;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aojaArSnA0JfedDto4elyer8YODIKcUTNNFpLzMMgW8=;
        b=HpUtPDuY/Pya4FxCP5yApw1ov7ToS9B2c5AqYOKYzK5FZRGeUIOuiY2mu5zARy/Tm6
         Sc+0GBU9OAyTtqQtzncfcOEScDQ/QjjbnGWIPkELVmSEajUlIVew2Gt13rWdIIRlRYWd
         GFZRja9xD6GcNHLytobuJ4VGHWuyP2y3/rpVWgW6DHbod+nJFlxxQQ0Bmt3h2gUybPm4
         5jq/YQ3ysnhHyqf+PQCZuHner1bIKs7qLocyg3ii/gMF1DAw6f9QwEcuzO56su2lHDJg
         WWlJc4iA580ltKDto36Erq3qctJQVJWT+XHHVIRG6qvgKYALIhu7b+b0cXsZSnGzkrML
         sp8A==
X-Forwarded-Encrypted: i=1; AJvYcCWTPWhFuoMCnil+1VcktKwaLeQ9pvHp9cw8M4gtb9MfhnyFsNzrErakueGMS28Em+alQ9dAa0NZMqQI6fQdzDOsvBec92x7utIYaKPmErxbyI9GMupQ02WdNgw+wpJGmGEzrT27xtJknppTSB3J7TDXh7/mPuslpdnaT0S3vwUovyjm8BHYbb3ALBVl52tJFwHgmYjGUZ7Xuf6w28TEgX/by6/fwx3DoQRZDGMsB2BYPtUzi8iQbjRjjWXiQhLSkFStsxEpY8CjLe+5Li01w24/IhDT6zq14BvUMPGPJpqOI63M
X-Gm-Message-State: AOJu0YzhVber550BWlH+OMLHOp18Kqt9cPzFd0CBq2tpPHkQRSsncwyf
	sr9zgS/le4q37oZ1+HHZsWyP1UDisctoAa2h03ZgeOGto7WSRFSm
X-Google-Smtp-Source: AGHT+IHWYCsKCZfCKe9WJ0A8h2jBWKCzprPvh9Stt4hH84aJN1DmeskwZihR1IueuTRTWs9wYxpP6Q==
X-Received: by 2002:a17:906:119a:b0:a47:3766:cfec with SMTP id n26-20020a170906119a00b00a473766cfecmr235001eja.9.1711568159337;
        Wed, 27 Mar 2024 12:35:59 -0700 (PDT)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id j24-20020a17090643d800b00a4672fb2a03sm5858783ejn.10.2024.03.27.12.35.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 12:35:58 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: linux-kernel@vger.kernel.org, Allen Pais <apais@linux.microsoft.com>
Cc: tj@kernel.org, keescook@chromium.org, vkoul@kernel.org, marcan@marcan.st,
 sven@svenpeter.dev, florian.fainelli@broadcom.com, rjui@broadcom.com,
 sbranden@broadcom.com, paul@crapouillou.net, Eugeniy.Paltsev@synopsys.com,
 manivannan.sadhasivam@linaro.org, vireshk@kernel.org, Frank.Li@nxp.com,
 leoyang.li@nxp.com, zw@zh-kernel.org, wangzhou1@hisilicon.com,
 haijie1@huawei.com, shawnguo@kernel.org, s.hauer@pengutronix.de,
 sean.wang@mediatek.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, afaerber@suse.de,
 logang@deltatee.com, daniel@zonque.org, haojian.zhuang@gmail.com,
 robert.jarzmik@free.fr, andersson@kernel.org, konrad.dybcio@linaro.org,
 orsonzhai@gmail.com, baolin.wang@linux.alibaba.com, zhang.lyra@gmail.com,
 patrice.chotard@foss.st.com, linus.walleij@linaro.org, wens@csie.org,
 peter.ujfalusi@gmail.com, kys@microsoft.com, haiyangz@microsoft.com,
 wei.liu@kernel.org, decui@microsoft.com, jassisinghbrar@gmail.com,
 mchehab@kernel.org, maintainers@bluecherrydvr.com,
 aubin.constans@microchip.com, ulf.hansson@linaro.org, manuel.lauss@gmail.com,
 mirq-linux@rere.qmqm.pl, jh80.chung@samsung.com, oakad@yahoo.com,
 hayashi.kunihiko@socionext.com, mhiramat@kernel.org, brucechang@via.com.tw,
 HaraldWelte@viatech.com, pierre@ossman.eu, duncan.sands@free.fr,
 stern@rowland.harvard.edu, oneukum@suse.com,
 openipmi-developer@lists.sourceforge.net, dmaengine@vger.kernel.org,
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
 imx@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
 linux-mediatek@lists.infradead.org, linux-actions@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
 linux-hyperv@vger.kernel.org, linux-rdma@vger.kernel.org,
 linux-media@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-s390@vger.kernel.org, netdev@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH 9/9] mmc: Convert from tasklet to BH workqueue
Date: Wed, 27 Mar 2024 20:35:54 +0100
Message-ID: <9252961.CDJkKcVGEf@jernej-laptop>
In-Reply-To: <20240327160314.9982-10-apais@linux.microsoft.com>
References: <20240327160314.9982-1-apais@linux.microsoft.com>
 <20240327160314.9982-10-apais@linux.microsoft.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240327_123602_709758_D19B05C8 
X-CRM114-Status: UNSURE (   8.10  )
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

Dne sreda, 27. marec 2024 ob 17:03:14 CET je Allen Pais napisal(a):
> The only generic interface to execute asynchronously in the BH context is
> tasklet; however, it's marked deprecated and has some design flaws. To
> replace tasklets, BH workqueue support was recently added. A BH workqueue
> behaves similarly to regular workqueues except that the queued work items
> are executed in the BH context.
> 
> This patch converts drivers/infiniband/* from tasklet to BH workqueue.

infiniband -> mmc

Best regards,
Jernej

> 
> Based on the work done by Tejun Heo <tj@kernel.org>
> Branch: https://git.kernel.org/pub/scm/linux/kernel/git/tj/wq.git for-6.10
> 
> Signed-off-by: Allen Pais <allen.lkml@gmail.com>




