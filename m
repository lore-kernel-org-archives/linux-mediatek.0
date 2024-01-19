Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB4D1C4725D
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Jan 2024 09:12:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dnvtOuZ6ED6eG7UNecSoUV/eae9cnB7yhkjV+5cGSBE=; b=Qdz5K4NJ3CAOyFk4fNZ6wZTT5y
	8kpaGr0EDhCtAYVGoyNkGwrHfRMtzM0M7cPrCfsC41IpPr2M0W8AVBE4LjE1eHBoh595qmVN4gJoA
	efG1EAw8LjcQAXsuEfAElHgyapkYJYzqNlcl6Tk1JgeqyEFqUStd9d94gLHFDMn2Kp1sva1+onwgJ
	/WEobkpH/KfRynNAkO0ippjDP0m2yvK5U8ZrqgBLH3sVxQ2wCzWQashziC0SHWJu51JWy31FK3Ho0
	I/U9D+WLbjQ65VYU+fw9C1Bgl2PgAajLtdNmg1z+gjqRpTC0SIJhNmo3NOGBGcwM2jODNORCrN0Id
	GM+MMDKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rQkvC-004wIr-14;
	Fri, 19 Jan 2024 09:12:18 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rQkv8-004wGz-1h;
	Fri, 19 Jan 2024 09:12:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1705655528;
	bh=eNiJDJdYOUFmY5BTiqxpKfPXrwPImnQUYyFSWE2ZSJU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=z3P4C5rpP4oH8MIrinLyBrZZZVLTwMNTKhUsEGxFrEAxX+qZsgt5wWovv3/SVw2fJ
	 53XvZEQw3il/d9gtLpvQSnizwlBvKTmsszvqKYNG83lTWXA6MrWTUyyjVKlAArjymv
	 yO8ffqW/6ynmiRhzqgVKPkPGtNvckK4eclAEexsP6mERqMYFkBEEWy1kejIJzeu22i
	 RNpIa3zUaqQ7Ey8iWdTTVqueKPYTtEDWHEZWJPcsXvtBdFWWogxjKerYn+99eleMix
	 e9og5Y4g/y6kVL+iLJVQScKWbw69vm1urU+qXOw/NNkLLgF203sYOqQl7hIv1MRFsn
	 5SrxTe6HPTWGA==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 419BA3781182;
	Fri, 19 Jan 2024 09:12:08 +0000 (UTC)
Message-ID: <064935d8-fbda-4eda-b013-8c8fc63b561c@collabora.com>
Date: Fri, 19 Jan 2024 10:12:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Probe failure of usb controller @11290000 on MT8195 after
 next-20231221
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 kernel@collabora.com, Macpaul Lin <macpaul.lin@mediatek.com>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, Chen-Yu Tsai <wenst@chromium.org>
References: <9fce9838-ef87-4d1b-b3df-63e1ddb0ec51@notapiano>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <9fce9838-ef87-4d1b-b3df-63e1ddb0ec51@notapiano>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240119_011214_706986_4EF41813 
X-CRM114-Status: GOOD (  18.11  )
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

Il 18/01/24 19:36, Nícolas F. R. A. Prado ha scritto:
> Hi,
> 
> KernelCI has identified a failure in the probe of one of the USB controllers on
> the MT8195-Tomato Chromebook [1]:
> 
> [   16.336840] xhci-mtk 11290000.usb: uwk - reg:0x400, version:104
> [   16.337081] xhci-mtk 11290000.usb: xHCI Host Controller
> [   16.337093] xhci-mtk 11290000.usb: new USB bus registered, assigned bus number 5
> [   16.357114] xhci-mtk 11290000.usb: clocks are not stable (0x1003d0f)
> [   16.357119] xhci-mtk 11290000.usb: can't setup: -110
> [   16.357128] xhci-mtk 11290000.usb: USB bus 5 deregistered
> [   16.359484] xhci-mtk: probe of 11290000.usb failed with error -110
> 
> A previous message [2] suggests that a force-mode phy property that has been
> merged might help with addressing the issue, however it's not clear to me how,
> given that the controller at 1129000 uses a USB2 phy and the phy driver patch
> only looks for the property on USB3 phys.
> 
> Worth noting that the issue doesn't always happen. For instance the test did
> pass for next-20240110 and then failed again on today's next [3]. But it does
> seem that the issue was introduced, or at least became much more likely, between
> next-20231221 and next-20240103, given that it never happened out of 10 runs
> before, and after that has happened 5 out of 7 times.
> 
> Note: On the Tomato Chromebook specifically this USB controller is not connected
> to anything.
> 
> [1] https://linux.kernelci.org/test/case/id/659ce3506673076a8c52a428/
> [2] https://lore.kernel.org/all/239def9b-437b-9211-7844-af4332651df0@mediatek.com/
> [3] https://linux.kernelci.org/test/case/id/65a8c66ee89acb56ac52a405/
> 
> Thanks,
> Nícolas

Hey Nícolas,

I wonder if this is happening because of async probe... I have seen those happening
once in a (long) while on MT8186 as well with the same kind of flakiness and I am
not even able to reproduce anymore.

For MT8195 Tomato, I guess we can simply disable that controller without any side
effects but, at the same time, I'm not sure that this would be the right thing to
do in this case.

Besides, the controller at 11290000 is the only one that doesn't live behind MTU3,
but I don't know if that can ring any bell....

Cheers,
Angelo

