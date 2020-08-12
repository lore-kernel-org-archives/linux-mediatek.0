Return-Path: <SRS0=Jt7l=BW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB4F6C433E0
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Aug 2020 16:26:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9AB8B2076B
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Aug 2020 16:26:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oITB9dBG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9AB8B2076B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=9VGWp8Z38bSbJuIGS7y102et/80PODBu2sXUK5418vc=; b=oITB9dBGDF2fGQx6LFf+N4ZkJ
	jjg+KBfxu4YiQAqpV6FH+lhwh7picqCrkqs33xm1QoehzgRtloWBBWVsa5JbFWgwsrM6cmhN4L4aU
	TeQP5S7JL5AcLcbjsqYNX085fMiLjTFSshOOJvGNEWhDjHCWWsUitJdN+A7doxTXfXhhGYp8uLsHj
	wRiLKwEf7BreXDl/oEBbzSLfljvvayKSDK9mJB8o5vPmJDZXAV6tU5s0nTswXHBjvtvJsZtFx6OUz
	mYnYebSq3fcoboUF81ltxOtpohqS5ON6hxSTOOAtmt9KkuURamc4yj+4IHZ1MTWbno+Eo49dNVBsZ
	XoOciSyjg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k5tZv-0007qG-Pw; Wed, 12 Aug 2020 16:26:15 +0000
Received: from mail-il1-f193.google.com ([209.85.166.193])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k5tZq-0007pK-Fn; Wed, 12 Aug 2020 16:26:11 +0000
Received: by mail-il1-f193.google.com with SMTP id x1so2306402ilp.7;
 Wed, 12 Aug 2020 09:26:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=xT4SACgf5ifSMoS9uK+2nXefsvRA+9v+8cofR3WoWzc=;
 b=CSj+XqLsistLMahTzYAumgVlKJ4gjywspeXj/xtt1JnQtikZi52vQcsG1Qdo3Zcpec
 XKSIzM3r1Sq+/A5if7W69Mua40f4rwCT49uQ6WOtOzjkDUemDLZt4IDsrCYWxoPTghTF
 Ac4d3tXnJ9AGa8w2IJ/3zQibYNbmMOOtHyW704+0AE6sMuG9DYpar9JvU+P8JOU8MJqB
 oawwrdqNSXq2tjR0SPH/3jwhRuDuqz/4HI/nVX9RUSdDtokggromajis8vx/pqGDQuTC
 nODSxmX7kP6YGPmlGeWvMPfniYXPeZaZErJY2V1meuFqRvqYsYLnXKh8dv8gzD+SqcfQ
 QKaQ==
X-Gm-Message-State: AOAM533SYpzwnxw8p6C5h4a1m3VnOQzBD2mbJ4iNVKU567rO7S5Bi47B
 9Lhk9SQven0xBrUUcYW7gA==
X-Google-Smtp-Source: ABdhPJxhvNiEn01QPTStOSaoRMJBQMRWM+MEiL+Bc4h8Pvco/4kQQxQ01omTeuR5kwXN7ubmYfG9+w==
X-Received: by 2002:a92:5b1c:: with SMTP id p28mr452119ilb.133.1597249567760; 
 Wed, 12 Aug 2020 09:26:07 -0700 (PDT)
Received: from xps15 ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id k18sm1185733ioh.50.2020.08.12.09.26.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Aug 2020 09:26:06 -0700 (PDT)
Received: (nullmailer pid 2319809 invoked by uid 1000);
 Wed, 12 Aug 2020 16:26:04 -0000
Date: Wed, 12 Aug 2020 10:26:04 -0600
From: Rob Herring <robh@kernel.org>
To: Hector Yuan <hector.yuan@mediatek.com>
Subject: Re: [PATCH v1 2/2] dt-bindings: cpufreq: add  MediaTek cpufreq
 bindings
Message-ID: <20200812162604.GA2319433@bogus>
References: <1596716320-19811-1-git-send-email-hector.yuan@mediatek.com>
 <1596716320-19811-3-git-send-email-hector.yuan@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1596716320-19811-3-git-send-email-hector.yuan@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200812_122610_560395_632F4768 
X-CRM114-Status: GOOD (  12.12  )
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
Cc: Will Deacon <will@kernel.org>, wsd_upstream@mediatek.com,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Anson Huang <Anson.Huang@nxp.com>, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, Arnd Bergmann <arnd@arndb.de>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Olof Johansson <olof@lixom.net>,
 Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Viresh Kumar <viresh.kumar@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Li Yang <leoyang.li@nxp.com>,
 Shawn Guo <shawnguo@kernel.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 06 Aug 2020 20:18:40 +0800, Hector Yuan wrote:
> From: "Hector.Yuan" <hector.yuan@mediatek.com>
> 
> Add devicetree bindings for MediaTek HW driver.
> 
> Signed-off-by: Hector.Yuan <hector.yuan@mediatek.com>
> ---
>  .../bindings/cpufreq/cpufreq-mediatek-hw.yaml      |   56 ++++++++++++++++++++
>  1 file changed, 56 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/cpufreq/cpufreq-mediatek-hw.yaml
> 


My bot found errors running 'make dt_binding_check' on your patch:

/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/cpufreq/cpufreq-mediatek-hw.example.dt.yaml: example-0: cpufreq@11bc00:reg:0: [0, 1162256, 0, 140] is too long
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/cpufreq/cpufreq-mediatek-hw.example.dt.yaml: example-0: cpufreq@11bc00:reg:1: [0, 1162400, 0, 140] is too long


See https://patchwork.ozlabs.org/patch/1341854

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure dt-schema is up to date:

pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade

Please check and re-submit.


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
