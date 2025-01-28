Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B98A7C02188
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Jan 2025 00:04:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eemsbZ6okcf087qLiLh0gj3mgI7cIF5l0GwYOpi1ILo=; b=MmeYCLLrpGbNMsPKvXQ+PZOMno
	3hbrAlNG5ZfWASZwpTr84Q6O5TcD+0zr+H+5hXlLtqKCzsr2td3oXWFQzwRVSFDHxcdpZEweog4U+
	nqGTlW7cYXDqqpFafGppXQqjac0dUH88srzQfCuLx+DsRiiVs3huSlGvxP+ETgW/SpMiBFs4UEh+D
	R0VecYIElUJfPzBReuWsVQKLE9gcxKV+NMNuT+2JS4/CcBakAcmTEaXl4ZzANmbbuuKdrHU85T3mq
	IXHVjz+WJi/cIokh3XbWQIPIt942DKVnBdGzh7H9V4jS2IpEWD7CDTo9/2zIB4hJ8KW66D7J+KE74
	IUucITxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcZ62-00000003grh-1udO;
	Tue, 28 Jan 2025 00:04:50 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcZ5z-00000003grK-01oB
	for linux-mediatek@lists.infradead.org;
	Tue, 28 Jan 2025 00:04:48 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4362f61757fso53582705e9.2
        for <linux-mediatek@lists.infradead.org>; Mon, 27 Jan 2025 16:04:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738022685; x=1738627485; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eemsbZ6okcf087qLiLh0gj3mgI7cIF5l0GwYOpi1ILo=;
        b=fiM5jiZFS23K+SCPMXUYf5Fd7Lz10dMxPqU+RF9gP47NRWrp+CRobgTVjzldHpULkE
         p4Kr/uhCyIpQDtivu2AMMN7rbhmvnWj9OoT2DNUK9tyWziE+ZEY5PBms13R6nqfrAkxm
         l+tZmuN2ca6ZvSoCYOX+JR2AAW2P76rypf+UpFqaHVjp30CYdLD/20IVHcAbPmTL+SIn
         K/eHOU2eQ+DwCI64Ly0SQXUsNXufIz7iF/rPc8Tb/fUXfpibTyz0e6C66BENQyI+bEI1
         a6lWsWUahUs6e5xv6SVESAsNHI6/mkbDprPFvvyPXuNaA+ESxxh7ltjk2muKGqIoMR+K
         qWXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738022685; x=1738627485;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eemsbZ6okcf087qLiLh0gj3mgI7cIF5l0GwYOpi1ILo=;
        b=MCFCNi38cNsepAXa5IkjWeFHOzg968ffeLl/pZipO6vCRzI/MzsEWDTrHNRrOXXYKX
         fCEI3P5jzDYXbQsObynfS54bI49Y+7mgR3uGK5ENSyLMo9NEd4vh0kJTkEUxPsxYvMBZ
         +HkwTsTs/cv841RDG2g5cJ637LHNg0dXiq2KQRdIEaevdIGJmwfPysWyZrKF9IAis/Fb
         4Vd7B2QocFDNarGtDpobYQvYXMs+RGdtgbZTrR4S8/jFh6jrkKZLFbQWxwVwZcu0So51
         k/xUB9K+8g/XbGBhNDstXC57jKl7ZokghOxhtNdKXBKw5YTBBzCzH3G8sXPtna0fTDrk
         i0jg==
X-Forwarded-Encrypted: i=1; AJvYcCXHJC9OmAt1bK1Lnxcdzawkf/PSe9Su/5eVaqbCDygAKDrYIUHhCy7hyV9sgZD6ZZ9xIyjsB09TmhNVtg0WKg==@lists.infradead.org
X-Gm-Message-State: AOJu0YygujWQy0vFc0h2aWak0MBr5u0+0G0aPDkuzjXkWQ0kp5PGaenU
	93zH7dcz/D0nB3R7uEaycQlZCmgCDxHmw+KKCw6ef8xUZTMVhjbA
X-Gm-Gg: ASbGncvLtw+FEh+A0TPmertMYMhauj7Z0NfbeMOcYEgQI0TGTwXXjxYh0kfm41qACGr
	tPbtxupRrqM2k2G5xeFAwWz+0ljMPRZowMUtqtZdY7LrZW4dXBWmLroTtrxFYFveCiPAoLifEkT
	/70ggd5KP6qJ1+tqJ3vYA/Yg6VmOX4y6qBxHGBx7AEU0HV4kQJ2aKUdk8bI5lTGx6aULqsG1J7d
	h+hdqBIk7PZnD0MlWCjBBdw6GF7I1h6wJtlLOxXYFe+C8v4tQVAzdpR0UYoidkIcVTbebB2RWlr
	49hah6U3XlD/
X-Google-Smtp-Source: AGHT+IG3Clop1tgKlMpwwSYZCqVDTcwopkBm9/c1BM3OKVdp95GghBpZ6D2AUX9Zc6zxF8d2aoHbaA==
X-Received: by 2002:a05:600c:4e12:b0:42c:b9c8:2bb0 with SMTP id 5b1f17b1804b1-438913bdcd2mr351880695e9.4.1738022684533;
        Mon, 27 Jan 2025 16:04:44 -0800 (PST)
Received: from [192.168.0.50] ([79.119.240.80])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438bd48a2f1sm148410705e9.17.2025.01.27.16.04.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jan 2025 16:04:43 -0800 (PST)
Message-ID: <585f1075-a662-489b-bd5c-cf9f24291804@gmail.com>
Date: Tue, 28 Jan 2025 02:04:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Bluetooth: btmtk: Remove resetting mt7921 before
 downloading the fw
To: John Glotzer <jglotzer@gmail.com>, sergio.callegari@unibo.it
Cc: Aaron.Hou@mediatek.com, Chris.Lu@mediatek.com, Deren.Wu@mediatek.com,
 Hao.Qin@mediatek.com, Sean.Wang@mediatek.com, johan.hedberg@gmail.com,
 linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, luiz.dentz@gmail.com,
 marc.payne@mdpsys.co.uk, marcel@holtmann.org, regressions@lists.linux.dev,
 steve.lee@mediatek.com, tiwai@suse.de
References: <9ae25475-e8f4-4ee1-8022-7621fbe8ebc6@unibo.it>
 <20250118165840.73110-1-jglotzer@gmail.com>
Content-Language: en-US
From: Bitterblue Smith <rtl8821cerfe2@gmail.com>
In-Reply-To: <20250118165840.73110-1-jglotzer@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250127_160447_055277_C155D896 
X-CRM114-Status: GOOD (  31.51  )
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

On 18/01/2025 18:58, John Glotzer wrote:
> (Note: additional discussion has taken place under
> Re: [REGRESSION] bluetooth: mt7921: Crash on Resume From Suspend And Hibernate)
> 
> Hi,
> 
> I have dug further into this issue and I think I have a root cause analysis that
> makes sense (at least it does for me :) ).
> The TLDR is that the root cause is the following commit that was introduced with the 6.11 kernel.
> 
> https://github.com/torvalds/linux/commit/d53ab629cff57
> 
> Furthermore, the problem must be the call to usleep_range() in
> drivers/net/wireless/mediatek/mt76/mt792x_core.c as this is the only behavioral change.
> 
> Notice that this commit first shows up in v6.11-rc1 and is present for all subsequent releases,
> which matches perfectly the breakage pattern seen by the user community.
> 
> What, then, is the evidence for this?
> 
> First of all the entire community has been unanimous in the observation that the issue
> started with the 6.11 kernel. The universal experience has been that any kernel prior
> to that had no issues, and all kernels starting with 6.11 were affected. Also no attempts
> to mitigate the issue in code by attacking the problem via the firmware download code paths have
> been fruitful.
> 
> The next piece of solid data is outlined here:
> 
> https://github.com/alimert-t/suspend-freeze-fix-for-mt7921e
> 
> Here the lead paragraph states:
> "A suspend/resume issue occurs on systems with the MediaTek MT7921 Wi-Fi adapter when
> running on Kernel 6.11.-. After suspending, the system fails to resume / freezes and requires a hard
> reset."
> 
> The mitigation for this issue has consisted of one of two approches:
> 
> - rfkill bluetooth and wifi on sleep and reverse the process on wake
> - add the parameter mt7921e.disable_aspm=y to the kernel command line
> (anecdotally I have seen reports of people doing things like turning off bluetooth
>  and/or wifi before suspending or for that matter rmmod mt7921e before suspending).
> 
> I personally have used both of these methods with a sucess rate of 100%.
> 
> The way to unlock the puzzle is to examine the 6.11 code with an eye towards
> - what changed between v6.10 and v6.11?
> - what is the intersection between this changeset and the disable_aspm paramter?
> 
> To cut to the chase the answer to both these questions is just the contents of
> https://github.com/torvalds/linux/commit/d53ab629cff57. I confirmed this by
> diffing v6.10 and v6.11 and then going through the diff looking for disable_aspm.
> 
> The following lines were added to drivers/net/wireless/mediatek/mt76/mt7921/pci.c
> 
> 	if (!mt7921_disable_aspm && mt76_pci_aspm_supported(pdev))
> 		dev->aspm_supported = true;
> 
> The bitfield aspm_supported was added to the struct mt792x_dev in drivers/net/wireless/mediatek/mt76/mt792x.h
> 
> and if this bitfield is true then the call to usleep_range is made in  __mt792xe_mcu_drv_pmctrl()
> in drivers/net/wireless/mediatek/mt76/mt792x_core.c.
> 
> 		if (dev->aspm_supported)
> 			usleep_range(2000, 3000);
> 
> By setting mt7921e.disable_aspm=y on the kernel command line, this code pathway is avoided
> and no crash or lockup happens when the device is woken back up.
> 
> Disclaimers:
> 
> - I don't claim to know the root cause for why the call to usleep_range() leads to a crash or a
>   freeze.
> 
> - I don't know the details of the specific issue the code for commit d53ab629cff57 was designed
>   to fix, hence I don't know the consequences of removing the call to usleep_range(). However,
>   I do know that the user experience has been significantly impacted negatively by the introduction
>   of d53ab629cff57 into the 6.11 kernel.
> 
> Thanks for your attention,
> 
> John Glotzer
> 
> 

John and Sergio, have y'all tried kernel 6.12.8 or newer?
People say the suspend problem is fixed:

https://bugzilla.kernel.org/show_bug.cgi?id=219514#c11

