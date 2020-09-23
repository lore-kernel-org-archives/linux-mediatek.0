Return-Path: <SRS0=E7TL=DA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44D9DC4363D
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Sep 2020 23:11:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E195A20BED
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Sep 2020 23:11:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="1zcAy69U";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LiswQhMe"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E195A20BED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=RgFOqyRD8HJCCrEtlHhqYx2D+sHrj0ghKFGUZcHArSo=; b=1zcAy69UKtOZeDdOvIJvidA9j
	8HFCESeZWruPpTPFstkkPDhmvtVJQDg3td2BONjmPiEO3XdC8OqcrP/QcYxo5w5s1/0VfIOhiym98
	xJqyBA0CTqt5kUnQhX2K9QehhP3bCce7/8M72TpkyEVywzPsnoxpVn3xCfHwTrDyAdQcOyTg2Zl38
	x8LNuV/zJpvjc5dULQLejn5Hx7aZ6uJA4+dlQ1sUOu40JnFhA/cXGEZ86Ty6vE0LGFRGtuSV0VEbL
	ieTg8EF+gvt3L0ZCV4JNzbfhMV3W9giwqInVIqazYpLLagDC5Yx7CUszipkOSmntJbsQOpd3hZt6P
	WBfCINPRw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kLDv4-0006nu-Oj; Wed, 23 Sep 2020 23:11:26 +0000
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kLDv0-0006mV-Jj
 for linux-mediatek@lists.infradead.org; Wed, 23 Sep 2020 23:11:23 +0000
Received: by mail-pl1-x641.google.com with SMTP id r19so575032pls.1
 for <linux-mediatek@lists.infradead.org>; Wed, 23 Sep 2020 16:11:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=2C2k3bgm/wJgHGoPq3RjqjO7qGsk8WgF9RAs+eFblaY=;
 b=LiswQhMejoVglYkrxG9w0XpsBon11s3vESoHybcFToEdc5v2+NWsS8qqK5KwzJ/AsD
 d17on9QRv/S/TyDlJsRNEOvGZ6UpT+LdvtburVCLnEgzWB0oIEd8fi5ehdVx0RJRsupQ
 xmspR5jK/Y+6o6D0HKN7vH4QrmrUnFp3kw2e76h+331JCqdxZzZc6VgTIcVCPZZfj717
 ncaxK3US42BrvAlPy6qWLMc6FPyIfkadKdRoo0kO3u/BM2o+FFxNkVHEkvslRD9xT7A7
 OUTzgcYRNF5zXEihYdZntXS33ZP0+5CMSsynjHG0JtYipj1yIDWes8af7HqwLJy2eokG
 vnnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=2C2k3bgm/wJgHGoPq3RjqjO7qGsk8WgF9RAs+eFblaY=;
 b=HLjaMDfT7liF6hVlROFzK0jXxD5OEggyFONFk4Qg+VJmYq5VDHQGsaPpO04D2vxX19
 qy9wKoXgfimzo4yzrdDoJmeFeawtFgx4kgsph10OHe/kSe04W6nEjN8mtesDOnY3+d7L
 NW6iMD7o6bMnzTpw+6PgLFWNwvhe4XrthKcw5JeK7drrNpvVFO/7AReu1hkKvL8Zm8Ey
 v6YNtp+G/CR4uPjcmmT49349zw2RTokQzDGH9oyAXW9iRGwcIrxqo0A1g7xPpQzJOnSH
 hjLeKpqNM3j+MPQK7FcXiz1wmDU2A+oYugsY1J74RAqv2Ehtx+16T8YfBY37qPaVk774
 +gPQ==
X-Gm-Message-State: AOAM532lIPt3jyIysA/qEZZQQDrdGiN0qPBj1CwQEyop+v5StByoPERr
 M1WAqRxp5QXMfAalgrOeUqLJTg==
X-Google-Smtp-Source: ABdhPJxqk2zGhDGZJVw4sdmPM+ciEWAW24BXvgeiu5oFPiHXm3UbUZEWegPSBDlvL8N/12l5EIu9eg==
X-Received: by 2002:a17:902:7fca:b029:d2:439c:3e97 with SMTP id
 t10-20020a1709027fcab02900d2439c3e97mr1917445plb.22.1600902678777; 
 Wed, 23 Sep 2020 16:11:18 -0700 (PDT)
Received: from xps15 (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
 by smtp.gmail.com with ESMTPSA id j19sm668468pfe.108.2020.09.23.16.11.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Sep 2020 16:11:18 -0700 (PDT)
Date: Wed, 23 Sep 2020 17:11:16 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Alexandre Bailon <abailon@baylibre.com>
Subject: Re: [PATCH v2 0/4] Add support of mt8183 APU
Message-ID: <20200923231116.GA1154153@xps15>
References: <20200910130148.8734-1-abailon@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200910130148.8734-1-abailon@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200923_191122_653283_6073CF5E 
X-CRM114-Status: GOOD (  20.07  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: ohad@wizery.com, devicetree@vger.kernel.org,
 stephane.leprovost@mediatek.com, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, bjorn.andersson@linaro.org, gpain@baylibre.com,
 robh+dt@kernel.org, linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Alexander,

Things have been quite busy over the last 3 weeks, preventing me from
giving your work the attention it deserves.  It is on my radar and will get to
it in the next two weeks.

Thanks,
Mathieu
 
On Thu, Sep 10, 2020 at 03:01:44PM +0200, Alexandre Bailon wrote:
> Some Mediatek's SoC have an Accelerated Processing Unit.
> This adds support of the one available in the mt8183
> (aswell some derivative SoC).
> 
> This series depends on two other series:
> - Mediatek MT8183 scpsys support  
> - arm64: dts: Add m4u and smi-larbs nodes for mt8183
> 
> Changes in v2:
> - Drop the workarounds needed to load bad firmwares
> - There are many name for the APU (most common one is VPU).
>   Rename many functions and dts nodes to be more consistent.
> - Use the bulk clock API, and enable / disable clock at a better place
> - add few comments explaining how to start the APU
> - update the way to use pinctl for JTAG
> - fix some minors issues
> - fix device tree bindings
> 
> Alexandre Bailon (4):
>   dt bindings: remoteproc: Add bindings for MT8183 APU
>   remoteproc: Add a remoteproc driver for the MT8183's APU
>   remoteproc: mtk_vpu_rproc: Add support of JTAG
>   ARM64: mt8183: Add support of APU to mt8183
> 
>  .../bindings/remoteproc/mtk,apu.yaml          | 107 +++++
>  arch/arm64/boot/dts/mediatek/mt8183.dtsi      |  39 ++
>  drivers/remoteproc/Kconfig                    |  19 +
>  drivers/remoteproc/Makefile                   |   1 +
>  drivers/remoteproc/mtk_apu.c                  | 437 ++++++++++++++++++
>  5 files changed, 603 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/remoteproc/mtk,apu.yaml
>  create mode 100644 drivers/remoteproc/mtk_apu.c
> 
> -- 
> 2.26.2
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
