Return-Path: <SRS0=iI7F=FL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A86EC4361B
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Dec 2020 22:59:33 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F286B239EC
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Dec 2020 22:59:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F286B239EC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=3TFitJc3DaqiqxY1M1pq2rIG7tFGz3Kp9/jffEjb8YM=; b=V06/VyKUDUQexnr3iNBlc9Sco
	MHXYv+FLNjzm+fmXSey5XVu+OiMzB43ITxbB/suDpvRrvUXduWqlpIfBm+suTKk3gfaZYuHDOLTc8
	X5/XKSDToXh5Kvdb2YW2q9Tpr49ZPyFkHwJQ8czx/yAwIlrt+dvGepQojY/pbURhNIdKU+cVAXL9c
	fEz8Ba8w6eHYu6Nn9eN6GXOzjl0xW3UNWod9WM9Sx7P7TFZRjZsRZI14bhd/6GGANNItJgQnr+Exv
	uI0S1B6rJsLUEUTM1ndLomX9uOt+N1xuE7YJ3Sr+zok3NALOxfMIbkMtTE8PLBAaQ0yBk6bimLrs3
	LGQ/gzaKQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmPTZ-0007wh-RA; Mon, 07 Dec 2020 22:59:25 +0000
Received: from mail-ot1-f67.google.com ([209.85.210.67])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmPTR-0007sn-01; Mon, 07 Dec 2020 22:59:17 +0000
Received: by mail-ot1-f67.google.com with SMTP id o11so11486008ote.4;
 Mon, 07 Dec 2020 14:59:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=u68n1Z29DrDl0c987oxwFjaFo/JQpyXuVglTLEmfnmg=;
 b=SNAXzKggz+5c9jngPbegB0KQSL9aOC9iNWXYmg21OyylkRhbL/3BQqMRBM0jFT2yv2
 f6meYAQONzN02Z9IgaMblNZhUX8KOYAE5jdU8R8EHVRTL2wXzDKV2Sw3TE/dAipb/5Ex
 oZ7nOjCu0rt3nuF/Fuw+WfcRGBsB8/AqR6VCZyGR8ngHKa3oNIsVVnGcTeV6vmvMIMIM
 FG2owVF131Oy7dzSEI1Ih+kS7H1csaFnLJBedeG2vZyH2gqKCaNtQiiQubD444dRSWvS
 4NHur5orWMCyhIDcd5I8HjLIy3RK+x37t0j39j2wrLv6thFhP+kl4H4AYMQcNEatD0Pq
 LPwQ==
X-Gm-Message-State: AOAM53349IlkRfzMKbPoj9vDAXCW7dBsbfiz1ZfKFo2LHscqaB5MWQSz
 5kZelZ2yPvxq8bKHRnsQbw==
X-Google-Smtp-Source: ABdhPJwDAeS253Mx7NZTvA7Pkqt6sBA6Dd0tVqoo4dexxHY+vYPatp++kT/Lug4cBC3Ga6TGdIuEhw==
X-Received: by 2002:a9d:6a99:: with SMTP id l25mr5302128otq.178.1607381956549; 
 Mon, 07 Dec 2020 14:59:16 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id x72sm3283950oia.16.2020.12.07.14.59.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Dec 2020 14:59:15 -0800 (PST)
Received: (nullmailer pid 1005036 invoked by uid 1000);
 Mon, 07 Dec 2020 22:59:14 -0000
Date: Mon, 7 Dec 2020 16:59:14 -0600
From: Rob Herring <robh@kernel.org>
To: Zhen Lei <thunder.leizhen@huawei.com>
Subject: Re: [PATCH 3/5] dt-bindings: soc: add the required property
 'additionalProperties'
Message-ID: <20201207225914.GA1004985@robh.at.kernel.org>
References: <20201204093813.1275-1-thunder.leizhen@huawei.com>
 <20201204093813.1275-4-thunder.leizhen@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201204093813.1275-4-thunder.leizhen@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201207_175917_078725_D94369DB 
X-CRM114-Status: GOOD (  12.43  )
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
 Philipp Zabel <p.zabel@pengutronix.de>,
 Mateusz Holenko <mholenko@antmicro.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek <linux-mediatek@lists.infradead.org>,
 Karol Gugala <kgugala@antmicro.com>,
 Pawel Czarnecki <pczarnecki@internships.antmicro.com>,
 linux-serial <linux-serial@vger.kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Stafford Horne <shorne@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Lee Jones <lee.jones@linaro.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 linux-media <linux-media@vger.kernel.org>
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

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
