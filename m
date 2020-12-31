Return-Path: <SRS0=2t6o=GD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1295C433DB
	for <linux-mediatek@archiver.kernel.org>; Thu, 31 Dec 2020 15:42:11 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A5F66223DB
	for <linux-mediatek@archiver.kernel.org>; Thu, 31 Dec 2020 15:42:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A5F66223DB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=78siBEvxcl+Tyy2dsi6iN9X9obqZYNUXF5oJAQ5Q340=; b=KCijr2drwHx8Fby1b9JARacBM
	+z66hxZnY14wDob9c7yat32o0HtmO7rrCRnBB0lk+LMIB6qSiQNp0tWKsYNwx9IP4OFS9P7AI/K8h
	eUAmDJ3JdGcDGmiZYaqfKDL4gBT7YnUMNXtb4d7mFK4rDzDYOcqMjql2sQJDMGkb/1VzH93OnKtXr
	TlG9dmLZU+fPqYkyAt9kyBEqQO5fT1er7R+X53ZGJWh6NAktaOQePwaUM3w3xf2+vWaDfk/3bDobX
	iO0hTtw9wWtK0PbgREjDWIqxDpKD66mfxN2TxVEgbBwX539KBeIsYQmlw2Dtk7T81CRZi66e9AaOj
	ea/kBG7Hw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kv05Q-0001Dw-2y; Thu, 31 Dec 2020 15:42:00 +0000
Received: from mail-oi1-f181.google.com ([209.85.167.181])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kv05N-0001D7-6f; Thu, 31 Dec 2020 15:41:57 +0000
Received: by mail-oi1-f181.google.com with SMTP id q25so22143126oij.10;
 Thu, 31 Dec 2020 07:41:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=7ZRD6+gK6uV7qY4ayTDAh6QuqyD8TOAxjhUKABzcOrc=;
 b=UCzpwHxCkY8zZ3ttnEL9oP32kSOi5q7DoK+WDbA0qzTKRuYs2zmqWel6CdhoRzjljJ
 Tv0eFgbcn7TDM1lfz9y8ltIxJSFzgOUiYcTKmg6MRSvCf+itg+9laR0ypVC4TFChnROf
 kzDaTvJHn1qpV726TsS+gcaAjNgs9cH122lo1j3SvYQMJt5KmEXLnvb3HBmmphUkoZ31
 g35BDxhuoOEl+pgsCSPkZyS9G7dowrrVL8n4QLQL8wWZEGuOOSj5+GvXH2L7HYwhGUpI
 KeYXt1BBdM4LWgsLpPWOEKEK7A+/tD967HfsgiOTRbbCOH4AcZjfSVwpwXbpD25V/CzK
 GHkg==
X-Gm-Message-State: AOAM530Mr/Bd8/NNCYdHUL9bcGvwuiN4IH7LlTYpL7oEisbuy4z/ofon
 LMlioOr7hsPwzH5dRgnkPQ==
X-Google-Smtp-Source: ABdhPJwqbag5+xGVSjUpUqGq4vOhtTuK2v8OIDRkh/Bn9LulVKav7Xx4HrzHXxyRkpHx2BgxYHBqkQ==
X-Received: by 2002:aca:4dc3:: with SMTP id a186mr8038426oib.107.1609429316278; 
 Thu, 31 Dec 2020 07:41:56 -0800 (PST)
Received: from robh.at.kernel.org ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id 11sm11234456oty.65.2020.12.31.07.41.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Dec 2020 07:41:55 -0800 (PST)
Received: (nullmailer pid 1839736 invoked by uid 1000);
 Thu, 31 Dec 2020 15:41:53 -0000
Date: Thu, 31 Dec 2020 08:41:53 -0700
From: Rob Herring <robh@kernel.org>
To: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
Subject: Re: [PATCH v5 2/4] dt-bindings: spmi: document binding for the
 Mediatek SPMI controller
Message-ID: <20201231154153.GA1839701@robh.at.kernel.org>
References: <1608691469-20919-1-git-send-email-hsin-hsiung.wang@mediatek.com>
 <1608691469-20919-3-git-send-email-hsin-hsiung.wang@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1608691469-20919-3-git-send-email-hsin-hsiung.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201231_104157_253995_CC6F9149 
X-CRM114-Status: GOOD (  12.50  )
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
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Mark Brown <broonie@kernel.org>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, 23 Dec 2020 10:44:27 +0800, Hsin-Hsiung Wang wrote:
> This adds documentation for the SPMI controller found on Mediatek SoCs.
> 
> Signed-off-by: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
> ---
>  .../bindings/spmi/mtk,spmi-mtk-pmif.yaml      | 74 +++++++++++++++++++
>  1 file changed, 74 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/spmi/mtk,spmi-mtk-pmif.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
