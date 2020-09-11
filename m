Return-Path: <SRS0=cvih=CU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8518AC433E2
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Sep 2020 22:52:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3D9FD2220A
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Sep 2020 22:52:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IuEK5Oe3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3D9FD2220A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=O7QfYC+Y7qDFOY3W+Q2PnBq3+AUDnugsvuKVkIGGmhE=; b=IuEK5Oe3dZLXRO+4Ctu+A1zvP
	y9gYK7FhJBfqapXoW2RiIZ0IuenZEz0k09SQSRZK+PuwP6WNv6+9jLByZO0sM1Xsrgxsmx67QsA5/
	fwqtySZlFYFwHq9gdhBm6fWOFmWxskp+Nz5oq+z19Y+PkSLrdlb8QMV1lLOzfCzq0N+W8T14nl569
	Psdbrs2yRN/Gu3NbRW7hQfLpKASlxPDwF1kRASE7fucTdqTU1Gx8PBv75ak/J70H0KMt0iiE1K51Y
	HjLmeIFu6m9YqYmi6ZxS06u0B/H1ssKJmbEHxJjORf/ueEIwJzip3/EvapiEzq6kq8JndOCP/wpjR
	Kj+0V+fNw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kGruA-0003Kx-AP; Fri, 11 Sep 2020 22:52:30 +0000
Received: from mail-io1-f68.google.com ([209.85.166.68])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kGru8-0003KE-Rn; Fri, 11 Sep 2020 22:52:29 +0000
Received: by mail-io1-f68.google.com with SMTP id b6so12740113iof.6;
 Fri, 11 Sep 2020 15:52:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=+wIAGYALZ0xOBvUiJa/BeqCe66OMKfu36KeZBaAVaaY=;
 b=o9qVI8xnjxKV+KcgVVLoB1qv8mEOUlS7apfeitIOkN2CrGzn8VNweABUdeENK5uQxw
 tLp8cuwZjgtdxi6xEyFL1WxAmDTu4JuHtmOAHY8/pH8ldw4VfgR5zSt6x6n09WrfKjWc
 7Kv69AuloRMMQ7i0EIKimc+y4lqVnolevgIfi9QPLJuBgiOkFSOdV/WkxKqQkDChBkLl
 0eNU1otO0nnVr0D9swktVFiTsfLYV9feHoDo3w6/UIE3vtDuHZ9kfDoV1G/95PXOKWcE
 fjNdjiAXSQ8aFc0tB0Lr1C//Mm+qW1xETkdUbM0rMIwkqBaGVY1wCBkJeDEdW1Xa7BYw
 1ZAQ==
X-Gm-Message-State: AOAM532Tig2tpTaqTD5uOJIU0svb4JzAaBoonsNwio19GCRySHQdRi4+
 zo937ilLu6shm0f7zM1UOQ==
X-Google-Smtp-Source: ABdhPJy/ic3pBK76pvolk4fwx+DRImPyMN1vu/qNv4Gn/9LFaDYgqKoyQw8Ed8sT0SEisCAOBMt/SA==
X-Received: by 2002:a6b:e609:: with SMTP id g9mr3638445ioh.26.1599864748340;
 Fri, 11 Sep 2020 15:52:28 -0700 (PDT)
Received: from xps15 ([64.188.179.251])
 by smtp.gmail.com with ESMTPSA id p78sm1946018iod.0.2020.09.11.15.52.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Sep 2020 15:52:27 -0700 (PDT)
Received: (nullmailer pid 2969005 invoked by uid 1000);
 Fri, 11 Sep 2020 22:52:26 -0000
Date: Fri, 11 Sep 2020 16:52:26 -0600
From: Rob Herring <robh@kernel.org>
To: Alexandre Bailon <abailon@baylibre.com>
Subject: Re: [PATCH v2 1/4] dt bindings: remoteproc: Add bindings for MT8183
 APU
Message-ID: <20200911225226.GA2968956@bogus>
References: <20200910130148.8734-1-abailon@baylibre.com>
 <20200910130148.8734-2-abailon@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200910130148.8734-2-abailon@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200911_185228_907907_6F22B888 
X-CRM114-Status: GOOD (  11.23  )
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
Cc: ohad@wizery.com, devicetree@vger.kernel.org,
 stephane.leprovost@mediatek.com, mathieu.poirier@linaro.org,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 bjorn.andersson@linaro.org, gpain@baylibre.com, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 10 Sep 2020 15:01:45 +0200, Alexandre Bailon wrote:
> This adds dt bindings for the APU present in the MT8183.
> 
> Signed-off-by: Alexandre Bailon <abailon@baylibre.com>
> ---
>  .../bindings/remoteproc/mtk,apu.yaml          | 107 ++++++++++++++++++
>  1 file changed, 107 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/remoteproc/mtk,apu.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
