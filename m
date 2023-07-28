Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AF91C001DE
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Jul 2023 03:53:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=He4/7ZjAaJYV3oY1Q5qsfXRQN2c+aw/i3Z8upeCFxZY=; b=Hp74V6CMUlPJXM/vCyB8Ee5C1a
	gg7JMY+OgoA0e7sFj9p6DVyZ9oCxbBgxMy2Eybr3KYXlpwO7ceLehzf39YeT2Jv0msJvQcI7QwShJ
	PJjv/yIRKn3WmdSIaj+IUUd6nszWdg+6QyrjvGB6sHWdE1CWia70Uj8EtbWjJv4OGS+sU3MQEFg7y
	VW9n0Fm4Mytny3lJs1HdOxghFv1ecLZEAsFIgihUaunAvyOvRNOTp6WqFkTcOLE96/RqQ9J8gGI5M
	6YbjkRwClH4Pe2jFWCvgjPZJlWsH8lygnTQWZhAHdEijjvmH30p408mZ1hZfnqY7C25i5gFj9KZQN
	wxxF0lRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qPEY1-001Tz5-16;
	Fri, 28 Jul 2023 03:53:49 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qPEXx-001TxC-2c
	for linux-mediatek@lists.infradead.org;
	Fri, 28 Jul 2023 03:53:47 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-686ed1d2594so1628286b3a.2
        for <linux-mediatek@lists.infradead.org>; Thu, 27 Jul 2023 20:53:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1690516422; x=1691121222;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=He4/7ZjAaJYV3oY1Q5qsfXRQN2c+aw/i3Z8upeCFxZY=;
        b=UJJSmsvKuA+7vHlEK5zqxwvD8B6Yt8XfXuAItoiHvAj3OoqGrALOYkCYQccCqOBd5Z
         tmtMhmnK6zN87HaVH9ygwQIQdC4SZMGydBwDwFW+ZmxwVd+Yinpn/4wGAvXFE++zJAos
         O2FXcKEu9fLVqrGMsoLKFn9LRJ/AlJZ69+Cpw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690516422; x=1691121222;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=He4/7ZjAaJYV3oY1Q5qsfXRQN2c+aw/i3Z8upeCFxZY=;
        b=eB29h6QiNyTnt0Jhrx2KEJ2dsCA3Gvu+DbtSJtl6thu/X6X0m/CZc/ymLNf3aL0OXi
         +iP1v5JO7MxZR98vNq+vB/4MzUQgz3yNpUVukiPcV0Wid3nBGfQKcCi3haZaY47RGaxr
         JGgPBNEgwiGY90cs/P/0NmnFFPT5jOjNrUNZ7QDzDSuJnUDGfJBB89D97SmAsF+0WLw8
         LIcKb6jcO1kFQrtBM7TWqe7kl676stzpALkdjo9yHA3VKgzC6G1nuiAKFGH7iHx0J8Ie
         ZnUe1ab8IWfxwkL1QRNN0Q+Q4qxghnpf3+A5JPsn+NA+zv1v3Yf73AV6br/VK+ZKWIYd
         XAEA==
X-Gm-Message-State: ABy/qLZaHnWpzzqd/s/xK2xSQw+J7NJHmzjLLSnQM1MNx1S87MpyUPYr
	t5nBNoIPWjnijHoDU3V0oUUYiA==
X-Google-Smtp-Source: APBJJlGsTHxAEzSXpONNRDxyKgcp4KNYdrSE+s2zmuMCZXMTXa7hKLkFVzAtadS71u0jqoE5bCgxyA==
X-Received: by 2002:a05:6a00:194f:b0:680:2b80:8479 with SMTP id s15-20020a056a00194f00b006802b808479mr868615pfk.19.1690516421816;
        Thu, 27 Jul 2023 20:53:41 -0700 (PDT)
Received: from google.com ([2401:fa00:8f:203:9314:7aae:8542:aa2d])
        by smtp.gmail.com with ESMTPSA id d26-20020aa78e5a000000b006870ff20242sm212301pfr.186.2023.07.27.20.53.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jul 2023 20:53:41 -0700 (PDT)
Date: Fri, 28 Jul 2023 12:53:36 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Andrew Yang <andrew.yang@mediatek.com>
Cc: Minchan Kim <minchan@kernel.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	wsd_upstream@mediatek.com, casper.li@mediatek.com,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2] zsmalloc: Fix races between modifications of fullness
 and isolated
Message-ID: <20230728035336.GL955071@google.com>
References: <20230727062910.6337-1-andrew.yang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230727062910.6337-1-andrew.yang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230727_205345_848911_D5463B53 
X-CRM114-Status: UNSURE (   8.32  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On (23/07/27 14:29), Andrew Yang wrote:
> 
> Since fullness and isolated share the same unsigned int,
> modifications of them should be protected by the same lock.
> 
> Signed-off-by: Andrew Yang <andrew.yang@mediatek.com>
> Fixes: c4549b871102 ("zsmalloc: remove zspage isolation for migration")

Reviewed-by: Sergey Senozhatsky <senozhatsky@chromium.org>

