Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 208F9C7619A
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Apr 2023 13:49:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bb6P2byqyLNvxYx5mpnu/HADSn0CeAL5J6+dhakFGrg=; b=qUX4iLUHFIaFky2x/IRE1SxcKe
	RtI0xH+hiwt+V3ZQUwHDqQrjzcdQ3A+EF/s95uv8y/I9tr+3COii8oPBg19VmfSLsdcwFVl7VmDIG
	mR6ch7plftGPz2Ab0Qxl0+PehymyeUIdQfE5wI7qaWAKUgsNTzYHqLTf7W2wW+k9x9paAPqFTkvHG
	8+xn+LA21rciPXjqIHS0XKCd73bpobRwVhas1dFpczSAUbv05wswpfvw4Oa2XHl7dxhooL78ttjAF
	ArgbxyUYOjCym5qSnnXA2W0aX3mqdfXe+RjfVH/6BFiT6AcpbRIiX/1D4BDNtZ+0KHlEv1KXcpQC3
	sMVuGm6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmar5-003Otj-16;
	Wed, 12 Apr 2023 13:49:47 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmar1-003OrB-1j
	for linux-mediatek@lists.infradead.org;
	Wed, 12 Apr 2023 13:49:45 +0000
Received: by mail-wm1-x332.google.com with SMTP id o6-20020a05600c4fc600b003ef6e6754c5so4289312wmq.5
        for <linux-mediatek@lists.infradead.org>; Wed, 12 Apr 2023 06:49:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1681307382; x=1683899382;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Bb6P2byqyLNvxYx5mpnu/HADSn0CeAL5J6+dhakFGrg=;
        b=B9v3Cr72e/au74c7iF4mlnBofvVBf0by7QnZev1/Fg+aA5h0JtHabAGNwWsTm1dhJb
         QaHZJk3eU9ZK5/S+ufoY0/U9W83wj8VLxD2sX4rqNIlHS7bbp9sDlk6iqXgC1mTacuk4
         +RI4jowaObwXoqScKuNcmsqBGuxn86bKGkm97Dv1CgBDCmVWFt+tnlRyfPEBC9BpQZS2
         YDSEKlsByawXVG/u3DR52AD1jUzzVoJbsyNWCCHPx07GuxHSi/fktwXGh2oun3AqtCE6
         dJNXUJvNoW6UQrP40bI4//QvWskJftzd1z+RQhoRADiCG8FBuJYsaSPonV/kamY1STsa
         0GNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681307382; x=1683899382;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Bb6P2byqyLNvxYx5mpnu/HADSn0CeAL5J6+dhakFGrg=;
        b=3oHlInQX5O2ajA+XDMD5BIZ5xockO7QAxqi7u7T22EqGx/Fr3IXHRCXHQhJ92B0AZf
         7qTj7LOheES+kfKuRHBCnTy602JSFEII6I0rRzdaPeozJFFQqOWo/AdrtyVjb+LDP6Bs
         VKy2LSodtqPej3vbJIJDbHujflcpUBVpz5BPEkkMt+LNxkcn1Q8Bxa/FIiFjTaA0ybbl
         uQAfeBnTAs1b+lNvd4ZaodhO2t2M9a7skVYufcfdmn+fkJ/8tsGSZZvdDna4QzHo3cM3
         me35C2oKxT+8Evey/8aosguAbEDTcAQp1Jqnugs59jvP8WHbrLXksLUdyPRvxVjjE+Zg
         b/4A==
X-Gm-Message-State: AAQBX9chO7f6WGejnfb3VXHUa9yHX0PSY3719+glbLzk3AmWyNVfZGtE
	QRz5RTVsSztjj1Q38Yj+NNF2Cw==
X-Google-Smtp-Source: AKy350ZXbR07ORT2zgwh1nwhJhmgY6mdrSYJvMKUTwK7WgHD/vtESiSZPZKxhQzGEBaaP+LS9j+LgQ==
X-Received: by 2002:a05:600c:ad2:b0:3ed:9ed7:d676 with SMTP id c18-20020a05600c0ad200b003ed9ed7d676mr5037319wmr.13.1681307382012;
        Wed, 12 Apr 2023 06:49:42 -0700 (PDT)
Received: from [192.168.1.172] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.gmail.com with ESMTPSA id i19-20020a1c5413000000b003edf2ae2432sm2466316wmb.7.2023.04.12.06.49.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Apr 2023 06:49:41 -0700 (PDT)
Message-ID: <de13cb5f-abf2-86b3-d2e0-2b1131cd8dfa@baylibre.com>
Date: Wed, 12 Apr 2023 15:49:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH -next 3/3] drm/mediatek: Use
 devm_platform_ioremap_resource()
Content-Language: en-US
To: Yang Li <yang.lee@linux.alibaba.com>, airlied@gmail.com
Cc: daniel@ffwll.ch, matthias.bgg@gmail.com, chunkuang.hu@kernel.org,
 p.zabel@pengutronix.de, angelogioacchino.delregno@collabora.com,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20230412064635.41315-1-yang.lee@linux.alibaba.com>
 <20230412064635.41315-3-yang.lee@linux.alibaba.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20230412064635.41315-3-yang.lee@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230412_064943_594243_9472C8D1 
X-CRM114-Status: UNSURE (   7.63  )
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

On 12/04/2023 08:46, Yang Li wrote:
> Remove variable 'res' and convert platform_get_resource(),
> devm_ioremap_resource() to a single call to
> devm_platform_ioremap_resource(), as this is exactly what this function
> does.
> 
> Signed-off-by: Yang Li<yang.lee@linux.alibaba.com>

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

-- 
Regards,
Alexandre


