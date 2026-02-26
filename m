Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCB6FFC591C
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Feb 2026 09:32:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xPVOVRPl3lC1zd+IB3b7f4lFe2w4mB21X3pW18EQvEQ=; b=DB+I8zgsutSt+aCgUr3+ywLIEj
	8HBNUnjFVo5bAAt+jVD076q5TH6VNg8QPg7/QwdznxBgrUHOJXGd5HToz4ieTd+LznYIWzKgpOH3r
	JhTIfNBRFCvHCRtttPhwWp9dUckGUivQjR1IHomhlv4wo3In8D31cOxjum88H9j/TcH9WHrKqRNg6
	ocHK7V2Df3vD4FQ/idD5PFlPTVtInONTwjvEcbjpZLjGZaoSDn/G1Eui2ITLFwkw0gKRqq+7Vnjn3
	AMtKV6nqaTv5gtLajQspI9IaDggstE2I73/xLe4RTA6eCADR4biJdmDfbkeJDZXM4FJTaJ75BKAAt
	JX7TAIJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvXjk-00000005osI-3Hbl;
	Thu, 26 Feb 2026 09:32:50 +0000
Received: from mail-ua1-f50.google.com ([209.85.222.50])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvXjg-00000005oqD-0LKN
	for linux-mediatek@lists.infradead.org;
	Thu, 26 Feb 2026 09:32:47 +0000
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-94dda16ff9fso180152241.1
        for <linux-mediatek@lists.infradead.org>; Thu, 26 Feb 2026 01:32:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772098362; x=1772703162;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xPVOVRPl3lC1zd+IB3b7f4lFe2w4mB21X3pW18EQvEQ=;
        b=vkBlIhbJFP9o8DPHl+bh3Tzr8Xv3Vn0f/GxOTs2Rhgm3qaRz+RXuW7w7uV6Z6fDsT4
         Jxh/3EMk4zxYiKSzyrfG93x6//hyNK/wF6j/yamLNvyTleJrhuR+0966+KPLLTlVhK3E
         wzc9a6eHCGeRG3M6+PdDStSkTza9G25pwHWz3V+2nrsRe0dV3d23R7uzee2RG/p/vJzc
         to1bNkqKIfiHggnF+hsOhIK6rhRPIe2gVsD7AY1QhpMzAoZfmurcQLftvvV2extGVT/v
         0xs0OLz2PBICNcH8+B0KpP6zOM+6oTrdwBfNEdYs8r9WhlIYaDCJtaGMsrirXH5GaiHz
         XdeQ==
X-Forwarded-Encrypted: i=1; AJvYcCW1ewhYOmEcyL1Upj4OZWItUujMCKgN4l+INDCLVi7/akfQAW4If6o7iC/48osZsGoYym/uFmqoaCu4msEcxQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzUlBkCmQ4jzNLReUIKD9ymufxZRi1FeVxscf0WHP83KAfw9AuR
	B0w/FIM6M4C1idD+sR8I0eEOhZ/yxoeDvUaiTPGFebxfgcnubTGteFzpvflGry1U
X-Gm-Gg: ATEYQzxr6a1nTUerz9SsXOeCS5pM3PmCNfqzGdtACKkbAfBSggOFXHf+NxI3K0gqQX9
	CbDVYcWI28M4tzmgQJQFXMOkELWF2a91q/GovrN+P0ClUvermEwGz3nGqIqT4MDfMrxkshV9xti
	Xp94N1i8EZDsQzJMRnDoPKFdrCAiW6udTNSeM/On9lP28dWdvyynD4EmTvsq91YFQacaiDZoEsX
	7fc1J4IlhpS/PBji2NkSqbr+y0NOTCPXjvCaRYYaKBRlw7fMmmsMu9k4jbijyFWbTzN+xnNqgtD
	HyKDrTl+vgHIB7Eh7zXHop0vgRjtUujSkO2OIjlDnTP/1dPkkWRJplXIYoh9ckhbM7D+1YPB6Hp
	E4JkKNZ6jeHOScwgO0WwqqnOU5WN3duzQ8lwatdpJ3mrPDskX+OKZDCaSsZmGlpSi58RODQOI2S
	AC3oKCik8L3+lsGr8OX1m21KeybtEkMZqZhjvg4L6/6gM8FcRzZmLyoKK5pU7G
X-Received: by 2002:a05:6102:134f:b0:5ff:1f6e:627b with SMTP id ada2fe7eead31-5ff1f6e9466mr476744137.41.1772098362342;
        Thu, 26 Feb 2026 01:32:42 -0800 (PST)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com. [209.85.222.48])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5ff1e7aeb8dsm1590052137.2.2026.02.26.01.32.42
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Feb 2026 01:32:42 -0800 (PST)
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-94dd2d71231so168687241.0
        for <linux-mediatek@lists.infradead.org>; Thu, 26 Feb 2026 01:32:42 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU+X4iubQ4qyLVcrvSwv8A6QTwifsC6SZp3fqTB8yvd53HSwIChol/jqbUFpXgxRK8SLDXMc1rgYLO8pb0fwA==@lists.infradead.org
X-Received: by 2002:a05:6102:38ce:b0:5ef:a346:a020 with SMTP id
 ada2fe7eead31-5feb2f081dbmr6698399137.17.1772098361695; Thu, 26 Feb 2026
 01:32:41 -0800 (PST)
MIME-Version: 1.0
References: <20260225155409.612478-1-hugo@hugovil.com> <20260225155409.612478-4-hugo@hugovil.com>
In-Reply-To: <20260225155409.612478-4-hugo@hugovil.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 26 Feb 2026 10:32:30 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVdYX9p9DfDoyMv8qEm52kY51QULkEnuxRBH2OyWyYf6g@mail.gmail.com>
X-Gm-Features: AaiRm50hY6HKs5Dg1D5Z1eUzl_ss50J6M1_HbmNyMG8PvkvLkYn610mEhS3zufM
Message-ID: <CAMuHMdVdYX9p9DfDoyMv8qEm52kY51QULkEnuxRBH2OyWyYf6g@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] dt-bindings: input: add GPIO charlieplex keypad
To: Hugo Villeneuve <hugo@hugovil.com>
Cc: robin@protonic.nl, andy@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, dmitry.torokhov@gmail.com, hvilleneuve@dimonoff.com, 
	mkorpershoek@kernel.org, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, lee@kernel.org, 
	alexander.sverdlin@gmail.com, marek.vasut@gmail.com, akurz@blala.de, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_013244_126740_FB5A5373 
X-CRM114-Status: GOOD (  28.23  )
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

Hi Hugo,

On Wed, 25 Feb 2026 at 16:54, Hugo Villeneuve <hugo@hugovil.com> wrote:
> From: Hugo Villeneuve <hvilleneuve@dimonoff.com>
>
> Add DT bindings for GPIO charlieplex keypad.
>
> Signed-off-by: Hugo Villeneuve <hvilleneuve@dimonoff.com>

Thanks for your patch!

> --- /dev/null
> +++ b/Documentation/devicetree/bindings/input/gpio-charlieplex-keypad.yaml
> @@ -0,0 +1,106 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +
> +$id: http://devicetree.org/schemas/input/gpio-charlieplex-keypad.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: GPIO charlieplex keypad
> +
> +maintainers:
> +  - Hugo Villeneuve <hvilleneuve@dimonoff.com>
> +
> +description: |
> +  The charlieplex keypad supports N^2)-N different key combinations (where N is
> +  the number of lines). Key presses and releases are detected by configuring
> +  only one line as output at a time, and reading other line states. This process
> +  is repeated for each line. Diodes are required to ensure current flows in only
> +  one direction between any pair of pins.
> +  This mechanism doesn't allow to detect simultaneous key presses.

Indeed, e.g. pressing S1 and S2 simultaneously will show a ghost
S5 keypress.

> +
> +  Wiring example for 3 lines keyboard with 6 switches and 3 diodes:
> +
> +  L0  --+---------------------+----------------------+
> +        |                     |                      |
> +  L1  -------+-----------+---------------------+     |
> +        |    |           |    |                |     |
> +  L2  -------------+----------------+-----+    |     |
> +        |    |     |     |    |     |     |    |     |
> +        |    |     |     |    |     |     |    |     |
> +        |  S1 \  S2 \    |  S3 \  S4 \    |  S5 \  S6 \
> +        |    |     |     |    |     |     |    |     |
> +        |    +--+--+     |    +--+--+     |    +--+--+
> +        |       |        |       |        |       |
> +        |    D1 v        |    D2 v        |    D3 v
> +        |       - (k)    |       - (k)    |       - (k)
> +        |       |        |       |        |       |
> +        +-------+        +-------+        +-------+

Don't you need pull-down resistors on L[0-2], and/or a way to specify
in DT to enable internal poll-down on GPIO controllers that support it?
Some controllers may support internal pull-up only, but I guess that
can be handled using GPIO_ACTIVE_LOW?

> +
> +  L: GPIO line
> +  S: switch
> +  D: diode (k indicates cathode)
> +
> +allOf:
> +  - $ref: input.yaml#
> +  - $ref: /schemas/input/matrix-keymap.yaml#
> +
> +properties:
> +  compatible:
> +    const: gpio-charlieplex-keypad
> +
> +  autorepeat: true
> +
> +  debounce-delay-ms:
> +    default: 5
> +
> +  line-gpios:
> +    description:
> +      List of GPIOs used as lines. The gpio specifier for this property
> +      depends on the gpio controller to which these lines are connected.
> +
> +  linux,keymap: true
> +
> +  poll-interval: true
> +
> +  settling-time-us: true
> +
> +  wakeup-source: true
> +
> +required:
> +  - compatible
> +  - line-gpios
> +  - linux,keymap
> +  - poll-interval
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +    #include <dt-bindings/input/input.h>
> +
> +    charlieplex-keypad {

"keyboard", as per Devicetree Specification Generic Names
Recommendation.

> +        compatible = "gpio-charlieplex-keypad";
> +        debounce-delay-ms = <20>;
> +        poll-interval = <5>;
> +        settling-time-us = <2>;
> +
> +        line-gpios = <&gpio2 25 GPIO_ACTIVE_HIGH
> +                      &gpio2 26 GPIO_ACTIVE_HIGH
> +                      &gpio2 27 GPIO_ACTIVE_HIGH>;
> +
> +        /* MATRIX_KEY(output, input, key-code) */
> +        linux,keymap = <
> +            /*
> +             * According to wiring diagram above, if L1 is configured as
> +             * output and HIGH, and we detect a HIGH level on input L0,
> +             * then it means S1 is pressed: MATRIX_KEY(L1, L0, KEY...)
> +             */
> +            MATRIX_KEY(1, 0, KEY_F1) /* S1 */
> +            MATRIX_KEY(2, 0, KEY_F2) /* S2 */
> +            MATRIX_KEY(0, 1, KEY_F3) /* S3 */
> +            MATRIX_KEY(2, 1, KEY_F4) /* S4 */
> +            MATRIX_KEY(1, 2, KEY_F5) /* S5 */
> +            MATRIX_KEY(0, 2, KEY_F6) /* S6 */
> +        >;
> +    };

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

