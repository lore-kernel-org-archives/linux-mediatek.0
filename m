Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEF9BC3DA6E
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Jan 2024 10:47:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:Cc:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=heB8gN1EGMzx6ieb62Nc60/SaFPpKYWT5IDanzidogc=; b=nARh0AigMysUgHnh8/ayQZx7Lp
	qxQfKbASXyOJfgV//38kh0oBFclf2pb/jcYDPemU9sus1xDS/0rdXBWbkYNmPC7xjdruFPr3M/e8A
	8U+uh3QHRfb6bFUctZLBeWrqJemL0LgYCSpvjz0QBCnm1ZsoNeDJbPZAkyNRrqezJVWcd6esAuABm
	d99fDrIeJCxYDHB8r/96z+EcyxCFB6FL6yMJxCTM+BwNwjWZvBkXnk3xEBURyA6r/HsC1n2LYiVHD
	Yat2TaANsZOT5T8n/eSUWY4GdsRvQM5LHJPPvXvqn+zS4Hsc5LGmvB4ReAuKNhgSC29RTo3snf9Ev
	ocRLoCag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rNW7Y-00B5NT-2H;
	Wed, 10 Jan 2024 10:47:40 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rNW7V-00B5JC-28;
	Wed, 10 Jan 2024 10:47:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1704883651;
	bh=07NYN+tS7WFxafPAhAuyICZjW1AV4EkuTeDYId+eNHg=;
	h=Date:Subject:To:References:Cc:From:In-Reply-To:From;
	b=YCCgBU+eHNGMmR+MFSocFPFvEpkA1/nZrBz3jfG87mz0Z3h2CXucMvC9Ysb2Ih4wN
	 xEsf7JUICTW3pjbDoNtCR4p7mMfK2shvH9vkrqEDNWEE8CIfivbP9fbgfkQ+RhzNym
	 JSdee2IBP0sCe3Mg7vUZ4ILXxjtvKMqe1OKe1HYF2G7C3AZZlUEtdV5If/bcu3G5V5
	 kX1VnBPnkNRMiaA0fenakZsGXYnCV/y/atjf+Dpj6n2uv/Az+0wogQ+H7kfLMCssml
	 KtomeDBKsC2vyYkY1tO3oitf3s7JB0yg8mCLg2hPvTBmaNuP0X68y+SfQPNkLAE/29
	 UbZpZ9ro2ra2w==
Received: from [100.66.96.193] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id AA8FF3780C21;
	Wed, 10 Jan 2024 10:47:26 +0000 (UTC)
Message-ID: <ad7cbd59-5264-96e8-5e9b-aafde8028e41@collabora.com>
Date: Wed, 10 Jan 2024 16:17:23 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v1 0/8] drm/ci: Add support for GPU and display testing
Content-Language: en-US
To: Daniel Stone <daniel@fooishbar.org>
References: <20231220121110.1441160-1-vignesh.raman@collabora.com>
 <CAPj87rOMPioOK0r74vcnVkXusm6Nah6KNUWyxYgpVLdkMNtW2g@mail.gmail.com>
Cc: Helen Koike <helen.koike@collabora.com>, Dave Airlie <airlied@gmail.com>,
 Sima Vetter <daniel@ffwll.ch>, Daniel Stone <daniels@collabora.com>,
 Emma Anholt <emma@anholt.net>,
 linux-rockchip <linux-rockchip@lists.infradead.org>,
 guilherme.gallo@collabora.com, sergi.blanch.torne@collabora.com,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 David Heidelberg <david.heidelberg@collabora.com>,
 Rob Clark <robdclark@gmail.com>, linux-mediatek@lists.infradead.org,
 linux-amlogic@lists.infradead.org
From: Vignesh Raman <vignesh.raman@collabora.com>
In-Reply-To: <CAPj87rOMPioOK0r74vcnVkXusm6Nah6KNUWyxYgpVLdkMNtW2g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240110_024737_844032_5C0B913E 
X-CRM114-Status: GOOD (  23.19  )
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

Hi Daniel,

On 09/01/24 19:08, Daniel Stone wrote:
> Hi,
> 
> On Wed, 20 Dec 2023 at 12:11, Vignesh Raman <vignesh.raman@collabora.com> wrote:
>> Some ARM SOCs have a separate display controller and GPU, each with
>> different drivers. For mediatek mt8173, the GPU driver is powervr,
>> and the display driver is mediatek. In the case of mediatek mt8183,
>> the GPU driver is panfrost, and the display driver is mediatek.
>> With rockchip rk3288/rk3399, the GPU driver is panfrost, while the
>> display driver is rockchip. For amlogic meson, the GPU driver is
>> panfrost, and the display driver is meson.
>>
>> IGT tests run various tests with different xfails and can test both
>> GPU devices and KMS/display devices. Currently, in drm-ci for MediaTek,
>> Rockchip, and Amlogic Meson platforms, only the GPU driver is tested.
>> This leads to incomplete coverage since the display is never tested on
>> these platforms. This commit series adds support in drm-ci to run tests
>> for both GPU and display drivers for MediaTek, Rockchip, and Amlogic
>> Meson platforms.
> 
> Thanks a lot for these. The patches need to be squashed to be
> bisectable though. For example, patch #2 changes the MTK job names and
> adds more jobs, but the corresponding xfail updates only come in #7
> and #8. This means we have a span of a few patches where we don't have
> useful test results.
> 
> A better sequencing would be something like:
>    1. add ANX7625 config
>    2. refactor _existing_ MTK display jobs to use YAML includes, change
> the existing job name, and rename the existing xfail set, remove
> IGT_FORCE_DRIVER from the script since it's now set by the job
>    3. add MTK Panfrost+PVR GPU jobs with new xfails, add xfail entry to
> MAINTAINERS
>    4+5: same as 2+3 but for Amlogic
>    6+7: same as 2+3 but for Rockchip
> 
> Then the separate rename/update xfail commits just disappear, as does
> the removal of IGT_FORCE_DRIVER, because it's just done incrementally
> as part of the commits which change the related functionality. It's
> extremely important that every change can work standalone, instead of
> introducing intermediate breakage which is only fixed in later commits
> in the series.

Thank you for reviewing the patches. I agree, will follow this sequence 
and send a v2 version.

Regards,
Vignesh

