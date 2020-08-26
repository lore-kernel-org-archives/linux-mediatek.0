Return-Path: <SRS0=weZ6=CE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBE46C433E1
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Aug 2020 11:54:33 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8C12F20707
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Aug 2020 11:54:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="aOli1MTp";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="oFXSr8rr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8C12F20707
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=mh6s+V40HPVWurs6rU3bH9vmWix43H295DBrv5Qf8gY=; b=aOli1MTpaurUbK84DIG8caQls
	oiS/rxxPb7VpH1FPPi+j1oTve/vLMwGD8+Lb0cEwulcehbSjzhof4lgF7xi+y+NV9jdsJg1prI4Uj
	8XZohqNVSfNEB/7LHUOaStJYW+SL74MrTMOJsikxm93TVHR68hphlDB33DNVCFYxbk/LRVFa3y5IF
	Uy91UbpW+O0jDDkISWP0R8FmNcixXw6oIRSmnN8Xzssib05bX6u/DJk5tYLhNIMpOt9XSZzv9igGd
	nMUhkrP67UUc7Rbt+Hci+ONO7kz3aM44GfXQzIt5DHlU9iPackVgHpanDWSq52S5WFtINNfnQK3nO
	bPkMPoO5Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kAu0W-0001YC-Ov; Wed, 26 Aug 2020 11:54:24 +0000
Received: from lelv0143.ext.ti.com ([198.47.23.248])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kAu0R-0001Vz-F7; Wed, 26 Aug 2020 11:54:20 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 07QBsHd2011740;
 Wed, 26 Aug 2020 06:54:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1598442857;
 bh=7JbYWbrP9n+hcQ/zh3iXK/TqWpH2A4yaS5facefQiAo=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=oFXSr8rr31TE3eJ9f/HW9iGEl6X0XzJiaN+N6kQ4kgMn8V6Vh1mUkjaohMHgZ5jzq
 ZDpQYhNO9r4PCUDdM4Hw8ip8M6NfP8wV8sa0IPHJjSUM6qyC27ECzPlhhgY9w+xC6S
 oS8CUiZHoSxLWmueCL/rIBNbarRG2d2nEqr0n/HQ=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 07QBsHTg028820
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 26 Aug 2020 06:54:17 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 26
 Aug 2020 06:54:17 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 26 Aug 2020 06:54:17 -0500
Received: from [10.250.68.181] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 07QBsG6i079719;
 Wed, 26 Aug 2020 06:54:16 -0500
Subject: Re: [PATCH 2/2] dt-bindings: leds: Add bindings for MT6360 LED
To: Gene Chen <gene.chen.richtek@gmail.com>, <jacek.anaszewski@gmail.com>,
 <pavel@ucw.cz>, <matthias.bgg@gmail.com>
References: <1598441840-15226-1-git-send-email-gene.chen.richtek@gmail.com>
 <1598441840-15226-3-git-send-email-gene.chen.richtek@gmail.com>
From: Dan Murphy <dmurphy@ti.com>
Message-ID: <06b19a38-6850-01b1-7a43-b61aec4079b8@ti.com>
Date: Wed, 26 Aug 2020 06:54:16 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1598441840-15226-3-git-send-email-gene.chen.richtek@gmail.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200826_075420_038889_DB8D39DC 
X-CRM114-Status: GOOD (  21.73  )
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
Cc: gene_chen@richtek.com, linux-kernel@vger.kernel.org, cy_huang@richtek.com,
 benjamin.chao@mediatek.com, linux-mediatek@lists.infradead.org,
 linux-leds@vger.kernel.org, Wilma.Wu@mediatek.com,
 linux-arm-kernel@lists.infradead.org, shufan_lee@richtek.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Gene

On 8/26/20 6:37 AM, Gene Chen wrote:
> From: Gene Chen <gene_chen@richtek.com>
>
> Add bindings document for LED support on MT6360 PMIC

Usually bindings are 1/x in the patchset.

And you should cc Rob Herring and the Device tree mail list other wise 
the maintainer will not apply this patch without their ACKs


> Signed-off-by: Gene Chen <gene_chen@richtek.com>
> ---
>   .../devicetree/bindings/leds/leds-mt6360.yaml      | 50 ++++++++++++++++++++++
>   1 file changed, 50 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/leds/leds-mt6360.yaml
>
> diff --git a/Documentation/devicetree/bindings/leds/leds-mt6360.yaml b/Documentation/devicetree/bindings/leds/leds-mt6360.yaml
> new file mode 100644
> index 0000000..4598be5
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/leds-mt6360.yaml
> @@ -0,0 +1,50 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/leds/leds-mt6360.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: LED driver for MT6360 PMIC from MediaTek Integrated.
> +
> +maintainers:
> +  - Gene Chen <gene_chen@richtek.com>
> +
> +description: |
> +  This module is part of the MT6360 MFD device. For more details
> +  see Documentation/devicetree/bindings/mfd/mt6360.yaml.

I think you need to include this yaml using allof tag


> +
> +  The LED controller is represented as a sub-node of the PMIC node on
> +  the device tree.
> +
> +  This device has six current sinks.
> +
> +properties:
> +  compatible:
> +    const: mediatek,mt6360-led
> +
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 0
> +
> +patternProperties:
> +  "^led@[0-5]$":
> +    type: object
> +    description: |
> +      Properties for a single LED.
> +
> +    properties:
> +      reg:
> +        description:
> +          Index of the LED.
> +        minimum: 0
> +        maximum: 5
> +
> +required:
> +  - compatible
> +  - "#address-cells"
> +  - "#size-cells"
> +additionalProperties: false
> +
Need a new line


And an example

> +...

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
