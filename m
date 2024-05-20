Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83AEFC25B78
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 May 2024 13:18:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2hALWE8fnBqoM58T1YdEXuHjivXfafCW3bI9ZwC9+E8=; b=mIK4a9qbIMHgpmIzRjqi2gBWsx
	5d1VsxpR8hQ0bwIMpZPZWWV7pl1roIMJuHpQ1pHnUQCMpep20l8YNxIdEKeCo+A2f/ds7x/HGp2nb
	RccquJoSyVjG4ymCQxHKcQrNN1l3mC1CRaLnQtKZ6GZOad54mlHEbZ+ree9x52/lbfmIu5H+aZmpc
	h3GVcp7OoZmYm6GlaDKTUUkMZNMuj50Chs3FM92Hzjr6jvo4VmlD85K4NybkDth9HcP5jR8ziU5Wf
	YT0GN5NhhOVPmPLUgyFg6pPBqMKG0VMMn3pyEgZmNa6pF2i75/WlOvONyCKUtdVVxDvmIjnQ2c/Mz
	oJmygPAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s92u3-0000000EYtb-0tby;
	Mon, 20 May 2024 13:18:11 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s92tz-0000000EYrs-1Nnw
	for linux-mediatek@lists.infradead.org;
	Mon, 20 May 2024 13:18:09 +0000
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-2e73359b900so2939331fa.2
        for <linux-mediatek@lists.infradead.org>; Mon, 20 May 2024 06:18:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1716211085; x=1716815885; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2hALWE8fnBqoM58T1YdEXuHjivXfafCW3bI9ZwC9+E8=;
        b=BLyl/qmYca++8BpA6hl6Mr+D/pEA32Cxrxrs1LptbmB0Qe+q9whfrImUt9XIM8U7ao
         M61Ltb+7+kSIDqKEnCgdGG3KjmNaqjHVowiKPyoeWcFllQlHH98TY3k724KwWp2h5SND
         +W4ljKDvC0MFhUiCYgY3rFvatn9I8+c+/pC+lzxYjaBZeqas2pQSiQUv7z66FOH8gau4
         inY5mNfFpm6OQmR6KIRkCd3Dk51u11wziGwaTgrwSuVJk/kGtCETCVLAtrzv/bcu+Vn0
         N6+YL+IIo6uilKwSBxRYOM6cCY+VMoinFmBwfD6r13OmGLw4HG53zZADAFs+WTMjs8qz
         CjPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716211085; x=1716815885;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2hALWE8fnBqoM58T1YdEXuHjivXfafCW3bI9ZwC9+E8=;
        b=u746iqjkfNwxiiaa12H16Lmm/ayGYtL1I6HuDvrXCTc5OQ3sDYAaKEDUyFn0CIpGvX
         ubg8xUH57vJtRaSgtat0p9mtaRsgkiiK8zSlVEEQMzJkIU/v5gYmghJ66yZxFso5sEKo
         n0IU8EjkTSveMQOhnBHiMHgYxcMYjgbsQhDHZjiowK0AbmxN+1SdDV1rtAfZuQNgxBFV
         KUJThSdcw0FKS/NR394vAM6RK5wEzmF0Y8u/hFDYMPKQbBXD330qdIMfrhyJy49Ir8Rd
         taMl1QY59F6WLguvukfIEop6qqbMAiB1LpC0m1TuKS2RGtyxA5BbcQAdmNV97A1gtXTu
         AJJQ==
X-Forwarded-Encrypted: i=1; AJvYcCVrvY6Lrv06RP1OZPS/Q8TLySCc9txjd2y9uW7xOb1ucQf7zXravt0WQX3Eae6fugFHElHorWqy8U0L1aMPYm510j1rqcgQYHxFx75eAQcnG3ca
X-Gm-Message-State: AOJu0YzKIncDXy35gp7ZzGPdj9bFHkNR4s/f7d7ZHPACsLIsDlpCzEKF
	oIlB6LdtjWMFqDZT11Q4rEZbW0lYKbG25A3WelTDirbusu+BEVDimAnQIjxi0Eo=
X-Google-Smtp-Source: AGHT+IHeYKVAaE5HyEsDgFLcMCPB2WCj14+aNFb2GEDcGEbOgS6uETP3DFE/sf70LFxupGhpUsHcGw==
X-Received: by 2002:a05:651c:1542:b0:2de:7046:b8f8 with SMTP id 38308e7fff4ca-2e51fd2e6a8mr293920221fa.5.1716211085159;
        Mon, 20 May 2024 06:18:05 -0700 (PDT)
Received: from ?IPV6:2a01:cb1d:433:4e00:3518:6eec:d551:4012? ([2a01:cb1d:433:4e00:3518:6eec:d551:4012])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3502b8a77f8sm28983023f8f.54.2024.05.20.06.18.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 May 2024 06:18:04 -0700 (PDT)
Message-ID: <13468147-6853-4bd8-bd3d-d1f1927133fa@baylibre.com>
Date: Mon, 20 May 2024 15:18:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/15] Mediatek thermal sensor driver support for
 MT8186 and MT8188
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Nicolas Pitre <nico@fluxnic.net>, Daniel Lezcano
 <daniel.lezcano@linaro.org>, linux-pm@vger.kernel.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org
Cc: Nicolas Pitre <npitre@baylibre.com>
References: <20240402032729.2736685-1-nico@fluxnic.net>
 <981a8748-16d0-4744-b097-aa9dd14c63a8@collabora.com>
Content-Language: en-US
From: Julien Panis <jpanis@baylibre.com>
In-Reply-To: <981a8748-16d0-4744-b097-aa9dd14c63a8@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240520_061807_559981_D55B1BF1 
X-CRM114-Status: GOOD (  13.69  )
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

On 4/23/24 11:22, AngeloGioacchino Del Regno wrote:
> Il 02/04/24 05:25, Nicolas Pitre ha scritto:
>> This is a bunch of patches to support the MT8186 and MT8188 thermal
>> sensor configurations. Several changes are needed to cope with oddities
>> these SOCs implement.
>>
>> All values (calibration data offsets, etc.) were lifted and adapted from
>> the vendor driver source code.
>>
>
> I picked patches 7 and 12 (and also fixed them) introducing the nodes for the
> LVTS controllers, but will not pick 9 and 15, as they're either missing thermal
> zones and/or using the wrong names; let's wait for the next cycle for those, as
> I will also be able to add the SVS on top (needs a bit of time for testing),
> getting both SoCs complete on the LVTS side, without rushing.
>
> Cheers,
> Angelo
>

What do you mean by "missing" thermal zones ? (is there some reference
code somewhere listing them, or whatever ? how can I know which ones are
missing ?)

It seems to me that Nico took into account your comment about 'tzone_name'
and fixed these names in v3 ('cpu-little0-thermal', ...). Are they still wrong ?

Julien

