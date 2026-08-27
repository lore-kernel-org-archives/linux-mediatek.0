Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96CBBC61DC4
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Aug 2026 13:54:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RngKn1qeN4IMu4W20K5F024kPlBdyKuXJtbP/ZBjLVg=; b=tSWqypfHyUkUd9Hxxl6nVYlwb8
	AfUFHIVJ+SRk0dhVTcLhzbRcaNAG2QMS5lGzuyu+d0k6yxOvXHh9y4/Ep0B+F37OP1fFr46H1PlTh
	44qi+HdnulZLUmtii3FnVPWEBVyVsIwwT+Au5EO1fzTUA7T51sMC2La7K/hqVytKpWXiBOoA24R1B
	tTqaDJKhm1+hWyVUYCER+0p/5cEwQtfFIOdb5/cuMrHyZmo/BMNNxNSd6Txc5EG6va/eQjbIbX156
	rIGOyl0xmAb83pViOe4z/rIKAC4pfNJ9OaswgSrwsIicRHblmZf12xr/kFTRo91gLNiwBk+Z/GLC8
	b5BUCRsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzaYT-0000000467H-1rZJ;
	Thu, 27 Aug 2026 13:54:09 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzaYP-0000000466X-2M6G
	for linux-mediatek@lists.infradead.org;
	Thu, 27 Aug 2026 13:54:08 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2ce98cb8165so12137415ad.1
        for <linux-mediatek@lists.infradead.org>; Thu, 27 Aug 2026 06:54:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787838845; x=1788443645; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=RngKn1qeN4IMu4W20K5F024kPlBdyKuXJtbP/ZBjLVg=;
        b=Db0g6xKZhogfEIwb+DRxqfMHatOh1Qwf2OUNIps05eZgYEMT5XGMOg0oOolmpJmemE
         vaRsKV8OKodQyZSs70P131oqjtisbDED01GzsJMw/Pg9mIdgZEdp1j9mEb6sPCZIwVlg
         QISzEbMGY9M4AB7zkLyzGJLDTEAg0dqo0PsDGurRt5BH5024f4HVDlVaS0rizmz286I2
         1Qy+jQP6vzgrvt9ZtTZbf5XtI46IFRWD/igyGP4T5lPcKjMhpgXLqyEI/uDah0QPHbfj
         m9vWWdjkx4MaYjEWhL7FcIXvPQe7Vp2R15PnJxnJ4bKwz0ZCzfsETdZPV8dYy13p0COj
         5FCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787838845; x=1788443645;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RngKn1qeN4IMu4W20K5F024kPlBdyKuXJtbP/ZBjLVg=;
        b=VvNk1DMGLUFzofiXKRTAsPdYK263boKh9KOJn6+6PYe3vH2zlA7D2QNYU42DW7AS6W
         vHn7DKFBJVnr6iscDWHX1V85KzLNVKxy6zAVw7/7F9Qc7eXLTI/k+fvyVG0cjBYg0p6R
         j2mWdQ/L6t2xIFOKnJUtAIfq59EavwQGSa9RBTRMP41AF/dlbX1JIibksWttuMoNubV/
         0mhYDhusYVd69vlnPvIsyLdz/DM/xskf6EUhNwbnEeMm9NT1usQ0RWM31U3MZaJ//CgI
         gadLKmG0UqjcRMbUVU0mgbhMVQ1Cr6WFPQMfoY3hbC71PIN3UDw8wjH1sHytATse5rXC
         RRdg==
X-Forwarded-Encrypted: i=1; AHgh+RrZiDSwSBEU7LEWhkTUdsE1wnnBYF7QI5vEaDmUzAydvAUqkn+bmFT8EGhuE0tCSiRHl6Q40CYGcCNGZsQIzQ==@lists.infradead.org
X-Gm-Message-State: AFuF++lEQVDzGcgIF8RtDf/L876sMmy/5Lzx485Zx6/pmGz4s4FHWPb7
	hyJrN6+DxjcnSQJz249zC9gDZUrJvonzhCh45mLSsB12l1Fte6VjOP4H
X-Gm-Gg: AR+sD11veY12ezTG/zt3yO9wwHMSel1A9TJuj6ZcA+hzlX12Mwz0RupuzxckrVnXL7a
	olJ6hOuXM2yg0Q8dyQDmVLy7lGWpmZjep3ns6sqhY3rZ0lYv/PGd4yIuhtamb0kU/GOwt+VtBH+
	HDk0QbKqlUSQ8JCrFYdG6dx2JWZ41KrFGPqmZDb9ndiNx8lC/qVd/7+qN7NSL+wKGsrmMWHpd+l
	3JwhlffarHh+hIXmwAgCw4fzHPEbooMjbcYxdGplejBRxYMLbH1IVLxIx7Bw4IEJbtJ/qbzSEEA
	RMrBfI/O7I0td6AiQEYX9ZuvrmDaw4cyMaG/hmJG/bog1hVRTQIx2lq5HpPpMXRf6cIwTnU39G1
	yrnpo5FsqH5u0JDuR1WNyfClZ3Y2PdAtC7lZe7X0ZOAmGWrezSqmS5DgwLvn0R6GL1V940ibQZ4
	av0njX7rqcgG3aCjyejgUKTeASs9xJaR830SQpnkZG4tU+K27rBTRe9h8NJlYqmUV9NbsvPbDoa
	TrcN9A9mA1T3A==
X-Received: by 2002:a17:902:e74e:b0:2cf:7db9:e13e with SMTP id d9443c01a7336-2d72600b801mr85038015ad.3.1787838844476;
        Thu, 27 Aug 2026 06:54:04 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d704c34ac6sm17479885ad.73.2026.08.27.06.54.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 06:54:03 -0700 (PDT)
Date: Thu, 27 Aug 2026 06:54:03 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Wanming Gao <wanming.gao@mediatek.com>
Cc: Tzung-Bi Shih <tzungbi@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, wallace.yu@mediatek.com,
	Jarried.Lin@mediatek.com, vince-wl.liu@mediatek.com
Subject: Re: [PATCH v2] watchdog: mediatek: acknowledge pretimeout interrupt
Message-ID: <5e1793d5-6c78-4372-872a-069fcd99a07a@roeck-us.net>
References: <20260827092616.2724197-1-wanming.gao@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260827092616.2724197-1-wanming.gao@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_065407_705755_D4AACE28 
X-CRM114-Status: GOOD (  11.37  )
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

On Thu, Aug 27, 2026 at 05:26:12PM +0800, Wanming Gao wrote:
> The MediaTek watchdog pretimeout interrupt is level-triggered and does
> not have a separate acknowledge register. The interrupt is cleared by
> changing WDT_MODE_IRQ_LEVEL_EN and then restoring it to its original
> state. Without this transition, the interrupt may remain asserted and
> cause an interrupt storm.
> 
> After changing WDT_MODE_IRQ_LEVEL_EN, wait 70 us before restoring it.
> This is longer than two 32 kHz watchdog clock cycles, allowing the
> level change to propagate across the clock domain.
> 
> WDT_MODE is also updated by the watchdog start, stop, and pretimeout
> operations. Protect its read-modify-write sequences and the complete
> IRQ acknowledge sequence with the watchdog spinlock so that concurrent
> updates cannot overwrite the temporary IRQ level state.
> 
> Signed-off-by: Wanming Gao <wanming.gao@mediatek.com>

Applied.

Thanks,
Guenter

