Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC5FEC83F33
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Sep 2023 13:37:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gXQfvLzKvYkYTBHwulOoMVH070cLim80wbW8raxPUIs=; b=T3Qr47twHy2I19mZrzwQ2KWgf1
	Q2PBIfUlaCP7w3pE7UFY+0baVeaSS3pD1/rNqB4+reSSKMMnrQc5K7pyRUI6xBEhAJIcRkzSpwPI4
	K8Ntt/Ny7LlyhZRbY2bgYAueD8r0MccUa0ZR0qAlpMXj1c02RIiQzXrxKtM/3P1tAhrMjbNnr6ThP
	5ht6J4FFW7utBUs0gfl+FHr5LTIMel7PtaG9sEQzlDEd5pMJq1SLerilIGR1JUTtLPzCKR6+3yeVf
	IMtNq6myAzvdzrXuNSL1bVLxFZPPOLVQxin2deV+2RDjcxeHLuq3gB+cpX29+Wyej9gQ4+Hbwhzf8
	1G9XtiiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qdWEr-0066eG-26;
	Tue, 05 Sep 2023 13:37:05 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdWEl-0066dP-2F
	for linux-mediatek@lists.infradead.org;
	Tue, 05 Sep 2023 13:37:02 +0000
Received: from [192.168.1.23] (unknown [171.76.82.102])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 8925A66028F5;
	Tue,  5 Sep 2023 14:36:49 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1693921014;
	bh=Jrym+Ky16xApwfLUAeFb6AP634wzyVW+sZXlItpUeVA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=C8/+a4DuIQRb0J3o7lNrwSoVRG1+YurJ+S/AWRRmeXMd6FpAVrzaW+mkXBemfTWOM
	 Vz+5vKLJX8hhwhW1eJ4xEUo4DFoVXahuSO1Xf5IC09U2tNkWsHKNys/6IDUCdSUgCV
	 +VxNygTXoEfwohPaZqbsGtSw7MECBECFl2Eo962KXal/5SaLmx5SUCNIeWdyMDgE0V
	 LMh++CG+U3jtZ7OPTRHukHPMyyocraqM7ScRkm7BsXzIugmxRFezrxObEIBt4oE1G0
	 FZi3cUJVFHx9tcJhULppHUI0VyUqFcx8+HjU3XQH2edua5LgoE81hSBjyuUnMTaUEo
	 zcujGn0lBtVAQ==
Message-ID: <427ceb32-054f-41ff-df95-446b18aa178f@collabora.com>
Date: Tue, 5 Sep 2023 19:06:43 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 2/7] drm: ci: Force db410c to host mode
Content-Language: en-US
To: Maxime Ripard <mripard@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 dri-devel@lists.freedesktop.org, helen.koike@collabora.com,
 guilherme.gallo@collabora.com, sergi.blanch.torne@collabora.com,
 david.heidelberg@collabora.com, daniels@collabora.com,
 gustavo.padovan@collabora.com, emma@anholt.net, robclark@freedesktop.org,
 robdclark@google.com, anholt@google.com, robdclark@gmail.com,
 airlied@gmail.com, daniel@ffwll.ch, jani.nikula@linux.intel.com,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 virtualization@lists.linux-foundation.org, linux-arm-msm@vger.kernel.org
References: <20230904161516.66751-1-vignesh.raman@collabora.com>
 <20230904161516.66751-3-vignesh.raman@collabora.com>
 <CAA8EJpq_cmFQ6TGy1xELh3ButWKLfSkQcp5ix049s_iqKw6DvQ@mail.gmail.com>
 <ueznsu2dlvq5zp3ls262fww54bnlqa3e2ssr6f65vrrionloms@ir2ywgeajj4w>
 <2c812fe4-04ba-0243-5330-c7b7e695cff9@collabora.com>
 <2jz6wurh6ejbaejwtb5r5gukjuw4zs7ujk5hbwfpsn26o6esqe@g2nnb2gjpnjp>
 <CAA8EJpoGoopP64T1nm1ye1ukTwT=u+LYY1ubQG-9dQ-j41iHiA@mail.gmail.com>
 <6be5f5d8-8940-c79b-4a01-3f3d73641e4e@collabora.com>
 <ktikqf5hu2dmqb4p7dvrqv2tjm565qn3qu2gggrvncfu47l23j@o6t2rnpbya3x>
From: Vignesh Raman <vignesh.raman@collabora.com>
In-Reply-To: <ktikqf5hu2dmqb4p7dvrqv2tjm565qn3qu2gggrvncfu47l23j@o6t2rnpbya3x>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230905_063659_858135_EBF13F6B 
X-CRM114-Status: GOOD (  10.74  )
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

Hi Maxime,

On 05/09/23 17:27, Maxime Ripard wrote:
> On Tue, Sep 05, 2023 at 05:11:43PM +0530, Vignesh Raman wrote:
>>>> Also, that node actually has a label ("usb"), defined here:
>>>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm64/boot/dts/qcom/msm8916.dtsi#n2322
>>>>
>>>> So you can end up with
>>>>
>>>> &usb {
>>>>           dr_mode = "host";
>>>> };
>>>
>>> ... which is the simplest and thus more robust one.
>>>
>>
>> Should it be,
>> &{/soc@0/usb} {
>> 	dr_mode = "host";
>> };
> 
> No. The &{/...} syntax refers to a path. &... refers to a label. They
> are not equivalent.

Sorry I was not clear before.

With,
&usb {
	dr_mode = "host";
};

The target is <0xffffffff> and fdtoverlay fails to apply the dtbo.

With,
&{/soc@0/usb} {
          dr_mode = "host";
};

The target-path is "/soc@0/usb" (usb: usb@78d9000)

/ {

	fragment@0 {
		target-path = "/soc@0/usb";

		__overlay__ {
			dr_mode = "host";
		};
	};
};

So will use  &{/...} syntax in this case.

Regards,
Vignesh

