Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F265CC6B2D
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Oct 2026 23:46:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ReKVbNx+D5AMrmxj0HiDzNjMMNMqfQtzg8j7u13LE9k=; b=xAO2Lyg4Rrz0w73Mp8Sn2twMZt
	N+pXXkjIy7b40A7vZLGxsLH2iEfmIrbwa7wxOL89dHptPw236ryibGkH2W/tcbILFmqi+YxGAdVKU
	Z+s3n1PNk83wgrot8rjFGOH1WDF/t0AKMDb8t0GYiC9ch7DwTWvDPw0WrmVRD8s1C3/r7Vhh+J7/a
	FDpKvuqeMTVF/gmCEY9Jtivn+cyriXmFznkmAbm+0qkFNhE6hE/K7SIvsrGMy+CiPN+id8SkRnC0W
	qmdP3VJPqEM5Xw0nCzB3fHiKfKmb2y++TBN40U/QYDo0RoFuZyozp3o+hVOUIv9gRnS5DJF/PsxbW
	f/OGLlUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xH8g1-0000000GSmK-0MqV;
	Wed, 14 Oct 2026 23:46:29 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xH8fx-0000000GSl3-2VmH
	for linux-mediatek@lists.infradead.org;
	Wed, 14 Oct 2026 23:46:27 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69EHUTIT851482
	for <linux-mediatek@lists.infradead.org>; Wed, 14 Oct 2026 23:46:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ReKVbNx+D5AMrmxj0HiDzNjM
	MNMqfQtzg8j7u13LE9k=; b=O46HmpVJH9qI9Cc9w+33CO6yrWJ1EBw2T2z9pILQ
	Vh4AvXalBt4x0JsyiRg1RtPbCzoKDNZm+GzJRjwbIDX+gf2xYpNGMB+1mHxtzPk0
	P7/80k4m4HKkXINqmyQPdWn0BKSxPZUlVdjJpn8aChpLv5AFvvqlOV8PAop83o0y
	i46jyUhlJ/zq4LGG+MHe60GCNAclB56uAJUrgf6LRmaqJSJDYCsCrp2jqWto/hrP
	JO3HL0jp9VAEUNU+pQYgZdxCeExA36f6FabsbimVXTdpKslfgCJarrrr/8qXhwFJ
	vMTIP4UXyomjpEp7IAiuPUkjHOFKT74/8muEUeqSw6kidw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hae4ws6n6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Wed, 14 Oct 2026 23:46:23 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93ecdc701a2so134583885a.3
        for <linux-mediatek@lists.infradead.org>; Wed, 14 Oct 2026 16:46:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792021583; x=1792626383; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ReKVbNx+D5AMrmxj0HiDzNjMMNMqfQtzg8j7u13LE9k=;
        b=bkVtlfBtCQDjoyssGrNIcRnwWFZ/SvA4Sj1fTMtjjuOd4PWyApCG6nN0i2paTUyUhQ
         BTAwYmEdxTOREp9pMZ8h4hJrLDd5zyFlA+eSnJXgynx6n4RO3sEgb6HeejwVjLQm5GYT
         EpFlGVKQUSR5mK3HD5qoe5QVJnQLESM0IELHimdoz9zlRw+iLEgXQb2mjzXZr4ZHMaIq
         pXuO+kfSY6s/GSdX5HPVKFGpWxP8vO9s42gWbR0fhaVGBW+L2zyHKfb9QhDKqxL/G3OB
         9ewWoC1x1PN+EdZHvE0HxfgwP1uHIQgBc/L+wb6FcnWHAXS3f00raCM4ut0ucIe0KXT4
         ToUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792021583; x=1792626383;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ReKVbNx+D5AMrmxj0HiDzNjMMNMqfQtzg8j7u13LE9k=;
        b=gbAtgRvNdGFFYiB7GVxjx22Y8F7UeyChzHTQcYkBkuWGNcB73AP9R/SXS5smIeEtPt
         7j7YHG+o96XzLIJlP5GM5bv30tKERG5bZ0CHjoqR5yUaNRSVaxUI0nYunQMpckR6zRO8
         HnSV9K/14FSDKn6MICVrUZNmicldnrZ1/DEpGIqGNQCquMpr/dvCNkmU2sSHaxf861E/
         bxl2f0kvQT8rk11PaGCNER5srVaLN3u90bNP2eXQU+YPlsLL76ZYZjDZw8SF2Zn0hh6q
         9kQ3jgPBLiIKrOD9daeNnT9byqk0rWKIcmtDmvYYFE0o1YpcpgLASWKP+z2vb5AftUuV
         y5CQ==
X-Forwarded-Encrypted: i=1; AKwUvBwxGevN4VsTz8BPs6rKjq+zP8SvagmBgGajf21V9msQQxqkn79Kmhus/+/nXUER5CqL70FKEk4Gkpu+hyHwOg==@lists.infradead.org
X-Gm-Message-State: AFq9FYJkiTQWixmi+q1WWjojiib6w7Fusw87K6+aVPPdXpti2OPH9FgS
	7JJnV/XAS0VaP8FMe1/Sq4j3RQVYuV7j2qNwY7jN3HNykpszrJ4ipoBKKzkBIyVFpklReEMrpfu
	TYsBrW8KSuFmJpdvsEt9DgbWlI6tvtopZfIK+O4dpAEOmOKWiNnJAO9OJpba7ch7MnyW60juykf
	U=
X-Gm-Gg: AYBFou2/FlMkJATnqW8UayFxkHcgyWnC+/V6RRYGbbyl1/rcs2RZxCNbwxtzu5u7cq/
	xyDNb3i0m+mkhtJO4OExGcRHs+ECBNN5qlxicmFEQlaD8s0hwC849r8kX9GSdtCRvFTVg+ugXGD
	AQlyKh7pgzC3A/i+xB5V5HbAzsiA2Avxco+7S8YPlLqYS6sUBC+9UIH9lb8sDtx5T49MhjTNbwT
	6hsPOgPMOHUYw7zH7UziiZsZszDvkeT6wqrAunGwHdNZiDIysYdv7OcRJr/uYdWAXoE5/bI8b+9
	gHMVqtHgOCVZtnd5UCm62iSq4nnuqvqHjjMIAdEOSQsMI3oVM9mGeQipTMrrg16U3AFC6zz3uNM
	be4RtlzFPEysse3nYofAN9G7pU0Zs0sYDpIGllQOcRAP3N30NrsvY9Sw+zWCGNQBUMwm2ZjQ7Wt
	KGCfBYVUqd9JVH
X-Received: by 2002:a05:620a:4693:b0:93a:9ef5:d370 with SMTP id af79cd13be357-93ebd0be3d8mr2916449985a.1.1792021583004;
        Wed, 14 Oct 2026 16:46:23 -0700 (PDT)
X-Received: by 2002:a05:620a:4693:b0:93a:9ef5:d370 with SMTP id af79cd13be357-93ebd0be3d8mr2916446585a.1.1792021582503;
        Wed, 14 Oct 2026 16:46:22 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5be33d90ce5sm957598e87.59.2026.10.14.16.46.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 16:46:20 -0700 (PDT)
Date: Thu, 15 Oct 2026 02:46:18 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Sebastian Reichel <sre@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-mediatek@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, kernel@collabora.com,
        Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: Re: [PATCH 1/4] dt-bindings: connector: Add DP AltMode VDO
 definitions
Message-ID: <otk44i4caul5k5dhqsprgmv4hr4jrvtpq2nhcyhgc7ngul5iyl@jmz2ebrwhcgc>
References: <20261014-dp-altmode-dt-defines-v1-0-b657c9b6e4c3@collabora.com>
 <20261014-dp-altmode-dt-defines-v1-1-b657c9b6e4c3@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261014-dp-altmode-dt-defines-v1-1-b657c9b6e4c3@collabora.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA5NCBTYWx0ZWRfX18L5U1GVlZt2
 uB73NX1frkBePfgVvjTnmVWcYMb5nmT6hV4xlAYr3ebdp+LGGvmatmnD1EjwY3Q9uTVAMgbb2Jq
 h8VC3N7XPCNMcU+lNaz8eeavNb1EJ+g=
X-Proofpoint-ORIG-GUID: GEAs2HGXVQfc55uYo1P3E-qjpjEVyMCi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA5NCBTYWx0ZWRfX8qF3/OfF/3fd
 5AsDjhyn6e0q/02AEO1K/LaymePNbnpG2wZRbQT4GFArz4adR8W8r8CrnGTmW7wtnMOV3MAiW+h
 JcGXfJnKDJGkbUlOtV/N0MFHeOhnErXvWis5IwGRUVJAO26VZddC+Nmq9zWef6ypvFDFHSWrkW1
 iaX35Toje2wLZaK4s4GcDI+S+M/sWpP50zXDRRs8cogtVicXZyN9YGCLrmjHAm0IedFX2z+1MOu
 aS+7h04DDy5ussplt1PL78vdQAzgCe+IyAEwpgkkrceOiOCZ8u+aZEuyfQaQyBBFg9XdmtH868X
 MysGdW974t6OcOCUB1Ap7an5t8NvnXIPszzyCbYHiVMxQWzNY+ny5AxexCpbwmo5tjYAOAJel6W
 ybvkPmAeaX3Os6RAEYa/sZYT+amfW5qZmKKnlacIXIn9n/2V3FbYY/eCgyPtRUhLBPhaU3dvkgl
 iVyiYa6x1JB8+JcDLUw==
X-Authority-Analysis: v=2.4 cv=E8BYNqdl c=1 sm=1 tr=0 ts=6ad0144f cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=QX4gbG5DAAAA:8
 a=EUspDBNiAAAA:8 a=YnuTlg8LRq0IA_Y-aJEA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-GUID: GEAs2HGXVQfc55uYo1P3E-qjpjEVyMCi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0
 bulkscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610140094
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_164625_747981_6766CA88 
X-CRM114-Status: GOOD (  16.46  )
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

On Wed, Oct 14, 2026 at 11:31:49PM +0200, Sebastian Reichel wrote:
> From: Sebastian Reichel <sebastian.reichel@collabora.com>
> 
> The typical USB-C DisplayPort AltMode capabilities for a down facing
> port (i.e. sending out video data) looks like this:
> 
> altmodes {
> 	displayport {
> 		svid = /bits/ 16 <0xff01>;
> 		vdo = <0x00001c46>;
> 	};
> };
> 
> Improve the readability by adding defines for the numbers, so that
> the above instead looks like this:
> 
> altmodes {
> 	displayport {
> 		svid = /bits/ 16 <USB_SVID_DP_ALTMODE>;
> 		vdo = <VDO_DP(DP_CAP_DPAM_V2_0, DP_CAP_CABLE_TYPE_PASSIVE,
> 			      DP_CAP_UHBR_13_5_UNSUPPORTED,
> 			      DP_PIN_UFP_NONE, DP_PIN_DFP_C_D_E,
> 			      DP_CAP_USB2_USED, DP_CAP_RECEPTACLE,
> 			      DP_CAP_SIGNALLING_HBR3, DP_CAP_DFP_D)>;
> 	};
> };
> 
> The generated DT binary will stay unchanged.
> 
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---
>  include/dt-bindings/usb/pd.h | 58 ++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 58 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

