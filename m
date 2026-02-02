Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1F40E7315D
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Feb 2026 12:23:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B3wyZj1OEUAcRzzomRP9ekZ+iETH+yBhgOZbuNPiIPI=; b=Jlx20li8PFtLeyRZ4Ai1PfM238
	TBxRlZWkjzPdDrp9Ypd+IRBsCzC538YJUAkfPfkf1eLNQcxi/ijDWzUysr4xn+e9DEnp7NvCRYCN5
	u015coIfYoHOAzSO5I93GkXNjwWi8CMhHijTEIj13CnKP+ENi2JusChxXE1VvTwfklqVnyfPa31gk
	AYo6VPn/PGjOC4n8AKy3SsdA+pOmLBf2oCU6WUKUJH3aaYGtd4F4H90rzSkUeFPUxAvQw2qAQacer
	fURpQofjXI2fu8Q38iNZtIDl7X7YquyXfb0WbDrQpQhkkjuvsBD8oDSuluNuPUPRH2gLc9roLfAqZ
	qdVlUa1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmsxN-00000004xB6-2SKm;
	Mon, 02 Feb 2026 12:23:05 +0000
Received: from nbd.name ([46.4.11.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmsxL-00000004xAl-1s7n
	for linux-mediatek@lists.infradead.org;
	Mon, 02 Feb 2026 12:23:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=B3wyZj1OEUAcRzzomRP9ekZ+iETH+yBhgOZbuNPiIPI=; b=bkhonJRaaY3cxLofbvJ8LZxjlT
	U2b11gMH3gdVvEuWEX4AoPW2s0uiqE+Xn27uIqmgFevgBOVShnP+jZjLpI2Ma7l1GHDrrQJKcC1Uc
	JBlj4CF4ghM8YI3vRdlUgrGUXet1DPPwZDhcsoBV/pFHBEPiZcNVopY7SnHLAlFgWxpM=;
Received: from p54a43c03.dip0.t-ipconnect.de ([84.164.60.3] helo=nf.local)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96)
	(envelope-from <nbd@nbd.name>)
	id 1vmsxC-000Mcj-0J;
	Mon, 02 Feb 2026 13:22:54 +0100
Message-ID: <0df57be5-a8ed-4dc4-856a-a45fe4f4466d@nbd.name>
Date: Mon, 2 Feb 2026 13:22:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] wifi: mt76: mt7996: fix queue pause after scan due to
 wrong channel switch reason
To: Shayne Chen <shayne.chen@mediatek.com>
Cc: linux-wireless <linux-wireless@vger.kernel.org>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>,
 Evelyn Tsai <evelyn.tsai@mediatek.com>, Money Wang
 <money.wang@mediatek.com>,
 linux-mediatek <linux-mediatek@lists.infradead.org>,
 StanleyYP Wang <StanleyYP.Wang@mediatek.com>
References: <20260202075311.365673-1-shayne.chen@mediatek.com>
 <20260202075311.365673-5-shayne.chen@mediatek.com>
 <fe5bb9ed-7dab-4cd5-b2ab-e5252713095c@nbd.name>
 <41b9111e696c0b0a9a3ad4d8728cf9819aa64708.camel@mediatek.com>
Content-Language: en-US
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
In-Reply-To: <41b9111e696c0b0a9a3ad4d8728cf9819aa64708.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_042303_616381_B662576A 
X-CRM114-Status: GOOD (  16.68  )
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

On 02.02.26 12:52, Shayne Chen wrote:
> On Mon, 2026-02-02 at 10:01 +0100, Felix Fietkau wrote:
>> On 02.02.26 08:53, Shayne Chen wrote:
>> > From: StanleyYP Wang <StanleyYP.Wang@mediatek.com>
>> > 
>> > Previously, we use the IEEE80211_CONF_IDLE flag to avoid setting
>> > the
>> > parking channel with the CH_SWITCH_NORMAL reason, which could
>> > trigger TX
>> > emission before bootup CAC.
>> > 
>> > However, we found that this flag can be set after triggering
>> > scanning on a
>> > connected station interface, and the reason
>> > CH_SWITCH_SCAN_BYPASS_DPD will
>> > be used when switching back to the operating channel, which makes
>> > the
>> > firmware failed to resume paused AC queues.
>> > 
>> > Seems that we should avoid relying on this flag after switching to
>> > single
>> > multi-radio architecture. Instead, replace it with
>> > MT76_STATE_RUNNING.
>> 
>> I don't see how the conditions are comparable at all. I also don't
>> see 
>> how this function can be called with MT76_STATE_RUNNING unset.
>> 
> The condition is used to prevent mt7996_mcu_set_chan_info() (in
> mt7996_run()) from triggering TX emission.

Makes sense.

>> Maybe a better replacement would be to check for a chanctx on the
>> phy?
>> 
> Will do some tests on this and send v2.

Thanks.

- Felix

