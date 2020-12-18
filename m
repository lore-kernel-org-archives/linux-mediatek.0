Return-Path: <SRS0=+cmX=FW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 569BBC4361B
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Dec 2020 21:17:24 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EB98523B88
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Dec 2020 21:17:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EB98523B88
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=90i1lTLTR0OALE7IXKotL8PIYtsMumqUSyK3KXWQD1M=; b=B/UteV2G9oz/EoR+ocEbT/7ou
	AX4NMUDBerIXduPrhk9aG4JrwTovCrIIvXHDJdj4NJXqhdqC10HGltgR06uG/B+v1MWH5zHtgHjJC
	76vDZMU+H/ViT2c6ZLXNdb6WXNT7cbEf8euCfOLPWYvcgQEo41fILzXCXlj9SVug7FV58CkyHNTwk
	tYZ+RtQto1E2CJHLh13ivRJ2irPmZvTeCK7WpsUoCRri+ys35lfFhmnBdZniCDkeFiE6hL4UXDJ9O
	KZ3CLAY/wlW5c4Q9ENtAkFieE6bOa6OCzthTDiBRjYRJiI+ATCvNkh6M3YCSI/axvOY8schcF9OhH
	JE6GyyjDQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kqN7i-0005Tj-B7; Fri, 18 Dec 2020 21:17:14 +0000
Received: from mail-oo1-f53.google.com ([209.85.161.53])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kqN7d-0005SD-U8; Fri, 18 Dec 2020 21:17:11 +0000
Received: by mail-oo1-f53.google.com with SMTP id p72so889861oop.4;
 Fri, 18 Dec 2020 13:17:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=jEbr5s4D+ZYMzO40gLC2UnGAo9wF8hMz62vqs5D6Is0=;
 b=Ww21KrhFmFSEwCPDk9TK3vxj4I9pmkLWsbXFIUj5VqAeqxzWylIZTUT5OSTLC8XUF3
 ZGFrgaCHtljThu8EvLbc9/Q5y5QJIKvcI4XfBOOMv2Y28CRCJy/jhPPwLN88Dq1ouSpU
 +SpW0kWLLIBaQmoJcGCGi6HeLnkuGn7I2cc+anoyaajnDrHW56Luk/7lmeu8QKQuAIDi
 Bee3LiCksM/93I9FEkwkffhWhp8KE4vxFYk8TMkSGSXIrvBgI3yrdl8SWQq0VsJnpfmA
 TfyC23ThNa7nkZVTJtDu6mK+Ka+SE1NIStY6I9k1u2B5gBxFad8gESYMnnLq6ImJJG2a
 tpEA==
X-Gm-Message-State: AOAM532IO77yWG8NuzRoK+KOH0JrocAfSKYWG9U4O5ybx2ewOz70ihRv
 DFT8vWo1hsHBNxAMIN/iHw==
X-Google-Smtp-Source: ABdhPJz1hrSQ11VEvWW1bcr9TnHL55sCBxx5SwUaddzYOjGxqP6qsmV4Le1WPCV8esAZOjxClkh9Gg==
X-Received: by 2002:a4a:4f0f:: with SMTP id c15mr4258954oob.75.1608326228529; 
 Fri, 18 Dec 2020 13:17:08 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id i1sm2197006otr.81.2020.12.18.13.17.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Dec 2020 13:17:07 -0800 (PST)
Received: (nullmailer pid 2190532 invoked by uid 1000);
 Fri, 18 Dec 2020 21:17:06 -0000
Date: Fri, 18 Dec 2020 15:17:06 -0600
From: Rob Herring <robh@kernel.org>
To: Zhen Lei <thunder.leizhen@huawei.com>
Subject: Re: [PATCH 3/5] dt-bindings: soc: add the required property
 'additionalProperties'
Message-ID: <20201218211706.GA2190351@robh.at.kernel.org>
References: <20201204093813.1275-1-thunder.leizhen@huawei.com>
 <20201204093813.1275-4-thunder.leizhen@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201204093813.1275-4-thunder.leizhen@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201218_161710_234384_486898CB 
X-CRM114-Status: GOOD (  12.66  )
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
Cc: devicetree <devicetree@vger.kernel.org>,
 linux-serial <linux-serial@vger.kernel.org>,
 Mateusz Holenko <mholenko@antmicro.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Pawel Czarnecki <pczarnecki@internships.antmicro.com>,
 Rob Herring <robh+dt@kernel.org>,
 linux-mediatek <linux-mediatek@lists.infradead.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, Stafford Horne <shorne@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Lee Jones <lee.jones@linaro.org>,
 Karol Gugala <kgugala@antmicro.com>, linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, 04 Dec 2020 17:38:11 +0800, Zhen Lei wrote:
> When I do dt_binding_check for any YAML file, below wanring is always
> reported:
> 
> xxx/soc/litex/litex,soc-controller.yaml: 'additionalProperties' is a required property
> xxx/soc/litex/litex,soc-controller.yaml: ignoring, error in schema:
> warning: no schema found in file: xxx/soc/litex/litex,soc-controller.yaml
> 
> Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
> ---
>  Documentation/devicetree/bindings/soc/litex/litex,soc-controller.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Applied, thanks!

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
