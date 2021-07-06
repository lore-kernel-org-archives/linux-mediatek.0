Return-Path: <SRS0=SroS=L6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B989DC07E96
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Jul 2021 08:53:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 74B97613C9
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Jul 2021 08:53:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 74B97613C9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5Mu+Tsu6mTQyFRf5qNoj4chUDgQjc4FyS34NmuWfZxQ=; b=3dyFVjrsp50VwY
	/5yozOHT+iU1tPkNDv6BEmrN8KqU/wfCzNjPBy3HqowNdKupNtAAX7TTMP5JXFk93ogJcx7omA3k8
	fgKJ89ubRXnMtY1z3CAHd10abXC52QJ1QZvgzCeqRINQ1aupBHLWfFAnHymjyWdZWAWokaUlceujC
	2aPaHsi3r3SsIiALmsHUcflHWdck+vW70siVAMxc1ZIHB+ZYSTPHAmUuDLkml0pEy0Ifly6AIrE4Q
	CRYIlMj8/J9uJCalYlI0GdE5eF7YkiFTqIbo2WJsZFX0nSV2JFUvZ8gbBal2hNv4ScT+BRu3W9RBb
	HMua7di1zz30FMiI32Ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m0gpT-00AqMa-CA; Tue, 06 Jul 2021 08:53:19 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m0gpQ-00AqLi-QS
 for linux-mediatek@lists.infradead.org; Tue, 06 Jul 2021 08:53:18 +0000
Received: by mail-lf1-x12c.google.com with SMTP id t17so37106476lfq.0
 for <linux-mediatek@lists.infradead.org>; Tue, 06 Jul 2021 01:53:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=t/E4OXQ1yUpcqpJdsE6nCWBhoSFlkIPmfOxX8aPkV7w=;
 b=DTYiCFTiGgpyS+RK6tZKJbgUa+7mHga1RvVfVrk1e4Ldm1sbFpIZhGm7tIjGiHqEBn
 H+WdoNqqVTu5IzizCAHi0g5LLOV97JSXDujw598jH/XTyT3VvYHCoQTQm9f18n/Vv80G
 C7r4OLiRmY0K+sUaaxK0lUtNlsNlneXYi41RU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=t/E4OXQ1yUpcqpJdsE6nCWBhoSFlkIPmfOxX8aPkV7w=;
 b=W8b+bqq6CkSzO1UFQ/1tc2Y4kpWxX8EnTeA3HzGua/qq8xTZlQJQpfbJPawGdqgEr4
 BF/gO+wQzTFQY1QmOmxYuFg+e3aHbRyRPrNtH8FIKaJP+ZMfuegXcDjj8fLllO9GFkXH
 P67n7eQWoGQNv/SmT6njcCi+WF8xIfcIbuILSQYpoev/jZz5vto3ZUmne5Nxij5zW4Yc
 zgrMsoDtK//C4nyuHpUt139x6gtQDMlyr71fIDqmnXbMzApQ62hBzXdTpGRjnCh69xQH
 Qzcd0/67ePF/zZ1AaKsTgJVxN1qPhEDWXkYslBUQ0SIdiW4TTSBUrAvHV2qPIwk4wJMR
 QuWQ==
X-Gm-Message-State: AOAM532jBc/aQ0+sn1Zr37A4gZVTrcu3qNdYl6D0iHP4Zss8UJ4LhcOy
 Eph5FsPSQfYfNNDcXK1VZvhcz4GWZhsv9o4HM+Y3sw==
X-Google-Smtp-Source: ABdhPJyN89wCwWKtKG3ZEK4xjbWdeK9ZZ/vgy3TxGsAGRi1r3BmzHgL8UfUr/Cu2Yy+9OcrWcEyzkdPQuOSJqRgs2VM=
X-Received: by 2002:a05:6512:3f13:: with SMTP id
 y19mr13831825lfa.444.1625561595053; 
 Tue, 06 Jul 2021 01:53:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210616224743.5109-1-chun-jie.chen@mediatek.com>
 <20210616224743.5109-8-chun-jie.chen@mediatek.com>
In-Reply-To: <20210616224743.5109-8-chun-jie.chen@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 6 Jul 2021 16:53:04 +0800
Message-ID: <CAGXv+5H9d48uZgQPNk6pnwgeduzq6Ov6aRXoNnmKpFDuPL1dew@mail.gmail.com>
Subject: Re: [PATCH 07/22] clk: mediatek: Add MT8195 camsys clock support
To: Chun-Jie Chen <chun-jie.chen@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Stephen Boyd <sboyd@kernel.org>,
 Nicolas Boichat <drinkcat@chromium.org>, Rob Herring <robh+dt@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, LKML <linux-kernel@vger.kernel.org>, 
 linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, srv_heupstream@mediatek.com, 
 Project_Global_Chrome_Upstream_Group@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210706_015316_894277_3125F00A 
X-CRM114-Status: UNSURE (   7.31  )
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

On Thu, Jun 17, 2021 at 7:04 AM Chun-Jie Chen
<chun-jie.chen@mediatek.com> wrote:
>
> Add MT8195 camsys clock providers
>
> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
