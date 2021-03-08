Return-Path: <SRS0=Z3i2=IG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 961D7C433E0
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Mar 2021 18:39:39 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 38B6765218
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Mar 2021 18:39:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 38B6765218
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=C1yNixAzFpdIiLEMf2RWBoJTZ5gBswc0bWvaOMsNovM=; b=MOgwfEE94uuNtSrGsLuP1Y4BR
	j63TZCWT9um2uvAuzlabgMJcrnGRHABD4W4KxkSNp6tnr0ul+5YdjjMfy2Za7SJwK5IVBt6/vRVg1
	dmXFKqSR73Uabol7cdroEnCOTMlhyAtYjwERf8poglekm3/ragNiKJOptpoJmmY8JQSq+g3hBYPb6
	YT9HSRkaQF5ipRcDQNuENPx4nCNb528wI79Raht3hHIJaIR/q/ORAv/cp/G+pdZ1UeAnvEuM3X31U
	Wm8iF9F1LC5i6bgrMAKXVoV12jQHWENmBcj5dKhYhUGotiMsa+STWU7bknvZEhFVJdsKT95jir9+A
	RrWD3U52A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lJKmw-001n0x-H5; Mon, 08 Mar 2021 18:39:30 +0000
Received: from mail-io1-f45.google.com ([209.85.166.45])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lJKms-001myc-KB; Mon, 08 Mar 2021 18:39:28 +0000
Received: by mail-io1-f45.google.com with SMTP id p16so11075769ioj.4;
 Mon, 08 Mar 2021 10:39:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Y2vUMruKnMk/QUUYIf3u9nbHNj9rZrjwEcRZ9FnN9Gk=;
 b=dAspbzj33izs5mEE2C9sn1ICzgFrZWybOoGc4R/maIU7MT/PTochzmIgd0EnJeiuyC
 T28TuL/15CrHJMHH6NfkNfkIGLVSmfkgZE1soKFdP+iloMkLJfmjoVKfM5oxTGotAhBh
 Kr2lRjqQP6DX0c3h9FnIRwazG8QGfXpXnneqnCvvkYmMEPjIJAlXISUSwwLFFzXD49Ow
 Ym75LcXCev+57oMUZE7Pqx1jtz6brMJh9wLIsUJx5RT3NlrSmv+1T8rEMW+LJQAcbUrB
 mwV28ch58ghlhWXNE/J0enoIMm0zaIKzSTD3EjOVLJKxcAI4XRYzmnixgrI1gPf4bTF8
 h0Ew==
X-Gm-Message-State: AOAM533mjSQyNOpw7ADIq8DwGy/TR4AD5Mt8KV3loui5zvVXc0QUXZ3M
 4RJf8jeXzjGrne1V2KSF8Q==
X-Google-Smtp-Source: ABdhPJwc1VDMrO5IdEEYLRMeq6VpCXS5H+Bk9gqa1BpRVtVuoo1TpIe5H5QvsiBlO3a6XDgvYOSo4w==
X-Received: by 2002:a6b:5818:: with SMTP id m24mr19316588iob.144.1615228765710; 
 Mon, 08 Mar 2021 10:39:25 -0800 (PST)
Received: from robh.at.kernel.org ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id a14sm6728773ilm.68.2021.03.08.10.39.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Mar 2021 10:39:25 -0800 (PST)
Received: (nullmailer pid 2761723 invoked by uid 1000);
 Mon, 08 Mar 2021 18:39:23 -0000
Date: Mon, 8 Mar 2021 11:39:23 -0700
From: Rob Herring <robh@kernel.org>
To: Henry Chen <henryc.chen@mediatek.com>
Cc: linux-pm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Stephen Boyd <swboyd@chromium.org>,
 linux-kernel@vger.kernel.org, Georgi Djakov <georgi.djakov@linaro.org>,
 linux-mediatek@lists.infradead.org, Ryan Case <ryandcase@chromium.org>,
 devicetree@vger.kernel.org, Arvin Wang <arvin.wang@mediatek.com>,
 Fan Chen <fan.chen@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Nicolas Boichat <drinkcat@google.com>, James Liao <jamesjj.liao@mediatek.com>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH V9 07/12] dt-bindings: interconnect: add MT6873
 interconnect dt-bindings
Message-ID: <20210308183923.GA2761689@robh.at.kernel.org>
References: <1614656863-8530-1-git-send-email-henryc.chen@mediatek.com>
 <1614656863-8530-8-git-send-email-henryc.chen@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1614656863-8530-8-git-send-email-henryc.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210308_183926_792527_E4ED652E 
X-CRM114-Status: GOOD (  11.22  )
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

On Tue, 02 Mar 2021 11:47:38 +0800, Henry Chen wrote:
> Add interconnect provider dt-bindings for MT6873.
> 
> Signed-off-by: Henry Chen <henryc.chen@mediatek.com>
> ---
>  include/dt-bindings/interconnect/mtk,mt6873-emi.h | 41 +++++++++++++++++++++++
>  1 file changed, 41 insertions(+)
>  create mode 100644 include/dt-bindings/interconnect/mtk,mt6873-emi.h
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
