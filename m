Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 923E8C48297
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Feb 2024 15:11:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BjQKrJiqto5Ob+/v96nV9FtvyMGmkQizdinJfF9BpvA=; b=Rrqfk7mWTFENcx
	ZyslkUbrGm7r2aU6gARZb4/y3sVp846dKuOa3YljVtBUPUB6I9rMgqXZtYE9cbyJCKhFn7tA3SpbD
	mNFya4OJMuI/ur8lAz16NRYoreGcciVcqoa+FVk17M+eBrUNvEkgzrHiBGRRgG8IDaUr1Tem0ooPb
	TSAn7i6n/eHZf5/Itk3KHWsV4+6reM6oHM7HhTMUfnzCzemSfNE19Z8ctJ9i19WJ3XW9kjHwooyGG
	J48R+EZ8dsdlXuc/koImY7HwqSCDbIBkw2mJdyu7vxMhjKnX24VpcKLM1BZfXknyHiRYrMQE+p0Ue
	QDJERVSIhwnreplLNyQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXN6O-000000080oV-0w6c;
	Tue, 06 Feb 2024 15:11:12 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXN6M-000000080n9-0qlc
	for linux-mediatek@lists.infradead.org;
	Tue, 06 Feb 2024 15:11:11 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-a2f22bfb4e6so753706666b.0
        for <linux-mediatek@lists.infradead.org>; Tue, 06 Feb 2024 07:11:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1707232267; x=1707837067; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BjQKrJiqto5Ob+/v96nV9FtvyMGmkQizdinJfF9BpvA=;
        b=QB/1iKNTRpyH/Mka1Lkwji3VtNIpoSRQchJzUS54cWB+3t2tlQAOqHckRXiE43iTWH
         WKKYnnn4fiwQQU0ARzhpMO9VXKA8pljb51ewzsbHET3Ejf5yg6eiXw4BS9ux8p2MpDEX
         DAcyhWwM2M3qvvpYA3PjOSLB+31Jd2F04R5FwTorGb3cBUwVigYCf1CVbbf0P4Ry5GmD
         rkdG1BIgZTcFqniCw+QVDg8FMwOgrPQ2TCjvH6NkTNUMPqlMYgPnmvTeRYG/RP1YXT3u
         k6is99vj6hpIVVpnaDZTSrByPJV5Fr//ylCLIjX3U2qwLbR3GU/AIk5K80gdlCJ3cv66
         gIEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707232267; x=1707837067;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BjQKrJiqto5Ob+/v96nV9FtvyMGmkQizdinJfF9BpvA=;
        b=Mr5bYW1J0XVfn4fPIrYA2U2AdYeTb9jhE2myYxjgm1ZR+knoOX9dcfSWGbbIVm0Rgf
         FHgcJxKWKMf9TELoo0nl+WvzYi4dUyga+xzCjTC5Uvj9RKa2a6IktGiBAgogxK3/tViT
         H/olZYOVCZcEnDbYA0yhMJDqbLU7aZ2t4s+2aRqU1VUTrQVk76wyG+UMzHB5Fz+PBC4D
         ASVOvAeTGtlKbksygxSVhLcIligyE+RtjptxrRQFEeL2+viGLyp5QRrhVIZSsdNJ2OO9
         bpDWpHpWjeYTfjQgKf/Bu+3ho51b8sD2qHvGJmoeDEVEw5ky0R2+bdVtjogvI5644ovd
         7N2Q==
X-Gm-Message-State: AOJu0Yxgc9mJuGBjUj0Zx/vl/nWa64QMHIbF1936ntkPg9TfOV3Vj0tL
	uzOLWaAkmZ9BlfmUjdJIEzgDc6J0qhRk3wHNxmS0Gn8oiCNID6BElRY5ongAyi4=
X-Google-Smtp-Source: AGHT+IEWuOCt8voz4u+MBpvA4hP3K9km7MbtGtHA6Mv+jBPk9rsHCMaPnCNkcUZWrixdQ7z0/q5ymA==
X-Received: by 2002:a17:906:6d6:b0:a37:e8fb:1649 with SMTP id v22-20020a17090606d600b00a37e8fb1649mr1637365ejb.56.1707232267526;
        Tue, 06 Feb 2024 07:11:07 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCUpfUWzNOin8Ev9feQsK28lEv8UY0ytQSJdQbrL0dFp3df/wU1rkIi0XWIR+aedXQuVIQ+IECaHKD3CF9ZI/qNZAqfN4Zf4BHDYckYLgx32eiSYvGe7YIk1fuuFSVizeqs7XgsZlVDMntB+zN0F1jtZVVgaYCdOVTviENfQlW4JMbuzm4iXFVqd8j/p98p+uTZWiUUUmPx+3sI+RySJ4tEDABdeq3H2ciFF4JAvcU6vmXN9YbRaTPAAwi2Lclnl9fgxtZhU61QLEBtclp2uGB85QDKPNL1CwAyUJTzFiCFXwO7e/2XpHKhsbqjtmb/yKrzL8qQNsYW6JS7VWBh5aoeW102u+H8B4WTJ2d6EfzI7+hFSdw1aLDw2Z+eBKdgP8sX04McHhz8ZNx39/2sG8carxkbv4HTmZQeD4Q==
Received: from [192.168.1.172] ([93.5.22.158])
        by smtp.gmail.com with ESMTPSA id f14-20020a170906048e00b00a378377030csm1252795eja.41.2024.02.06.07.11.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Feb 2024 07:11:07 -0800 (PST)
Message-ID: <594a9b63-0e3d-4ab9-a1c4-bd25ee40d9c7@baylibre.com>
Date: Tue, 6 Feb 2024 16:11:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/9] drm/mediatek: dsi: Replace open-coded instance of
 HZ_PER_MHZ
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 chunkuang.hu@kernel.org
References: <20240206120748.136610-1-angelogioacchino.delregno@collabora.com>
 <20240206120748.136610-6-angelogioacchino.delregno@collabora.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20240206120748.136610-6-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240206_071110_255897_F299ECE4 
X-CRM114-Status: UNSURE (   5.75  )
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
> In mtk_dsi_phy_timconfig(), we're dividing the `data_rate` variable,
> expressed in Hz to retrieve a value in MHz: instead of open-coding,
> use the HZ_PER_MHZ definition, available in linux/units.h.

-- 
Regards,
Alexandre

