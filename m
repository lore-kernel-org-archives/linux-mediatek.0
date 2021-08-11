Return-Path: <SRS0=F7c8=NC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D44A6C4338F
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Aug 2021 11:16:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8DEAC604DC
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Aug 2021 11:16:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8DEAC604DC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=slSER562UkgBT6Q3rIbBdPgjzPrd9rrMwnc2bmBCQwE=; b=AZbsjIatq/QMWZ
	xmAtsq6w9b/qRz8bjgcZnNypo+mdEpsS6dJ00wrc231aQbdHXw1GMYMkdvleS4sTAFX4ht+hjSWnU
	cvDjvbwHcB1JiAONYhUiAL8WfQQ1lvnwAVTm8aSpBpTPipvD38Zu+PQH8F735ctrgfSBhFinNGEUX
	8y/1tc6y/Hed3u3RpntknNaJk5EEYy3jrjQoTZ+5/BjQEiGvfafhe0bVaL+it6R1tlxH2nZlDmVsl
	F7e9a2GxhvNlBp98aBm0wjJG1n4ZuFdfSNwh0nnJKHOHFyoB1Q4xDR8DeL9WNO+nnn7Sf9Dox9Mxn
	oMnCFMx6GYdNSocq6oPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mDmD8-006kJY-Rt; Wed, 11 Aug 2021 11:15:50 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mDmD3-006kIa-Fu
 for linux-mediatek@lists.infradead.org; Wed, 11 Aug 2021 11:15:49 +0000
Received: by mail-lf1-x133.google.com with SMTP id x27so4918830lfu.5
 for <linux-mediatek@lists.infradead.org>; Wed, 11 Aug 2021 04:15:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=E4L1scxTWu6C9n26vo2qgoZeLEILa/cvadfoeBRn16c=;
 b=PBc4H6TCN8oNeqbaSgDwDWagMBXKbNt1oKWB35rQaKRrQtpSKCgtaCrQCExT3sbXU3
 EtL2uzoqZr4BiELxdl+Ag+4acwfWjjW1GXa5Qc0sjQzLjVwazoUZaGYZc0MPqNoOImuN
 erckDhpJnqjfJqupW69vQsiXFvAcQyHG1nvsM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=E4L1scxTWu6C9n26vo2qgoZeLEILa/cvadfoeBRn16c=;
 b=SdeFgF8VYS9m/VP0MlHv+VPC0qqsd3xDWAK2C0dhU8PFn7t/3Hj6Wz3He7955zpM72
 QPr+rsdIXpIf1pqlnjCZD20tFL1n6aS9Q2QGv8pq3kdMSWaf55wt+cnc+6koYjdi8+QA
 39dsJwDH2u47Gj9h0CLueadCcVX7bLRCNedpjiBD+F4slQvVYope9Q/L8mckgKz4c4Ts
 6nzGbanZQEQWPr6pjzZwLKJnUx2rN15DlzGxVNUHn1MszfvIa70PP6n7yRx7gtPAWf3u
 oJ7EFuEw5LfFCnBkeO3+0SrcwL3e8t/Ld5xGLgoMfEg/kg+HU8p3hCyWDB5KAxyGZg0N
 HEIw==
X-Gm-Message-State: AOAM532zigct3KE6nHFADZxvWysdKf/Lv9fOUpgEUVtP1M+hICLxjksb
 AgWYu/+X9qQNME4CMv7b+x2c+dQxs/b7yXQw
X-Google-Smtp-Source: ABdhPJyFjI/CPiDExcpKUXqBwUfNmhz8bEAHT8Kwy39aOG+4XJ094Y2C8SX71SNw2IrAkIhHfrQOnQ==
X-Received: by 2002:a05:6512:33d3:: with SMTP id
 d19mr2139932lfg.394.1628680543566; 
 Wed, 11 Aug 2021 04:15:43 -0700 (PDT)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com.
 [209.85.167.49])
 by smtp.gmail.com with ESMTPSA id d15sm2102388lfq.96.2021.08.11.04.15.43
 for <linux-mediatek@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Aug 2021 04:15:43 -0700 (PDT)
Received: by mail-lf1-f49.google.com with SMTP id n17so4818151lft.13
 for <linux-mediatek@lists.infradead.org>; Wed, 11 Aug 2021 04:15:43 -0700 (PDT)
X-Received: by 2002:ac2:55b4:: with SMTP id y20mr24729347lfg.33.1628680542749; 
 Wed, 11 Aug 2021 04:15:42 -0700 (PDT)
MIME-Version: 1.0
References: <20210802121215.703023-1-eizan@chromium.org>
 <20210802220943.v6.2.Ie6d1e6e39cf9b5d6b2108ae1096af34c3d55880b@changeid>
 <0aff1abb-734f-c714-6ecc-c906862255c3@collabora.com>
 <CAOak1e8n6JpNKODfM57OTtbCNz8UBbj+wefwipVWP_Ep6SHmHA@mail.gmail.com>
 <014b8075-8588-d741-e6f2-edc0567e8c8f@collabora.com>
In-Reply-To: <014b8075-8588-d741-e6f2-edc0567e8c8f@collabora.com>
From: Eizan Miyamoto <eizan@chromium.org>
Date: Wed, 11 Aug 2021 21:15:25 +1000
X-Gmail-Original-Message-ID: <CAOak1e-+v1e+x1SE_Pr2T8eH+gyLikBL6J243ry5tkWAVVx7tA@mail.gmail.com>
Message-ID: <CAOak1e-+v1e+x1SE_Pr2T8eH+gyLikBL6J243ry5tkWAVVx7tA@mail.gmail.com>
Subject: Re: [PATCH v6 2/9] mtk-mdp: add driver to probe mdp components
To: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Cc: linux-kernel@vger.kernel.org, wenst@chromium.org, houlong.wei@mediatek.com,
 yong.wu@mediatek.com, enric.balletbo@collabora.com, 
 devicetree@vger.kernel.org, chunkuang.hu@kernel.org, 
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Minghsiu Tsai <minghsiu.tsai@mediatek.com>, 
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org, 
 linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210811_041545_589692_0B838256 
X-CRM114-Status: UNSURE (   8.36  )
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

Hi Dafna,

On Mon, Aug 9, 2021 at 5:53 PM Dafna Hirschfeld
<dafna.hirschfeld@collabora.com> wrote:
> You can send it also as a separate patch. I don't care too much.

Great. I've sent a separate patch to make mtk_mdp_comp_init static in
https://patchwork.kernel.org/project/linux-mediatek/list/?series=529639

I will continue with further work to use the clk_blk_* API.

Thanks,

Eizan

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
