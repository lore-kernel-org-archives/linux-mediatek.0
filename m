Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21CD6C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Feb 2022 09:17:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MNKkxmY8a7ZKzvImY6P+Jr8ljL34SbLnSIDLM/qSOtE=; b=lwNbqgv+AUxhij
	AQ9ifccw6yuIE6ZLX17fejYxQDrSuxTbYcsFF6INqX7iRkbvBh7Y9vmd5d4uJ4fWK/SSASkoLagN6
	WGAt+DIp3YUhcwQctLBFj1P0gQmMmkgISPQXJIBtmBYOdzYlvTxrr2HAcMOnNOg2mz5zTJOtkvxZu
	RVozvUKdZge++Kg17S3PgumIL+K7tRTMVucyh9BzcssjkgCH5BmwFue0hFIr2mqEPyHLIK6xsH8KX
	K1QBBxC0q11HHfH7hqZDfTEmksztpKyWJJ0FzyvJNBJGQvODJy4cYcMwesoilccNmVv4O2e3R9OnG
	zbLZ0gZ97pE+q5Dr4GWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nFBlJ-00Ek6F-Kl; Wed, 02 Feb 2022 09:17:13 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nFBlF-00Ek3R-AP
 for linux-mediatek@lists.infradead.org; Wed, 02 Feb 2022 09:17:11 +0000
Received: by mail-ej1-x629.google.com with SMTP id j2so62550966ejk.6
 for <linux-mediatek@lists.infradead.org>; Wed, 02 Feb 2022 01:17:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=x9rntTeDhb6XRDh9/nW9Vd6mnOlOZBc9Iqn9gcca+t4=;
 b=BHT96a9j020XxUsQWDK20Qo2NUtO20lg55wm++jPoJnYThjUUezbh67CjJK7F0rhHM
 WMR0SlUFQ67HKnd5UAq3t8wQw0/IcfiDR64E3Bl3ek5iU+rwGtlsQZv4EhHS3HlLll70
 vz81NfQyhvIr/DEWlvNCdVHwVdrYwjwE9rJGuyve+JUZRxMWWVM4Ob6EneixpLbaAEL3
 mL8ezHkwZky0WbKNDvZRzGI3ZK6UaCQ70KIPB4ePlH3jMJWTS1GZycbEkrbm1j6fw1Um
 8sXv5bQxeCXb57VdMFBZNPF2Oeyyi4RN6dtQaE8SAPEe1FFoplZ5LDWHWcIAME4ULSu0
 Kj/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=x9rntTeDhb6XRDh9/nW9Vd6mnOlOZBc9Iqn9gcca+t4=;
 b=biFQeKEjLe+rH1MYhXhyi3ieNojMnz2KKqz8pfBghykd6DPc6ocRtioY33Cc50XUVz
 jDRXehGxmHAx5hjszjwvNi19b8yrzqTvkoeykBHepwalvtR4Qa/e0UqvBiVXG2EPlF7k
 wLCEvCk05HCAJHx6LUdWErO6Vd6PXyV+zZHPOrqJHBfC0u+PSV4IVbjOAAz+Cl6ovDxc
 S9cIWYk5yxrxWDaQr+We/uVc463kKfZ0EOytcm+VSOfnEBUa974r23GWaTapO7eEwDN3
 3G1/BPKp7n5tV+rIfA3AZ5yuuvcliNstXEejgJ45rEWUfkU6B6xwC7VwOGtq+ZKe7kX4
 3gNQ==
X-Gm-Message-State: AOAM5339YpqV5Tahny0hnWE7xctwWnWG4Tbz7cFxeze/TKYfVy/jRsEc
 MhXG9frFF710/qgGQbaRfnUw8Bz3PPI+pWrLuUlRFA==
X-Google-Smtp-Source: ABdhPJxO+YT7KVoH0Asl2I194MEaiGQV+55OzPqr2jrXyPvrkGNsigRcmzQHLC5k4+p9ZlceBbVedREV04aU+lGUj4w=
X-Received: by 2002:a17:907:6e1f:: with SMTP id
 sd31mr24802407ejc.286.1643793425982; 
 Wed, 02 Feb 2022 01:17:05 -0800 (PST)
MIME-Version: 1.0
References: <20220130145116.88406-1-nbd@nbd.name>
 <20220130145116.88406-12-nbd@nbd.name>
In-Reply-To: <20220130145116.88406-12-nbd@nbd.name>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 2 Feb 2022 10:16:55 +0100
Message-ID: <CAMRc=McAvYmjvCU8-OA3Yb+YuXF7KaGC6E3RnFMN7eSUXiUz+Q@mail.gmail.com>
Subject: Re: [PATCH v9 11/13] dt-bindings: arm: airoha: Add binding for Airoha
 GPIO controller
To: Felix Fietkau <nbd@nbd.name>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 John Crispin <john@phrozen.org>, soc@kernel.org, 
 "moderated list:ARM/Mediatek SoC..." <linux-mediatek@lists.infradead.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, Rob Herring <robh@kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 devicetree <devicetree@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220202_011709_412931_D5D24FED 
X-CRM114-Status: GOOD (  18.17  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sun, Jan 30, 2022 at 3:54 PM Felix Fietkau <nbd@nbd.name> wrote:
>
> From: John Crispin <john@phrozen.org>
>
> Airoha's GPIO controller on their ARM EN7523 SoCs consists of two banks of 32
> GPIOs
>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: John Crispin <john@phrozen.org>
> Signed-off-by: Felix Fietkau <nbd@nbd.name>
> ---
>  .../bindings/gpio/airoha,en7523-gpio.yaml     | 67 +++++++++++++++++++
>  1 file changed, 67 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpio/airoha,en7523-gpio.yaml
>
> diff --git a/Documentation/devicetree/bindings/gpio/airoha,en7523-gpio.yaml b/Documentation/devicetree/bindings/gpio/airoha,en7523-gpio.yaml
> new file mode 100644
> index 000000000000..66c00ec85731
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpio/airoha,en7523-gpio.yaml
> @@ -0,0 +1,67 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/gpio/airoha,en7523-gpio.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Airoha EN7523 GPIO controller
> +
> +maintainers:
> +  - John Crispin <john@phrozen.org>
> +
> +description: |
> +  Airoha's GPIO controller on their ARM EN7523 SoCs consists of two banks of 32
> +  GPIOs.
> +
> +properties:
> +  $nodename:
> +    pattern: "^gpio@[0-9a-f]+$"
> +
> +  compatible:
> +    items:
> +      - const: airoha,en7523-gpio
> +
> +  reg:
> +    description: |
> +      The first tuple points to the input register.
> +      The second and third tuple point to the direction registers
> +      The fourth tuple points to the output register
> +    maxItems: 4
> +
> +  "#gpio-cells":
> +    const: 2
> +
> +  gpio-controller: true
> +
> +required:
> +  - compatible
> +  - reg
> +  - "#gpio-cells"
> +  - gpio-controller
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    gpio0: gpio@1fbf0200 {
> +        compatible = "airoha,en7523-gpio";
> +        reg = <0x1fbf0204 0x4>,
> +              <0x1fbf0200 0x4>,
> +              <0x1fbf0220 0x4>,
> +              <0x1fbf0214 0x4>;
> +        gpio-controller;
> +        #gpio-cells = <2>;
> +    };
> +
> +    gpio1: gpio@1fbf0270 {
> +        compatible = "airoha,en7523-gpio";
> +        reg = <0x1fbf0270 0x4>,
> +              <0x1fbf0260 0x4>,
> +              <0x1fbf0264 0x4>,
> +              <0x1fbf0278 0x4>;
> +        gpio-controller;
> +        #gpio-cells = <2>;
> +    };
> +
> +

I removed this unnecessary newline when applying.

> +...
> --
> 2.32.0 (Apple Git-132)
>

Queued for next, thanks!

Bart

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
