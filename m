Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1982606A320
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Nov 2026 10:23:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LrBl7NFt;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=beZQtvH3;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=elejFW9S
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Z9wzeMh9irMYC60fEm/+/11KvCaec7jakGgh6z+vDXw=; b=LrBl7NFtFCLtPw
	AgAHEiQFFpD7DQdkA2ETSegP+XRjEWqhOHG7Wrm1AI6L1kKu0Qeqe70bl4Oi1VIrTdYF/Zhv8ygX6
	NeibySBVbMvz2VTMuatg2sg9kWWIn3h+4XfYEsWYGj53FUJHK3L3lDv8tFGFKz1BktrheUht6zi9a
	4dxYQvXIXx1gZ7LsH+a9jkcADqk+yOkkM+YDbOYQZAS9lMFQUAgEHWjYq2X2dKWxOvBU3F0WYJfXz
	oP93w0TqiMny1MvsajATObpHahFpEPFfSZkOAxTnocgM70Wk7YymKJ5JTsIH/j5ft43ReA7Av9Och
	lAkRIZEzDNAdyiC5joww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTzIx-0000000BXu9-0Fe4;
	Thu, 19 Nov 2026 10:23:47 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTzIt-0000000BXsE-3BTa
	for linux-mediatek@lists.infradead.org;
	Thu, 19 Nov 2026 10:23:45 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJ6vFRD1681162
	for <linux-mediatek@lists.infradead.org>; Thu, 19 Nov 2026 10:23:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Z9wzeMh9irMYC60fEm/+/11KvCaec7jakGgh6z+vDXw=; b=beZQtvH3sJoaN870
	1xzUQgkcLknbaAM6tOw9AaP+i+/AHWFt0eLB26Y+hikYIKmpxqw1fBJzlFPJenWH
	m6rcZ0X2TQYbGQR6FIm4r7S2mnRPcL3n6hU8RLW8AVP9MjAniLH0S2uz8vZbQJHT
	7D/7pxDYih3AHmOQ/U3GebGVN1+5moN/mTQzCJzezYHG7eGU2WigiGZaNjnj0nWe
	alcdIunbDmplTRqz3JK9LM/Y01ZhVVFGX5WOfxRo+7/mnA3dSrG4NzuqzuOYMZYq
	JDSdSnIldwBY0L1IoB+0Xjh5CXyupWMbSotwRtMalPbdZ3do5PBBhtDQf2W6qkjG
	UE5Fwg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1pdctb2r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Thu, 19 Nov 2026 10:23:41 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cdd48746a49so1350519a12.0
        for <linux-mediatek@lists.infradead.org>; Thu, 19 Nov 2026 02:23:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795083821; x=1795688621; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z9wzeMh9irMYC60fEm/+/11KvCaec7jakGgh6z+vDXw=;
        b=elejFW9Se/qWNnqyEqpFA7gyW3BGQaeuZevk0FkMWSzedcnLUr17BNwjDcuxUVwZrn
         Ze1ZlX2QhDHSeSwcz5WYkTXRk3iBaaPXgHlSN7vAKug84a5l5E3V7+vFQZwwF4WMpp+l
         gzOHiPGQa3FulbH74cAkhhbwkdlE/QOGOPYtsqS61jEs9fxw+AkuECxZmAm9UhUmV3Yq
         9EQfqIpGPt8unLNKZsxfySQzIHih3joi0Kyzk+WxOXJGRMf5W/7P+qHY2KrzWFGIvQH6
         gCX6D95N6EqkTHTu+uE/Z0PmBDm4rREXrsMvYGlSjLExWKsu4o8e7XO6FPc+aYb1zUT5
         IQZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795083821; x=1795688621;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z9wzeMh9irMYC60fEm/+/11KvCaec7jakGgh6z+vDXw=;
        b=ZxHm7UfWmyaaBqlHF5V5lqf4z9sIWfo6AHQikoBkhKH+lUaMnSGf3DPLaqaD6Vx+w+
         tHwraC5/pX6ILj6q8jMlnyQJ7whXbZKmDRLafuPbFq1C4f5KojEFGI9V/hG7GqbpsjCH
         jE2RuCcXdIkE7SM1+edWUMdfE34a6wx04Js1criFDVwqx3N9lP71d2kBlI2F/HmINGuW
         uigdy9ZEWOIvFWY3RXANSq17+NgSpXUqgBNbiyRFU60SUeeAZC0VkNaPM60CvWgVgxG4
         K3eGtCApar1wZI22nLX3O5ZbNE0pr+1RbPH4QBuFZVnlW6RacK+W7Vf6HYJRfwW5MIED
         bQrQ==
X-Forwarded-Encrypted: i=1; AL+hErEn23on5gRZxGMCHMiwhqYE3fpNyUpLjsQ7sgZAOPCd+7h3uJxwmi8YmBqUscEU9I43A2vSOWoCB9SUjzMREQ==@lists.infradead.org
X-Gm-Message-State: APuU4Z8mVrT4B3/MjU6ny71BmyADp9O7sSkLJwiOAgwCv8YLzrjG3+Iy
	CRZ6jZ1dzBQoKmWH6VOITB6+SPE6FY00RfV5RJWqt1iL0UEP7KqLfum2/KAPWGvVyydokXk2cRF
	ME09RADsj7bKSSJGkQmUBgIF4l8ieMbeAcV2CYmsd+g5/h/9tEnYAlVawbHiGtki1jwb/Gs2L8u
	o=
X-Gm-Gg: AYBFou38H9d2Mq5MIInzWn3w5p1M248wHtDdRs/AUvVhMClA+5lFJPc0m1p1XsXU3gd
	AFem2OZrjToQCpHZ719yv3x3eslHndcV6zJSlGZHnxswS3X+xMbp+kNUWVtaTeztkrJo6t+aGxe
	YpUs/HJkSe6FPd/r8Trom0vo9YxSVCf/G7YC+rSLYHT9NAdbkJGGWJOM6HmGwdrO9S1zbE4bLxO
	iVN3yZGCrQZIVDAGMg0bX74xtCyvKZkZ23+6i71JJcFlFJxMkTDMH3X8Z46kCN3ZEyrL6rSiuRC
	UmNvBiECh7nkFCvXQJx/6r+/Cp/71cmAuz0G+cgQPXSC6rpZsne377BqLyXrO0lKAx8NfNFsp8M
	MTZ9GWFGYFGRVKuuEkXNWcfgQO4Pac3eS91vtKbauOHdal3+9ut2i40cOL8ZiiupvKOsHqmFC6s
	6PU1Rg9G1eTOh2KOId5T7dYJvwcdeJPFr6nE1X47M8hw==
X-Received: by 2002:a05:6a20:2590:b0:3e2:2c81:bc6a with SMTP id adf61e73a8af0-3fe8a218d9cmr5626911637.47.1795083820924;
        Thu, 19 Nov 2026 02:23:40 -0800 (PST)
X-Received: by 2002:a05:6a20:2590:b0:3e2:2c81:bc6a with SMTP id adf61e73a8af0-3fe8a218d9cmr5626893637.47.1795083820409;
        Thu, 19 Nov 2026 02:23:40 -0800 (PST)
Received: from [10.133.33.68] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde5336844asm1476471a12.4.2026.11.19.02.23.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Nov 2026 02:23:40 -0800 (PST)
Message-ID: <03531283-aedf-47ca-ba19-6756819d7b14@oss.qualcomm.com>
Date: Thu, 19 Nov 2026 18:23:35 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] cpufreq: mediatek-hw: Fix initialization resource
 leaks
To: Haoxiang Li <haoxiang_li2024@163.com>, viresh.kumar@linaro.org,
        rafael@kernel.org
Cc: hector.yuan@mediatek.com, matthias.bgg@gmail.com,
        angelogioacchino.delregno@collabora.com, linux-pm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
References: <20261119052811.2877720-1-haoxiang_li2024@163.com>
Content-Language: en-US
From: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
In-Reply-To: <20261119052811.2877720-1-haoxiang_li2024@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: cZwicvffWjU0w9b4Kj7-eaV-Dyx43RCQ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDA0MSBTYWx0ZWRfX3m8MEPpzM6+K
 8tYs4THF3cBb27LN5+U59PQeEw9FVUPUzva+CFaf/YZsq5djyi8KPf4C6qS8SP+MwvIzXOBg2ZT
 hcPC4VIthG/kWC/hkSgBpxYdVYR9QZE=
X-Proofpoint-GUID: cZwicvffWjU0w9b4Kj7-eaV-Dyx43RCQ
X-Authority-Analysis: v=2.4 cv=Ma/5KJ/f c=1 sm=1 tr=0 ts=6afece2d cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=yEmRr5OKUZuCAoPvvFgA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDA0MSBTYWx0ZWRfX/lmPEvTWFybn
 e529gHfKIf/PGu25i3tI/A7euRPUkNeAUF2umpscFIagUpkE5dlppGFwXYcRMKANv4zbASaWhpi
 sBiNeFJYbKEvi/zGawG31agrdvqv66YpNUYCqOSFHzLYqoP/yvEn9rgAR+6vCBGwTgH6+sSmKc2
 LCwsg82I5oztgaqzAuqZj09VW9x69zoSARVZk+vu+HX70zt2A1yzxi9/aXwWAhqkxN4aUqXtSzl
 LHcSpL9z+hv5nqYzN902aZM75xmUGyZQEgCExBWaGNJNuooP0pNT8inKRQTlLBBPFI8D2cQEGuv
 riLyYYJW7+35pvg54piGZfzo98yL1O18vv1EmaiBrG9tXtyw7rqn2cmKIzGn/m0REw27878K3gz
 PCelIU+uj8XAevpwzwCKq5r8c7HhCyOVkL+fxZn35gE7M6e94dM+Ve6v9xlQO8KpD12Ype1oww9
 4CfH9oZ9LvbDrCT333w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_02,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 malwarescore=0 impostorscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611190041
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_022343_906143_331A28E8 
X-CRM114-Status: GOOD (  16.52  )
X-Spam-Score: -2.8 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/19/2026 1:28 PM, Haoxiang Li wrote:
> This series fixes two resource cleanup omissions introduced by commit
> d776790a5536 ("cpufreq: mediatek-hw: Fix double devm_remap in hotplug case").
> 
> Patch 1 releases the resources when the CPUFreq hardware fails to become
> enabled.
> 
> Following Zhongqiu's suggestion during review, patch 2 handles the
> additional failure path where mtk_cpu_create_freq_table() fails after
> the registers have been mapped and the memory region requested.
> Thanks to Zhongqiu for pointing out this omission and suggesting a
> separate fix.
> 
> Changes in v2:
> - Keep the original hardware enable failure fix unchanged as patch 1.
> - Add patch 2 to clean up on frequency table creation failure, using
>    the same Fixes tag.

Thanks for the update.

Side note on 1/2: if a domain's HW never comes up, subsequent CPUs of
that domain (and every CPU of it on later hotplug/resume) no longer
fail fast with -EBUSY at request_mem_region() in
mtk_cpu_resources_init(); each of them now waits for the full 300 ms
timeout. That said, HW failing to come up is already a broken platform
state, so the extra delay may not need special handling, unless
someone else sees a reason to. The code itself looks good to me.

For the series:

Reviewed-by: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>


> 
> Haoxiang Li (2):
>    cpufreq: mediatek-hw: Release resources when hardware enable fails
>    cpufreq: mediatek-hw: Clean up on frequency table creation failure
> 
>   drivers/cpufreq/mediatek-cpufreq-hw.c | 31 ++++++++++++++++-----------
>   1 file changed, 18 insertions(+), 13 deletions(-)
> 
> 
> base-commit: 666539eecdf4db623f5e3c3e55cf9f2dfad24aa4


-- 
Thx and BRs,
Zhongqiu Han

