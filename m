Return-Path: <SRS0=CLKU=ME=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AE37C07E9C
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Jul 2021 06:06:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4FE786101D
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Jul 2021 06:06:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4FE786101D
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yMWAf5niC3NZXsdGLIYgrJs+aBFrpogR/wmb5+y3SQA=; b=wW/SNs9irJg8Db
	zUNkxLywpn1Hu5UBdqgOm8EoWnW5V2jAvk1WY59aHLIsCrXyAVimkQ3it4+LqjnadRqc4X7D72B5T
	WKvBg293QI7efISkJSzbXoQT2USTl4izXZa1GAZWngl5XIaoIM2p6iW/4NJAQxuvn/l3RLILQ7U6P
	4vbV06IaUt7BFlMN9+Hm/rpmNtvraeaL3PZkXqECSFKN8S73TXtWyM0huS2xBcMCfQtmXzGx3U0hz
	zSGznl7mkA53cdY1PD1UzmXz9o194kBbh0oxn/2bLuiQstdLiiyGy6z1X7VIyoN04HJAdU1ddmU7O
	DWe9UI5Wuok7YOupJqJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m2p50-005xKF-Nj; Mon, 12 Jul 2021 06:06:10 +0000
Received: from mail-il1-x12d.google.com ([2607:f8b0:4864:20::12d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m2p4x-005xJb-Sy
 for linux-mediatek@lists.infradead.org; Mon, 12 Jul 2021 06:06:09 +0000
Received: by mail-il1-x12d.google.com with SMTP id o10so18293689ils.6
 for <linux-mediatek@lists.infradead.org>; Sun, 11 Jul 2021 23:06:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=a/fo2+9FlJ6YAAQKs++sJ8eXvktBL6MmLMTkj3M8ftU=;
 b=diY2/uLTaRCOBljQTR1vwEiMGi59yZNsS3rsChuk1XnN8GafliL94jKo61/wpRGis9
 cSiWbar/yUNxEm6sQ1nZ3q2kY+DZ2/o4jpH+Di9oP6V4DUgMj4PScJBBy7IvveqlR5cz
 LlH+jC0Zu7SKizQGc8pn7Ug6Mj92Mgx6Hrp1h9BnOHuXJz4uavz9P+dOs2ArFKLnPFZL
 Bv908z0fsV1FaXHX01GrVv7OZHJqi7wOOlLVyXE+eLuZdFLyu908HBzIB92Cbx1Ohw4E
 7QQVfn1wQbKQMJYVHeTqCtmI661vg7t64jgleG/g8nT+Ba8Ngo+TZAUMx+Qis8Bevwe6
 inBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=a/fo2+9FlJ6YAAQKs++sJ8eXvktBL6MmLMTkj3M8ftU=;
 b=ORBEb4CLFL1L7RXINslCnGAhWAub9URcBVfIEiwV9w16fH3PJ2cU8MXd3Pw3yHdFjZ
 XO0vOGbGBEFGUuuZEiiaFakh/WyLqBiJ6Qo4Hbr+tsjmkCRM9mu9aUE9jYT+pnqT3Ur2
 VbbTxBOa7Uv5R/cJWo1UZgRTuQsuAuwFiTbv86e3b1rf9IMmw1lJ+86yGb70QAlvKUU7
 A+GZqKGTFCNvtGsGIb4z8kkW+eWPUcZyE0forqx3WrDnzZLTeBdDOMf5RRUgGBlg/vcn
 /OuOBhlBgBbQ3sr7FMQ9FIfNvjxhEvGc4EHNUecKUe6AQDiLyXsdCTE2fR1fmVNMg4dr
 hVdg==
X-Gm-Message-State: AOAM530E5nl5nqb3H1taR9YfNbjZmbxAM7zvRcokTHbMhC5wwKNoXQ9u
 KlKnz3EEEDVGUOnoIJEjlsIboCil9kB9UgFwAmnlbQ==
X-Google-Smtp-Source: ABdhPJw62rJ6jpQ+XvEV4UFWbm4XcDLKzKexKv5JdC2h79thmw15AXbB/nT23QMCgr2TxmRZa4SjRTuWN//u2YEqRwk=
X-Received: by 2002:a05:6e02:e02:: with SMTP id
 a2mr8873405ilk.127.1626069965617; 
 Sun, 11 Jul 2021 23:06:05 -0700 (PDT)
MIME-Version: 1.0
References: <20210710122446.5439-1-tinghan.shen@mediatek.com>
In-Reply-To: <20210710122446.5439-1-tinghan.shen@mediatek.com>
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Mon, 12 Jul 2021 14:05:54 +0800
Message-ID: <CA+Px+wUVsY6CYwEdfSeK+KQGmvb224hvchgnTwX0rgBzMvXfqw@mail.gmail.com>
Subject: Re: [v2 1/2] dt-bindings: remoteproc: mediatek: Add binding for
 mt8195 scp
To: Tinghan Shen <tinghan.shen@mediatek.com>
Cc: ohad@wizery.com, bjorn.andersson@linaro.org, mathieu.poirier@linaro.org, 
 robh+dt@kernel.org, matthias.bgg@gmail.com,
 linux-remoteproc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 srv_heupstream@mediatek.com, 
 Project_Global_Chrome_Upstream_Group@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210711_230608_019804_6688940A 
X-CRM114-Status: GOOD (  13.25  )
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

On Sat, Jul 10, 2021 at 8:25 PM Tinghan Shen <tinghan.shen@mediatek.com> wrote:
> @@ -5,13 +5,15 @@ This binding provides support for ARM Cortex M4 Co-processor found on some
>  Mediatek SoCs.
>
>  Required properties:
> -- compatible           Should be "mediatek,mt8183-scp"
> +- compatible           Should be one of:
> +                               "mediatek,mt8183-scp"
> +                               "mediatek,mt8195-scp"
Just realized we forgot to add DT bindings for mediatek,mt8192-scp[1].
Could you send another patch for adding the missing property?

[1]: https://elixir.bootlin.com/linux/v5.13.1/source/drivers/remoteproc/mtk_scp.c#L879

> -- clocks               Clock for co-processor (See: ../clock/clock-bindings.txt)
> -- clock-names          Contains the corresponding name for the clock. This
> +- clocks               Required by mt8183. Clock for co-processor (See: ../clock/clock-bindings.txt)
> +- clock-names          Required by mt8183. Contains the corresponding name for the clock. This
>                         should be named "main".
Let's move clocks and clock-names to "Optional properties".  See [2]
for your reference.  I guess it doesn't need to mention which chip
needs the properties.  For those chips that need the clock properties,
they won't work correctly without correct clock properties.

[2]: https://elixir.bootlin.com/linux/v5.13.1/source/Documentation/devicetree/bindings/remoteproc/ti,keystone-rproc.txt#L87


Suggested to provide a cover letter for the series next time.

nit: other patches usually use "[PATCH v2 1/2]" in the email title
instead of the one used in the mail.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
