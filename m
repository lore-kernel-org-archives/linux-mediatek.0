Return-Path: <SRS0=bV6b=D6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 413C2C55178
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Oct 2020 08:36:01 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C08F621527
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Oct 2020 08:36:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="i5ZM3qQj";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="h4icBj/T"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C08F621527
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=rbaaHBFoXTQ7rv6UHX/o758EeJpKeAqgKqZYn4Frtug=; b=i5ZM3qQjf3iYWaOMFIkOOHDpX
	h8YW0sAoAlXTq3e72VBUPGfJ0TIi1ZPR420+bNFVhoYv8neNJDpEqlksboVcQEvqCgUj8YxoO6dN+
	mJsbQPNQKnqXeU0rw3SZdchAUsN0RQ8oArGaOoO+ELx5JkzaSEUgWMUE31Pl7FIbLFNi7N62Qbgbh
	fk3WBxoTnOP/HpbhJ0Ii8jIgEoGW+9rUUQOsVqz/uv0GbzTukaXs3iOLEKWFQ4opYPSYJAG8lAEHU
	R9kw4qqltaH53PnSwUUISAgeES69hygXvDWq9N7qnsoYf0jMqucuqf205EcVFbxQ2XD47xU4BTKnq
	/wSfioc1g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kVsY7-00021S-55; Fri, 23 Oct 2020 08:35:47 +0000
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kVsY4-0001zA-3J
 for linux-mediatek@lists.infradead.org; Fri, 23 Oct 2020 08:35:45 +0000
Received: by mail-pf1-x441.google.com with SMTP id e15so612189pfh.6
 for <linux-mediatek@lists.infradead.org>; Fri, 23 Oct 2020 01:35:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=f+1AbkQy0A87BtmUgjwi9U43PkE6jzonKJ0Vu1is7Vo=;
 b=h4icBj/TmDHkcs+rhSs8XB2RNfjMBq5yYqyS0YSnDGSwFXPCqoDP/lxPP8V+vXHR8r
 oRQI1RxYVegeWAVl0m0H7iKa99OsNGct9JAcqom9WRHZ6ul4RvUUnui+KvrWXnWS/pHN
 /Kk2lGLpT63GC0MunDRXmZVti00Fi73wxul5FY/lrR1bqB46daudyNUZbVACVIszm9ic
 cG0wKRKoIEMLtDl/MX4kFyJqIdwWsUmLtsYy7B+8ROEp8UImTx/y5NkFgdGWkoZt1nwB
 4WosCkRK9/JTL638s0CA4Vs6eONP0Ynr4um/xvHySi6roD8V01T+/rXTJXOyNiRgEVSs
 eF0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=f+1AbkQy0A87BtmUgjwi9U43PkE6jzonKJ0Vu1is7Vo=;
 b=CEt9iIOnVRCa5wtLD8PDg5rsclB4bEhr4HJLmveukg1wwtn51uigDZw5prQA0ofSGg
 zt89M8FCfNW5FmRxrniJ3/itqzLLhZrOmF41NJenPLCvoa+Im/ACs9an12zlcNTdjQW/
 Za2K1gzNSUxV5jWY94g38kOfjebomwR1Emg2N4eksaHjFPJrhkO386LPWKH8YUM3fBkd
 HTpLd099FNvgD/IrS9u2PtXnOgzBIvENZmt5OMob9/ljUHIRkJjgjp5tZppJ7xgkX1n1
 1XGt/5RCkmlLkEacF7RgRet8mKAXjX9zOrnhZylQhq7Bj5XKsOjD1iZx7Ega92PwRc1w
 cwnQ==
X-Gm-Message-State: AOAM532fQx+Id4gl1/H1AydgNqMrSLiSDqw7hBAHj2D5A9YWKCajyjmD
 40n3pO+CH11m5UVlu+FEoy5Lh+8cncyouA==
X-Google-Smtp-Source: ABdhPJxCa+aIUzR7XJtvhWGZdJtyvpTOifCyidYzBuGnz3Csh06sevyXOFdA7OARjrkuXKzbqORTaQ==
X-Received: by 2002:a65:6243:: with SMTP id q3mr1227075pgv.154.1603442141794; 
 Fri, 23 Oct 2020 01:35:41 -0700 (PDT)
Received: from localhost ([122.181.54.133])
 by smtp.gmail.com with ESMTPSA id w19sm1267173pff.6.2020.10.23.01.35.40
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 23 Oct 2020 01:35:40 -0700 (PDT)
Date: Fri, 23 Oct 2020 14:05:38 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Hector Yuan <hector.yuan@mediatek.com>
Subject: Re: [PATCH v1 3/6] dt-bindings: cpufreq: add bindings for MediaTek
 cpufreq HW
Message-ID: <20201023083538.f6hhcyizvlf2ufjr@vireshk-i7>
References: <1603441493-18554-1-git-send-email-hector.yuan@mediatek.com>
 <1603441493-18554-4-git-send-email-hector.yuan@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1603441493-18554-4-git-send-email-hector.yuan@mediatek.com>
User-Agent: NeoMutt/20180716-391-311a52
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201023_043544_231875_F0B997F1 
X-CRM114-Status: GOOD (  19.05  )
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
Cc: devicetree@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>,
 Florian Fainelli <f.fainelli@gmail.com>, wsd_upstream@mediatek.com,
 linux-pm@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
 Dave Gerlach <d-gerlach@ti.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Amit Kucheria <amit.kucheria@linaro.org>,
 Santosh Shilimkar <ssantosh@kernel.org>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Robin Murphy <robin.murphy@arm.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 23-10-20, 16:24, Hector Yuan wrote:
> From: "Hector.Yuan" <hector.yuan@mediatek.com>
> 
> Add devicetree bindings for MediaTek HW driver.
> 
> Signed-off-by: Hector.Yuan <hector.yuan@mediatek.com>
> ---
>  .../bindings/cpufreq/cpufreq-mediatek-hw.yaml      |   46 ++++++++++++++++++++
>  1 file changed, 46 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/cpufreq/cpufreq-mediatek-hw.yaml
> 
> diff --git a/Documentation/devicetree/bindings/cpufreq/cpufreq-mediatek-hw.yaml b/Documentation/devicetree/bindings/cpufreq/cpufreq-mediatek-hw.yaml
> new file mode 100644
> index 0000000..a99f44f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/cpufreq/cpufreq-mediatek-hw.yaml
> @@ -0,0 +1,46 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/cpufreq/cpufreq-mediatek-hw.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek's CPUFREQ Bindings
> +
> +maintainers:
> +  - Hector Yuan <hector.yuan@mediatek.com>
> +
> +description:
> +  CPUFREQ HW is a hardware engine used by MediaTek
> +  SoCs to manage frequency in hardware. It is capable of controlling frequency
> +  for multiple clusters.
> +
> +properties:
> +  compatible:
> +    const: mediatek,cpufreq-hw
> +
> +  reg:
> +    minItems: 1
> +    maxItems: 2
> +    description: |
> +      Addresses and sizes for the memory of the HW bases in each frequency domain.
> +
> +required:
> +  - compatible
> +  - reg
> +
> +examples:
> +  - |
> +    soc {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        cpufreq_hw: cpufreq@11bc00 {
> +            compatible = "mediatek,cpufreq-hw";
> +            reg = <0 0x11bc10 0 0x8c>,
> +               <0 0x11bca0 0 0x8c>;
> +        };
> +    };

You still need to keep the CPU specific part here and explain how this
block is going to get used using the other binding you added.

-- 
viresh

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
