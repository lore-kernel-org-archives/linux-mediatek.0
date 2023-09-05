Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B3A6C83F33
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Sep 2023 10:09:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JeYy5DBaBw/87H//oKgi0BJkmWXAXZ492o8BGSE4AU0=; b=U7dazR0j6JDcn3Lqn2MG3VkEfV
	DIMiopyVAIN3E95F7ZNRbOSxpGADMflI81gGl5bRUqfmkOGcmws9toP0fqXm6PB92aUfI9d27Z79N
	W6lfTGcmJ74xiM/M5at2H396DPJyekOrMan6gEHtsz+kqJAG58oLK5YtsoUXGMCiJOZR0CX1p1nZu
	seeB4P2Ph0a6WLcU5Cy3HytV/UTc08O5JO6AZM1z0rf8ezuWihNj6l3gacSHa3azUNkOR9KJkz+69
	o3/MA06Yl13fasOuAdg0lejkeaLgZYdWVI7BNj1XqaUqHw9Td786X3CSuxjleR9v1pntqCbGFcHHQ
	WiMiMtAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qdT0I-005fpg-0M;
	Tue, 05 Sep 2023 10:09:50 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdT0E-005fkO-08
	for linux-mediatek@lists.infradead.org;
	Tue, 05 Sep 2023 10:09:48 +0000
Received: from [192.168.1.23] (unknown [171.76.82.102])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 73F02660716C;
	Tue,  5 Sep 2023 11:09:37 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1693908581;
	bh=PHDlogbWriNpSInDU6bgIDQgv8X9PfNf4xdH4kqZ9Sk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=eQ77jxssWPUan9oBzIXWOuFcqRHIwZgu5AUK/namoH9kzlCuPUDvKCAxDWPHn9Q5+
	 D3xfI2I2zg48ZwcE0p2Wsd5JJZxOMmajFxZWcv20Yr30f3EnUFO4kBnlZT5bmmzfj+
	 PhthVN+NmbADogATjEMdgnWBQRZqoHZe4Tj6lbn1MeGwDArJ3AYlR2+cvQmpNkdOTs
	 puY18CIyqzWoC6EBwxfSYDzW7Uaf77Oa0ft/WGm49VfAF5Q1u5VH8dddlrrssR6y0f
	 0OJ7ZlIC7Xy2wvhqv1j0HR0o04z78w+PPS1skuLvbBuoP4mYovi4K88GhE+E6XJ81Q
	 /0azjpFaYmK8Q==
Message-ID: <2c812fe4-04ba-0243-5330-c7b7e695cff9@collabora.com>
Date: Tue, 5 Sep 2023 15:39:33 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 2/7] drm: ci: Force db410c to host mode
Content-Language: en-US
To: Maxime Ripard <mripard@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: dri-devel@lists.freedesktop.org, helen.koike@collabora.com,
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
From: Vignesh Raman <vignesh.raman@collabora.com>
In-Reply-To: <ueznsu2dlvq5zp3ls262fww54bnlqa3e2ssr6f65vrrionloms@ir2ywgeajj4w>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230905_030946_372081_C3BDC411 
X-CRM114-Status: GOOD (  18.85  )
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

Hi Dmitry, Maxime,

On 05/09/23 14:13, Maxime Ripard wrote:
> Hi,
> 
> On Mon, Sep 04, 2023 at 07:59:26PM +0300, Dmitry Baryshkov wrote:
>> On Mon, 4 Sept 2023 at 19:16, Vignesh Raman <vignesh.raman@collabora.com> wrote:
>>>
>>> Force db410c to host mode to fix network issue which results in failure
>>> to mount root fs via NFS.
>>> See https://gitlab.freedesktop.org/gfx-ci/linux/-/commit/cb72a629b8c15c80a54dda510743cefd1c4b65b8
>>>
>>> Use fdtoverlay command to merge base device tree with an overlay
>>> which contains the fix for USB controllers to work in host mode.
>>>
>>> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
>>> ---
>>>
>>> v2:
>>>    - Use fdtoverlay command to merge overlay dtbo with the base dtb instead of modifying the kernel sources
>>>
>>> ---
>>>   drivers/gpu/drm/ci/build.sh                         |  5 +++++
>>>   .../gpu/drm/ci/dt-overlays/apq8016-sbc-overlay.dts  | 13 +++++++++++++
>>>   2 files changed, 18 insertions(+)
>>>   create mode 100644 drivers/gpu/drm/ci/dt-overlays/apq8016-sbc-overlay.dts
>>>
>>> diff --git a/drivers/gpu/drm/ci/build.sh b/drivers/gpu/drm/ci/build.sh
>>> index 7b014287a041..92ffd98cd09e 100644
>>> --- a/drivers/gpu/drm/ci/build.sh
>>> +++ b/drivers/gpu/drm/ci/build.sh
>>> @@ -92,6 +92,11 @@ done
>>>
>>>   if [[ -n ${DEVICE_TREES} ]]; then
>>>       make dtbs
>>> +    if [[ -e arch/arm64/boot/dts/qcom/apq8016-sbc.dtb ]]; then
>>> +        dtc -@ -I dts -O dtb -o drivers/gpu/drm/ci/dt-overlays/apq8016-sbc-overlay.dtbo drivers/gpu/drm/ci/dt-overlays/apq8016-sbc-overlay.dts
>>> +        fdtoverlay -i arch/arm64/boot/dts/qcom/apq8016-sbc.dtb -o arch/arm64/boot/dts/qcom/apq8016-sbc-overlay.dtb drivers/gpu/drm/ci/dt-overlays/apq8016-sbc-overlay.dtbo
>>> +        mv arch/arm64/boot/dts/qcom/apq8016-sbc-overlay.dtb arch/arm64/boot/dts/qcom/apq8016-sbc.dtb
>>> +    fi
>>>       cp ${DEVICE_TREES} /lava-files/.
>>>   fi
>>>
>>> diff --git a/drivers/gpu/drm/ci/dt-overlays/apq8016-sbc-overlay.dts b/drivers/gpu/drm/ci/dt-overlays/apq8016-sbc-overlay.dts
>>> new file mode 100644
>>> index 000000000000..57b7604f1c23
>>> --- /dev/null
>>> +++ b/drivers/gpu/drm/ci/dt-overlays/apq8016-sbc-overlay.dts
>>> @@ -0,0 +1,13 @@
>>> +/dts-v1/;
>>> +/plugin/;
>>> +
>>> +/ {
>>> +    fragment@0 {
>>> +        target-path = "/soc@0";
>>> +        __overlay__ {
>>> +            usb@78d9000 {
>>> +                dr_mode = "host";
>>> +            };
>>> +        };
>>> +    };
>>> +};
>>> --
>>> 2.40.1
>>
>> Can we use normal dtso syntax here instead of defining fragments manually?
> 
> What Dmitry is hinting about is to use the "Sugar Syntax". There a good documentation here:
> https://source.android.com/docs/core/architecture/dto/syntax


With the below DTO syntax,
/dts-v1/;
/plugin/;

&usb {
   usb@78d9000 {
     dr_mode = "host";
   };
};

Decoded dtbo file is,
/dts-v1/;

/ {

	fragment@0 {
		target = <0xffffffff>;

		__overlay__ {

			usb@78d9000 {
				dr_mode = "host";
			};
		};
	};

	__fixups__ {
		usb = "/fragment@0:target:0";
	};
};

With the previous fix using fragment we get,
/ {

	fragment@0 {
		target-path	 = "/soc@0";

		__overlay__ {

			usb@78d9000 {
				dr_mode = "host";
			};
		};
	};
};

Decoded apq8016-sbc.dtb file with the fix (setting dr_mode to host) is,
/dts-v1/;
/ {	
	soc@0 {
		usb@78d9000 {
			dr_mode = "host";
		};	
	};
};

How can set the target to "soc@0" using the DTO syntax? Otherwise 
fdtoverlay fails to apply the dtbo file with the base dtb.

Regards,
Vignesh

