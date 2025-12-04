Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF7FFD206B8
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Dec 2025 14:45:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WsDtMRP6iyLXex45E7C5K6DghytfCjr+yYUzlpKqZ6s=; b=Nk5vz3oPNnLwG1HQyiglRWBfjt
	8jTcrxscgqm+mFj27SKYG8s7mDBwQTm1/MFKwlByzEwToIvpqZdADyz6khKP1c2o5l9lJmTdwz/G/
	/fXX1ZEcch/OBQBdDPDhrbuh8BlzRlupb1CJC7FAvfoiVnwXRTpeqarByx79jFr3J1AfX6ldhWTlo
	Bt5S14i7tm8OkAFhpykue2pI4E6VqGudhXmktvGwH4c4R5kvkQWmiCDR6b0kyGJnPJDxT1VrXuRyB
	aOyDtseKcxKS/dHN3d3Uk5kg8NE3cxrHRA1Tq6MgnKfNWiqlOll0KmzX/SCe90QAyvj6Z2tLp3laM
	emYH2GmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRAZr-000000088qH-0wXm;
	Thu, 04 Dec 2025 14:45:03 +0000
Received: from wp530.webpack.hosteurope.de ([80.237.130.52])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRAZo-000000088pC-0idi
	for linux-mediatek@lists.infradead.org;
	Thu, 04 Dec 2025 14:45:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=WsDtMRP6iyLXex45E7C5K6DghytfCjr+yYUzlpKqZ6s=; t=1764859500;
	x=1765291500; b=QLFgPOJA2CI/PDHjg2MwQMrX9upUT4ySHaDMTgUjTx3W8PFEF2z+4EQf33mE/
	E2O4W/pk0jqPbBzG33p9QFiO1iYFlHwaj9etSy/jR/a/Q/z9+n1G2icZKiamftl41zr/RG06mj6x5
	D6fag67zdPgdSGpM9VMH4KjlyEv3zJ22o+sg1lz8yX3EWBqeAPSn69iMEp+pKGISvQZb1QmoB6Kd1
	3t0l8ef/QNySc6LVqLAEQ1f0hdxl/Y+aD7NHU9ThuIABOKyK5/UVZjAgR5w+3AhfdenSoC9PV+UG/
	H9nozp8jIr4/sNZDMMDpTlwoImBwOdTquDQyaSD0+pNQIdenkg==;
Received: from [2a02:8108:8984:1d00:a0cf:1912:4be:477f]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128)
	id 1vRAZk-009Fkr-0b;
	Thu, 04 Dec 2025 15:44:56 +0100
Message-ID: <f0595a07-c722-4eec-88b3-a7a60142e449@leemhuis.info>
Date: Thu, 4 Dec 2025 15:44:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] mt8183-kukui: dts: changes in dts caused display to
 no longer initialize - Was: Re: mt8183-kukui: drm/mediatek: dts: Invalid
 display hw pipeline when probing mediatek-drm
To: "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Evans Jahja <evansjahja13@gmail.com>, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, regressions@lists.linux.dev
References: <CAAq5pW8q6V7x6qpYnE3xB99nVwE363keGiu+Jax0_zqPjogULw@mail.gmail.com>
 <CAAq5pW_saBZ+52zz2FYTt9SuWXj2KwX2Ld7AggVKAzca2m0Oow@mail.gmail.com>
 <CAAq5pW9o3itC0G16LnJO7KMAQ_XoqXUpB=cuJ_7e3-H11zKd5Q@mail.gmail.com>
 <CAAq5pW8-j6UzruT=SU05QgJ1AjLXeUwASLJ3O3SVKttaMbdTXQ@mail.gmail.com>
From: Thorsten Leemhuis <regressions@leemhuis.info>
Content-Language: de-DE, en-US
In-Reply-To: <CAAq5pW8-j6UzruT=SU05QgJ1AjLXeUwASLJ3O3SVKttaMbdTXQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1764859500;b53ac773;
X-HE-SMSGID: 1vRAZk-009Fkr-0b
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251204_064500_400784_B7E66849 
X-CRM114-Status: GOOD (  22.33  )
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

Lo!

Matthias, AngeloGioacchino, have you maybe looked into regression that
seems to be caused by 72d63fa0563f8 ("arm64: dts: mediatek: mt8183:
Migrate to display controller OF graph")?

Evans Jahja, just to be sure: I suppose it still happens with 6.18
final? And have you tried if reverting the change fixes this ("fix the
issue just by using the dts from the other version" might have changed
other things as well, that's why I'm asking)

Ciao, Thorsten

On 11/28/25 03:59, Evans Jahja wrote:
> Hi,
> 
> There has been a regression in the dts for my system
> mt8183-kukui-krane, where changes in dts/mediatek/mt8183.dtsi broke my
> machine.
> 
> The display works under v6.17.9 but is broken in v6.18-rc7. I was able
> to replicate / fix the issue just by using the dts from the other
> version.
> 
>> On Wed, Nov 26, 2025 at 3:01 AM Evans Jahja <evansjahja13@gmail.com> wrote:
>>>
>>> Hi,
>>>
>>> I have a Lenovo IdeaPad Duet Chromebook CT-X636F, detected as Mediatek
>>> krane sku176 board. (mt8183-kukui-krane)
>>>
>>> The display failed to initialize on the mainline kernel (linux
>>> 6.18-rc7). Using the same config, on stable (linux 6.17.9) the display
>>> works fine.
>>>
>>> config: https://bugzilla.kernel.org/show_bug.cgi?id=220803
>>>
>>> With the system on mainline kernel, I was able to check the serial
>>> console, the error on dmesg looks like this:
>>>
>>> [    6.513400] mediatek-drm mediatek-drm.18.auto: Building display
>>> pipeline for MMSYS 0
>>> [    6.514983] mediatek-drm mediatek-drm.18.auto: Display HW Pipeline
>>> built with 9 components.
>>> [    6.515009] mediatek-drm mediatek-drm.18.auto: Invalid display hw
>>> pipeline. Last component: 38 (ret=-2)
>>> [    6.524422] mediatek-drm mediatek-drm.18.auto: probe with driver
>>> mediatek-drm failed with error -22
>>>
>>> Temporarily modifying mtk_drm_drv.c by commenting calls to
>>> mtk_drm_of_ddp_path_build_one CRTC_EXT and CRTC_THIRD allows the
>>> display to function even on mainline. I was also able to add some
>>> logging and determine that building the HW pipeline for CRTC_MAIN
>>> works, but because building CRTC_EXT fails, the entire display would
>>> not initialize.
>>>
> 
> I think this is the issue:
> https://lkml.org/lkml/2025/9/12/1242
> 
> On Wed, Nov 26, 2025 at 2:06 PM Evans Jahja <evansjahja13@gmail.com> wrote:
>>
>> Hi Angelo, I was able to isolate the problem further to the dts. After
>> bisecting the arch/arm64/boot/dts/mediatek/ and building the dts, it
>> seems like this is the first commit that introduced the issue on my
>> device.
>>
>> commit e72d63fa0563f8a6e98c10fed3a9ce74dc0536e6 (HEAD)
>> Author: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> Date:   Thu Jul 24 10:39:08 2025 +0200
>>
>>     arm64: dts: mediatek: mt8183: Migrate to display controller OF graph
>>
>> I am linking my full bisect log here:
>>
>> https://bugzilla.kernel.org/attachment.cgi?id=308962&action=edit
> 
> where we're unconditionally adding mmsys_ep_ext.
> 
> The issue seems to be caused by the recent addition of CRTC_EXT on the
> base mt8183
> 
> Please kindly take a look. Apologies for any mistake, this is my first issue.
> 
> Evans Jahja
> 
> 


