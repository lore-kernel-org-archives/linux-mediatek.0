Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28B2AC6379F
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Feb 2023 07:06:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z1cYKqMet8H+ii8MTj3LDy2njm/8Z3UGGXga63FCV+I=; b=H8uzSTnNpXuFTe9H26rgwTFh1B
	f/rtdAiUfImbYKkx8TZKkx4Oc814ZlxlEBXLVR88L4V+yc1cnQtev7GBQdaxpfCXXoGt1YC3rp/Eq
	D+LIHRmCbEtZaX3suLFLOuOm3cNXVXOEWuX1wnnsvWd77UxoQEnspn+2/YIgBu5exKdOFOIE7S02N
	10BwQzlIfau47+nqFDdfzeDxVpQoh/RSK0MmxrgunNL/GURUnsil61bgIeuKjg+r9tze/xq3LxDdp
	9xpNkAEgDA8FL4c3QBTSJzAdwm0ICiIbQHV5NjjMMb80KEm15vSH4rAM+IPJURdolvzVQbg+V9+2M
	WPU68DPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUMix-006oju-Uf; Tue, 21 Feb 2023 07:06:03 +0000
Received: from mail-vk1-xa2b.google.com ([2607:f8b0:4864:20::a2b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUMin-006ofW-Iw
	for linux-mediatek@lists.infradead.org; Tue, 21 Feb 2023 07:05:55 +0000
Received: by mail-vk1-xa2b.google.com with SMTP id e10so2670152vkm.11
        for <linux-mediatek@lists.infradead.org>; Mon, 20 Feb 2023 23:05:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=z1cYKqMet8H+ii8MTj3LDy2njm/8Z3UGGXga63FCV+I=;
        b=R5Z5iOehdhaO5+AIYt0tTWNGgV8or5fvRctQsvFvL3EDJxauyJhHWy5pncSVF8PZqE
         nTZLZ9VRORycd3DcEm0C3k7LNxNrPsdbNPcDyuRIVmDrruIDjoTNthDUZGnsXLGsJT69
         WleSWWLxlS+pJi10G4m6iiH3hvlmlHTwGnOdk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z1cYKqMet8H+ii8MTj3LDy2njm/8Z3UGGXga63FCV+I=;
        b=nD6P3brUOwsMCBbSMGqCi1clagJ54OA+wE67IoARaHjYM2z+qrufuk28w1OlojLZoT
         nNbMh2a4AbIBpxM2XTWoFVqCoFPfoHO0OBgBg8pCmdTF5ekRmNJObysd0iFI0/PQWcEP
         VaSBYbi/05KEfIxiJe28JJ96hdxUldlqIiqlikTWb6KIWgTojmahq0AI2f8NMWvXQZtx
         XZpdJTR5ZElGyX+muxPoWJ+Gjs+F1ivW6tm5ffyjdaxsoNboTZBvHZXQfRkBAHNXzhd/
         d+otXI3bS5a4Jek84MJt5lYCCc+9uXBW62wcwCaFDOEQqZjB09iVBOjyDoWUc55qHxPn
         1zNg==
X-Gm-Message-State: AO0yUKXiCMAhe84A49r1CNuOFrqjP1Q2OhViOXGmxK/cYBfMVmNUlQ4Q
	WN9AV/vnRZXOgv6TZDUFFLYHxn3lUaPTb1Xg13HnwA==
X-Google-Smtp-Source: AK7set9ds/uYiuq04sAgmJcSU9zYEOvalROd9bpv/L73UMiOVYuE3J4KhAbSqG8R/1csA8+vbSVOfJcx7s+uruF8xoI=
X-Received: by 2002:a1f:a3c8:0:b0:40b:9:82fd with SMTP id m191-20020a1fa3c8000000b0040b000982fdmr880296vke.18.1676963151277;
 Mon, 20 Feb 2023 23:05:51 -0800 (PST)
MIME-Version: 1.0
References: <20230216130021.64875-1-angelogioacchino.delregno@collabora.com> <20230216130021.64875-4-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230216130021.64875-4-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 21 Feb 2023 15:05:40 +0800
Message-ID: <CAGXv+5Hqx-b0rH4K2NFdvHrTmkn-h09Jn-RJWjYbW3gNDc+tqg@mail.gmail.com>
Subject: Re: [PATCH v1 3/9] soc: mediatek: mtk-mmsys: Compress of_device_id
 array entries
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: matthias.bgg@gmail.com, jason-jh.lin@mediatek.com, chunkuang.hu@kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230220_230553_635186_B9BC4FB8 
X-CRM114-Status: UNSURE (   8.65  )
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

On Thu, Feb 16, 2023 at 9:01 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Compress entries of the of_match_mtk_mmsys array to reduce the amount
> of lines and increase readability; this brings us to a maximum of 90
> columns.
>
> While at it, also add a sentinel comment to the last entry for the
> sole purpose of consistency.
>
> This commit brings no functional changes.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

