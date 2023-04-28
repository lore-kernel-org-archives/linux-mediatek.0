Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54968C77B61
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Apr 2023 12:26:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FCZD7/skKxELiLiQ/Kgtq9xL2gK3ugZhkE8UlBHv94Q=; b=r8osSTZSVOytKkG1MTwW/fvtD7
	r3jtxm0SzTz1oyJO5DzC/a2qWSg10KJb6nyIT4NAkl1FExQWO8B3LWM8OzBce4Ml0AQ8PwvTxIWj1
	QYr7tJIwJChyYmP+aiq70PX0bBy8HMvg54kyXg8rrrYWuip3f6lWrxhN9+5gDTa/nWzfz4iO7vkYi
	owTe/eV3cuEmAgPreB5MjKEcOBJ3zffjglb+NoPbn/4OYkuPXDROdm7FVw0DFzI9rT9xuJn8mZ23l
	czPjGiX9AFO9fvGZMcrKDhUj999KJ86/LsPCMFBIydVgZfFIxCMcqNn4UuQ8jzvBrIu3juiETu+4T
	x7RmBf8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1psNAk-009mWu-0x;
	Fri, 28 Apr 2023 12:25:58 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1psNAc-009mMz-1z
	for linux-mediatek@lists.infradead.org;
	Fri, 28 Apr 2023 12:25:52 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-3f178da21b5so67722595e9.3
        for <linux-mediatek@lists.infradead.org>; Fri, 28 Apr 2023 05:25:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682684748; x=1685276748;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FCZD7/skKxELiLiQ/Kgtq9xL2gK3ugZhkE8UlBHv94Q=;
        b=uUgsJRet2rXqZzO39tKpNe1PPCmGNTTEXDP7+XoXX1WhwC7n6SFii4fWBlBlWhWUDh
         Cnf3M/2voFfRkjanUwYgCBz2zCXELwRizuCZBuFMvKdhaRKabEg5/MXCGrzW+C6B6KJw
         mX+2F7apsDTDVgcLM6qxspDdmRl8vNGYIGdV09Q4ePTOB33MExIIjbOChffFbCNI8qoT
         IZdbIkrfFL1rjadYFEWADsvwPALuUxud15Tap5wnQgVssXZJAIpGqFxnqiCbs9SjDET1
         C7TPKyeBELoVR5mTyMPLZTyX9Clh0qZRpKcsOhjsNYZ73uRCw0qLpuqVYlgdzd7Fkeow
         60Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682684748; x=1685276748;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FCZD7/skKxELiLiQ/Kgtq9xL2gK3ugZhkE8UlBHv94Q=;
        b=GNwWPUEWLrPjOkyOWZPV+iMf8LEwXlPB4QveCty5Pb4uwSDs/fwdwwicNuaNcdGoJM
         5d/JvWJvHrW/pGEG8xA0B80qc+nR/peV8HYKOmyfL2hOiyqasDwjCi1wcxrxfS7n9csJ
         QTq1JoZOUvRQ+D+BcvtdeRRU9NRQ/7/lZ3EabLCfw8030GuiylaXKjLjQB7shnU/nvxf
         gu/bPbco3uy3dLHtZEcdQaUu3HSq91Oz4FKvhDo1ViC14KIqa4wZjTwI7tfTweTDRlZn
         zTRfkjXo3dYBjusFiLj1xfpX14o3HfdXvJzkdMJKpD6xnitI11Tje1tbrrllpn8fW7qZ
         MwvA==
X-Gm-Message-State: AC+VfDytEA3cuqi1TF9RA0Jk//GJYae8dm/GrX36W5wfY+D5qcsLzr1x
	dz0hybVxnsXK6mmW9/uiWuI87w==
X-Google-Smtp-Source: ACHHUZ7jrGfG5E3rVbh1rlyewG/33jkn7z+iNaDOwZOeE24lokjSTMXbm+oex+abJk6U0bKResFC0Q==
X-Received: by 2002:a05:600c:d7:b0:3f1:93c2:4df6 with SMTP id u23-20020a05600c00d700b003f193c24df6mr3758700wmm.12.1682684748414;
        Fri, 28 Apr 2023 05:25:48 -0700 (PDT)
Received: from [172.23.2.142] ([195.167.132.10])
        by smtp.gmail.com with ESMTPSA id i40-20020a05600c4b2800b003ee6aa4e6a9sm27367821wmp.5.2023.04.28.05.25.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Apr 2023 05:25:47 -0700 (PDT)
Message-ID: <00e293fc-e5f7-d451-5547-def284ac2214@linaro.org>
Date: Fri, 28 Apr 2023 14:25:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 0/7] GenieZone hypervisor drivers
Content-Language: en-US
To: Yi-De Wu <yi-de.wu@mediatek.com>,
 Yingshiuan Pan <yingshiuan.pan@mediatek.com>,
 Ze-Yu Wang <ze-yu.wang@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jonathan Corbet <corbet@lwn.net>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-arch@vger.kernel.org, linux-mediatek@lists.infradead.org,
 David Bradil <dbrazdil@google.com>, Trilok Soni <quic_tsoni@quicinc.com>,
 Jade Shih <jades.shih@mediatek.com>, Miles Chen <miles.chen@mediatek.com>,
 Ivan Tseng <ivan.tseng@mediatek.com>, My Chuang <my.chuang@mediatek.com>,
 Shawn Hsiao <shawn.hsiao@mediatek.com>,
 PeiLun Suei <peilun.suei@mediatek.com>,
 Liju Chen <liju-clr.chen@mediatek.com>
References: <20230428103622.18291-1-yi-de.wu@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230428103622.18291-1-yi-de.wu@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230428_052550_656056_8E4495B4 
X-CRM114-Status: GOOD (  10.35  )
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

On 28/04/2023 12:36, Yi-De Wu wrote:
> This series is based on linux-next, tag: next-20230427.
> 
> Changes in v2:
> - Refactor: move to drivers/virt/geniezone
> - Refactor: decouple arch-dependent and arch-independent
> - Check pending signal before entering guest context
> - Fix reviewer's comments
> 

Please explain what is Geniezone, where we can find it, what's the plan
for open-sourcing it etc.

That's what cover letter is for.

Best regards,
Krzysztof


