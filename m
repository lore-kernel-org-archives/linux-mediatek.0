Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C118C001DB
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Aug 2023 11:42:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ME4Fk+YG5Wg6oV/33TqW1eIUaceuEQbGfIPdCCEySHU=; b=SFJD70ZDIH/7tQys+g7sYm5IVu
	Dww4EAhbs31CvZoE+awOozIKDWds3PiSKAwxHU6/deFVB9rSRwtyjdyzFctetl+2RvL8hAU9zgjx8
	y52otT565fbWwGi3tUYQzllPu7TCIX8gFNPAhDP2IhJeG1is1cYPwAdGUIaBVizAVuvGlmbrroQ+/
	72HFDOYWcGcA+OFE/76kO7b0HjC4eQg3XfzjC1d5bDwymDc2N0hmD9tt6JQA4fhO+v31e6oS/58bb
	3Y5mVVKLyZD6Ak9B3o0alWS+V+NmI5RnTcaB05RtyhxcNwt28DrfhV4jsmyJ6u/9gJ4ZiP7A6K30C
	bcakEjuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qU43t-007Uac-0l;
	Thu, 10 Aug 2023 11:42:41 +0000
Received: from e10edge.fintech.ru ([195.54.195.159] helo=exchange.fintech.ru)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qU43o-007UWb-37;
	Thu, 10 Aug 2023 11:42:39 +0000
Received: from Ex16-01.fintech.ru (10.0.10.18) by exchange.fintech.ru
 (195.54.195.169) with Microsoft SMTP Server (TLS) id 14.3.498.0; Thu, 10 Aug
 2023 14:42:26 +0300
Received: from [192.168.211.130] (10.0.253.138) by Ex16-01.fintech.ru
 (10.0.10.18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Thu, 10 Aug
 2023 14:42:25 +0300
Message-ID: <8a547455-1f5b-f3bf-3fcc-553760940deb@fintech.ru>
Date: Thu, 10 Aug 2023 04:42:25 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] video/hdmi: convert *_infoframe_init() functions to void
Content-Language: en-US
To: Maxime Ripard <mripard@kernel.org>
CC: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	"Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, Matthias Brugger
	<matthias.bgg@gmail.com>, Alex Deucher <alexander.deucher@amd.com>, "Alain
 Volmat" <alain.volmat@foss.st.com>, Thomas Zimmermann <tzimmermann@suse.de>,
	Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
	<joonas.lahtinen@linux.intel.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, =?UTF-8?Q?Christian_K=c3=b6nig?=
	<christian.koenig@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>, "Thierry
 Reding" <thierry.reding@gmail.com>, Mikko Perttunen <mperttunen@nvidia.com>,
	Jonathan Hunter <jonathanh@nvidia.com>, Emma Anholt <emma@anholt.net>,
	"Helge Deller" <deller@gmx.de>, =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?=
	<ville.syrjala@linux.intel.com>, Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
	<dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
	<intel-gfx@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <amd-gfx@lists.freedesktop.org>,
	<linux-tegra@vger.kernel.org>, <linux-fbdev@vger.kernel.org>,
	<lvc-project@linuxtesting.org>
References: <20230808180245.7474-1-n.zhandarovich@fintech.ru>
 <ibwl2bpz5bs72co4ivkvjcc35lv5mqyuvj2hbr3p54hliujklm@uje662ldqfdw>
From: Nikita Zhandarovich <n.zhandarovich@fintech.ru>
In-Reply-To: <ibwl2bpz5bs72co4ivkvjcc35lv5mqyuvj2hbr3p54hliujklm@uje662ldqfdw>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.0.253.138]
X-ClientProxiedBy: Ex16-02.fintech.ru (10.0.10.19) To Ex16-01.fintech.ru
 (10.0.10.18)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230810_044237_021916_54DBBD2C 
X-CRM114-Status: GOOD (  17.34  )
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

Hello,

On 8/10/23 01:13, Maxime Ripard wrote:
> Hi,
> 
> On Tue, Aug 08, 2023 at 11:02:45AM -0700, Nikita Zhandarovich wrote:
>> Four hdmi_*_infoframe_init() functions that initialize different
>> types of hdmi infoframes only return the default 0 value, contrary to
>> their descriptions. Yet these functions are still unnecessarily checked
>> against possible errors in case of failure.
>>
>> Remove redundant error checks in calls to following functions:
>> - hdmi_spd_infoframe_init
>> - hdmi_audio_infoframe_init
>> - hdmi_vendor_infoframe_init
>> - hdmi_drm_infoframe_init
>> Also, convert these functions to 'void' and fix their descriptions.
> 
> I'm not sure what value it actually adds. None of them return any
> errors, but very well might if we started to be a bit serious about it.
> 
> Since the error handling is already there, then I'd rather leave it
> there.

There is definitely no particular urgency to this change.

Since these functions don't perform anything complex and aren't updated
regularly, my main goal was to remove unnecessary (at the moment) checks
and fix up their somewhat misleading descriptions. Cleaning up, in other
words. But I understand your point of view.

If you don't think this patch is warranted at this point, I totally
understand.

> 
>> Fixes: 2c676f378edb ("[media] hdmi: added unpack and logging functions for InfoFrames")
> 
> I'm confused about that part. What does it fix exactly?
> 
> Maxime

I added the 'Fixes:' tag mostly as a requirement for patch's
description. Once again, it doesn't "fix" anything broken as much as it
cleans up stuff.

Best regards,
Nikita






