Return-Path: <SRS0=SIUT=F3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2308C433E0
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Dec 2020 17:48:23 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6AA84207D2
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Dec 2020 17:48:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6AA84207D2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:References:In-Reply-To:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Awu4bIKKLw3ntCYkIbA06SimqlBHaYiO3x7lhIVo9lg=; b=b5FgR8fRACEAPDWv31QVrD6D3Z
	XngT5+Y3QAqUEpRg3+f/LKRCu+BPYveIdW0ezlN2ymNnhTppcewNR1JNgBfrGawrLlBNi8Ecwfar0
	MiLOlDMSfn8nXE5z09sPTog3VHgOOpfhKNMDuTUzGQcbFSoCZpGyGtSPMzXBmOqoDeizobNtPXOlR
	mSSXZuPaiEGj502VvgIsXICV1WmsUPDx+4oV1IBl1L+AzFx31u9r0V2bBq5u5l+wb6hQxoxo5jeUG
	LyMQrnS+0KqqjwILb2d8VwmMTb9y8iVkUOB7VKrAkBv/yBW/bmRKONVvm1t3JBiQwBLGW+uAbjjpl
	+9YKislw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ks8F6-0003jd-VH; Wed, 23 Dec 2020 17:48:09 +0000
Received: from mail-ot1-f44.google.com ([209.85.210.44])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ks8F4-0003i3-GN; Wed, 23 Dec 2020 17:48:07 +0000
Received: by mail-ot1-f44.google.com with SMTP id b24so15723360otj.0;
 Wed, 23 Dec 2020 09:48:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=K5Yix/37ki3dCZFopkSSkjKG5evvMj86JkeiVkAJ78g=;
 b=OPL5Y3c0r68dBaRY39mdFgMITJI4O+0iUFnboGeSHc35QXDNE1XvaeysO3jQWIj/IP
 yAZM0e55nnU3HxBa1zTB59p9tH7B7gSdYtRFntfnoglRo/z/GCgvaxwtkuuYBl0V8zjC
 gG280eQwJ582gwZmzwIcrvIy9dhu15LzQFhYw2llHPRSsiKHBT7u9wJTk9A736O2REXY
 H3s1mjdhQ1QJCVsnB/4mUemiDSgUMOUW13KGovB/wktDaBHxRCvnP2ckmFx8ZwA+ptX4
 M+8twZdPAqiHvsxXUo5aKbSG3yAeXU3mcooBGqIg+HnQRb5MZaVfA4pd5IB5Ck/2mham
 Ussg==
X-Gm-Message-State: AOAM533qtfHVmYHbZP49uiOGonZv8BxPp6yv++0LyIu7vyRAnCpJycu9
 UIByvmqhz/WEE36j0NNN1Q==
X-Google-Smtp-Source: ABdhPJwwkIwBeMc0P36eD46ujc2g7Yxv3OUhQoIQbvvQcZl95unXLd2lLce2YlPC5c6HviQS6uif0g==
X-Received: by 2002:a9d:640b:: with SMTP id h11mr8626511otl.224.1608745683770; 
 Wed, 23 Dec 2020 09:48:03 -0800 (PST)
Received: from robh.at.kernel.org ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id j10sm5938165otn.63.2020.12.23.09.48.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Dec 2020 09:48:03 -0800 (PST)
Received: (nullmailer pid 762424 invoked by uid 1000);
 Wed, 23 Dec 2020 17:47:58 -0000
From: Rob Herring <robh@kernel.org>
To: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
In-Reply-To: <1608691469-20919-2-git-send-email-hsin-hsiung.wang@mediatek.com>
References: <1608691469-20919-1-git-send-email-hsin-hsiung.wang@mediatek.com>
 <1608691469-20919-2-git-send-email-hsin-hsiung.wang@mediatek.com>
Subject: Re: [PATCH v5 1/4] dt-bindings: spmi: modify the constraint
 'maxItems' to 'minItems'
Date: Wed, 23 Dec 2020 10:47:58 -0700
Message-Id: <1608745678.788845.762423.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201223_124806_552011_6164B880 
X-CRM114-Status: GOOD (  15.34  )
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
Cc: devicetree@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>, srv_heupstream@mediatek.com,
 Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, 23 Dec 2020 10:44:26 +0800, Hsin-Hsiung Wang wrote:
> The constraint of 'maxItem: 1' might be larger than 1, so we modify it
> to 'minItem: 0'.
> 
> Signed-off-by: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
> ---
>  Documentation/devicetree/bindings/spmi/spmi.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/spmi/spmi.yaml: properties:reg: 'anyOf' conditional failed, one must be fixed:
	'maxItems' is a required property
	/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/spmi/spmi.yaml: properties:reg: 'oneOf' conditional failed, one must be fixed:
		'minItems' is not one of ['maxItems']
		'minItems' is not one of ['description', 'deprecated', 'const', 'enum', 'minimum', 'maximum', 'default', '$ref']
	0 is less than the minimum of 1
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/spmi/spmi.yaml: ignoring, error in schema: properties: reg
warning: no schema found in file: ./Documentation/devicetree/bindings/spmi/spmi.yaml

See https://patchwork.ozlabs.org/patch/1419575

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
