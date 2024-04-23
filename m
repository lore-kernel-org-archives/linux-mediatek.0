Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2E45C4345F
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Apr 2024 12:57:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7YAsr5C6OYtQuefqJmw/g+R8AMdvkhwYIUWGyqNd6Vg=; b=tGN5/C5/YSMownqnN6gicbBe+F
	AHuOrghiiKt+CLNUHE92IHXIeFfscYSjwukHTrIpQb9Q6TMKQ3liLemcShtuCh3rx1ttWmjaC0D6D
	JddSunzUt+Cx0p1FaQMHKDPbcHkiaTV9s+lImP0wZGbTCA9wtwYuTSiV+bwHheAw8tb01APOFFT2l
	lB3QTfXQiKjlexWYJ1nG7YUoqyErrwxeRY5RE4EDnozZ4l0VazcStTPxPayLCLS2c07DBJHkG190A
	/PwsGT3lz9PcLFlvSIBbSCpID36wluamXCWlLph1X8KHNJBujOjtx86FtxpwEDldpcAPly1ZxSqYx
	CZcIP5pQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzFi6-0000000HXKK-0xgq;
	Tue, 23 Apr 2024 12:57:22 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzFi2-0000000HXDd-0gLy;
	Tue, 23 Apr 2024 12:57:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1713877019;
	bh=XeZycoklrbmIsGAeu98uH0HIylfGOQJCx4GR355GWBc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=xRziz0GyVrPt2dhtiBiqNDXqczIeDLuZbHnEOWJSrlHm36b7jLx7WJlA/NnNyYz+O
	 ILQ5AxoCCF584XC6at4Ovw7VG6IZUkYx2hcSU4LJTCUGclhXqLyOelc6ejocD9iQE9
	 ycHEPJjr5Z1dDU4MQAjBDjumEXasMAR4WwmZ4XII0SdqTIJvWCyiBMWY9gkqTTuKHH
	 g8Xdo9I4ALXJxJU0+jh5uZmA3T1BqHogZP/oCoSlUCAb5X+JS2pJqTZQ1G7PtkePVv
	 2ZfpAJAYcPdPKlUtCWGitWSX/IzjmIfxI5mmr6ld3MWC4bsdYgChfIPWTxwQ5z+5km
	 WKkdXlDaRIXeQ==
Received: from [100.66.96.193] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 6AF5937813A2;
	Tue, 23 Apr 2024 12:56:55 +0000 (UTC)
Message-ID: <c8a7744c-2225-4fd8-9ee7-bd513a4668cd@collabora.com>
Date: Tue, 23 Apr 2024 18:26:53 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/4] drm/ci: uprev IGT and generate testlist from build
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Cc: dri-devel@lists.freedesktop.org, daniels@collabora.com,
 helen.koike@collabora.com, airlied@gmail.com, daniel@ffwll.ch,
 robdclark@gmail.com, david.heidelberg@collabora.com,
 guilherme.gallo@collabora.com, sergi.blanch.torne@collabora.com,
 linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-rockchip@lists.infradead.org, amd-gfx@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, linux-kernel@vger.kernel.org
References: <20240423040243.448091-1-vignesh.raman@collabora.com>
 <20240423040243.448091-4-vignesh.raman@collabora.com>
 <e3a0ea8f-d306-488c-a69c-aa18078e5e03@igalia.com>
 <CAA8EJppaaitcXkXSFTB4-S2CbBcrAVHouB0wWiU5Nw2FvpagqA@mail.gmail.com>
Content-Language: en-US
From: Vignesh Raman <vignesh.raman@collabora.com>
In-Reply-To: <CAA8EJppaaitcXkXSFTB4-S2CbBcrAVHouB0wWiU5Nw2FvpagqA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240423_055718_398755_49A8525D 
X-CRM114-Status: GOOD (  13.42  )
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

Hi,

On 23/04/24 17:53, Dmitry Baryshkov wrote:
> On Tue, 23 Apr 2024 at 13:24, Maíra Canal <mcanal@igalia.com> wrote:
>>
>> On 4/23/24 01:02, Vignesh Raman wrote:
>>> Uprev IGT to the latest version and stop vendoring the
>>> testlist into the kernel. Instead, use the testlist from
>>> the IGT build to ensure we do not miss renamed or newly
>>> added tests.
>>
>> Nitpick: wouldn't it be better to (1) stop vendoring the
>> testlist into the kernel in one patch and then (2) uprev
>> IGT to the latest version? I feel that this patch is changing
>> a lot of different stuff.
> 
> Definitely. Otherwise it's hard to understand whether a change to
> fails/flakes is caused by the uprev or by the testlist change. E.g. in
> several cases the list of failing subtests seems to be replaced with
> the test itself.
> 

Yes, will follow the below approach.
1) Use the testlist from build and update fails/flakes/skips
2) Uprev IGT and update fails/flakes/skips

Regards,
Vignesh

>>
>>>
>>> Skip kms tests for panfrost driver since it is not a kms
>>> driver and skip driver-specific tests. Update xfails with
>>> the latest testlist.
>>>
>>> Increase the timoout of i915 jobs to 2h30m since some jobs
>>> takes more than 2 hours to complete.
>>>
>>> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
>>> ---
> 
> 

