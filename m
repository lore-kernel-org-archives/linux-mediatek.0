Return-Path: <SRS0=ZAsA=HL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74189C433DB
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Feb 2021 01:00:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 236D664E99
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Feb 2021 01:00:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 236D664E99
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:Date:To:From:Subject:References:
	In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=r4ZyGWe8PB4zCqDEUoo8P6Eq/Zl17h25sV1UNdXRHjE=; b=sCw7EIFR9adQKYoPvZSG7W/8I
	R4Byep7qOzxq60P6jppD468T9B/wVsrTQNLjcLBGq9NbeqmBt6hmWPsO7/xI+7XH72SX2JQ+/dRJV
	6ms7JgCVRyIXhsn4ZTBVJg0AZLOHznoYCmmpF/yComD/YbRrHovhWHNlSbvewrVCgvaCNhcfPuE8D
	I6zyCvn9cMeC3NjCX2mDO4NCcA8zB/zsdAKbT30XPlK57S5HUSMXQd6w1rUjekCtHwuuyzrRdTD/H
	KkiIKN/LNFE4YF5xDieaV3NFvbT+y+6jSapRMXGobSNZ+jmYkSi1Rw9X/fHgcNLK6dQlnQaCf2/YV
	Kg+iYgiUQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9HOI-0003AZ-8W; Tue, 09 Feb 2021 01:00:30 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9HOC-00039p-RX; Tue, 09 Feb 2021 01:00:26 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id DD97D64E82;
 Tue,  9 Feb 2021 01:00:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612832424;
 bh=UDSESf14eWwyek98rHiUGI62NeiqsgkXvT/7JO82Zh4=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=gfmCBSDFURnGxtwgPqYhwY0MArgo4OEAiUu7c3UtPSPXw1SbENqV+aYlMJ37jcS20
 8q1Db3B4Fvwf72Hp55CYsNCegqSNRSoKUbtLJjP7+ViGhw3S3KmpTNeyAGsJxPbAm1
 b6RR07C6CNO7JJVD9O1v8CKkpZDAxdcJf7zEWoaluyUj72agSlVmPChz3WwXYZ5moV
 2/lcwLI1WP5ZwTpX0/bFY0xdCzpsiGkDM28xU8KAKiBl2Smumo1NBUQ6R+PcGsGlbi
 opopEIrY52RaFCwDYscci6Plv8FMllJ4vYM0xqmykSTClQDGG/CoP2/9rTasLFKa0f
 4heHLks0C47Xg==
MIME-Version: 1.0
In-Reply-To: <1608642587-15634-1-git-send-email-weiyi.lu@mediatek.com>
References: <1608642587-15634-1-git-send-email-weiyi.lu@mediatek.com>
Subject: Re: [PATCH v6 00/22] Mediatek MT8192 clock support
From: Stephen Boyd <sboyd@kernel.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
 Nicolas Boichat <drinkcat@chromium.org>, Rob Herring <robh@kernel.org>,
 Weiyi Lu <weiyi.lu@mediatek.com>
Date: Mon, 08 Feb 2021 17:00:22 -0800
Message-ID: <161283242250.76967.15026468818750276885@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210208_200025_903200_8D91356B 
X-CRM114-Status: UNSURE (   6.48  )
X-CRM114-Notice: Please train this message.
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
Cc: Weiyi Lu <weiyi.lu@mediatek.com>, srv_heupstream@mediatek.com,
 linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Quoting Weiyi Lu (2020-12-22 05:09:25)
> This series is based on v5.10-rc1.
> 

The DT bindings fail, can you fix and resend?

Documentation/devicetree/bindings/arm/mediatek/mediatek,msdc.yaml: 'additionalProperties' is a required property
Documentation/devicetree/bindings/arm/mediatek/mediatek,imp_iic_wrap.yaml: 'additionalProperties' is a required property
Documentation/devicetree/bindings/arm/mediatek/mediatek,mdpsys.yaml: 'additionalProperties' is a required property
Documentation/devicetree/bindings/arm/mediatek/mediatek,scp-adsp.yaml: 'additionalProperties' is a required property
Documentation/devicetree/bindings/arm/mediatek/mediatek,msdc.yaml: ignoring, error in schema:
warning: no schema found in file: Documentation/devicetree/bindings/arm/mediatek/mediatek,msdc.yaml
Documentation/devicetree/bindings/arm/mediatek/mediatek,imp_iic_wrap.yaml: ignoring, error in schema:
warning: no schema found in file: Documentation/devicetree/bindings/arm/mediatek/mediatek,imp_iic_wrap.yaml
Documentation/devicetree/bindings/arm/mediatek/mediatek,mdpsys.yaml: ignoring, error in schema:
warning: no schema found in file: Documentation/devicetree/bindings/arm/mediatek/mediatek,mdpsys.yaml
Documentation/devicetree/bindings/arm/mediatek/mediatek,scp-adsp.yaml: ignoring, error in schema:
warning: no schema found in file: Documentation/devicetree/bindings/arm/mediatek/mediatek,scp-adsp.yaml
Documentation/devicetree/bindings/arm/mediatek/mediatek,msdc.example.dt.yaml: example-0: syscon@11f60000:reg:0: [0, 301334528, 0, 4096] is too long
        From schema: ~/.local/lib/python3.8/site-packages/dtschema/schemas/reg.yaml
Documentation/devicetree/bindings/arm/mediatek/mediatek,msdc.example.dt.yaml: example-1: syscon@11f10000:reg:0: [0, 301006848, 0, 4096] is too long
        From schema: ~/.local/lib/python3.8/site-packages/dtschema/schemas/reg.yaml
Documentation/devicetree/bindings/arm/mediatek/mediatek,mdpsys.example.dt.yaml: example-0: syscon@1f000000:reg:0: [0, 520093696, 0, 4096] is too long
        From schema: ~/.local/lib/python3.8/site-packages/dtschema/schemas/reg.yaml
Documentation/devicetree/bindings/arm/mediatek/mediatek,imp_iic_wrap.example.dt.yaml: example-0: syscon@11007000:reg:0: [0, 285241344, 0, 4096] is too long
        From schema: ~/.local/lib/python3.8/site-packages/dtschema/schemas/reg.yaml
Documentation/devicetree/bindings/arm/mediatek/mediatek,imp_iic_wrap.example.dt.yaml: example-1: syscon@11cb1000:reg:0: [0, 298520576, 0, 4096] is too long
        From schema: ~/.local/lib/python3.8/site-packages/dtschema/schemas/reg.yaml
Documentation/devicetree/bindings/arm/mediatek/mediatek,imp_iic_wrap.example.dt.yaml: example-2: syscon@11d03000:reg:0: [0, 298856448, 0, 4096] is too long
        From schema: ~/.local/lib/python3.8/site-packages/dtschema/schemas/reg.yaml
Documentation/devicetree/bindings/arm/mediatek/mediatek,imp_iic_wrap.example.dt.yaml: example-3: syscon@11d23000:reg:0: [0, 298987520, 0, 4096] is too long
        From schema: ~/.local/lib/python3.8/site-packages/dtschema/schemas/reg.yaml
Documentation/devicetree/bindings/arm/mediatek/mediatek,imp_iic_wrap.example.dt.yaml: example-4: syscon@11e01000:reg:0: [0, 299896832, 0, 4096] is too long
        From schema: ~/.local/lib/python3.8/site-packages/dtschema/schemas/reg.yaml
Documentation/devicetree/bindings/arm/mediatek/mediatek,imp_iic_wrap.example.dt.yaml: example-5: syscon@11f02000:reg:0: [0, 300949504, 0, 4096] is too long
        From schema: ~/.local/lib/python3.8/site-packages/dtschema/schemas/reg.yaml

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
