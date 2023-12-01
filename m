Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55547C10DCE
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 Dec 2023 10:09:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zKEaUiZTxlPwx3QPN7jIyXfy5Uw4NLWZUGDodKGb1pE=; b=qddKuFv43ZgI5rO7x//lhA6RkB
	O0szzwL5pcPCP1a7Td6lcWiCJALgBQRTum6U7dVImYWtOTZtpbW1brv/dH5HPFi+kJEgCyhVeaKMK
	7fzn6zMSt/viH/o/+m9UNV+TFw2rzCaX+nteiAs1qY8iQIeTYsoEYzT8S64qviXEN2QUSLcWhkslx
	4P7xuIsTkfQOMZAfoT7pzCeEyg7KSrtFc7lfHG2h2lI27eYxMfDmmn9+CT+DUCAsNmH8n3sldZbnZ
	6GFg/jiA4txQFEnhm75UNam8KM7gVNJ8klZZLdJ/7A6OYRnt/gk74IB8ohUXc/KivMTzlNJs+NmWO
	s2XnbD7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r90T4-00DAmg-08;
	Fri, 01 Dec 2023 10:09:54 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r90T1-00DAlf-0K
	for linux-mediatek@lists.infradead.org;
	Fri, 01 Dec 2023 10:09:53 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-40b4746ae51so18235155e9.2
        for <linux-mediatek@lists.infradead.org>; Fri, 01 Dec 2023 02:09:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701425388; x=1702030188; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zKEaUiZTxlPwx3QPN7jIyXfy5Uw4NLWZUGDodKGb1pE=;
        b=EWFujYkfydd8lQ6Y78N0sYpWh50l+RWJLi6fv8QEaiO3/wVijyqnSE00qq3SN1Uq9u
         QKzvricJrCYPQJNaSBn6av/cmoHXYobqB7Whfc269oKYK3eqfko79wulrGCFGviuBxtB
         0jjWAP1fn5sDaeUAZ3K96hEhQmot4Dn7PfL7r/Byd24o+Wz4/BakxwbdRtAynOQMW2zL
         xsNqtzgIbobb4mnaDSpmgPCtm1rGLhMuY1TlroskcC64vu+LrK5KcnX4BAXoUP3Qiznc
         99OOCh+rj/V2eUcqUmqKVs6VVxDLLGTwj/392gW4pShI3tqDM6eLrZsR9EEmux6/byaH
         xEsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701425388; x=1702030188;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=zKEaUiZTxlPwx3QPN7jIyXfy5Uw4NLWZUGDodKGb1pE=;
        b=uEyZDHbqycwpwD0qw8oGDlENsIo/+QBKv2Vv1KFOozEXuxzurklcR2GqBVWhunD90X
         2I9FcmKKkp/U/Vba7vvr6uOmO5M269idbCKVz7+dVXd6N+MRAFrZBbkWKlubJqKLsQdh
         QZs6yQHEV64hByEgXOY93yBzTET8a9w9hMBKywSRQQo4716V4Iz8YhjagBBofwwWm/dc
         BmRI9MGmSfKeFGDwyIOUJOlGIzTvbGZcdxbuXiCrohue1z4N5Hqcx69Mqc4P4yLcmh2J
         R3RzUTJ0XCdKxTlPB1KbJmYTb3fMItNN9Jk5nO4UHS1901N/NvjoFxNbfkZGK++td3Sz
         7gcQ==
X-Gm-Message-State: AOJu0YzOt7VjzHajbXzFaPRdJmhHwU++SW2xmEFiw5RA1hI1vQYYdmZs
	J8E4c6SSP2oHFO5zTJcF389I5Q==
X-Google-Smtp-Source: AGHT+IENK1vb/UdBtKtDFUa1ipTkO6wrV04e1mWEkYa/5zZ5tqtZqhUqsoK8aEleU+NVAlPqjr8ZMg==
X-Received: by 2002:a1c:4b14:0:b0:40b:5e59:c56d with SMTP id y20-20020a1c4b14000000b0040b5e59c56dmr298559wma.151.1701425386905;
        Fri, 01 Dec 2023 02:09:46 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:46dc:1c67:6d66:e21? ([2a01:e0a:982:cbb0:46dc:1c67:6d66:e21])
        by smtp.gmail.com with ESMTPSA id t10-20020a5d534a000000b0033326a5b01csm3125805wrv.59.2023.12.01.02.09.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Dec 2023 02:09:46 -0800 (PST)
Message-ID: <a6651f9f-b060-4195-b83a-b23aa2091a98@linaro.org>
Date: Fri, 1 Dec 2023 11:09:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v7 00/10] Enable HS-G5 support on SM8550
Content-Language: en-US, fr
To: Can Guo <quic_cang@quicinc.com>, bvanassche@acm.org, mani@kernel.org,
 adrian.hunter@intel.com, vkoul@kernel.org, beanhuo@micron.com,
 avri.altman@wdc.com, junwoo80.lee@samsung.com, martin.petersen@oracle.com
Cc: linux-scsi@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 "open list:ARM/Mediatek SoC support:Keyword:mediatek"
 <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support:Keyword:mediatek"
 <linux-arm-kernel@lists.infradead.org>,
 "moderated list:ARM/Mediatek SoC support:Keyword:mediatek"
 <linux-mediatek@lists.infradead.org>
References: <1701407001-471-1-git-send-email-quic_cang@quicinc.com>
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro Developer Services
In-Reply-To: <1701407001-471-1-git-send-email-quic_cang@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231201_020951_143699_5795F33E 
X-CRM114-Status: GOOD (  22.64  )
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
Reply-To: neil.armstrong@linaro.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 01/12/2023 06:03, Can Guo wrote:
> This series enables HS-G5 support on SM8550.
> 
> This series is rebased on below changes from Mani -
> https://patchwork.kernel.org/project/linux-scsi/patch/20230908145329.154024-1-manivannan.sadhasivam@linaro.org/
> https://patchwork.kernel.org/project/linux-scsi/patch/20230908145329.154024-2-manivannan.sadhasivam@linaro.org/
> 
> This series is tested on below HW combinations -
> SM8550 MTP + UFS4.0
> SM8550 QRD + UFS3.1
> SM8450 MTP + UFS3.1 (for regression test)
> SM8350 MTP + UFS3.1 (for regression test)
> 
> Note that during reboot test on above platforms, I occasinally hit PA (PHY)
> error during the 2nd init, this is not related with this series. A fix for
> this is mentioned in below patchwork -
> 
> https://patchwork.kernel.org/project/linux-scsi/patch/1698145815-17396-1-git-send-email-quic_ziqichen@quicinc.com/
> 
> Also note that on platforms, which have two sets of UFS PHY settings are
> provided (say G4 and no-G4, G5 and no-G5). The two sets of PHY settings are
> basically programming different values to different registers, mixing the
> two sets and/or overwriting one set with another set is definitely not
> blessed by UFS PHY designers. For SM8550, this series will make sure we
> honor the rule. However, for old targets Mani and I will fix them in
> another series in future.
> 
> v6 -> v7:
> 1. Rebased on linux-next, based SM8650 PHY settings are merged there, no changes to patches for UFS driver
> 2. Addressed comments from Mani
> 
> v5 -> v6:
> 1. Rebased on scsi-queue-6.8
> 2. Addressed comments from Dmitry and Mani in patches to phy-qcom-qmp-ufs.c
> 
> v4 -> v5:
> Removed two useless debug prints in patch #9
> 
> v3 -> v4:
> Used .tbls_hs_overlay array instead of adding more tables with different names like .tbls_hs_g5
> 
> v2 -> v3:
> 1. Addressed comments from Andrew, Mani and Bart in patch #1
> 2. Added patch #2 as per request from Andrew and Mani
> 3. Added patch #4 to fix a common issue on old targets, it is not necessary
>     for this series, but put in this series only because it would be easier
>     to maintain and no need to rebase
> 4. Addressed comments from Dmitry and Mani in patches to phy-qcom-qmp-ufs.c
> 
> v1 -> v2:
> 1. Removed 2 changes which were exposing power info in sysfs
> 2. Removed 1 change which was moving data structs to phy-qcom-qmp-ufs.h
> 3. Added one new change (the 1st one) to clean up usage of ufs_dev_params based on comments from Mani
> 4. Adjusted the logic of UFS device version detection according to comments from Mani:
> 	4.1 For HW version < 0x5, go through dual init
>   	4.2 For HW version >= 0x5
> 		a. If UFS device version is populated, one init is required
> 		b. If UFS device version is not populated, go through dual init
> 
> Bao D. Nguyen (1):
>    scsi: ufs: ufs-qcom: Add support for UFS device version detection
> 
> Can Guo (9):
>    scsi: ufs: host: Rename structure ufs_dev_params to ufs_host_params
>    scsi: ufs: ufs-qcom: No need to set hs_rate after
>      ufshcd_init_host_param()
>    scsi: ufs: ufs-qcom: Setup host power mode during init
>    scsi: ufs: ufs-qcom: Allow the first init start with the maximum
>      supported gear
>    scsi: ufs: ufs-qcom: Limit HS-G5 Rate-A to hosts with HW version 5
>    scsi: ufs: ufs-qcom: Set initial PHY gear to max HS gear for HW ver 4
>      and newer
>    scsi: ufs: ufs-qcom: Check return value of phy_set_mode_ext()
>    phy: qualcomm: phy-qcom-qmp-ufs: Rectify SM8550 UFS HS-G4 PHY Settings
>    phy: qualcomm: phy-qcom-qmp-ufs: Add High Speed Gear 5 support for
>      SM8550
> 
>   drivers/phy/qualcomm/phy-qcom-qmp-pcs-ufs-v6.h     |   2 +
>   drivers/phy/qualcomm/phy-qcom-qmp-qserdes-com-v6.h |   2 +
>   .../qualcomm/phy-qcom-qmp-qserdes-txrx-ufs-v6.h    |   9 +
>   drivers/phy/qualcomm/phy-qcom-qmp-ufs.c            | 191 ++++++++++++++++++---
>   drivers/ufs/host/ufs-exynos.c                      |   7 +-
>   drivers/ufs/host/ufs-hisi.c                        |  11 +-
>   drivers/ufs/host/ufs-mediatek.c                    |  12 +-
>   drivers/ufs/host/ufs-qcom.c                        |  97 ++++++++---
>   drivers/ufs/host/ufs-qcom.h                        |   7 +-
>   drivers/ufs/host/ufshcd-pltfrm.c                   |  69 ++++----
>   drivers/ufs/host/ufshcd-pltfrm.h                   |  10 +-
>   11 files changed, 309 insertions(+), 108 deletions(-)
> 

Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-QRD
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-QRD

Thanks,
Neil

