Return-Path: <SRS0=8HgB=75=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD602C433E0
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Jun 2020 10:59:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 79FBF20786
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Jun 2020 10:59:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Z+0nPwHQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 79FBF20786
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ucw.cz
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iQZVNajUdJkK58jhZDnOw8eq9eahUttMSKUTiYB9FmA=; b=Z+0nPwHQpM8P7z
	NSF8Osu5CczS9wea/KZ18g8uKRjteoMIOvmjZKFAS3dYzy5bVA76TDFUGFXZ02ZmP7QagJxug1fVE
	0XbOK7/lZUUT8Yp19tAmpbgmfZIQSRN1kHAl8evInnvsf8ZtdhgfDYuI6tUJtx3InB9BBCoezqFcu
	ug6qjg5gVHbH6lIqQOEkotydRxSsMlGvF9ICR9RBR288ZWpKhK1Y44tZmaTk4E89joTFJ/oQcXgln
	Uz1gXdXuUImfjI1n84uKqVsqtlTLSGyHzhuYcztl4dc/MiZIO1a5rHkbmINpMm+YY9oZkRb+sFbqv
	isq3jKdGsL5naEDseSbA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jl9Is-0006on-9g; Tue, 16 Jun 2020 10:58:54 +0000
Received: from jabberwock.ucw.cz ([46.255.230.98])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jl9Ii-0006fk-Qf; Tue, 16 Jun 2020 10:58:46 +0000
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
 id F365B1C0BD2; Tue, 16 Jun 2020 12:58:38 +0200 (CEST)
Date: Tue, 16 Jun 2020 12:58:31 +0200
From: Pavel Machek <pavel@ucw.cz>
To: Fengping Yu <fengping.yu@mediatek.com>
Subject: Re: [PATCH v1 1/3] dt-bindings:Add vibrator devicetree documentation
Message-ID: <20200616105831.GJ1718@bug>
References: <20200615114203.116656-1-fengping.yu@mediatek.com>
 <20200615114203.116656-2-fengping.yu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200615114203.116656-2-fengping.yu@mediatek.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200616_035845_020293_16024B7B 
X-CRM114-Status: GOOD (  14.91  )
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
Cc: Catalin Marinas <catalin.marinas@arm.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 linux-mediatek@lists.infradead.org,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>, linux-input@vger.kernel.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Yingjoe Chen <yingjoe.chen@mediatek.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon 2020-06-15 19:42:02, Fengping Yu wrote:
> From: "fengping.yu" <fengping.yu@mediatek.com>
> 
> Add Mediatek regulator vibrator dt-bindings doc as yaml schema
> 
> Signed-off-by: fengping.yu <fengping.yu@mediatek.com>
> ---
>  .../bindings/input/regulator-vibrator.yaml    | 65 +++++++++++++++++++
>  1 file changed, 65 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/input/regulator-vibrator.yaml
> 
> diff --git a/Documentation/devicetree/bindings/input/regulator-vibrator.yaml b/Documentation/devicetree/bindings/input/regulator-vibrator.yaml
> new file mode 100644
> index 000000000000..6511a8a80aff
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/input/regulator-vibrator.yaml
> @@ -0,0 +1,65 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +version: 1
> +
> +$id: http://devicetree.org/schemas/input/regulator-vibrator.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Mediatek's regulator vibrator device tree bindings
> +
> +maintainer:
> +  - Fengping Yu <fengping.yu@mediatek.com>
> +
> +description: |
> +  Registers a regulator device as vibrator, where the on/off capability is controlled by a regulator.

Line length?

> +properties:
> +  compatible:
> +      const: "regulator-vibrator"
> +
> +	vibr-supply:
> +		description: Power supply to the vibrator.
> +		refs:Documentation/devicetree/bindings/regulator/regulator.txt for details.
> +
> +  max-volt:
> +    description: The maximum voltage value supplied to the vibrator regulator.
> +    						 The unit of the voltage is micro.
> +

should be -microvolt?

> +  min-volt:
> +    description: The minimum voltage value supplied to the vibrator regulator.
> +    						 The unit of the voltage is micro.
> +
> +  min-limit:
> +    description: The minimum duration time in ms for vibrator, default is 15ms.
> +    						 If user request smaller duration, the default value will be used
> +    						 instead. The default value comes from the smallest unit that can
> +    						 be sensored.

English?

Add -usec or something?

											Pavel
-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
