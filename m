Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79B2F106FD90
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Mar 2026 06:50:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c11wsmz5XIkmIWHXb5uA+V8ldNGjY2veRXDnBRS0QwI=; b=EumdKxECy2gpHgi6fOma3t2rON
	QkLAyPrLf97nMBkDP1P+TsJgp1gnirjqU5Uo9jhgC1nKCaWEt1LufLpNNGCfZbPr/6rxnHVhD+/LL
	9t2rAfBi50bgUoAXx901t8Xp8E0iR8OOkBa9juLYordX1CCRaXaSIUVb+UfV+sMjUMt+kV5Yp+qRI
	ZIhGg/YZLJEqnyTf4OkyYaBq4jAQAQPxwGOCseSpzWJsRbItPwpOy9G5BpCYKokVD+jTM7r9GCac1
	pyw+jT/UGImK4Ov/eHCp8u5jhsUJEd7hqSHIT0zpRvxI1p0E6/33WZnfXfyeIXu+Is8+mEM/ciqLT
	sl99Qujg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0wLt-0000000Gula-0JaB;
	Fri, 13 Mar 2026 06:50:29 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0wLn-0000000GukT-1DpH
	for linux-mediatek@lists.infradead.org;
	Fri, 13 Mar 2026 06:50:27 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62D5tcoU3466813
	for <linux-mediatek@lists.infradead.org>; Fri, 13 Mar 2026 06:50:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=c11wsmz5XIkmIWHXb5uA+V8l
	dNGjY2veRXDnBRS0QwI=; b=aGInq14/byGCOzv3tsTMhCKWaiSwvd/pEn5dbOES
	ko0+Bs2cEpWhpo0dLIsiTEB9sUKYiwmTUYmSgbslKM+rvCPWTS0wlgMlURYgltfV
	evrC3cCZtewgOK6TEByWwAfWEBp//baAr9dpO3j7SSbKCjkmIT+XtT5v2sfyh31A
	ZreLrRytvDD5jWlOf+ps5vGAx9hgp80yxTA0VDbSRSOBtUmQjHYNuTuhxSvkUTZQ
	/nxeDB6A5N9uLb6R0snZD9UhPn7eWBfRS2qUlDbElFTOOnD0TYngE9Q7LGn98cZI
	bW4Z7dhUS6Ii/2rde5cmdNiIZAxeVwSj3WwRqnuvda67Xg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cuh60mv6u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Fri, 13 Mar 2026 06:50:22 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cd827a356aso1180393085a.3
        for <linux-mediatek@lists.infradead.org>; Thu, 12 Mar 2026 23:50:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773384621; x=1773989421; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=c11wsmz5XIkmIWHXb5uA+V8ldNGjY2veRXDnBRS0QwI=;
        b=Fidjn5JZHwk/4y85ogkgQ/Of72okh5oa0bvghrBX/ue+O0udoj45fwdyBmY5NkOn+a
         1CWc0BvVJ+7o0JncnlHCZ+EA0fXYRVD89u0DRa0k7VERJ6TTGT/ILyAWOaiyg/Q7HNz0
         i0qbKDndNac6L/MUbH8gVI2ESpTvrMafEpTTmReKVmuPOIobjo4MZGyB1z3ZKtAw++8/
         Gt1Z3PMUlCeJtaWadL/bmN3L6SUhASy7cf5ybwWJ1Pf+3QOhSuIzAGxQ2DDsm+RCjvkr
         XwKs855/RmkBV6X0H3tYt5iO/SNtol3Zs49UYdCTF15LZyeqi9SmRrGVCdxUiUlV2/d5
         FtVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773384621; x=1773989421;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c11wsmz5XIkmIWHXb5uA+V8ldNGjY2veRXDnBRS0QwI=;
        b=fS5L/72XvoEdGrxhgunWvCfzD7pGyxcD/VhRF+jvx4TiX/Bh4gmzufVKUplENzGPEP
         9dr/DllOhJearedc4AGKFYgTtcqwXAYejGLxUgscqGiXnudzrxMV8zwvVNriJR7DQ8jg
         T4woCIv8WAnzw48JCqj7OuSFOLTWCZyB61ZJgcXxeeex6qYW0YHvhR+m328Y7Xf/rQoG
         QLwu1gx5Vp/paKTAPZE+aq5kUTnGYOGmE3+hCcmW37xGg63erHgN/vJ7AaOYYE1Fr0Fn
         280yFQXVWQ9CWewlTt1teCq3mI6WYaTzfmiqSOkkObORy5TTBbKyi22VYJhXUFd9osYT
         l5Cg==
X-Forwarded-Encrypted: i=1; AJvYcCVlJye7fdy9gqC34u9y+gRljDmA/Eb6VCWXyMG/vZAz3HWb4qYpnvA+BOP2CKhcGE119wI0LpNnZRpuRgOMRw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwUtk3O5ZqFScKd6lonOdqPlurhuyvEAjEPu35TkRxbsSkdgtSf
	909tYYWG+OjCTBu5kzL/rJ1u5tuQ+rn7837DwXof7W9Zo964Oxv0dapel/6pZ7UaYOj0E/3UNK2
	bHGzQg+qpd0dJ0czqxIw3o8uAv385wfQnMmqSAm0cRsIlq4orRK36TL5E83Yar53jgcTDSQlAPI
	pKcsXxsoQ=
X-Gm-Gg: ATEYQzy/kJsxx5soHBsvwXwpj60zXMsxqA4wTaM5Exo0WWo+7GzMBE7XtAYLfRTnufh
	sRh3ggq0Y7+aNvv5B9hamlpTa8My0vZGyMygBYJY7rJNVLhrO55yWOaFiw4cI3iL9/GzZEO68Yv
	B6OrmL4Cen/j72PPsb4wVrFKFuBhiEG7ihMD038uOlmYZp9sFdpxuutyInChgxdYQ99/u4nQOrK
	KUql7i2+DBOQwmxieaEEY6hAb/uQH5IFnzS/JIVMzospHjS3eIFa62tAjD2RZJsxlCeEiibA56i
	zjycdTqduvpemAb1delvDjJUsCzf0V6m9/oEoPJfwfJDN9YDRpGqh4wzIuZtjMSIid28Z2zlUDm
	hMiTm96hr8O6yMO1CFt3n9YYVGhpIFfvtOD0pWf37vZ7LnqBGvHYAKP0uMBAMVKVlKvmF2NxOV5
	9OBRnadCXTGWKtrqrm/OvUKKK2pBZOQZ7T1pY=
X-Received: by 2002:a05:620a:470c:b0:8c7:177f:cc1c with SMTP id af79cd13be357-8cdb5a060acmr316352785a.16.1773384621564;
        Thu, 12 Mar 2026 23:50:21 -0700 (PDT)
X-Received: by 2002:a05:620a:470c:b0:8c7:177f:cc1c with SMTP id af79cd13be357-8cdb5a060acmr316351685a.16.1773384621140;
        Thu, 12 Mar 2026 23:50:21 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a15602e2e1sm1354399e87.24.2026.03.12.23.50.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 23:50:20 -0700 (PDT)
Date: Fri, 13 Mar 2026 08:50:18 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: JB Tsai <jb.tsai@mediatek.com>
Cc: jwboyer@kernel.org, dwmw2@infradead.org, ben@decadent.org.uk,
        Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>,
        linux-firmware <linux-firmware@kernel.org>,
        linux-wireless <linux-wireless@vger.kernel.org>,
        linux-mediatek <linux-mediatek@lists.infradead.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Sean Wang <sean.wang@mediatek.com>,
        Michael Lo <michael.lo@mediatek.com>, Leon Yen <Leon.Yen@mediatek.com>,
        Chris Lu <chris.lu@mediatek.com>, Quan Zhou <quan.zhou@mediatek.com>,
        litien.chang@mediatek.com
Subject: Re: [PATCH] linux-firmware: update firmware for MT7920 WiFi device
Message-ID: <xofpo36rayp3hfdpexh2f3bwcho3f3fea47llk4cqnoi7qteli@s7neefdrmuc2>
References: <20260313005635.2853784-1-jb.tsai@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260313005635.2853784-1-jb.tsai@mediatek.com>
X-Proofpoint-ORIG-GUID: f46Wx6ti1HRlMYfAGLrNUsCGGa_dyi6u
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDA1MyBTYWx0ZWRfXydnMqzKtPv0O
 +IlHEitrqsjBD/oAJ1UG02eJmlxpoBbHvt/BeyEiyVW9SJfiXBtwcPtRztQyH75yC7SjO4xpyeW
 VmT6KtRpQ4M2+zJ+3Nv7oCXfKyFG8AOZfdjyMt76K26eDf0VfiSfF+CHCsAr8CBCrfaxi0MSm7v
 FryrGqPRwXicuzIIeO1h2CdAwwBrpOZ6Cqm1yVS99qA+48PiHZdn3ifPq9Ihmqp5gNh24iWbS2Y
 OSuiIYP2KxCBeDg6JXvE1C1AKSuko0LxLpibFTCIvDa1PvFVOXOueBjo5AGvOI/BBVkgDDT/223
 S3bG7yZrdvwaOFYMWsJ0m9iLl30llkFl/7UMTYdHQK4M50+W3pVFLbVtWroPbyJp7yCRurqXKUd
 S1U5fWf6TfyT91/UI9wTfbCTUwoVhErV+WgFfvnjSlbp0f4QXgvhRdvwTfsypx7ehhzlz4bCU0c
 7Q1JrN/W/mEnjVWSckA==
X-Authority-Analysis: v=2.4 cv=DsRbOW/+ c=1 sm=1 tr=0 ts=69b3b3ae cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=p0WdMEafAAAA:8
 a=mpaa-ttXAAAA:8 a=Tdx_NzqeC2gGNTS-E4IA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: f46Wx6ti1HRlMYfAGLrNUsCGGa_dyi6u
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_01,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 impostorscore=0 suspectscore=0 adultscore=0
 clxscore=1015 bulkscore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130053
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_235026_646902_A499CE94 
X-CRM114-Status: GOOD (  13.94  )
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

On Fri, Mar 13, 2026 at 08:56:35AM +0800, JB Tsai wrote:
> Update binary firmware for MT7920 WiFi devices
> 
> File: mediatek/WIFI_MT7961_patch_mcu_1a_2_hdr.bin
> Version: 20260224110857a
> File: mediatek/WIFI_RAM_CODE_MT7961_1a.bin
> Version: 20260224110939
> 
> Signed-off-by: JB Tsai <jb.tsai@mediatek.com>
> ---
>  WHENCE                                      |   4 ++--
>  mediatek/WIFI_MT7961_patch_mcu_1a_2_hdr.bin | Bin 100384 -> 100384 bytes
>  mediatek/WIFI_RAM_CODE_MT7961_1a.bin        | Bin 802744 -> 802808 bytes
>  3 files changed, 2 insertions(+), 2 deletions(-)
> 

Thanks, merged and pushed out:

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/958

-- 
With best wishes
Dmitry

