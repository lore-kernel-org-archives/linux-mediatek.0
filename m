Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 806DCC4332F
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Dec 2023 13:36:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Op4XljZ8hghfNhinko5HSKgkc5M7Fgt9szsx3fy4JfQ=; b=J8Pf/8namaphKMmppnsRYqAcMM
	Zxd8KJO/4sfxzdg72c4WY0u5lKtu2pdFCuIhxqwaBN2tkI0k6Y9GV0i9ILEiWd/rL/hfY3GdKBCjG
	UkM15hc+caVuRm/ESaPjPSH7s+Z/Fst3l2RGHoCpS5cwn7bAFRuHbR9DYrQWNhfGNnw/EB4KTto3o
	MmdrkvmSqL9VRdjqkVxgJJgQ/LiSxJCns+Ts82pTG3WyHVGS+R1c6NZjVssf3aE4Dxi2MX1Lw/NSF
	8Ek805prYf/d16taTKoRr/wvsjWjbMcYn5KKlkIHMgkcwO3cMk3imG7ecn5l+joJWyJVNwPvw81yQ
	AbEKPSDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDPPf-00EqJc-1R;
	Wed, 13 Dec 2023 13:36:35 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDPPe-00EqIk-0f
	for linux-mediatek@bombadil.infradead.org;
	Wed, 13 Dec 2023 13:36:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=Op4XljZ8hghfNhinko5HSKgkc5M7Fgt9szsx3fy4JfQ=; b=Um6hw1b6T+88MrgSUP+gj7HDVn
	0zE7IVbwlXWcs4uAxKnPMzVWM4oWBtSDe+g+coAuphoxMgFxhvF7ipw4Agi3dhdJp+kgPquIJfvVj
	tpBzyf5FP/uA1sKB5JeDs581uNb5hS7xWz5NSOULC44pWDkbu1lkw6dbGEqIwTYS74DDLg+LvOqwG
	w3nhV2ls3ZyqCa8UopkAPCGUg3Su4GlDBDnInBhnfLmpR5EHgHd80rmkyyN2xqOQmCFZJmXNC//ef
	F/R8eRBvN2kMTeD/E8hSAiqiyZQKi5iye7IlvI6MrA4EMn+o0moUnCz6RFtwEQX4M9Au/ZJGbf8EG
	Tw7DPLLA==;
Received: from nbd.name ([46.4.11.11])
	by casper.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1rDPPZ-001sNh-BA
	for linux-mediatek@lists.infradead.org; Wed, 13 Dec 2023 13:36:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Op4XljZ8hghfNhinko5HSKgkc5M7Fgt9szsx3fy4JfQ=; b=f7VaguoKG0+U4Uzs9DWCof0JfK
	sJD4XnuCDxjzPL1MFocGtjgaUsF4nMWFt0cWSEPhvmoUB3bLU+vYP8vLIr9bSiGLmo+w7uMA39Ple
	r83nNb3T+fGqMDaSlJDQo1kunoDDfZt6MCc78lE/CIu2tL2ESpPWKewK6+/XvM4+1+SI=;
Received: from p4ff13178.dip0.t-ipconnect.de ([79.241.49.120] helo=nf.local)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.94.2)
	(envelope-from <nbd@nbd.name>)
	id 1rDPOj-00CEED-Gh; Wed, 13 Dec 2023 14:35:37 +0100
Message-ID: <9da16cfc-d0e4-4e9f-91b0-42b0bf4141cc@nbd.name>
Date: Wed, 13 Dec 2023 14:35:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] wifi: mt76: mt7921: Disable powersaving by default
Content-Language: en-US
To: Mario Limonciello <mario.limonciello@amd.com>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>
Cc: Shayne Chen <shayne.chen@mediatek.com>, Sean Wang
 <sean.wang@mediatek.com>, Kalle Valo <kvalo@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Deren Wu <deren.wu@mediatek.com>, Ming Yen Hsieh
 <mingyen.hsieh@mediatek.com>, Ben Greear <greearb@candelatech.com>,
 "open list:MEDIATEK MT76 WIRELESS LAN DRIVER"
 <linux-wireless@vger.kernel.org>,
 "open list:ARM/Mediatek SoC support" <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>, Sultan Alsawaf <sultan@kerneltoast.com>
References: <20231212090852.162787-1-mario.limonciello@amd.com>
From: Felix Fietkau <nbd@nbd.name>
Autocrypt: addr=nbd@nbd.name; keydata=
 xsDiBEah5CcRBADIY7pu4LIv3jBlyQ/2u87iIZGe6f0f8pyB4UjzfJNXhJb8JylYYRzIOSxh
 ExKsdLCnJqsG1PY1mqTtoG8sONpwsHr2oJ4itjcGHfn5NJSUGTbtbbxLro13tHkGFCoCr4Z5
 Pv+XRgiANSpYlIigiMbOkide6wbggQK32tC20QxUIwCg4k6dtV/4kwEeiOUfErq00TVqIiEE
 AKcUi4taOuh/PQWx/Ujjl/P1LfJXqLKRPa8PwD4j2yjoc9l+7LptSxJThL9KSu6gtXQjcoR2
 vCK0OeYJhgO4kYMI78h1TSaxmtImEAnjFPYJYVsxrhay92jisYc7z5R/76AaELfF6RCjjGeP
 wdalulG+erWju710Bif7E1yjYVWeA/9Wd1lsOmx6uwwYgNqoFtcAunDaMKi9xVQW18FsUusM
 TdRvTZLBpoUAy+MajAL+R73TwLq3LnKpIcCwftyQXK5pEDKq57OhxJVv1Q8XkA9Dn1SBOjNB
 l25vJDFAT9ntp9THeDD2fv15yk4EKpWhu4H00/YX8KkhFsrtUs69+vZQwc0cRmVsaXggRmll
 dGthdSA8bmJkQG5iZC5uYW1lPsJgBBMRAgAgBQJGoeQnAhsjBgsJCAcDAgQVAggDBBYCAwEC
 HgECF4AACgkQ130UHQKnbvXsvgCgjsAIIOsY7xZ8VcSm7NABpi91yTMAniMMmH7FRenEAYMa
 VrwYTIThkTlQzsFNBEah5FQQCACMIep/hTzgPZ9HbCTKm9xN4bZX0JjrqjFem1Nxf3MBM5vN
 CYGBn8F4sGIzPmLhl4xFeq3k5irVg/YvxSDbQN6NJv8o+tP6zsMeWX2JjtV0P4aDIN1pK2/w
 VxcicArw0VYdv2ZCarccFBgH2a6GjswqlCqVM3gNIMI8ikzenKcso8YErGGiKYeMEZLwHaxE
 Y7mTPuOTrWL8uWWRL5mVjhZEVvDez6em/OYvzBwbkhImrryF29e3Po2cfY2n7EKjjr3/141K
 DHBBdgXlPNfDwROnA5ugjjEBjwkwBQqPpDA7AYPvpHh5vLbZnVGu5CwG7NAsrb2isRmjYoqk
 wu++3117AAMFB/9S0Sj7qFFQcD4laADVsabTpNNpaV4wAgVTRHKV/kC9luItzwDnUcsZUPdQ
 f3MueRJ3jIHU0UmRBG3uQftqbZJj3ikhnfvyLmkCNe+/hXhPu9sGvXyi2D4vszICvc1KL4RD
 aLSrOsROx22eZ26KqcW4ny7+va2FnvjsZgI8h4sDmaLzKczVRIiLITiMpLFEU/VoSv0m1F4B
 FtRgoiyjFzigWG0MsTdAN6FJzGh4mWWGIlE7o5JraNhnTd+yTUIPtw3ym6l8P+gbvfoZida0
 TspgwBWLnXQvP5EDvlZnNaKa/3oBes6z0QdaSOwZCRA3QSLHBwtgUsrT6RxRSweLrcabwkkE
 GBECAAkFAkah5FQCGwwACgkQ130UHQKnbvW2GgCeMncXpbbWNT2AtoAYICrKyX5R3iMAoMhw
 cL98efvrjdstUfTCP2pfetyN
In-Reply-To: <20231212090852.162787-1-mario.limonciello@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231213_133630_617867_82103B88 
X-CRM114-Status: UNSURE (   7.71  )
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

On 12.12.23 10:08, Mario Limonciello wrote:
> Several users have reported awful latency when powersaving is enabled
> with certain access point combinations. It's also reported that the
> powersaving feature doesn't provide an ample enough savings to justify
> being enabled by default with these issues.
> 
> Introduce a module parameter that would control the power saving
> behavior.  Set it to default as disabled. This mirrors what some other
> WLAN drivers like iwlwifi do.
> 
> Suggested-by: Sultan Alsawaf <sultan@kerneltoast.com>
> Link: https://codeberg.org/Hybrid-Project-Developers/linux-tkg/blame/branch/master/mt76:-mt7921:-Disable-powersave-features-by-default.mypatch
> Link: https://aur.archlinux.org/cgit/aur.git/tree/0027-mt76_-mt7921_-Disable-powersave-features-by-default.patch?h=linux-g14
> Link: https://community.frame.work/t/responded-strange-wlan-problems-with-kernel-branch-6-2/41868/4
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>

This patch is disabling two different things at the same time:
- Wifi powersaving
- Device hardware powersaving

Have you tried simply disabling 802.11 powersave via nl80211 to mitigate 
the issues with affected APs?

- Felix

