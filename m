Return-Path: <SRS0=2M+Y=3G=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0712C33CB6
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Jan 2020 18:30:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C84A020728
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Jan 2020 18:30:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rfTHFmLJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C84A020728
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ravnborg.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qzsAexZoOzLUmixpy4vlYL7CZXgrxmReblpGgLLjeF4=; b=rfTHFmLJ89VqHW
	ZgrpCkC51cBm54x8yiNSi/7Yv6WojJADpKV6ylIte1o9+U1of/0p7Ruh3Z6V7r3kv/w0UYmxevsDb
	n5hqlLJ6KhCr5WyYBpklN0rrEnsbIQciElPZEuNDAdRk1kshU5VdCErVgmUFKMNw1/ewX1kctd4Q9
	1QMKU5SwJVkSlOpNipvXmqNO7SzPGsXe1Ncp7uYUeG2qtVwVDpNsbw+bu/9obPv+p3IX28IvTFKCs
	yJwEuBDtsKz/OEPB6+Ro4hL/29GxIaUhBXa0kMFGjwDU+0zFs3O1KSXQN0BDW8SniJIrJ7Rm5om0m
	FsJGep4Fh/79XvvGnltw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1isWO4-0003Ai-Sz; Fri, 17 Jan 2020 18:30:28 +0000
Received: from asavdk3.altibox.net ([109.247.116.14])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1isWNy-00039e-RV
 for linux-mediatek@lists.infradead.org; Fri, 17 Jan 2020 18:30:26 +0000
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 8300420026;
 Fri, 17 Jan 2020 19:30:20 +0100 (CET)
Date: Fri, 17 Jan 2020 19:30:19 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Jitao Shi <jitao.shi@mediatek.com>
Subject: Re: [PATCH v9 1/5] dt-bindings: display: panel: Add boe tv101wum-n16
 panel bindings
Message-ID: <20200117183019.GA14298@ravnborg.org>
References: <20200116021511.22675-1-jitao.shi@mediatek.com>
 <20200116021511.22675-2-jitao.shi@mediatek.com>
 <20200117180817.GA17294@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200117180817.GA17294@ravnborg.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=eMA9ckh1 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=7gkXJVJtAAAA:8
 a=mpaa-ttXAAAA:8 a=gEfo2CItAAAA:8 a=pGLkceISAAAA:8 a=VwQbUJbxAAAA:8
 a=e5mUnYsNAAAA:8 a=EqPL98zj1DO2ifNQ5WsA:9 a=jVGOFjz3VEg0wm82:21
 a=U5ioJVc0Wqf7HXB5:21 a=CjuIK1q_8ugA:10 a=E9Po1WZjFZOl8hwRPBS3:22
 a=6heAxKwa5pAsJatQ0mat:22 a=sptkURWiP4Gy88Gu7hUp:22
 a=AjGcO6oz07-iQ99wixmX:22 a=Vxmtnl_E_bksehYqCbjh:22
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200117_103023_258551_F92F6C29 
X-CRM114-Status: GOOD (  20.41  )
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
Cc: srv_heupstream@mediatek.com, David Airlie <airlied@linux.ie>,
 stonea168@163.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, cawa.cheng@mediatek.com,
 Thierry Reding <thierry.reding@gmail.com>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, yingjoe.chen@mediatek.com,
 eddie.huang@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Jitao.

On Fri, Jan 17, 2020 at 07:08:17PM +0100, Sam Ravnborg wrote:
> Hi Jitao.
> 
> Looks good, much better than the individual files.
> Rob Herring is still listed as maintainer which I questioned in last
> feedback.
> 
> With this resolved (kept only if Rob confirms), this is
> Reviewed-by: Sam Ravnborg <sam@ravnborg.org>

Rob confirmed on irc that he is not a dedicated reviewer of this
binding. And furhtermore that it was OK I committed trivial panel
bindings.
Dropepd Rob and applied to drm-misc-next.

	Sam

> 
> On Thu, Jan 16, 2020 at 10:15:07AM +0800, Jitao Shi wrote:
> > Add documentation for "boe,tv101wum-n16", "auo,kd101n80-45na",
> > "boe,tv101wum-n53" and "auo,b101uan08.3" panels.
> > 
> > Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> > Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
> > ---
> >  .../display/panel/boe,tv101wum-nl6.yaml       | 81 +++++++++++++++++++
> >  1 file changed, 81 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/display/panel/boe,tv101wum-nl6.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/display/panel/boe,tv101wum-nl6.yaml b/Documentation/devicetree/bindings/display/panel/boe,tv101wum-nl6.yaml
> > new file mode 100644
> > index 000000000000..cc4e058f5eee
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/panel/boe,tv101wum-nl6.yaml
> > @@ -0,0 +1,81 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/display/panel/boe,tv101wum-nl6.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: BOE TV101WUM-NL6 DSI Display Panel
> > +
> > +maintainers:
> > +  - Thierry Reding <thierry.reding@gmail.com>
> > +  - Sam Ravnborg <sam@ravnborg.org>
> > +  - Rob Herring <robh+dt@kernel.org>
> > +
> > +allOf:
> > +  - $ref: panel-common.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +        # BOE TV101WUM-NL6 10.1" WUXGA TFT LCD panel
> > +      - boe,tv101wum-nl6
> > +        # AUO KD101N80-45NA 10.1" WUXGA TFT LCD panel
> > +      - auo,kd101n80-45na
> > +        # BOE TV101WUM-N53 10.1" WUXGA TFT LCD panel
> > +      - boe,tv101wum-n53
> > +        # AUO B101UAN08.3 10.1" WUXGA TFT LCD panel
> > +      - auo,b101uan08.3
> > +
> > +  reg:
> > +    description: the virtual channel number of a DSI peripheral
> > +
> > +  enable-gpios:
> > +    description: a GPIO spec for the enable pin
> > +
> > +  pp1800-supply:
> > +    description: core voltage supply
> > +
> > +  avdd-supply:
> > +    description: phandle of the regulator that provides positive voltage
> > +
> > +  avee-supply:
> > +    description: phandle of the regulator that provides negative voltage
> > +
> > +  backlight:
> > +    description: phandle of the backlight device attached to the panel
> > +
> > +  port: true
> > +
> > +required:
> > + - compatible
> > + - reg
> > + - enable-gpios
> > + - pp1800-supply
> > + - avdd-supply
> > + - avee-supply
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    dsi {
> > +        #address-cells = <1>;
> > +        #size-cells = <0>;
> > +        panel@0 {
> > +            compatible = "boe,tv101wum-nl6";
> > +            reg = <0>;
> > +            enable-gpios = <&pio 45 0>;
> > +            avdd-supply = <&ppvarn_lcd>;
> > +            avee-supply = <&ppvarp_lcd>;
> > +            pp1800-supply = <&pp1800_lcd>;
> > +            backlight = <&backlight_lcd0>;
> > +            status = "okay";
> > +            port {
> > +                panel_in: endpoint {
> > +                    remote-endpoint = <&dsi_out>;
> > +                };
> > +            };
> > +        };
> > +    };
> > +
> > +...
> > -- 
> > 2.21.0
> > _______________________________________________
> > dri-devel mailing list
> > dri-devel@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/dri-devel
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
