Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E2F3C7EE2C
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Jun 2023 03:04:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8GemXbMIq5lp+454RKyClJK8enwTWlxZVZu2OjpvqlY=; b=0fCN7QzBLLGp1D0yFCxcGhXdYh
	AVx/7hVWefAE2AjVJZ2ujIhWZuZE7kW0Bzv3VJ8rFOjeG7NwyF7pnOH6CJN2/0vi6LtDeIYpj5ahp
	JjhDKUPf9HsS5hBIgePaAmRWTnegHJiXXrVhn7elY9ARw3o9K8cSrzagMwDNqrn1o53VX/1dkUwVt
	35kCZyYg43FPf+XOqMOz5eR4Rd0hLfkpidt2jZLVT4QmR5jbAM5YQ/zUc7vbRmLEGfb/yJFZNjZWj
	msWZ60HdH9mGYETInFUPFsyk7HClhg7jPNm0IW3DSoWz4zHvv5mZZh+zYBVmgL2jLc2/+OrUAHE2T
	YfMhabpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q60WR-00DrOi-2d;
	Mon, 05 Jun 2023 03:04:43 +0000
Received: from mail-ua1-x92f.google.com ([2607:f8b0:4864:20::92f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q60WP-00DrNz-2e
	for linux-mediatek@lists.infradead.org;
	Mon, 05 Jun 2023 03:04:43 +0000
Received: by mail-ua1-x92f.google.com with SMTP id a1e0cc1a2514c-786e783a748so1185032241.2
        for <linux-mediatek@lists.infradead.org>; Sun, 04 Jun 2023 20:04:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1685934280; x=1688526280;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8GemXbMIq5lp+454RKyClJK8enwTWlxZVZu2OjpvqlY=;
        b=oPX1da39xxxDeDArWOnV6VvW0eqMDZSK7f9Ve9mZ0kzDSYY1VOdxziYIN0/fC6NW1m
         F/prs75MzDyyEYf0I12KVAvkEYP3P2XZcNI5tU3X7t4GTFd4snKp7LpRiaKWrmR/jKQ+
         +HFYU/lo//sCc8NY3bh61JGMniX1nPvtycInI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685934280; x=1688526280;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8GemXbMIq5lp+454RKyClJK8enwTWlxZVZu2OjpvqlY=;
        b=N47C9x99aPzd7jNbGAO28oOiTiMcn4vzWJhHbOsr1XUvOPPiUz9xOGbtGPSVxXU+1j
         sFm/9ORj7vLCdOEAIu0Kh8F7UxEt9Rochbts+/cyJALwDcqGHkgXlOvZXNXpuGwSiHbY
         4scQJ72COWK92knPO0J9XeegCFkUKWzX/EKD4TbA2QAHJAylcXvyYnX9wL6XLbxUxLaR
         8aQdSy3FRRd7zXn/K1+yVKLgXFq1sVkcSu1NfDr8PB9XVpXscYsCZn2PS4EXvZShf7vn
         7TYDBgY4p7snKzEpBgr9wqKOsqPelSU17ukLQlwIaajE6awVaSRiZ0HxJwgrg9SckvW2
         JcPQ==
X-Gm-Message-State: AC+VfDwc4WvTJMlKPuVzxJ8dA9FZlKthutZy1x2r0O81VxaQR3SQo+4O
	k6UhHAShn5cmYai77CzEG25jH8Fyj0EIIVo9K5YyKw==
X-Google-Smtp-Source: ACHHUZ6jpGq4+6/+6ClKSVvkgkwQzzirwShAHbQSCjNu7NjQjavUuh0PcSmBXhB3NwTi/oX4WQQPRVTj7U6bPKM8aSE=
X-Received: by 2002:a1f:3d4e:0:b0:45c:e022:d713 with SMTP id
 k75-20020a1f3d4e000000b0045ce022d713mr4342803vka.12.1685934279946; Sun, 04
 Jun 2023 20:04:39 -0700 (PDT)
MIME-Version: 1.0
References: <20230525113034.46880-1-tony@atomide.com> <20230602083335.GA181647@google.com>
 <87a5xii33r.fsf@jogness.linutronix.de>
In-Reply-To: <87a5xii33r.fsf@jogness.linutronix.de>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 5 Jun 2023 11:04:28 +0800
Message-ID: <CAGXv+5Gy=SqKukrDTpx+qVDgNDzMmMcC+Y0wkgfRA9xZCKBA6w@mail.gmail.com>
Subject: Re: [PATCH v12 1/1] serial: core: Start managing serial controllers
 to enable runtime PM
To: John Ogness <john.ogness@linutronix.de>
Cc: Tony Lindgren <tony@atomide.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Andy Shevchenko <andriy.shevchenko@intel.com>, 
	Dhruva Gole <d-gole@ti.com>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Johan Hovold <johan@kernel.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
	Vignesh Raghavendra <vigneshr@ti.com>, linux-omap@vger.kernel.org, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-kernel@vger.kernel.org, 
	linux-serial@vger.kernel.org, 
	=?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230604_200441_886411_3493CCCB 
X-CRM114-Status: GOOD (  12.94  )
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

On Fri, Jun 2, 2023 at 6:13=E2=80=AFPM John Ogness <john.ogness@linutronix.=
de> wrote:
>
> On 2023-06-02, Chen-Yu Tsai <wenst@chromium.org> wrote:
> > This patch, in linux-next since 20230601, unfortunately breaks
> > MediaTek based Chromebooks. The kernel hangs during the probe of the
> > serial ports, which use the 8250_mtk driver.
>
> Are you sure it is this patch? Have you bisected it?
>
> Unfortunately next-20230601 also brought in a series that added
> spinlocking to the 8250 driver. That may be the issue here instead.
>
> For 8250 bug reports we really need to bisection.

As Tony mentioned, you're off the hook for it.

I should've been more clear. After reverting the top three patches in
drivers/tty/serial from next-20230602, the system booted correctly again:

    539914240a01 serial: core: Fix probing serial_base_bus devices
    d0a396083e91 serial: core: Don't drop port_mutex in
serial_core_remove_one_port
    84a9582fd203 serial: core: Start managing serial controllers to
enable runtime PM

ChenYu

