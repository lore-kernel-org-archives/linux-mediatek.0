Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 509DFCA0FED
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Sep 2025 09:20:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gPfnz/o3iNaHytOqe7truOjcGer8WrwACGpoW942gks=; b=dH5MC79jGeULFQ++w5SANgrj3P
	8DOLAe2NWfyNb+UZQQgcxTUx6RamPr1NHbamx4UeFFIdTkmStKlx4rrI7rYjM/2cuCC8MT3LJRpAG
	qab9PrHs4rLZZ3zQwxK4wIjrx/WnYM3/n2vPvAeI5KKAihpuAF/rr2Ujefc1K2SjW8YJsjW5mJ6v8
	77qTT1eAVmQc04le5M3IDAAuyejj12kP4Om9MOjbYS95tMTQ1UQkM+WHPohUsw64S+bGMqg/2CAq+
	fq6VR1tVYj1iIbgcAjjIcxHlnNYUuOcOhB7+QRSIJswWzzKws2Vf8kb9e/7+UqzoLAAx1E4RFFdKz
	raaL26mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuScf-00000000hW2-0rOb;
	Fri, 05 Sep 2025 09:20:45 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuRQY-00000000E52-3WO0
	for linux-mediatek@lists.infradead.org;
	Fri, 05 Sep 2025 08:04:12 +0000
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-337f6cdaf2cso14391501fa.2
        for <linux-mediatek@lists.infradead.org>; Fri, 05 Sep 2025 01:04:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1757059449; x=1757664249; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gPfnz/o3iNaHytOqe7truOjcGer8WrwACGpoW942gks=;
        b=Wibob7VPCeqKIjR6QKihQPUFZivA+1+kSAQw3OGd3K+93RTEs8XCslJhFK13bFvDT2
         uNqKymmuMN4Jj5hQl0HhB91E8iWQ87pFNsn9Om+PFmhjTy4rbFw2p7sEul4Nevrx0OKV
         zk/5aRnx8Uo8URLkgU+Q0Idsucu1y6csEmB5s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757059449; x=1757664249;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gPfnz/o3iNaHytOqe7truOjcGer8WrwACGpoW942gks=;
        b=r52LDPNmkL7vMWVxlVPqS6shIQP3lRfXIEYQRN1jOCSwJ8ZUlDMvprt+RCXs6WS+4A
         9Z+keQlPjviok2LGRIdb9tcZSqMGnIhaGAVmTePfYpGtK4vZOSAzZzsccpNHZYNVFutB
         3Cw3iHJbfbjX34MDqYTniZFRIqOvAh4ypzhPleVfW6TAgPbUz1t1d62IYFZtKjMc9HwL
         QxkA+NPzDeyEvbJKkXGIAI3GdaXMKajlfZzSg+9KBVAVD2B3UCLDjtQYWnKuEb3OZRG7
         Ed1ZkO3YoQpaT/lXCq8pLt4GDvtcngDtDfz7Nf5InaQ7ripdamcNqTraAHIu+u+zqdX0
         hvLg==
X-Forwarded-Encrypted: i=1; AJvYcCX+JqI/Z10ttpv8r1Pjz6Xi+YzuXVxujQGPXRM5KCmMjakJCaHqg51cJh944sPwQLWXZ4srJq1+c7QhmwEitQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw6m1FkunRpTv8+AVfZdIaxoO9fW4YOju6yKtKPcY6yE7/BWeCu
	gBaalrN0GudX0JITCYOwteJKRiSg23EmYCQgdLcmDkSGq2VsKlQ/bJnLK09JECLzzR1Y4egKeeq
	q/zwIgJR1zS4G4564CPdPwvRxVwkzoewB0MsUDba6
X-Gm-Gg: ASbGnct0xS3bIkJa3NRjywjSbo3f2m/IKCmFyaGI5pRORVKuXmcc4V9S8GZ3QBKbRbF
	FWb1Xfj69KHSE0NZh6YTakcBYlX5jrTN8teFH0wRjeYS1eXH5m+hMM9KxYziwLvPNxYoOU9AgRe
	tgAotJn+kQ6iFrBKpIkhVMpUIt8l5/KC9WbPo3WbCpsFfdNFBpoAVbqmx5nmOjVh0mohvqOevJB
	8wYLVKu5pKz4sL4PhJeFVy8915pHV8zUVvRLw==
X-Google-Smtp-Source: AGHT+IHT043Y/TruREpGKZ+/QRl4lPJ5bvgN3xV40J/rToLhwUaxJ8c7vgtH50x+X4YlPrhw0jN/shKQPrGCvcazPsI=
X-Received: by 2002:a05:651c:1a0c:b0:339:1b58:b199 with SMTP id
 38308e7fff4ca-3391b58bbc2mr3260661fa.36.1757059449029; Fri, 05 Sep 2025
 01:04:09 -0700 (PDT)
MIME-Version: 1.0
References: <20250829091913.131528-1-laura.nao@collabora.com> <20250829091913.131528-23-laura.nao@collabora.com>
In-Reply-To: <20250829091913.131528-23-laura.nao@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 5 Sep 2025 16:03:58 +0800
X-Gm-Features: Ac12FXzqjLPg1snoakkIHpjZL3gjVDvpLkfu1BDJJWXmMZBGn3rIna_U1tSPpG8
Message-ID: <CAGXv+5GreKJSz76EiHYzX-ByfyxuYNYB6OyBJk9ZhsKCapPjRA@mail.gmail.com>
Subject: Re: [PATCH v5 22/27] clk: mediatek: Add MT8196 disp1 clock support
To: Laura Nao <laura.nao@collabora.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, p.zabel@pengutronix.de, 
	richardcochran@gmail.com, guangjie.song@mediatek.com, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, 
	kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_010410_907942_31469945 
X-CRM114-Status: GOOD (  10.97  )
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

On Fri, Aug 29, 2025 at 5:21=E2=80=AFPM Laura Nao <laura.nao@collabora.com>=
 wrote:
>
> Add support for the MT8196 disp1 clock controller, which provides clock
> gate control for the display system. It is integrated with the mtk-mmsys
> driver, which registers the disp1 clock driver via
> platform_device_register_data().
>
> Signed-off-by: Laura Nao <laura.nao@collabora.com>

IMO removing CLK_OPS_PARENT_ENABLE is the right thing to do.

However if the hardware ends up does having a requirement that _some_
clock be enabled before touching the registers, then I think the
MTK clock library needs to be refactored, so that a register access
clock can be tied to the regmap. That might also require some work
on the syscon API.

Whether the hardware needs such a clock or not, we would need some input
from MediaTek. There's nothing in the datasheet on this.

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org> # CLK_OPS_PARENT_ENABLE remo=
val

