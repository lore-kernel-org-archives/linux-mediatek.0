Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 894D2C001E0
	for <linux-mediatek@archiver.kernel.org>; Sat, 22 Jul 2023 01:30:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YvapDlgEUzhYWt9kSo8gs1KQpSfobdwO/63wrHbPhWU=; b=y/dJI14nr02Etj4Kt1hVye0LjJ
	XA9y80Y09OGmnAXPXFRFFpnlTu36drHQnv/+kPKvWfODq1ihLscHHIBdvdmLimPvHx8bnfeL4UXEM
	KMuehxLx3SUE7TWd7IVJowqhnd1qSTEzq62IuyXKILySNJ+MoY7Mrs9kcqfwR6Bc9BIfmCldvtf4j
	bkWjLYtaL1FNMxFmWm0ZgJY15P6jUN/KphQhrdhxTXywclh5/wyI21X2r6KeHevwpr/x/SFnve85B
	Do7EzTAnHWkrrh/xG3p+b1p3otzNFgjb0AGydhxSy3iENLsYaHrGL3wLPdf2angeqlijlX8W51a8M
	77AuFMcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qN1RX-00FXUX-1R;
	Sat, 22 Jul 2023 01:29:59 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qN1RL-00FXQu-1i;
	Sat, 22 Jul 2023 01:29:49 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36M1RjGa015517;
	Sat, 22 Jul 2023 01:29:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=YvapDlgEUzhYWt9kSo8gs1KQpSfobdwO/63wrHbPhWU=;
 b=csljY8xGK+xqVZd9kL9pb1hsEQS9UU02KLfZ7LjBQU+8xp/QkTeyqMVgLT+RfJgsSmbv
 NNq7U4CqUNqBoiyV8+ovGLlM6surnstAdWBmRT0V0TbP5KfGmx8NsOeauf7pnck7gspB
 0rtpquf2QMwDDfh0AoN+qWLHTHiLii7bh8Ux5X7qOWTzrlybTOrt8dtRr0Z2FYQT+pk7
 ddMXf2SbkElQaVWC8NZBvdE2WO8DLFjSTc58XYAm42QMqemfByKfagPNqDmE9GHAXZiP
 v91Uy/FGSfwbG95fDDGqjhtrSk+BVzMa3LtWhcnrd+Njaxa1d9vuykDVxh13I4GkmS5B zg== 
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ryfyf2sqf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 22 Jul 2023 01:29:30 +0000
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 36M1TLt0013205
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 22 Jul 2023 01:29:21 GMT
Received: from [10.110.24.156] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Fri, 21 Jul
 2023 18:29:19 -0700
Message-ID: <ed76cf3a-cf53-03ae-ef64-0f94ecb51242@quicinc.com>
Date: Fri, 21 Jul 2023 18:29:19 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v4 2/9] virt: geniezone: Add GenieZone hypervisor support
Content-Language: en-US
To: =?UTF-8?B?WWktRGUgV3UgKOWQs+S4gOW+tyk=?= <Yi-De.Wu@mediatek.com>,
        "corbet@lwn.net" <corbet@lwn.net>,
        "angelogioacchino.delregno@collabora.com"
	<angelogioacchino.delregno@collabora.com>,
        "krzysztof.kozlowski@linaro.org"
	<krzysztof.kozlowski@linaro.org>,
        "catalin.marinas@arm.com"
	<catalin.marinas@arm.com>,
        =?UTF-8?B?WWluZ3NoaXVhbiBQYW4gKOa9mOepjui7kik=?=
	<Yingshiuan.Pan@mediatek.com>,
        "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>,
        "arnd@arndb.de" <arnd@arndb.de>,
        =?UTF-8?B?WmUteXUgV2FuZyAo546L5r6k5a6HKQ==?= <Ze-yu.Wang@mediatek.com>,
        "will@kernel.org" <will@kernel.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        =?UTF-8?B?TVkgQ2h1YW5nICjojormmI7ouo0p?= <MY.Chuang@mediatek.com>,
        "conor.dooley@microchip.com" <conor.dooley@microchip.com>,
        =?UTF-8?B?UGVpTHVuIFN1ZWkgKOmai+WfueWAqyk=?= <PeiLun.Suei@mediatek.com>,
        =?UTF-8?B?TGlqdS1jbHIgQ2hlbiAo6Zmz6bqX5aaCKQ==?=
	<Liju-clr.Chen@mediatek.com>,
        =?UTF-8?B?SmFkZXMgU2hpaCAo5pa95ZCR546oKQ==?=
	<jades.shih@mediatek.com>,
        "conor+dt@kernel.org" <conor+dt@kernel.org>,
        "dbrazdil@google.com" <dbrazdil@google.com>,
        "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
        "krzysztof.kozlowski+dt@linaro.org"
	<krzysztof.kozlowski+dt@linaro.org>,
        =?UTF-8?B?U2hhd24gSHNpYW8gKOiVreW/l+elpSk=?= <shawn.hsiao@mediatek.com>,
        "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        =?UTF-8?B?SXZhbiBUc2VuZyAo5pu+5b+X6LuSKQ==?= <ivan.tseng@mediatek.com>,
        =?UTF-8?B?Q2hpLXNoZW4gWWVoICjokYnlpYfou5Ip?= <Chi-shen.Yeh@mediatek.com>
References: <20230609085214.31071-1-yi-de.wu@mediatek.com>
 <20230609085214.31071-3-yi-de.wu@mediatek.com>
 <2fe0c7f9-55fc-ae63-3631-8526a0212ccd@linaro.org>
 <ea531ba80db67cccb03ea173e714fe868f869e91.camel@mediatek.com>
From: Trilok Soni <quic_tsoni@quicinc.com>
In-Reply-To: <ea531ba80db67cccb03ea173e714fe868f869e91.camel@mediatek.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: KmU9ARhqeji_KEvAO7GLvlFq471SDz7_
X-Proofpoint-ORIG-GUID: KmU9ARhqeji_KEvAO7GLvlFq471SDz7_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-21_12,2023-07-20_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 spamscore=0
 mlxscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 clxscore=1011 malwarescore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2307220011
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230721_182947_575997_AD39FADE 
X-CRM114-Status: GOOD (  23.17  )
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

On 7/21/2023 1:46 AM, Yi-De Wu (吳一德) wrote:
> On Fri, 2023-06-09 at 17:22 +0200, Krzysztof Kozlowski wrote:
>>   	
>> External email : Please do not click links or open attachments until
>> you have verified the sender or the content.
>>   On 09/06/2023 10:52, Yi-De Wu wrote:
>>> From: "Yingshiuan Pan" <yingshiuan.pan@mediatek.com>
>>>
>>> GenieZone is MediaTek hypervisor solution, and it is running in EL2
>>> stand alone as a type-I hypervisor. This patch exports a set of
>> ioctl
>>> interfaces for userspace VMM (e.g., crosvm) to operate guest VMs
>>> lifecycle (creation and destroy) on GenieZone.
>>
>> ...
>>
>>> +static int gzvm_drv_probe(void)
>>> +{
>>> +int ret;
>>> +
>>> +if (gzvm_arch_probe() != 0) {
>>> +pr_err("Not found available conduit\n");
>>> +return -ENODEV;
>>> +}
>>> +
>>> +ret = misc_register(&gzvm_dev);
>>> +if (ret)
>>> +return ret;
>>> +gzvm_debug_dev = &gzvm_dev;
>>> +
>>> +return 0;
>>> +}
>>> +
>>> +static int gzvm_drv_remove(void)
>>> +{
>>> +destroy_all_vm();
>>> +misc_deregister(&gzvm_dev);
>>> +return 0;
>>> +}
>>> +
>>> +static int gzvm_dev_init(void)
>>> +{
>>> +return gzvm_drv_probe();
>>
>> So for every system and architecture you want to: probe, run some SMC
>> and then print error that it is not othe system you wanted.
>>
>> I don't think this is what we want. You basically pollute all of
>> other
>> users just to have your hypervisor guest additions...
>>
>>
>> Best regards,
>> Krzysztof
> 
> 
> hi Krzysztof,
> 
> After some back-and-forth discussion[1][2][3][4][5], we'd like to bring
> bakc all the attension of related issues in this thread.
> 
> We're going to restore the dt solution on our next version, which means
> we would maintain a simple dt for discovering the hypervisor node and
> probe for the status of the device when needed.

.. see the comment below.

> 
> The reasons are listed below for the record.
> - Although dt is for hardware, it's difficult to discover a specific
> hypervisor without probing on all subsystem and thus pollute all of
> other users[4] as a consequence.

I don't understand. Patches will help here to understand what exactly 
you are referring here.

> - The GenieZone hypervisor could be considered as a vendor model to
> assist platform virtualization whose implementation is independent from
> Linuxism.

Then why we are adding this hypervisor support in Linux?

> 
> Please let us if there're any other concerns.
> 
> Reference
> 
> [1]
> https://android-review.googlesource.com/c/kernel/common/+/2447547/comment/495502f3_bb52344b/

Why we look at the ACK patches here on the LKML? Please submit them here 
if you would like to discuss and review?

---Trilok Soni



