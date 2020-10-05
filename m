Return-Path: <SRS0=fB7w=DM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2DC0C4363A
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Oct 2020 13:55:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2991C20774
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Oct 2020 13:55:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bGZJDwWw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2991C20774
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=VnFnu9gTMhBsCCe+8i/gPwHi4DpTJn+M9kV2G5Bq/bM=; b=bGZJDwWwaY8xpkhbPk4aTa1mb
	1LRD5uEqBD+059h+RXzGUoM1gz8E4UecYWCpZjO1Ba+UgZhPtMTOmDiBJYXnokIokmh0f2g0VbBTK
	86DICEE2eWorAX8rkUgorEPbngiEraYu/TK1BVfwP1VeUYZrTLjyFAvHkBRGeWABiN1PuwZB9f6XI
	RFpck9mUOH2YcZwPhHCPOGsgb1feuGGIFNqzrSLwnq0TY+0ZGS+59hKmp9kY8IhqzHaMWZGmsDtAN
	ABzJVlpt9uMkbLs7ap4QHUo44SvuqTgmd1ABZPcLyy9M1zgs6G/oI0B1SSe3oqN61RliGpEjr+RTO
	aHyXCZxYQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kPQxI-0005Of-Gt; Mon, 05 Oct 2020 13:55:08 +0000
Received: from mail-ot1-f68.google.com ([209.85.210.68])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kPQxF-0005Ny-Pl; Mon, 05 Oct 2020 13:55:06 +0000
Received: by mail-ot1-f68.google.com with SMTP id m11so3039651otk.13;
 Mon, 05 Oct 2020 06:55:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=+Y4gjDGwHEexJsJEMak2JrCEZKWVBN3DiXlKnxcoWUc=;
 b=jTEG4zbVf/xZK8/++8x5dSgvOpO5ZWtNePbDN70STwlYhbtsjq/x8zRI4n3V/7e7yz
 VZhshL4MdQ0Jz4xKxFFDPAa6/r1i0tYhAAU6S+we5+rA0TzLjqVabcXg+FhYkmZTBtBz
 ijJCYeqnT51yzQPRMYIsJ/kIk+5UBphHGuDagr9AgrkQVKEvYKeHugNj9K5WJXoPjxWm
 EpOQVPBDbfezuq+9eC/AyGYVEDftu+k5CVIuPf5Vjn21okVl77GGSavUrYtz7ciAIvmX
 B7ztAHUCvruSdZe+GpZvwuhw4BFsfo9wKoZCaM7VlcPCXq4U1CSyrze4piO7i0ONHTd9
 2i6Q==
X-Gm-Message-State: AOAM531x6dnyMsBLHW1X8EyMz5V6ppgi/FLBaHnb8nNGWe6KwrrF16JW
 i1PbiYZE2Lx9zltZIpvdhwCQSCcPWQg1
X-Google-Smtp-Source: ABdhPJxEM6WWOVQjqWQ3oPRaSuayV/A3zEDzJbkHvCwqWMAtfNXsAh8uKNIiEOm8z6t59edGkCW0VQ==
X-Received: by 2002:a9d:5910:: with SMTP id t16mr12615071oth.155.1601906105026; 
 Mon, 05 Oct 2020 06:55:05 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id m22sm2885602otf.52.2020.10.05.06.55.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Oct 2020 06:55:04 -0700 (PDT)
Received: (nullmailer pid 87147 invoked by uid 1000);
 Mon, 05 Oct 2020 13:55:03 -0000
Date: Mon, 5 Oct 2020 08:55:03 -0500
From: Rob Herring <robh@kernel.org>
To: Jiaxin Yu <jiaxin.yu@mediatek.com>
Subject: Re: [PATCH 3/5] dt-bindings: mediatek: mt8192: add audio afe document
Message-ID: <20201005135503.GA86716@bogus>
References: <1601624142-18991-1-git-send-email-jiaxin.yu@mediatek.com>
 <1601624142-18991-4-git-send-email-jiaxin.yu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1601624142-18991-4-git-send-email-jiaxin.yu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201005_095505_943383_DD44F950 
X-CRM114-Status: GOOD (  12.65  )
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 kuninori.morimoto.gx@renesas.com, tzungbi@google.com, broonie@kernel.org,
 maowenan@huawei.com, tiwai@suse.com, shane.chien@mediatek.com,
 robh+dt@kernel.org, linux-mediatek@lists.infradead.org, p.zabel@pengutronix.de,
 matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, 02 Oct 2020 15:35:40 +0800, Jiaxin Yu wrote:
> This patch adds mt8192 audio afe document.
> 
> Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>
> ---
>  .../bindings/sound/mt8192-afe-pcm.yaml        | 98 +++++++++++++++++++
>  1 file changed, 98 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/mt8192-afe-pcm.yaml
> 


My bot found errors running 'make dt_binding_check' on your patch:

Documentation/devicetree/bindings/sound/mt8192-afe-pcm.example.dts:19:18: fatal error: dt-bindings/clock/mt8192-clk.h: No such file or directory
   19 |         #include <dt-bindings/clock/mt8192-clk.h>
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[1]: *** [scripts/Makefile.lib:342: Documentation/devicetree/bindings/sound/mt8192-afe-pcm.example.dt.yaml] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1366: dt_binding_check] Error 2


See https://patchwork.ozlabs.org/patch/1375582

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure dt-schema is up to date:

pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade

Please check and re-submit.


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
