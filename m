Return-Path: <SRS0=r4MK=J3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E023C433ED
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Apr 2021 01:42:40 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9C4516008E
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Apr 2021 01:42:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9C4516008E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:Subject:References:
	In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=aZHysNNHSkpsPVsTg+VmCLiUXYYNYBOA7pmXh2xtGm8=; b=UNb5kpHObn4XqTRhjKp31TkN6
	OggYxFjlTPv8FjiY+FRH/0c0k0HhDM2o33XPlPIT2+B3DVSwVOUKR3oJj7kpuSbfXUw9XB3wO81/6
	5RERMuujnpAOXy01kFxaOIHh1o+1vgFshdgK2y0sNnz2bxE2GudOs7S9txLyOYCDuKe5lT6QB9pjE
	70VtAvP24H/S/boL8vv4DOAZto2b49BaaB5rIHm1W9ZwH5a0yTd1+CibFBNtM0h1EGYrCXOQmUGr0
	3ezBZlyc5qsFXkxAAuU4zMBmbn3FWgZQIMrluBd7+7LtP9V9rg1P+IQXjy9/wdvFFumMfyEms2q7c
	OL5RPRAdA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lcIAk-006wf3-Ax; Fri, 30 Apr 2021 01:42:26 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lcIAW-006wdo-KF; Fri, 30 Apr 2021 01:42:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Message-ID:Date:To:Cc:From:Subject:
 References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=lmbiQZxy/BZDv18PdAbDLugEsnVuEFgvfCC4jIr7sqE=; b=d7QDbR5axhPSewpKPacpcaHx41
 T+rIKZP5aSaqoInD+8uMA+k7uVku3EkwfM5WRR8AEwM5xmW9AZ5WxZbei168QTyWUnpd9DclrxxiH
 QI5PxYa67HhNhjGtftKW8CdlCZE9FaLZ63apKOFZsikb2zqaCrcsEIWfEUAyR3xTuAyCawUyj4c+u
 bN9IYnXQtM04bDHTBK3oQBHVBrCpqHBdr/MJvS4cHoqzm/BqvXemv4eV+05Md65cqBnpcXkOlS9U6
 NfV7fLmBGwtj6CaaLJO1k6tDwnhCBd1tUDPSwoXVBxk5iWBeJ4ckqUxVYtr1WeQHlX37sbLfSNTSm
 7+psGZQg==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lcIAT-00148w-KI; Fri, 30 Apr 2021 01:42:11 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 61FD96008E;
 Fri, 30 Apr 2021 01:42:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1619746928;
 bh=zmDnRH46a0ykZ/bNdCn69oCHn+Hd2Jsjsg9YKV9G5Es=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=QtrnfSmTuyWeRSiYVerPe0KAYrKvOg+CqAX/ihAZzi2WPOl47yWt7ldS0/XSy8ubu
 hXSmx00c9p6r1lmgoVakAf/ypS0EUohLhCpxggaS8IcH1C1ZM/r5ZiuQ5xZxPBlm74
 o0Xh6N6ZkmoSt7iWwlFKusWm88IZ4BIaCVvU0H7n5yW7j6aZQKixqTZWXE0HAj3aPz
 1DBy6OWX6R9dMVSCIdPd/2j3SVzio2F32u3d0dQ4urycOsQ0/SmMNA83zW9XlqmNiM
 fKx5GuZoW+HX8cNxOMewy0t7ejaakZ/zm962J8qAIOBzlLfwO4yed8w1As10OL+w5U
 J3ocsTuJn5v5g==
MIME-Version: 1.0
In-Reply-To: <20210324104110.13383-2-chun-jie.chen@mediatek.com>
References: <20210324104110.13383-1-chun-jie.chen@mediatek.com>
 <20210324104110.13383-2-chun-jie.chen@mediatek.com>
Subject: Re: [RESEND PATCH v7 01/22] dt-bindings: ARM: Mediatek: Add new
 document bindings of imp i2c wrapper controller
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org,
 srv_heupstream@mediatek.com, Project_Global_Chrome_Upstream_Group@mediatek.com,
 chun-jie.chen <chun-jie.chen@mediatek.com>, Weiyi Lu <weiyi.lu@mediatek.com>,
 <devicetree@vger.kernel.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
 Nicolas Boichat <drinkcat@chromium.org>, Rob Herring <robh@kernel.org>,
 chun-jie.chen <chun-jie.chen@mediatek.com>
Date: Thu, 29 Apr 2021 18:42:07 -0700
Message-ID: <161974692707.177949.4882672793905809142@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210429_184209_743898_803159D3 
X-CRM114-Status: GOOD (  13.68  )
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

Please Cc devicetree@vger.kernel.org and use robh+dt@kernel.org for DT
bindings. This was waiting for DT review but because the right lists
weren't Cced it fell off the queue.

Quoting chun-jie.chen (2021-03-24 03:40:49)
> This patch adds the new binding documentation of imp i2c wrapper controller
> for Mediatek MT8192.
> 
> Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
> Signed-off-by: chun-jie.chen <chun-jie.chen@mediatek.com>
> ---
>  .../arm/mediatek/mediatek,imp_iic_wrap.yaml   | 80 +++++++++++++++++++
>  1 file changed, 80 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,imp_iic_wrap.yaml
> 
> diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,imp_iic_wrap.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,imp_iic_wrap.yaml
> new file mode 100644
> index 000000000000..fb6cb9e60ee2
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,imp_iic_wrap.yaml
> @@ -0,0 +1,80 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/arm/mediatek/mediatek,imp_iic_wrap.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek IMP I2C Wrapper Controller
> +
> +maintainers:
> +  - Chun-Jie Chen <chun-jie.chen@mediatek.com>
> +
> +description:
> +  The Mediatek imp i2c wrapper controller provides functional configurations and clocks to the system.
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - mediatek,mt8192-imp_iic_wrap_c
> +          - mediatek,mt8192-imp_iic_wrap_e
> +          - mediatek,mt8192-imp_iic_wrap_s
> +          - mediatek,mt8192-imp_iic_wrap_ws
> +          - mediatek,mt8192-imp_iic_wrap_w
> +          - mediatek,mt8192-imp_iic_wrap_n
> +      - const: syscon
> +
> +  reg:
> +    maxItems: 1
> +
> +  '#clock-cells':
> +    const: 1
> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    imp_iic_wrap_c: syscon@11007000 {
> +        compatible = "mediatek,mt8192-imp_iic_wrap_c", "syscon";
> +        reg = <0x11007000 0x1000>;
> +        #clock-cells = <1>;
> +    };
> +
> +  - |
> +    imp_iic_wrap_e: syscon@11cb1000 {
> +        compatible = "mediatek,mt8192-imp_iic_wrap_e", "syscon";
> +        reg = <0x11cb1000 0x1000>;
> +        #clock-cells = <1>;
> +    };
> +
> +  - |
> +    imp_iic_wrap_s: syscon@11d03000 {
> +        compatible = "mediatek,mt8192-imp_iic_wrap_s", "syscon";
> +        reg = <0x11d03000 0x1000>;
> +        #clock-cells = <1>;
> +    };
> +
> +  - |
> +    imp_iic_wrap_ws: syscon@11d23000 {
> +        compatible = "mediatek,mt8192-imp_iic_wrap_ws", "syscon";
> +        reg = <0x11d23000 0x1000>;
> +        #clock-cells = <1>;
> +    };
> +
> +  - |
> +    imp_iic_wrap_w: syscon@11e01000 {
> +        compatible = "mediatek,mt8192-imp_iic_wrap_w", "syscon";
> +        reg = <0x11e01000 0x1000>;
> +        #clock-cells = <1>;
> +    };
> +
> +  - |
> +    imp_iic_wrap_n: syscon@11f02000 {
> +        compatible = "mediatek,mt8192-imp_iic_wrap_n", "syscon";
> +        reg = <0x11f02000 0x1000>;
> +        #clock-cells = <1>;
> +    };
> -- 
> 2.18.0
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
