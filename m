Return-Path: <SRS0=p0H4=GU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81533C433DB
	for <linux-mediatek@archiver.kernel.org>; Sun, 17 Jan 2021 15:46:22 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2340922525
	for <linux-mediatek@archiver.kernel.org>; Sun, 17 Jan 2021 15:46:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2340922525
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:References:In-Reply-To:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SOa7y7DPKqCpFnCbW3w2w3HhYydwIRC8Ty2akBMuafU=; b=QAE1bOj4/SQ/gImAqHsaaVkYrw
	m6iJ8SCl1Y8OVesJ7cV4UxmE43+DI8gYS5R/VRI2fevNcbbyZXrRB8r/GYdWlmaIBExJcOJqvKEwG
	xSW2ymzp4y1WKGTBb1qUea68BooI66QQ3sKf+QXjRSuqzvtFaptRkzJ5pm+MT9QsOch0m2JZAHkLt
	GcoPKg6sG3EIz10YxRUnDqkYm73jLtUyb2eLwVvIOehnvWHbT2yvZ4uvsSYbxkVs72Cd67OBh9Con
	C0Y4M02H5XDErUNwaGfy6bha1EkssWDceK+kyouhdXqLKJZRliEYu/+KUkonIAffilWvWPPIg5+T3
	MxDi2biQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l1AFj-000739-8S; Sun, 17 Jan 2021 15:46:07 +0000
Received: from mail-ot1-f54.google.com ([209.85.210.54])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l1AFe-00072O-H6; Sun, 17 Jan 2021 15:46:04 +0000
Received: by mail-ot1-f54.google.com with SMTP id w3so13801487otp.13;
 Sun, 17 Jan 2021 07:46:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=PTotAZhSSm438Bu/WUQLR5qH93sUEgjylw55X3hmUXw=;
 b=H6dooZcz2ogacvaUyhxIEt3K4Xo/yhIUQG3xcvtUtz0vlN86T9gW2K7BLJ9gYvwXxf
 UQObunsR5zhGBHoqcMkHDauGr4ia46z9GUmx76bLEcOOxPKFL2MBsJwJXdVt80ytJJ/v
 kOE0Mb9myyuiJxKaYCrayxEjQ9FPlgPGaRyx4URYvGdaHVt7GMkLuq+GO99fxRTKx5jN
 X5OW5kre+r1RQtIa1Ec7IYVQXhNhV6ZKAjm320xaepbthVlDFcjdbteBXl/looFaT0CZ
 BIWbtxEchEYjax1mpYfw4TI4SKwRD//DZhnpadNIy7s1K3OpG4mOMmzG+KG30Rrprjsz
 RO2g==
X-Gm-Message-State: AOAM530U1eOF/yREqSPQZJh8Y7xNPYMM/Y+t9VYJG8bPP7PpYexsKTt+
 /mQ9XzXwUNjrmhqYnvlqEiuxVYFOPA==
X-Google-Smtp-Source: ABdhPJxii5/HuMzsbG4NX1Ab/sbfdB1KqtQW/Jhxrz3bTzKk40K1916fc9lOvEWz7PEcUYxqCrUjZQ==
X-Received: by 2002:a9d:8e7:: with SMTP id 94mr15156818otf.93.1610898359938;
 Sun, 17 Jan 2021 07:45:59 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id w129sm2762307oig.23.2021.01.17.07.45.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Jan 2021 07:45:58 -0800 (PST)
Received: (nullmailer pid 1730307 invoked by uid 1000);
 Sun, 17 Jan 2021 15:45:57 -0000
From: Rob Herring <robh@kernel.org>
To: cy_huang <u0084500@gmail.com>
In-Reply-To: <1610720001-15300-2-git-send-email-u0084500@gmail.com>
References: <1610720001-15300-1-git-send-email-u0084500@gmail.com>
 <1610720001-15300-2-git-send-email-u0084500@gmail.com>
Subject: Re: [PATCH 2/2] usb typec: tcpci: mt6360: Add vbus supply into
 dt-binding description
Date: Sun, 17 Jan 2021 09:45:57 -0600
Message-Id: <1610898357.197444.1730305.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210117_104602_587985_C678CF57 
X-CRM114-Status: GOOD (  10.01  )
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
Cc: gene_chen@richtek.com, devicetree@vger.kernel.org,
 heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, cy_huang@richtek.com,
 robh+dt@kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, matthias.bgg@gmail.com,
 linux@roeck-us.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, 15 Jan 2021 22:13:21 +0800, cy_huang wrote:
> From: ChiYuan Huang <cy_huang@richtek.com>
> 
> Add external vbus source into dt-binding description.
> 
> Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
> ---
>  Documentation/devicetree/bindings/usb/mediatek,mt6360-tcpc.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/mediatek,mt6360-tcpc.yaml: properties:vbus-supply: 'maxItems' is not one of ['description', 'deprecated']
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/mediatek,mt6360-tcpc.yaml: ignoring, error in schema: properties: vbus-supply
warning: no schema found in file: ./Documentation/devicetree/bindings/usb/mediatek,mt6360-tcpc.yaml

See https://patchwork.ozlabs.org/patch/1427073

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
