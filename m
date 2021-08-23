Return-Path: <SRS0=it3p=NO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F02C7C432BE
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Aug 2021 12:50:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BB075613B1
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Aug 2021 12:50:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BB075613B1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7pH6uQNdILIcOxia/0g1XQbdgXMM7vHjoeIB+3Trkk0=; b=d9gV1MG+O89Sed
	FkG1DJBl5XUNe7FnUS9D7lLaQuA+g1sXpOn+gGRad5lN9Ml7DaSdB2h0gEjfgVUXAtYDI56j6l/it
	kfIcQANdSXAl2xIyRXxtRuzIgSe5qM2YE9mktCioXS0kQDvN6DdigvQ9kTG1ish3+eMz112phnJkd
	O7R9dW53IXMcMOW+EdA2poJj0nJrb2NbZLJ1u6ERM8VUVmVuL74U2qG6O1Q1jaCB6shL3Wjjd/nOP
	T0Gb43CKM57uk2TH+xKpTmAE2YgIDUAx+sip09EGj4whOoF3UWwSXvZDdh5HudWEX0D31Mcrswcx5
	r2y1g9EKGRM38MxRLfOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mI9PM-00Gq94-GT; Mon, 23 Aug 2021 12:50:32 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mI9PF-00Gq7H-QE
 for linux-mediatek@lists.infradead.org; Mon, 23 Aug 2021 12:50:29 +0000
Received: by mail-lf1-x130.google.com with SMTP id z2so37744121lft.1
 for <linux-mediatek@lists.infradead.org>; Mon, 23 Aug 2021 05:50:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JaVX46aQ+V25UIMXASQYuq5exbppMpl9+jwK0qjbA9w=;
 b=QHyjy8vxmJ2E7RBLJOkvcAQat6PnacE5+TOWtL32+HgOI/BMwW2ecb+uDywPWjwt2Q
 XvXjbMsPMxSe/1ZLPpHXxbAGA4N7d9U8L6mpZnk8FnH6YaQp7XYaI/LCoXv2n5oy4mAu
 gBChrriDPr7/Arrz4k75yo7ELEVuQe+5+V59U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JaVX46aQ+V25UIMXASQYuq5exbppMpl9+jwK0qjbA9w=;
 b=Nuy3E1ffckzNaDt/leRZr9J4jND8aySe0QL0DAJsLRdtPyerQhTfDPizMcwmQUznWq
 FUzbAZuHfrphOuVH8BPgfdVi9+04TpMh4tqxGGXGzP+1Z5jtgU65XPvkS5xkcbSS5miE
 FTVVJMal//VvrLDj/yLlgHRqrFgWHo8B0vs+Y9tH4r/BsHFEy4oa5cAztM83lxtfO5LE
 ONqHLuCFN2tQtip6Bn/qwyOvOXQ24o1hNnaa0AGTTCPqT23mgEtjkDqS9aDgtI0f9ekc
 /MD5hw7MAfmGyot/wKKy75C+KtEvhxdeHWasHyzgAeKEKhknEa5mAKcLfV+uR0uWMA20
 qmFQ==
X-Gm-Message-State: AOAM532YzLq/dgeeRRRTZ/2oEjujbgpkok04BOez1AzYh9Kb/gBVWMk+
 vI8mzukBzjrZVa+3kIaZ5btr76tBsjCrobGvxXl3GQ==
X-Google-Smtp-Source: ABdhPJw6toCNVTyqjq3up8DTak/+y7rMwN30zZbzOMJMC3UnKVTDsk/Re2QMsobWKxKRqccqaE7mhnKWfSo1ip9RYOY=
X-Received: by 2002:a05:6512:3b98:: with SMTP id
 g24mr17315353lfv.276.1629723024425; 
 Mon, 23 Aug 2021 05:50:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210820111504.350-1-chun-jie.chen@mediatek.com>
 <20210820111504.350-24-chun-jie.chen@mediatek.com>
In-Reply-To: <20210820111504.350-24-chun-jie.chen@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 23 Aug 2021 20:50:13 +0800
Message-ID: <CAGXv+5EDn=OjghzN6wzx0RF4k=h6eKAY6qdf278WZbANHnoGUw@mail.gmail.com>
Subject: Re: [v2 23/24] clk: mediatek: Add MT8195 imp i2c wrapper clock support
To: Chun-Jie Chen <chun-jie.chen@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Stephen Boyd <sboyd@kernel.org>,
 Nicolas Boichat <drinkcat@chromium.org>, Rob Herring <robh+dt@kernel.org>, 
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, LKML <linux-kernel@vger.kernel.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 linux-clk@vger.kernel.org, Devicetree List <devicetree@vger.kernel.org>,
 srv_heupstream <srv_heupstream@mediatek.com>, 
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210823_055025_902044_F4F51249 
X-CRM114-Status: UNSURE (   6.59  )
X-CRM114-Notice: Please train this message.
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

On Fri, Aug 20, 2021 at 7:36 PM Chun-Jie Chen
<chun-jie.chen@mediatek.com> wrote:
>
> Add MT8195 imp i2c wrapper clock controllers which provide clock gate
> control in IIC IP blocks.

Standard terminology is I2C.

Otherwise,

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
