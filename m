Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD241CAC5B8
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Sep 2025 09:30:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PYhNZAuXNsQZXbAM0zt2/NAND3rDrfAPR4vuwvQwywc=; b=cQ5DyDigAm96HGCNf17KY97WMI
	4aDB7F0S+gur6/6poG1LBXYh0KDCZr/PR4fXeK7/0zz+Ybxf2wJJiCWXFcGIj0r4OtFaBX5kFPuv4
	qulvBSuLeUmpCkKH02+0pnCWukyevIZmmAhoIT27z7ddZ2nM1E7vbIuwjbu4+cAumVa9WAazOLH+O
	INDNErKv4JkQPS2i35mV9LUAdi6f/SLr5/5JW+zekr6k3ECXeBzthAx7315Eex+SFONEST1W5fzX0
	Q42HEXmHkmwLcTwqwRFlFDsXvwr/Ub+XG7fCi5VQNG18Cg7E4OZI5yLwpEQ4O2bO/770wnzHcGmnz
	1RMsO79w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3Wgq-00000004pBi-3xW2;
	Tue, 30 Sep 2025 09:30:33 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3Wgn-00000004pBJ-0OSw
	for linux-mediatek@lists.infradead.org;
	Tue, 30 Sep 2025 09:30:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1759224627;
	bh=/1lp1CrXLlYtkipf1kbmhOx4cqTFS3wPb2lnYsNlfso=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=CIqntvus7FBsh5V1Iu5dCliMhxyeio1V6FtfJ89zj0Wfcp2uJgZOQYYn5GnIdWrj0
	 q3wImbZhQlYx8o9VRb1ITZQeZprPkjQTfzgozacg9fXfUM0XUskzWr2ZI6UEdjEEzo
	 TtaAKPW/9BrRp0R7sHdmPSLRoMo90/a4oa8fALwkiBe+3qNfzPGTF2xOE8XKL2i/ui
	 +bS+qzdXyqdQQ5luVzkDNO4BFpehSBr1r4O0ObYHZSxLY4YxXtmVTa61pHuYw8vce+
	 hQzl3u/KNZfLjCotN2TS+GBcB6UNvi/eqO2nSb0ti4CBGL46sjQ1IVp7ADcr0lI13e
	 +tpFMYE/l+H0w==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E592F17E129E;
	Tue, 30 Sep 2025 11:30:26 +0200 (CEST)
Message-ID: <b69b2bf8-2226-4dd4-97b7-a6bf17cc4f94@collabora.com>
Date: Tue, 30 Sep 2025 11:30:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/8] Add support MT6316/6363/MT6373 PMICs regulators
 and MFD
To: Igor Belwon <igor.belwon@mentallysanemainliners.org>,
 linux-mediatek@lists.infradead.org
References: <20250715140224.206329-1-angelogioacchino.delregno@collabora.com>
 <DD5B2MK444DP.BA3ZBBY5Z6HZ@mentallysanemainliners.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <DD5B2MK444DP.BA3ZBBY5Z6HZ@mentallysanemainliners.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250930_023029_455941_0922C4F1 
X-CRM114-Status: GOOD (  20.38  )
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

Il 29/09/25 15:07, Igor Belwon ha scritto:
> On Tue Jul 15, 2025 at 4:02 PM CEST, AngeloGioacchino Del Regno wrote:
>> This series adds support for three new MediaTek PMICs: MT6316, MT6363
>> and MT6373 and their variants - used in board designs featuring the
>> MediaTek MT8196 Chromebook SoC, or the MT6991 Dimensity 9400 Smartphone
>> SoC.
>>
> 
> Hi Angelo,
> 
> Apologies for asking, but is there any future for this series? I
> understand you as a MediaTek maintainer have a lot of work on your head -
> however as part of my MT6878 upstreaming work, getting this series merged
> would really be beneficial.
> 
> I only have MT6363 (well, also 6685, 6319 and 6369, but expect a
> seperate patchset for these) on my platform, so I'm unable to pick up
> the work for other PMICs anyway.
> 
> Thanks and regards,
> Igor

No worries about asking - that's totally legit!

Happy to see that you're going serious with the upstreaming of the Dimensity 7300!
I admit I'd be proud to finally see some modern MediaTek smartphone upstream, as
there is practically none (well, apart from some old-old-old stuff that I added
and - ugh - only partially) and I don't think that those deserve to become e-waste
"just like that".

Those regulators are required for the MediaTek Kompanio Ultra (MT8196) SoC, and yes
I plan to respin this series as soon as possible.

I should also be trying to upstream the MT6685 RTC in the future (not clkbuf, most
probably, as that doesn't seem to be actually needed for anything meaningful).

As for MT6319 and MT6369, I currently have no plans for upstreaming those, at least
for now.

Besides, does the Dimensity 7300 also use SPMI 2.0?
In case you missed it: 
https://lore.kernel.org/all/c31bc281-94d5-40b6-a9bd-76b41769f6e5@collabora.com

Also - if this can help you in any way, we (as Collabora) are performing all of the
upstreaming work publicly: the commits that aren't "exactly ready yet" (but working
anyway) are of course available to everyone... and also some WIP things.

This includes, for example, the SCMI TinySYS Protocol (which probably D7300 also
uses) and DVFSRC v4 code, other than devicetrees that are close to upstream for the
MT8196 platform - of which, some new style nodes should apply to your SoC (not in
a 1:1 copy-paste fashion, but you get the point, I guess).

Check it out:
https://gitlab.collabora.com/mediatek/aiot/linux/-/commits/mediatek-dev

Beware that we have multiple branches, and some may be more updated than others.

...and we also have some documentation that could help:
https://gitlab.collabora.com/mediatek/aiot/wiki/-/blob/main/README.md


Cheers,
Angelo

