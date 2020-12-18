Return-Path: <SRS0=+cmX=FW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A459CC4361B
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Dec 2020 21:17:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3F99C23B88
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Dec 2020 21:17:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3F99C23B88
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Wxrgz7PSlA4HRXcyWhuuBNQVEvVTOKlllaUQromvVxM=; b=uRzMUzfEV5fBmRrulrYnWYnLa
	yVqfBNV4AAT0Usv0gZmhZ1OMIFXO25u4zUmlzrYH/Q1NvLxen+lfXz8ehqjp1PBOxbhrwIVsA8ZtG
	ZxDym+ZN43bdGlsoxESUDb/pwciqU2CTq8XbQKrdwWmfzriAoyuMmO6KUl+iKmTbf2k+Fp2FUjarK
	phPem6KI9yOUvq44Os2lnKhmYP6FDlBlM38WM9ET/I54Tl18JqnNpg6yIOpPzs33mLSQV1HurYf6t
	n//hDSu66nUffB6qa9juVwvkzT2WtP9ZYlsM4oh55bxyWPQQAN5h2Hx4ofqU7zlNU5y7W4laZUZUs
	AWCuBmhbA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kqN7v-0005Wb-FP; Fri, 18 Dec 2020 21:17:27 +0000
Received: from mail-oi1-f172.google.com ([209.85.167.172])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kqN7s-0005VR-Sz; Fri, 18 Dec 2020 21:17:25 +0000
Received: by mail-oi1-f172.google.com with SMTP id s2so4360484oij.2;
 Fri, 18 Dec 2020 13:17:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=l8NpM/ZXx3KvTES0GcT3wzVOs1+8KOFnRlCaHv0vQqg=;
 b=ULLjat5kIiGI7/PkqDapQU4hqi10dCO6oE6IdaOblfuvz2EjiZskbDsRm2MMMsz4Jk
 2asFELpMsK+W5hQsuN78Uj1BJqgA07J/vDlr/vuBTSxGpS9sJxE/r1pTPiCKkt+pyBWZ
 mTzChprs9m9QLQ0FHAqE0YHj8ElD7ewGZIug5IB82ZzWzvwOJY7nFBxQToKKyuY+HOVv
 9DghIErIvKNqnqNk8B28FSMYb9uKKvG3AXd9rNsFP8cOaL3e1VqnGe1XcTcgN+YrlUKQ
 lb/Sbek497vWZJ3OQWNFerViHAnNItbsqFbW+plIpiBf+oxVsAqXyTvFWR5I7mGbpMBe
 +1fQ==
X-Gm-Message-State: AOAM5337NTWFRG3LiHtQNjtlWIklMNJN5SqLEGXbdwjRqPfXgMyljJmT
 ySVPWKsALDlACByoOU18kA==
X-Google-Smtp-Source: ABdhPJzL2Cdk+fsnQO8ZXvFKbLhNOKv4lZI3fZ66X1EcYf/ouISSzRrfIxqRxLPlSTmS8yZ3GB1RBA==
X-Received: by 2002:aca:3c57:: with SMTP id j84mr4146262oia.41.1608326243527; 
 Fri, 18 Dec 2020 13:17:23 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id p132sm917646oia.41.2020.12.18.13.17.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Dec 2020 13:17:22 -0800 (PST)
Received: (nullmailer pid 2190902 invoked by uid 1000);
 Fri, 18 Dec 2020 21:17:21 -0000
Date: Fri, 18 Dec 2020 15:17:21 -0600
From: Rob Herring <robh@kernel.org>
To: Zhen Lei <thunder.leizhen@huawei.com>
Subject: Re: [PATCH 4/5] dt-bindings: devapc: add the required property
 'additionalProperties'
Message-ID: <20201218211721.GA2190633@robh.at.kernel.org>
References: <20201204093813.1275-1-thunder.leizhen@huawei.com>
 <20201204093813.1275-5-thunder.leizhen@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201204093813.1275-5-thunder.leizhen@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201218_161725_001934_3D4972BB 
X-CRM114-Status: GOOD (  12.96  )
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
 linux-kernel <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek <linux-mediatek@lists.infradead.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Pawel Czarnecki <pczarnecki@internships.antmicro.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Stafford Horne <shorne@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Lee Jones <lee.jones@linaro.org>,
 Karol Gugala <kgugala@antmicro.com>, linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, 04 Dec 2020 17:38:12 +0800, Zhen Lei wrote:
> When I do dt_binding_check for any YAML file, below wanring is always
> reported:
> 
> xxx/soc/mediatek/devapc.yaml: 'additionalProperties' is a required property
> xxx/soc/mediatek/devapc.yaml: ignoring, error in schema:
> warning: no schema found in file: xxx/soc/mediatek/devapc.yaml
> 
> Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
> ---
>  Documentation/devicetree/bindings/soc/mediatek/devapc.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Applied, thanks!

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
