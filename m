Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BBBAC3ABA4
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Apr 2025 16:45:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5DagT191PUrxqNoIjJ1w3Cfp9IxiWt5tMd8A85d8XbY=; b=S05nP45Ajj1NwaARrSk94I6cVm
	I9jGLCyRmK107ZgWs8TeZJWNxETh+y86kJQg1XUArJEMiAFIG0npUz6PDczYOICT7qHYVEMF4J3mt
	VrlVE3X5DRe6xeTdW6cfVk+BP85skkjBcgWp/fHgK5GDFrr5UyNYDtStJeQ1m/dUbHWmuqqOxn3bR
	gYyLJYkJ9y/DD/yE8zbLsewZGh/WgqmM263ax9IZYEZXs2gh/x91xXUu5xZKPbLmxlUy0XoEwUPDr
	HAAwg4c1KkDmmD6xX5BVx4GeiaCQU57ORKN+LUeOjMOphnZGj3r2y667VYtav/AExcOJ2x8YEzPF4
	TKyDaYPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9Rbk-00000006yLX-0rue;
	Mon, 28 Apr 2025 16:45:28 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9RYa-00000006xzT-28V8
	for linux-mediatek@lists.infradead.org;
	Mon, 28 Apr 2025 16:42:13 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-2ff784dc055so4691008a91.1
        for <linux-mediatek@lists.infradead.org>; Mon, 28 Apr 2025 09:42:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745858531; x=1746463331; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5DagT191PUrxqNoIjJ1w3Cfp9IxiWt5tMd8A85d8XbY=;
        b=Aso/0/Inzf6xFZAS++j1ZvagZiZ27xqCUjRwxreZ0DQnF9JhT7YuwqxF0L1icbfoEx
         kvczgMB4QgxFJnrCi/2MemWhIS70wRKzAPPrXkP7Dy9pAKSakfHbYRsZ2WyBSqGfaAZw
         YT9FcfiyW5Jf+uLXVpdg22ROhHWRP3eQ/hbDkW+T/mpsvBiY9K4CD5LgWZQrpDNk6oHJ
         FrnTjis6vswvkOOQ4wyy8ndgTKzqpqF2MZzp1bM8E0lm84sEJVk5ABxxbrCefCi2HMyw
         9Ii0pMN9JLMT9x7KkiSm0D6KVLLJ028Bo1KL8QRVl6JbyMTfL4VMx5u311sOtd39zsFv
         MnHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745858531; x=1746463331;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5DagT191PUrxqNoIjJ1w3Cfp9IxiWt5tMd8A85d8XbY=;
        b=Tw8jtATlDmezQhUIRdsBWcT0iQZi1kp/RPfO/4YNtC4SELKZ7ZMpDtCIZ35TwiPGa1
         ssOiggsyU4ULSHfNWyFdPYromZJODUklmp1p2d5yxal1iJBgJ2Vb7eh4zAX4MNurvCGj
         aQDXK05ChMJyB7H4OfEqPrpKBuokC4mVubfb/8vy25vSOTJ2kttWv1nYtZv9aqWpyyG1
         xoHS4InKua4RBDh4UyGDd5+ZvkrXopk8p63Eettn7oGMBLv7ttqKonoyXaRi4O4O/9Ru
         HIKrFULSRTeY7ul7LQbilX9Qahl33TV1Cm0M234k5cePlFnXTgmQsjN+UkZY9u8HxCF9
         wVFg==
X-Forwarded-Encrypted: i=1; AJvYcCXSX4ndrgWEmCp8i01gWsTSGB+vd9oN2fK980dqr6zsR/c/JhMwuqfcIu0uRws8kMwaWJ1XwgOy6Y80io5WYA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyrr0X7V2lqflxQUPyZmwVwtpDeDquWGEgY1w/2AiMX8tzwMzCM
	tkqOGmmn+0idDCGTY3Dr1Zs7vwOMkl/teJo+YYlvvtNcYjCT+Bw5pY+Bww==
X-Gm-Gg: ASbGncu3UJg0oHFQmRVuICbJ0nOnsw5SUGgTtQWDXoiVoQVhQk5XL8Ko4S7VfkD5pG3
	7gKZuuYtSBN29ucx3Yibj+H234K4vC6Iv8vxwi6ba05zYtkALUcm8i6Dhp64iHk6mRW8VyjAWLM
	ajI+qRSxfbLAsNkLIH+4YryyY9MKculeXJJUqdY7xJzy9l4FHwJvsADZrDGtZOusrDYVNoLjPeq
	QBDhQdj95f8/KCPRQaLVvdeYvkW+rWmwBamGUYq735NymmYl0Riq3vMLi+qHThrkucI7JJ0dFzf
	3C4Zoty5VKnzpC+AA5Xhe1tDnfgis2pVRqW5KQhz
X-Google-Smtp-Source: AGHT+IHtkkcAiAjErI22upOMtY/779xLxpGrsL6Tvz8VbAlABPzIvN91V7aqT4IXp3nDp8Jr5JDPQw==
X-Received: by 2002:a17:90a:be0c:b0:30a:fe:140f with SMTP id 98e67ed59e1d1-30a00fe141bmr10741164a91.28.1745858531367;
        Mon, 28 Apr 2025 09:42:11 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:67d:4372:d1e6:def0])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-309f77371efsm8287434a91.9.2025.04.28.09.42.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 09:42:11 -0700 (PDT)
Date: Mon, 28 Apr 2025 09:42:08 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Mattijs Korpershoek <mkorpershoek@kernel.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	linux-input@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND] MAINTAINERS: .mailmap: update Mattijs
 Korpershoek's email address
Message-ID: <aaudepakzqnbbda5vynji77uuxvfmw7e3r5odfqowbtppkokmn@tbymrf3mohrz>
References: <20250428-keypad-maintainers-v1-1-4e9c4afba415@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250428-keypad-maintainers-v1-1-4e9c4afba415@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_094212_544965_1DD5C5E9 
X-CRM114-Status: UNSURE (   6.93  )
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

On Mon, Apr 28, 2025 at 10:40:17AM +0200, Mattijs Korpershoek wrote:
> Update Mattijs Korpershoek's email address to @kernel.org.
> 
> Signed-off-by: Mattijs Korpershoek <mkorpershoek@kernel.org>

Applied, thank you.

-- 
Dmitry

