Return-Path: <SRS0=SroS=L6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A715C07E96
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Jul 2021 09:01:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BE2ED61995
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Jul 2021 09:01:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BE2ED61995
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3ZSkkvjG651v7yJ7cZN7h62ucfATjvOaoiQMN2a4S+I=; b=02jVIn62bBrRnX
	Cr7vZQrxlrAPLleckCh4zkQSI5PsIgX222UqYAhxSlvNLzY43a01hFRDPAVyQiEb9RpQOiPzVvY5G
	VIUjkyDQpcPKjoVjEuBUo+sYNXi90DYuRpIqL2U6c74a2NpkhnsC+HC4+Y6oYSuIqay5ZeeXRpKkj
	V5hXfDh8BuelC+ScLZ+gKxf1+WNa9//SmjYmHSZ7QqPFzhwSrCVa0IVYb9rZ8Rxs1LRAeL6MTUo/7
	3TaZG/N3/u4B8DHXdeRZ29lIgYs8W/Y7aUwl9eGtyKokg8E5E5IaBorvdgYMHcBqC0uliBTTaMXIz
	ye0VdQ24jDZXS2SjRFYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m0gwz-00Ar67-ID; Tue, 06 Jul 2021 09:01:05 +0000
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m0gwl-00Ar3N-CQ
 for linux-mediatek@lists.infradead.org; Tue, 06 Jul 2021 09:00:52 +0000
Received: by mail-lj1-x22a.google.com with SMTP id t30so8155252ljo.5
 for <linux-mediatek@lists.infradead.org>; Tue, 06 Jul 2021 02:00:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=V+h3JtgA85w3ih3Ol+1pWqD1Au/+HrPPpAy2ittwSGA=;
 b=K4USMV+7sbHwthRH15FlFzIc1yBbaeh0JttDHJ8wMAa2l2CP2YbGZUSGJTqmfVwqVi
 Af53x9OQRuaF5L3jr+a+iScjWpHOaz8bqVpmJOf+NVTy83ktMCPtFN4cMZbYJsI2gIOH
 NstOKL0ncWZp4rDgEXVlamWHnR3ZuckRgvbEk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=V+h3JtgA85w3ih3Ol+1pWqD1Au/+HrPPpAy2ittwSGA=;
 b=bDIHV9tD0lf+n1GM26BgUGALxP/JiVDfLWGJc2KHrMj/pmcQUF0QOFrIh6UnRtlGER
 WAXPt3/gmUEy4aprppZOaLhMMKzxbBLU7U5qr2foQ+MilfV77gpb+sgeT/WO1ATEfsIH
 5gm9h+AYV855fqyxWjq2HhIkGG9SmCLn+IlQrsU9BRPJ3Xpy9Eb01s0tUrF+YWl611NM
 hLVnWzStYRBzuUJ2mm6nZtmiM+RhqhRJ2M0N5JJj6B4SsOhHDiVKHd3a10ZpvFigFJId
 qHBTGaCpCd416G9AejGQ1JWYCVMBmoEisLlQU2UcvVpIVeVUr0Uj8Wzjt71C/3BQyK2A
 ziAg==
X-Gm-Message-State: AOAM531VySuiP+djOexr3vCxfInbeKHnsgh/qsKoIscQoWOMr7a+pc3C
 QQYQRUJ52QUzrQluh1zQRTd4GTHb6WxJQ7v1HX5AVw==
X-Google-Smtp-Source: ABdhPJysf+qvbozSY/BYEowLfeIAMZMyQE3d9EPm2uqEBDA6bWwtUjwO9iQrFfp7Cai6FwC0Uf4CrqOkCjtEcpE9hgo=
X-Received: by 2002:a2e:9b8f:: with SMTP id z15mr10379699lji.437.1625562047660; 
 Tue, 06 Jul 2021 02:00:47 -0700 (PDT)
MIME-Version: 1.0
References: <20210616224743.5109-1-chun-jie.chen@mediatek.com>
 <20210616224743.5109-9-chun-jie.chen@mediatek.com>
In-Reply-To: <20210616224743.5109-9-chun-jie.chen@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 6 Jul 2021 17:00:36 +0800
Message-ID: <CAGXv+5ETXT-pxuP1NFEUrV+m3RR25zD9RZmDjHxVOLOy7gGj8w@mail.gmail.com>
Subject: Re: [PATCH 08/22] clk: mediatek: Add MT8195 ccusys clock support
To: Chun-Jie Chen <chun-jie.chen@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Stephen Boyd <sboyd@kernel.org>,
 Nicolas Boichat <drinkcat@chromium.org>, Rob Herring <robh+dt@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, LKML <linux-kernel@vger.kernel.org>, 
 linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, srv_heupstream@mediatek.com, 
 Project_Global_Chrome_Upstream_Group@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210706_020051_450276_5FC1F2F6 
X-CRM114-Status: UNSURE (   8.49  )
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

On Thu, Jun 17, 2021 at 6:59 AM Chun-Jie Chen
<chun-jie.chen@mediatek.com> wrote:
>
> Add MT8195 ccusys clock provider
>
> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

Also, I noticed that Mediatek drivers don't support the reset controls found
in these clock controllers. Are there plans to add support for them?

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
