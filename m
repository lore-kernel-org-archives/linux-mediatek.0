Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 112AAC6FA8E
	for <linux-mediatek@archiver.kernel.org>; Sun, 26 Feb 2023 18:38:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KapxYTomvu59mWLVr5fqDVRnfE034d9Qe/O0kjHGyo4=; b=m51+LOIRo1tg9BzjAQ4nsUKqjV
	AsXC7uDJlf1XugpsnOdoOD+kgH7KFY3mpoZfyjFzcO3/uqJ1sL+s9EkLvdpAV2hQraHU+6Hrx7q3f
	UMeDlutSeV6C1cV4RzGWyIBjlkGVp4wQy8K8k8VyxQMBanYh3MV0NWKtCbbJPGI5QseG8P5JthW1B
	jPrIapall0johF9t75bSDct7t7heUKBeGR9ViXcAjg9SOvsmlRSZtkhfifmi3otqNxGTQ4AzvEKFb
	rVP1yO1302gIQnPmulh1WWMcwCi39tBZK1yeAz7Jp6TyD3zcb/YYjD6HY49+IF70nWfd/kLQkvBsN
	AYVjUyyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWLv3-007jIi-HE; Sun, 26 Feb 2023 18:38:45 +0000
Received: from mail-il1-f175.google.com ([209.85.166.175])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWLv0-007jHs-TI; Sun, 26 Feb 2023 18:38:44 +0000
Received: by mail-il1-f175.google.com with SMTP id y14so777517ilv.4;
        Sun, 26 Feb 2023 10:38:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KapxYTomvu59mWLVr5fqDVRnfE034d9Qe/O0kjHGyo4=;
        b=olhhIXYmEUDElXbfpeP3b9c2pwv/qHgoBE9zEoO9cCP1/kk845ftXvLiVsCPNWaRn5
         YVbfoYvev6sxmPokpoZVUe5oWU+MaDyHFFlBi92wW3NaWkNDHlJTsWIb6Y4KCy+ZWfsa
         yRK3+5Jir1gDH3svM4IUkSEALmGUncdfCwPnwK0A5hVKO/e5PW2uT1gC+9EVWukq8ZSn
         OvlfqLaGFjrBHcAtwu1Af2gXHOAlRnT7d8BcOGGqRziFhmMJjRBfDzLb7Ox9SShCLNkk
         OlZ2I7FdXySh2N78sKezllTrPc2abonXDQaJyshNzuYo8SYdyrxjk5VGL6eOYVK+ZGpo
         eHKQ==
X-Gm-Message-State: AO0yUKWN7wCqWnwVOprxRt+Ng/EobIcAW/WbUmzVIXYx4RKpk1qDW7Pe
	8cmHbpR9TNx0ZuZ7N5Ucl3uIcMDLDA==
X-Google-Smtp-Source: AK7set9n8DDNpC4hB74xJ2JU8XjS3anvJsTrFcA7XhlUG3DTjyhpdQ6KB4JcJ7bzRMeGVlwepczC/A==
X-Received: by 2002:a92:cd89:0:b0:314:f7f:a35a with SMTP id r9-20020a92cd89000000b003140f7fa35amr19991705ilb.7.1677436719547;
        Sun, 26 Feb 2023 10:38:39 -0800 (PST)
Received: from robh_at_kernel.org ([2605:ef80:8069:8ddf:ff6b:c94c:94fd:4442])
        by smtp.gmail.com with ESMTPSA id y21-20020a02bb15000000b003acfdc75a53sm1547986jan.48.2023.02.26.10.38.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Feb 2023 10:38:39 -0800 (PST)
Received: (nullmailer pid 150130 invoked by uid 1000);
	Sun, 26 Feb 2023 18:38:28 -0000
Date: Sun, 26 Feb 2023 12:38:28 -0600
From: Rob Herring <robh@kernel.org>
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Masami Hiramatsu <mhiramat@kernel.org>, devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-kernel@vger.kernel.org, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH V3 1/2] dt-bindings: nvmem: mmio: new binding for MMIO
 accessible NVMEM devices
Message-ID: <167743670799.150030.2985662299530290415.robh@kernel.org>
References: <20230220174930.7440-1-zajec5@gmail.com>
 <20230220174930.7440-2-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230220174930.7440-2-zajec5@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230226_103842_969634_77CAD236 
X-CRM114-Status: GOOD (  14.34  )
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


On Mon, 20 Feb 2023 18:49:29 +0100, Rafał Miłecki wrote:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> Content of some NVMEM devices can be read using MMIO. Some of them
> (probably very few though) may be also programmable that way. Add
> generic binding to allow describing such hardware.
> 
> This *doesn't* apply to any more complicated devices that need more
> complex interface e.g. for writing. While such devices could be
> supported for reading purposes by the same driver - they should get
> their own binding.
> 
> This binding will gain even more usability once we fully support NVMEM
> layouts (describing content of NVMEM devices in an independent way).
> 
> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
> ---
> V3: Make it clear this binding should NOT be used for more complex devices
> ---
>  .../devicetree/bindings/nvmem/mmio.yaml       | 50 +++++++++++++++++++
>  1 file changed, 50 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/nvmem/mmio.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>


