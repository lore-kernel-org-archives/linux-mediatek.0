Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C69ECCD195
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Oct 2025 14:52:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jPmtY2bWstZxGYrHD2oLA4kDgMlBAGLM7cSsgPby8R8=; b=GT/5K3KVDP6mlW
	OjXTmZEYOPH8NTcuIiI6tGJSFWokpP3sMEAnxtcoRaMHFnWRSClukyhAA/JQeceuUJFMT7twK8GAG
	K4UT5kpvgsAHNG6e79n99SV2QjX0EfTvDDGk9lH+m1oDjeXW4ByyElO+9WlHVNPvAH77JOokd1ACN
	g9SKRoFl4eF/TcgwaDUHnoL3mQldltCaZsX86I/LHhx9+u+CQLwqw2+UJX/edjx+vUO05G4Ts2Xyn
	g8rgEJydmvi4ha63kmcQPVoDfEJW7mZVgD8udBbO7FaeYEwcu0rLXdXrokxHA0DElbohALEvuNeS/
	XeUi0RehuxOkIra/2CcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9PLN-000000054lG-2QRf;
	Thu, 16 Oct 2025 14:52:41 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9PLJ-000000054h8-2R3j
	for linux-mediatek@lists.infradead.org;
	Thu, 16 Oct 2025 14:52:39 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59G7TfRq016695
	for <linux-mediatek@lists.infradead.org>; Thu, 16 Oct 2025 14:52:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=jPmtY2bWstZxGYrHD2oLA4kDgMlBAGLM7cSsgPby8R8=; b=oK
	0IvGUFq5Jpvs+nDFM/Il2MpT/ilhF7MHPLO+EQjXbkTN5WAB2rI0VHOSOOV+Qzxv
	sRtsBKGetq9wWxLEcY2lXvRoMYL7LPpZ9pIVBfAimdy6R2mv9p6gAudwk8iSrs25
	65FvBqQsyi+Yt4UDL56r1HgrPj1Jwtkn5AOnrPf0622q69XSNno8TLBKC0CUEYol
	ixpON2jXbKn9SfLTwAQqtm6rDhMB2kh0BfyW/hagjxvIxYHeAEDIseAWzJedm9W+
	vK8BUcdjcOH0s4pKDHXdtZfLjAruVuPpD/VTQr//0Fa2Z6QX9Ou1aNUUAQRav4qz
	6q8Ce5vsU3zTX1Onw0lQ==
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com [209.85.160.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49rtrtdmg7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Thu, 16 Oct 2025 14:52:36 +0000 (GMT)
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-3c96de7fe34so233316fac.0
        for <linux-mediatek@lists.infradead.org>; Thu, 16 Oct 2025 07:52:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760626355; x=1761231155;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jPmtY2bWstZxGYrHD2oLA4kDgMlBAGLM7cSsgPby8R8=;
        b=IaQ+W+IoABra4BC2EI7mVyAcxTAkx7T0TeIzcITPcJYSSC3cCsUL5P5LhOlIf5mgO+
         8h/0H+EQMq4hSDp6kazK296P2OO044IC4MYvh7z26TvDISk0lxEo4Vzb5wKWSdoVuB34
         Z35lV6AID6DfX41XpOyOBgslyt++FqrRo5KaC4L3WmMl3OwRcPbIWN17+gTmmSOdmIcm
         XpnhinC/3csqLTVEGWoDKHh6DDCzTkgPNCHMEf4c6NeEELZN1K+aR2B1i5wZpsiB3BqR
         SAjPORxS83olUseynHF36+KiwTT3ISXXhFSLUmhYq+iZ+OZh4jLMljAnjmqSrBZsb/Pg
         k7Ew==
X-Forwarded-Encrypted: i=1; AJvYcCUsGVrDXBrSGbrDqUxXKrZR4uM2j7FbIGzdPfmDiTkAwvXr4eOEm26KXpboyQHpXGMDq2Z80SxJ+xvENzaqHA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwUk+GT79348tHuwWBHevLR2obir83hnxKrId8x1r0k5NaZoNn/
	Gg/PF23wlLkhOVtwnFUoB0yThRlKp2NKTEMBGhPvzZC048EzQ8cE8JMES5L03+1mfiV8q4R7vgY
	S/WRn8KDLZg9jUmgYqb30vXsB/TpaogydlN9ZFpP3gtGNg+lFpGPsx15kPsALj0QJvuuG9MN/i3
	6qOcWI4FW793eX9rBrK7JjEkPSGgspqaN2M6cadKPkjxXc/rFlvQ==
X-Gm-Gg: ASbGncvbAt4kh/tloHIN7DsgPpwHn6o+JSkzHI9kR21XT55C+qUoYhpeYp1QIkQp2Gg
	q8xB+5ovtU93rr2ziAiSH63LFhXKxSYlki36bLnvMqaLnVHTuvPvkAjo85aE1JYbFLoub3TKI4f
	cW56o6JSi4EUkqpP+EJfrpuKuvvRJfdOycfSBLuMHUL8K74YOPxyZ8uid6JTLLRL1JtiyUIbuBk
	SlyXGsqq75q348=
X-Received: by 2002:a05:6871:2e88:b0:35d:a9e2:fbd1 with SMTP id 586e51a60fabf-3c98cfa8295mr10095fac.21.1760626355268;
        Thu, 16 Oct 2025 07:52:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF39ocujuIwT0Et62sHrBT+rRRN4wBRxOHxmKLmre65EnhOwqDPEsCuGBua+8VJiCAAa15gVkxk2D9mH6TwzQ8=
X-Received: by 2002:a05:6871:2e88:b0:35d:a9e2:fbd1 with SMTP id
 586e51a60fabf-3c98cfa8295mr10075fac.21.1760626354773; Thu, 16 Oct 2025
 07:52:34 -0700 (PDT)
MIME-Version: 1.0
References: <20250718105407.32878-1-vignesh.raman@collabora.com> <20250718105407.32878-2-vignesh.raman@collabora.com>
In-Reply-To: <20250718105407.32878-2-vignesh.raman@collabora.com>
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Thu, 16 Oct 2025 07:52:23 -0700
X-Gm-Features: AS18NWBmqrEUHFQlSWdIGqm2-_tBPDNsmr766wJpJByzaFclGFLQ0RGnzuLEsPQ
Message-ID: <CACSVV029ueL_4Y5irmmOwy_9QDQGqDe_1wCGUe22FdefQiNjkw@mail.gmail.com>
Subject: Re: [PATCH v1 1/7] drm/ci: disable apq8016 and apq8096 bare-metal jobs
To: Vignesh Raman <vignesh.raman@collabora.com>
Cc: dri-devel@lists.freedesktop.org, daniels@collabora.com,
        helen.fornazier@gmail.com, airlied@gmail.com, simona.vetter@ffwll.ch,
        robdclark@gmail.com, guilherme.gallo@collabora.com,
        sergi.blanch.torne@collabora.com, valentine.burley@collabora.com,
        lumag@kernel.org, linux-mediatek@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-rockchip@lists.infradead.org,
        amd-gfx@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        intel-gfx@lists.freedesktop.org, virtualization@lists.linux.dev,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: qr-waw8eCakcwXxBGaYNKv6w4MyWoLTo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDEzMDAyMiBTYWx0ZWRfXzLtfXNpRkP+4
 t9d57Lb9PWkyz9DI1wkYli8Rl7Yn5YSWH+ckwCwrkhxLwMBx/JoCrpLOmlSvWY+VegbWXIeYPdU
 H26hNmXvbZJFxmfuTddUoVDf92iIL+DchLzissg2obodH9auLRMIlFxvcm8a9eyxNDWfV0pYWCi
 RuAMgfd5Gb91naytD/jzhPII62zfJW8/ABIIuG10JlJ+EQWGAXB4dAeTlGnhJtrqKzFc3DfCRJi
 VYx18BOkBZJkeX7GI/x5rsb3IIybGhvcxXmdySZPXBfS9v0s1houwJYF7w7R1q6YpK0lYZDz4F5
 eEZO9UA6m7y2oi9c2TUvaq6VetjTgSzg8rYHHClbIRVucNd1HKXdP3XQ2r+qSE83+6vGeuZ0nf7
 gf2nkF7yF6/mmdm/OBibU7ija/3SEA==
X-Authority-Analysis: v=2.4 cv=SfD6t/Ru c=1 sm=1 tr=0 ts=68f106b4 cx=c_pps
 a=nSjmGuzVYOmhOUYzIAhsAg==:117 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=QX4gbG5DAAAA:8 a=Gxbm4VOBLxWGKnsTXboA:9
 a=QEXdDO2ut3YA:10 a=1zu1i0D7hVQfj8NKfPKu:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-GUID: qr-waw8eCakcwXxBGaYNKv6w4MyWoLTo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-16_03,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1011 adultscore=0 phishscore=0 lowpriorityscore=0
 bulkscore=0 impostorscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510130022
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_075237_728550_0221E1EC 
X-CRM114-Status: GOOD (  15.24  )
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
Reply-To: rob.clark@oss.qualcomm.com
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Jul 18, 2025 at 3:54=E2=80=AFAM Vignesh Raman
<vignesh.raman@collabora.com> wrote:
>
> These devices are being moved to LAVA. The jobs will be enabled and the
> job definitions will be updated once the move is complete.

fwiw, the runners are up and running in LAVA now

BR,
-R

> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
> ---
>  drivers/gpu/drm/ci/test.yml | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/ci/test.yml b/drivers/gpu/drm/ci/test.yml
> index 81147e86bfd0..53d19ffaaf61 100644
> --- a/drivers/gpu/drm/ci/test.yml
> +++ b/drivers/gpu/drm/ci/test.yml
> @@ -148,7 +148,9 @@ msm:sc7180-trogdor-kingoftown:
>      GPU_VERSION: ${DEVICE_TYPE}
>      RUNNER_TAG: mesa-ci-x86-64-lava-sc7180-trogdor-kingoftown
>
> -msm:apq8016:
> +# FIXME: Disable the bare-metal jobs. These devices are being moved to L=
AVA.
> +# Once the move is complete, update the job definitions accordingly.
> +.msm:apq8016:
>    extends:
>      - .baremetal-igt-arm64
>    stage: msm
> @@ -165,7 +167,7 @@ msm:apq8016:
>    script:
>      - ./install/bare-metal/fastboot.sh || exit $?
>
> -msm:apq8096:
> +.msm:apq8096:
>    extends:
>      - .baremetal-igt-arm64
>    stage: msm
> --
> 2.47.2
>

