Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68C94C56208
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Aug 2026 11:23:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=keLpHY6cYpXGrfUeKQjY5cYxZTcYjuMh/bSMdKUYsnk=; b=K4CP27RJ7cST55J+aQgLaQxl0e
	Rvzugb3JK9X+wx+VtA1lL71CqqESTsOpwtDAmdF0bf0EcMgWdn357eyNgIkXg20U/Ahnt59o0xQhI
	+EgkPvnCeQr3xJwTuahletD8/q5BFvnA1v7XsZn5XMQNCXwhIhUzVQx9jijC2uDrYeNt2akiGt+jE
	JI5xpSWVXrwEAcpEiu7SNjipgn8cfVZJLEWIUrqyJ4Vt2e1St4rV/XmWenN6TP+wqUrYwywUByPCq
	n5ZHhyiiiXWmTXfVnuWrZAswBA9xUvcbgpyFt2sj1ylDudAqe8+hmhzECuCH0rfeGD598K63xNtvD
	T26Nx0cQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrwCL-00000005diE-25CT;
	Thu, 06 Aug 2026 11:23:41 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrwCI-00000005dhh-356Z
	for linux-mediatek@lists.infradead.org;
	Thu, 06 Aug 2026 11:23:40 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6769nd0D1308839
	for <linux-mediatek@lists.infradead.org>; Thu, 6 Aug 2026 11:23:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=keLpHY6cYpXGrfUeKQjY5cYx
	ZTcYjuMh/bSMdKUYsnk=; b=FO09vaHrQrcsyMQi9/TvIDu9VPTM680Y+c7F1GHz
	bkFCFMd7eK64Y3RIR9X0Py073/hSEvnU/r3QpeXkkuxjYti241z0evR7yjERpWTT
	S0MM0l4FWyR9O8l8S6EDB9uWhWBf4zQ+t/rMNoW56e1FccEUAiM2KWlK3GMtkRCQ
	Z4qlebJJh6eV/2fNl+yQtvrPe5mo+BAyU4r/opKCOSwqGVh0jEPv3bbfmFRJcirB
	1Logl1y5+m39rvSc4FjahfPDfQ27peTZq85VQ+T3Kk7IbGdhQEp4MIjwD2+u9pHC
	eAnfW8khBaAi0Nvk+hl+ULlgBLY4MiLbnklttWJNj/zTRQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvp728yar-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Thu, 06 Aug 2026 11:23:37 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5276aa86d00so20702451cf.2
        for <linux-mediatek@lists.infradead.org>; Thu, 06 Aug 2026 04:23:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786015417; x=1786620217; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=keLpHY6cYpXGrfUeKQjY5cYxZTcYjuMh/bSMdKUYsnk=;
        b=Iw/QC19Ac/KKKr/bKxdXrUTK8ZC4zg7kL4rQ7mEQPpYEQLNxg8+h+AcM6c17cVJT+W
         2iA4gpCpSnzUm+Z0EVAf2+ofdII8nwG9iKOCdSHdbMVytyL/TfSH/lCrhgHXyCQBYvvR
         Y5JQ4e/VfJ0za4FPgDOZZwDNSz4R/IYDSQhpk5yrT6IsOYsDq96F6y1JCwRHLnbD+ys8
         2jUxVRmRIejMxz/02q1cufNX0tYtiO/tzNNFIjL1QLlvc0Z0xTlqwu7gs7D7kZnuRUOM
         x87MePh9agnMzuhLyR+XTZFoFwtRr4ovPFpvnPoR9izCyaNLcYKJ4rl/89HB7CLR0Sgf
         3Sig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786015417; x=1786620217;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=keLpHY6cYpXGrfUeKQjY5cYxZTcYjuMh/bSMdKUYsnk=;
        b=aAaAEH7zw9i6wQHKmp77ZOimm3NsCyZXzPW0vBUfpudiuDczT9bEeejwXfkGWcI8zw
         8pWjV1bYVOGYdUQeXPYLfhJWinHto7ft8p9EwpPVSoq+aEGYeHAA/n64zKdPPAPpNe3R
         1PB9ETUlxg3cU09MQOFHSZ2cd1zXAlMDoFHwa5ZgI/GbwQzk7BHXVz4Y/iaWhrpb8ars
         okcQps9MUzs9cOA3Q48TuR0FB053ZDeqIxXXfYMEBxHk2A1/dj2oU+mCxcDLoriulXI1
         A1ZAlkNym4cFrL33V+i3I49ROJRDOQ1osLkcnnZQJPfi0hxbJh7iJR3b07i5OR88AuHC
         MR2g==
X-Forwarded-Encrypted: i=1; AHgh+RqIpW6+FW8O6d1ZrC0O9nyxAjm5UsyVQGxVSHzOOf5HexT2bCs1eAQ4BOxKBPFCLkxNuJRkNlG/hvQ2Pe52AQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzNDeyOLimdqlZ2VWiXEf9EsOiYz1RE5658Wo3NsLjYRXA0yQg1
	KvQbxc9bhDsQsACKnkfhbxu67a1SRqYRYP6adL2hvpyRWLSv/NgBgLMIsOTknjJjIW9aX7kdEeq
	F0SaUCAo7hI9WT+FxsGYtxJeKCaskFrEhqLoJ0fLRWmw8QMTATuqWKw7ePJu2ZXTK04/d5cyri4
	sXuyr6EkM=
X-Gm-Gg: AR+sD10UCmuauO7V11FsTecqBn35V6WkP8CUovx8ZKZNgsMDRw/U4kcT0g7rvpF0u/P
	C89wK1KqbRfDSpY1gvxpmrkTKZHajyZLTMiLGLu5Cn6XqDJstrB3dn0s8osaowK+tR7/wsMPbn7
	gNAkFiHeEgCzeu+Ag7EbMKSYDqDv66Vtf/2AqXbsk+g6KK7frbzD4RdODjSHH4kINu/Iqesx/4M
	PYdtVGgSHJqjN+deN9v+vzDGm6Rg6Y/C8o4zNuApNV/aLd9YeuGMH50+aiwUOt/5lezQnPPvT1s
	dMyANqcaAIq7oB50n8XydjHe/8qgivhHQ/C6eN09/sEauOhbXkTevrMuB6Kx0cKE18qIDy5+z0G
	sEgbT+UluTLDdgrtsrP0e5Q8EWH0OaI78TgiHenoinFVh68ToN4p+FVavHEyGjRXlQsycNEmZpy
	/jKiQ7P9VxjD+Vag==
X-Received: by 2002:ac8:6f0f:0:b0:51c:15bb:b4f2 with SMTP id d75a77b69052e-52ce6113ba0mr156193871cf.27.1786015416888;
        Thu, 06 Aug 2026 04:23:36 -0700 (PDT)
X-Received: by 2002:ac8:6f0f:0:b0:51c:15bb:b4f2 with SMTP id d75a77b69052e-52ce6113ba0mr156193221cf.27.1786015416396;
        Thu, 06 Aug 2026 04:23:36 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2f6235cb1sm656420e87.1.2026.08.06.04.23.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 04:23:35 -0700 (PDT)
Date: Thu, 6 Aug 2026 14:23:33 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: WeiTing Lee <weiting.lee@airoha.com>
Cc: Josh Boyer <jwboyer@kernel.org>, Lucien Jheng <lucien.jheng@airoha.com>,
        linux-mediatek@lists.infradead.org, Joseph Lin <Joseph.Lin@airoha.com>,
        Albert-AL Lee <albert-al.lee@airoha.com>, linux-firmware@kernel.org
Subject: Re: [PATCH] linux-firmware: Update firmware for an8811hb 2.5G
 ethernet phy
Message-ID: <wjt4baq52dtqngvvjz2shyzmank4btlpdrwn47hh3gtrl4tmyp@ba5z3wucmcvl>
References: <20260806110130.1393101-1-weiting.lee@airoha.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260806110130.1393101-1-weiting.lee@airoha.com>
X-Proofpoint-ORIG-GUID: rIAwlHf5AnZgkxcl7EtOc6k4eUzIGr-D
X-Authority-Analysis: v=2.4 cv=JYCMa0KV c=1 sm=1 tr=0 ts=6a746eb9 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=JGXwu8-eAAAA:8
 a=TfqF4IXKzoma3dCZ95EA:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
 a=-p01NfQuWD51nzoNXB_L:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDA4OSBTYWx0ZWRfX/eBYpjPIhWwE
 jCl9DUU+1vyUi0S1eMQJm//i0LeDvntlSA3zk0YMXA0SmquBVWiCHk2nNNWSHlkgRAkGT10RIWE
 afzZI4ArAnLzdpgdkHrL7OxQP2fYC0FQVY4PgeNgFDEmN0OkX+EQDXiUi9546oJA+ezsd0uxBGs
 JQLE4Et4YyeUVlm/CBBzBWzfow3pkYBZtf4UvTr38XQMONKXxG1/w1mb1Pw9TsE4fpZ3OfiUWA+
 3Gnquime98fJ971fp57erEqi6xayqwuyWPw0d8IGRm2FnFSJNX8FtZVlQnmSyMTXmcPG8dJb+W3
 plI/mRk7IrAgoTxq0CKkQAaxUdyWS6xMFY+NxA3NVFBnSTkwZnJ2Ld4FoO+fxT1i3j+czJyBc7S
 vzPs7t2LTtup7IoosSR07kR2ahtH/L/sjivZMe3fEq+miVNEtgeapEXB5zA7mtguOvEniwd2bzO
 U+nbzEwLKily3T0MoPA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDA4OSBTYWx0ZWRfXytRT2oVF0lzT
 UhhkokmY6WkGNE/EY/cYufIGDTVQWxKlVnj8KWcEDC/f2WLcdLHCk/39ncjkAo8VSnbREYR+GrA
 Z69M1qCv8s4UJ7lUumKoKnKFSdd+FN8=
X-Proofpoint-GUID: rIAwlHf5AnZgkxcl7EtOc6k4eUzIGr-D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_06,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 priorityscore=1501 phishscore=0 adultscore=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608060089
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_042338_884211_501BC96D 
X-CRM114-Status: GOOD (  12.08  )
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

On Thu, Aug 06, 2026 at 07:01:26PM +0800, WeiTing Lee wrote:
> From: "weiting.lee" <weiting.lee@airoha.com>
> 
> Changes in this version:
> - Optimize power consumption for idle states.
> - Enhance 10M long reach performance for better signal coverage.
> - Optimize 2.5G training process to reduce connection time.
> Version: 26071602
> 
> Reviewed-by: Lucien Jheng <lucien.jheng@airoha.com>
> Signed-off-by: WeiTing Lee <weiting.lee@airoha.com>
> ---

LGTM

-- 
With best wishes
Dmitry

