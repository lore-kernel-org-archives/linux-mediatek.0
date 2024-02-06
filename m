Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5F48C4828D
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Feb 2024 15:21:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RIc4mpHkEyVhvzKbl3/CXTyhjyWRujcUA5n7Ow/N8Kc=; b=ohHsaphaAwjBeD
	0Isem9yqm2wI2VTDHJpf0W8IcjPlmpUy/E5oKF11Lqs8ojASTI7uomxlQ5nR+H94S06oV7XSj1RMv
	Xt3eUvn98uVAUWG1vgfmzoXMUMOzQUHWU2Obd9WKEwBOhSAbWPsUWbUAcrmzEqQLLx08PbgBzvCBJ
	rqxd/DcHrz4GGZ2jQ9NAMjNRMcW1DwNPvwtDy6mqCp2giBRLAa3E2d2P7RbZIKUqgpA2riLhOFh3j
	YySf9KoWyeFGnIfKDbRz9kdYPoJzP9ZCXfIWiyWh3gJ5XhwNvZbWfxqZR2pGKfBZqy7a9nFXDO4ty
	/hUzTDKfz2JxXiQhiX1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXNG2-000000083vF-1J06;
	Tue, 06 Feb 2024 15:21:10 +0000
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXNFz-000000083st-1mQV
	for linux-mediatek@lists.infradead.org;
	Tue, 06 Feb 2024 15:21:08 +0000
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-2d09faadba5so36327451fa.1
        for <linux-mediatek@lists.infradead.org>; Tue, 06 Feb 2024 07:21:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1707232865; x=1707837665; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RIc4mpHkEyVhvzKbl3/CXTyhjyWRujcUA5n7Ow/N8Kc=;
        b=wBiB+pdx9rhWOIg83J5ig9VcJtQ3rZUjAc00h5pBumf20rvHsBmdQM/64+rZKI9Nus
         vt13uPuiEa6wdNQF4pRuXyAagGOosAzwIGxWgq8shNGD/sDKtJ74dT1hUF7Y07lg/Va/
         v5M66YY/ifQe62zkm6CqJyTgyFE/IO6BHytRr8lFLqiFCtjioWMdhSWQRnMWuIA/zw4S
         sMNXYRO7OOeXq4r2QYVSAZI5BUCePwwdL/ebfgpoTnM0flnaCKSu7u2lW1Be9UCuf/cC
         asu1RIOmyf/9AMbLBEOOF9NEr5NwDAzCS8lkoQJuawMpU8b2U07FbqsQrqINJqCFtDp3
         8VHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707232865; x=1707837665;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RIc4mpHkEyVhvzKbl3/CXTyhjyWRujcUA5n7Ow/N8Kc=;
        b=iCIzsoQFjGuW+vxKZZ9XRdCpsyUanwGRMcSd89DnALRzHWr08Sr/sAf9ZTPXVQa3Kf
         ST4cwGT8twGgel+X/JC78lf7arOfVaoh0jqcl+qmRDpSony+4B3pyqZR6OLR705PES7R
         lYwm5twi6zTsifPbvGSzL/TUc2h01EisPvpVX3hXu5+bxKyigf8R1i1sSnnVbuy/BKU1
         c703m+hcotvlqgE5Kck3OqVZ+8h47t5lmhrPYHKLnwZOExe5RyV5IG+74vL1diGdOlgF
         tV/exlm+XnYIbsVL3FG75OYzgBUHFyBt0DYTGOKgDKAVDGlZcqbhjwQqNGXP4xCR5tpB
         +ivQ==
X-Gm-Message-State: AOJu0Yxe349hXFbH4soCTaHZ434FlFr5mawV/YuG8hNXYlBdDyQdzSE3
	ttvpX2WlchZm8IFKrRWfMukw7/Reh/4BzGV8TA2m+9LVlQHrAXPJFkAm/vKeqLs=
X-Google-Smtp-Source: AGHT+IH6B9hxtB51OAbCk+OHsZztqp+0HCBvlYX0qY5/9gpcQGkhT3ZpT3m/XchRQjfWgcgI6+PF/g==
X-Received: by 2002:a2e:b24d:0:b0:2d0:908e:d825 with SMTP id n13-20020a2eb24d000000b002d0908ed825mr2135508ljm.21.1707232864903;
        Tue, 06 Feb 2024 07:21:04 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCVzh2Ov2RC+YTsegCX0tzyIx3Lk6zKPQmeoT6oJ0BC1fRsrm0SsQBPV4G5d8jurnLVezvqIF0LxGaRRFkCFI6iVG7PryI+Fx5Oe9TfkG+BkF7qENEvsMcFd/Q1Xu5i6TEFk9m+ctOVtJ4C2UH//Ks/72ACsYssXDlbe8POsU4ku5swiJNOSS/SyLFcYEDlYSYiTtxZe4xgM59SlWwvKr2Geqojgb0jzz7f5bo7szkiMAUE2a36mnV6xHu8Hy8gbe1SRimKUMiOGO+dK6cV5NktlO4d5oAkXeV1fdDpQiBVe0LqysNOUyBTcTvKIH94M7GHJSyoMg63UjPR/ycon8igVEoL77TUZ/p4TAs7tLyD6Gdb1eoTC9+iSsX45I5B/nYCNucFr1SaFgoUJVTY7rYPRQQNmJbFu1rSlFQ==
Received: from [192.168.1.172] ([93.5.22.158])
        by smtp.gmail.com with ESMTPSA id p8-20020a056402074800b0056022d78141sm1124432edy.56.2024.02.06.07.21.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Feb 2024 07:21:04 -0800 (PST)
Message-ID: <07c825c7-5036-4b9a-946d-eaaaeb4c050b@baylibre.com>
Date: Tue, 6 Feb 2024 16:21:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 8/9] drm/mediatek: dsi: Compress of_device_id entries
 and add sentinel
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 chunkuang.hu@kernel.org
References: <20240206120748.136610-1-angelogioacchino.delregno@collabora.com>
 <20240206120748.136610-9-angelogioacchino.delregno@collabora.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20240206120748.136610-9-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240206_072107_496634_852C5790 
X-CRM114-Status: UNSURE (   6.01  )
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
Cc: p.zabel@pengutronix.de, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, daniel@ffwll.ch, matthias.bgg@gmail.com, kernel@collabora.com, airlied@gmail.com, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

On 06/02/2024 13:07, AngeloGioacchino Del Regno wrote:
> All entries fit in 82 columns, which is acceptable: compress all of
> the mtk_dsi_of_match[] entries to a single line for each.
> 
> While at it, also add the usual sentinel comment to the last entry.

-- 
Regards,
Alexandre

