Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78947C4167B
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Nov 2023 18:21:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g6Py8y1O0VaAYNtx9zZaLLFtioZaJRlxInJEtHb5OPU=; b=M11pSmMPv/stnYuyZZZdXJufTV
	j+LTS8M7ndxrMBVjB9IdrKFtDjh9uKzb/5ps9V0QY3/4Si2qX8tNQny0n6sn2x/BISeHbD0IcR7BZ
	DxjbM9fYujDG5sLa7RDxApkyEteTMy1r3N4UIoVPxJmwyXoaEtMWwfEU1A/8eH5p4sFVjnEz3tV3U
	D+9M/+2dJxefIU1fRSE0jiEEKGp19Hs/+EkP8t1Vte06kGXJuIHy+ZGqBfkiyvWQZcJ+VqCK07uey
	qo59gRtA+6hugah/TWfwqBZpXsspSOloafBlmb0zBadHeQ7A6V4+3gizV0CjqZOjHtKqZoJ8ADg1A
	HtjkouVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r2bZB-00EUc2-1S;
	Mon, 13 Nov 2023 18:21:45 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r2bZ7-00EUas-1K;
	Mon, 13 Nov 2023 18:21:42 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-33139ecdca7so2064456f8f.0;
        Mon, 13 Nov 2023 10:21:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699899699; x=1700504499; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=g6Py8y1O0VaAYNtx9zZaLLFtioZaJRlxInJEtHb5OPU=;
        b=hqB02WcCR0ajEXGjn1lvdmSsHWvEbPJ/TrWBKM4VYuS7FWiIAcDhqQgBv4+1ebUllH
         tLR7dTI1FtRABFPVfrHUExm6SN7FRI04sfb3i+iLqMSYuNsHPrM/MlcAYhqAFYIpdA4+
         uZOSxvxITdIWnL1cA7ATSWWykGXEm13aEXxAihnH+vZlGoD2riO3y/Yn5nZMFc08OlH0
         1XuuTswG5RYDjh2tZWRSSp4FGqN/O1eIzrtKEd6O+pkt5Ma8BuSGT1C5VhBY55zUSpXv
         2lZAmvx1SbVRWm9Sb/aI6wLBetnRyq0YDkVNflgaNMH4Sn+plZOP3n+BeGy7VMh+0fZt
         R/qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699899699; x=1700504499;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g6Py8y1O0VaAYNtx9zZaLLFtioZaJRlxInJEtHb5OPU=;
        b=QFdhktZrNWcRlQ5mkRR361HosdRx45M39ansIaYBKuX7O/GBb3LqM6BpX9UHz/aatE
         snCTEmBUdS2fHuDw7xWsz8xwDoN5q+rbAKkv9DuPRsBf83ZqlYn+dznSuL72emA6Ledl
         mfGDN61Enmoqb2Eu9y+YzQfkeWqiQZB9Fl2LtxknybSbVM9aA7lGtkYzOemziuONSbEG
         rX/9lIYB6csQ6cIzfTrZN4C5GYUuq976yXmdj17CoWX48RmbXvTPEGhyi0WYEGyQcj5n
         Nf+9JbxeadIC5xtdPnYVqCHGmOQiJRJDfeyCD0nhuJi14fPkyTRgcAPY1dVp/wNiqw5O
         r6EA==
X-Gm-Message-State: AOJu0Yz31Uf0LgkaG/LWN7ueS6Pwy+lgAVL1njSMvJjsgLqVp5kEixBR
	/ZkjkXsJInPG6dIBKHaGbsM=
X-Google-Smtp-Source: AGHT+IFySfNcTFpucqZk6RHNcEFdOXteKIxtHKgHG43rTpgaV2wy9GOPNp/Ua++AZ5vHdCtlkQU0rw==
X-Received: by 2002:a5d:47a8:0:b0:32f:8c32:35bd with SMTP id 8-20020a5d47a8000000b0032f8c3235bdmr6027704wrb.4.1699899699279;
        Mon, 13 Nov 2023 10:21:39 -0800 (PST)
Received: from ?IPV6:2a01:c22:6e16:fe00:c172:813e:6561:e5e7? (dynamic-2a01-0c22-6e16-fe00-c172-813e-6561-e5e7.c22.pool.telefonica.de. [2a01:c22:6e16:fe00:c172:813e:6561:e5e7])
        by smtp.googlemail.com with ESMTPSA id l10-20020adfa38a000000b0032dbf26e7aesm5989241wrb.65.2023.11.13.10.21.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Nov 2023 10:21:38 -0800 (PST)
Message-ID: <887657ba-86ca-49bc-b6c3-8543610c3230@gmail.com>
Date: Mon, 13 Nov 2023 19:21:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/20] remove I2C_CLASS_DDC support
To: Wolfram Sang <wsa@kernel.org>, intel-gfx@lists.freedesktop.org,
 linux-i2c@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 linux-fbdev@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Jocelyn Falempe <jfalempe@redhat.com>, linux-sunxi@lists.linux.dev,
 linux-mediatek@lists.infradead.org, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, Yongqin Liu
 <yongqin.liu@linaro.org>, John Stultz <jstultz@google.com>
References: <20231113112344.719-1-hkallweit1@gmail.com>
 <ZVJhwSS16+/Zzt0f@shikoro>
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <ZVJhwSS16+/Zzt0f@shikoro>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231113_102141_477432_B06656C4 
X-CRM114-Status: UNSURE (   9.45  )
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

On 13.11.2023 18:49, Wolfram Sang wrote:
> 
>> Preferably this series should be applied via the i2c tree.
> 
> Are we in a hurry here, i.e. does it block further development of the
> i801 smbus driver? My gut feeling says the patches should rather go via
> drm and fbdev trees, but I may be convinced otherwise.
> 
We're not in a hurry. It's just my experience with patch series' affecting
multiple subsystems that typically the decision was to apply the full
series via one tree. Also to avoid inquires from maintainers like:
Shall I take it or are you going to take it?
Of course there may be different opinions. Please advise.


