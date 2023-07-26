Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4F34EB64DD
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Jul 2023 02:57:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KzW/rGy0LH4fLap0MWB55Z1wHu6aT4al09wHOfF+Fkg=; b=OFIIEMw6A10y8Fi6F7SACmrqht
	stXTd/FDm79kF3C9xC1PTgfHmzOqlojJRQwWf0UfIgPmswgQprd1R5jd5Na+Z1fACRh6aJjUPIxP5
	SMxxQiVNceitMZBieBcgFfFdpgRz6htq+NWop9ImRMJ1OS/axCQctuG/8GHEyasTmniRRz2r8REM9
	X/yJ5zj+WaigEywHJQ2b5Y2h7faxbuc5CYuIOgwQIlMIGBuUJU39gWRuQ56aXFSVmvJa6eJ18kXXs
	NJiVWnmbnL9N1yLmeUfCj9qSVDIA8qUhsTdW8VaBjm1JD/Jjd5u8SzaUfPHwC36CkInUIpQqUpc8O
	CU+TqnwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOUiI-008x6m-2B;
	Wed, 26 Jul 2023 02:57:22 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOUiG-008x5N-0c
	for linux-mediatek@lists.infradead.org;
	Wed, 26 Jul 2023 02:57:21 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-666eec46206so5820081b3a.3
        for <linux-mediatek@lists.infradead.org>; Tue, 25 Jul 2023 19:57:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1690340236; x=1690945036;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KzW/rGy0LH4fLap0MWB55Z1wHu6aT4al09wHOfF+Fkg=;
        b=Lx3RvL8PGnRpdj0gs5Nff7ZN5lTV1K2HUd8DXaOCVSlt00IXLloat8B9zWzAXj8gd7
         YN0go/qOiXHWOOqIkdMfr7Wd+MzLSf6z3DXj1efrB9MelA8ezROYuDZsFAF6yfGMOp76
         DpnfxX6QRJR6B1/00mAG7FntmlZ5qhRrOsM9k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690340236; x=1690945036;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KzW/rGy0LH4fLap0MWB55Z1wHu6aT4al09wHOfF+Fkg=;
        b=ZCKoEnGXylEIpPqF9I4zEVGbPG0qk2xThsVw+q5HUlngrUlI2fKmcDLyt2v+z2UMq9
         7EaxNooQsAIKq3PPvoCRAmedldG6ql6w4pJo8t+CmZ5sReoA9rUXRlajTNNjlM7OVSiN
         lZXFnQInH0hmhh5wn+EOit6yukENKuR6gzWy0OpOjxF1uXpTVQNnJOa2zDIFcrQevtug
         /5x/MTPdWWSEHzZ6KoN9Tq5Vx66ggZAX2OLt336rdHzq5xJaz6w/vTUJZjPS/Ico70In
         /G/ibjbdFIhIgSg/g+U3U4CaiK83Pd/QLbtUSsz0uR6sf+kmzy9gWQdzJGp7/afxZGey
         sVlw==
X-Gm-Message-State: ABy/qLYa9a/Wb7ToHTYWRZdR+TxUWvVrUMoLmw7yG8slfy5hwjjrH2NM
	TF4u1DurIwnSA2VvgBzZbY7/nw==
X-Google-Smtp-Source: APBJJlFUk0Z43kk1Az93vm7xK9BJbIOtVoFyjdZiRzE/WW3xC26bs5uXcxwhdbRPXvg8cpevnX5lgA==
X-Received: by 2002:a05:6a20:3d10:b0:133:71e4:c172 with SMTP id y16-20020a056a203d1000b0013371e4c172mr1061473pzi.15.1690340236429;
        Tue, 25 Jul 2023 19:57:16 -0700 (PDT)
Received: from google.com ([2401:fa00:8f:203:a2a4:d590:6375:66ba])
        by smtp.gmail.com with ESMTPSA id i5-20020a170902c94500b001bb1f0605b2sm11726272pla.214.2023.07.25.19.57.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jul 2023 19:57:16 -0700 (PDT)
Date: Wed, 26 Jul 2023 11:57:11 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Andrew Yang <andrew.yang@mediatek.com>
Cc: Minchan Kim <minchan@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	wsd_upstream@mediatek.com, casper.li@mediatek.com,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: Re: [PATCH] zsmalloc: Fix races between modifications of fullness
 and isolated
Message-ID: <20230726025711.GI955071@google.com>
References: <20230721063705.11455-1-andrew.yang@mediatek.com>
 <20230726023122.GH955071@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230726023122.GH955071@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230725_195720_250716_0B76D7BF 
X-CRM114-Status: GOOD (  10.76  )
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

On (23/07/26 11:31), Sergey Senozhatsky wrote:
> On (23/07/21 14:37), Andrew Yang wrote:
> > 
> > Since fullness and isolated share the same unsigned int,
> > modifications of them should be protected by the same lock.
> 
> Sorry, I don't think I follow. Can you please elaborate?
> What is fullness in this context?

Oh, my bad, so that's zspage's fullness:FULLNESS_BITS and
isolated:ISOLATED_BITS.  I somehow thought about something
very different (page isolated, not zspage isolated).

