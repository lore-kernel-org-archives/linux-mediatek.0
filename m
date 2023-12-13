Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 952DEC4332F
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Dec 2023 14:45:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CBlRrUoOIRVJYNC6cQSzrC9BYSjs+oqsdU7/6hMHQp0=; b=078Oz3PZEfydJBk2iSllqDzaUy
	jSvsuorazv+8y7LgbqCz8vWyxotFq5sPXFoeDHLD8utEV4XL3Wg06pTkBHj4buPDJ4K2rwMhvPF6F
	HM2zJU1zpsCbxqSKz/UbfP8K784w9Fyn5Rk6ixDp8fgYargD5r/+Z3zLIKDmq7gwbdCotNgHd8A3x
	sIecGodyo/Trzn2SXn2fPFtTlSg3Yj0rkIyeGfCAGo4C/ZTS2vvzm3kU5iezsoyssZnQj6nl3mcWF
	apB4Z0Mk0srSs73KMLc56XV8AUib3+Imsbj9YuKg8282HJ5dIZ/fTYCPf3KFeW5x4qeWwjv4jHRbt
	ahhqStfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDQUS-00F5Io-0r;
	Wed, 13 Dec 2023 14:45:36 +0000
Received: from dispatch1-us1.ppe-hosted.com ([67.231.154.164])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDQUP-00F5Gz-0m
	for linux-mediatek@lists.infradead.org;
	Wed, 13 Dec 2023 14:45:34 +0000
X-Virus-Scanned: Proofpoint Essentials engine
Received: from mail3.candelatech.com (mail2.candelatech.com [208.74.158.173])
	by mx1-us1.ppe-hosted.com (PPE Hosted ESMTP Server) with ESMTP id 25BDF3C0063;
	Wed, 13 Dec 2023 14:45:27 +0000 (UTC)
Received: from [192.168.1.115] (unknown [98.97.113.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail3.candelatech.com (Postfix) with ESMTPSA id 5A6FA13C2B0;
	Wed, 13 Dec 2023 06:45:23 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail3.candelatech.com 5A6FA13C2B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=candelatech.com;
	s=default; t=1702478724;
	bh=CyzNsGLkg4WlGdYLD0CORyHCimqERrevF4Jayf7AZrI=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
	b=FtctL3XfK12CbRTl5KHhn9cT9j3FXr5yCvhS9Xeakwq9IcOq7UGhZok9Zp5wfhEBH
	 /iRLEzUwz012MLtiuCU3BMuCtLx75xTl22OG5aq3TxxGAvt3BOSitdlbPoGODFuQwW
	 YVntLFUGLNlf+XLJAtZ7c8uNqHUPgHSp8a9lhY3Y=
Subject: Re: [PATCH 1/2] wifi: mt76: mt7921: Disable powersaving by default
To: Lorenzo Bianconi <lorenzo@kernel.org>, Kalle Valo <kvalo@kernel.org>
Cc: Mario Limonciello <mario.limonciello@amd.com>,
 Felix Fietkau <nbd@nbd.name>, Ryder Lee <ryder.lee@mediatek.com>,
 Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Deren Wu <deren.wu@mediatek.com>, Ming Yen Hsieh
 <mingyen.hsieh@mediatek.com>,
 "open list:MEDIATEK MT76 WIRELESS LAN DRIVER"
 <linux-wireless@vger.kernel.org>,
 "open list:ARM/Mediatek SoC support" <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>, Sultan Alsawaf <sultan@kerneltoast.com>
References: <20231212090852.162787-1-mario.limonciello@amd.com>
 <874jgmnud8.fsf@kernel.org> <ZXmxD1foASMaCDIe@lore-desk>
From: Ben Greear <greearb@candelatech.com>
Organization: Candela Technologies
Message-ID: <d92c081e-47dd-5c57-a6f1-bd72b2748141@candelatech.com>
Date: Wed, 13 Dec 2023 06:45:22 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <ZXmxD1foASMaCDIe@lore-desk>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
X-MDID: 1702478729-Q2nO4rVjVD1u
X-MDID-O: us5;at1;1702478729;Q2nO4rVjVD1u;<greearb@candelatech.com>;0636e1de1030682809d49efeedd0cda8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231213_064533_371847_C64B5EE5 
X-CRM114-Status: GOOD (  17.70  )
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

On 12/13/23 5:26 AM, Lorenzo Bianconi wrote:
>> Mario Limonciello <mario.limonciello@amd.com> writes:
>>
>>> Several users have reported awful latency when powersaving is enabled
>>> with certain access point combinations.
>>
>> What APs are these exactly? In the past 802.11 Power Save Mode was
>> challenging due to badly behaving APs. But nowadays with so many mobile
>> devices in the market I would assume that APs work a lot better. It
>> would be best to investigate the issues in detail and try to fix them in
>> mt76, assuming the bugs are in mt76 driver or firmware.
>>
>>> It's also reported that the powersaving feature doesn't provide an
>>> ample enough savings to justify being enabled by default with these
>>> issues.
>>
>> Any numbers or how was this concluded?
>>
>>> Introduce a module parameter that would control the power saving
>>> behavior.  Set it to default as disabled. This mirrors what some other
>>> WLAN drivers like iwlwifi do.
>>
>> We have already several ways to control 802.11 power save mode:
>>
>> * NL80211_CMD_SET_POWER_SAVE (for example used by 'iw set power_save')
>>
>> * CONFIG_CFG80211_DEFAULT_PS (for kernel level default)
>>
>> * WIPHY_FLAG_PS_ON_BY_DEFAULT (for the driver to control the default setting)
>>
>> Adding module parameters as a fourth method sounds confusing so not
>> really a fan of this. And the bar is quite high for adding new module
>> parameters anyway.
> 
> agree, I think we do not need a new parameter for this, just use the current
> APIs.

Is there a convenient way for a user to make any of those options above stick through
reboots?

To me, the ability to set system defaults through reboots is a nice feature of
module options.

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com

