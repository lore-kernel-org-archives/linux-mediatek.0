Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2675C07E9D
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Sep 2022 21:34:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f2oVW5cv920HtluzlojR1Lmu74tSl8qrPKw3Uc0zNRA=; b=znXyH2PmfZVXl03IbicGwbinio
	fmoefa12cPDKACl9v2TPKQ7yN8DB4p3b045oKeFd29zghByOxVpvsUsx97ue6udlJdbSstlChiWW2
	aVoD5FR4k+aGkkve+gVU+u7ifFb5f9HX9s11d1DxMPVrtvc9UT4lawGTht4i6/tqw7Dbn9KVPqQMt
	PsxrkBeTHrFVabo/hJhS/L3LBOXTkYjH5YujZ86IJTmy/eLITKkIVw3+Y7vQK9EX6CniAmq/WjR6a
	uORXN4uCfaGKX7wAwRnnAf71xvhvmcWqIGdkFgDbxND0tHKh7bbw8z1RNTwhm0tPD2mhoBns/Rirz
	ahQ3iqoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ocvkU-006xIv-UI; Mon, 26 Sep 2022 21:34:46 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ocvkH-006xEq-Du; Mon, 26 Sep 2022 21:34:34 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28QLMLlw026751;
	Mon, 26 Sep 2022 21:34:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=date : from : to :
 cc : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=qcppdkim1; bh=f2oVW5cv920HtluzlojR1Lmu74tSl8qrPKw3Uc0zNRA=;
 b=XtRrgQJiv2OAKKUVLos7UsrYBHpfrT+ifm4SLHdo/kqgMtD7NEAiK04ow7VbFtLjWaUX
 /SFaOFYKIVxlmTKfK8fF3ti7hcd8Ur/8fudeQO20duxa1LpEbQHqj3l++/DdS4BgsUzH
 4XJAcWbUQyM/yiHg5k5PC+qu0wrYIs+uo+WSAIzWZQvFn0xri7MnHRgDZAj8bP1dk7K6
 3a1D+OICEIiY0VXBYWfWTTsgIQ6u4k2aQ2jA11+HM1pzF7n9/G7Q9cJlV8LiZ/dnExBL
 MPYGx+2l9TVapbd5UiO7eExBUGo7YGVEmmcY9doq8ZxNUuld0s0kKK+Zb7oPi0rD1a1Y cg== 
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3jsq8vmufa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Sep 2022 21:34:14 +0000
Received: from nasanex01a.na.qualcomm.com ([10.52.223.231])
	by NASANPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 28QLYD49032298
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Sep 2022 21:34:13 GMT
Received: from asutoshd-linux1.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.29; Mon, 26 Sep 2022 14:34:13 -0700
Date: Mon, 26 Sep 2022 14:34:13 -0700
From: Asutosh Das <quic_asutoshd@quicinc.com>
To: Avri Altman <Avri.Altman@wdc.com>
CC: "mani@kernel.org" <mani@kernel.org>,
        "quic_nguyenb@quicinc.com"
	<quic_nguyenb@quicinc.com>,
        "quic_xiaosenh@quicinc.com"
	<quic_xiaosenh@quicinc.com>,
        "quic_cang@quicinc.com" <quic_cang@quicinc.com>,
        "quic_nitirawa@quicinc.com" <quic_nitirawa@quicinc.com>,
        "quic_rampraka@quicinc.com" <quic_rampraka@quicinc.com>,
        "quic_richardp@quicinc.com" <quic_richardp@quicinc.com>,
        "stanley.chu@mediatek.com" <stanley.chu@mediatek.com>,
        "adrian.hunter@intel.com" <adrian.hunter@intel.com>,
        "bvanassche@acm.org"
	<bvanassche@acm.org>,
        "beanhuo@micron.com" <beanhuo@micron.com>,
        "martin.petersen@oracle.com" <martin.petersen@oracle.com>,
        "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
        Alim Akhtar
	<alim.akhtar@samsung.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        open list
	<linux-kernel@vger.kernel.org>,
        "moderated list:ARM/Mediatek SoC support"
	<linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC
 support" <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH v1 02/16] ufs: core: Introduce Multi-circular queue
 capability
Message-ID: <20220926213413.GD15228@asutoshd-linux1.qualcomm.com>
References: <cover.1663894792.git.quic_asutoshd@quicinc.com>
 <fa3d70c1642c64ce75461f630eabe84b3b974d4e.1663894792.git.quic_asutoshd@quicinc.com>
 <DM6PR04MB6575F55C0A33C049E22C72B6FC509@DM6PR04MB6575.namprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <DM6PR04MB6575F55C0A33C049E22C72B6FC509@DM6PR04MB6575.namprd04.prod.outlook.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 5dXhM2cb4YyM6u6yv3C-R1bycUFppWH2
X-Proofpoint-ORIG-GUID: 5dXhM2cb4YyM6u6yv3C-R1bycUFppWH2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-26_09,2022-09-22_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 clxscore=1015
 adultscore=0 mlxscore=0 mlxlogscore=999 spamscore=0 priorityscore=1501
 suspectscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2209130000
 definitions=main-2209260132
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220926_143433_607204_E004C45B 
X-CRM114-Status: GOOD (  12.17  )
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

On Sat, Sep 24 2022 at 01:14 -0700, Avri Altman wrote:
>>
>> +       hba->mcq_sup = (hba->capabilities & MASK_MCQ_SUPPORT) >>
>> MCQ_SUPP_SHIFT;
>Since you are just testing for bit30, MASK_MCQ_SUPPORT is not really needed.
>Maybe just:
>hba->mcq_sup = (hba->capabilities >> MCQ_SUPP_SHIFT) & 1;
>
Thanks. Yeah, Mani suggested FIELD* macros as an option too.
Let me check that as well and address this in the next version.

-asd

