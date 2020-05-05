Return-Path: <SRS0=+Wu7=6T=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7930BC47254
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 May 2020 19:15:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 43A2C206B9
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 May 2020 19:15:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BiFHjOcJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 43A2C206B9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/45U37lId0glrpEUjquxmloK5x7DqrQovky/YAwGcuY=; b=BiFHjOcJCQ2Y8y
	4I6Wz4Q1O38Uov39XSwpudAUDyBdpS5SyINbLX3M3AzRRxOoOSV8VuK4a5y0EWorKgHq8NNLym2+j
	KG7CorlHIzc/3S3FDyXwrW3hRelkWSw0HlFGY7NrkZ9Rdcf0BOjN1oKAeGHv3qRl8zKPKkzaqgBRM
	wiBcVagWopXP/3t6HKEG7pykUqn/AgyIBG06nr7iFRCfuVQJKgzwqor2fOP3KuGH2PkQw6ecE3jIG
	IVJe7uDweTpYF6pCyKJTfLL7gkKnCgMPWXuJPXPzu1l6CjPL5+rTPvzv1iMseWWLoJI+FrnFH7wVZ
	VeyhaXM61/WoTbPCbl8g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jW32V-0003Ec-4z; Tue, 05 May 2020 19:15:35 +0000
Received: from mail-ot1-f51.google.com ([209.85.210.51])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jW32S-0003DQ-JF; Tue, 05 May 2020 19:15:33 +0000
Received: by mail-ot1-f51.google.com with SMTP id j26so8357ots.0;
 Tue, 05 May 2020 12:15:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=XoHZt1v+HXOCwO7SD36qP6zAfCtrd8CNqlmb++NU8YY=;
 b=U0lX3/sjcn9yPjbZtSzcjl/FgQDenpqS5K6lYEAP7KhslQdbaBNafiRb+6lwXXtCPI
 /dplWDhl0lA0UMFMxDO/YuCWaNTyeVl881Y6SukkiBeGo3m3eTXOSCt+FtHr+OGSyp3s
 rzE6bsbZRWq4OcnbhBFZsZGxfzOSVkx1gGAjdqRIOi/d8C44D/QBGz6+GgXhbUFovPaA
 Qtk9H5SJ3UQTDcvRXD43ilFozrH89kqRBv06UPup0wI7vdwrZkEFoCBe13KK+mgksQmE
 8FRAYXQRtWYNhehHmGncbWsqfcvyLoTFc4PF0uH3p4eDzg2+ywSZFUhUACq6HyO/YomA
 MovA==
X-Gm-Message-State: AGi0PuYYtWNG4I74Gzntkp0si/r/S1SEhDVIKrGE3rLMbOgvQSJGbJLo
 d74bv8+nxqgEpJaol/t2Pg==
X-Google-Smtp-Source: APiQypJ0OwtXiTN14pTnb4JSYnEKPWlE8p/Y3d5aQVPv5XX3SPxmyciZRldsnF55K55eHRzZK/W7Zw==
X-Received: by 2002:a05:6830:2158:: with SMTP id
 r24mr3829724otd.65.1588706131344; 
 Tue, 05 May 2020 12:15:31 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id j70sm785945oib.53.2020.05.05.12.15.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 May 2020 12:15:30 -0700 (PDT)
Received: (nullmailer pid 765 invoked by uid 1000);
 Tue, 05 May 2020 19:15:29 -0000
Date: Tue, 5 May 2020 14:15:29 -0500
From: Rob Herring <robh@kernel.org>
To: Dongchun Zhu <dongchun.zhu@mediatek.com>
Subject: Re: [V5, 1/2] media: dt-bindings: media: i2c: Document DW9768 bindings
Message-ID: <20200505191529.GA701@bogus>
References: <20200502161727.30463-1-dongchun.zhu@mediatek.com>
 <20200502161727.30463-2-dongchun.zhu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200502161727.30463-2-dongchun.zhu@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200505_121532_632172_20DEC6C3 
X-CRM114-Status: UNSURE (   7.52  )
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
Cc: mark.rutland@arm.com, drinkcat@chromium.org,
 andriy.shevchenko@linux.intel.com, srv_heupstream@mediatek.com,
 devicetree@vger.kernel.org, linus.walleij@linaro.org,
 shengnan.wang@mediatek.com, linux-media@vger.kernel.org, tfiga@chromium.org,
 bgolaszewski@baylibre.com, sj.huang@mediatek.com, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, dongchun.zhu@mediatek.com,
 sakari.ailus@linux.intel.com, matthias.bgg@gmail.com, bingbu.cao@intel.com,
 mchehab@kernel.org, louis.kuo@mediatek.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sun, 3 May 2020 00:17:26 +0800, Dongchun Zhu wrote:
> Add DeviceTree binding documentation for Dongwoon Anatech DW9768 voice
> coil actuator.
> 
> Signed-off-by: Dongchun Zhu <dongchun.zhu@mediatek.com>
> ---
>  .../bindings/media/i2c/dongwoon,dw9768.yaml        | 60 ++++++++++++++++++++++
>  MAINTAINERS                                        |  7 +++
>  2 files changed, 67 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/dongwoon,dw9768.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
