Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2BCBEE20A8
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Feb 2026 14:56:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WaMSa8aNPT2Syrv1Z36gDQAmqymrmu0QQPmiXAsgue4=; b=dURzHOG36V4c+SA3cIdrfPuVb5
	qBowJ00LdOP+U5uX7gWCyBYeMGTj9C6BJyIBv1Eek+eUMhbsASOdiHhRBY/sQ1DqKJ7fqlbmBKu1/
	MNLIoca8DL6DvGREyW1T04cQABbxFj27tXcHoLPJUVOCyGCUvM+SPvIiyKVnT0XwSqq+XLWNAl64h
	aIyN1TSa4mTTeqmVOyzv9eu1F5r02HucYfvRRf3es1qhPz18di04FWxDHlAHze6JEd9e3PmnxgavG
	ZaetzQTC7tan3iRQallH4m9dDIJWjAfAL+Vm/z6LQhBEbNQbKIaci1zic1FxE2euH02WhQOf+8U8t
	Sps4HIyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voNFn-0000000BSiP-2OKQ;
	Fri, 06 Feb 2026 14:56:15 +0000
Received: from relay.yourmailgateway.de ([46.38.247.119])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voNFj-0000000BShK-0oec
	for linux-mediatek@lists.infradead.org;
	Fri, 06 Feb 2026 14:56:13 +0000
Received: from mors-relay-8404.netcup.net (localhost [127.0.0.1])
	by mors-relay-8404.netcup.net (Postfix) with ESMTPS id 4f6xwR5pSgz8BnF;
	Fri,  6 Feb 2026 15:55:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1770389735;
	bh=CKKrzvJzRBC0RVs1xQVpfARoLf7sngWbE8xevZ6p6uY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=cIqY4obMCio58JAfFJTP7A1Eetq3aQHdJ1NEo7YXrb2KN4AFPuYlqf6Ygqak8nsDD
	 HrcJYqdqlpiDv2gDvn0LkewDh3XJ7GWGuzutL0xKH7CaRMCOctNueSTsLA0DeWmCbM
	 eyVm6uv621G6SrsEuPAORrf1FDB3Cj56arbnnH2buYzMTkW6mBy/Ku6+Yt7QMCRxel
	 zN2g/oEdUf6iW0DS/LPzkvz+JJ47HOt4FuRQaPOlr+LF3Oo8Vm39GTRUIPB1ojtYjh
	 o0QC5XaO8B6qY8AsP7+XfV8W+fXfwj9odSVz+FZgGhOmopcQr9PgBPtNLryKNzI5Dy
	 mWXvM1v4kCOiA==
Received: from policy01-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-8404.netcup.net (Postfix) with ESMTPS id 4f6xwR55WYz4x83;
	Fri,  6 Feb 2026 15:55:35 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at policy01-mors.netcup.net
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy01-mors.netcup.net (Postfix) with ESMTPS id 4f6xwQ1Qj0z8sbc;
	Fri,  6 Feb 2026 15:55:34 +0100 (CET)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 54E1A6759F;
	Fri,  6 Feb 2026 15:55:33 +0100 (CET)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <df6fcd73-fe0a-42fc-97ce-7e458c340553@leemhuis.info>
Date: Fri, 6 Feb 2026 15:55:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] mt8183-kukui: dts: changes in dts caused display to
 no longer initialize - Was: Re: mt8183-kukui: drm/mediatek: dts: Invalid
 display hw pipeline when probing mediatek-drm
To: Denis Gessert <denisgessert@gmail.com>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>
Cc: Evans Jahja <evansjahja13@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 regressions@lists.linux.dev, =?UTF-8?Q?Otto_Pfl=C3=BCger?=
 <otto.pflueger@abscue.de>
References: <CAFLVeg9hwH3PbKu5rPWZWqq6yz5mRRoB9oqxDkxNRdEDLGbVBw@mail.gmail.com>
 <CAFLVeg_soeYV4tOYKMo6TMYOtuWWU4TFCjUTxUrVEyGcRwMz7A@mail.gmail.com>
From: Thorsten Leemhuis <regressions@leemhuis.info>
Content-Language: de-DE, en-US
In-Reply-To: <CAFLVeg_soeYV4tOYKMo6TMYOtuWWU4TFCjUTxUrVEyGcRwMz7A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-PPP-Message-ID: <177038973370.2546695.17362443736661889721@mxe9fb.netcup.net>
X-Rspamd-Server: rspamd-worker-8404
X-Rspamd-Queue-Id: 54E1A6759F
X-NC-CID: YiiuFaE1FQhWjD/GcfomQ+rJ6LWwGExfn0Xfp7+mw1Ii/t9weHQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260206_065611_976432_699F9CB4 
X-CRM114-Status: GOOD (  12.78  )
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

On 2/6/26 12:33, Denis Gessert wrote:
> 
> I found this email chain while troubleshooting why my Levovo Duet
> (with the MT8183 chip) would not boot using any 6.18.* kernel.
> 
> I can confirm that on my device the current stable 6.18.8 does not
> boot unless I revert the commit
> 
> commit e72d63fa0563f8a6e98c10fed3a9ce74dc0536e6 (HEAD)
> Author: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Date:   Thu Jul 24 10:39:08 2025 +0200
> 
>     arm64: dts: mediatek: mt8183: Migrate to display controller OF graph
> 
> mentioned below. With the reverted commit the device boots as intended.

There is a fix for it from Otto here that I guess should help
https://lore.kernel.org/lkml/20260106-mt8183-display-graph-v2-1-e7e56054eef5@abscue.de/

Side note: lacks a stable tag and maybe should have been merged this
cycle instead of the next. But given that 6.19 is immanent it might be
good if this could be backported to 6.19.y once it landed in mainline.

> PS: Apologies for the potential double-mail. 
No worries, happens.

Ciao, Thortsten

