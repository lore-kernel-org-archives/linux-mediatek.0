Return-Path: <SRS0=w+BI=HU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22A63C433E0
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Feb 2021 01:26:05 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BA18364E15
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Feb 2021 01:26:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BA18364E15
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=STfQ8aHFYXbTwvgv2P/y5/rGyoVsZPvSHsONxIZT/r0=; b=Dz2ZmlfrDHlLbLMPz4y7zlDws
	5iQbWQ0MGUxKEJJvB9STDt3AG7aW4KGsxZaVh+7ZetY9hOJeo4/DqI9qCcjrtt+FGdlKk93T27nuA
	Q2pLQTw0hUZEeXPrnfoPuagFHDGbzGvD6CKN9K8oc3666cBtbm9Au4iBRCD0ERDIexMU54vJg8c+l
	dsYvGJTDBZfMnJ+3f8c8xiXou1QiaKt8nYkwCNDciAydQ1hoIIoATYOC9JtPBof12aU7v6GmWFrpH
	nO9YzYI5+sxryBiBjdDCLAVXOtzjzHO+3IelUcLjz2Jah9iTrd3S2LLoJl2PM4GcUpAeKDcBj7DV0
	cXXIuFj8g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lCY4i-00037o-Qn; Thu, 18 Feb 2021 01:25:48 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lCY4f-00036p-Hf; Thu, 18 Feb 2021 01:25:47 +0000
X-UUID: e1ff4f15308243c9954d854dc94a57c0-20210217
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=zUPZ2aJmFI9QcMLgtweqxZvlkzc1wFncpS87E7I4qH8=; 
 b=j19ZM6ErzZTSuwarDLGKz9UjVZutgqS6WLrfzhoJBdGt/LeJIZ0kdW/QC0t6O6zqZvl8UsiJdCwWCn7HXn4HfpcAbpYZdQzMKCQPusONBFOcg216NOvKhENSN8aQOBFg1O8xX9qHdBOw4iaKMMCJwTeyMX+X26t21tkwAqmtkU8=;
X-UUID: e1ff4f15308243c9954d854dc94a57c0-20210217
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <weiyi.lu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 45124578; Wed, 17 Feb 2021 17:25:37 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 17 Feb 2021 17:25:36 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 18 Feb 2021 09:25:34 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 18 Feb 2021 09:25:34 +0800
Message-ID: <1613611534.10714.1.camel@mtksdaap41>
Subject: Re: [PATCH v6 00/22] Mediatek MT8192 clock support
From: Weiyi Lu <weiyi.lu@mediatek.com>
To: Stephen Boyd <sboyd@kernel.org>
Date: Thu, 18 Feb 2021 09:25:34 +0800
In-Reply-To: <161283242250.76967.15026468818750276885@swboyd.mtv.corp.google.com>
References: <1608642587-15634-1-git-send-email-weiyi.lu@mediatek.com>
 <161283242250.76967.15026468818750276885@swboyd.mtv.corp.google.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210217_202545_808724_A51A2EC9 
X-CRM114-Status: GOOD (  13.37  )
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
Cc: Rob Herring <robh@kernel.org>, Nicolas Boichat <drinkcat@chromium.org>,
 srv_heupstream@mediatek.com, linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, 2021-02-08 at 17:00 -0800, Stephen Boyd wrote:
> Quoting Weiyi Lu (2020-12-22 05:09:25)
> > This series is based on v5.10-rc1.
> > 
> 
> The DT bindings fail, can you fix and resend?
> 

OK, I'll fix and resend. Thank you for reviewing.

> Documentation/devicetree/bindings/arm/mediatek/mediatek,msdc.yaml: 'additionalProperties' is a required property
> Documentation/devicetree/bindings/arm/mediatek/mediatek,imp_iic_wrap.yaml: 'additionalProperties' is a required property
> Documentation/devicetree/bindings/arm/mediatek/mediatek,mdpsys.yaml: 'additionalProperties' is a required property
> Documentation/devicetree/bindings/arm/mediatek/mediatek,scp-adsp.yaml: 'additionalProperties' is a required property
> Documentation/devicetree/bindings/arm/mediatek/mediatek,msdc.yaml: ignoring, error in schema:
> warning: no schema found in file: Documentation/devicetree/bindings/arm/mediatek/mediatek,msdc.yaml
> Documentation/devicetree/bindings/arm/mediatek/mediatek,imp_iic_wrap.yaml: ignoring, error in schema:
> warning: no schema found in file: Documentation/devicetree/bindings/arm/mediatek/mediatek,imp_iic_wrap.yaml
> Documentation/devicetree/bindings/arm/mediatek/mediatek,mdpsys.yaml: ignoring, error in schema:
> warning: no schema found in file: Documentation/devicetree/bindings/arm/mediatek/mediatek,mdpsys.yaml
> Documentation/devicetree/bindings/arm/mediatek/mediatek,scp-adsp.yaml: ignoring, error in schema:
> warning: no schema found in file: Documentation/devicetree/bindings/arm/mediatek/mediatek,scp-adsp.yaml
> Documentation/devicetree/bindings/arm/mediatek/mediatek,msdc.example.dt.yaml: example-0: syscon@11f60000:reg:0: [0, 301334528, 0, 4096] is too long
>         From schema: ~/.local/lib/python3.8/site-packages/dtschema/schemas/reg.yaml
> Documentation/devicetree/bindings/arm/mediatek/mediatek,msdc.example.dt.yaml: example-1: syscon@11f10000:reg:0: [0, 301006848, 0, 4096] is too long
>         From schema: ~/.local/lib/python3.8/site-packages/dtschema/schemas/reg.yaml
> Documentation/devicetree/bindings/arm/mediatek/mediatek,mdpsys.example.dt.yaml: example-0: syscon@1f000000:reg:0: [0, 520093696, 0, 4096] is too long
>         From schema: ~/.local/lib/python3.8/site-packages/dtschema/schemas/reg.yaml
> Documentation/devicetree/bindings/arm/mediatek/mediatek,imp_iic_wrap.example.dt.yaml: example-0: syscon@11007000:reg:0: [0, 285241344, 0, 4096] is too long
>         From schema: ~/.local/lib/python3.8/site-packages/dtschema/schemas/reg.yaml
> Documentation/devicetree/bindings/arm/mediatek/mediatek,imp_iic_wrap.example.dt.yaml: example-1: syscon@11cb1000:reg:0: [0, 298520576, 0, 4096] is too long
>         From schema: ~/.local/lib/python3.8/site-packages/dtschema/schemas/reg.yaml
> Documentation/devicetree/bindings/arm/mediatek/mediatek,imp_iic_wrap.example.dt.yaml: example-2: syscon@11d03000:reg:0: [0, 298856448, 0, 4096] is too long
>         From schema: ~/.local/lib/python3.8/site-packages/dtschema/schemas/reg.yaml
> Documentation/devicetree/bindings/arm/mediatek/mediatek,imp_iic_wrap.example.dt.yaml: example-3: syscon@11d23000:reg:0: [0, 298987520, 0, 4096] is too long
>         From schema: ~/.local/lib/python3.8/site-packages/dtschema/schemas/reg.yaml
> Documentation/devicetree/bindings/arm/mediatek/mediatek,imp_iic_wrap.example.dt.yaml: example-4: syscon@11e01000:reg:0: [0, 299896832, 0, 4096] is too long
>         From schema: ~/.local/lib/python3.8/site-packages/dtschema/schemas/reg.yaml
> Documentation/devicetree/bindings/arm/mediatek/mediatek,imp_iic_wrap.example.dt.yaml: example-5: syscon@11f02000:reg:0: [0, 300949504, 0, 4096] is too long
>         From schema: ~/.local/lib/python3.8/site-packages/dtschema/schemas/reg.yaml
> 
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
