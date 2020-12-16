Return-Path: <SRS0=oKwZ=FU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92E4FC4361B
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Dec 2020 14:04:06 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 21F5220657
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Dec 2020 14:04:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 21F5220657
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:References:In-Reply-To:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Km2jnML6njFmk5a6UW6kNzD/XQcJmFW31eOhX6L1vUM=; b=tCf0aIZy5XUUmnODljNaLBQ0fE
	wsH7PIVoPOdzRTbUOWrJwQEbIZfPKjrEU34XN6SlR+kprYsMIbOicO98yVbSg8c+6midR8Az6/p/s
	U63xulH5m5rKPixmKIVHhmrl9EsTsSJ3U25Jx0XIMP14v/E9JipCKCPz/zRRAgH9kyO6QY1oHrhxP
	zeb6JjtyXpoUKkrXGJ/WO/1gmr32UWXlrpIuvrhYNMq063ckAYpbzfllPcqqpMKiD3xz04vkS3VJw
	ODRWGyV4+WVgYMcWL81Pk76CfuqxE+GTEJdY1kLpaKH27eMrVxAzcB00+BsYfE5g/kkUAGYc5KnTc
	4WxSz3ng==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kpXPF-0005Le-C3; Wed, 16 Dec 2020 14:03:53 +0000
Received: from mail-ot1-f52.google.com ([209.85.210.52])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kpXPB-0005Kf-P1; Wed, 16 Dec 2020 14:03:50 +0000
Received: by mail-ot1-f52.google.com with SMTP id w3so22958083otp.13;
 Wed, 16 Dec 2020 06:03:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=TfpHVaBEEhYcbR1qu9fWE/7+sLFaSTXgax6byjyN7e0=;
 b=ZxftFKy2732xBijuC4pGVbeeRP6npkh0kxlEINQaMebW1AJt7a02U4bBRKaw81nMwP
 ufTov2f3lUKRje2db3N36kBY7NZXc+A9Jban9g2I+TJBUjiOvoQe9uxAKhz5Bkoz07JK
 vFYADUOCTcwhTqr45RsB0naUGPJh50mAonXp48VgwJcOqrPuSlyPvAeTRYGNU/ZvSonv
 rfKmLHmJh6f/1yqIc/JKpSyvNvwAZZV6FJpU+p50ARHeI88fnso8KtBvg5xfa/Q8CR3e
 +6qQLvCkMvuYL09+YnuiGM8RRiEri0IFr+0t8/EP9+A/b0cW8PYzIbTXES3YYWeSYf+f
 F8/w==
X-Gm-Message-State: AOAM530hOJ1vH5RYh21DlxaMrvRnVoYyyrFOd5SijRyAJY48EgCnVLcH
 H9bTx8djIllvEfXmLNHfXQ==
X-Google-Smtp-Source: ABdhPJywCgAqv1oEd87elIYqW5iKCekTwX0/J4yFNgA4SNmfklSlJdtTRtYsMZ6wKRPTE5A55vhstQ==
X-Received: by 2002:a9d:650a:: with SMTP id i10mr14599407otl.341.1608127428406; 
 Wed, 16 Dec 2020 06:03:48 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id t18sm438770otc.64.2020.12.16.06.03.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Dec 2020 06:03:47 -0800 (PST)
Received: (nullmailer pid 1817444 invoked by uid 1000);
 Wed, 16 Dec 2020 14:03:46 -0000
From: Rob Herring <robh@kernel.org>
To: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
In-Reply-To: <1608104827-7937-5-git-send-email-hsin-hsiung.wang@mediatek.com>
References: <1608104827-7937-1-git-send-email-hsin-hsiung.wang@mediatek.com>
 <1608104827-7937-5-git-send-email-hsin-hsiung.wang@mediatek.com>
Subject: Re: [PATCH v4 4/9] dt-bindings: regulator: Add document for MT6359
 regulator
Date: Wed, 16 Dec 2020 08:03:46 -0600
Message-Id: <1608127426.112276.1817443.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201216_090349_841226_6615A40B 
X-CRM114-Status: GOOD (  12.39  )
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
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Sean Wang <sean.wang@mediatek.com>, srv_heupstream@mediatek.com,
 Alessandro Zummo <a.zummo@towertech.it>, Ran Bi <ran.bi@mediatek.com>,
 Fei Shao <fshao@chromium.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Eddie Huang <eddie.huang@mediatek.com>, Lee Jones <lee.jones@linaro.org>,
 Yuchen Huang <yuchen.huang@mediatek.com>, linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, 16 Dec 2020 15:47:02 +0800, Hsin-Hsiung Wang wrote:
> add dt-binding document for MediaTek MT6359 PMIC
> 
> Signed-off-by: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
> ---
>  .../bindings/regulator/mt6359-regulator.yaml  | 169 ++++++++++++++++++
>  1 file changed, 169 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/regulator/mt6359-regulator.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/regulator/mt6359-regulator.yaml: 'additionalProperties' is a required property
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/regulator/mt6359-regulator.yaml: ignoring, error in schema: 
warning: no schema found in file: ./Documentation/devicetree/bindings/regulator/mt6359-regulator.yaml

See https://patchwork.ozlabs.org/patch/1416913

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
