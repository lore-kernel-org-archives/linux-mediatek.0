Return-Path: <SRS0=weZ6=CE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08F9FC433DF
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Aug 2020 13:04:22 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CE8FC20707
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Aug 2020 13:04:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="zxZ5UEqN";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="ufkO1LRB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CE8FC20707
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=D8WagDPUFtWWNhX0pR4UTgvzAuBYm5slBPf8Os4N3Cg=; b=zxZ5UEqNTEz2Lds0IAdLHn4uN
	jzGL2rP1W56K0UuVdzed2v9C6XL02t/prLs/33QvFFf4Sqvs9c0eI1gZoqkmSa1Fst4W/aHPn7pDd
	1Zgz/bj/lssNdd6VwlCL0o9WWOTSvM3qN4INo0zUOrITKAiNLcdVm1MRP9r5nquXUB3w+cktz6fJi
	+Cc6oRVmDqqy9phJETV6BqMF5CX2iEvyQ71IHlyxOkhzHPb0mGf6nkuYyTpWqpMYThk4WXkFeanny
	lrd+XpICd5MnkRwBLunKklVcYKTobeZhi2JjDOynootaxHakqXlmChyecWHPo7dKwiI4Au+OXkduA
	+k4gSGcwA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kAv63-0001Yb-Hv; Wed, 26 Aug 2020 13:04:11 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kAv5s-0001T9-Vx; Wed, 26 Aug 2020 13:04:03 +0000
X-UUID: fc8d5c82938b458fb5d1a54c5e1f102d-20200826
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=1gb8b+Ui/IVbAkliUc2c8Qp4qwqKoKYNM6ImDOzJa70=; 
 b=ufkO1LRBAv55xxVogC5XPbZQ3CMMtdwIMsLLBq+KCpP0r4QCbAdPIuNAC7fiP3LD06/yG5T43Ji2l3QmswzJw52NbJJBgvVC0nyhgeLqDMPeTRx/opEl2kaLUjn8N+fE+cW1VTdbVUHcAfmZZHdgrfr/3OhRHPNSSgkMRkCoVhQ=;
X-UUID: fc8d5c82938b458fb5d1a54c5e1f102d-20200826
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <hector.yuan@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1807513759; Wed, 26 Aug 2020 04:49:22 -0800
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 26 Aug 2020 05:49:20 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 26 Aug 2020 20:49:04 +0800
Received: from [172.21.77.33] (172.21.77.33) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 26 Aug 2020 20:49:04 +0800
Message-ID: <1598446146.24220.3.camel@mtkswgap22>
Subject: Re: [PATCH v2 2/2] dt-bindings: cpufreq: add bindings for MediaTek
 cpufreq HW
From: Hector Yuan <hector.yuan@mediatek.com>
To: Rob Herring <robh@kernel.org>
Date: Wed, 26 Aug 2020 20:49:06 +0800
In-Reply-To: <20200825020423.GA3775564@bogus>
References: <1597302475-15484-1-git-send-email-hector.yuan@mediatek.com>
 <1597302475-15484-3-git-send-email-hector.yuan@mediatek.com>
 <20200825020423.GA3775564@bogus>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-TM-SNTS-SMTP: FC8CA34D7E1F830DBBC874996877A67BE735930B81B24B447A665FB1DD6E0FBA2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200826_090401_262901_C33546BB 
X-CRM114-Status: GOOD (  23.47  )
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
Cc: devicetree@vger.kernel.org, Anson Huang <Anson.Huang@nxp.com>,
 Arnd Bergmann <arnd@arndb.de>, linux-pm@vger.kernel.org,
 Viresh Kumar <viresh.kumar@linaro.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, linux-kernel@vger.kernel.org,
 wsd_upstream@mediatek.com, Bjorn Andersson <bjorn.andersson@linaro.org>, Olof
 Johansson <olof@lixom.net>, Vinod Koul <vkoul@kernel.org>,
 linux-mediatek@lists.infradead.org, Catalin Marinas <catalin.marinas@arm.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Li Yang <leoyang.li@nxp.com>,
 Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, 2020-08-24 at 20:04 -0600, Rob Herring wrote:
> On Thu, Aug 13, 2020 at 03:07:55PM +0800, Hector Yuan wrote:
> > From: "Hector.Yuan" <hector.yuan@mediatek.com>
> > 
> > Add devicetree bindings for MediaTek HW driver.
> > 
> > Signed-off-by: Hector.Yuan <hector.yuan@mediatek.com>
> > ---
> >  .../bindings/cpufreq/cpufreq-mediatek-hw.yaml      |   61 ++++++++++++++++++++
> >  1 file changed, 61 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/cpufreq/cpufreq-mediatek-hw.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/cpufreq/cpufreq-mediatek-hw.yaml b/Documentation/devicetree/bindings/cpufreq/cpufreq-mediatek-hw.yaml
> > new file mode 100644
> > index 0000000..59bb24e
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/cpufreq/cpufreq-mediatek-hw.yaml
> > @@ -0,0 +1,61 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/cpufreq/cpufreq-mediatek-hw.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: MediaTek's CPUFREQ Bindings
> > +
> > +maintainers:
> > +  - Hector Yuan <hector.yuan@mediatek.com>
> > +
> > +description:
> > +  CPUFREQ HW is a hardware engine used by MediaTek
> > +  SoCs to manage frequency in hardware. It is capable of controlling frequency
> > +  for multiple clusters.
> > +
> > +properties:
> > +  compatible:
> > +    const: mediatek,cpufreq-hw
> > +
> > +  reg:
> > +    minItems: 1
> > +    maxItems: 2
> > +    description: |
> > +      Addresses and sizes for the memory of the HW bases in each frequency domain.
> > +
> > +  reg-names:
> > +    items:
> > +      - const: "freq-domain0"
> > +      - const: "freq-domain1"
> 
> Not all that useful of a name given it's based on the index.
Let me explain this index is about to map cpus to each frequency control
domain. Will update details usage in V3. Thank you.
> > +    description: |
> > +      Frequency domain name.
> > +
> > +  "#freq-domain-cells":
> > +    const: 1
> > +    description: |
> > +      Number of cells in a freqency domain specifier.
> 
> What's this for?
> Like the previous mentioned, this is for index mapping. will update in V3. Thank you.
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - reg-names
> > +  - "#freq-domain-cells"
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    soc {
> > +        #address-cells = <2>;
> > +        #size-cells = <2>;
> > +
> > +        cpufreq_hw: cpufreq@11bc00 {
> > +            compatible = "mediatek,cpufreq-hw";
> > +            reg = <0 0x11bc10 0 0x8c>,
> > +               <0 0x11bca0 0 0x8c>;
> > +            reg-names = "freq-domain0", "freq-domain1";
> > +            #freq-domain-cells = <1>;
> > +        };
> > +    };
> > +
> > -- 
> > 1.7.9.5

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
