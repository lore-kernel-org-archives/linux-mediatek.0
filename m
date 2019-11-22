Return-Path: <SRS0=vzOr=ZO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2018AC432C0
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Nov 2019 23:57:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E77832064B
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Nov 2019 23:57:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="N9zdRg+c"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E77832064B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZUX35/mPRC+iitCQ21getlTNGNp0mpOZ4x5/JvOTnmQ=; b=N9zdRg+cM0LaoK
	Eak7tubLiQQqLRZE8RqMpBqtuu8fwbe+7FgJMzW1XY1ephH5XV5RLAfX99RL1vRfowzXfDs4AO03r
	4cgD65ZOKhFmeZ0mHm63BcGtd78F84+XOqzAf2mWX6KV9F+fYc9OJ6H/1Z9Mh1vWwj6T+cpkbjL7a
	A9maiO+r2Io1F2RHQot8ZRyoHAQgyhzIpDoNpXFr+Y4qnaxAVpZklXLfkbOqP2tqths1/ogmtXrXF
	DZUKqXY0ZYyXcBv5ana2t5FFj3JthtpRhqwQCESsFP3188r42VgYtQuGfWFYEXdx6am9JMV9r0I9w
	bWUKNFV0wWQvqQqeZPXg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iYIo9-00075B-JS; Fri, 22 Nov 2019 23:57:49 +0000
Received: from mail-ot1-f66.google.com ([209.85.210.66])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iYIo7-00074K-3B; Fri, 22 Nov 2019 23:57:48 +0000
Received: by mail-ot1-f66.google.com with SMTP id w24so7731784otk.6;
 Fri, 22 Nov 2019 15:57:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=frUbXg9HVcTRfaaxELwHERf+lloS19EI1WW6S+yHA38=;
 b=dMVmnzioXZqGqMXwJ+TmEGPDMwx0xmFv8AfKrnlXKsre0z/3UMVI2ac+he2Y6e/C0R
 8NbSmQv8WYmmo5f1eG7pdrcGlPDYMha53d1gLEV0z8qHkTRChhWtl6sdf+EzXvcOi+cx
 OO7XPd8xerwWAlTuPgZDrhoKljVg+NcXDtQ8CbyT8+MEOMonc9u3IQ2MY0AxF/HBU/s0
 S8+AkIzoksiQIu2R9eahQBy2XJ5oQtk2c2mDWVulKRNywbMzYNKMKJ/CUE3NtK0uZnaI
 1wGmJIDOTtTSVMLBzCczveYQEJyAaO9rKPNfKHUeaw8V30iuM9j9EHvlG3RGgSS1H5AW
 J9Xg==
X-Gm-Message-State: APjAAAXHiUMo3c/uRrbX/9roM8B3/CIvOKi7NY7+Bn0EmfMe5kLDRc2L
 FCQe/V30BTQdsvC2SZdKpA==
X-Google-Smtp-Source: APXvYqwHRHTMvmyvayb6oZ7vqTCt5okUxjvzyr/SweEAZ3HXsEH7Y8guZbnlyFulghfXVoQpjJozjw==
X-Received: by 2002:a9d:12d2:: with SMTP id g76mr13180792otg.232.1574467066059; 
 Fri, 22 Nov 2019 15:57:46 -0800 (PST)
Received: from localhost ([2607:fb90:bd7:3743:c9ec:246b:67b7:9768])
 by smtp.gmail.com with ESMTPSA id b135sm2608451oii.1.2019.11.22.15.57.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Nov 2019 15:57:45 -0800 (PST)
Date: Fri, 22 Nov 2019 17:57:31 -0600
From: Rob Herring <robh@kernel.org>
To: allen <allen.chen@ite.com.tw>
Subject: Re: [PATCH v4 3/4] dt-bindings: Add binding for IT6505.
Message-ID: <20191122235731.GB7738@bogus>
References: <1573811564-320-1-git-send-email-allen.chen@ite.com.tw>
 <1573811564-320-4-git-send-email-allen.chen@ite.com.tw>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1573811564-320-4-git-send-email-allen.chen@ite.com.tw>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191122_155747_138817_F8DB690A 
X-CRM114-Status: GOOD (  14.50  )
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 Jau-Chih Tseng <Jau-Chih.Tseng@ite.com.tw>, David Airlie <airlied@linux.ie>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Pi-Hsun Shih <pihsun@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Nov 15, 2019 at 05:52:19PM +0800, allen wrote:
> From: Allen Chen <allen.chen@ite.com.tw>
> 
> Add a DT binding documentation for IT6505.
> 
> Signed-off-by: Allen Chen <allen.chen@ite.com.tw>
> Signed-off-by: Pi-Hsun Shih <pihsun@chromium.org>
> ---
>  .../bindings/display/bridge/ite,it6505.txt         | 28 ++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/ite,it6505.txt

Please make this a DT schema. See 
Documentation/devicetree/writing-schema.rst.
 
> diff --git a/Documentation/devicetree/bindings/display/bridge/ite,it6505.txt b/Documentation/devicetree/bindings/display/bridge/ite,it6505.txt
> new file mode 100644
> index 00000000..72da0c4
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/bridge/ite,it6505.txt
> @@ -0,0 +1,28 @@
> +iTE it6505 DP bridge bindings
> +
> +Required properties:
> +        - compatible: "ite,it6505"
> +        - reg: i2c address of the bridge
> +        - ovdd-supply: I/O voltage
> +        - pwr18-supply: Core voltage
> +        - interrupts: interrupt specifier of INT pin
> +        - reset-gpios: gpio specifier of RESET pin
> +	- hpd-gpios:
> +		Hotplug detect GPIO.
> +		Indicates which GPIO should be used for hotplug detection

Indentation is not consistent.

> +	- port@[x]: SoC specific port nodes with endpoint definitions as defined
> +		in Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.txt

You need to define what each port is. With the schema, that will be 
'port@0' and 'port@1' properties.

> +
> +Example:
> +	dp-bridge@5c {
> +                compatible = "ite,it6505";
> +                interrupts = <152 IRQ_TYPE_EDGE_RISING 152 0>;
> +                reg = <0x5c>;
> +                pinctrl-names = "default";
> +                pinctrl-0 = <&it6505_pins>;
> +                ovdd-supply = <&mt6358_vsim1_reg>;
> +                pwr18-supply = <&it6505_pp18_reg>;
> +                reset-gpios = <&pio 179 1>;
> +                hpd-gpios = <&pio 9 0>;
> +                extcon = <&usbc_extcon>;

Not documented plus it's deprecated.

You're missing ports here and they are required.

Rob

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
