Return-Path: <SRS0=SIUT=F3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2C31C433E6
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Dec 2020 17:48:24 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3CE6C2226A
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Dec 2020 17:48:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3CE6C2226A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:References:In-Reply-To:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xdB6ODrQ+x8cC2ft3uB2hYlxi6QVFmPOy21yvTph5NE=; b=mcdb2d9dhvWUmDJ0AKorBX44b1
	KtItNxmW3QFnuJ9etnKDM+jracyUvvUsMyiB9Bo9ewaeBkl8NAKYO8T/FfSWFYUydQNw3kz5VQJLb
	hwKEk2b2lgj+t1kF9TuP6AzAneKGeAuHkNvxlbE58ZFWa53A/HApP6NWFNx0Vyy6YxTZvkGTF180q
	tT8PtiabeWzkTVfEReyZGhx0egt5pkBw8N0RCdrhMELXD2JgNz69hvxfhXhu5AiE7K+3vAbEecR1D
	AzpKkEXTYFJoC3YrQrDDqpSMXJiAgokvEJ2QfVbEUsIgAgv9cu7m+4PtxoKuyKIHXsTTgq8e9skaQ
	nIA2ZswQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ks8FC-0003ls-29; Wed, 23 Dec 2020 17:48:14 +0000
Received: from mail-oi1-f182.google.com ([209.85.167.182])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ks8F4-0003ip-TV; Wed, 23 Dec 2020 17:48:07 +0000
Received: by mail-oi1-f182.google.com with SMTP id d189so18974806oig.11;
 Wed, 23 Dec 2020 09:48:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=Rr0nFPN4p679DDLwTxYppXUC5EeCz59OFolArwEDGvA=;
 b=ZEvieAt213Ixn7SLCT4FCmyspp8TkIAlc9g+gB5liniC6e3YoUJT9MVBMB5A5n5Fnc
 3vJh0DpGgJb94E4eZggxplmEL4lPEapFCVNXdfHYqSEtbQsw6d0CbIEWfmJuEGhdpYE+
 uIabEuxuCiXPWU9A+QuOi0wZJV0OHHYxtU5Y9tqJrkVJZ10ub3Wmx6b2xfzObwXmdgnH
 L5ESxAVcjfXtt5l7Q10nLDBS3rtxTIhsxfNf1iRhROCxYvdVDqsHXtvEdwP6Q6fwQdrV
 vb2lEV1kbm7hqdPbi7uXThI6u0ika2RnBN2LZ1w6A7/kvc/EhUxJHXIwxyJF2gKNHJ8h
 wJiw==
X-Gm-Message-State: AOAM533CllGzetdrjLkhs3nkHlHMzvwkjvqzzpREQtzxths+l2X/U3fk
 /ZEyZuPZWn73aJooIxfwAw==
X-Google-Smtp-Source: ABdhPJzBfy3Rah3zT1dynIO7KbDETi5PrZXKk2R+7VmVrYFEp6Y3VNVAsZVTj3UpT9omPZJ8aEIW9Q==
X-Received: by 2002:a05:6808:1a:: with SMTP id u26mr624430oic.77.1608745686107; 
 Wed, 23 Dec 2020 09:48:06 -0800 (PST)
Received: from robh.at.kernel.org ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id g21sm5656666otj.77.2020.12.23.09.48.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Dec 2020 09:48:05 -0800 (PST)
Received: (nullmailer pid 762428 invoked by uid 1000);
 Wed, 23 Dec 2020 17:47:58 -0000
From: Rob Herring <robh@kernel.org>
To: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
In-Reply-To: <1608725624-30594-2-git-send-email-hsin-hsiung.wang@mediatek.com>
References: <1608725624-30594-1-git-send-email-hsin-hsiung.wang@mediatek.com>
 <1608725624-30594-2-git-send-email-hsin-hsiung.wang@mediatek.com>
Subject: Re: [PATCH v3 1/3] dt-bindings: regulator: document binding for
 MT6315 regulator
Date: Wed, 23 Dec 2020 10:47:58 -0700
Message-Id: <1608745678.803844.762427.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201223_124806_972829_F8031B35 
X-CRM114-Status: GOOD (  12.51  )
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
Cc: devicetree@vger.kernel.org, drinkcat@chromium.org,
 srv_heupstream@mediatek.com, Mark Brown <broonie@kernel.org>,
 linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, 23 Dec 2020 20:13:42 +0800, Hsin-Hsiung Wang wrote:
> Add device tree binding information for MT6315 regulator driver.
> Example bindings for MT6315 are added.
> 
> Signed-off-by: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
> ---
>  .../bindings/regulator/mt6315-regulator.yaml  | 71 +++++++++++++++++++
>  1 file changed, 71 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/regulator/mt6315-regulator.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
./Documentation/devicetree/bindings/regulator/mt6315-regulator.yaml: $id: relative path/filename doesn't match actual path or filename
	expected: http://devicetree.org/schemas/regulator/mt6315-regulator.yaml#
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/regulator/mt6315-regulator.example.dt.yaml: example-0: pmic@6:reg:0: [6, 0, 11, 1] is too long
	From schema: /usr/local/lib/python3.8/dist-packages/dtschema/schemas/reg.yaml

See https://patchwork.ozlabs.org/patch/1420117

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
