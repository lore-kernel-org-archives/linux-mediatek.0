Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 082EEC83030
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Jul 2025 22:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B8EhHwVKYpVrPJqxIdjJWt6imKVtstqw6FBfSw5Dfcs=; b=eIgDdV9eU3FMZZ3Ta+EJFlwI0P
	0uA2LstWpXxvwRpIM8xER4sT9OpDo2n9UGOuhrnMVtwvfB86hMMjGMB7vINO6J64ncEdGB70epMyY
	5Y+KHtpgQ3+PsfTCFt/07WLqpA4P5Swnp/4rzds0tmdE5DqkDVUjInwo2lDyAwRJOFriMtH3DDnDF
	5Td19grlm+8utz/M4fP6TdWJ8EzrmhRxF+map7dLDsciSFRxrGXYVnlZOg7WRtRVcdOnAeCOvDodI
	k4Oj/V9hyVn4cV5t3k2u/dChCezlT+clMRZZN5/cgnIr610owQ5H8QMpSDd0aEhoefn7dpkT6yqmG
	V7z2+WZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXSaW-0000000CkT3-028B;
	Thu, 03 Jul 2025 22:39:28 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXRTB-0000000CcKC-3ZvU
	for linux-mediatek@lists.infradead.org;
	Thu, 03 Jul 2025 21:27:51 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 563F51QW018851
	for <linux-mediatek@lists.infradead.org>; Thu, 3 Jul 2025 21:27:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=B8EhHwVKYpVrPJqxIdjJWt6i
	mKVtstqw6FBfSw5Dfcs=; b=BGrvMhL0TDNFCs2LhwEFqzu7QOyx7f+cCW2mp+kZ
	0wLWqk+5N17jvzzu1Ejzhf6b5Rn5C4e8oNlufBfaxIEAiv6ngFCB8Uoui1q2PqP7
	larACg6xkL6YsWwjNraGORUubtDCBCWV/64XJ5Yg8dVetIFaNAO10I/WdIYmNkoY
	ZhvNxY5PnPdLW3+AYQrEYb8Ftu6+WtnUYzQ9zMhK3jSzheM04/qjbaVX2g97YAin
	KLdDNnC+7V7hW4zi1gbXwYC2uza1NUhPNB0YI0EWgdJczDQ/35bUTDtLe+y4gaVW
	7Ul3qtUlNrw3LTZ0km0RYzuTt3fjoGcN8jZ606Mm+xYJpw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j8fxstj6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Thu, 03 Jul 2025 21:27:47 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7d4576e83cdso65901285a.1
        for <linux-mediatek@lists.infradead.org>; Thu, 03 Jul 2025 14:27:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751578067; x=1752182867;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B8EhHwVKYpVrPJqxIdjJWt6imKVtstqw6FBfSw5Dfcs=;
        b=jv6TT/iLPnFy8vaSSQKeZOP0KGXloh6DgZadNn/RzyScMUf0OGW1FlGgKv6tHs/AMG
         63u9WyUZxVlLhyHeOTLbprBOmlDBEYPAU5cjIJo3wYzo61IATaZbfLDtnbgMEx7Eeod3
         /91o4P3ETApvyC5DxgzUMKP41ZmLPd7iYRkmpNvubf+GeearnMDSTS8pv+3r3qYk1hjI
         TLiF4sqTwriWk5RzpgnNwUG+tGLMC5KzCJTTn8XhnbgZza9VrC1LwmaaXTAQyT5EchO8
         td2vie/CR8cuXWiGVe8HRjDkwH1qewY3TVyRXxad04JqJcF5rriQxFO3BfDvUzb+VwAE
         xdiA==
X-Forwarded-Encrypted: i=1; AJvYcCWa9VvXDXWboZmdQYvHCn3BZu68e3nRLsr4aa8qoFMEhQv6wwF3V0rR7wgZc/zSMXKOqbK36ObAyuIl+DcVYw==@lists.infradead.org
X-Gm-Message-State: AOJu0YymE4sauu40x2NX8KQDEz9X4NI83KGwg+zlvV6FqmSRBOHAziqL
	Q9OL9DYBxJZxspzRvafROdicme8pOh8ycsjQ8A6nPvW6bGWvwEwb9wI2O2r5hk94nMtWNdkWt6g
	AsRHjzx7ckiTlpSIm7V4rKzH2uicwb5SYwlUSuR28sBp1+d2cH9BF4FgBj2+p0MNLd3fevdpxt6
	0=
X-Gm-Gg: ASbGncsGPjhS/+jI2OEhtL9j2Pj9c1qb2FpkAFkVoLcQfLlcLU3jAwnVygI9c6XMeH4
	iswNwjE3XDYwAkPKzPAoGc+1GM69JXcbuRUUCrCADsbkhw059FRrY5x5Sp7CvJbSkM32JoO3acC
	GxrJbKhkFhMhrHyxinWuBvkNQj7ABvUlBf7uPzAMPMrIXU3DowKrzEWnY3l+v1o3kg+f1NxzyjH
	mur/KcJ9wN+ZSVTdy3bPIkvMy1ZLj/mYsO/gYhPTrUDXr0WWLPg9exc9n8PLP6mLjyOBkph9A6I
	l8y4zNKNB+QWJGlVnpo7sXextFmNjD27cKohf+wTLh/ldpOiUyb5m0/xTqaUjQ0HYYBzNkPQLV8
	uZQ4oESMe0M1XdvGsPyk2LJtfOBZMYOYifrM=
X-Received: by 2002:a05:620a:3d86:b0:7d5:ca37:79a0 with SMTP id af79cd13be357-7d5ddae521cmr2891385a.18.1751578066807;
        Thu, 03 Jul 2025 14:27:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEMJrZqqPZZas9zZzBzoVxAUKC2qdaPz2216jh1dVtgBGxiblPPM6KkbjiAzq0lqA6zcxM0YQ==
X-Received: by 2002:a05:620a:3d86:b0:7d5:ca37:79a0 with SMTP id af79cd13be357-7d5ddae521cmr2888085a.18.1751578066366;
        Thu, 03 Jul 2025 14:27:46 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55638494f6dsm72675e87.123.2025.07.03.14.27.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 14:27:44 -0700 (PDT)
Date: Fri, 4 Jul 2025 00:27:43 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Andy Yan <andyshrk@163.com>
Cc: mripard@kernel.org, neil.armstrong@linaro.org,
        dri-devel@lists.freedesktop.org, dianders@chromium.org,
        jani.nikula@intel.com, lyude@redhat.com, jonathanh@nvidia.com,
        p.zabel@pengutronix.de, simona@ffwll.ch, victor.liu@nxp.com,
        rfoss@kernel.org, chunkuang.hu@kernel.org,
        cristian.ciocaltea@collabora.com, Laurent.pinchart@ideasonboard.com,
        linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-kernel@vger.kernel.org, freedreno@lists.freedesktop.org,
        Andy Yan <andy.yan@rock-chips.com>
Subject: Re: [PATCH v3 2/2] drm/bridge: Pass down connector to drm bridge
 detect hook
Message-ID: <chznjpcx6p2vn3i5jt52peikhipzjiwzlr74gx6mzp3wjstr6p@6zhhknnl3zek>
References: <20250703125027.311109-1-andyshrk@163.com>
 <20250703125027.311109-3-andyshrk@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250703125027.311109-3-andyshrk@163.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAzMDE3NyBTYWx0ZWRfX1olln03i0i8D
 JYIp17SMFMUth83xR7NgkHCFGn7LgCNryQ24MZp4jI5/diIxdtiRhHjwJ/07p1aN/bYpnxD3Qg0
 dye6nABdBVL617ebBNt2UGLev1Zloh7dFnbgzOfRy/mPTFwS9zHw3P8yajgnH+tVV08YGva0cbg
 vuJWIlgtq4b/lWIiwJVNSsBIEGUPCZ+lcEG1f87DsEVTk91ttIoao9PZmaPIa4KBYyWFqatEAWh
 7JeVXw8di2jLcADp2BKyRlqysYi7yhEnpR+CE9VQ4OhxREVF0mUvJt3XixGJogAgnMkrx1V2gvy
 U8iG1qLpl9AwYXZmSRTf0sr1neb7fyzxGYFm3R1F8tz8ZYbWEb5LsSz5ASZsvtBLgIs25u9qAzI
 B98S9JX7GCl1LyGSQ/uJB5plVarjjnVtGHcefmvIav1gCN4pYbAFQp4kGBQz31ItLmZKqvP8
X-Proofpoint-GUID: s2T1uXhm7AYdYCbd9dszXMvop9SHKjCz
X-Proofpoint-ORIG-GUID: s2T1uXhm7AYdYCbd9dszXMvop9SHKjCz
X-Authority-Analysis: v=2.4 cv=TqPmhCXh c=1 sm=1 tr=0 ts=6866f5d3 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=s8YR1HE3AAAA:8 a=EUspDBNiAAAA:8 a=nJWoAq30JnpefaDr-ZMA:9
 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-03_05,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 mlxlogscore=808 suspectscore=0 adultscore=0
 phishscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0
 impostorscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507030177
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_142750_007412_7AEFAA2F 
X-CRM114-Status: GOOD (  16.41  )
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

On Thu, Jul 03, 2025 at 08:49:53PM +0800, Andy Yan wrote:
> From: Andy Yan <andy.yan@rock-chips.com>
> 
> In some application scenarios, we hope to get the corresponding
> connector when the bridge's detect hook is invoked.
> 
> In most cases, we can get the connector by drm_atomic_get_connector_for_encoder
> if the encoder attached to the bridge is enabled, however there will
> still be some scenarios where the detect hook of the bridge is called
> but the corresponding encoder has not been enabled yet. For instance,
> this occurs when the device is hot plug in for the first time.
> 
> Since the call to bridge's detect is initiated by the connector, passing
> down the corresponding connector directly will make things simpler.
> 
> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
> ---
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

