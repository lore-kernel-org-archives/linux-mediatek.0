Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D0FFC7EE2E
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Jun 2023 09:33:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cOj98+SP3A7ue8uJEiHbklaDi2wbfbIhAir4uuSrLHU=; b=ntRvG/4UNmjfPJK0HpuZXIwjQB
	cmK9qk4hdpZi7gvB5+dFlw4frfFl0BMUWB8INJ0yw3Gw0cZdarQCUr3QmOMLpHBBBXEhGOmmaZomr
	IdsBRedkZyF/dUTEBM2YgUoj9MnJZ9smZoXDOii54q/iwVcb8tpD+k2483F+MntpBHPbBV+vMy+L+
	p98Lt/Z/Pvu6KWGwcuHjD6+yIxOKjnHLCEsnj0f1OA0ncCB6aLpZVuOCSJ/RCvPVC4ZC1x3f5kozT
	RRp9ArRl3sOFbmAj3tPC9LvEOdoACnMd5Tyl8qLUAkErHoeSewG3H/ncj7uU3TOzvoAA8Bqt3WkpS
	bhIB3cdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q7C1S-008hfV-0c;
	Thu, 08 Jun 2023 09:33:38 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q7C1P-008hdj-1O
	for linux-mediatek@lists.infradead.org;
	Thu, 08 Jun 2023 09:33:36 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-3063433fa66so264920f8f.3
        for <linux-mediatek@lists.infradead.org>; Thu, 08 Jun 2023 02:33:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1686216812; x=1688808812;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cOj98+SP3A7ue8uJEiHbklaDi2wbfbIhAir4uuSrLHU=;
        b=Laz1RwxGIXm70TgzRDCLNkCjouhFptZ6gdr6yztXF1zDimdNhFWFzEGo6BPIMxK2yG
         qhUi7PZ5Pj/IIFnP7F/khg/w29O0p+iS/mDwDLmD+GsIg92naL8tetlwmvWgNZnr4Vmm
         LVos3YWwVd21ZDWTGdrN2b4ips7bQLckATt4+dtyw7YzTiIYGYj/Et+6JfvPv6BfTcAf
         EKzbqPH4jMtezbOAUCtX+FVxOBbQakai1lzurb8RqhMwqguCXmeeBAnbfjBUbjdACBU5
         YiG/df/4i2ihDgFBEmWEwE6ZzPdrx4qcmwRSiBx1RYEGZ3jv2M/x0J/No3yZV9O0jf6d
         VG4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686216812; x=1688808812;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cOj98+SP3A7ue8uJEiHbklaDi2wbfbIhAir4uuSrLHU=;
        b=RofVa5uBml4UTwy6CX/2VxiDsPXeMwDaiVHfeP3IARarPb/hNCTVXBfX7wngcHR67Z
         e3R3qeui0QeVMh/7a7h4H+FnpHR9rO4Q9J9NiK2r1cTt1bnMCoBux2ZGV/ezgxbO4pNU
         jFovYVNMFOGGHostjfUNulsI7x1wyD0cXe298MYg2Pu1mjVXe7yuS5A/R/YrWUtbS2lY
         2dsDkaqG4AraBEnv66z5A4EYi6mmZzrf3/aiylXYFCj65rxv45LsgWFOqLtMJ0sgXQ3t
         /sr3mI3pCL/ffs3w279tr+qLUqjqbAEB/9gJztlnenhdEX25mj1KEY+AdOIZaXxaG8mt
         B88w==
X-Gm-Message-State: AC+VfDwfE6j0/uMv5W3bQZDZM1VbiE/6VfTMQRXXggMrU9ulBgNMqHme
	0mYdvM27S2V82D7hlOIm/7sc1Q==
X-Google-Smtp-Source: ACHHUZ7P8OxpxQTjiKrorLWZywqz5NMirJO0K4lefJ+9XIYZYERDkbTiMsX/D53AhUJjyGH6f3r1lA==
X-Received: by 2002:adf:fccf:0:b0:309:5068:9ebe with SMTP id f15-20020adffccf000000b0030950689ebemr5857679wrs.50.1686216812642;
        Thu, 08 Jun 2023 02:33:32 -0700 (PDT)
Received: from [192.168.1.172] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.gmail.com with ESMTPSA id b14-20020a056000054e00b0030c2e3c7fb3sm986359wrf.101.2023.06.08.02.33.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jun 2023 02:33:32 -0700 (PDT)
Message-ID: <bc366bde-95f6-1ddd-9528-a9c1dd30c04c@baylibre.com>
Date: Thu, 8 Jun 2023 11:33:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 3/5] ASoC: mediatek: mt8188-mt6359: Cleanup return 0
 disguised as return ret
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 broonie@kernel.org
Cc: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
 matthias.bgg@gmail.com, trevor.wu@mediatek.com, dan.carpenter@linaro.org,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 kernel@collabora.com
References: <20230608084727.74403-1-angelogioacchino.delregno@collabora.com>
 <20230608084727.74403-4-angelogioacchino.delregno@collabora.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20230608084727.74403-4-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230608_023335_505658_D03B12C8 
X-CRM114-Status: UNSURE (   6.95  )
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

On 08/06/2023 10:47, AngeloGioacchino Del Regno wrote:
> Change all instances of `return ret` to `return 0` at the end of
> functions where ret is always zero and also change functions
> mt8188_{hdmi,dptx}_codec_init to be consistent with how other
> functions are returning errors

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

-- 
Regards,
Alexandre


