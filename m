Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46B95C3DA7D
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Jan 2023 06:53:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=GjviG7byUxJQO3JTq97W9RSWN/t+Ue/18g//GetxcNs=; b=PlwgEbrRp3Om83DKJ+UaMbzd/y
	jwB23KLBzyNLy0e5Be0cZFkq2W82uWTEAvEk1JNigT7kg345URui/+iX+qBFcNsdQk9JCgLah8uBm
	gjsXpPsmwyRRjjiw+JTNksWR28X9dAr9z3cihbAR/wKEsOD7sOEy7K6Qe+2dPzOvnbKDfE8gsNB90
	PMWJP8KRmDpQCyWSE9mj1DOW1VgldljjShXu4pW7vjuIY9sglbVPIQpHdLco7CycGDj30DSueba8s
	ADPWEOOZl4m9OljqKMmqqg4rxXHX6+EsTCT5Xr9ob3aH0b8kYPJyok5+622fFWk7K8kvLKdj2I2+b
	Kk++OmBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCbB0-00HH1S-Lu; Tue, 03 Jan 2023 06:53:34 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCb4T-00HEot-AZ; Tue, 03 Jan 2023 06:46:54 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 3036kHrS036766;
	Tue, 3 Jan 2023 00:46:17 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1672728377;
	bh=GjviG7byUxJQO3JTq97W9RSWN/t+Ue/18g//GetxcNs=;
	h=From:To:CC:Subject:Date;
	b=MlEsJlQW28ncTKGiacYeRQHBUGi5M7vNIJIo/32shZD8qHL2gnNgsUA+sZpw9HbJu
	 Wm45kD9SgsBzcxpMF+zL/cmYcIVArF+n+LbSAYQWNW0whH0tTehWT30G85MJMB/h4t
	 Q81CtfSC3AQFmcg0jtl86ihlyeh2W7h+Xlk5LuXU=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 3036kG9g042359
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 3 Jan 2023 00:46:16 -0600
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Tue, 3
 Jan 2023 00:46:16 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Tue, 3 Jan 2023 00:46:16 -0600
Received: from localhost (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 3036kFhp075217;
	Tue, 3 Jan 2023 00:46:16 -0600
From: Aradhya Bhatia <a-bhatia1@ti.com>
To: Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>,
        Tomi Valkeinen <tomba@kernel.org>, Jyri
 Sarha <jyri.sarha@iki.fi>,
        David Airlie <airlied@gmail.com>, Daniel Vetter
	<daniel@ffwll.ch>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>, Maxime Ripard <maxime@cerno.tech>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark
 Brown <broonie@kernel.org>,
        Lad Prabhakar
	<prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Paul Walmsley
	<paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou
	<aou@eecs.berkeley.edu>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Guo Ren
	<guoren@kernel.org>
CC: DRI Development List <dri-devel@lists.freedesktop.org>,
        Devicetree List
	<devicetree@vger.kernel.org>,
        Linux Kernel List
	<linux-kernel@vger.kernel.org>,
        Linux RISC-V List
	<linux-riscv@lists.infradead.org>,
        Linux ARM Kernel List
	<linux-arm-kernel@lists.infradead.org>,
        Linux Mediatek List
	<linux-mediatek@lists.infradead.org>,
        Linux C-SKY Arch List
	<linux-csky@vger.kernel.org>,
        Nishanth Menon <nm@ti.com>, Vignesh Raghavendra
	<vigneshr@ti.com>,
        Rahul T R <r-ravikumar@ti.com>, Devarsh Thakkar
	<devarsht@ti.com>,
        Jai Luthra <j-luthra@ti.com>, Jayesh Choudhary
	<j-choudhary@ti.com>,
        Aradhya Bhatia <a-bhatia1@ti.com>
Subject: [RFC PATCH 0/4] dt-bindings: Introduce dual-link panels & panel-vendors
Date: Tue, 3 Jan 2023 12:16:11 +0530
Message-ID: <20230103064615.5311-1-a-bhatia1@ti.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230102_224649_565397_7B452FB1 
X-CRM114-Status: GOOD (  21.75  )
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

Hi all,

Microtips Technology Solutions USA, and Lincoln Technology Solutions are
2 display panel vendors, and the first 2 patches add their vendor
prefixes.

The fourth patch, simply introduces the new compatible for the generic
dual-link panels in the panel-lvds driver. This new compatible is based
from a new DT binding added in the third patch explained below.

The third patch introduces a dt-binding for generic dual-link LVDS
panels. These panels do not have any documented constraints, except for
their timing characteristics. Further, these panels have 2 pixel-sinks.
In a dual-link connection between an LVDS encoder and the panel, one
sink accepts the odd set of LVDS pixels and the other, the even set.

A lot of this has been based from the Advantech,idk-2121wr dual-link
panel[1] and Maxime's patches for generic LVDS panels[2] (which are
single-link by default.) and the discussions that happened before they
were finally merged.

Below are some notes and points that I want to bring forward.

  - The advantech,idk-2121wr panel binding uses 2 boolean properties
    dual-link-odd/even-pixels, to signify which port sink is being used
    for which set of LVDS pixels. I too have added similar support and
    introduced constraints around those properties, so as to not break
    the ABI... but I believe there is a better way to achieve this.

    A "pixel-type" enum property could be introduced in their stead,
    which can accept one of the 2 options <dual-lvds-odd-pixels> or
    <dual-lvds-even-pixels>.

    This method, in my opinion, is more accurate and cleaner to
    implement in the bindings as well.

    If this does sound a better I can push out a new revision where the
    driver supports both these methods (to not break the ABI) and the
    advantech,2121wr panel can remain as an exception.


  - As an alternative to the previous point, if that method is not
    preferred for some reason, the advantech,2121wtr panel binding
    could then be merged in the panel-dual-lvds binding as part of
    future work.


  - Another tweak, I am looking forward to do as part of future work and
    would like all your comments is to introduce driver-based
    implementation of the panel timing parameters, like it is with
    "panel-simple". The driver can then support both the panel-timing
    sources (DT node or hard-coded driver structure) and the binding
    can remove this from the "required" section.

Thank you!

[1]: https://patchwork.freedesktop.org/patch/357122/
[2]: https://patchwork.freedesktop.org/patch/471228/

Aradhya Bhatia (4):
  dt-bindings: vendor-prefixes: Add microtips
  dt-bindings: vendor-prefixes: Add lincolntech
  dt-bindings: panel: Introduce dual-link LVDS panel
  drm: panel-lvds: Introduce dual-link panels

 .../display/panel/panel-dual-lvds.yaml        | 157 ++++++++++++++++++
 .../devicetree/bindings/vendor-prefixes.yaml  |   4 +
 MAINTAINERS                                   |   1 +
 drivers/gpu/drm/panel/panel-lvds.c            |   1 +
 4 files changed, 163 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/panel-dual-lvds.yaml

-- 
2.39.0


