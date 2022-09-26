Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A4D0C32771
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Sep 2022 21:24:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bXAKkCAntPpulCJau4s1xvZy9zCHXEPKoWOESym2gbs=; b=SDRIYuZF9GxUvmGrWUmewYcrhd
	BpA7joDKaYtQ16IBUmzMIpW53jr56OC9yT2frrQNsU29L9UDD/B3wWgPX7pcP0D2iy9NxrkdwtTt/
	dS0w8Z0HOkLDLCjogdSKfAk3JK+EFdAMVgsXmnUINXHcwBbkO4WCOWzLD6T3LdlJDTlBnibfVL7nU
	ZRnq3ZuSPuWy+8DJjP53DOQQJ4ydfDlUt7932So96uVLRZEwHmEIz7ceN7KsU5cqb4Qe/pDP+lMtp
	yGEbqCoAzj60nHqgPWWdoL1xHgZoBOm44CY3zPA2LqMMZF/sbpIDMSAZwsJ07uQBguax/SKc9oPkf
	m4XmVauQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ocvaS-006ume-C3; Mon, 26 Sep 2022 21:24:24 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ocvaG-006ukF-HP; Mon, 26 Sep 2022 21:24:14 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28QKw89X017711;
	Mon, 26 Sep 2022 21:23:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=date : from : to :
 cc : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=qcppdkim1; bh=bXAKkCAntPpulCJau4s1xvZy9zCHXEPKoWOESym2gbs=;
 b=EkgDyKW0iDTMKvairHXWjeMpY3HZ9zznJRh/gTdJVsnyZbjbUpXkYVyeSeIGnkhZIpyB
 /oECWwXFtk99cv3bgvBjC1pxbzmE/xbRDZqUM9jOjnM5hbMacKIbioy56zRnY5SJLT5b
 cbTvw/mJiiXw0wERdGQlkGXzsfFHob7jbe6iHJ0YL1hJsRrwu48IAMRblz5nqmJ2XOGt
 GZtBQ7X/mnoWWa9pA9fcJ9spfGCD6yOf8TZehxUsHMt3nGOru+IiNANrS8L2QDHMSMdE
 cY3vLCgsCFn5Ex4Dl7MCPG7ZreR9h/ehTztLRLUxK2pcEznuuM59NZ8BIEvgT6T9tb4m 7w== 
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ju9p69uj3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Sep 2022 21:23:47 +0000
Received: from nasanex01a.na.qualcomm.com ([10.52.223.231])
	by NASANPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 28QLNkCX019848
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Sep 2022 21:23:46 GMT
Received: from asutoshd-linux1.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.29; Mon, 26 Sep 2022 14:23:46 -0700
Date: Mon, 26 Sep 2022 14:23:45 -0700
From: Asutosh Das <quic_asutoshd@quicinc.com>
To: Manivannan Sadhasivam <mani@kernel.org>
CC: <quic_nguyenb@quicinc.com>, <quic_xiaosenh@quicinc.com>,
        <quic_cang@quicinc.com>, <quic_nitirawa@quicinc.com>,
        <quic_rampraka@quicinc.com>, <quic_richardp@quicinc.com>,
        <stanley.chu@mediatek.com>, <adrian.hunter@intel.com>,
        <bvanassche@acm.org>, <avri.altman@wdc.com>, <beanhuo@micron.com>,
        <martin.petersen@oracle.com>, <linux-scsi@vger.kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        "James
 E.J. Bottomley" <jejb@linux.ibm.com>,
        Andy Gross <agross@kernel.org>,
        "Bjorn
 Andersson" <bjorn.andersson@linaro.org>,
        Matthias Brugger
	<matthias.bgg@gmail.com>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>,
        Jinyoung Choi <j-young.choi@samsung.com>,
        Kiwoong Kim <kwmad.kim@samsung.com>,
        open list
	<linux-kernel@vger.kernel.org>,
        "open list:ARM/QUALCOMM SUPPORT"
	<linux-arm-msm@vger.kernel.org>,
        "moderated list:ARM/Mediatek SoC support"
	<linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC
 support" <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH v1 06/16] ufs: core: mcq: Calculate queue depth
Message-ID: <20220926212345.GB15228@asutoshd-linux1.qualcomm.com>
References: <cover.1663894792.git.quic_asutoshd@quicinc.com>
 <e0a5115eac57ee19df10bae2e3411cbbc7943303.1663894792.git.quic_asutoshd@quicinc.com>
 <20220926152222.GG101994@thinkpad>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20220926152222.GG101994@thinkpad>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: cIhSFhImtXEUo0d7kU2NmWVIH4uikPi1
X-Proofpoint-GUID: cIhSFhImtXEUo0d7kU2NmWVIH4uikPi1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-26_09,2022-09-22_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 adultscore=0 mlxlogscore=999 clxscore=1015
 lowpriorityscore=0 spamscore=0 mlxscore=0 impostorscore=0 phishscore=0
 bulkscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2209260132
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220926_142412_599402_172D30F1 
X-CRM114-Status: GOOD (  16.91  )
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

On Mon, Sep 26 2022 at 08:22 -0700, Manivannan Sadhasivam wrote:
>On Thu, Sep 22, 2022 at 06:05:13PM -0700, Asutosh Das wrote:
>> The ufs device defines the supported queuedepth by
>> bqueuedepth which has a max value of 256.
>> The HC defines MAC (Max Active Commands) that define
>> the max number of commands that in flight to the ufs
>> device.
>> Calculate and configure the nutrs based on both these
>> values.
>>
>> Co-developed-by: Can Guo <quic_cang@quicinc.com>
>> Signed-off-by: Can Guo <quic_cang@quicinc.com>
>> Signed-off-by: Asutosh Das <quic_asutoshd@quicinc.com>
>> ---

[...]

>>
>> +/**
>> + * ufshcd_mcq_decide_queue_depth - decide the queue depth
>
>ufshcd_mcq_calc_queue_depth - Calculate MCQ queue depth
>
The name ufshcd_mcq_decide_queue_depth was suggested by Bart in his comments.
I don't have a strong opinion on the name, if you do, plmk and I'd change it.

>> + * @hba - per adapter instance

[...]

>> +static int ufs_qcom_get_hba_mac(struct ufs_hba *hba)
>> +{
>> +	/* Default is 32, but Qualcomm HC supports upto 64 */
>
>Hmm, then this should come from ufshcd, no?
>
I'm not sure I understand this comment, please can you elaborate?

>Thanks,
>Mani

