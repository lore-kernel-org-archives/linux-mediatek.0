Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76794C61DA4
	for <linux-mediatek@archiver.kernel.org>; Sat, 18 Feb 2023 10:49:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bjWvJA7jye8dKxGeIaACDeBj5ieOquYarDMgtwo/Pgc=; b=ysCinJRYrvuvN6VdDIVRXhiG3j
	Vvrz6HkatWg5i4q6lr5uT7kWHt49LcYJ3OlqOu29iQeOFAeS9Zcu9fAC4x0k7NNMYgTUTrRjSY8NA
	+jLbo8I2DZ8on9IjCupiPCizaCkxsyWasryh1dDnR3K4FZu98UTs4LxPLEpnlhDBNPjBe1fXl3QSC
	GYbRmh46EjW4GXzAsqvfEo+Sw8M0iO91uaSdgc5s44aykYJli/EFZlQOMMsMVeM+Tow/bAGMgedW8
	YDtgIm/DrRImvyEEOQL/A5W+K3oX3Zjg8Eoh96+bUt7+QkcyGBEX8/dwOaSN49LM2IXCQd7MaODsf
	foMmTXRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pTKml-00Go0o-9M; Sat, 18 Feb 2023 10:49:43 +0000
Received: from sender4-op-o14.zoho.com ([136.143.188.14])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pTKmZ-00Gnzn-1f; Sat, 18 Feb 2023 10:49:32 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1676717364; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=DsffZtaWvZuCbaZE5EHJ1vFswNstU37dTPw6i3RIq9xufQXDTJw1TPliygnNW+4X0diwWvdgonV2JvzNiMzMKz8JL+MxiOwnDADAsQwZT51g4MaqTKMaZPJg8QqOrYkpQ8+hzwgOPNXrIPikh7zogmluD0efw3ZIjpY0mSGnpWw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1676717364; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=bjWvJA7jye8dKxGeIaACDeBj5ieOquYarDMgtwo/Pgc=; 
	b=MIWFN+x7mBIZh5b+dAG0WC4DSuDmuFYhUnH1nLQijjm8jnO4g0Qp+HKhwg0QmH1cTBzlCngJfHFJ1UgC3o8NEfQ9vnHIrfTagsTRi8P3P/HYRkqKr8wNoCnHi4lXFGd/R8LzRC6yBbD/ZlDrVFGyZFQFGO79yNkLP/AdmlE+aA8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=arinc9.com;
	spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
	dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1676717364;
	s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=bjWvJA7jye8dKxGeIaACDeBj5ieOquYarDMgtwo/Pgc=;
	b=AN2iUkq6iC19pz4UBX2M5jGu37WIRJY+mJXpBYTD7hHatDjFHUUU12YJSO1q34UF
	HOhZZemPJRVTcTNEBuydB7oe/g0YLcg+RxZ67YZQOIDip9j5M9XSoYbeQpFm9LTCm+V
	kHm4FIz17yqNjM1w9WkCTjfnfsOYnNomWj71xOEA=
Received: from [10.10.10.3] (37.120.152.236 [37.120.152.236]) by mx.zohomail.com
	with SMTPS id 1676717363028260.89467269078705; Sat, 18 Feb 2023 02:49:23 -0800 (PST)
Message-ID: <27a26da8-8297-5327-7493-54d8359b6970@arinc9.com>
Date: Sat, 18 Feb 2023 13:49:13 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: Aw: Re: [PATCH v3 0/5] arm: dts: mt7623: relocate gmacs, mt7530
 switch, and add port@5
To: Frank Wunderlich <frank-w@public-files.de>
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 erkin.bozoglu@xeront.com
References: <20230210182505.24597-1-arinc.unal@arinc9.com>
 <c3ab9a9b-3eb2-8fb0-d5d7-c0b7c684d3a7@arinc9.com>
 <trinity-dab715b9-3953-40da-bc25-c4c2a5e9b7c3-1676715866453@3c-app-gmx-bap53>
Content-Language: en-US
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <trinity-dab715b9-3953-40da-bc25-c4c2a5e9b7c3-1676715866453@3c-app-gmx-bap53>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230218_024931_187606_EA352B5A 
X-CRM114-Status: GOOD (  17.10  )
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

On 18.02.2023 13:24, Frank Wunderlich wrote:
> Hi,
> 
> finally get some time to bootup with this series on my r2.
> 
> I see that inserting the port@5 as cpu-port maps this as default-cpu because dsa-core uses first found cpu-port as
> default (dsa_tree_setup_cpu_ports in dsa.c) and because of lower bandwidth (rgmii instead of trgmii) not the best choice.
> 
> But it look worse...network is currently broken (set both gmacs up).
> I see arp-packets reaching remote side, but reponse is not received by r2
> 
> I have tested it on 6.2-rc8 (wan-port), maybe additional patches are needed?...userspace setup should be right.
> 
> so i added series on top of net-next (no additional patches except some basic like build-script,defconfig and such)...same result...
> 
> i'm not sure if i change the mapping from userspace back to eth0, so disabled port@5 in switch, now port6 is
> cpu-port again and it works...so something is wrong with port5 of switch or gmac1.

That's a driver issue and will be fixed once an accepted version of 
these patches [0] [1] [2] are applied to net-next. You should have them 
on your inbox, I specifically told Richard to CC you.

This is devicetree bindings. We're here to describe the hardware. The 
way a driver works should not affect describing the hardware.

To address the lower bandwidth situation you mentioned, a devicetree 
property to designate a CPU port as the default CPU port could be 
introduced. I'm not aware of a similar conversation so I'll send a mail 
to netdev to discuss this. Will CC you.

[0] 
https://lore.kernel.org/netdev/20230212213949.672443-1-richard@routerhints.com/
[1] 
https://lore.kernel.org/netdev/20230212214027.672501-1-richard@routerhints.com/
[2] 
https://lore.kernel.org/netdev/20230212215152.673221-1-richard@routerhints.com/

Arınç

