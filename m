Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31C87C7619A
	for <linux-mediatek@archiver.kernel.org>; Sun,  2 Apr 2023 16:52:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QFgTnd8uCD9hdangle5ftrUkUS5oCcd9OyJO8+L+8rs=; b=PRi8z5xs+OeTXALs6vVnh+F4yw
	nr1I1hMM8HtOY1BiSpe205YgwfMR9OqoAc7wSOuoJVLWOuf9tEwcbqqr/GXsnws6yhtbuUAsd3lIi
	uBb2cv8naO62sYJLe0hPQQBahZVRjj1biHSFcV0Om+unDFwnixQkyS/4MC/tt8eptmKXIumQFz8Vr
	Jg0HvZXApOrmQiVnCi/1titaU4b8xAM2EWcgDqLJhL35Jkq2Qg+O5DWUgrb1LP2mU4YXi6L5aG9Rl
	CV0sVihPrsF0KRHxarEDAY76Xoj26xWHvC7qCWqo2qpnoynXy7C3exrEqidMkZi8DpCIG8DivBE61
	gzwMWLnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pj0wS-00CrOk-0Z;
	Sun, 02 Apr 2023 16:52:32 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pj0wO-00CrNY-11;
	Sun, 02 Apr 2023 16:52:29 +0000
Received: by mail-wm1-x329.google.com with SMTP id o32so15731716wms.1;
        Sun, 02 Apr 2023 09:52:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680454344;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QFgTnd8uCD9hdangle5ftrUkUS5oCcd9OyJO8+L+8rs=;
        b=Lr/86VKyFxJj0tGI25dYkOewqphKXvklHcSfP3jJPOZ3xbh1EeDfPES8cRltuO6Gfk
         2+jIrD1DHufPCiThQQlkG0o7X2msJMtx2Q1aqwR2bIIYLVedvtiSm5b1gym6Rb97ob/Y
         L5hiVsu+EXAkjw3W2X61qUM/U4lVu2izuF3K5X9x9NqveiiK3ZS7+VFVcsq/McyEMGEY
         GaJWBTY4pNuYZD6Sx2fBE8WSe5Iy74+2TtAiG82+oJ+L1Ljvhm98Kpzk1TeXiX9f16eX
         QANUq4C5mAyOcXk84bgfaIC9Y9KVA9nxlgvvnrBF+G4QAsXIeOH1xv6kmKHtLOMKsE0J
         Wrbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680454344;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QFgTnd8uCD9hdangle5ftrUkUS5oCcd9OyJO8+L+8rs=;
        b=5QBDf/edOxFqTWwV8p8xEUZjqvbqd+Jelx2QncxQgbMLxCjQxWtL5hqu2D9QnIaICH
         Y1/Vl2vjPjJhvyURlop9Gx5BQ19iF77cpSw2tv8aD88Ew/U36N7K82LNN1p7OEQEXECJ
         dw+7f/ZEWnha/QUgd8IN12ZDb/AyepsWkPk76MdtsRsByv3mHsSkf6gfLIZY/VKX/oAe
         jV9AnfR/Ij7HtLAmEEys8p/wj/6xA+bdsBrbaY/RRhyN/bN+dxerCjCJ7mJKlFtf9dEI
         3wNyAI1diC/7rhIv1wbPey0Lkl7cvtI9uOe3WN+Ytq9MLrqdI+ABSfNHCcsTKfHU/A/3
         CiOg==
X-Gm-Message-State: AAQBX9fmEqG9VHB0lo2q+3fJNjB/n3Fqg3AqIZ20m/x8PPonUlGzaXF5
	5EfdAxiHfZ2ab9fPuX2veO+DD4Rp8uURUA==
X-Google-Smtp-Source: AKy350YKoVMhVaqf8Ro4NQlhX4kPKXtf//FlXNVEcXiRnyVwSxlYtfErw7crIn9bvjt5Js8azkkIqw==
X-Received: by 2002:a7b:ce88:0:b0:3f0:3a5a:362e with SMTP id q8-20020a7bce88000000b003f03a5a362emr8413189wmj.39.1680454343617;
        Sun, 02 Apr 2023 09:52:23 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id b39-20020a05600c4aa700b003ed29189777sm16375913wmp.47.2023.04.02.09.52.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Apr 2023 09:52:22 -0700 (PDT)
Message-ID: <5171511b-4021-589e-3606-10a690b48850@gmail.com>
Date: Sun, 2 Apr 2023 18:52:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 0/9] soc/mediatek: Cleanup mmsys, mutex, cmdq header
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: jason-jh.lin@mediatek.com, chunkuang.hu@kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20230222094253.23678-1-angelogioacchino.delregno@collabora.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20230222094253.23678-1-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230402_095228_395336_A1E40736 
X-CRM114-Status: GOOD (  14.33  )
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



On 22/02/2023 10:42, AngeloGioacchino Del Regno wrote:
> Changes in v2:
>   - Rebased onto Matthias' v6.3-tmp/soc branch for VPP mutex conflict
>     on patch [5/9]
> 
> This series adds a proper remove callback for mtk-mmsys, adds light
> cleanups on mtk-mutex and, more importantly, adds a cleanup for the
> CMDQ helpers.
> 
> Special mention goes to the latter: this is just in preparation for
> a larger cleanup that I plan to do as soon as possible on other cmdq
> helpers users, being mediatek-drm and mtk-mdp3; that's not performed
> right now because, in the case of drm/mdp3, the cleanup is not entirely
> trivial.
> 
> AngeloGioacchino Del Regno (9):
>    soc: mediatek: mtk-mmsys: Add .remove() callback
>    soc: mediatek: mtk-mmsys: Use module_platform_driver() macro
>    soc: mediatek: mtk-mmsys: Compress of_device_id array entries
>    soc: mediatek: mtk-mmsys: Add MODULE_DEVICE_TABLE() to allow auto-load
>    soc: mediatek: mtk-mutex: Compress of_device_id array entries
>    soc: mediatek: mtk-mutex: Replace max handles number with definition
>    soc: mediatek: mtk-mutex: Use module_platform_driver() macro
>    soc: mediatek: cmdq: Add inline functions for !CONFIG_MTK_CMDQ
>    soc: mediatek: Cleanup ifdefs for IS_REACHABLE(CONFIG_MTK_CMDQ)
> 
>   drivers/soc/mediatek/mtk-mmsys.c      | 135 +++++++++-----------------
>   drivers/soc/mediatek/mtk-mutex.c      |  80 +++++----------
>   include/linux/soc/mediatek/mtk-cmdq.h | 114 ++++++++++++++++++++++
>   3 files changed, 182 insertions(+), 147 deletions(-)
> 

Applied, thanks!

