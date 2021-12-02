Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9FC2C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Dec 2021 01:33:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xDxM42FVVUZdTZViIiFWgPJn4e6Pwx5NwxoQuDyngwc=; b=eX0MGt/yyE7653
	ar0Ze9i1xr9X7jrNoIoni3iDdnXVzcWg3P/Ng2J8vgpLWIiMVd/2aoFlvWFw+NOpsfBdaO2w3wy6l
	8BYVa4u2gwqeEi+p/dDA8X67ZjXq+usuqZwaSzab1/bQ9Fyda/NL9Xk4iS+Ry8nxhciHNBA2Ll23Y
	vKlLGnmrJTsxNBLd3fUpdbLojJbwey6Re01rDqYbIl4uP/RvHNvWCBhFPceW2QyYORF38M6quUUL7
	evzL4CHovxUxpjo3pc40H3ILsr3YuJdMiN1JtCOUYBurGQP6LSGNg94BVUajnE1rW5d8ZPiJS4LCy
	qzVbxYu2pKiDgiKyLFcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1msayF-00AWn7-Om; Thu, 02 Dec 2021 01:33:11 +0000
Received: from mail-ot1-x332.google.com ([2607:f8b0:4864:20::332])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1msayD-00AWmC-Lz
 for linux-mediatek@lists.infradead.org; Thu, 02 Dec 2021 01:33:10 +0000
Received: by mail-ot1-x332.google.com with SMTP id
 n104-20020a9d2071000000b005799790cf0bso37899386ota.5
 for <linux-mediatek@lists.infradead.org>; Wed, 01 Dec 2021 17:33:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=St7ZlQ5TKkMMGBhEXGVrQT8uIhISmmCTPfgODmJFYt4=;
 b=sBbWN38dYj4IwcUfUvDgNjWKR06ar7bK7pmch8Muh4vIrMyc2z7LQfugwQQUMCHCad
 Yuf7cR60DBLWsvGiEaqQ8t8CugUur3jqwlWbooPi3+lDjox4Ld8v9rFiA+wtZBAqP9Nm
 /FEQAGe8+ql4lb8/SS8vFIuRhxdljR+3nthE1rLXxONzgIO6HDlZhWhQw+H9J6n+MJJy
 MpM8MkUpHG5unW0jq6HF8fevjt/N+WMm+sfbqyBS2iDLQRvb1i2lWrhPi79HS6Q7HXs5
 g8732ofx22RhpcE+gT0sKdo5aQuPplz/WUKtQomd5sobq1NkFFp/YubpI9y0pH8aGSBl
 Kahg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=St7ZlQ5TKkMMGBhEXGVrQT8uIhISmmCTPfgODmJFYt4=;
 b=cTMJ3GNfJ8MP7LCcSFokT57Up5015YmUzc9molgPa17ji/e8htsRnPO2rRgNhkyXUy
 2pZLwW697Bv5oz8CERPekr6xqehKu0zVQMIfT0M7VR43K8UZkRopmxoG9Vl6Ht6SP40i
 HSHa/tpyoYDKSYVOlA8nkw07vDtW9Isjc9271MO3f1uH9dVKBiZyNa3jAa9cxR1Lew6P
 v9oz0ybDJQZkUnZ9cC8o4+d9lYHs9waIBAoPDaQMRxQBm7+CEXKf/xHsowgY5D2wdFGI
 qKWObg6V5B78lUmntOMtmOOHMtzhnrUab65AsjefBN/Mg+UvA+eZmZPDry/eBBx8BqZi
 v7gQ==
X-Gm-Message-State: AOAM532RjH52ZqYMD5gs3VwMkStIUIDpi3FkC45dp6xZo2clGu6bwfwm
 ctowoSs443RqdyOctcTCyl164fu45QQ555Ky7dHcbg==
X-Google-Smtp-Source: ABdhPJyud5/Vg+fpTaCK3dlNFqfobGtRMpGiSf/MMruh0S47buCuK0W37hJGSFfz7QDNDKM2gCydOdU4cRNJc7Uv0g4=
X-Received: by 2002:a9d:74d0:: with SMTP id a16mr8755400otl.237.1638408789028; 
 Wed, 01 Dec 2021 17:33:09 -0800 (PST)
MIME-Version: 1.0
References: <20211127140750.GA24002@kili>
In-Reply-To: <20211127140750.GA24002@kili>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 2 Dec 2021 02:32:57 +0100
Message-ID: <CACRpkda9aKS+54aRa92xe-cfbvpkdOAkpUptGzWgDCuc67aL=Q@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: mediatek: uninitialized variable in
 mtk_pctrl_show_one_pin()
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Sean Wang <sean.wang@kernel.org>, Zhiyong Tao <zhiyong.tao@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>,
 Chen-Yu Tsai <wenst@chromium.org>, 
 linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, 
 Nathan Chancellor <natechancellor@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211201_173309_758118_B2AD11BB 
X-CRM114-Status: UNSURE (   8.18  )
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

On Sat, Nov 27, 2021 at 3:08 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:

> The "try_all_type" variable is not set if (hw->soc->pull_type) is false
> leading to the following Smatch warning:
>
>     drivers/pinctrl/mediatek/pinctrl-paris.c:599 mtk_pctrl_show_one_pin()
>     error: uninitialized symbol 'try_all_type'.
>
> Fixes: fb34a9ae383a ("pinctrl: mediatek: support rsel feature")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Patch applied.

Yours,
Linus Walleij

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
