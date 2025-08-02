Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91FE8C87FD2
	for <linux-mediatek@archiver.kernel.org>; Sat,  2 Aug 2025 22:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xl0OxxNA7ca072iJm6M/zPG6jGGT3ai/1U553419los=; b=XTxcVFkj7foKPSge5IVNaNf+iD
	bBTNXHInK0bHs/QylRjCraQfkf/GYFkHigEfaDH24Yv/SeMvCZ9GCimH5fzHlSDK3AQP7+vefm+jB
	Jundzw6UyyIaUWH3eFaX0/EGqavj3pI2Qs6mUInPmq92NCQmZ3k3UbUjpWc7lo69zuZ16Eg4D6dNU
	b/ApvTSsB6MTXy/RyL6ABSyh/GAbMbHPcNgXy5swJxzSgwmw7eb4UIaMDEfWHjj3cUCixoWsyQUPL
	7OeFWOvGuGVdXrcLKScStiTy4V4BoejJGJbj/z3wjr+49Wy6aUJ+YUxTEZO47j06aOVptmJslJw+t
	pNID33BA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiKgb-00000007w7P-3oTe;
	Sat, 02 Aug 2025 22:26:41 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiKe2-00000007w1c-0j4V
	for linux-mediatek@lists.infradead.org;
	Sat, 02 Aug 2025 22:24:04 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 572KH5KJ011526
	for <linux-mediatek@lists.infradead.org>; Sat, 2 Aug 2025 22:24:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=xl0OxxNA7ca072iJm6M/zPG6
	jGGT3ai/1U553419los=; b=aeMnVJPpOqTPR3I2WDmw51lqLpvUV2fYhyARPtzJ
	SBY2x5WNIE57zCPGcVper6imusSo8jxDorgVgWeJX/aCGimBRqOdNIqF+WBI6uq2
	6nHGncnFUryddtwt3fyA80U5I6LqtoW6pHJfOWSFjzspVoEbk2xGx1GPQgOxl4WY
	fvF8d7J2RFihfDNHah1LU2RCO3LBGxZVFpnZ4OB7fu6ItVyTwTZnLt17G3F5BPe0
	+rVzOdk9X/GFYA4poaOBg6Lrdk5V9Ism/2L0LX+2heAaaBLpTMa5zcFH6vKbCh3+
	GU5sp+rKsLgR8ph1MVvu97s7OnDKIPp7fR1C9fHarRMeYg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 489byc19rw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Sat, 02 Aug 2025 22:24:01 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4aeb8b6acd1so39653521cf.2
        for <linux-mediatek@lists.infradead.org>; Sat, 02 Aug 2025 15:24:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754173440; x=1754778240;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xl0OxxNA7ca072iJm6M/zPG6jGGT3ai/1U553419los=;
        b=AaZ/jDjQYVtTtzWE0T4l3F64e+2bcAVdJj9HWAo14LexNyzJzDO5PBZwAwujTNbWmk
         LZrduDb9t+rNf+BxajYb4v5Eug4hpWmTeD4RfKjW+e1gUC8GFMdHekwr1kn0RZ4fkU2n
         azO5qSzuV8s/JKTZlDtkm0Jj9hDBgLDO2cnAKkwuFojubRL1y0efI+1ipVsaBiGPTX6B
         yy3uvllj4PN6hERu37l9e68YjlYS5bJNRswBP6loxIXQ+q+YE0Ivnq1XwK7zfLcyuT8k
         cLejGt1vlyx82g5VqVfe3cVA0p9OOMMFnU6HtLbUM+TL6ynZrBkobu3DA1SfIhFOwolj
         tOEA==
X-Forwarded-Encrypted: i=1; AJvYcCUYNn7e2bgCkX4Gdgfr3HJVbTL5ibssK4EMbPuEFegPdvC61F18IWWjShZ1N48iCWBnRuJvspNAOy0uxHIgyw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyPNVsSySsMPIXJLRk9aKZTYuGNh+xXnCo4NT5Z+XU131Q8UVdt
	TEF9ZAzQT65Wchdujoed79sB8iboeNYUrJOGZP/Kd/w3EizIxRv/DbjmWScMzbSm5cfxw6InTvm
	k82mMcNEiSel7QK1WDJ/I/16Za0fxwYz5ZlGLCNkkZovZfFqy+Gi93pCsG9cSlXGpqAk2jqZTFL
	E=
X-Gm-Gg: ASbGncsp+1N71F6G4Q1Jqc4yvjebpLwohrvm3umXCIr6SKkDkUdR74KALQ4T8h6wN8U
	dlNnAZMt05QTI7ApKTYYnPynda5Gfw5P7bkYWy+akqP+8+Tu4K9kCpKQ/3dURe6EMUcdfYiKH0R
	80gXuQ2iYLNWnd7jytiu/iPEc9LoxfRbUbjNinzLZURJpm8EMegFQjR/CKmVAK4I4w/yg1BScIa
	v36emUN2QvgD9p7OhmWYoHpeUAmxsbNYWtvudvJJF3vYuj8GdWhko+4Dc7yWGXQW2q/oX7WDV5X
	/zjDjcxjBn1sebMzU6KcsaSuhVeT5IKA9j6cuI/vhfOn6oqVv1SvVqOD79dNeZHIh//2ZKYrlt5
	Odc//OGSxK5ZjlxPgOkBtoPuc4YY047YIs2E2ADX9N5KSJ/tWPru6
X-Received: by 2002:a05:622a:2614:b0:4a4:2c4c:ccb3 with SMTP id d75a77b69052e-4af10a4a6f8mr71115891cf.38.1754173439769;
        Sat, 02 Aug 2025 15:23:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGrRsxcmSymm/iOQUBWA1JUQnU1xwsXzPXR9p1T+dpkt3Av38hBwrNFCZmoKC0DXjNEzzqClg==
X-Received: by 2002:a05:622a:2614:b0:4a4:2c4c:ccb3 with SMTP id d75a77b69052e-4af10a4a6f8mr71115661cf.38.1754173439390;
        Sat, 02 Aug 2025 15:23:59 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55b88ca6776sm1105446e87.141.2025.08.02.15.23.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Aug 2025 15:23:58 -0700 (PDT)
Date: Sun, 3 Aug 2025 01:23:56 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com,
        simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, matthias.bgg@gmail.com, ck.hu@mediatek.com,
        jitao.shi@mediatek.com, jie.qiu@mediatek.com, junzhi.zhao@mediatek.com,
        dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, kernel@collabora.com,
        dmitry.baryshkov@linaro.org, lewis.liao@mediatek.com,
        ives.chenjh@mediatek.com, tommyyl.chen@mediatek.com,
        jason-jh.lin@mediatek.com
Subject: Re: [PATCH v9 00/23] Add support for MT8195/88 HDMIv2 and DDCv2
Message-ID: <2eq5je6xk4ly5lxijit3ufor7pmm7mgivbuigzr35lrbe2ryvr@3axnsyabigm7>
References: <20250415104321.51149-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250415104321.51149-1-angelogioacchino.delregno@collabora.com>
X-Proofpoint-ORIG-GUID: BgQESEVPg5GPVOnhMygPE65ZITHeeQHk
X-Authority-Analysis: v=2.4 cv=Y6D4sgeN c=1 sm=1 tr=0 ts=688e9001 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=k3YYP44_YlkhweOvE2wA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: BgQESEVPg5GPVOnhMygPE65ZITHeeQHk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODAyMDE4MyBTYWx0ZWRfX39qi42uWgA3e
 b2xxGCI+GEsZfLRc5AL1/N/Lem17xS+1Oq5A0QVKGVZap1eGy6j9yhywWL6MFWSbLleT4WHBdMV
 gxi3S6WcWXBdtn3FzTRI5RE+BZVgAI9UBIhh4P0QQN4D8nNWYz/MzVWCEi4e7oA5MmmrLgDBjZU
 4iuxIXeFh25rfR0uabISCjtvyK3lWRoNRbvJCJKU/AzHPVX7AqESmAyH4BGN26fTRz3j0CgWxbP
 HguLML3QkGfdulSFvcvseKB3qujdYjfVtFnL/OcewoY61jNjhfW0wYJff3O0Fq7YzchMkPffa2R
 EDt7mRwcioLs2fjAdTlZzVw7+caWjgLzLgtOtBr1EjKY80V58IF+tbOV9h6fRYwhkJI/CmqBv+h
 t3GdXT4wwva6Lb2MeT7SNGUMuvdLA81hs/6x4RsFIN3Hh6PqIeEi6KOZaVEgtVWVHXFQVlnA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-02_01,2025-08-01_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 mlxlogscore=735 suspectscore=0 clxscore=1011 lowpriorityscore=0
 phishscore=0 malwarescore=0 adultscore=0 spamscore=0 impostorscore=0
 priorityscore=1501 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2508020183
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250802_152402_230520_818D7D93 
X-CRM114-Status: GOOD (  13.69  )
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

On Tue, Apr 15, 2025 at 12:42:58PM +0200, AngeloGioacchino Del Regno wrote:
> 
> This series adds support for the HDMI-TX v2 Encoder and DDCv2, and for
> the direct connection DPI as found in MT8195, MT8188 and their variants.

Angelo, just wanted to check, what is the fate of this series? I think
it wasn't updated since April. It was a really good example of utilizing
the HDMI framework(s). Wink.

> 

-- 
With best wishes
Dmitry

