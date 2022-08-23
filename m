Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E631C32774
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Aug 2022 07:35:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3d/ElBXcPYxKWyW49KyvVjAnEwq+qBCx+4YLXDcWY5k=; b=SGpLbjWOuZXIg1qQTzRkW+JcSZ
	NqlqhLtDC4t+9VM5eZZdcGWm4gWH4UnYsxrprk2L1eK6M9z1GGMmgN5xOw8ESss/FYcC+hwQXKyzY
	JfEvJKzd+3g/jN39X3ov/BtonHggLWhy27V31a0Df36sFFkmXXhZ072gamdoUPn2OWncCvHxNCrxA
	zQ/3BZmc0oiagBV4iaRV6FY40v5ZvHWImsltASyedHDUnkcHcy/5goX5chFBZPlZoxCgc2kKrubuJ
	0gkSDEgZAvcPr2S+Umj9bZYU227pmEed5+XoKuS6q7VZ8l6vHDdepMeRKp2nxjl95WNAzLDjRxUyD
	uKgZK4zQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQORg-003Uqr-0h; Tue, 23 Aug 2022 07:35:32 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQORC-003Ud8-5e; Tue, 23 Aug 2022 07:35:03 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27N5PS1d019134;
	Tue, 23 Aug 2022 07:34:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=3d/ElBXcPYxKWyW49KyvVjAnEwq+qBCx+4YLXDcWY5k=;
 b=SaDJhOAG/4gQ0onXSxFKM92KFD5cJU3jtNBuWjvn4DFo87n6AM77r46kFw39bsFSQ8ai
 E9JDHh31e8YzMtCepEro/qOb88neXAtYAFOMXm/0HsZfPRfaVtWc++ztIcqpXiALHp1e
 5QS8NFLtCCDILYcwluQnJERkJb5r9pcWJy85KRzM4qTt3JAsnUGdrAZCf+Vz/UZZlRRz
 sVljtmbkPISxsK+7XtLLznl2zglxSGhhTsoPjtfiBco/CXBoeH2kwA24cM88YK4pfE+J
 +A1DiBli75rgxkwScHDJiEpNu527ye6an99ivw2sABtOa1iDw+eU7O9AIFPtca+c3+DU 3A== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3j4je3sp2k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 23 Aug 2022 07:34:47 +0000
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 27N7YkHc030663
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 23 Aug 2022 07:34:46 GMT
Received: from [10.216.34.138] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Tue, 23 Aug
 2022 00:34:39 -0700
Message-ID: <45e18c45-1c09-863a-65a0-3ae03ba4f859@quicinc.com>
Date: Tue, 23 Aug 2022 13:03:58 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 1/1] cgroup: Fix race condition at rebind_subsystems()
Content-Language: en-US
To: Jing-Ting Wu <Jing-Ting.Wu@mediatek.com>,
        =?UTF-8?Q?Michal_Koutn=c3=bd?=
	<mkoutny@suse.com>,
        Tejun Heo <tj@kernel.org>, Zefan Li
	<lizefan.x@bytedance.com>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Matthias
 Brugger <matthias.bgg@gmail.com>
CC: <Jonathan.JMChen@mediatek.com>, <Lixiong.Liu@mediatek.com>,
        <wsd_upstream@mediatek.com>, <Wenju.Xu@mediatek.com>,
        <cgroups@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>
References: <20220823054148.29346-1-Jing-Ting.Wu@mediatek.com>
From: Mukesh Ojha <quic_mojha@quicinc.com>
In-Reply-To: <20220823054148.29346-1-Jing-Ting.Wu@mediatek.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 9J5LNFkzL4ueqBV8-ngLYs_wAa--4W4Q
X-Proofpoint-GUID: 9J5LNFkzL4ueqBV8-ngLYs_wAa--4W4Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-23_03,2022-08-22_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 phishscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 malwarescore=0 mlxscore=0 clxscore=1011 spamscore=0 mlxlogscore=999
 bulkscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208230028
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220823_003502_245093_9903FD48 
X-CRM114-Status: GOOD (  15.10  )
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



On 8/23/2022 11:11 AM, Jing-Ting Wu wrote:
> Root cause:
> The rebind_subsystems() is no lock held when move css object from A
> list to B list,then let B's head be treated as css node at
> list_for_each_entry_rcu().
> 
> Solution:
> Add grace period before invalidating the removed rstat_css_node.
> 
> Reported-by: Jing-Ting Wu <jing-ting.wu@mediatek.com>
> Suggested-by: Michal Koutný <mkoutny@suse.com>
> Signed-off-by: Jing-Ting Wu <jing-ting.wu@mediatek.com>
> Tested-by: Jing-Ting Wu <jing-ting.wu@mediatek.com>
> Link: https://lore.kernel.org/linux-arm-kernel/d8f0bc5e2fb6ed259f9334c83279b4c011283c41.camel@mediatek.com/T/
> ---
>   kernel/cgroup/cgroup.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/kernel/cgroup/cgroup.c b/kernel/cgroup/cgroup.c
> index ffaccd6373f1..0d0c959966ed 100644
> --- a/kernel/cgroup/cgroup.c
> +++ b/kernel/cgroup/cgroup.c
> @@ -1820,6 +1820,7 @@ int rebind_subsystems(struct cgroup_root *dst_root, u16 ss_mask)
>   
>   		if (ss->css_rstat_flush) {
>   			list_del_rcu(&css->rstat_css_node);
> +			synchronize_rcu();
>   			list_add_rcu(&css->rstat_css_node,
>   				     &dcgrp->rstat_css_list);
>   		}

Good catch.

Acked-by: Mukesh Ojha <quic_mojha@quicinc.com>

-Mukesh


