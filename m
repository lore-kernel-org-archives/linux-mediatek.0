Return-Path: <SRS0=xI6Y=LQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E6C9C2B9F4
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Jun 2021 09:29:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CC6A061352
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Jun 2021 09:28:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CC6A061352
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=02TLHdK/JV8xgyfwp4RQhamS2RykJ0XT/MWTT0Ri3ag=; b=NARyJMQJoO+bBH
	9iXMZ3WDYhzq3mDt6QdLGZ9SaUz4OZpzgCeSOH0GhFoZHN8EPq07bhMHyD2719dI00zGkDh/gNeKr
	VJkqpKQI2zKN0Eyd/5aUH+3vPTaREjkFYhTApuopKpYqM4TAtFefVH190mr/0MF5w1G2OPJy/ymF7
	M/pyNrhTwW69QOAty5iI1xg2YwwvSnno5JlakX70kCnBV9iFrF3DH0cHdR6R6P5dsyVDABSqjcxiQ
	SQgMZmmAB4oyJLoEOM9JLhXpLLHRls4qSBJl1jHhNpkdwDme8eFosDpFobhuViQG7bqAyyAgDU94b
	Yh7DiNxYTBUFfhhx1L/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lvci7-006P54-Be; Tue, 22 Jun 2021 09:28:47 +0000
Received: from mail-qk1-x72b.google.com ([2607:f8b0:4864:20::72b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lvchr-006P0W-SP
 for linux-mediatek@lists.infradead.org; Tue, 22 Jun 2021 09:28:34 +0000
Received: by mail-qk1-x72b.google.com with SMTP id j184so37768752qkd.6
 for <linux-mediatek@lists.infradead.org>; Tue, 22 Jun 2021 02:28:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=E4DQbfXpC/jltQHrmKqBHkqXNz4Cwyp0eCIHowO6dsE=;
 b=UuHF70wnNI3ul+ZHhqnG6aOsBavnT4oLVZB+yfHB/nEC0ISs1e1rg+GAlcDJncL/Np
 tR9CBRszzXT9NkQpQ7rnJZaFEwYtKPcLqx5uH+0gcWQ5dgg6eF9burvSkSFUTArQNxo9
 bmQhvemRjqXGhPOW80wdSpGuA+BGQdiSOza8AI77rD/GjqmozYM2kQpJOrcxvSy6q95h
 GDEDzMT2Mex2wl6yqQvb1A1r7msSftqBdCkUTW1ONCuoZP14B/FB8qRhQibg9ExwdxjU
 KjymMi9bWIdb7RjBEkVaaWZOHlSYlwwVwYhkImS8j6ebeIIOH0mjrQD/yNbuPDmObCdh
 1sNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=E4DQbfXpC/jltQHrmKqBHkqXNz4Cwyp0eCIHowO6dsE=;
 b=Auu5MXtIpqiGPzNqPllHPqbBEFrFt8QdQIcu5FMXZZTjojx++S6OYiEvlJzyyqucQ1
 GlocUxmWr5XXoQE/mTqMEJFI6rY4SCyRkJHAQAK2J2i/5ZAjk3prfRh3d5KoQjBbjiAq
 MYkAC+U87lIek0rHDGHSycj04BFDv9AjpQDi+sxThhCOI7vLQj+LyBd6DAKshenV7kp4
 J9NAZBjvZaTxBf/VgG05LV4euFIFihtgUVUQfeod7LCpk7J9iGRI4jEk61+wwtwYQr+/
 PQ6ytJ3WviX37hj8VMZZmruplXeeYh0PBuAsGUXI2LS/jmzYtWG5S+xFROvFCA/3n+sc
 L5sg==
X-Gm-Message-State: AOAM532jyvBKAGK6ff6UfaZEh035AdkfdAXtf4cDOoA3dSJ7Ednm+9vN
 Efr3pCqK4r5cd5GH6fBM1QgDZi56N7e4mTncE1ED2w==
X-Google-Smtp-Source: ABdhPJzpBHPyht+lAjdu5BHc9KbrkBS1r7WeeCuc7EkB1p9/MtfIKFKON+Lj/E/4fUHj/Tk6lQGR93DsQjYoUZHYv/U=
X-Received: by 2002:a37:670a:: with SMTP id b10mr3184065qkc.352.1624354107698; 
 Tue, 22 Jun 2021 02:28:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210620114756.31304-1-Kuan-Ying.Lee@mediatek.com>
 <20210620114756.31304-3-Kuan-Ying.Lee@mediatek.com>
In-Reply-To: <20210620114756.31304-3-Kuan-Ying.Lee@mediatek.com>
From: Alexander Potapenko <glider@google.com>
Date: Tue, 22 Jun 2021 11:27:51 +0200
Message-ID: <CAG_fn=UTfR9yKrkdRDjxFn=vgR_B7kzytm9WDWT14Gh0PLXyJg@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] kasan: integrate the common part of two KASAN
 tag-based modes
To: Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com>
Cc: Andrey Ryabinin <ryabinin.a.a@gmail.com>,
 Andrey Konovalov <andreyknvl@gmail.com>, 
 Marco Elver <elver@google.com>, Dmitry Vyukov <dvyukov@google.com>, 
 Andrew Morton <akpm@linux-foundation.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 kasan-dev <kasan-dev@googlegroups.com>, LKML <linux-kernel@vger.kernel.org>, 
 Linux Memory Management List <linux-mm@kvack.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 linux-mediatek@lists.infradead.org, wsd_upstream <wsd_upstream@mediatek.com>, 
 chinwen.chang@mediatek.com, nicholas.tang@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210622_022831_988731_AADFC28A 
X-CRM114-Status: GOOD (  11.24  )
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

> diff --git a/mm/kasan/report_tags.h b/mm/kasan/report_tags.h
> new file mode 100644
> index 000000000000..1cb872177904
> --- /dev/null
> +++ b/mm/kasan/report_tags.h
Why don't you make it a C file instead?

> +const char *kasan_get_bug_type(struct kasan_access_info *info)
If this function has to be in the header, it should be declared as
static inline.
But I don't think it has to be there in the first place.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
