Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 232CCC4708E
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Dec 2022 15:35:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zRMPmx2g25b+oz+4Mu5sled5OxjCCJuBKdM0iCwdVr0=; b=Ujz3uaGyclvhiD
	FwnbvFE3NlFI4okDbX4hVEoaod36SZd6qeubvsbeCQtvHl1XHyQSXCHkFFOtzJ4xXNRZXCLoJQ9HV
	fB1IJJYTILvVbBkhzQ7amw/9ASpIMrH+72dAJtCptDVsJOFS3Q56vcsAuflXMUmlcp1gwp0MNLFXh
	f/NkaHZY0uVSAZoTcYyPFGHSegoK5gxiUsF3Bso0+xrc7hRd8cSYNFJz8keTgbBcg8WbL3Un24rGt
	izANeUTDgAyGMF4iEVqDodiZgF8mo6OWjnyLIYj8Ql9FfLLn6mJZ32qrTUWAQB6JjU9AayNfjY+j2
	0TVZnnJfR3F0Wr6IPkuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2wRp-005tXI-Bi; Wed, 07 Dec 2022 15:35:01 +0000
Received: from mail1.systemli.org ([93.190.126.36])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2wRZ-005t9R-CP; Wed, 07 Dec 2022 15:34:48 +0000
Message-ID: <f70d7c09-df0d-4fa9-92c9-63f31cf56483@systemli.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=systemli.org;
	s=default; t=1670427276;
	bh=zRMPmx2g25b+oz+4Mu5sled5OxjCCJuBKdM0iCwdVr0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=bLmXw34wygi9IeMNToIo0OUgRMES3iZz5BKgSQyYWcZMw24MUENAxbOCbdj1/nysB
	 93SDqY+t0EZAC3Sf4ONqJNaKRhXxakVMJuZp113XkDNgdsjMwtVjwg7Nh+oBzVIaXx
	 /jAMidL4GPsHJUrpcbaBfr4QqiezlLHtQyJFBbZoRtnfpS9oobEa7B7pildvD/Hf6g
	 vUDPXSAXmwktv+NJvbEOIn8itSn2MFeEClcv/pHdrTacYx9Uyu6TQcZg7llUqaPLu1
	 a7kqKRWFT/reUwg24YdLruFOVoapoVgnqDpWHd7SWTOHlE5ImRgplZ8tiJiO0wlF9h
	 Bi9OviGvQyd9w==
Date: Wed, 7 Dec 2022 16:34:33 +0100
MIME-Version: 1.0
Subject: Re: Kernel Kernel bug caused by (cpufreq: mediatek: Refine
 mtk_cpufreq_voltage_tracking()) on Banana Pi R64 (MT7622)
To: Viresh Kumar <viresh.kumar@linaro.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
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
Content-Language: en-US
From: Nick <vincent@systemli.org>
In-Reply-To: <20221202110139.vmwcmoudakm2nap4@vireshk-i7>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221207_073445_911547_4AA70418 
X-CRM114-Status: UNSURE (   6.22  )
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
Cc: =?UTF-8?B?QWxsZW4tS0ggQ2hlbmcgKOeoi+WGoOWLsyk=?= <Allen-KH.Cheng@mediatek.com>, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, "daniel@makrotopia.org" <daniel@makrotopia.org>, Project_Global_Chrome_Upstream_Group <Project_Global_Chrome_Upstream_Group@mediatek.com>, =?UTF-8?B?UmV4LUJDIENoZW4gKOmZs+afj+i+sCk=?= <Rex-BC.Chen@mediatek.com>, Thorsten Leemhuis <regressions@leemhuis.info>, "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, "thomas.huehn@hs-nordhausen.de" <thomas.huehn@hs-nordhausen.de>, =?UTF-8?B?SmlhLXdlaSBDaGFuZyAo5by15L2z5YGJKQ==?= <Jia-wei.Chang@mediatek.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "regressions@lists.linux.dev" <regressions@lists.linux.dev>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Did something changed on master? I compiled now the image I use on the 
BPI-R64 a bit differently.
I used the openwrt toolchain "aarch64-openwrt-linux-musl-" to 
cross-compile the original linux repository on current master. Than I 
compiled with OpenWrt-Buildsystem a initramfs, put that together with 
mkimage to a "itb" and booted it. Suddenly it works:
https://gist.githubusercontent.com/PolynomialDivision/5e49529206ba5d273bf6a416c42c6234/raw/7ecff7be397a6e9a41ef120c3fa61060c488cf5b/mt7622-bpi-vanilla

Bests
Nick

On 12/2/22 12:01, Viresh Kumar wrote:
> On 02-12-22, 12:00, AngeloGioacchino Del Regno wrote:
>> If Viresh can add those while applying the patch, that's fine for me - otherwise
>> I can send a v2 adding the two suggested missing tags.
> Sure, no problem.
>

