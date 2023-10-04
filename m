Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 233ACE7B5F9
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Oct 2023 12:18:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jx809ZZPmQX9bCss2qHfga4iHIHABGn3+dRnDoOEwBM=; b=Oi2atJOmAhQiNk+S+woZhMlFFS
	E8r+JbevuV8RLP5OGdgP/CBMjqLMIOevob1Gah5igtA7Zwt1qWq7utIHoVk1cDs7HtyAStldiNcjm
	vtOZqOw/2GEpVaBF4gEYYgnXQuvDcCPX0f+RvqbphmAFWwI09dyQgAi2AnaEsOU/8352IkXW+Kucu
	e0CrZRRfwy7vu+18PTowTtfuHHW4rjzBt6fbX21/kuDHFWUNotwgeVSi9M3hvkb5bx/mBHsKPddcy
	OxA+lcdRPZBsx8bQHCXKGLowk+CQaYxp8IygNj7ENTMpZ9drg5rMoJlDEl9puUxSZeIPmwg/N+ZTa
	Ekce9geQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qo0pM-00HaQ8-0P;
	Wed, 04 Oct 2023 12:18:08 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qo0pH-00HaPQ-29
	for linux-mediatek@lists.infradead.org;
	Wed, 04 Oct 2023 12:18:06 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4064876e8b8so20966355e9.0
        for <linux-mediatek@lists.infradead.org>; Wed, 04 Oct 2023 05:18:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1696421881; x=1697026681; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jx809ZZPmQX9bCss2qHfga4iHIHABGn3+dRnDoOEwBM=;
        b=WVU2tkqLZVOHr+93SDarx+i5PGEnuWWzFnXklO5kyaC51mLXxs9WEUkVvBLRM2fGzS
         Wa5iJb8cjL2f2YP99qWYgWjr77ayy5IuX3DYc4tnigQdm2E+p+59qKWO5xtRkFQr5UWk
         zJt2AGh5oBJU09ZSVM1zhcfV+8OzRUxzJxAUN9zhxBDeNbcE+0wZvlcy3QBinG/LxVmF
         wO7v2aNxgXxfxXJ8rF4Jmq2jCxkF/GaieCkfmriWbFm8y97cQNQ4pPtCt65EpE9AxESB
         wBwoGIAsVEyT24627uM1obMm/gJyRKMnoL3QKra4zY4U56PTFX6slqjblyvjj0b1udvb
         Qndg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696421881; x=1697026681;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jx809ZZPmQX9bCss2qHfga4iHIHABGn3+dRnDoOEwBM=;
        b=ivp3VJzXvB2BkkpQFGYqO6dSYkOuX2Fn/jrLy+CSeQjV9geRsaNscgoAvTClOZumxV
         8Tu7omfZAMlA1aXI7tWMpTnk35JCFE3yh1qEIlkYhUnBuK45R5SfKf+eeV+78eHRlQuH
         p/G/AXJW6bQPN1vH2Gsj7WD9sC/HDnA8tJr3QRIrvUj/aLfOHgQdvc3iyezW4sPj2mhE
         Fu42/gJERheM/zLAo2wTYcbHJ/xVwLrqeNlkE3uW2NAOucXhMiT8jV4HWJ0P/74CXQqn
         kJRroo9ijJpsleeFenoU/pyMacqRLQDL2HqXS+BCfbchNKtiUO0xEz1uOCdLQksphgV8
         Lveg==
X-Gm-Message-State: AOJu0YyA2Ok0m64GrS/BMhMUtf0AKR/5E1Fp8MyEyyKMS0uZTv5RywV2
	PJvYO3LUmDGoqpyfamdCZ/gKdhaLCm9sLyskoKo=
X-Google-Smtp-Source: AGHT+IE3PlonxvNG9K0O/ooQBE2t08mHBkDvaao/sVglxJTmwYrc4biZ9IOQj1rAv7vYdVx+kMu1lA==
X-Received: by 2002:a7b:ce98:0:b0:3fc:dd9:91fd with SMTP id q24-20020a7bce98000000b003fc0dd991fdmr2062644wmj.40.1696421881447;
        Wed, 04 Oct 2023 05:18:01 -0700 (PDT)
Received: from [192.168.1.172] ([93.5.22.158])
        by smtp.gmail.com with ESMTPSA id o4-20020a1c7504000000b00405588aa40asm1375832wmc.24.2023.10.04.05.18.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Oct 2023 05:18:01 -0700 (PDT)
Message-ID: <9420885b-784f-5f80-e273-7bade6285676@baylibre.com>
Date: Wed, 4 Oct 2023 14:18:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] MAINTAINERS: Add Angelo as MediaTek SoC co-maintainer
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org
Cc: nfraprado@collabora.com, wenst@chromium.org, robh@kernel.org,
 arnd@arndb.de
References: <20230929082009.71843-1-angelogioacchino.delregno@collabora.com>
 <d26ee3f8-d5d3-e46d-4d79-098992d13790@gmail.com>
 <77bfcbca-e7fe-49e1-952a-c99596160c0f@collabora.com>
Content-Language: en-US
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <77bfcbca-e7fe-49e1-952a-c99596160c0f@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231004_051803_924151_C656432F 
X-CRM114-Status: UNSURE (   5.68  )
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

Hi,

Happy to see you back and fine Matthias !

Also, I'm happy to see the Angelo's step-up welcomed by everybody,
it's a great news !!!

Feel free to ask me if you need help.

Alex



