Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4802AC001DE
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Jul 2023 13:02:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KM9G9UWL460MIs8mOf1NTrNT8jPvFV0ecdNaflzST6o=; b=uxLijIoIHgcudS0GW5GFfuS0EG
	kZYYhi3Cf7hv5Ezrm7vsfVV7ueHBVVnvXe8FTjCfrJt8V8+vrTzroKWJjpVDi3HrIyQ+UGBZu0Mkd
	B9b33bVcuE/buALvZ5lCLuUA2j9j4oSxAUIMGIhNMGCZCbYDAUMH4bEwYgo4Qk+yHrIZRGd+wX6I7
	Jdi/K+l7sYIMIYMUEpkweUnO4DgvcYl0MHf742F3TWlp2pa6RZxFtDVzEGEkgEN7hdT2j/Bsq2OST
	4m/ormFOhBPmX0OV1Y3pcZBRvAm/+UoEFu0HX8RRiU+ih+j71C7QAYvX+eI1loH2Hg+aRY6XHGqZS
	/hMseS5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qPN6a-003U8w-0f;
	Fri, 28 Jul 2023 13:02:04 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qPN6X-003U4z-0b
	for linux-mediatek@lists.infradead.org;
	Fri, 28 Jul 2023 13:02:03 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-3fbc59de009so21090795e9.3
        for <linux-mediatek@lists.infradead.org>; Fri, 28 Jul 2023 06:01:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1690549316; x=1691154116;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KM9G9UWL460MIs8mOf1NTrNT8jPvFV0ecdNaflzST6o=;
        b=046PezP1WWtv6k0s1Qd7IazqPsZ7Mc4/Cb5Xdfdcm0LGbRFNtDxy7tcvfk4heZHqtK
         kuMMgOAAKuEMn4VsPefhlYkxjN3+a+0AAVZSGxx5ZBpMpmo3scR6Q5BKPhglz9jEvCMT
         xRUDEYA38LxXpU6hmyVMGBwJZF5IVOhGPvcF15Jz/hf7o35Uvp3CGGnc9wb0JxTzqf4z
         rgOeqCF4C2LO3bECXABhd3Hy+N++80m4QGxugzp5/4l4IgeVZhx6/7A65jfmEIdQH75K
         2px4uO1TbhQnQNnPeSiq1AokeTglJQwp8RcqM1TddI086DLJQzovjITFToz/yCeHg7jy
         JV0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690549316; x=1691154116;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KM9G9UWL460MIs8mOf1NTrNT8jPvFV0ecdNaflzST6o=;
        b=dpxLz/ywBcoMCS7jnvKQ2vclx1j59KjQDyv0paulZnm49qYaKGVnVNwJtaIpR6/hNL
         4mNbBhgTP/wJggWOLP1tDz0nuZFTFL4n1mKd1hPAdrQ+wjEseuBT0sMaMBe1yHKJDLen
         MT+J8y3/c/AOo2xZ5Jq6J/sCDfaOrgRdlu7bzbYs7GFASNB7otoSxnSWgTOpf/HBxvZp
         O9SF0wse6n33ndZo1pb1HVQ0ryAK+jfmebCGmpAomCXCrSabyN7X5shOLyzC1Sjn//h8
         kyk6ZBbYnyD0f8k/1yJUxjtXiGyNh2nSK7sICf05NIydIhjm/zRaVCbd6E2fa3N3uBKa
         3waw==
X-Gm-Message-State: ABy/qLYT9Npmq5TULtxtUEtiE9iLx3pH3idVIN0oQuEd3G6bddM1O201
	Aqzu/l2zW30BpV0j3wFJqTIFAw==
X-Google-Smtp-Source: APBJJlEDFKNwbvv1WM27Au+d3FTJnT6D4PrRXlESZAGL6BtAJ9OoikVkz4a+s3hD1klzf2rdjQLeLg==
X-Received: by 2002:a05:600c:214d:b0:3fb:9ef2:157 with SMTP id v13-20020a05600c214d00b003fb9ef20157mr1592571wml.28.1690549316788;
        Fri, 28 Jul 2023 06:01:56 -0700 (PDT)
Received: from [192.168.1.172] ([93.5.22.158])
        by smtp.gmail.com with ESMTPSA id 12-20020a05600c020c00b003fa95f328afsm1505130wmi.29.2023.07.28.06.01.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Jul 2023 06:01:56 -0700 (PDT)
Message-ID: <e0d09d7f-09a3-748f-426f-beba43413fc7@baylibre.com>
Date: Fri, 28 Jul 2023 15:01:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH RESEND v6 10/11] drm/mediatek: gamma: Make sure relay mode
 is disabled
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 chunkuang.hu@kernel.org
Cc: p.zabel@pengutronix.de, airlied@gmail.com, daniel@ffwll.ch,
 matthias.bgg@gmail.com, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, wenst@chromium.org,
 kernel@collabora.com, ehristev@collabora.com,
 "Jason-JH . Lin" <jason-jh.lin@mediatek.com>
References: <20230727094633.22505-1-angelogioacchino.delregno@collabora.com>
 <20230727094633.22505-11-angelogioacchino.delregno@collabora.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20230727094633.22505-11-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230728_060201_222299_D94C9B90 
X-CRM114-Status: UNSURE (   5.99  )
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

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

On 27/07/2023 11:46, AngeloGioacchino Del Regno wrote:
> Disable relay mode at the end of LUT programming to make sure that the
> processed image goes through.

-- 
Regards,
Alexandre

