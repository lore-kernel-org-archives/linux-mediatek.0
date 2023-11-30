Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19282C07CA9
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Nov 2023 13:51:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gk9/KX60GgnrZQpal5Y8O8y1Z0yWSndXwVkjjQ4CGl8=; b=aWms774t9Sf9D473BYDFAK/lAb
	oPbFi9gysANHYTcPRdHGh0UgasOTcb+9Z1DLM5NvL9WiQpPB+Ch0g781u6NxlC8YlgZJ1pVss89Bn
	UXO3AF3MRMWMDLp6ceqaXez70Gwc/MlMp8gbHD0aq9N1q1biYnmQTDOpzeToNBND8vQXoY9WuSIF8
	fWsD07M8VLKhjMcmP3MSzlM6sVuRFUmtiYvXpwVoEQ3CoaUSmh3kXB7SbEsFJqaUGxdzdCcUCAJvQ
	8c/i5n4ROlRz4Q4+LUIwOnf5RP2UKfqxIb+5PlPKKBJNpUQBUac59ciZg7WCueQmRj3kci/z4pg77
	u7gg/YZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8hRZ-00B1Ma-1o;
	Thu, 30 Nov 2023 13:51:05 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8hRW-00B1MA-0g;
	Thu, 30 Nov 2023 13:51:04 +0000
Received: from [100.124.219.30] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 037796607345;
	Thu, 30 Nov 2023 13:50:54 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1701352258;
	bh=HGnD8bUQWOaK+6RFgKTsVFZmO6HTrfFGIJlJrDox4v8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=H58wh8CHNeyKhFKLgOKBi4cHe/A5GWRrfro7BiyeAt4Jr5iSpHtao56/5Xpa0WFNt
	 iL9p94K8uIyTXndAwxXyrdNoIHY9sXoa5oBmnefTqKNP3R0jrZm8Swjg7huYA2KQi2
	 qA2dhqdwQ0MRA5G3Od4dScyaTjrYKG0aYkBzU0D3kIBfKadg5E9uG5RT6kHtSoFYVf
	 4V0V4odklj4B0h1o/kAGP/l1KaQWj1PwW92dO9KW8DxzbwFbO/+nUqH7C+XFTFeJ/d
	 058/Sgc7SGQkJBFyU3cqme3tnGtkMBUFdWLM7lBBh92rCW62iY4m/GSvtgeOyxYAOI
	 yAE7gIc4P+R8w==
Message-ID: <893192db-0431-4d1f-7281-952da9979345@collabora.com>
Date: Thu, 30 Nov 2023 19:20:50 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v6 06/10] drm: ci: mediatek: Set IGT_FORCE_DRIVER for
 mt8173
Content-Language: en-US
To: Daniel Stone <daniel@fooishbar.org>
Cc: helen.koike@collabora.com, airlied@gmail.com, daniel@ffwll.ch,
 daniels@collabora.com, emma@anholt.net, gustavo.padovan@collabora.com,
 linux-arm-msm@vger.kernel.org, guilherme.gallo@collabora.com,
 sergi.blanch.torne@collabora.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 david.heidelberg@collabora.com, linux-mediatek@lists.infradead.org,
 linux-rockchip@lists.infradead.org
References: <20231129121841.253223-1-vignesh.raman@collabora.com>
 <20231129121841.253223-7-vignesh.raman@collabora.com>
 <CAPj87rPKywWa8KxTCeJQz4vvgTwhPzL+y4aCX9zxZDkkfrvsoQ@mail.gmail.com>
From: Vignesh Raman <vignesh.raman@collabora.com>
In-Reply-To: <CAPj87rPKywWa8KxTCeJQz4vvgTwhPzL+y4aCX9zxZDkkfrvsoQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231130_055102_431681_2406749B 
X-CRM114-Status: GOOD (  14.05  )
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

On 29/11/23 18:52, Daniel Stone wrote:
> Hi Vignesh,
> 
> On Wed, 29 Nov 2023 at 12:19, Vignesh Raman <vignesh.raman@collabora.com> wrote:
>> Expected driver for mt8173 is "mediatek" and for mt8183
>> it is "panfrost". Set IGT_FORCE_DRIVER to 'mediatek' as
>> the expected driver for mt8173.
> 
> Actually, for mt8183 it's both. And for mt8173 it will probably be
> mediatek+pvr pretty soon. Each of these SoCs (like most Arm devices)
> have a separate display controller and GPU, with different drivers for
> each. They'll run different tests with different xfails. So we should
> figure out a way to support igt running for both devices on the one
> system.

Agree. Will work on separate patch to test both the drivers for these 
devices.

Regards,
Vignesh

