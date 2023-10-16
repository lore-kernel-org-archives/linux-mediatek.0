Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 626ACCDB465
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Oct 2023 07:52:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E6sUQ9HeUtkm8U7QMJPcmPOqu8YSUP5yniOXjO00fOY=; b=GvhV/B8pPZzP09vO4E/T1PdTyo
	mzF8UWhThvJElovq8WU8VeXlDrmzyXqrzn4bz1z1nRuB78Ex+JuwhQOG6q/otPyyZj+ANIzs9CeZO
	qdQ4dlEnLvAdpQTsBfXbkJL1H6Pv2BjiHWO/UfXUs4dU9dBZG6TssHg0mrGUd4X3PpHdSQhsJiPck
	EaugR9bh5nVYl4R46Qh94U2G/N9ttxMCIxIPkkMGrgl32CtBYqehvDn6ADFOhetP/4PdfnUw709ar
	Lr2TJHQUIJH2uekTrqTsATldDKotuN/Dr3DBHfgDw362jDkTE240u+Ssw27JJtzin+V3fn2E4U5dU
	VKGsLpew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsIOs-008icN-19;
	Mon, 16 Oct 2023 07:52:30 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qsIOo-008iaA-2P;
	Mon, 16 Oct 2023 07:52:28 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-53ebf429b4fso1323487a12.1;
        Mon, 16 Oct 2023 00:52:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697442742; x=1698047542; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=E6sUQ9HeUtkm8U7QMJPcmPOqu8YSUP5yniOXjO00fOY=;
        b=UDiAISx49lgStsD2SXKfFilBapQ9w6BJWnAZOgremzmYHAEcIMLql4IMWc2UAZOi8e
         qKblnu28ijOXjPohGTyKdR15ioeLKxq59SQb5Qi3rgQda5HOOqNGsyJN6FbyZDiN9Hn4
         HkENbHph4EEtZUmC90jLFCDxs+8vzIO6jSrnZOCXG4cPDcEuCUM+YT2URsSlgBCMTvcq
         csXHY9ltPXVvT6Iv7IVcTIWqxMirinJLWlw9o6VtMXixuV+Cn+x6EgZ6j3tStWzv1FY+
         NcQe1tW5NROpPDdLH8KrThQBaxjAGcWHhSUFquFkHLj9XOCEMrafn1DGL25v4Rb+GOw7
         KRVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697442742; x=1698047542;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=E6sUQ9HeUtkm8U7QMJPcmPOqu8YSUP5yniOXjO00fOY=;
        b=uGZE8gZeXErtyFQiYGHj9hi0wWDFjEtEIyB7tKVnrg8Gz9sd+3eMJmhZEKFI1e2JE9
         OJjc3XGDSUHsOqPNLnzwANrh3OGgIDI7Wg+6yFE2BI7JjbHBdekGeQlsTkhg89eRLBM3
         64K7zZmDMk8wRrX5WeEbl/JhkbF+Ewl7bIcdrZMDIfA2qX5D9xbSgcySd8s49mnXh8Nn
         ubrmwFESbO1SWTIPy/GjcJPI1hMtI4Te5rd0ydtTG+dDR50opu7bnNtul9X7hjOZjpL9
         O2rS5bcnoBcz0MNfAnCwYjwE/9bFcIbVrqV0BT44W5WYbaPphR2e40XYWjcDRKosHcPx
         lMHA==
X-Gm-Message-State: AOJu0YzgVegG6vdkRuyoD05LnvUHCDXA6ZY2fWHRtzJRdGLlw4w7Ri6G
	D89wDU54dkCKNexYWQHVVm4=
X-Google-Smtp-Source: AGHT+IEm+bxaBQIEFyLS/d0ZUBEXUwJyKtxxlSX6R7XwmzI5F/uElm7oSRV2OszGt6IlAMoKoA0CTA==
X-Received: by 2002:a05:6402:11cf:b0:53d:a4e5:67d0 with SMTP id j15-20020a05640211cf00b0053da4e567d0mr14930124edw.13.1697442742171;
        Mon, 16 Oct 2023 00:52:22 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.161.188])
        by smtp.gmail.com with ESMTPSA id cb5-20020a0564020b6500b0053ddbfa71ddsm6886588edb.47.2023.10.16.00.52.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Oct 2023 00:52:20 -0700 (PDT)
Message-ID: <aca26ff7-801c-65ad-0cc2-fef8a4f74e27@gmail.com>
Date: Mon, 16 Oct 2023 09:52:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [GIT PULL] arm64: dts: mediatek: Updates for v6.7
To: Arnd Bergmann <arnd@arndb.de>, arm <arm@kernel.org>,
 SoC Team <soc@kernel.org>
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Alexandre Mergnat <amergnat@baylibre.com>, Chen-Yu Tsai <wens@csie.org>,
 Macpaul Lin <macpaul.lin@mediatek.com>,
 =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
References: <7a877ad9-481f-bad8-5cad-5d013c6cd70d@gmail.com>
 <ae62c7e0-3e72-403c-abb4-569573037980@app.fastmail.com>
Content-Language: en-US, ca-ES, es-ES
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <ae62c7e0-3e72-403c-abb4-569573037980@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231016_005226_793233_09B9BF74 
X-CRM114-Status: GOOD (  22.06  )
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

Hi Arnd,

On 13/10/2023 22:40, Arnd Bergmann wrote:
> On Mon, Oct 9, 2023, at 12:34, Matthias Brugger wrote:
>> Hi Arnd and Olof,
>>
>> Please find below a few patches for the 64 bit DTS files targeted for v6.7.
>>
>> The patches were picked up with the help from Angelo.
>> With these changes we have now support for the Genio 1200 EVK board for IoT
>> applications. Also the MT8365 from the same business line has much more support
>> of peripherals.
>> Also support for the new 4th revision of the Acer Chromebook 514 was added. The
>> difference with older board is the audio codec used.
>> On the Mobile phone side of things, support for the Helio X10, which is used by
>> the Sony Xperia M5 got support for the display.
> 
> Hi Matthias,
> 
> The contents all look good and I'm happy to merge them, but I noticed that
> the branch is based on -rc4, while my soc/dt branch is based on -rc3.
> 
> Pulling it in would slightly mess up the git history and the 'git request-pull'
> output because of the backmerge of the mainline contents. Do you
> have a hard dependency on something that went into rc4, or can you
> rebase the branch to -rc3 or earlier?
> 
> I usually recommend using -rc1 as a base unless there is an important
> dependency on something that was merged later.
> 

AFAIK ther is no dependency on -rc4. I'll send a new pull request based on the 
correct -rc3

Sorry for that.

Regards,
Matthias

