Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D82C1C05027
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Feb 2023 08:04:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CpxtOTmVR2iXHq4ntS7OV0jJ3byBq2V6cwWSHKeYass=; b=seP2FBH9hguhcr01S9Leffnxrz
	UXjpBwvDn5YnN6Cl9sImZ8LaPYFNEG1b1xcb5Paejd031IJiidg86B2QvY6smEFKFzAwES3a7eCj4
	XEEBfE0X3GEcKB48Sb0yk5pMjA8Mzr3Vb1rD2TiIwcJKl2PkFrDweyLwV35OwJjv5uLfR7nXkf1xQ
	0o6B5kTzkaUPu9tCsoxaBOCu7Enihdz2kVgpQH/8cI2+podjlacH5CxUXEVz0VV8XGfZ5Etf3ajVi
	E2ZIUnbEx58EIIW40SjQwMjl0KhQe22JfJr4B9WH7/Qu+jeMNbYT6Bhq0U0mpYscSvtKf3NmQ6/9w
	wmgIgKng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSvjF-00DD3A-GT; Fri, 17 Feb 2023 08:04:25 +0000
Received: from mail-vs1-xe33.google.com ([2607:f8b0:4864:20::e33])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSvjC-00DCzS-EW
	for linux-mediatek@lists.infradead.org; Fri, 17 Feb 2023 08:04:23 +0000
Received: by mail-vs1-xe33.google.com with SMTP id m1so4750069vst.7
        for <linux-mediatek@lists.infradead.org>; Fri, 17 Feb 2023 00:04:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=CpxtOTmVR2iXHq4ntS7OV0jJ3byBq2V6cwWSHKeYass=;
        b=E/vIuU9ySLKJMhuGEau90zQBSG8SlHXkZF8yV3yS2kyxvZ4J6navODNrBOLVYMXgRs
         Ox62VC5OKcy1I/E3Uxu67J+4p3RLdNmXa4/5RjPnQtGjv8Ji7+fkzUpbvaec1bXgGk41
         t81KFoQ4wjoT8c4wmiBMfHEvM4VzhaNMRxm2U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CpxtOTmVR2iXHq4ntS7OV0jJ3byBq2V6cwWSHKeYass=;
        b=6lWtRsa8oqKAz9ThvdYngf7xcaBmsLCqJtoXDTkdUSrefjMkcn0lX07/akGlYp8FOq
         /UTrk0lVJfdTaiQkuJiVS0dA+0k0EJYgL+HoJtegRg2Jdxal4anRtOPVE/fH1AASwrBN
         JKTO6b9iYS9sLZqjk18BPid6O/UCeJJK6iVBhLQkmb+eUHDiW13fgpA7EA2QNyFfum/W
         KAVpjLr2y/e+lPsOp102+cCTWovOEIXuyh1rrqOwcJLp9kBKqDvPiL9KmL6SBwq7Ns1P
         Caze7YljCg28Lc5YDv0v2HZ/+iaAAo7DJeOVcz4BWK84Bi1Gcqsk5n65OP57bawKPVVM
         CdVw==
X-Gm-Message-State: AO0yUKUpzU5nruIwPB2vEQyy78qeY/HQ7anxEk7MckZY+IDJYu0FnKm5
	p1UXEh8eZ6Kqe1MTfZHyeIBUkRr0tE0kpU7xo7lwjw==
X-Google-Smtp-Source: AK7set+3G1On2xvJPdWW5BJlN2FbGevzUL/1abRBSCTHO4z51cXzRqmejg/kYU+jflz2dX+3jtTcJOE5uEtw71QLDKg=
X-Received: by 2002:a67:f749:0:b0:3fc:58d:f90f with SMTP id
 w9-20020a67f749000000b003fc058df90fmr1615105vso.60.1676621059003; Fri, 17 Feb
 2023 00:04:19 -0800 (PST)
MIME-Version: 1.0
References: <20230214134127.59273-1-angelogioacchino.delregno@collabora.com> <20230214134127.59273-48-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230214134127.59273-48-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 17 Feb 2023 16:04:08 +0800
Message-ID: <CAGXv+5Ffsf8bO2HemdOhmEwHtYwm9B+pRKMr0URc6bkY9Btr5Q@mail.gmail.com>
Subject: Re: [PATCH v2 47/47] clk: mediatek: Add MODULE_DEVICE_TABLE() where appropriate
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, matthias.bgg@gmail.com, 
	johnson.wang@mediatek.com, miles.chen@mediatek.com, 
	chun-jie.chen@mediatek.com, daniel@makrotopia.org, fparent@baylibre.com, 
	msp@baylibre.com, nfraprado@collabora.com, rex-bc.chen@mediatek.com, 
	zhaojh329@gmail.com, sam.shih@mediatek.com, edward-jw.yang@mediatek.com, 
	yangyingliang@huawei.com, granquet@baylibre.com, pablo.sun@mediatek.com, 
	sean.wang@mediatek.com, chen.zhong@mediatek.com, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230217_000422_516004_4B7D88A6 
X-CRM114-Status: UNSURE (   7.37  )
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

On Tue, Feb 14, 2023 at 9:42 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Add a MODULE_DEVICE_TABLE() on all clocks that can be built as modules
> to allow auto-load at boot.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Looks like every file applicable is covered.

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

