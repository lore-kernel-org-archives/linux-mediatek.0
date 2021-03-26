Return-Path: <SRS0=QnWu=IY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F20DC433DB
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Mar 2021 15:11:24 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 129FC61937
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Mar 2021 15:11:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 129FC61937
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:References:In-Reply-To:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WiGMdEdS4X6KdYCGI3tk3HtMh3LUyu6aavFuwBtY8HA=; b=ggIytoLZU/egh01DsJWGIObsGb
	HHdasmXFk/DVV9viy/9IwRHtohJmIiDRxR86jbWSS36VZjiQnWbsCvN6so6ikbjfiVtqxDI8my1j9
	QnkECxmJA/8F67zBLF/j/91831qbJLSR9EIf036kKLRUZodsQafDYz5A1uLyPvjYkbFzdxO/N04xW
	E2PZGIeYF1xlmrLPPvMDgTMGTa9EyNKod5+Uj7DPmmVOE/h6jhP03bkK2sqlVUn5opB2yD2dFU5ZX
	gvWRFe5LCYckZLoCniOe2z8+69yLB3XNac1ywciq8dnbxXZKTNzb/ID+rDVB+NVCnk7HXnGTMgtFR
	koaCNqWw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lPo7B-003rh4-Nm; Fri, 26 Mar 2021 15:11:09 +0000
Received: from mail-il1-f177.google.com ([209.85.166.177])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lPo71-003rfL-Ns; Fri, 26 Mar 2021 15:11:01 +0000
Received: by mail-il1-f177.google.com with SMTP id 19so5318180ilj.2;
 Fri, 26 Mar 2021 08:10:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=V6kxHAMFGHc90myISo6VM6ueaBvRJahf0rAQgZck3Fs=;
 b=nJz39DJteaNfUOeaaEEMlVtMmIHyUHg5kwirReAHR661vtnHCBj4BkRXFLl1nnOjLn
 IC3Nerp7FoRwRVS++qyu/vGA6F4E99uQ+rRSH67/MIeUCs2cthG7cWkg+eOKAT5FbSJ9
 7H+MGVdTibnW9LwX8O7gN1pUt83kqJeZ2LABbfowP4HZ62ffGHJOXG1mX/pZosYMqfld
 sVdspFYAI4soHc4j5xDzEsCGrs2jTGFQvqC5OLOMNIo7qAxjT5cIXvSFCtmcP3p9284G
 5pXt/D7ih86fqkn06tUMRNE2kUA28ZqsVy5RHWzCArk4X4j31yXWIZi1BlyImKc6bOSH
 snAQ==
X-Gm-Message-State: AOAM533X3rKxbTJnzkFOp0ElkEA6MWXPb4lc2Gb0eg1260cRmfpBm2kA
 11wN/jgO08P9AogygjRixQ==
X-Google-Smtp-Source: ABdhPJyStqL3NEZY7qbA5kS67RsQZxAe37NEbUFsqr6MXsMcQqzUF92vBsQzYpDKLriZ49f0Rmz3wQ==
X-Received: by 2002:a92:c56f:: with SMTP id b15mr10756598ilj.41.1616771458456; 
 Fri, 26 Mar 2021 08:10:58 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id l14sm2530159ilj.14.2021.03.26.08.10.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Mar 2021 08:10:57 -0700 (PDT)
Received: (nullmailer pid 3384057 invoked by uid 1000);
 Fri, 26 Mar 2021 15:10:54 -0000
From: Rob Herring <robh@kernel.org>
To: Nina Wu <nina-cm.wu@mediatek.com>
Cc: devicetree@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org, Zhen Lei <thunder.leizhen@huawei.com>,
 srv_heupstream@mediatek.com, linux-mediatek@lists.infradead.org,
 Neal Liu <neal.liu@mediatek.com>, Nina Wu <Nina-CM.Wu@mediatek.com>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Jackson-kt.Chang@mediatek.com
In-Reply-To: <1616743871-8087-1-git-send-email-nina-cm.wu@mediatek.com>
References: <1616743871-8087-1-git-send-email-nina-cm.wu@mediatek.com>
Subject: Re: [PATCH 1/2] dt-bindings: devapc: Update bindings
Date: Fri, 26 Mar 2021 09:10:54 -0600
Message-Id: <1616771454.300082.3384056.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210326_151059_896604_38475B87 
X-CRM114-Status: GOOD (  12.70  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, 26 Mar 2021 15:31:10 +0800, Nina Wu wrote:
> From: Nina Wu <Nina-CM.Wu@mediatek.com>
> 
> To support newer hardware architecture of devapc,
> update device tree bindings.
> 
> Signed-off-by: Nina Wu <Nina-CM.Wu@mediatek.com>
> ---
>  .../devicetree/bindings/soc/mediatek/devapc.yaml   | 41 ++++++++++++++++++++++
>  1 file changed, 41 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/soc/mediatek/devapc.yaml: properties:version:enum: False schema does not allow [1, 2]
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/soc/mediatek/devapc.yaml: properties:slave_type_num:enum: False schema does not allow [1, 4]
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/soc/mediatek/devapc.yaml: ignoring, error in schema: properties: slave_type_num: enum
warning: no schema found in file: ./Documentation/devicetree/bindings/soc/mediatek/devapc.yaml
Documentation/devicetree/bindings/soc/mediatek/devapc.example.dts:51:18: fatal error: dt-bindings/clock/mt8192-clk.h: No such file or directory
   51 |         #include <dt-bindings/clock/mt8192-clk.h>
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[1]: *** [scripts/Makefile.lib:349: Documentation/devicetree/bindings/soc/mediatek/devapc.example.dt.yaml] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1380: dt_binding_check] Error 2

See https://patchwork.ozlabs.org/patch/1458687

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
