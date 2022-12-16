Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1B14C4332F
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Dec 2022 12:45:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IAQQ3pjeu16iAJS3DIOcQ+yHj7Z/fdaC+NVk/MDrr2k=; b=wX/ox+NXZM1zS8LBGcLRB4Wl0K
	Ph3kwwZDrn3Kd17yxi5qvFpGoQLNJPXWl8xTd3qh0ONr2gMtnezaBQrXgiIcxkNFmZnNnTBoKEjf+
	BryEAwb9bgmYrAnOBzmSc1sC+GNgRgFCur/WCIPxcutBLC3GxMQN4GDFQLVjur5Ormlo9vmJYnLeU
	IF8TjxZkKE4ZuT67pTCUfLD+Ye+3XdYfWHiueTfCr9sM5104qei79gByNq5/vK0Q0P8iT/isFiGjK
	q+DnoE/DtM60lz4OJAAboJcznnx5+gHZJ04HL6TqHaPGBbdga3wnTdgpSGalbu4UdVpjzNapN62Hp
	Z4NVlIwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p6A5O-00F1Xf-62; Fri, 16 Dec 2022 12:45:10 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p6A56-00F1OO-Td; Fri, 16 Dec 2022 12:44:54 +0000
Received: by mail-wm1-x331.google.com with SMTP id b24-20020a05600c4a9800b003d21efdd61dso1659771wmp.3;
        Fri, 16 Dec 2022 04:44:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IAQQ3pjeu16iAJS3DIOcQ+yHj7Z/fdaC+NVk/MDrr2k=;
        b=M426POcIu7wkJDhee8+64cJssKw+ZP0ux+/qnKNeoAMJPm1YAvG4DWYpu4w63ClMPH
         f+uLUSArWkMK0BGPca20UoobK4oXIQU+/9RuMtCGnx3WeUykBy/ht5hZxm1y7Wo49jw6
         8qPbexnSZgR5GKuv36bzuXSZYDvYEjDBzVQON7HuHSoJdy5+rtJiz0vySZZV5tMaSaFo
         mSsOMYRwqZ6ptfd0khlNG2rjG5YPDqL2AWiNuBwJRalOnOOTD/xtmEuKOHNaz0LftfTa
         oIKkzt/aDloQuagZxB6J7llRzOUxIj8UOguxlBtK5QFsXZukwji7ufjSP5ZQk6jb4IHS
         fCKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IAQQ3pjeu16iAJS3DIOcQ+yHj7Z/fdaC+NVk/MDrr2k=;
        b=5R4QmXPVpvuyz6ar6RE7m89egI2F5okuLkStF4rit3M4k3I0ymGrGVUL0wLBOY2uEd
         yXCcU3ukB5PsS1A3aE37BWputMuli4BUIM9ikw7r+0a8BoCeieAY6AJ+ivIy2hvUO/O+
         cCM8wd8OgfCaRvIfy1BN8tGmY7aY/ufmOZtvy6F6bKbHdsFcNij2A77uCfHs7q3d9klM
         3TeDaZN1MJXawLTVWKXFNYmjtv4YKJnbkyrnYcsa39j75p9UEVlTRe+aoIRS1Q0W4JAH
         N5jHDJTDHfGVgzgQR9Zl1wiKZdZF4kjyqCvzrUh4BetzBaTiJeFDEYs44GwPCMOVc4Jw
         v7bQ==
X-Gm-Message-State: AFqh2kqZxfTpTHRTvn1GVwVRZpBe/EvJrk8xD1ebx5xpqQLtQW7cn0RI
	VvuLs6GKjkeEB+m2rlRBBwHTecf/3HQ=
X-Google-Smtp-Source: AMrXdXuglu/S7SP1eM5iCTQQTRFAEsdGBqkOEGFFEGJ7tR9Vq9sJQFZOFJCRLHoBA1a8vzkt80221w==
X-Received: by 2002:a05:600c:1f0f:b0:3d3:49db:d84 with SMTP id bd15-20020a05600c1f0f00b003d349db0d84mr93144wmb.20.1671194688373;
        Fri, 16 Dec 2022 04:44:48 -0800 (PST)
Received: from [192.168.1.132] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id q1-20020a1c4301000000b003d04e4ed873sm9722265wma.22.2022.12.16.04.44.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Dec 2022 04:44:47 -0800 (PST)
Message-ID: <9440d5c0-ddd0-37be-75d4-14713044ac64@gmail.com>
Date: Fri, 16 Dec 2022 13:44:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v1] soc: mediatek: mtk-pm-domains: Allow mt8186 ADSP
 default power on
Content-Language: en-US
To: =?UTF-8?B?VGluZ0hhbiBTaGVuICjmsojlu7fnv7Ap?= <TingHan.Shen@mediatek.com>
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 =?UTF-8?B?QWxsZW4tS0ggQ2hlbmcgKOeoi+WGoOWLsyk=?=
 <Allen-KH.Cheng@mediatek.com>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
References: <20221012075434.30009-1-tinghan.shen@mediatek.com>
 <ce1c6a1a-9183-e56d-6757-947f5fc8133d@gmail.com>
 <d4856589cdbb8ba31d5139604abffa4a06c5c73b.camel@mediatek.com>
 <ece0356f5e184e87a6d5e1fc5ca7fa1a3d203c13.camel@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <ece0356f5e184e87a6d5e1fc5ca7fa1a3d203c13.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221216_044453_021786_B64DF8C5 
X-CRM114-Status: GOOD (  21.55  )
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



On 02/12/2022 12:13, TingHan Shen (沈廷翰) wrote:
> Hi Matthias,
> 
> On Wed, 2022-11-23 at 18:40 +0800, TingHan Shen wrote:
>> On Wed, 2022-11-23 at 11:20 +0100, Matthias Brugger wrote:
>> > 
>> > On 12/10/2022 09:54, Tinghan Shen wrote:
>> > > In the use case of configuring the access permissions of the ADSP core,
>> > > the mt8186 SoC ADSP power will be switched on in the bootloader because
>> > > the permission control registers are located in the ADSP subsys.
>> > > 
>> > > Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
>> > 
>> > Do we need a fixes tag here?
>> > My bet is:
>> > Fixes: 88590cbc1703 ("soc: mediatek: pm-domains: Add support for mt8186")
>> > 
>> > Or is this not yet a problem but needed to be able to implement access 
>> > permission configuration in the ADSP driver?
>> > 
>> > Regards,
>> > Matthias
>> 
>> This patch is needed to fix a warning when implementing the ADSP access permission configuration in preloader.
>> 
>> [    0.334154] mtk-power-controller 10006000.syscon:power-controller: /soc/syscon@10006000/power-controller/power-domain@18/power-domain@19/power-domain@20: A default off power domain has been
>> ON
>> [    0.334246] ------------[ cut here ]------------
>> [    0.334252] top_adsp_bus already disabled
>> [    0.334274] WARNING: CPU: 5 PID: 113 at drivers/clk/clk.c:969 clk_core_disable+0x90/0xb0
>> 
>> If not for this case, the pm-domain works fine.
>> 
>> 
>> Best regards,
>> TingHan
> 
> gentle ping for this.
> from above descriptions, should I add the fixes tag to this patch?
> 

No that's not needed in this case. Applied now.

Matthias

