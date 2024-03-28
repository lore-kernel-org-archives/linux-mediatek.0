Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E869DC54E64
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Mar 2024 13:37:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vhptj9/Vq4Rm0PoGzxaGiCJqIgDUZwkAbXDvc9ksjDI=; b=bymt26q30ofBRo/7xpcClB48Nv
	KERh3czrWqo1MrXzmfY983JM1Y3YXeY4SjP4ROAJxtmAOi8uxUReZ4nj1PV1OH1ZaLRc+yrbwvGZh
	SSf6KVMOPc5qrSVJkYLNyxVSyLZDcEqGcow4UsRvgIh8wMeUwQfeeZFJbULqjHhrc7RzKnvYhZnDJ
	qNAi+Of6HOSVJgK6Jp+fYHeuCh1+hnifjUjBG7MfyXHisdVq4Qf3T9jJgDdnScD9lLlIcsLfac+sZ
	EFrpPoHtkVm25f+cZGkU6QQFdNXeADTxc10XixFsrlVzX9NgYf6LBWhNwtcT5gsb1RiOlm2SpKB9b
	OuLlvvgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rppwk-0000000E87W-3LBs;
	Thu, 28 Mar 2024 13:37:34 +0000
Received: from mail-yb1-xb2e.google.com ([2607:f8b0:4864:20::b2e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rppwa-0000000E83q-0BIv
	for linux-mediatek@lists.infradead.org;
	Thu, 28 Mar 2024 13:37:30 +0000
Received: by mail-yb1-xb2e.google.com with SMTP id 3f1490d57ef6-d9b9adaf291so897401276.1
        for <linux-mediatek@lists.infradead.org>; Thu, 28 Mar 2024 06:37:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711633042; x=1712237842; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vhptj9/Vq4Rm0PoGzxaGiCJqIgDUZwkAbXDvc9ksjDI=;
        b=gySmsIfYYmjPkwnZmpywOR5qkNG6dXXk86umdqucCPkI/wUfZ4ui8I5RgnG0XqJgKI
         yBOX/RZZdtl6Fg/4UZ2LXzZDHqFry0+ZOb5u/uUKeoZMxWCnBtjO/nKS0wskjag5fP1R
         s3F6kRt6Hn/YttHWlyPsCphuco5nhDP7R8av/0QNq5om5PhpyLGpJnqcfH05HsNXwt7O
         ij/QTLClqi6kwu4yQ3gb882hsHvtz1/mMjI1I6ZXlQQrTqgzKdqbVuv2PTgeQSnHDDnk
         6fal0tsgqLz10KPdemz3jzdiNVMUpFU7ne3taPoVSBA/dHtdLpLM14lFEeafoj7oUgb5
         Ws5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711633042; x=1712237842;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vhptj9/Vq4Rm0PoGzxaGiCJqIgDUZwkAbXDvc9ksjDI=;
        b=eMxLj1cMGXD4skItbI6+QFYmAOb+jVAmhn8Dbe0+nXLSSLO9EZDfc7UlppxjGrVuvW
         yr/fCgZyrkHFN/5YItKmoR9XMXlSM/KqDo5YP4kncxYOM5ayUNFpw7uvHLHIgAOWxc1s
         nEfl5PuEIC4k+Ke0XjsZ9bSgTPqpdPy2P8/DOoqFoNdV6CjqEXDpbyjL6GiB0iPxINFX
         EOdAgwGCGMy8HksW+ZcpGe5bDIn+D+gWHp41OfGxrqMzhEOyJmdPi1QfXade3kpZMbxh
         kMU+pSqF23aFWNXlH9T8Nn3I1G+HEBcF95AOs91co48yfrGBHSf3/ZFqJct+j/xcc4Zw
         LB+g==
X-Forwarded-Encrypted: i=1; AJvYcCXJ0Wp9ysyCPJNndTUw6zv2yyr/WyrKGrwFsZ5+DEaidESt05B+i7N54ODfam95zdTMlKqKJt6Jxa56BHdVbmOBDbBBYxpkBgaseugajwxuxwrD
X-Gm-Message-State: AOJu0YzcfV91KVovgtI6eOFpG5MMjcWK2C1z1pRBLzhYuJKP5O4kxjtY
	CXSWndAu/PL1J+fh8PQo5tS1zzUevUQqRgg6RvwaVzKayODHqsGfd1sufvdhbAIuKoGDWu5uV8j
	8ehTL0TycPEFi2Rd7HCE/c577bITyXqC1cg+Ewg==
X-Google-Smtp-Source: AGHT+IGjGHEbsk10nKTaVGgOOQzkHc5Qm9STf87bHGVpMP0DEmjO9lKjEWUgvRJ23UvcJC23rRkiymMtwiTmbVMLRs0=
X-Received: by 2002:a25:b9ca:0:b0:dd1:3cc1:5352 with SMTP id
 y10-20020a25b9ca000000b00dd13cc15352mr2820459ybj.15.1711633040798; Thu, 28
 Mar 2024 06:37:20 -0700 (PDT)
MIME-Version: 1.0
References: <20240327160314.9982-1-apais@linux.microsoft.com>
 <20240327160314.9982-10-apais@linux.microsoft.com> <CAPDyKFpuKadPQv6+61C2pE4x4FE-DUC5W6WCCPu9Nb2DnDB56g@mail.gmail.com>
In-Reply-To: <CAPDyKFpuKadPQv6+61C2pE4x4FE-DUC5W6WCCPu9Nb2DnDB56g@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 28 Mar 2024 14:37:09 +0100
Message-ID: <CACRpkdZ7wAbtTUmmLCef7KnATmfZeAL26Q-gLqnGe3CdZ3+O3A@mail.gmail.com>
Subject: Re: [PATCH 9/9] mmc: Convert from tasklet to BH workqueue
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Allen Pais <apais@linux.microsoft.com>, linux-kernel@vger.kernel.org, tj@kernel.org, 
	keescook@chromium.org, vkoul@kernel.org, marcan@marcan.st, sven@svenpeter.dev, 
	florian.fainelli@broadcom.com, rjui@broadcom.com, sbranden@broadcom.com, 
	paul@crapouillou.net, Eugeniy.Paltsev@synopsys.com, 
	manivannan.sadhasivam@linaro.org, vireshk@kernel.org, Frank.Li@nxp.com, 
	leoyang.li@nxp.com, zw@zh-kernel.org, wangzhou1@hisilicon.com, 
	haijie1@huawei.com, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	sean.wang@mediatek.com, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, afaerber@suse.de, 
	logang@deltatee.com, daniel@zonque.org, haojian.zhuang@gmail.com, 
	robert.jarzmik@free.fr, andersson@kernel.org, konrad.dybcio@linaro.org, 
	orsonzhai@gmail.com, baolin.wang@linux.alibaba.com, zhang.lyra@gmail.com, 
	patrice.chotard@foss.st.com, wens@csie.org, jernej.skrabec@gmail.com, 
	peter.ujfalusi@gmail.com, kys@microsoft.com, haiyangz@microsoft.com, 
	wei.liu@kernel.org, decui@microsoft.com, jassisinghbrar@gmail.com, 
	mchehab@kernel.org, maintainers@bluecherrydvr.com, 
	aubin.constans@microchip.com, manuel.lauss@gmail.com, mirq-linux@rere.qmqm.pl, 
	jh80.chung@samsung.com, oakad@yahoo.com, hayashi.kunihiko@socionext.com, 
	mhiramat@kernel.org, brucechang@via.com.tw, HaraldWelte@viatech.com, 
	pierre@ossman.eu, duncan.sands@free.fr, stern@rowland.harvard.edu, 
	oneukum@suse.com, openipmi-developer@lists.sourceforge.net, 
	dmaengine@vger.kernel.org, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-rpi-kernel@lists.infradead.org, 
	linux-mips@vger.kernel.org, imx@lists.linux.dev, 
	linuxppc-dev@lists.ozlabs.org, linux-mediatek@lists.infradead.org, 
	linux-actions@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-tegra@vger.kernel.org, linux-hyperv@vger.kernel.org, 
	linux-rdma@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-mmc@vger.kernel.org, linux-omap@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-s390@vger.kernel.org, 
	netdev@vger.kernel.org, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240328_063727_009900_1D20FE11 
X-CRM114-Status: GOOD (  10.14  )
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

On Thu, Mar 28, 2024 at 1:54=E2=80=AFPM Ulf Hansson <ulf.hansson@linaro.org=
> wrote:

> At this point we have suggested to drivers to switch to use threaded
> irq handlers (and regular work queues if needed too). That said,
> what's the benefit of using the BH work queue?

Context:
https://lwn.net/Articles/960041/
"Tasklets, in particular, remain because they offer lower latency than
workqueues which, since they must go through the CPU scheduler,
can take longer to execute a deferred-work item."

The BH WQ is controlled by a software IRQ and quicker than an
ordinary work item.

I don't know if this little latency could actually affect any MMC
device, I doubt it.

The other benefit IIUC is that it is easy to mechanically rewrite tasklets
to BH workqueues and be sure that it is as fast as the tasklet, if you want
to switch to threaded IRQ handlers or proper work, you need to write a
lot of elaborate code and test it (preferably on real hardware).

Yours,
Linus Walleij

