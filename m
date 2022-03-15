Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 708B0C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Mar 2022 00:25:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b4PecebrqgN1iD2KVa5irphyoULCjJmNzgR75Tk0jU0=; b=s+zS9BwZMo1AYU
	5me6MweTMhyG+tXgsvf1yNdrJ/kao5Qy2EY7L8N5IwTXxXt7Dk67MzHxB3s08QqG2UGTJMzCOZiqI
	5blm4IAzvXvb6/hys0SPJhl6XiZJG4kark650nREFWKk2kfQCWeBMHGEXgPZDra8Wsse/0mI6qaWN
	SBOj7N98IvYbLBu7jLi8MwqM6SpU35hXFEZ/mYi1/upj6PWkKMVY9eHQYuVfLxUgREjRo8He9Wwi8
	xlnxxKMsYwQTgUJa2xud70JZGrCnbOXpxa602l1LYYqLMtq6hEEbTf9Uc3nghjbEhBvcT8LObdja7
	zivcxhJiz3M5OR7w5rUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nTuzy-007Jb9-9b; Tue, 15 Mar 2022 00:25:14 +0000
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nTuzq-007JXp-Pg
 for linux-mediatek@lists.infradead.org; Tue, 15 Mar 2022 00:25:08 +0000
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-2db569555d6so183880617b3.12
 for <linux-mediatek@lists.infradead.org>; Mon, 14 Mar 2022 17:25:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oFgUmsFBeWhrxAgbRx3ZPlrcD+KJ/QlZxjkaKnGs9TY=;
 b=U7BU/Xssmkct3SmrFNOmZc48Y326bcvWjc/Kj51H02n428e9Ssa/UnCwQTE4QEWa72
 p1BTkRORUCrJsLmxr0hQDhtMCTX4FHsh/t2bJDJYkRRPpCg2snsBt70TxAh7hoHPENfY
 CsGSw0XE6KxdW50EbOC3tnd59Gn02/T5UXFFHhkrYY/cgWXKm2dYPUxoa8CJPChrwFa0
 DBuc7XhISM5ScloWZpsrNbSueK9qdEPS8TsGFoufnJxf08O+gXn3qT+w0yjp7ry4xXss
 Eru4fR862ITRufKr2Fqrld9GO4aWzdEKd6p5v1M/Z6D9tCdcBpSxYheZyII22Yg6b2+K
 XRtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oFgUmsFBeWhrxAgbRx3ZPlrcD+KJ/QlZxjkaKnGs9TY=;
 b=Pb5DsDrbcR8+xGYx/8P1fYNJ+XuIYlc2FLPkq+Jfwtgq4j1JDj7QM4nzJfStBFhbI3
 kua5ftp9+42pDrL2G2wc1wl9x4YPosoEjVlbDzbhOZAUm46c2a5HCH2sIwmi6J2Xx7EB
 iczQ3GtCPJebqeSY5wefL9QBF/clyUyxZrgROPy4/iQ2G7ucbvXo0N2V69GFnQbs20Vw
 58qzh7WR6rFAr8fNyl/3TCmu8DFcWJEenPXGg9/q+FmUg686ABYdirdfk9QEN6vq7b1N
 PmlJHnZor7p/ySvhzclwAlh5FdiQ9dpv9D54ILzgSYUsDwPpwr/xEX9IsbYQIygcsNgP
 +s4g==
X-Gm-Message-State: AOAM533yJxIAdNGHu2Guz9huHguPzaiIBX1ynL9Ne2+QX7ud/08scHwE
 mNGc4MoqGtTKYrk9b3Fa2XzWe54ElZ6i80Ku9/hV4Q==
X-Google-Smtp-Source: ABdhPJzwtMCaE9ZRlsN3LeSRTwUp00anevncQ/91Tm+zkgQlFy1tqheROahl6k8549XVjqvJrx86WPykj8B75gOmj5o=
X-Received: by 2002:a81:9c47:0:b0:2db:9e18:6e75 with SMTP id
 n7-20020a819c47000000b002db9e186e75mr21608351ywa.437.1647303905492; Mon, 14
 Mar 2022 17:25:05 -0700 (PDT)
MIME-Version: 1.0
References: <20220308100956.2750295-1-wenst@chromium.org>
In-Reply-To: <20220308100956.2750295-1-wenst@chromium.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 15 Mar 2022 01:24:54 +0100
Message-ID: <CACRpkdb1cVxDgG_96v=bLXaEOscrCqejUDKdEGZGEp2NMsSHqw@mail.gmail.com>
Subject: Re: [PATCH v2 00/11] pinctrl: mediatek: Fixes and minor improvements
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220314_172506_895452_D2EB6017 
X-CRM114-Status: UNSURE (   7.72  )
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

On Tue, Mar 8, 2022 at 11:10 AM Chen-Yu Tsai <wenst@chromium.org> wrote:

> Here are some fixes and minor improvements to generic pinconf and the
> Mediatek Paris pinctrl driver.

Nobody seems to be against so I just applied all patches for v5.18.

Yours,
Linus Walleij

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
