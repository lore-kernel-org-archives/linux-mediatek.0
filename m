Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C24EEC32771
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Sep 2022 18:56:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bvdXHN6vP4kNBt6JcBzJk7vmEspEQD7GvxU0iOUauTk=; b=M/lnekXSvKhbX+n3D5uKil2YDq
	cAq7T7+KutphZA55oafkCXy4V6E/lA0MIw2+9zzBqpmF4XYldCgYb9CL7BejY9OJNTwcYQa6g7Bvv
	AvatH7BKV/BgwuGVk3XB4o9602domHHkIwiDn8hG3fjl7OgNpy7+yomFz+YutPc9QtMZxrjawnkyl
	DXmVjbkhsiNJg5fr6obZlEpgQ3IQ5KoQFkRp/KvXOGKAMgjvi5PsQ/pW6AtoD4e2kAlcnUMe+Xgwg
	J/bh8x+nIbVSU+EqzPe3OTpbUn7fBa9vll4E8DC87QCkrCsh81C/9G2iUVHIIoFbJ/KSv8rOYdvgQ
	NMOcMVag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1octHR-006U7C-CS; Mon, 26 Sep 2022 18:56:37 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1octH9-006Tyc-Cp; Mon, 26 Sep 2022 18:56:20 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28QIc0TX029109;
	Mon, 26 Sep 2022 18:55:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=date : from : to :
 cc : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=qcppdkim1; bh=bvdXHN6vP4kNBt6JcBzJk7vmEspEQD7GvxU0iOUauTk=;
 b=JlhX7g7k7d4uXvEArOUecEzUqebw31Sa/UXcr7v9avZfvGo/PE4nROYWE0b4g/RfhWyl
 4GpmKGfwQRVwVR+6Uw0xV5K+FbMn+JkR88CCK6vEb3VyI54scCk+wMdiUpuf7/8Ud+Df
 b1jJ2FRwhwM+B2KMTd01qkp+ztCAIiPlxr1jFH0qIYgJO9LCYIGSlAQgnbUBuZaolXxe
 a/Nxcj9FGxENcWndV0hdIQIUxAdSiUjAt85g8cdWHSFVMlFUtBXDZaxLTZKI8JnOxzwK
 ogLy/A0Vz20liBc4cdc2F04a4MFh+P102yzXPOUADklmJCK/1gbKF48FUQVBfLmxmTO9 sQ== 
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3jue008p5k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Sep 2022 18:55:58 +0000
Received: from nasanex01a.na.qualcomm.com ([10.52.223.231])
	by NASANPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 28QItvdr007229
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Sep 2022 18:55:57 GMT
Received: from asutoshd-linux1.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.29; Mon, 26 Sep 2022 11:55:57 -0700
Date: Mon, 26 Sep 2022 11:55:29 -0700
From: Asutosh Das <quic_asutoshd@quicinc.com>
To: Manivannan Sadhasivam <mani@kernel.org>
CC: <quic_nguyenb@quicinc.com>, <quic_xiaosenh@quicinc.com>,
        <quic_cang@quicinc.com>, <quic_nitirawa@quicinc.com>,
        <quic_rampraka@quicinc.com>, <quic_richardp@quicinc.com>,
        <stanley.chu@mediatek.com>, <adrian.hunter@intel.com>,
        <bvanassche@acm.org>, <avri.altman@wdc.com>, <beanhuo@micron.com>,
        <martin.petersen@oracle.com>, <linux-scsi@vger.kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        "moderated list:ARM/Mediatek SoC support"
	<linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC
 support" <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH v1 00/16] Add Multi Circular Queue Support
Message-ID: <20220926185529.GA15228@asutoshd-linux1.qualcomm.com>
References: <cover.1663894792.git.quic_asutoshd@quicinc.com>
 <20220926134942.GB101994@thinkpad>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20220926134942.GB101994@thinkpad>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: kktRfshA7eazCiLO_cRa7J83I4G7Y9pa
X-Proofpoint-ORIG-GUID: kktRfshA7eazCiLO_cRa7J83I4G7Y9pa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-26_09,2022-09-22_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 lowpriorityscore=0 mlxlogscore=941 suspectscore=0 spamscore=0 bulkscore=0
 adultscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 clxscore=1015 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2209260117
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220926_115619_462458_3A6DA30F 
X-CRM114-Status: GOOD (  14.07  )
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

Hello Mani,
Thanks for taking a look at the series.

On Mon, Sep 26 2022 at 06:50 -0700, Manivannan Sadhasivam wrote:
>On Thu, Sep 22, 2022 at 06:05:07PM -0700, Asutosh Das wrote:
>>
>> UFS Multi-Circular Queue (MCQ) has been added in UFSHCI v4.0 to improve storage performance.
>> This patch series is a RFC implementation of this.
>
>This is no more an RFC series. Also, it would be good if you can provide a
>summary on how the implementation has been done.
>

Sure, I will add it.
I shall wait for more comments from others for some more time before pushing the
next version.

-asd

