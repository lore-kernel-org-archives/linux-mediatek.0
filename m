Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7663EC83F17
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Jul 2025 17:11:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6LV0K5UJorWZ+7uM8Thq68wdIY0Xdv/k6eWXam/eClc=; b=QpOiaJJYjxCZKHYdz92sfqLdbH
	Fy7FZoUS0H777VDbpAtasSLFdQsWqQ7han1TYvsvxdT1C5pX3h1AH3ziCnmo7fny7knXnN6715ZyI
	3WxLJYkAT1tZenhXqA0deUl7F48XhQnSSJGseCpzLsVLq6c6/4i2wxqLwMVorNwLD5iBEdTQtQAZI
	u7/gA5wZJfiQruix1sXV98onfkp4VOFBV1iQl6kAZahlyYy03EZB4rTP2HYYGbsv55JSCIwLNTswB
	oNfuf5f9X2zXdXHSvwBR4VP29rINQ2cN7nRzPUfzsLpAq1K0UBoXZ/MJloe/TmuWQLRhuKC6F+LBo
	v1aDq+SA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubMhg-00000002vWA-24D8;
	Mon, 14 Jul 2025 17:11:00 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubL3a-00000002f0K-1Dsb
	for linux-mediatek@lists.infradead.org;
	Mon, 14 Jul 2025 15:25:31 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56E9ZbLA031729
	for <linux-mediatek@lists.infradead.org>; Mon, 14 Jul 2025 15:25:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6LV0K5UJorWZ+7uM8Thq68wdIY0Xdv/k6eWXam/eClc=; b=kNhQqIjoc5cCmRQ7
	wdc6TlBQ7yruYBIu3W+dQihuwiFn+tK6s4LmFT0vP4gI2Q1PQWK9xiVEVvN1HFnf
	JBou7nxc43Fg3nl8pLI1ta7dTzm5nRspNy0P3KOlsD1nu9CpxIT+ZbWgKyCyYrMs
	fPRJlB5TOlY7F7uwC+4hoo4zT7ToA9BETKyikjMRlHoXc8DltnFt2lQmQ/m/zJbe
	DaZcNUVamVB+VoSCsr3Q4LdyQX3tXnbEyNIfej5VPAnSfd6ektwxfHwOxL+NOUKn
	92seAj5xxzqlrbIVpkhLpwbKfiJYbUTWnZCAwbuu5ZPZyBRq09Ktx4T8Pa8P6aTo
	kfZmEw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ugfhd2xy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Mon, 14 Jul 2025 15:25:28 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c790dc38b4so732264085a.0
        for <linux-mediatek@lists.infradead.org>; Mon, 14 Jul 2025 08:25:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752506727; x=1753111527;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6LV0K5UJorWZ+7uM8Thq68wdIY0Xdv/k6eWXam/eClc=;
        b=tm6W3mwEG21R/IACvy0YCD6WrFerxFEc9wQdc3cc7tj+gO7fg6WkmIbqq1m82Kl5EC
         kZ+W65aWk4OaCB21BA9rg7xw2qos279yk4UfxjW07zZ1v6CyEKlZrGHJK/etRYXe8Ai/
         dVgp6N6IvPMABDx+LRZTw0gbUSPe6CHiVw1iizi/NPXq3N25GQS3qJsTDYuICqgtUkE/
         UtkZExNsrcNeNn1azHYGzxbAzagdVjvP9O1LV4cKpXqG4ich6WEnkjEsMJdfEtfvimfq
         XMsBEGtSQ7HQKSUZuBTbfD8vlTjg+mTgQQ5efSaaj6I32RVInOldvRHspeZ9mYh3EbNw
         YcDQ==
X-Forwarded-Encrypted: i=1; AJvYcCW3yvX1FuSQgl/tSSd1efGog6jJWKgkX4OnuDu+KvyQmxdvjR0Fq6jcXHfCTRYoxyFyFZ9Iv53ruoUCR1u90A==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz6qCBno8PRlIdxh4YqjqT4cVKO7Ka79efxS7aIzB++5F0I/sd0
	nlR1OmuTS+1k1ZQNttI1T+Rn9Qy1Cjh6+YGHV4gINloAMn3v2LrTiIq991wRHw+gpK4qJkegDKW
	tRmkv6g+kSmKiaE51HmmpLQbB9Pv1r/qVqtZTC8aPrvsW8oAgOp5QSGckPZBI9x5TocXiJ5KlmK
	w=
X-Gm-Gg: ASbGncuGrIEY+GpRVxEOdQZYhmjlJYGR4MSV2AOTA63xrDozRdPduKL/DcvJqJmyH5w
	DrjgqRnq7JAPQzrMaWXNxOuAVSWg2hQC8xjjUc2oUV5L68ffJU3O1gAX0+20p6higMAwUE2wuhd
	EmHxfjjH+E5U8f6RRgzjcioHNthZtNYdHR4kUh4aJd+DjmmqCZ+4xBY/yJZjdg539ohHhBaBI7M
	GE0yQuheBSIJO0aMxaVWR4EtYZlB5bjlLnOYL2C7EnRPzOjHNAeeIoMVHfISOEE8DPdinZnnIrM
	MPslrOBHZUpsLZT09Y/JCNlW/8DKdn53vraEFk2CdJ9bql67jl8+5vVp4x6gysMPbqVAoLuFmrf
	ZdprehLt9Tcl6O167A2GoRJP5MCPE9SK7kTlGg7moQ5Vj7W3+Ns6O
X-Received: by 2002:a05:620a:ac18:b0:7dc:b8aa:d093 with SMTP id af79cd13be357-7dcb8aad0d6mr2168475585a.20.1752506726634;
        Mon, 14 Jul 2025 08:25:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFwZ25/ylUQ3528GkME7MJF3ljBMaRtFCayAvIoA9pqD+T/SbwujgEb5PAw4osLJdBxZhSxNw==
X-Received: by 2002:a05:620a:ac18:b0:7dc:b8aa:d093 with SMTP id af79cd13be357-7dcb8aad0d6mr2168470885a.20.1752506726150;
        Mon, 14 Jul 2025 08:25:26 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55943b87bcasm1975359e87.250.2025.07.14.08.25.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jul 2025 08:25:25 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Andy Yan <andyshrk@163.com>
Cc: mripard@kernel.org, neil.armstrong@linaro.org,
        dri-devel@lists.freedesktop.org, dianders@chromium.org,
        jani.nikula@intel.com, lyude@redhat.com, jonathanh@nvidia.com,
        p.zabel@pengutronix.de, simona@ffwll.ch, victor.liu@nxp.com,
        rfoss@kernel.org, chunkuang.hu@kernel.org,
        cristian.ciocaltea@collabora.com, Laurent.pinchart@ideasonboard.com,
        linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-kernel@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH v3 0/2] Pass down connector to drm bridge detect hook
Date: Mon, 14 Jul 2025 18:25:24 +0300
Message-Id: <175250667117.3567548.8371527247937906463.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250703125027.311109-1-andyshrk@163.com>
References: <20250703125027.311109-1-andyshrk@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: evSJzZVWCfo4R9mY4zaqlT18DlT2EMSP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE0MDA5MiBTYWx0ZWRfXz8M8H2HLsJeo
 Ug3UUwnhIxwPVJm8FoahuCwf5os1YUARVNZodvGKDW59oGbkq0HXDJl8HTSrGp9x9FkYKTl5oBA
 wEuB4x4tCHYz3oKlm4sHCq+TTI3b7Bn0gt/vQpkb7PIZ45YiC4PU+BqYgJRDJ+EeHWoxK8Ia9uy
 TFACc+ZVtpn/Nsdj9hXzWfVThyjoA/FPsjIKn0hn0Gu8zliAnfGcEElz9Gd8q3jbIkGbkweczPl
 K8rfRNFqcctWByiSVmbhXToSFW6HfJ+LlXytDgtDJ8w9jIn8iB5vYWY1jjiFUcY63ON3LDDU7Le
 VLrEp6E1BRNXEG717xgaGyN/bd1mjGEi8lkpXIXCGwiNezU/Oe7YhrPeCgU6M/5Or3gCkkttosR
 0frXhZZpavB4LuG7LQSWUCTthmkU53CB/zYnkrVz3eeSdcg/ViX/EQGPQjcuibw7lU+/v/9M
X-Proofpoint-GUID: evSJzZVWCfo4R9mY4zaqlT18DlT2EMSP
X-Authority-Analysis: v=2.4 cv=HYkUTjE8 c=1 sm=1 tr=0 ts=68752168 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Wb1JkmetP80A:10 a=0YRiGFPyvPvEouyWwLEA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-14_01,2025-07-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 priorityscore=1501 bulkscore=0 clxscore=1015
 mlxscore=0 mlxlogscore=999 malwarescore=0 impostorscore=0 spamscore=0
 lowpriorityscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507140092
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_082530_331785_C1155B84 
X-CRM114-Status: GOOD (  13.05  )
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

On Thu, 03 Jul 2025 20:49:51 +0800, Andy Yan wrote:
> In some application scenarios, we hope to get the corresponding
> connector when the bridge's detect hook is invoked.
> 
> For example, we may want to call drm_dp_read_sink_count_cap(which needs
> a drm_connector) at the dp deteck hook, intel_dp and nouveau_dp do this
> at it's connector's detetc_ctx/detect hook.
> 
> [...]

Applied to drm-misc-next, thanks!

[1/2] drm/bridge: Make dp/hdmi_audio_* callback keep the same paramter order with get_modes
      commit: 02bb63d1a59341032b8e7e4021e18d044bdb1786
[2/2] drm/bridge: Pass down connector to drm bridge detect hook
      commit: 5d156a9c3d5ea3dbec192121259dee2c2f938fa1

I fixed the building of cdn-dp driver while applying.

Best regards,
-- 
With best wishes
Dmitry


