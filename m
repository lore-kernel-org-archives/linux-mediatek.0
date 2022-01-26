Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DA1EC28CF5
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Jan 2022 06:32:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uidiEgB+1fOB0SWJPnTvpaObvIKgwyUczwvEyYjGpSU=; b=pnIs9RkOS3jnKG
	GvrnBdwwr5+4nAI+PKWTAGB1M+YYlcn4Csn77iVyMpredLpYdL9TcoM40AyvuOMjsHHtqQesxJZcp
	OYoUYVA1weAd1GLxdivP3RPuBYlZy/f6DgrznL3Zud/eemXkmMBGkmb/wRKGWa0BVsQgTxKjd8aUS
	c61y0RPoK4iwYfaNoJHLPOS/dmrFjcA+wYtakPATa9hutbBSfOJf0emHrOcCaXIWrGO4Mf/VImNt2
	3QrlheGjLVMJxzoW4GBs8le7RYmX4pQslHkSMiVE4LN4tkkKaLFCwxyH5NGuEBoSGBZjOh9wg2zhT
	ppJPVaBJ2DbtStQhfCAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nCbr3-00AIDZ-HQ; Wed, 26 Jan 2022 06:32:29 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nCbr0-00AICw-Qg
 for linux-mediatek@lists.infradead.org; Wed, 26 Jan 2022 06:32:28 +0000
Received: by mail-lf1-x130.google.com with SMTP id x11so61164626lfa.2
 for <linux-mediatek@lists.infradead.org>; Tue, 25 Jan 2022 22:32:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0Fp0FDcVRsgytVsA7uNX5zoyCtUC6cKgLis3XSwsG5s=;
 b=UziTMq+oHkcZf+CdPOSw2KO/pOYI3Twx0yT9IW+NWuMOMzDd8Akz9Sw2sGscNpSR2p
 HwaT0NarR0CjRTa0/eWoMgXHFzGM8L4WQTDkBtSRrrZxuvrkYEXrXDxgBJZGaeBaS3kk
 OvefczNUlofpexf2zs/cVl9Y4bPEsYdLFlenA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0Fp0FDcVRsgytVsA7uNX5zoyCtUC6cKgLis3XSwsG5s=;
 b=JETQJbSPdrvdoY2m7RA7JiPSjn6I3jwUJn9MxLm3H4q8h1ryn+MKnfVaKQ+g0fDvfd
 9Fnq2E/QWOYU2nVC+gXvf1+Z+7FFH6DIzX4Y/Ffc4fR9fe4bRyoA+bi3xk/gsXFN4+aK
 UKLP27r8IHWbKRoLwbic+Qe/ZDA7lj34pd2BxJO6oUsa1np6RH831CmVOqQ2O5piY9Iq
 /0iBU/Iqn/6zEEeo8OXCo4x3fsRJUAdjDdsPkzeZWOw5dDvRbbtKAjXXy9D3RK64cZZ9
 fXyE1fh3fW9jbcYuIUGpReeEtMQgUhyrsxMv3k1oeZRDA8CaqgnQa02YoWO0I4I2hZFk
 jgYA==
X-Gm-Message-State: AOAM532OUwrWxtLiHmF5wGS3X+7cZWwVV1Kq753Giio2yeoH2Lp4e0kE
 7b+0b2bvTygmroBH75iJdbJ74NgI6xf4XiZakRRz0Q==
X-Google-Smtp-Source: ABdhPJx40YsLE/Af6Gf5BM4H114Rgjjk09TTo52LNX6eIVjv6VNOTFi3Xv0rf3/gzUCwHkvPEbT+sz+5kTZR5ZrtXBk=
X-Received: by 2002:a05:6512:3b14:: with SMTP id
 f20mr6679603lfv.670.1643178745160; 
 Tue, 25 Jan 2022 22:32:25 -0800 (PST)
MIME-Version: 1.0
References: <20220122091731.283592-12-wenst@chromium.org>
 <20220125173836.14548-1-miles.chen@mediatek.com>
In-Reply-To: <20220125173836.14548-1-miles.chen@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 26 Jan 2022 14:32:14 +0800
Message-ID: <CAGXv+5GmtbUZdy+0d5igvJrSZSb16ed8=m1YVZCLC0OV1aeXBA@mail.gmail.com>
Subject: Re: [PATCH 11/31] clk: mediatek: mux: Clean up included headers
To: Miles Chen <miles.chen@mediatek.com>
Cc: chun-jie.chen@mediatek.com, linux-arm-kernel@lists.infradead.org, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com, 
 mturquette@baylibre.com, sboyd@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220125_223226_897563_1F46EEFE 
X-CRM114-Status: GOOD (  13.91  )
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

On Wed, Jan 26, 2022 at 1:38 AM Miles Chen <miles.chen@mediatek.com> wrote:
>
> > Some included headers aren't actually used anywhere, while other headers
> > with the declaration of functions and structures aren't directly
> > included.
> >
> > Get rid of the unused ones, and add the ones that should be included
> > directly.
> >
> > On the header side, replace headers that are included purely for data
> > structure definitions with forward declarations. This decreases the
> > amount of preprocessing and compilation effort required for each
> > inclusion.
>
> Is this inspired by [1]?
> [1] https://lore.kernel.org/lkml/YdIfz+LMewetSaEB@gmail.com/

Yes and no.

When clk-mtk.h was removed from the included headers, many headers had
to be added. Also, clk-mux.h did not include any headers, so if it were
to be used by itself, it probably would not compile.

Using forward declarations for the data structures instead of including the
header files inspired in part by that series though.

ChenYu

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
