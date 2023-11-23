Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55129C5AD4C
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Nov 2023 07:13:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0VJUSCFC86nhWEsoZUmzHnV3pHzSA0WYPeIP78uYxwc=; b=hE8nURHrh3hosIVGWdmFCRyxwi
	GlSDfoBDr6B7/WnPTWt0aqDBdoIwLSBADZVBp6ppDgP1rU9jGTG7Or0rIzrHGWvoxwSeV/B0uCali
	E4Ch52AhZrmGI7RsnTpIrad5BacCeES5UbwxlmFVBxhOnLMm6GDqwl0O+T1NsEPl36JxMpwgiV7KT
	6iN9t6XHFAabzVc/iui6Rt2BNSkxCV0CD63DAqhFVxaogZgUksGCSYyywVoan4Yych14n3GvWgUwR
	WlUJLFl6YFFmpqi2jU2qxP0QwXceCjyX1hex5lFpS9tzfiUzEqeZSsNEb7Za08vMmRAg1fnKral1Y
	YoFeRKcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r63u9-003zct-0a;
	Thu, 23 Nov 2023 07:13:41 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r63u5-003zaF-1j;
	Thu, 23 Nov 2023 07:13:39 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AN5KDRv027150;
	Thu, 23 Nov 2023 07:13:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=0VJUSCFC86nhWEsoZUmzHnV3pHzSA0WYPeIP78uYxwc=;
 b=He5JhlMKaUHAcwox8O5Nm4t3S9dP7ZyL/l4k/Ovzx4NcLWAHxXscYPbS5x+mw+KwTuAm
 NIUIYqvEvE/R1Gdwfcv9QaHjCbh8gnzeJMUtlzGy4b6fR5CZYeGqbQitRGJ0y0D3PL5s
 eLjcXWiWcVuHIKhQAsic9dV6de0ea4xRKuAEzk6PpKgOWQ7JzCVI3HPfK/OTNj5pIbCS
 Av2YIxToSjkj2J2jt54bGnOMGv3ZkQbgKU+FqqpPdCNV4qD12lABtPGzXZoiDb+H6pk4
 X/0UDvD9Q39n9kFKrJagJM9cY4ANWS8Rnj+2q5Wkq5WFzarMav/ky9z/1H72NoVvQ3bn DA== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3uhf66an40-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Nov 2023 07:13:17 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3AN7DGqs010416
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Nov 2023 07:13:16 GMT
Received: from [10.253.15.194] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Wed, 22 Nov
 2023 23:13:13 -0800
Message-ID: <9c95987a-8147-4cfa-917a-a609967706f4@quicinc.com>
Date: Thu, 23 Nov 2023 15:13:09 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/11] Enable HS-G5 support on SM8550
To: Andrew Halaney <ahalaney@redhat.com>
CC: <bvanassche@acm.org>, <mani@kernel.org>, <stanley.chu@mediatek.com>,
        <adrian.hunter@intel.com>, <beanhuo@micron.com>, <avri.altman@wdc.com>,
        <junwoo80.lee@samsung.com>, <martin.petersen@oracle.com>,
        Matthias Brugger
	<matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>,
        "open list:ARM/Mediatek SoC
 support" <linux-kernel@vger.kernel.org>,
        "moderated list:ARM/Mediatek SoC
 support" <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/Mediatek
 SoC support" <linux-mediatek@lists.infradead.org>
References: <1700637042-11104-1-git-send-email-quic_cang@quicinc.com>
 <gkqaea2bh3pylqmhxpld5cdtfrejzssvqejb6ti7q3ekocgiol@mfngbj5dmcfz>
Content-Language: en-US
From: Can Guo <quic_cang@quicinc.com>
In-Reply-To: <gkqaea2bh3pylqmhxpld5cdtfrejzssvqejb6ti7q3ekocgiol@mfngbj5dmcfz>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: N0cS1x-ZCyfTOcis68Dgx9JZq6DG9SWb
X-Proofpoint-GUID: N0cS1x-ZCyfTOcis68Dgx9JZq6DG9SWb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-23_03,2023-11-22_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 clxscore=1015 bulkscore=0 mlxlogscore=999 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0
 impostorscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2311060000 definitions=main-2311230049
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231122_231337_691562_19CD9B78 
X-CRM114-Status: GOOD (  26.95  )
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



On 11/23/2023 12:17 AM, Andrew Halaney wrote:
> On Tue, Nov 21, 2023 at 11:10:31PM -0800, Can Guo wrote:
>> This series enables HS-G5 support on SM8550.
>>
>> This series is rebased on below changes from Mani -
>> https://patchwork.kernel.org/project/linux-scsi/patch/20230908145329.154024-1-manivannan.sadhasivam@linaro.org/
>> https://patchwork.kernel.org/project/linux-scsi/patch/20230908145329.154024-2-manivannan.sadhasivam@linaro.org/
>>
>> This series is tested on below HW combinations -
>> SM8550 MTP + UFS4.0
>> SM8550 QRD + UFS3.1
>> SM8450 MTP + UFS3.1 (for regression test)
>> SM8350 MTP + UFS3.1 (for regression test)
>>
>> Note that during reboot test on above platforms, I occasinally hit PA (PHY)
>> error during the 2nd init, this is not related with this series. A fix for
>> this is mentioned in below patchwork -
>>
>> https://patchwork.kernel.org/project/linux-scsi/patch/1698145815-17396-1-git-send-email-quic_ziqichen@quicinc.com/
>>
>> Also note that on platforms, which have two sets of UFS PHY settings are
>> provided (say G4 and no-G4, G5 and no-G5). The two sets of PHY settings are
>> basically programming different values to different registers, mixing the
>> two sets and/or overwriting one set with another set is definitely not
>> blessed by UFS PHY designers. For SM8550, this series will make sure we
>> honor the rule. However, for old targets Mani and I will fix them in
>> another series in future.
>>
>> v2 -> v3:
>> 1. Addressed comments from Andrew, Mani and Bart in patch #1
>> 2. Added patch #2 as per request from Andrew and Mani
>> 3. Added patch #4 to fix a common issue on old targets, it is not necessary
>>     for this series, but put in this series only because it would be easier
>>     to maintain and no need to rebase
>> 4. Addressed comments from Dmitry and Mani in patches to phy-qcom-qmp-ufs.c
>>
>> v1 -> v2:
>> 1. Removed 2 changes which were exposing power info in sysfs
>> 2. Removed 1 change which was moving data structs to phy-qcom-qmp-ufs.h
>> 3. Added one new change (the 1st one) to clean up usage of ufs_dev_params based on comments from Mani
>> 4. Adjusted the logic of UFS device version detection according to comments from Mani:
>> 	4.1 For HW version < 0x5, go through dual init
>>   	4.2 For HW version >= 0x5
>> 		a. If UFS device version is populated, one init is required
>> 		b. If UFS device version is not populated, go through dual init
> 
> The cover letter didn't include linux-arm-msm@vger.kernel.org, which
> made me have to go searching for this on lore to see what had changed
> in the rest of the series I received as a member of that mailing list.
> 

Sorry for the inconvenience.

> Going forward please try and include that mailing list!

Sure, will do.

Thanks,
Can Guo.
> 
>>
>> Bao D. Nguyen (1):
>>    scsi: ufs: ufs-qcom: Add support for UFS device version detection
>>
>> Can Guo (10):
>>    scsi: ufs: host: Rename structure ufs_dev_params to ufs_host_params
>>    scsi: ufs: ufs-qcom: No need to set hs_rate after
>>      ufshcd_init_host_param()
>>    scsi: ufs: ufs-qcom: Setup host power mode during init
>>    scsi: ufs: ufs-qcom: Limit negotiated gear to selected PHY gear
>>    scsi: ufs: ufs-qcom: Allow the first init start with the maximum
>>      supported gear
>>    scsi: ufs: ufs-qcom: Limit HS-G5 Rate-A to hosts with HW version 5
>>    scsi: ufs: ufs-qcom: Set initial PHY gear to max HS gear for HW ver 5
>>      and newer
>>    phy: qualcomm: phy-qcom-qmp-ufs: Rectify SM8550 UFS HS-G4 PHY Settings
>>    phy: qualcomm: phy-qcom-qmp-ufs: Use tbls_hs_max instead of tbls_hs_g4
>>    phy: qualcomm: phy-qcom-qmp-ufs: Add High Speed Gear 5 support for
>>      SM8550
>>
>>   drivers/phy/qualcomm/phy-qcom-qmp-pcs-ufs-v6.h     |   2 +
>>   drivers/phy/qualcomm/phy-qcom-qmp-qserdes-com-v6.h |   2 +
>>   .../qualcomm/phy-qcom-qmp-qserdes-txrx-ufs-v6.h    |  12 ++
>>   drivers/phy/qualcomm/phy-qcom-qmp-ufs.c            | 171 ++++++++++++++++-----
>>   drivers/ufs/host/ufs-exynos.c                      |   7 +-
>>   drivers/ufs/host/ufs-hisi.c                        |  11 +-
>>   drivers/ufs/host/ufs-mediatek.c                    |  12 +-
>>   drivers/ufs/host/ufs-qcom.c                        |  92 ++++++++---
>>   drivers/ufs/host/ufs-qcom.h                        |   5 +-
>>   drivers/ufs/host/ufshcd-pltfrm.c                   |  69 ++++-----
>>   drivers/ufs/host/ufshcd-pltfrm.h                   |  10 +-
>>   11 files changed, 275 insertions(+), 118 deletions(-)
>>
>> -- 
>> 2.7.4
>>
>>
>> _______________________________________________
>> linux-arm-kernel mailing list
>> linux-arm-kernel@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
> 

