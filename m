Return-Path: <SRS0=EkB4=4W=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA935C3F2D2
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Mar 2020 21:29:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 783F120728
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Mar 2020 21:29:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ASO4NeCR";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="ShPPP/LC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 783F120728
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LKsRw3YsHaM+0jYcONVp6nQm429LYaA3LhwhZXlyzTY=; b=ASO4NeCREnnH6T
	KrkoGj/QUOsP4ftKo+GOjhTDgbU2BAJ52F+sTm+ccJ27GKhbEtTTkdMnLZsvgM2oSdRPFS5dOhAbj
	YXa0xHvEz2+9i+5pWAKm4XaBlgj7T+XIAo4F0orHBIJnkTDXoY53qhwaHzccBme/x7aUEeoEt+sNZ
	/HIcsVppQFr/Wn4TJeUc5KcWFeNaMEqy1RJHjcKFW/xWI1tKwvjBAwDqUus2f+OiTBfpVvLXMqjae
	dGHQExDEdRna7LslgEPCfOJpaeA9yXArufptHDVsOclNXwkL2k/06eBG9QwA7QNlZXUN8d/79YZcP
	Pb87BiRIvoXyRAWc3XgQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j9y3Y-0005Iv-Pd; Thu, 05 Mar 2020 21:29:24 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j9y3O-00059R-Fy; Thu, 05 Mar 2020 21:29:16 +0000
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com
 [209.85.222.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 96CE921744;
 Thu,  5 Mar 2020 21:29:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1583443753;
 bh=oh2OwQ/0TeiUDxPSSCXzSpj5KXTo4xNzQh97uu6obDw=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=ShPPP/LC/9bbpx0NGMJcdAFDkRwBAzI7UfIQOCBK8FtcyFOSbnL/mhxhTlVpfidtd
 EvjOk7ZmKbTjpeiu0mssyqZbGbuNOyuZOarr3k45UTaN8MfINS7v78/9gFpPJjxGIp
 9halWgIRS2l82IX8m+dus45MdaiO013SnmlnTbag=
Received: by mail-qk1-f171.google.com with SMTP id p62so367541qkb.0;
 Thu, 05 Mar 2020 13:29:13 -0800 (PST)
X-Gm-Message-State: ANhLgQ1rV3vzQnLQVJviwZIokYrXeRLMQj3pYL86xlw6Hd9S3DjYVOyJ
 q4CCFID4jLyJJkIMQwqER2NB/1vKODk5axMl6g==
X-Google-Smtp-Source: ADFU+vtqjRJO6NbTISWxledTlH+SAy9WYo0Hq7+mzVvIuhn8GJMCac26m6QCpXzcrlt1I+k7z1Xm4kMe5NwmRP+Yero=
X-Received: by 2002:a37:393:: with SMTP id 141mr9930qkd.393.1583443752527;
 Thu, 05 Mar 2020 13:29:12 -0800 (PST)
MIME-Version: 1.0
References: <20200305030135.210675-1-pmalani@chromium.org>
In-Reply-To: <20200305030135.210675-1-pmalani@chromium.org>
From: Rob Herring <robh+dt@kernel.org>
Date: Thu, 5 Mar 2020 15:29:00 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJcJf0JZVHEuY5y0eHLyw3e0Wr2ZDJvPs4=cZaSMWg97A@mail.gmail.com>
Message-ID: <CAL_JsqJcJf0JZVHEuY5y0eHLyw3e0Wr2ZDJvPs4=cZaSMWg97A@mail.gmail.com>
Subject: Re: [PATCH v2] dt-bindings: Convert usb-connector to YAML format.
To: Prashant Malani <pmalani@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200305_132914_576169_576A0526 
X-CRM114-Status: GOOD (  19.95  )
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
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 "open list:USB SUBSYSTEM" <linux-usb@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>, Stephen Boyd <swboyd@chromium.org>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Benson Leung <bleung@chromium.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Mar 4, 2020 at 9:01 PM Prashant Malani <pmalani@chromium.org> wrote:
>
> Convert the usb-connector.txt bindings file to YAML format. This allows
> it to be used in dt_bindings_check verification. This patch was
> born out of a patch series for the addition of a Type C connector
> class port driver[1].
>
> An attempt has been made to maintain the same documentation text and
> example structure as was in the .txt file, but wherever needed
> modifications have been made to satisfy dt_bindings_check.
>
> Also, update all references to usb-connector.txt to now use
> usb-connector.yaml.
>
> [1]: https://lkml.org/lkml/2020/2/19/1232
>
> Signed-off-by: Prashant Malani <pmalani@chromium.org>
> ---
>
> Changes in v2:
> - Added type references for some properties.
> - Removed pinctrl properties.
> - Updated power-role, try-power-role and data-role properties to be in
>   valid schema format.
> - Added OF graph data bus binding property according to reviewer
>   suggestions.
>
>  .../connector/samsung,usb-connector-11pin.txt |   2 +-
>  .../bindings/connector/usb-connector.txt      | 135 ------------
>  .../bindings/connector/usb-connector.yaml     | 203 ++++++++++++++++++
>  .../devicetree/bindings/usb/fcs,fusb302.txt   |   2 +-
>  .../devicetree/bindings/usb/generic.txt       |   2 +-
>  .../devicetree/bindings/usb/mediatek,mtu3.txt |   2 +-
>  .../devicetree/bindings/usb/mediatek,musb.txt |   2 +-
>  .../bindings/usb/richtek,rt1711h.txt          |   2 +-
>  .../devicetree/bindings/usb/ti,hd3ss3220.txt  |   2 +-
>  .../devicetree/bindings/usb/typec-tcpci.txt   |   2 +-
>  .../devicetree/bindings/usb/usb-conn-gpio.txt |   4 +-
>  11 files changed, 213 insertions(+), 145 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/connector/usb-connector.txt
>  create mode 100644 Documentation/devicetree/bindings/connector/usb-connector.yaml


> diff --git a/Documentation/devicetree/bindings/connector/usb-connector.yaml b/Documentation/devicetree/bindings/connector/usb-connector.yaml
> new file mode 100644
> index 0000000000000..b386e2880405c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/connector/usb-connector.yaml
> @@ -0,0 +1,203 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/connector/usb-connector.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: USB Connector
> +
> +maintainers:
> +  - linux-usb@vger.kernel.org

Person please. You can put me if no one else.

> +description:
> +  A USB connector node represents a physical USB connector. It should be a child
> +  of a USB interface controller.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - usb-a-connector
> +      - usb-b-connector
> +      - usb-c-connector
> +
> +  label:
> +    description: Symbolic name for the connector.
> +
> +  type:
> +    description: Size of the connector, should be specified in case of USB-A,
> +      USB-B non-fullsize connectors.
> +    $ref: /schemas/types.yaml#definitions/string

Needs to be under an 'allOf' or the enum is ignored.

Rob

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
