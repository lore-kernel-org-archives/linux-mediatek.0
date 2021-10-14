Return-Path: <SRS0=9yZI=PC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BA30C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Oct 2021 09:26:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D7F09610EA
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Oct 2021 09:26:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D7F09610EA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Pa9dHXCJPnBUZl10CxXulsr+X1+BiYhna8TFiZObpjk=; b=z0jitkpR+6quCD
	jBPGRYS6yuySGa3iVJyYhxf64v5Hv/znnvwsZRommm2tOmzwMWIWVOQP4m7NqQJ84mkGhJalAzPCt
	4bzBs47xEbsGwfXP8Ceac8LCCHbYy4ysJULQi386Es96i0pD/75DfApPL7u12GhBVJOnF7z+SqNub
	ZvrTk1DgMSrgmbCe5Ue3Lc1ho9LzIuOq6sjcnKu7P2BZiJsgCnXpGCSiyUdMng1ucHmdKliOMXNUs
	4aVOFgzeP3iDs7YeeLvT/brEWrGoNtj5DfO+Y3uNXHysvwL9xuy0tyAppGc+jPFG3vG434Y1ZI93A
	e0j+GE1RyAxhoo6U0WHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1max0O-002M8n-3I; Thu, 14 Oct 2021 09:26:28 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1max0L-002M8C-1j; Thu, 14 Oct 2021 09:26:26 +0000
Received: by mail-wr1-x433.google.com with SMTP id g25so17369997wrb.2;
 Thu, 14 Oct 2021 02:26:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=snfOBT2Y32E/2SaHG65K+s5HBFNed3uLDzrXbLPDkkU=;
 b=e3fd5m61Xys/SwuLvhUq+kKDvP4Yq3z6Mx+wgOTweU2UzJe7t9Dtu9td/2VWPGw11l
 6MIyGmNEC2/V5XNIjtfHmVKCcXdYVby04Qni8Pfe+DBad+BeklL5v2rIYKnKkzsX7K51
 7f1xuH4w4c9sl8ytNgr003JAq5+9NwkKk5IlTMEzVSwGZZTwSROmn3pAktMDENiGtEgR
 iqZ6+HnKoL9qDS+fwGBT+HQ7HXsYPBzCoFqdVYpnMDXmEIJY5dOcllJrwAxDN86FWEcq
 lJwD1gCzkQfkYRzvHv84P/PCH23/Z0Uoex1dtjdlpdTSqksaah5vh7K3KpkfV+d88c/j
 rbqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=snfOBT2Y32E/2SaHG65K+s5HBFNed3uLDzrXbLPDkkU=;
 b=wzQsntODbL+aFPm9EYhf01Jh64RmUdlFpqLQLfa/AhCI9q8rwxE/StLsFHgeTIYqtX
 lD4H2ytf91q/cOyT1HQn8kBLA281L95eCaZKFivo82l2QH9MZznagPwQoESPNQpkJDUu
 NwiXaGJ3EdoneZHNCiqj8bo86rSInXpdKa4hS5jdV0+2uwRPr+4BA08DqnM6V14NtvaZ
 MXKklljG7Ojcw/QvtQvTO3lVDxAPDsa30pnQt7gI007qrOfCE/C+88lQ+39oz2n9A6LU
 XPqN+txfPsnKXfKzJuFaW1UHWFwajlNDVAJ9PM5LmNjk/RWmm3zOkfPFt/SeTTRBn0Z7
 aeXg==
X-Gm-Message-State: AOAM5311fCQ6G3gHOscFm5LK44tui143auqd201BkWq9jDYklC/OIHL3
 qn7loqMDdXjWwPA4uUBQo0BMs6qgksxAcA==
X-Google-Smtp-Source: ABdhPJyqplZlUjr+rcowDy1Ll1m3D6XCjhzt/+I3QHynf7iACzDNtZWsAWL488SjsJLQrdi2VljUpQ==
X-Received: by 2002:adf:b355:: with SMTP id k21mr5330494wrd.380.1634203582679; 
 Thu, 14 Oct 2021 02:26:22 -0700 (PDT)
Received: from ?IPV6:2620:113:80c0:8000:c::779? (nat0.nue.suse.com.
 [2001:67c:2178:4000::1111])
 by smtp.gmail.com with ESMTPSA id f18sm1865739wrg.3.2021.10.14.02.26.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Oct 2021 02:26:22 -0700 (PDT)
Message-ID: <93377766-a1b9-ee29-f874-ebf0e2bf3a8a@gmail.com>
Date: Thu, 14 Oct 2021 11:26:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.2
Subject: Re: [GIT PULL] arm64: dts64: mediatek updates for v5.16
Content-Language: en-US
To: Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
Cc: SoC Team <soc@kernel.org>, arm-soc <arm@kernel.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 Chuanjia Liu <chuanjia.liu@mediatek.com>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Kansho Nishida <kansho@chromium.org>
References: <1a3d63a3-c020-3319-26f6-a2ec338cc42e@gmail.com>
 <CAK8P3a06SKo+Y+DiFpozrO0R+67ht1ad6U9dyTa-M9TtD73VcQ@mail.gmail.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <CAK8P3a06SKo+Y+DiFpozrO0R+67ht1ad6U9dyTa-M9TtD73VcQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211014_022625_132916_E0211677 
X-CRM114-Status: GOOD (  26.29  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 11/10/2021 22:34, Arnd Bergmann wrote:
> On Mon, Oct 11, 2021 at 11:58 AM Matthias Brugger
> <matthias.bgg@gmail.com> wrote:
>>
>> Hi Arnd and Olof,
>>
>> Here come the latest updates for arm64 DTS cahgnes.
>> Biggest change is, that we have now support for a reset controller inside the
>> mmsys. This goes inhand with changes to the driver, that you will find in the
>> soc pull request.
>>
>>
>>     arm64: dts: mt8183: Add the mmsys reset bit to reset the dsi0 (2021-10-08
>> 15:11:14 +0200)
>>
>> ----------------------------------------------------------------
>> - mt8173: add reset for dsi0 to mmsys
>> - move dt-bindings reset controller includes to correct folder
>> - split PCIe node to use new format for mt2712 and mt7622
>> - mt8183: add audio node to chromebook devices
>> - mt8192: add clock controller node
> 
> I skipped this one for now, need some clarification. The PCIe node
> looks like you are doing an incompatible change to the DT binding,
> but that is something that should be explained in the tag description
> or (ideally) avoided if at all possible.
> 

Mediatek PCI device tree binding described the root port in a wrong. The IP 
actaully implements several root complex with everyone having a single root port.

We need to fix the DT in an incompatible way to describe the HW as it is. This 
also fixes a problem that no IRQ bigger then 32 could be handled.

The only public available HW that is affected by this is the BananaPi R64. I'm 
not aware that there is a big user base using the upstream kernel. In this 
boards PCI is only used for extension cards, so I don't expect any boot problems.

> Did I misread that patch, or did you forget about it here?
> 
> On a related note, the tag description should better have full
> sentences like your introductory text above it, that makes for
> a better changelog text in the end. Enumerating all the changes
> is not helpful here because the list of commits is also part of
> the changeset description after I commit it.
> 

Got it, I'll write a full sentence description I use to do for the pull request 
emails in the tag.

Regards,
Matthias

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
