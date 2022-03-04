Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5FDDC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Mar 2022 09:37:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v6uX0gylV7HJjBMMGjK6P/hAlXrfc12Sv8RRD/UBbKM=; b=msg9+cyG8xrpAo
	tLcKLAaq+brA905vWmPuquWbsy/wizPFbE0D2/2XsAGw1/cm6iDG7rANIAg9KEYYCjVse5tn1rfXM
	d/hrO2PHj+OYCN7KY85B+VbIVRc1c7AtA6nYWjFeSZXgivNLYIcGoKZrr0t0BE2u0xYOJSNrW5E3u
	fKNayWAWKjc/TnPIDJXeijFP7Gj7DA/lo0+WY3E3S83ghn3r/y69IxDmtSkxsyCIG4CrxYpdk3lzT
	bXucN4/YO8URQkuxREHf6vbtPWsCMiMPKNShS1jFuQGUB2DD6lJtG8xWeXk22sznxnKdr4UGiXCK6
	EVhcSO4PFJqZehx4agUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nQ4ND-009Kem-PT; Fri, 04 Mar 2022 09:37:19 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nQ3wj-009D4j-Er; Fri, 04 Mar 2022 09:09:59 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 3718C1F463BA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1646384996;
 bh=CcMBV0l5kr7q1bweV1wcu+vTnCpRH0j1xl0S1wsETtg=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=GP3Rqx4BysrGeC3OgIgoS8mmJ79Jx/get+EPxdvRz+sxXIL3zKMYdXtNhs/IyKBfa
 IEoUGqwEOuTeX1zhvs0c9R6Ts4h16EBjlAG5IN22qIqkSk8PqBZobCEvSS4C//gd+n
 XQzfL5K8fYBFeAyYdm4jcX9VmFpvFBn9pZN8rqhi21zsMn4r8T49kJszP9ITmaktSR
 RG82DC9HeRK/6cFuUEDMsTzkiDxTCTHGDvwboB0XYQudrqo5rwdY9AK0QHbzmbB8yp
 2n/uzvuSf3H9G8ZOCGw+LQLAspdBPE29YY9sjGtqzf64idsd5P6E1pjz1tDyVvTbKg
 hcb2yUiPR/bLw==
Message-ID: <2bdbe214-7add-f529-db8f-d0e998a540e5@collabora.com>
Date: Fri, 4 Mar 2022 10:09:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v15 00/12] Add Mediatek Soc DRM (vdosys0) support for
 mt8195
Content-Language: en-US
To: Jason-JH Lin <jason-jh.lin@mediatek.com>, Rob Herring <robh+dt@kernel.org>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, David Airlie
 <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 singo.chang@mediatek.com, Fabien Parent <fparent@baylibre.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 "roy-cw.yeh" <roy-cw.yeh@mediatek.com>, CK Hu <ck.hu@mediatek.com>,
 devicetree@vger.kernel.org, Moudy Ho <moudy.ho@mediatek.com>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>, Daniel Vetter <daniel@ffwll.ch>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 nancy.lin@mediatek.com, "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
References: <20220126071932.32615-1-jason-jh.lin@mediatek.com>
 <CAL_Jsq+6k5EqouAO2Xm=GpBz3Pi-wfB-ixGwfyC+Y+qOrjUFTg@mail.gmail.com>
 <c103927d7dbc3217431c83dc22a44c656c561228.camel@mediatek.com>
 <28098efc-1de1-b540-b1a3-bf7a92af9511@collabora.com>
 <c19b14ab9a8879fc50d8bcc87745da48491be373.camel@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <c19b14ab9a8879fc50d8bcc87745da48491be373.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220304_010957_719280_D9FB6B22 
X-CRM114-Status: GOOD (  24.05  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 04/03/22 06:26, Jason-JH Lin ha scritto:
> Hi Angelo,
> 
> Because linux-next has applied these patches:
> 
> [v15,04/12] dt-bindings: display: mediatek: dsc: add yaml for mt8195
> SoC binding
> [v15,05/12] dt-bindings: display: mediatek: merge: add additional prop
> for mt8195
> [v15,06/12] dt-bindings: display: mediatek: add mt8195 SoC binding for
> vdosys0
> [v15,03/12] dt-bindings: display: mediatek: disp: split each block to
> individual yaml
> 
> 
> I'll rebase on the latest linux-next, and then send 1 path + 1 series:
> [1] a fix up patch for all dt-schema error in each display dt-bindings
> (If Rob wants me to split this patch into separate patches for each
> file, then I'll resend it.)
> [2] a series of remaining patches of this series
> 
> 
> I would appreciate it if you would take the time to send [1] for me.
> If you can help me to send [1], please let me know.
> Thank you very much ;-)
> 
> 

I will send fixes for [1] later today.

Cheers,
Angelo

> Regards,
> Jason-JH.Lin
> 
> On Thu, 2022-03-03 at 10:31 +0100, AngeloGioacchino Del Regno wrote:
>> Il 03/03/22 05:25, Jason-JH Lin ha scritto:
>>> Hi Rob,
>>>
>>> Thanks for the reviews.
>>>
>>> On Wed, 2022-03-02 at 17:50 -0600, Rob Herring wrote:
>>>> On Wed, Jan 26, 2022 at 1:19 AM jason-jh.lin <
>>>> jason-jh.lin@mediatek.com> wrote:
>>>>>
>>>
>>> [snip]
>>>
>>
>> Hello Rob, Jason-JH,
>>
>> I have just crafted a patch that fixes everything mentioned here,
>> if it's easier like this, I can either send it for the maintainer(s)
>> to apply on top, or squash in Jason-JH's original patch.
>>
>> If you'd like to get my patch, though, I have one question:
>> this is touching literally all of the YAML files that Jason-JH is
>> introducing, so, should I send this as one patch per file (which
>> would be
>> something around 16 patches) or is just one fixing them all fine?
>>
>> Cheers,
>> Angelo
>>
>> _______________________________________________
>> Linux-mediatek mailing list
>> Linux-mediatek@lists.infradead.org
>>
> https://urldefense.com/v3/__http://lists.infradead.org/mailman/listinfo/linux-mediatek__;!!CTRNKA9wMg0ARbw!3tXE3T-t6I2GMILAOHpkTXhrLHwFAQtmhGqTBtKSY2SLWM2qBBMULlM17TtG6VwNR5yn$
>>   




_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
