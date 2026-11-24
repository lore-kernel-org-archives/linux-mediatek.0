Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1D2D606A339
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Nov 2026 11:25:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=atv3o35X;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=HKidqfUD
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=fKJgwndBmVk1QjSgTESMXqKkxhnqis7hXIoriLN6iH8=; b=atv3o35XqqpHUT
	hnvWFgkZEwAPUO47WPgJ8rRb7KXu3bGfiLGuwkS6YVT+ycwzlIV1WRki2La54/NNq7wtfuo7VhZh+
	0O3FwBLTd1f4Y/8ef1QJHu9C8ILQIXXbMGDjzjsxNnqe8NujiEow8/uFMWz+7gUSl0mjku07lmxxk
	H2XDM8DHgfe4ABo3kt2qeMtupmYMdz3NvDAutqDy2djWGv+YjTl1qWA9CBEh1tTqm6AS2HhXhEq+5
	4Fex3cZolMdywuXUDVHrlHphd/t68zzF0j+PGii/88+1tvxbR1N43GU19l40nhqC5Ot+hJya9dJIA
	4cZOuVTzHuHV8+3s44tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVodw-00000006Ltl-0xMX;
	Tue, 24 Nov 2026 11:25:00 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVodu-00000006LsC-0kff;
	Tue, 24 Nov 2026 11:24:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1795519496;
	bh=m+QktASoilhpAu5jCWRlhhnUzEWwf0rcN1O0jXft81Y=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=HKidqfUD0IcjQxD6en+YNVjDJQ0sI43LaDJhDB2jeA6MFVDhqieRSvJGtqAvlrm8j
	 +52M527PJXxwiGZtMN3RayKqMMnNMndXcnxUJTlZwIkMViAPUATAD3pCIrSFrakjO0
	 w46uiz9bTgr6VDfkzRk250nOJ9QZ76purJlAcs+O31yD848ID2sqwPtkLjT5r70FGC
	 2MtYpQV2w/WXbtUMNtX9BM0FUjzAPHaKlwEDuH85pnf/s3umOlQuw6lb1FNfnnxGX5
	 Oac5GfU7x+yUJj0F3WmEtxU0jlEa0CAHnhveouDy319G1PKxaB515gni9AIJXZg+Da
	 y/9Na3NcTKD3g==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7FF3C17E0309;
	Tue, 24 Nov 2026 12:24:55 +0100 (CET)
Message-ID: <56cca340-b7b8-4e6a-adbb-887864cc14b1@collabora.com>
Date: Tue, 24 Nov 2026 12:24:55 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/mediatek: dsi: Don't let a signal cut the IRQ wait
 short
To: =?UTF-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>,
 =?UTF-8?B?WmktaGFvIEh1YW5nICjpu4PmopPosaop?= <Zi-hao.Huang@mediatek.com>,
 "ryanbrue.dev@gmail.com" <ryanbrue.dev@gmail.com>
Cc: "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 "simona@ffwll.ch" <simona@ffwll.ch>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "airlied@gmail.com" <airlied@gmail.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 =?UTF-8?B?U2hhb21pbmcgQ2hlbiAo6ZmI57uN5piOKQ==?= <shaoming.chen@mediatek.com>
References: <20261119033634.1844084-1-zi-hao.huang@mediatek.com>
 <fe208c0c-cea4-4e56-8283-e242ac1cd2ae@gmail.com>
 <65140b86aed23f307f8552be8bc5ae13f1de1874.camel@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <65140b86aed23f307f8552be8bc5ae13f1de1874.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_032458_387346_41397987 
X-CRM114-Status: GOOD (  15.72  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/24/26 06:54, CK Hu (胡俊光) wrote:
> On Mon, 2026-11-23 at 18:31 -0600, Ryan Brue wrote:
>> External email : Please do not click links or open attachments until you have verified the sender or the content.
>>
>>
>> On Thu, Nov 19, 2026 at 11:36:34AM +0800, Zi-Hao Huang wrote:
>>   > I'm not sure the trigger is specific to our downstream driver.
>>
>> I hit the same lockup on MT8173 (Amazon Fire HD 10 2017) with the
>> upstream driver. v7.4-rc4, whose only DSI change is "drm/mediatek: dsi:
>> force command mode in mtk_dsi_poweron()" from the mediatek tree, and the
>> mainline NT51021 panel driver, which also sets prepare_prev_first and
>> sends display off and enter sleep from .unprepare.
>>
>> The trigger for me was suspend under Plasma. logind's PrepareForSleep
>> makes KWin turn the display off, and the session is frozen while KWin's
>> commit is still in the panel's unprepare. The freezer's fake signal ends
>> the interruptible wait with -ERESTARTSYS, mtk_dsi_host_send_cmd() takes
>> that for success, and the late CMD_DONE lands in mtk_dsi_irq()'s
>> DSI_BUSY loop. After the watchdog reset, MT8173's last-PC latch showed
>> CPU0 at mtk_dsi_irq+0x84, the DSI_INTSTA read in that loop.
>>
>> With only mediatek-drm.ko changed, suspending through logind with a GPU
>> benchmark running: without the patch 5 of 6 suspends reset the board
>> (about one in three without the load); with this v2, 0 of 10, with no
>> DSI IRQ or vblank timeouts, and the panel's power-down still takes 270ms.
>>
>> The wake_up() hunk matters. With only the wait changed, every command
>> waited out its 2s timeout and the panel's power-down took 10.4s.
>>
>> Tested-by: Ryan Brue <ryanbrue.dev@gmail.com> # MT8173, NT51021
>>
>> I actually had a similar fix ready to go, and found your patch, so thank
>> you :)
> 
> The upstream driver has this problem, and this patch fix it,
> so I would apply this patch first.
> 

CK, okay, apply it.

Beware though, this will block at every frame and lower performance quite a bit.

Cheers,
Angelo

> Regards,
> CK
> 
>>
>> Best regards,
>> Ryan Brue
> 


