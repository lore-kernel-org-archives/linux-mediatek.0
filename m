Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B926BC83F3E
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Sep 2023 11:42:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oejms6sjOw2f2tsDheiIr4GV637luTd+FS7VH/lO1uc=; b=tzuY3UOJaw25E4CNnw5zEBKX/y
	Q87X991IHXST62HARIrGDoTlSY7Xao1J5MxGtl7fS0gosuEdLhsdREin9CovbVnw/v4l+nKWcZPkT
	t05/E2uxlJx+cBoendZBgrVipsciVwwesFZIYSaqN2X/0kjtJiRacvt8r+SX01fhX2AnZv/JE83lk
	1Ch2t6tVIllbdZshgHgp4/mGqzy38cHm8qdFc3zfvVRIooy2suhpXE/nDjfMKq7vVZioippeq426N
	EXcA6pYLZexhEHNDYsdcBEPogv08VqzTqoKFZOfNAWaK6w1ipPoM5IQumLDw52tiP0TDmH1BCW59k
	6x0SHvJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qdURT-005vbp-37;
	Tue, 05 Sep 2023 11:41:59 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdURQ-005vb9-1r
	for linux-mediatek@lists.infradead.org;
	Tue, 05 Sep 2023 11:41:58 +0000
Received: from [192.168.1.23] (unknown [171.76.82.102])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id EBCCA66071FD;
	Tue,  5 Sep 2023 12:41:48 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1693914113;
	bh=Wdvv7kzQnQGD3G2x32niCSAkLAytXs7VXpn7J1J1VkM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=AW9E55wOUkgs71c5ftwkfCTT9m2IIE6VwkCCx2or0kc4A3xemZumoehIE8+q0uJUv
	 +z1Ibrc02A78fJGFDqZYShdYrA2c1l80BkjZlxwhI8h4WjTuEZG/7zyhlJW1YNbadz
	 fu3ifByxt982jgr8NiQLTkwp7YDt6eeyzmQcdPDmJNYBwqhM0Y/ejYakBToaiwWPVZ
	 beL+KiLptHsoQRw9a5rt6Oqz8CrirmQ8dVizMW2okVJB0tGVxMIBxRXVixfzOqIUZD
	 zEkwNlRzQYyRZD2CM48lUz281JepakgYMCSZ724OoW3YYJApAjIhWESDj/0LFL6ujx
	 qeCsD+pufKtBg==
Message-ID: <6be5f5d8-8940-c79b-4a01-3f3d73641e4e@collabora.com>
Date: Tue, 5 Sep 2023 17:11:43 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 2/7] drm: ci: Force db410c to host mode
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Maxime Ripard <mripard@kernel.org>
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
 <2c812fe4-04ba-0243-5330-c7b7e695cff9@collabora.com>
 <2jz6wurh6ejbaejwtb5r5gukjuw4zs7ujk5hbwfpsn26o6esqe@g2nnb2gjpnjp>
 <CAA8EJpoGoopP64T1nm1ye1ukTwT=u+LYY1ubQG-9dQ-j41iHiA@mail.gmail.com>
From: Vignesh Raman <vignesh.raman@collabora.com>
In-Reply-To: <CAA8EJpoGoopP64T1nm1ye1ukTwT=u+LYY1ubQG-9dQ-j41iHiA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230905_044156_909042_9D6608E8 
X-CRM114-Status: GOOD (  20.61  )
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

On 05/09/23 16:40, Dmitry Baryshkov wrote:
> On Tue, 5 Sept 2023 at 14:00, Maxime Ripard <mripard@kernel.org> wrote:
>>
>> On Tue, Sep 05, 2023 at 03:39:33PM +0530, Vignesh Raman wrote:
>>> Hi Dmitry, Maxime,
>>>
>>> On 05/09/23 14:13, Maxime Ripard wrote:
>>>> Hi,
>>>>
>>>> On Mon, Sep 04, 2023 at 07:59:26PM +0300, Dmitry Baryshkov wrote:
>>>>> On Mon, 4 Sept 2023 at 19:16, Vignesh Raman <vignesh.raman@collabora.com> wrote:
>>>>>>
>>>>>> Force db410c to host mode to fix network issue which results in failure
>>>>>> to mount root fs via NFS.
>>>>>> See https://gitlab.freedesktop.org/gfx-ci/linux/-/commit/cb72a629b8c15c80a54dda510743cefd1c4b65b8
>>>>>>
>>>>>> Use fdtoverlay command to merge base device tree with an overlay
>>>>>> which contains the fix for USB controllers to work in host mode.
>>>>>>
>>>>>> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
>>>>>> ---
>>>>>>
>>>>>> v2:
>>>>>>     - Use fdtoverlay command to merge overlay dtbo with the base dtb instead of modifying the kernel sources
>>>>>>
>>>>>> ---
>>>>>>    drivers/gpu/drm/ci/build.sh                         |  5 +++++
>>>>>>    .../gpu/drm/ci/dt-overlays/apq8016-sbc-overlay.dts  | 13 +++++++++++++
>>>>>>    2 files changed, 18 insertions(+)
>>>>>>    create mode 100644 drivers/gpu/drm/ci/dt-overlays/apq8016-sbc-overlay.dts
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/ci/build.sh b/drivers/gpu/drm/ci/build.sh
>>>>>> index 7b014287a041..92ffd98cd09e 100644
>>>>>> --- a/drivers/gpu/drm/ci/build.sh
>>>>>> +++ b/drivers/gpu/drm/ci/build.sh
>>>>>> @@ -92,6 +92,11 @@ done
>>>>>>
>>>>>>    if [[ -n ${DEVICE_TREES} ]]; then
>>>>>>        make dtbs
>>>>>> +    if [[ -e arch/arm64/boot/dts/qcom/apq8016-sbc.dtb ]]; then
>>>>>> +        dtc -@ -I dts -O dtb -o drivers/gpu/drm/ci/dt-overlays/apq8016-sbc-overlay.dtbo drivers/gpu/drm/ci/dt-overlays/apq8016-sbc-overlay.dts
>>>>>> +        fdtoverlay -i arch/arm64/boot/dts/qcom/apq8016-sbc.dtb -o arch/arm64/boot/dts/qcom/apq8016-sbc-overlay.dtb drivers/gpu/drm/ci/dt-overlays/apq8016-sbc-overlay.dtbo
>>>>>> +        mv arch/arm64/boot/dts/qcom/apq8016-sbc-overlay.dtb arch/arm64/boot/dts/qcom/apq8016-sbc.dtb
>>>>>> +    fi
>>>>>>        cp ${DEVICE_TREES} /lava-files/.
>>>>>>    fi
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/ci/dt-overlays/apq8016-sbc-overlay.dts b/drivers/gpu/drm/ci/dt-overlays/apq8016-sbc-overlay.dts
>>>>>> new file mode 100644
>>>>>> index 000000000000..57b7604f1c23
>>>>>> --- /dev/null
>>>>>> +++ b/drivers/gpu/drm/ci/dt-overlays/apq8016-sbc-overlay.dts
>>>>>> @@ -0,0 +1,13 @@
>>>>>> +/dts-v1/;
>>>>>> +/plugin/;
>>>>>> +
>>>>>> +/ {
>>>>>> +    fragment@0 {
>>>>>> +        target-path = "/soc@0";
>>>>>> +        __overlay__ {
>>>>>> +            usb@78d9000 {
>>>>>> +                dr_mode = "host";
>>>>>> +            };
>>>>>> +        };
>>>>>> +    };
>>>>>> +};
>>>>>> --
>>>>>> 2.40.1
>>>>>
>>>>> Can we use normal dtso syntax here instead of defining fragments manually?
>>>>
>>>> What Dmitry is hinting about is to use the "Sugar Syntax". There a good documentation here:
>>>> https://source.android.com/docs/core/architecture/dto/syntax
>>>
>>>
>>> With the below DTO syntax,
>>> /dts-v1/;
>>> /plugin/;
>>>
>>> &usb {
>>>    usb@78d9000 {
>>>      dr_mode = "host";
>>>    };
>>> };
>>>
>>> Decoded dtbo file is,
>>> /dts-v1/;
>>>
>>> / {
>>>
>>>        fragment@0 {
>>>                target = <0xffffffff>;
>>>
>>>                __overlay__ {
>>>
>>>                        usb@78d9000 {
>>>                                dr_mode = "host";
>>>                        };
>>>                };
>>>        };
>>>
>>>        __fixups__ {
>>>                usb = "/fragment@0:target:0";
>>>        };
>>> };
>>>
>>> With the previous fix using fragment we get,
>>> / {
>>>
>>>        fragment@0 {
>>>                target-path      = "/soc@0";
>>>
>>>                __overlay__ {
>>>
>>>                        usb@78d9000 {
>>>                                dr_mode = "host";
>>>                        };
>>>                };
>>>        };
>>> };
>>>
>>> Decoded apq8016-sbc.dtb file with the fix (setting dr_mode to host) is,
>>> /dts-v1/;
>>> / {
>>>        soc@0 {
>>>                usb@78d9000 {
>>>                        dr_mode = "host";
>>>                };
>>>        };
>>> };
>>>
>>> How can set the target to "soc@0" using the DTO syntax?
>>
>> To strictly answer your question, that would be something like
>>
>> &{/soc@0} {
>>          usb@78d9000 {
>>                  dr_mode = "host";
>>          };
>> };
>>
>> You can simplify this further however by doing:
>>
>>
>> &{/soc@0/usb@78d9000} {
>>          dr_mode = "host";
>> };

The above works. Thanks.

>>
>> Also, that node actually has a label ("usb"), defined here:
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm64/boot/dts/qcom/msm8916.dtsi#n2322
>>
>> So you can end up with
>>
>> &usb {
>>          dr_mode = "host";
>> };
> 
> ... which is the simplest and thus more robust one.
> 

Should it be,
&{/soc@0/usb} {
	dr_mode = "host";
};

I will send a v3 version for this. Thank you.

Regards,
Vignesh

