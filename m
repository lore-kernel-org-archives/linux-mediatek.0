Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4E22FC592C
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Feb 2026 10:59:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bnw64VDmOIsDBjD+cxaJBPxWhHWJgKFnBBtMRI3MdyY=; b=mpgGwgxJcWxD5zPlHLTer0PKLv
	7GWUNijYH1+Iu2US27wBP+BHZfuLlDtIbzOwH+ZQC/DH6T0VlW9EZva2+JHOmF0o7qPTcILdQu6lD
	ZwE6ceSCJ8hpEb2Boiuf8F6EBIQbcnrQ3aeF8sH+4EmoljDnX1L1NTxq8K8XjAVXPhUN042/MtBDo
	rumAc141b03z794zLkNHyTbQs0o3xnqRnF0nJisCgNwBO6MI43DXwfwszECdC6awAuZNNBmLDxLUu
	mut2BgwWyvWvww660HEuo3zjT2VlZ94GL0o2XLKB0uII2WfBweGF1mpBrJpz38rqQeiDZ0UOz2yAm
	WnCpn1+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvZ5T-00000005yQ9-0Q3n;
	Thu, 26 Feb 2026 10:59:19 +0000
Received: from mail-dy1-f179.google.com ([74.125.82.179])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvZ5Q-00000005yPm-2fuY
	for linux-mediatek@lists.infradead.org;
	Thu, 26 Feb 2026 10:59:17 +0000
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-2bdbd13ca01so1260710eec.0
        for <linux-mediatek@lists.infradead.org>; Thu, 26 Feb 2026 02:59:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772103555; x=1772708355;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bnw64VDmOIsDBjD+cxaJBPxWhHWJgKFnBBtMRI3MdyY=;
        b=M+OXgbKGMpJyFTW+erwYwpl7fYNiZPFncRqnRvlUexFaqwgJX9spCwgAEMiVzaMlzn
         ikp9LF8ytIW3J4VBPa3eusxxTC3GtUlkWnYwqXHptvq6rGuh7Q0cjkddmTD3xhkS83zm
         2HNHA2n1DHpVXwRbFXyZvMH1mnzNKA0+JHtBQgXrq/80fO5oMOnrRpIYU95QJ7eODBBN
         wfIWtMf8NNMQS1X0+YZoEO8Rxq7rRLBKwWN4CEq1d3ID2J34dar/JH/IocWIuQM0Ww7k
         lsK+v2yfDdQGnIn+3LyxsrQJm6J5OOiZmTNnkJ6YYsJUHABHYPQe5sFKAxm8C+4kdiFU
         P62w==
X-Forwarded-Encrypted: i=1; AJvYcCUpDc7K2Tmi/O0dUPpiUHTbAhjs3UNPidGWmbdy29XBen5WUuijcB02rE0RlN+3Fof8+VdSZ3PSON6qvaprJw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzlg9JV+f4tjLq2HTOw0zWohvpJQ04NqZ3S17D7yJE+la/ImiF+
	ztavJrGu+nz/F7iE1KSlEA5UeR1hr6HpZdjgUyMwjJ5OaGm5oSD1UO7Qmkz5Og==
X-Gm-Gg: ATEYQzwG93hS3mdIu1SjL5BYrxeIUTE7MUcSda51/xjahOSAx3ztWaP9W8PGtBqbQFk
	og1WOXjQaVeS8LsTVvR7/IdOZHbPj8H38iBFuT3inhPDXSwBLQlHM3NjFuebaz8o+RR1nek5+y+
	qi3B+H4Ym2rZJKpoQHAN07AlhUP0gF/ppOspQBRRpXRdskIGohcbACmrfOaqMx3HWBvG+CgNR41
	C3fqjpqjXVzYJQCfGanfoQsPX7JqE3X+p3gJQRwotD0S7DPn1EhjO2GQQ1z8ItcM6Ap+yXoLUPa
	XCVJ64ZkpElQVAh57XzcI1IwMLG1R5gZ/m/1/4OK3Wzre7kv1iQodDJuenG+hmEvO7q0Efj7ri8
	Wpvp9LA8vb8osNPFNqv1a/a49m6BzpqluVM4Pge4+HOMmoRkW0uTSzBbgZDQ/HOLNg4y0HFbjhO
	t2RCLfdi2GZbpRhB/9tO8lOHqWCIegI0RUM6wWDPQJrJZiHylh2Esfv5h6rUBd1zSvQSFaVA==
X-Received: by 2002:a17:903:22cc:b0:2a7:9ded:9b46 with SMTP id d9443c01a7336-2ade99bea7cmr31907425ad.17.1772098033010;
        Thu, 26 Feb 2026 01:27:13 -0800 (PST)
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com. [74.125.82.42])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2adfb69fa43sm18459705ad.46.2026.02.26.01.27.12
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Feb 2026 01:27:12 -0800 (PST)
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-12776bebe9fso303066c88.1
        for <linux-mediatek@lists.infradead.org>; Thu, 26 Feb 2026 01:27:12 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWCfzCJSJOza4IU16qbUI0RgJ8ZXe5n4gySS7XkFvbrGSqIGR8b8P4J9sFrojbz23sPXoZCnVsG09GCv1QMKQ==@lists.infradead.org
X-Received: by 2002:a05:6102:1606:b0:5fe:12c9:6e55 with SMTP id
 ada2fe7eead31-5ff141ca4fdmr1209533137.39.1772097644539; Thu, 26 Feb 2026
 01:20:44 -0800 (PST)
MIME-Version: 1.0
References: <20260225155409.612478-1-hugo@hugovil.com>
In-Reply-To: <20260225155409.612478-1-hugo@hugovil.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 26 Feb 2026 10:20:33 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVd0Ds5vHQa+MG2E+E36qAu5HQE3b+Vzpbv84MM=2DFWw@mail.gmail.com>
X-Gm-Features: AaiRm50xBGkpSKzhEw3ibXVEzal-pPxdV_uLqXQh8Zi8JcZzUL3k8C9xrOoM_9A
Message-ID: <CAMuHMdVd0Ds5vHQa+MG2E+E36qAu5HQE3b+Vzpbv84MM=2DFWw@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] input: add GPIO-based charlieplex keypad
To: Hugo Villeneuve <hugo@hugovil.com>
Cc: robin@protonic.nl, andy@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, dmitry.torokhov@gmail.com, hvilleneuve@dimonoff.com, 
	mkorpershoek@kernel.org, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, lee@kernel.org, 
	alexander.sverdlin@gmail.com, marek.vasut@gmail.com, akurz@blala.de, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_025916_678319_4C0F6972 
X-CRM114-Status: GOOD (  21.60  )
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

Hi Hugo,

Thanks for your series!

On Wed, 25 Feb 2026 at 16:54, Hugo Villeneuve <hugo@hugovil.com> wrote:
> From: Hugo Villeneuve <hvilleneuve@dimonoff.com>
>
> Hello,
> this patch series add a new GPIO charlieplex keypad driver.
>
> The first two patches simply commonize two properties that are present in
> a few bindings, so that the actual patches for the charlieplex keypad driver
> can reuse them instead of also redefining them.
>
> I have tested the driver on a custom board with a Solidrun RZ/G2LC SOM
> with three charlieplex keyboards, all connected thru a single PCA9416 I2C GPIO

PCA9416? The closest I could find is TCA9416, which is something
different.

> expander.
>
> Link: [v1] https://lore.kernel.org/all/20260203155023.536103-1-hugo@hugovil.com/
> Link: [v2] https://lore.kernel.org/all/20260213171431.2228814-1-hugo@hugovil.com/

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

