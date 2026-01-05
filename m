Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 934FAC2A072
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Jan 2026 08:26:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:Subject:
	Message-ID:Date:From:MIME-Version:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=n9TmAlMWaKJHxtCOinKkVhIsDXwFw6HF78DuQF+J4K8=; b=yhwVIUPDVasvgQ0xIZSYuOZS0a
	v7jxrR8iyH9xldrT3SHldM6yJ0LrFb2cc7lbaCfN88jRTIsuqX1aoHbwV9MycZ5aHKvuPtnkPOrPP
	kRzSEX/TbILqbxZCY7bjSnbdn40G4NH/yJwWBlBHviCovbvW8Si7S+F7Z0JiFxKkk9WtQof91LMQf
	+MkgF3JN3MGrUtGYAsajnvMzFrPYXZVyzZ0Xg7SVgiIsb3tihOyFvLdMPbh1gveh3LbdJsHuArzow
	mE2H7gTUrjG3BnEfrxhgo1GFK05ZI1Gw4+6QfSSaB9blEt6Do21vpggMmAdLMKIdJUCRqvTG2G/Hd
	liuBa18w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcfvC-0000000Ayzz-3kU7;
	Mon, 05 Jan 2026 08:26:38 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcfv9-0000000AyzZ-3Yjt
	for linux-mediatek@lists.infradead.org;
	Mon, 05 Jan 2026 08:26:37 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-b79f8f7ea43so3384596366b.2
        for <linux-mediatek@lists.infradead.org>; Mon, 05 Jan 2026 00:26:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767601593; x=1768206393; darn=lists.infradead.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=n9TmAlMWaKJHxtCOinKkVhIsDXwFw6HF78DuQF+J4K8=;
        b=ePpDAhZTLVyQYrKgKOrbW+yTD+oiPkLCZ0vJXusIz2PHcP0tcWlJe8rAYGr6tYHW7u
         ErDenSMW21SJtHt20IymHriUgfOwEG6xSz1zB+RmaX9qnA1PkWY0HR/aM8zY0qqNGx03
         jRocnSj/x3nNynXtaX6HV4m3BU/6BeSqqWKEiubcJZeMH9L7tVrwa5NB4CCZe8+Nt+pA
         r+lh7ooTkQ2Qr7/ZzUhD8L35I3NAqI05F+5LV8XUhxwqtTO01u9kNc6tehzHjSRqUa65
         bwei+cbVKfZYfD6eHtLpTx+1Kx7IUqB2B+ViM59EjhN/xvaiYiiRmDGQpiwmtSASBd/6
         OH7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767601593; x=1768206393;
        h=to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=n9TmAlMWaKJHxtCOinKkVhIsDXwFw6HF78DuQF+J4K8=;
        b=J1krky7Mb9XXQ6IcRTu6Zzf9oDVvWmrTqkzjBKK0jGdQB7SGc/qQUwmLfJwMPyG5IX
         sZoDqWT+KgKDig1cCnu8wSP+Ujsj/807fS+eesS4mNSaPxDtXbgz1wTCyx8dxS68b43r
         wonDZlOnVdS5KakFSorNi0AsiBgX1Q3/SA1maTJPxTpCHqQsFCUWoyS4wQeEIuHqMHfD
         5U9CJfCmezLFNOnetQli9AYXaK+h8cZ+O7/SLUoB7FHnpdjRW7KYPsgv9Rif0cY7857D
         Dn8hFWygfOMnaYYXdF/ij2rRHR8H/cCuRzxn759K+kf+0HeG9ruY12zMgA9+lP6SsFTe
         xBCw==
X-Gm-Message-State: AOJu0YyAHgrHhLz521ZpHiFYp14w1W0m1omP75LnWe61lqaB6g3xCzUP
	IdPyGzboW0RnF2ZW5D6n+EmpkaUnP7FuLmj+9llMmbmNit6PWibQGNvYp03YIxaFQTGYodciaQg
	IWLBd2ORm/WwYP3sAyVSCKgzkuN4oLWXjmhMU
X-Gm-Gg: AY/fxX5ANxZ+qmVBDZ5EWnXQaZEgDlixg/WR/6qbQedgl5dfz+hzVuIleTnhwOqHr47
	gIYQHJ4zAh0qV3+LNI4vnNmxHsIBJRonYjxtUNIoIIFdOhGC5UFC/Tv/NQWcZTiJPxMq5QL9nuR
	tV/ABqK5J6RbUBpjqqblwtwEXyx3CfmpWjlNBYmrobf5xc5Yx1hvcIfs9In1irCp+++VmhdNund
	pwP0Tla1AcOiBkwupmTb1UvoOCmd3JcI0trlrlqlfOpG4d/OVrb5HlI32j1X8+JgtXJHZ6HmiOj
	V6wA
X-Google-Smtp-Source: AGHT+IHf2D1WT4YBYCZiLrp6PxIw07yqv1wkeOzx/BHQaTsZH97Yx1mK0W0/ArzBGWTE1vSbesg6YhJcaD3HsKDxkXU=
X-Received: by 2002:a17:907:8686:b0:b7c:e5d6:2462 with SMTP id
 a640c23a62f3a-b8036f60923mr5331476766b.28.1767601593221; Mon, 05 Jan 2026
 00:26:33 -0800 (PST)
MIME-Version: 1.0
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Date: Mon, 5 Jan 2026 09:26:22 +0100
X-Gm-Features: AQt7F2pcP0esMn__WbfxTgFLFPIhowLzcrY0PuCl7lmJ3xnYTkFoq8DR0iSq_H8
Message-ID: <CAORyz2+3QtA60B4D=6diGzxTQhDqSNE+GhyEp5cE+hPcw7RsPw@mail.gmail.com>
Subject: soc: mediatek: mt8167-mmsys - error in routing table
To: linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_002635_896413_4C25B970 
X-CRM114-Status: UNSURE (   7.83  )
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

Hello! I have a question about patch
https://lore.kernel.org/all/20250212100012.33001-6-angelogioacchino.delregno@collabora.com/
.

When the MMSYS_ROUTE macro was applied to MT8167 it was discovered
that the actual value in the previous code was always set to zero due
to a missing value. However in the original MT8167 patch series the
mask values are present, and they have different values from what is
now upstream: https://lists.infradead.org/pipermail/linux-mediatek/2021-March/023114.html
(check MT8167_DITHER_MOUT_EN_MASK, MT8167_DSI0_SEL_IN_MASK and
MT8167_RDMA0_SOUT_MASK).

It looks like an error during the merge followed by missing data
during the conversion to the macro. Am I missing something?

