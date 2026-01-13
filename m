Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51AB1D29DD3
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Jan 2026 06:18:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t0A3Jn5lYZDVUkR0vyN9N2ik1IzkRTUKaf4qHF/RyPw=; b=JurVD0Bp8ZhQz/pmjoK6E5H1aN
	asiLXeuyI90SZ5uf9K+KS1Ys2GSD2SES1lXjAj7hWb7tMRZE+FAdyveuvotJi/y5Z2m8edB2aokLy
	xgLig0tZiZGCTsMi2ahkWv39GxEVVrpd0GODbxLfgkB4z5a+vFxiPxe2Bn11Cv9Ixwe9A9hHfcKqP
	hNJHNMzfc6GnujL1Ytwls7y3FVNjAraoi2hyw/hXZMFeOIFVJldoyNaKyqvaj8e5WRPAAEihlD+8G
	Vn92jF5K/3/ZfwOi4pe0SkFlxMTUECuUaKUlnKK4R9YvmvIvSQVAnZa5mxtanjTxNaBfhKP78BN4y
	DpJqqeuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfXjF-00000006aRh-2Y6B;
	Tue, 13 Jan 2026 06:18:09 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfXjD-00000006aPD-0O2s
	for linux-mediatek@lists.infradead.org;
	Tue, 13 Jan 2026 06:18:08 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60CN6OFk2607176
	for <linux-mediatek@lists.infradead.org>; Tue, 13 Jan 2026 06:18:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	t0A3Jn5lYZDVUkR0vyN9N2ik1IzkRTUKaf4qHF/RyPw=; b=FAqcoOwNekn61BAV
	2BTRqQuHvQTF2U1dfvm5UxdlAuH7CIwLSjoow+WaRZHIs+CXMq4HpeI0k/MPKJmD
	W0AXhSVnvZ3NzeGOPTQMYdMqEWv/Kf34mWQDDgTmhvj+QyUKA7M8aSArUnWfKX+q
	1VPNGlRnPi0LO11/GnFYQIF1dXqK9GeqXPpvpK3faT73kKGoc3ToR7QYfP76U6G3
	75/ayrcZdfopkvvz2ydM1le8uOYjITq5ntk3lznTj0q+lBO0bdEwBBztXownVOX8
	q9lvMuGnr9dTIwpPJV0/hRTfNP4Xtt1H+7R8dbJWBjBFawRkSlvQFjBAOz/0JwD6
	JhIqyA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bn7uysg6u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Tue, 13 Jan 2026 06:18:04 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8bb6a7fea4dso1792940385a.0
        for <linux-mediatek@lists.infradead.org>; Mon, 12 Jan 2026 22:18:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768285083; x=1768889883; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=t0A3Jn5lYZDVUkR0vyN9N2ik1IzkRTUKaf4qHF/RyPw=;
        b=QUPMPBg3+kI7HXlyDXXoVQpNoeNHS+OnWFUeJppRCu7QSYp38aDfmRipWiQ3jsKcY6
         58PoKqkhWtdG5hbOEyIM7EE3KVOMwOam+xKGrFh8gtPKX0ZG3Nn+sRgvRpN5UTV6hzLq
         zKuqvtGQdzCt3DWKLj7wKPNqu/aAP5McF19LgQzHixIA5WT0HOWicgG3UifCqG4ZpxVU
         3MNQxIaqLAtinVMtSOCm5pbc42cMOCDjxt1NuTMfLs0Bhy6YDrBw1rJLuqv4RAfn81f8
         CvHUj/dC3+aBjTjHPyv+mSsWkUIBNBx5jkObEx/ji3OiEWUCOkoHfAtW5xNK7AaU+iPw
         hypg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768285083; x=1768889883;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=t0A3Jn5lYZDVUkR0vyN9N2ik1IzkRTUKaf4qHF/RyPw=;
        b=vQTXnxubklSNijopoVa5kir4Cw+ru7anlx0oVB+dJcHEQhA9gUtfq26bqPdPqX1XKX
         vIVIWAe4RcbBFy/OfJNAQM/T8HKC/kxOiQewQq/Rr96ewW5P0g0ql40wsLR2AO7XvpAh
         rhduNymLxtQdposXiaWvlDChu+/IJSgPLEvarIhNAgOK1D5HrmMBTD9xRwxtCxv0H405
         hwO5grwgaQlODDqlT4mzyXH5RD7JTJg+KHHnyO2W/apA7Zh8hPnY+W+i8ZY943JliQ0u
         mT5C1W642Jhf17jYedkhS1PGULfn/YUFsuRzwFKUIZynkPSC884GVsq+DAi7VNCxMfkD
         evSQ==
X-Forwarded-Encrypted: i=1; AJvYcCWx1xyynG2uLT/vL70lvs/C9pYU3YiJsbkpnCD3MvbvB5pkAJhM6v7Yf56p0zlVlTH/P8zp4vnuvrk6JrECbQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwcakbvrUbSRaRzWAGsNKsfLKaMUsGNVlQIN6a+8cWVsU1HkNHr
	j/5VKhyrfMpyKUhkDr72L+Vjjys1VXPPK84tNegsZ46gMiY526mC7r5DHsExwVA0K8pn0pQ07x7
	q1YhDIWATplq1zmk1cbEa1h1Ct8MevqA77nWqOQhNBnglcTDwBIVS9iU4rmO60QNLjTQkohk109
	o=
X-Gm-Gg: AY/fxX5LqYDqXvXWzopizL9Gjt0J2KWm2vSDBS+J22EvXQs7XqkQTmmvJjikLPa3z+9
	2hUluAYo6wgBwWlWKxZ8DtF/8c0v54dg03JgFhMOnl1sAinqHae3ZF7mx4inwPQQwZuEZyqVfwg
	8V8z1RPcIs6TmAlW67QP0hCOtUSZAEzicF9fEJwsl7oBYDks9Ipn2DjePe7bAim+nfu8V+I/Guo
	44nIo0K5g/kJFlvWwwOxbwkycVUKDwVKh8PdrEAj9P+YHIdP5MtgmhXLmHBRNRQgM1LGGaI4AH9
	ilGdGpo7ABP8qauQgZLK/jI9VBLJsqKNjqwtegRrke3Ch+rbsFTDCP2FUswNIveTJg4IjR7zym5
	P3GBWzJOQFVxdk8HA3Uez5vittRiSzkgz6X3fn94l3u/FAjeXGcQE6Y6UgIZqF+AX1S8sKZ9Jcy
	pGfhQQtdyYlI5hsaRIsuZPZM0=
X-Received: by 2002:a05:620a:40c9:b0:8c3:6603:cf63 with SMTP id af79cd13be357-8c3893f6de8mr3080932085a.68.1768285083669;
        Mon, 12 Jan 2026 22:18:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGjw+a8tp4voeRgDqdbTfRzcx5M4ncIYkxQri2oil+O0LxO8lbHuQgg9mMDggDoxzovc4IKtg==
X-Received: by 2002:a05:620a:40c9:b0:8c3:6603:cf63 with SMTP id af79cd13be357-8c3893f6de8mr3080929885a.68.1768285083239;
        Mon, 12 Jan 2026 22:18:03 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b728b5b01sm4279526e87.88.2026.01.12.22.18.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 22:18:02 -0800 (PST)
Date: Tue, 13 Jan 2026 08:17:59 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Moudy Ho <moudy.ho@mediatek.com>, linux-firmware@kernel.org,
        linux-mediatek@lists.infradead.org, nfraprado@collabora.com,
        Jason-ch.Chen@mediatek.com, angelogioacchino.delregno@collabora.com,
        Macpaul.Lin@mediatek.com
Subject: Re: [PATCH] mediatek: add symlink for MT8188 SCP dual core firmware
Message-ID: <or7l3unt5unsxzktzvgqj2sqzkdalwt6uojbbcclzmnrcqhm2j@qzbdazvmvswt>
References: <20260113020959.2377348-1-moudy.ho@mediatek.com>
 <20260113020959.2377348-2-moudy.ho@mediatek.com>
 <CAGXv+5Ee59X1TufGeyJxo_JeLjSYC6qam=GwRXcZWyYkEQ7fCQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGXv+5Ee59X1TufGeyJxo_JeLjSYC6qam=GwRXcZWyYkEQ7fCQ@mail.gmail.com>
X-Proofpoint-ORIG-GUID: ukQLqVTCjf84ebvdu3KyUxihpNf4fCwE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDA1MCBTYWx0ZWRfXwtIM22qYFGKZ
 +/pBjjIabSOxGFK3XDIioURvJ+tEwXYmdM/6QkPB+HxwuPpvBjUVBc63ftEaGLuEyzP7e1gRhJQ
 h3fMEd7NMD1RfVTZmS+iYyHQWcuB+Zc/Dp2/DBG6BFk7+WlNBHXAEJx7ExXanhL4u/PSytDvPHh
 q8zQ3hDbLn7aEshv231fhD2htx2tJoFSuXNJrZPuGiiJ96lH4SJM+/4aEGOM5ZkXBgh64xc5ZAs
 VxgEs268celFnLwMAipvmidWUub44Vk5QrdYz7xvnOCTiuKwa1mtsUEGO7hgic58RgZKCrQxyEw
 jcOg4+2g33x6AnCSVE5uQ8vrtJXoiBJH3Fz+vtY/NtAXLI4fciKD+OT0RiIVHtk6T0ZvTifGHIK
 8AqWndJtPhYisw6R+cTIxiTjpHccxJ98RgEKt1UXMKv3Hez8c77DkrlbvTj98Bn/xeTmRyN8ADX
 QcEhT9e9zNPaiwQ7ieQ==
X-Authority-Analysis: v=2.4 cv=bpdBxUai c=1 sm=1 tr=0 ts=6965e39c cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=mpaa-ttXAAAA:8 a=ndEMzMApqRaC5L4qs9QA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: ukQLqVTCjf84ebvdu3KyUxihpNf4fCwE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_01,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 impostorscore=0 clxscore=1015 phishscore=0 spamscore=0 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601130050
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_221807_133310_6B362A11 
X-CRM114-Status: GOOD (  27.68  )
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

On Tue, Jan 13, 2026 at 01:15:21PM +0800, Chen-Yu Tsai wrote:
> On Tue, Jan 13, 2026 at 10:10 AM Moudy Ho <moudy.ho@mediatek.com> wrote:
> >
> > The MT8188 device tree (DTS) is configured for dual core SCP, and the
> > driver by default attempts to load "scp_c0.img" as the core 0 firmware.
> > Without this symlink, the firmware fails to load and the following error
> > is observed:
> >
> >   [   79.494105] remoteproc remoteproc0: powering up scp
> >   [   79.496217] remoteproc remoteproc0: Booting fw image mediatek/mt8188/scp.img, size 636548
> >   [   79.497298] platform 10500000.scp: IPI buf addr 0x000ffb40
> >   [   79.498013] platform 10500000.scp: IPI buffer does not fit in SRAM.
> >
> > This patch adds a symlink "scp_c0.img" pointing to "scp.img" under
> > meditek/mt8188/ to ensure proper firmware loading for dual core SCP.
> 
> It should be the opposite. "scp_c0.img" is the proper name used upstream,
> "scp.img" is the old name used in old DTBs.
> 
> So you should rename "scp.img" to "scp_c0.img", and then add a symlink
> "scp.img" pointing to "scp_c0.img".

ALso please use the Link: string inside WHENCE file instead of actually
creating a symlink.

> 
> > Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
> > ---
> >  mediatek/mt8188/scp_c0.img | 1 +
> >  1 file changed, 1 insertion(+)
> >  create mode 120000 mediatek/mt8188/scp_c0.img
> >
> > diff --git a/mediatek/mt8188/scp_c0.img b/mediatek/mt8188/scp_c0.img
> > new file mode 120000
> > index 00000000..8d1dcd4d
> > --- /dev/null
> > +++ b/mediatek/mt8188/scp_c0.img
> > @@ -0,0 +1 @@
> > +scp.img
> > \ No newline at end of file
> > --
> > 2.45.2
> >
> >

-- 
With best wishes
Dmitry

