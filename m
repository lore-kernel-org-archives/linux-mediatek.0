Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83A84C561E6
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Aug 2026 08:05:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RICqsw8vvvpf6Mcn0dFhc6hTeN1pZTC0Y3pcWjqeE6A=; b=e5VqW5qe2zWrGcMdPH8qStF/um
	uxlY/T7X4PMbKyDL43wcBKoCDKQVRXa7Itvxfs7zkG8XDKni0E4uyz4mcSpu813Zx7WHbv+IDxPf1
	B4UqItXsXR2HfPrfI/v7f+f5D6opY5AtZ/tTdX0hsk/c6pkWtBoKkKJE90nS9GY7zMu11KcwoX586
	mLdRVUV4KospIs7C8rzkoEE7hVNUxM7Xox0uDaWEAcfFByM46xiPCUeW8g+z+1rATmpzPVjAC57Bh
	Z6op8fsd6fqDJxwh3IeBiVdHCsfwL17Pu8Jjd56xsygdR7tCr5POSuyQLcwj1Dxlp4JfWRJ4p7Wl8
	8n4pChEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrt6U-00000005C81-1acC;
	Thu, 06 Aug 2026 08:05:26 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrt6R-00000005C7N-38Uo
	for linux-mediatek@lists.infradead.org;
	Thu, 06 Aug 2026 08:05:24 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6767M13Q1286498
	for <linux-mediatek@lists.infradead.org>; Thu, 6 Aug 2026 08:05:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RICqsw8vvvpf6Mcn0dFhc6hTeN1pZTC0Y3pcWjqeE6A=; b=d2FWsa4S5itD4zlB
	hf6Hv9LY88PY7A5iG9FbLFHtXvhhQbA/kEblyPyNNz0UwmhJfpWJfAUzDwwGAm8R
	kKhIHwsQGSg8Z19Qz68igq0enf/ygatKXA1uzu5b2Xshj3rZH/dDI6orMPvA9wDW
	18tlqOl4DMuXrlQogJyd6ljcxIAVGOo8mJDXC+KFWvWgnVbPjiiZkJNV28rGJhvD
	ylQ3dI+V9E5qub+5xG3x58Osrarnaap5nK4rMflyCrNO3rVY9K0FAqdge4VlP565
	BipHhqTDueuPPCRst8/yvh7MTb00PQBNYqCP8t8CtK0RZ7PtvOMxsaCscDtqnzgt
	F5TYxQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvntng5ac-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Thu, 06 Aug 2026 08:05:22 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c19493ac2so20756001cf.1
        for <linux-mediatek@lists.infradead.org>; Thu, 06 Aug 2026 01:05:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786003521; x=1786608321; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RICqsw8vvvpf6Mcn0dFhc6hTeN1pZTC0Y3pcWjqeE6A=;
        b=PIQHoBlX/pAenvQ7pEOPNPcz+EHxMv/jXIQvBo0tR1jZ/zbsjOfGcxq7kRnhgCZC4c
         n8O40GtrVHlhZg1Cxd4TBpZ03Bbph2Pwj1aDCOIhoQKtcNOw1g4yqDaAALgQ98+pJJZu
         AbdoLm4AgXODEaR/wSjiPtAKs3Ukwc6ghx6KIBgX1/W96rhwne95vvTEVSt8hEooAzGk
         Q57O7ooXFAyifTgM+LFMHbVEFLWZi01uNUpVBhMfeLos1YUtFPb6YHi7PoUbkVx5ODQB
         /3yL1mBD96ENAatakG+QmDW2xUvpOUjxovrWqTRykXGNBpyjFEuxZTmoUxhybhAzhczH
         wmfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786003521; x=1786608321;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=RICqsw8vvvpf6Mcn0dFhc6hTeN1pZTC0Y3pcWjqeE6A=;
        b=BkgjjVt4r/fw0jRhDCBZ9ULgWgRrQge0VMk460HtxnKJOvNI4DUbuGgdlZfQC7FNrt
         +OJ/XI8P+3KGk4h4PHiMYbcOBfYNYMa6PxPHw3OQMb0W9pzfGQtY2GRgO9g18Rga++ob
         S7YY1GL8bFt1mXCXF+tHTEqHI331KTjy5t2ljUxtDRWjW3VkptR0TXd2jNXTH9oyUUZG
         zNKwyoO1qsjI1cpiXayR8wlVh8KTPDVptfVHsZLKmGRY6bzV/SDXWMZg1VcUxjB+RVNV
         kLB8hAR3blkVGft9fSP6d73exaH1wPdSJMwcm+GOF6jG2NFaYYF+2w/DBeSUL9FPryqk
         bsYA==
X-Forwarded-Encrypted: i=1; AHgh+RqYiK16BhkmRKzsFTp1M66cv9o4qwaJ8QUq13tN0E8REPtiz2Rx3t/YbGvbYGPOn9KzAPl5eAUBvpbveIwORg==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywyq0OROJI537Qda81VGzx4+YXySLHTTd0dOZ5m5va3Tw14WuoA
	Vi7xB4PC3iwJQZR9YJ34xwlf1nbECtv4HftRzYwEJm44SyzlKa8YECszH91IibfPI0m1lIYXUV0
	t/3R9Lc9uZ1fEUdPjf9gjwSg9SF2JH98+fZWIZlWZZhXu11VkdrUFcmGrJlEtLhQUJfJ05xk9Z9
	U=
X-Gm-Gg: AR+sD10MNZPivTHmhTcM6iDyZE4byA9XKWPScMXmdidp4MRH+N+LVXoswv3MzVR868k
	tcawX3Wl7q/mA0hfV8p/O3+bX7VsNMmRra66K73nT7qd+B9/X/ndPzZ2e03b7qYF4U70QjFi3Ox
	hWMFceLpazBSDl9Vlozr+8qoNQaw3QpVcf+a1CkmPeuJ7G6UJwSCL70/+CNbCFru5DW5rpUpQpm
	Yd0REOHlcoM0//6br85ogimrXZMsJrrh8m1/v3VztKL7akeO7xOVUpNA7gkf3blu/oQ8uobQpeU
	dflTx6SiPdsOzzxVK/QrjifYgtqwluak6+RAPqNWuo0eIJzBpRGWKVfLGMMQrFlOP1DmJ/FhC1B
	qPW5IjtN4smfk2GGGQs+56aaluG+uQHT2fQkwC6m9IO1FszqdFc9PcDN7zlcRbBTVouR04x2Jk/
	Eu6KVC7Jt75l+gyg==
X-Received: by 2002:a05:622a:480c:b0:51c:1c73:5943 with SMTP id d75a77b69052e-52ce6145233mr148479541cf.23.1786003521478;
        Thu, 06 Aug 2026 01:05:21 -0700 (PDT)
X-Received: by 2002:a05:622a:480c:b0:51c:1c73:5943 with SMTP id d75a77b69052e-52ce6145233mr148479101cf.23.1786003520994;
        Thu, 06 Aug 2026 01:05:20 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2f6235d38sm559497e87.16.2026.08.06.01.05.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 01:05:19 -0700 (PDT)
Date: Thu, 6 Aug 2026 11:05:17 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: WeiTing Lee =?utf-8?B?KOadjuWogemchik=?= <weiting.lee@airoha.com>
Cc: Josh Boyer <jwboyer@kernel.org>,
        "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
        Lucien Zheng <lucien.zheng@airoha.com>,
        Albert-AL Lee =?utf-8?B?KOadjuWutuWujyk=?= <albert-al.lee@airoha.com>,
        Joseph Lin =?utf-8?B?KOael+iUmueFjCk=?= <Joseph.Lin@airoha.com>,
        "linux-firmware@kernel.org" <linux-firmware@kernel.org>
Subject: Re: =?utf-8?B?5Zue6KaGOiBbUEFUQ0hdIGZpcm13YXJl?= =?utf-8?Q?=3A?=
 airoha: Update firmware for an8811hb 2.5G ethernet phy
Message-ID: <iegslrb3fdz3hc5v27mrowq4plvkafeeslg5b3v5ps4rdfgdrr@arzxmkbvwymz>
References: <20260805053652.1384026-1-weiting.lee@airoha.com>
 <7vt2klmqyntyscjcffdsb72g2psrbfkobcvjubs5ihpdvl24zi@fdrcysv3mher>
 <TY2PPF54E124228A0732B1B0CED2ECD216384D22@TY2PPF54E124228.apcprd03.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <TY2PPF54E124228A0732B1B0CED2ECD216384D22@TY2PPF54E124228.apcprd03.prod.outlook.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDA2MSBTYWx0ZWRfX4qoveXdHA+RQ
 N5PgQsh+Nw2EDTpaUeBRRq1gxplpkWbDQ9ivGhorOQCVHbglguGBsuJ1kBNdNopbs5CQ0bLVoQh
 a5JdyR7rlP7gLcut4GxexWrmeesIKG+bRossT1GB+5WTLM9RlbEJnz1djrynG0CmtDHC/hT8Vq1
 65zSdoWEYA52u1qoHEupkbMi0Nq8FBWLOSRsT2Iht15xOZW+Z9w/qBSUufVgoigsNq2HGlc0JIj
 6ZVe+txVc8nwXbnz6GtI9CEoVA9ZgubkQ4g+tUMGbfPHIAs8cdJWHbUjcuAbF8GJ8yCA3rCNGs6
 51EPFn87ITfu7WOcZPUfDUcNAiicwr5ktbgGLNMVLJUeQnT1labBu4fHLNNKTQdy4LkDMcMrubr
 JuTLYbl6niypcgpHvhkQjdetaxsGnnW+Ho9DNoSJxXOzse3O/bZXZj4DHt4gA4BJTYUSndlYDZk
 7bw0U7hXPpAYxvZ2w0A==
X-Proofpoint-ORIG-GUID: yuubMCJzGmcH_enbGxOEYpjlxf3vH-bq
X-Proofpoint-GUID: yuubMCJzGmcH_enbGxOEYpjlxf3vH-bq
X-Authority-Analysis: v=2.4 cv=LpKiDHdc c=1 sm=1 tr=0 ts=6a744042 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=5KLPUuaC_9wA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=WY3rceviPjOhuui7htgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDA2MSBTYWx0ZWRfX1zD2+iq6o/Cd
 O9KneOLweEQihc/p/8I7o18n/G1yh3X+a3GG9Wwq66SDz+SOrKCKKc/5AfjwmdyH06UW/ZEfZi4
 3zcwyfzR277GFK7UjWxJ0Ye0hr4hPdU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_06,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 bulkscore=0 spamscore=0
 phishscore=0 priorityscore=1501 malwarescore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608060061
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_010523_790649_F00E4ABB 
X-CRM114-Status: GOOD (  12.88  )
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

On Thu, Aug 06, 2026 at 03:13:40AM +0000, WeiTing Lee (李威霆) wrote:
> 
> Thank you for reviewing the submission.
> I apologize for overlooking the WHENCE file update and the firmware version information in the previous patch.
> The firmware version is 26071602, as illustrated in the attached screenshot showing the proposed WHENCE entry.
> I also noted your comment regarding the Link tag and will ensure it is removed.
> Could you please advise if you prefer me to submit a revised patch (v2) with these corrections, or if you can amend these details directly during the merge process?
> [cid:a2116c1e-c953-4e0d-bb40-3c4bb2dab90b]

Please submit v2.

-- 
With best wishes
Dmitry

