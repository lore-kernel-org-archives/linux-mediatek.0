Return-Path: <SRS0=x1vn=CR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66E11C43461
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Sep 2020 20:50:09 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EA93520936
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Sep 2020 20:50:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="v8hUur6C"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EA93520936
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=iqtoWLaqiRfdV9tpQFfyR/Ta/yXMfQI6qwqmmZF2wsQ=; b=v8hUur6CPaYQGWNyy2REoS/QJ
	dGDTRGNT8hEviEHZdYNJNJSYf7oKO5+5m/nCpcFNXu8y/UTvzqw7Akl+No6G/UwN+PLps0hSRKpZd
	in1D+9QPCFaX8cLWJpPUWEn0kRkNzTEuxrxh3PoL5muPAXBQLTL0AJXTxPpzTQ65I0merHa6p2S3O
	jr1Nq7rDaipdw4wgJQLqDwpVSnjKK12y6cbBJXZ+m/cMaafvwTTccBa5qZ7POCoJjoGe/Na8071T1
	4HXgYXxE4kSsCLLmYI3/WpfdMjRCG3kFdB1WET7+se1uuMmlS4iZbksvyrVlMEr3Xae1dIpiCeKzm
	apR75fnAw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kFkYy-0004yF-9n; Tue, 08 Sep 2020 20:50:00 +0000
Received: from mail-io1-f67.google.com ([209.85.166.67])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFkYs-0004vm-EQ; Tue, 08 Sep 2020 20:49:55 +0000
Received: by mail-io1-f67.google.com with SMTP id r9so860902ioa.2;
 Tue, 08 Sep 2020 13:49:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=l6Ml6GUsFvFs2hmUbBhScVBvUaAujChY5id6z4NCBL4=;
 b=i8FqNGT5046L4xdJwoEyMKM7v8+dg48hsztp5dS8G1ecF/EYoJhia9TORyh51XtGEi
 hnm0Fr6YvzBveK/uOL4WbERP3cRTmqgGCC6LZgmRAnTkHr7BEhROsl3c90fyJ2gug1xM
 2c4IRlrSpDzseqkW2xb1RTejBzsWKPQfioIQdFoK4ZGegMMo8oQtNcw2vLQ+i3Hxkxsx
 DYclzsR0zHj7xX/VA02hrxwaaHCuu7OJMyJ4dmI899m/nM81PSyaJkWlTuPikNSxE9y6
 Zh6t9gfo9CV6uBZljhDuPz2vcGCXDAI54AX3Vm5gfggJHrQ90Y6vKBN2KjdlJEsR6tlF
 90Yg==
X-Gm-Message-State: AOAM533iHeOUHY6HmlKDKFgJE5111itAUVASiIYXcdzHk5ctPwYm71dm
 r515k5dIwAa9sg9ihzOqSKfQB9wgTsD6
X-Google-Smtp-Source: ABdhPJyul47wGDEorl9zgNUus3MDtK7opu0OS0zlBS8occCySSRUeRKc5hrknvTvzMWAL0NLClcy2Q==
X-Received: by 2002:a02:ccdb:: with SMTP id k27mr768174jaq.103.1599598192571; 
 Tue, 08 Sep 2020 13:49:52 -0700 (PDT)
Received: from xps15 ([64.188.179.251])
 by smtp.gmail.com with ESMTPSA id i10sm209529ioi.39.2020.09.08.13.49.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Sep 2020 13:49:52 -0700 (PDT)
Received: (nullmailer pid 894747 invoked by uid 1000);
 Tue, 08 Sep 2020 20:49:50 -0000
Date: Tue, 8 Sep 2020 14:49:50 -0600
From: Rob Herring <robh@kernel.org>
To: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: spmi: document binding for the
 Mediatek SPMI controller
Message-ID: <20200908204950.GA893759@bogus>
References: <1598006677-7953-1-git-send-email-hsin-hsiung.wang@mediatek.com>
 <1598006677-7953-2-git-send-email-hsin-hsiung.wang@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1598006677-7953-2-git-send-email-hsin-hsiung.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200908_164954_511292_F2283DDF 
X-CRM114-Status: GOOD (  12.66  )
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
Cc: devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
 Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Aug 21, 2020 at 06:44:36PM +0800, Hsin-Hsiung Wang wrote:
> This adds documentation for the SPMI controller found on Mediatek SoCs.
> 
> Signed-off-by: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
> ---
>  .../devicetree/bindings/spmi/spmi-mtk-pmif.txt     | 33 ++++++++++++++++++++++
>  1 file changed, 33 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/spmi/spmi-mtk-pmif.txt

Bindings are in DT schema format now. Please convert this.

Rob

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
