Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2CACC4332F
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Dec 2022 14:38:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yP0BJycuMz69XX36ckvDbYRjSenHxDRGxNn7G1F0iiU=; b=eool5JYbuEryfnrbxhUxp1NsHE
	hT78C1/hsIv3w8kI8IIDzgm/+eg/BleW4nFGTikxbkke5+tFSnKaTCkU61ayhfs2S2H4VnXSZXV3b
	m2qu9FiBfSSc74vjtqv/rv7FgIcPQG9bl+EnUHKwbF/ia/Do5lchuv4A+uzjxADtY25ORYXo7K1Zu
	Y6t8UL8Hmu+7Zy05oS1gDA5DMhYFYOBwQlkiqGR30Vpuo4jwP1Q3A7l+rIF+sekfHqwHigjHYpG/K
	8nnJGwvW62E+5XJTTCTW5Clw/pvrFtAylbbI8pe4Iw9vYYhsyRy+9J5lhFn3zYXBG/5DV9qD1Ytg/
	yeSDgupQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7dl6-00GpVT-JX; Tue, 20 Dec 2022 14:38:20 +0000
Received: from mail1.systemli.org ([93.190.126.36])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7dkE-00GoXR-PR; Tue, 20 Dec 2022 14:37:30 +0000
Message-ID: <3599ec46-20d2-a233-a7c0-d2e363ebdf93@systemli.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=systemli.org;
	s=default; t=1671547032;
	bh=yP0BJycuMz69XX36ckvDbYRjSenHxDRGxNn7G1F0iiU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=O7+QOtBFOqXxrZErlWzwB4rO0Hnd3Im8G5/JdmIvB1WYH2T9hZtm38tVuj0IvZGSO
	 4HeMPY9OIlYKc5FXHedygciJgJlLX0rd5a86uivEWi4zexWNglhKrEAkN3CFRarJp1
	 yShcf91jPYOXHkAYQG1+jxwxM5ibWFW6e4jprP5Slu3ZKPJ27zj0zv2knxENIGYUr8
	 WLqQy3prK8JDz5uwlaj5S6XKCmi+WbKzqh69Vkzp5bNsbjS+OhQyk9E9T1ZpmOUEI/
	 ETVRPM4I2E2fwEFSJ0MjUsSQ4rK6SOtX+02+70dLtxf2v8dzslfKewb8BINwcM9zIw
	 5YH2kdhIw8eKw==
Date: Tue, 20 Dec 2022 15:37:10 +0100
MIME-Version: 1.0
Subject: Re: Kernel Kernel bug caused by (cpufreq: mediatek: Refine
 mtk_cpufreq_voltage_tracking()) on Banana Pi R64 (MT7622)
To: =?UTF-8?B?QWxsZW4tS0ggQ2hlbmcgKOeoi+WGoOWLsyk=?=
 <Allen-KH.Cheng@mediatek.com>,
 "viresh.kumar@linaro.org" <viresh.kumar@linaro.org>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>
Cc: "linux-mediatek@lists.infradead.org"
 <linux-mediatek@lists.infradead.org>,
 "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>,
 "regressions@leemhuis.info" <regressions@leemhuis.info>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "daniel@makrotopia.org" <daniel@makrotopia.org>,
 =?UTF-8?B?UmV4LUJDIENoZW4gKOmZs+afj+i+sCk=?= <Rex-BC.Chen@mediatek.com>,
 "thomas.huehn@hs-nordhausen.de" <thomas.huehn@hs-nordhausen.de>,
 =?UTF-8?B?SmlhLXdlaSBDaGFuZyAo5by15L2z5YGJKQ==?= <Jia-wei.Chang@mediatek.com>
References: <02c2c955-940b-b315-0474-85d0eddad7a3@leemhuis.info>
 <Y4jHvomTrU8guBox@makrotopia.org>
 <47a4665e-333d-a6e7-a2da-96cb06c2d87b@leemhuis.info>
 <20221202052716.uj3kzkunazmgazeq@vireshk-i7>
 <0ebef1a2-6b5a-04b9-a79b-79eb3349c32b@collabora.com>
 <c76bd301-0e8d-2d2b-0d3e-a57ece9b496f@collabora.com>
 <b1822bbc3775730c4cedf9652323c7d72e663e4b.camel@mediatek.com>
 <8be3e050-f32a-6761-8ebd-49c38dfcf9eb@collabora.com>
 <c186d104-43e0-ca10-3ce2-c2f922acd8bf@leemhuis.info>
 <37468027-6a27-dcb8-9c14-8f8426ec50d1@collabora.com>
 <20221202110139.vmwcmoudakm2nap4@vireshk-i7>
 <f70d7c09-df0d-4fa9-92c9-63f31cf56483@systemli.org>
 <5e07eb07de0fea2232c32f58691ffb7cfd2303f8.camel@mediatek.com>
Content-Language: en-US
From: Nick <vincent@systemli.org>
In-Reply-To: <5e07eb07de0fea2232c32f58691ffb7cfd2303f8.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221220_063727_310422_DD078303 
X-CRM114-Status: GOOD (  14.72  )
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

Hey,
thanks for all your help. I guess it's fine now.
If someone wants to reproduce my setup, I published the exact steps here:
https://forum.openwrt.org/t/running-vanilla-kernel-on-banana-pi-r64/145351

I still wonder why my initial try using the OpenWrt build-environment 
together with the 6.1 kernel failed.

Bests
Nick

On 12/19/22 13:21, Allen-KH Cheng (程冠勳) wrote:
> Hi Nick,
>
> This issue doesn't seem to be going to happen.
> Is there anything else we need help confirming?
>
> Thanks,
> Allen
>
> -----Original Message-----
> From: Linux-mediatek <linux-mediatek-bounces@lists.infradead.org> On
> Behalf Of Nick
> Sent: Wednesday, December 7, 2022 11:35 PM
> To: Viresh Kumar <viresh.kumar@linaro.org>; AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com>
> Cc: Allen-KH Cheng (程冠勳) <Allen-KH.Cheng@mediatek.com>;
> linux-pm@vger.kernel.org; daniel@makrotopia.org;
> Project_Global_Chrome_Upstream_Group <
> Project_Global_Chrome_Upstream_Group@mediatek.com>; Rex-BC Chen (陳柏辰) <
> Rex-BC.Chen@mediatek.com>; Thorsten Leemhuis <regressions@leemhuis.info
>> ; linux-mediatek@lists.infradead.org; matthias.bgg@gmail.com;
> thomas.huehn@hs-nordhausen.de; Jia-wei Chang (張佳偉) <
> Jia-wei.Chang@mediatek.com>; linux-arm-kernel@lists.infradead.org;
> regressions@lists.linux.dev
> Subject: Re: Kernel Kernel bug caused by (cpufreq: mediatek: Refine
> mtk_cpufreq_voltage_tracking()) on Banana Pi R64 (MT7622)
>
> Did something changed on master? I compiled now the image I use on the
> BPI-R64 a bit differently.
> I used the openwrt toolchain "aarch64-openwrt-linux-musl-" to cross-
> compile the original linux repository on current master. Than I
> compiled with OpenWrt-Buildsystem a initramfs, put that together with
> mkimage to a "itb" and booted it. Suddenly it works:
>
> https://urldefense.com/v3/__https://gist.githubusercontent.com/PolynomialDivision/5e49529206ba5d273bf6a416c42c6234/raw/7ecff7be397a6e9a41ef120c3fa61060c488cf5b/mt7622-bpi-vanilla__;!!CTRNKA9wMg0ARbw!glNhziJx8pjvVsVoRm0LO8wshXJL_b2P_jYV5vO_9uhe1EnbMpWRnIEcj_561Ijxurd8C-Fjc7uCbBNIM_E-7YYc$
>   
>
> Bests
> Nick
>
> On 12/2/22 12:01, Viresh Kumar wrote:
>> On 02-12-22, 12:00, AngeloGioacchino Del Regno wrote:
>>> If Viresh can add those while applying the patch, that's fine for
>>> me
>>> - otherwise I can send a v2 adding the two suggested missing tags.
>> Sure, no problem.
>>
>

