Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80060CD690C
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Oct 2023 08:52:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ixDwm5k50yKUTBz/ZVdVbdNKWPYYQMY2fgBSG+L1vt4=; b=jmnlhHToZzX5hVavI12Bhul9da
	jkWVQKfh6xC2++zTCRdR/scyZMI4WgVUF6F1DXA93jJu5MFh7J0ys/ioZyxJPNWC8t+lOaeO70jc1
	jJPyKwgEet9NL8EaLa4nayorYM+lXQs6tFDBDO2qM9ERZXCl7fRxlEo8rVZ3rSNL/MpfGxqo9EsvR
	E+14UxRxsIJxi17xrv8Z+cj6qW84J8Hmtovr8YG9QJ9yJ5chlxaqdd6sldOKsfh4TX9dHDxaehrIn
	al/XIw0ntCPh/enOF0S4ug/d12+ajad8uUxW49+ABSstyMwGeldt1mZ/u4THtWq6GYvvCc6jqIHlW
	Z/kj+Jkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qq8TU-00CsMq-0l;
	Tue, 10 Oct 2023 08:52:20 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qq8TQ-00CsLu-1i;
	Tue, 10 Oct 2023 08:52:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 6C5C3B81B2E;
	Tue, 10 Oct 2023 08:52:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B0F4C433C8;
	Tue, 10 Oct 2023 08:52:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696927933;
	bh=XJynC3FVhVB5RPnfUzpYV78TXawY3XcAs4e1JfEyljQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=o9wwu4UrznOZpfdZX7oqvMRLJk0mD61f6BIJ1INfdsdsymjZ4gRjo9Kau+5y3AYwm
	 qs2/Fa4+Gj31ZGOFprfnW5V3dOP5sgf2zwrH5YNSmKXVbK3rw3OP0Grgh5BBhLEjMQ
	 FibLRVELC/hZ9uJwGh7FMqtQcGRqgUPOBFn1Dky0eHFf6BMlcaKQ1Zkb98qPYHnYk5
	 7yUtWh6ThBgm+wL2J5pRpDspCijDnRd8AjRiJ0Xl87C2plDpV5hxwHDxAlb7nC2QQk
	 ++zDF65ChxJxHfm1/6NxL0vEnYZ6LAEpyWSh7PyluUgp8Vo0400KOYDhlXpkHEAOjr
	 KCCwrv6n09xVQ==
Message-ID: <74a4dc35-eed2-79c2-2b57-ed0857cbc96a@kernel.org>
Date: Tue, 10 Oct 2023 10:52:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v3] spmi: mtk-pmif: Serialize PMIF status check and
 command submission
Content-Language: en-US
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Stephen Boyd <sboyd@kernel.org>
Cc: Chen-Yu Tsai <wenst@google.com>, kernel@collabora.com,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>,
 James Lo <james.lo@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org
References: <20230724154739.493724-1-nfraprado@collabora.com>
 <a4684a81-eb04-492a-bff6-a5ff78fe6b0f@notapiano>
 <7b407eda-702a-444a-b644-5e8dc31f3991@notapiano>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@kernel.org>
In-Reply-To: <7b407eda-702a-444a-b644-5e8dc31f3991@notapiano>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231010_015216_887564_53F9F43C 
X-CRM114-Status: GOOD (  18.65  )
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

Il 19/09/23 22:12, Nícolas F. R. A. Prado ha scritto:
> On Thu, Aug 10, 2023 at 06:03:53PM -0400, Nícolas F. R. A. Prado wrote:
>> On Mon, Jul 24, 2023 at 11:47:33AM -0400, Nícolas F. R. A. Prado wrote:
>>> Before writing the read or write command to the SPMI arbiter through the
>>> PMIF interface, the current status of the channel is checked to ensure
>>> it is idle. However, since the status only changes from idle when the
>>> command is written, it is possible for two concurrent calls to determine
>>> that the channel is idle and simultaneously send their commands. At this
>>> point the PMIF interface hangs, with the status register no longer being
>>> updated, and thus causing all subsequent operations to time out.
>>>
>>> This was observed on the mt8195-cherry-tomato-r2 machine, particularly
>>> after commit 46600ab142f8 ("regulator: Set PROBE_PREFER_ASYNCHRONOUS for
>>> drivers between 5.10 and 5.15") was applied, since then the two MT6315
>>> devices present on the SPMI bus would probe assynchronously and
>>> sometimes (during probe or at a later point) read the bus
>>> simultaneously, breaking the PMIF interface and consequently slowing
>>> down the whole system.
>>>
>>> To fix the issue at its root cause, introduce locking around the channel
>>> status check and the command write, so that both become an atomic
>>> operation, preventing race conditions between two (or more) SPMI bus
>>> read/write operations. A spinlock is used since this is a fast bus, as
>>> indicated by the usage of the atomic variant of readl_poll, and
>>> '.fast_io = true' being used in the mt6315 driver, so spinlocks are
>>> already used for the regmap access.
>>>
>>> Fixes: b45b3ccef8c0 ("spmi: mediatek: Add support for MT6873/8192")
>>> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
>>
>> Hi,
>>
>> gentle ping on this one. MT8195 Chromebooks sometimes boot to a broken state
>> without it.
> 
> Hi Stephen,
> 
> once again kindling reminding you of this important fix for MediaTek platforms,
> solving a real issue impacting basic functionality observed on the MT8195
> Chromebook.
> 

Hello Stephen,

can you please pick this one ASAP?
MT8195 is broken without.

Thanks,
Angelo

