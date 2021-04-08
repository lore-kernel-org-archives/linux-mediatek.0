Return-Path: <SRS0=hXrw=JF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36707C433B4
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Apr 2021 04:19:49 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BF62A611C9
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Apr 2021 04:19:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BF62A611C9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:CC:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=u9/C/nuqc6EOJUx8X3QV6z0jpxs26DM6VDQ6xwoyPUM=; b=f/46taVq6nAR9Gj6HmVuHZKyc
	W1Eg0CY7mST8YumY303bgz4uYNS3j3lJWirURxfCPaNfTOL+44nwMIMd4Ie1osbQuh8Lk1+E2gW+7
	A7sFkhNDdKiS/8bwbv99ahwqp8BhUqnp4s5A2Gza+ARglOBKdzzlt5e+YyGtz7BVWrdm0kTDhlTTK
	QSRguagjxVK+8IZCR35KfgIL+A/ud/kZOi2qUtxr3Y8unQ2h72mqlg9kvm9wtafrNWHJCAtkidS6j
	JXofV4r1Dd1mbfD/QFKfmXhvvlvZGqjuCmPlBdPj+IZy0Kn+t93PVht5gKWHOxvvr/ZhGOC2FakPm
	1x43+i0UA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lUM8h-006qbs-Di; Thu, 08 Apr 2021 04:19:33 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUM3b-006oe8-V3; Thu, 08 Apr 2021 04:14:38 +0000
X-UUID: c862bebeb42845d38fad6f15c4b2bcb8-20210407
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=DVHlk3aQBzPohEdHzeEyWWrR5lnDnpX1qWaGhOvJPGs=; 
 b=CdqEtBJ41g16AEEkm82pnXLFVc/ZliotAdkts2ONgut48oPsyrmTiCgATjrHwNctVC56V7DKS2gBbnjsUUAdb66d/D6ZiSlOL4YnR+arvRx2QPr4Dxj1NfrrIW3OUiyCcm9hteDGQjNSnShaKRhteRr8EPNiny7xRox4WeYCeKE=;
X-UUID: c862bebeb42845d38fad6f15c4b2bcb8-20210407
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <flora.fu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 654047676; Wed, 07 Apr 2021 21:14:07 -0700
Received: from MTKMBS01N1.mediatek.inc (172.21.101.68) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 7 Apr 2021 21:04:05 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 8 Apr 2021 12:03:51 +0800
Received: from [172.21.84.99] (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 8 Apr 2021 12:03:51 +0800
Message-ID: <1617854631.5654.9.camel@mtksdccf07>
Subject: Re: [PATCH 5/8] dt-bindings: soc: mediatek: apusys: Add new
 document for APU power domain
From: Flora Fu <flora.fu@mediatek.com>
To: Rob Herring <robh@kernel.org>
CC: Stephen Boyd <sboyd@kernel.org>, Mark Brown <broonie@kernel.org>, "Chiawen
 Lee" <chiawen.lee@mediatek.com>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>, "Michael
 Turquette" <mturquette@baylibre.com>, <linux-mediatek@lists.infradead.org>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>, <linux-clk@vger.kernel.org>, "Rob
 Herring" <robh+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, Pi-Cheng Chen <pi-cheng.chen@mediatek.com>
Date: Thu, 8 Apr 2021 12:03:51 +0800
In-Reply-To: <1617805692.253379.3696993.nullmailer@robh.at.kernel.org>
References: <1617766086-5502-1-git-send-email-flora.fu@mediatek.com>
 <1617766086-5502-6-git-send-email-flora.fu@mediatek.com>
 <1617805692.253379.3696993.nullmailer@robh.at.kernel.org>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210408_051417_061874_AF5C7E23 
X-CRM114-Status: GOOD (  19.32  )
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

Hi, Rob, 

The error is resulted from some un-merged patch.

Please note that the patch depends MT8192 clock patches which haven't yet been accepted.
https://patchwork.kernel.org/project/linux-mediatek/patch/20210324104110.13383-7-chun-jie.chen@mediatek.com/

Thanks for your review.

On Wed, 2021-04-07 at 09:28 -0500, Rob Herring wrote:
> On Wed, 07 Apr 2021 11:28:03 +0800, Flora Fu wrote:
> > Document the bindings for APU power domain on MediaTek SoC.
> > 
> > Signed-off-by: Flora Fu <flora.fu@mediatek.com>
> > ---
> >  .../soc/mediatek/mediatek,apu-pm.yaml         | 146 ++++++++++++++++++
> >  1 file changed, 146 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/soc/mediatek/mediatek,apu-pm.yaml
> > 
> 
> My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> on your patch (DT_CHECKER_FLAGS is new in v5.13):
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> Documentation/devicetree/bindings/soc/mediatek/mediatek,apu-pm.example.dts:19:18: fatal error: dt-bindings/clock/mt8192-clk.h: No such file or directory
>    19 |         #include <dt-bindings/clock/mt8192-clk.h>
>       |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> compilation terminated.
> make[1]: *** [scripts/Makefile.lib:377: Documentation/devicetree/bindings/soc/mediatek/mediatek,apu-pm.example.dt.yaml] Error 1
> make[1]: *** Waiting for unfinished jobs....
> make: *** [Makefile:1414: dt_binding_check] Error 2
> 
> See https://urldefense.com/v3/__https://patchwork.ozlabs.org/patch/1463115__;!!CTRNKA9wMg0ARbw!0XUn1LcNHfvUShNClpM_yH73TAR9qdm29SZMckasoCQ8UzeKS-vZW0QUu3Ssn-s6$ 
> 
> This check can fail if there are any dependencies. The base for a patch
> series is generally the most recent rc1.
> 
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
> 
> pip3 install dtschema --upgrade
> 
> Please check and re-submit.
> 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
