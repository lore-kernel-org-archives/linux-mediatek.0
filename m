Return-Path: <SRS0=tvhu=GL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79153C433DB
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Jan 2021 02:52:47 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3E5BE2368A
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Jan 2021 02:52:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3E5BE2368A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=2/LYV9Fc5KOuJWl9+NUzoZwpFBkIKSRuI8AtZoFZkd8=; b=Eyje0tZ+O+Ptg1hIPzLsS1zPn
	S/I/zzwcz0rADV8CaF2AHq/HhiWefFTeh504PJ5S9/KoVmS7ROowoPMvuGFxH5TJvTpBa4lGXE+r6
	vs1dfPERthkaGWcf37KnU9YAKrqH8sWJ8WX+K6W13KCN0MDgADz5zn8OZgKRB/+7AwQV0UXPBDVPZ
	pNeiI3d2hIZ5ZAfgveZMQ+vNZ8adZtGpvPnCsRk+ZRkRQJjtSYAGACqmneoBXGGNsM88Z5YAyZeSd
	vZhJIpWNYFVhJd4YU2/jzGCVcuoI2dbLQSCWXQlMPmSJj25T9+VFB9QlCUTer+XIgK3rzHmEr6r76
	5CFkhFKQA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kxhtF-0007Wo-GO; Fri, 08 Jan 2021 02:52:37 +0000
Received: from mail-io1-f48.google.com ([209.85.166.48])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kxhtD-0007W7-5t; Fri, 08 Jan 2021 02:52:36 +0000
Received: by mail-io1-f48.google.com with SMTP id d9so8361938iob.6;
 Thu, 07 Jan 2021 18:52:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=j9BJOm6Gyl9YhJRZvOpzUQv+7D7nE5zdeZRpcSuRRBI=;
 b=RLXuwOFlk0i2mZqYt3mdSqZYpqCFgZ858PuIFFzkKVJOFEuuaV2Nf7FMNW7VaGdvod
 GdXKubBmUrY+vP+ypY/2rntMOw/PVgKvUhNB082A7lA+zavoq5lax5VrkL17Sc1Ql326
 qoJOz8yt4IBuIF8nGYvLaOP7IZBmXBT+2zh/fW7oRd4jHWljXkJTJ+AbiXQSDylVrnaN
 qNivxQWMe+LEJWV23yzTSW2zYNUaVJjaZnwFQ01XwrQTaWFlHqI4wWh424le7DMFQiC1
 uRmz4SBwBAX9Hlq2kKO5Q0eRvsvcEQdoeXbSQ8QsBY17PAzGaUYpKvG7RjuvtzOoBUcl
 UETA==
X-Gm-Message-State: AOAM531Rmx9lVPBhRh5fiujkgIKlcAv0GXxZaWew7ljoiEAfRuu8BqmT
 E2FnkrUFhPdXISMK+aN0fxFtagR6aA==
X-Google-Smtp-Source: ABdhPJxSj3GS6b8u4lJrqSge/6GnqMxaAVuJHdUXCdgq9UGMMZClQFUGQc3VppY2A5kzN6A5IQaUGQ==
X-Received: by 2002:a05:6638:1a:: with SMTP id
 z26mr1500734jao.52.1610074354559; 
 Thu, 07 Jan 2021 18:52:34 -0800 (PST)
Received: from robh.at.kernel.org ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id b13sm4525239ils.54.2021.01.07.18.52.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jan 2021 18:52:33 -0800 (PST)
Received: (nullmailer pid 1782876 invoked by uid 1000);
 Fri, 08 Jan 2021 02:52:31 -0000
Date: Thu, 7 Jan 2021 19:52:31 -0700
From: Rob Herring <robh@kernel.org>
To: Yongqiang Niu <yongqiang.niu@mediatek.com>
Subject: Re: [PATCH v2, 1/3] dt-binding: gce: add gce header file for mt8192
Message-ID: <20210108025231.GA1782839@robh.at.kernel.org>
References: <1608770889-9403-1-git-send-email-yongqiang.niu@mediatek.com>
 <1608770889-9403-2-git-send-email-yongqiang.niu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1608770889-9403-2-git-send-email-yongqiang.niu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210107_215235_355513_E56259E0 
X-CRM114-Status: GOOD (  13.02  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, CK Hu <ck.hu@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 24 Dec 2020 08:48:07 +0800, Yongqiang Niu wrote:
> Add documentation for the mt8192 gce.
> 
> Add gce header file defined the gce hardware event,
> subsys number and constant for mt8192.
> 
> Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> ---
>  .../devicetree/bindings/mailbox/mtk-gce.txt        |   7 +-
>  include/dt-bindings/gce/mt8192-gce.h               | 419 +++++++++++++++++++++
>  2 files changed, 423 insertions(+), 3 deletions(-)
>  create mode 100644 include/dt-bindings/gce/mt8192-gce.h
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
