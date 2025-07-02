Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEBECC8303C
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Jul 2025 22:46:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nGM9DZwF/Fd/OQyKb81XdMAcCKZwqXE+v9fpqIkuHk8=; b=AGZ1FP3sfEa+vtL+0+cEEOEGUw
	LQvgLN94DcLHUrfp2VwV9HVCInLIB4JX8ruEwEd6/FRvcUGR0DdWTUmtvTFp0HN2Y1mo5PxfcWQWz
	n8rxO/r0rW0BH7OO7bUb4D+RWocysunrbzLHPcWXvxZ5W1YB3s4OCKlcssMm4GkCf9hz0mw93jEGo
	u5FKhDEQR2GbkiMcbknOhXOEO8aU/AE03w61Q87ZDRnEo4X3Xr+1e6jtTIyxSwhhatMtohttRqi17
	sqU2fv0dr4sCKPdjqyw3FmI3tbBxf+QjYnH4LgrjjFbhgIwx52pWb+rqhL2158cZWvL380g9409Mp
	Qm8OK29A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX6DS-00000009js3-1No5;
	Wed, 02 Jul 2025 22:46:10 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX6DM-00000009jpZ-3hKk
	for linux-mediatek@lists.infradead.org;
	Wed, 02 Jul 2025 22:46:08 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 562E5Wt7001269
	for <linux-mediatek@lists.infradead.org>; Wed, 2 Jul 2025 22:46:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=nGM9DZwF/Fd/OQyKb81XdMAc
	CKZwqXE+v9fpqIkuHk8=; b=mm6wrDXhutFr3uHC6qXUeeftTGzqIOoRT77c+zOW
	KhrL5iogdPPtxctY+wOJyx/UCrc2keVFfwbWeRsMeMlVGpgsHLtg+cway7Y+7/mX
	1Fn33tizx/wqTgjlkVDDnwTdmVEJFgI9auaXt7NBQvF0YSHAq7Qp+yqrtparSEJW
	fpkAuV87++k+c8bWywdmd0yy/lkbLtvw6obky8xTn/GsvjIkMzs0CdI2BnEKfnZ9
	kypp792UseyoI7eeNSxLzZOBd2W1Kz1p/GkaKTMys6rWd38STbIMs+xarMeXk93J
	1iYsOlH4donFFrvzpib73KIdBqDScU5nBpzLrcBtTrrIHw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j8s9p8m6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Wed, 02 Jul 2025 22:46:02 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7d38c5c3130so815401385a.1
        for <linux-mediatek@lists.infradead.org>; Wed, 02 Jul 2025 15:46:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751496362; x=1752101162;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nGM9DZwF/Fd/OQyKb81XdMAcCKZwqXE+v9fpqIkuHk8=;
        b=gTlSZznywmngO3TzXrlOmzOgpge/AMmOYKi/2+f5hhX9qO/5MyZTZhmpUFxSzBZTmv
         MWq4m6KXDFaSw7jXmN755X8ITjSRPGHy3pp/wWXOln9UyVcsADGCX6lVuBJ7bKEBmeYE
         ysFbb9qERwJYt0T58mv01yxuFAfz/QzJZW5A07wVlnqMUeq/PMBLDQtv6l+5IGHpqnZz
         CDeiHc9ssY03b1mGPgpJIm9ZSzfJQmitZOq0WhFfwm3YT7JoWhBKQbgYxB/VqJQ49Qyg
         /OUESEXvgek6kYZhkZibdJNl3UjHYfTXEKjMjUzctOxemu5N07KeVnsaMiR/GAhtJWOf
         /vOg==
X-Forwarded-Encrypted: i=1; AJvYcCWBMnLURO0tI+mWqZifIByMagUcZI7vC8LqULmoP4UEJwWlVW/JEtY0Ux5/cNLUSQsO/jJk7ZHOajMdC26fbA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxB8i9ryG2nl42rtKz1gApvyTzxy3xgQRFOiANcHEoTawJjX4Y4
	niw/0dNer4+8VdHC3Tuq5/2lgGy67MrwcVj532JNGvG0AnkvJWMCCihHBcSRpDly+3akB4vuyjg
	v3O4ra3XRwO55ObB701uKqqoleET4es88qivmv3IrNXNpPbhiAnIrgEiAimWeefrkbjxcKZEN6j
	U=
X-Gm-Gg: ASbGncvP4RdSyxk7rN1cZs7cyeSjBfoQmXiRAqeRAal51Jpp5y3e+sqvC5etY39U2Rv
	lS7R3BrKMrry+dsPy8762niCYTKVY+3sEc5qUN8AW8AJVP0hFtaV4U4ZwhERIPAwaa/ImOOxsoB
	3kVGKRbgu3IEPCtsNSAwly5WjblY/FsgWnZDSrkr2eMVpz0xr4kscrIN5reV5rlpoyAqwouZ5PL
	AsgC6LhHwLywrwR2rCWVU10w570cztsb2RFoX9+rMAF0Y3m2wvEx4Y+gTxK/0qFxC/W2BrkNVBW
	UD+qnucLOCqIJdGvc6KY1oBPBb6iSUn4DkjVsLuwnN/ftlBEO8f9zPGTx52aUUVISB/NOxTswl/
	mb6ODI324c939uaA86q3JLYIgdpEXO7KI/1Q=
X-Received: by 2002:a05:620a:468e:b0:7ca:ca00:735 with SMTP id af79cd13be357-7d5d1478c26mr195295085a.41.1751496361792;
        Wed, 02 Jul 2025 15:46:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHnZ1KfGDoGnAnKKb48QCXInkKCn1fPiOPT/0wf5tLma0vYWc3UfPox1mlLLdjDhi6HGr8ihw==
X-Received: by 2002:a05:620a:468e:b0:7ca:ca00:735 with SMTP id af79cd13be357-7d5d1478c26mr195292485a.41.1751496361431;
        Wed, 02 Jul 2025 15:46:01 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32cd2eed872sm20589301fa.86.2025.07.02.15.46.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 15:46:00 -0700 (PDT)
Date: Thu, 3 Jul 2025 01:45:58 +0300
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
Subject: Re: [PATCH v2 1/2] drm/bridge: Make dp/hdmi_audio_* callback keep
 the same paramter order with get_modes
Message-ID: <roqsr25rk6psidxikgj6gejil2n6yne5gsbuvbnanhtpuqivj6@fqxazmw26hru>
References: <20250702111453.102539-1-andyshrk@163.com>
 <20250702111453.102539-2-andyshrk@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250702111453.102539-2-andyshrk@163.com>
X-Authority-Analysis: v=2.4 cv=H/Pbw/Yi c=1 sm=1 tr=0 ts=6865b6aa cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=s8YR1HE3AAAA:8 a=Byx-y9mGAAAA:8 a=EUspDBNiAAAA:8
 a=ywvnwGVb1iWAczny1xEA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-ORIG-GUID: Hvf7lrS6NnCyrTEloauvJD8cDWpl23PB
X-Proofpoint-GUID: Hvf7lrS6NnCyrTEloauvJD8cDWpl23PB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAyMDE4OSBTYWx0ZWRfX7tNK6ylt9+lH
 J2v4BbtYXGxx7aNs1Ln93ftAtv400xFnM7jwcIhmHnB9h4XNm5V3tZu+RE6CK7RZvILiPf/K7Qp
 sX7E+CjJQ8LUq+yvSbXe4QkPxP/3BT6wXIpP+7vEjBwMhRmJSzij76RyEH1vJ8HdQ2x6ZM+ozvG
 iRwte2kmesBCQksZipp1QaKerG00P67dUfByrJjW3NpK0QqtRvevAJOnB9VbhD5WmTE04P2z19k
 LZf3KlfKG2rxcew1yHwhkfaEeqWRP2tsvku4BAijkEogO+y9k1P9gQOe6SSfMQJS1wzXZmBI06h
 AVOxNWo6Yq1V+7FqWMwrczIQHzr3zvsboEwfQP71XDDD40QL3a6nx5NPUVZnfVymXecZVi8F8dc
 s2BLzMRlUbJlDznoqVzAztmWLBaJ+JOZLfi42RKwLqJw6FR9Li5oX7N+A7tf94tvg2mV0uW6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-02_04,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 suspectscore=0 mlxlogscore=810
 priorityscore=1501 clxscore=1015 mlxscore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 bulkscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507020189
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_154605_044167_3D771AA6 
X-CRM114-Status: GOOD (  12.73  )
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

On Wed, Jul 02, 2025 at 07:14:43PM +0800, Andy Yan wrote:
> From: Andy Yan <andy.yan@rock-chips.com>
> 
> Make the dp/hdmi_audio_* callback maintain the same parameter order as
> get_modes and edid_read: first the bridge, then the connector.
> 
> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
> 
> Signed-off-by: Andy Yan <andyshrk@163.com>

No extra empty line between tags.

With that fixed:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>




-- 
With best wishes
Dmitry

