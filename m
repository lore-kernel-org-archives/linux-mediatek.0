Return-Path: <SRS0=GSZf=4J=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EBDEC35666
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Feb 2020 22:12:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 411B9207FD
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Feb 2020 22:12:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YKl3Rijv";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="uLjEhdPG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 411B9207FD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IbAO7M3aKh/vIfxJCsl7O6nSI5kxixnglKvLB6BDLQY=; b=YKl3RijvgTO1+q
	ei/HZqFlUxwjKm/dIuy8x/LZIEUF+azd706xeeY97JQk2FD0O+eLPYBZaEXBu5ERbKs1WHbxo5uKu
	XT8mGjnlnmPNKHWOWjFwqukJnAogxXHlzS25gV6rMtFA6CVwjv+PaVbAVuCgOChMQsZXYtGD3IZCE
	3GHqcCFyGE1yTQsShHBmyNOflJblCgNhSS0ZEW9sP3ch4F3Ie6qH6QVCa9luGAKuApvcnFyM9zgQR
	Ge0j38XxpjajeYsKhgsaNLBwb3s4B+g5H4zaPSyI1IBzNTap57H7Q61VGo6rbBFaSAq9+gim9b5W+
	OoffokoVi+85YswPpH/Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j5GWh-0003Gb-QI; Fri, 21 Feb 2020 22:12:03 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j5GWY-00038S-71; Fri, 21 Feb 2020 22:11:56 +0000
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com
 [209.85.219.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 20A8D24676;
 Fri, 21 Feb 2020 22:11:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1582323113;
 bh=bf2RsaSvZhMI79nHgHionWDyrsV17B3qT+29dL6QM30=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=uLjEhdPGfBBs8J8kMdI9gKpPjMd/M6RazcBBvo02LI5gk5BBFs1us7fw56ebDGrNr
 hDqGewgjxff4DzdXTjm8dNTCjRJxHnGbNdbxaZF/ZCJqBbS4adXiRUSQWuVIIS7L26
 e7yPR4613FuK8IHfzY0sRp0MoZGPOYUofpaCd1UI=
Received: by mail-qv1-f47.google.com with SMTP id n8so1656530qvg.11;
 Fri, 21 Feb 2020 14:11:53 -0800 (PST)
X-Gm-Message-State: APjAAAXGhcUPfC+3xfS5Gia/oWbL3/jMf2cApNz19uxUD9y/p1j9acdV
 sT63qoDV+McdFe/H4ZVI5vwzIJJ+Y7mnK+uivg==
X-Google-Smtp-Source: APXvYqyYbXN85xYUMFaOgLv6Q5mUpNeZ8NyF/CcoNZ4CxdRu4RUYJEOgtcn8M4e8AKdcB5TiFQMt27ZRzzmiMvhInMw=
X-Received: by 2002:a0c:f68f:: with SMTP id p15mr31162876qvn.79.1582323112146; 
 Fri, 21 Feb 2020 14:11:52 -0800 (PST)
MIME-Version: 1.0
References: <20200221053802.70716-1-evanbenn@chromium.org>
 <20200221163717.v2.1.I02ebc5b8743b1a71e0e15f68ea77e506d4e6f840@changeid>
In-Reply-To: <20200221163717.v2.1.I02ebc5b8743b1a71e0e15f68ea77e506d4e6f840@changeid>
From: Rob Herring <robh+dt@kernel.org>
Date: Fri, 21 Feb 2020 16:11:40 -0600
X-Gmail-Original-Message-ID: <CAL_JsqL94vtBEmV2gNWx-D==sLiRXjxBBFZS8fw1cR6=KjS7XQ@mail.gmail.com>
Message-ID: <CAL_JsqL94vtBEmV2gNWx-D==sLiRXjxBBFZS8fw1cR6=KjS7XQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: watchdog: Add mt8173, smc-wdt watchdog
To: Evan Benn <evanbenn@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200221_141154_297469_1B2FBB69 
X-CRM114-Status: GOOD (  18.54  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 LINUX-WATCHDOG <linux-watchdog@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 LKML <linux-kernel@vger.kernel.org>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Julius Werner <jwerner@chromium.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 "David S. Miller" <davem@davemloft.net>, Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Feb 20, 2020 at 11:38 PM Evan Benn <evanbenn@chromium.org> wrote:
>
> This watchdog can be used on ARM systems with a Secure
> Monitor firmware to forward watchdog operations to
> firmware via a Secure Monitor Call.
>
> Signed-off-by: Evan Benn <evanbenn@chromium.org>
> ---
>
> Changes in v2:
> - Change name arm > mt8173
>
>  .../bindings/watchdog/mt8173,smc-wdt.yaml     | 30 +++++++++++++++++++
>  MAINTAINERS                                   |  6 ++++
>  2 files changed, 36 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/watchdog/mt8173,smc-wdt.yaml
>
> diff --git a/Documentation/devicetree/bindings/watchdog/mt8173,smc-wdt.yaml b/Documentation/devicetree/bindings/watchdog/mt8173,smc-wdt.yaml
> new file mode 100644
> index 0000000000000..ff45e13bc548b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/watchdog/mt8173,smc-wdt.yaml
> @@ -0,0 +1,30 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/watchdog/mt8173,smc-wdt.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: ARM Secure Monitor Call based watchdog
> +
> +allOf:
> +  - $ref: "watchdog.yaml#"
> +
> +maintainers:
> +  - Julius Werner <jwerner@chromium.org>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - mt8173,smc-wdt

compatible strings are in the form <vendor>,<device>. 'mt8173' is not a vendor.

> +
> +required:
> +  - compatible
> +
> +examples:
> +  - |
> +    watchdog {

This should be a child of some Mediatek firmware node. I assume
watchdog is not the *only* function.

> +      compatible = "mt8173,smc-wdt";
> +      timeout-sec = <15>;
> +    };
> +
> +...
> diff --git a/MAINTAINERS b/MAINTAINERS
> index e48ab79879ace..59e8779363c12 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1421,6 +1421,12 @@ S:       Maintained
>  F:     Documentation/devicetree/bindings/interrupt-controller/amazon,al-fic.txt
>  F:     drivers/irqchip/irq-al-fic.c
>
> +ARM SMC WATCHDOG DRIVER
> +M:     Julius Werner <jwerner@chromium.org>
> +R:     Evan Benn <evanbenn@chromium.org>
> +S:     Maintained
> +F:     devicetree/bindings/watchdog/mt8173,smc-wdt.yaml
> +
>  ARM SMMU DRIVERS
>  M:     Will Deacon <will@kernel.org>
>  R:     Robin Murphy <robin.murphy@arm.com>
> --
> 2.25.0.265.gbab2e86ba0-goog
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
