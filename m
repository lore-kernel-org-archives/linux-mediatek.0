Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A4F4C98321
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Sep 2026 12:20:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=voQ2O/Dzz6AWd22TDESfkLRIvWXyYSS44IiGTAccKHQ=; b=ZY4jYY2Dc7UixHmA3IKXVTyvtc
	ev2Lln+F+whrBZ4hVvpWXrH6CMC0sE5VgBv3VM4WX2M/RcGEGcBZrwH/etBH5+UpnUkMkHLhNHZ9A
	WiMZAc5tR/ctU2HzEX1uvkcZZ0vS7OOGmjS8NOBlOTKgTCnMeDtz8qNMrz8vjr/y+1lRohFKPelEP
	p6PgKdR85qTW+EDFT9p3vcNz4g/HdDDkulsY3D4eFmcnSiZWTAX7ARmDWkRjeqiRsmYVZYZTQ6dIQ
	3toZj9uP3ilOpkP2Ott4mnaZ902Ey+stQNc5Gr+sGoZ+AwZgr4r3tPG6Rdg3dry8dxg56xUbiZh8U
	r1RJ2qbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA4uY-0000000DIzn-2ByV;
	Fri, 25 Sep 2026 12:20:18 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA4uV-0000000DIyS-2hsX
	for linux-mediatek@lists.infradead.org;
	Fri, 25 Sep 2026 12:20:16 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68P4YS432911644
	for <linux-mediatek@lists.infradead.org>; Fri, 25 Sep 2026 12:20:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	voQ2O/Dzz6AWd22TDESfkLRIvWXyYSS44IiGTAccKHQ=; b=b+EXR7DjyDoIih8/
	HSzKykaJj5kLdewcfE5ub/xLBS6N6uqWV639I5n1FU7h3hq4l/YPrsx5JDAm1EiP
	DEOfPIOUVaNtDRle8f9tTyHGIh9caGOwqh4qKvMzFFHwZTu0gTJ9JbMKNd9QRLeh
	24hD5tTLgi9bLxQPNQkvyx3MLuPupxmEQ+IO0/Zs3FkNHRhV514ThJrRK9sdIBAe
	Lsn8ziA3yoRH51UnqRPubv7wNPdnHnexJxTwp/3rPENqzCRmEkTHw4Nb5iMvGtDP
	zl9xEmXub6aeHCKAD+4xT6O88uAW1QVNJPWsZh6PUaYFlxfUM1vp5T20swzcMz52
	NaOlpg==
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com [209.85.128.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gwhm51f7k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Fri, 25 Sep 2026 12:20:15 +0000 (GMT)
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-88b853e209fso10690987b3.0
        for <linux-mediatek@lists.infradead.org>; Fri, 25 Sep 2026 05:20:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790338814; cv=none;
        d=google.com; s=arc-20260327;
        b=oQDMwzA0VIQbhdsJVHf11oMGOLMXVAP7PwRFFtQYjbPDnYZI26jdHQMLHYURpiqQiY
         s5m0DCaOHDybGISOgtlV7R41lLjA6BmAo+iQ6yuVpq0o7U50oZRTQ3K9pkAVS9rTL//S
         KxcCjIP5Bb5TC9vCUZGSyB9zwXN3trkObV0XSWOHSHNvvAx7tLj8ozVYgtPt+X3xeSpZ
         Z3EnIJS7xSomVNva4E3fxiL2tMKrOG1Wngty+WCno4rQWywFqY8u8EteWbvH22BqNB/I
         pTZtPZEFOC6wAnPE/W/NOBfi5YQU08068w0P5T/zdl5W2kONZzSTvs9UX3/yqt56Dp/v
         ai4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=voQ2O/Dzz6AWd22TDESfkLRIvWXyYSS44IiGTAccKHQ=;
        fh=piPa75uZuKTju+5matAYyUj8f4s6RSFV3OV83NQyI9c=;
        b=igNYqMFyr3i9M4lwadfsLRqsmw+24SBZO7pPm5NULIKUPXesg4NWdEcLkHGCTAtMER
         NwhLSyrWiIxl1l2hV4bo1kwH4Qr++MWrMRNpbAPuHLQy9KqE7dMgQgXSUhpG1RFv1hb/
         jIhqDSe1H8gpchunAFTE8a5WAKyTfxomipJqKCMqhy7YaF39uZkV4fv0tBAPiVSUf8re
         qH+TgiiC3R+zDvlpbJ/ca9zSozUTM6u2q3QLHzEU1FjoAwmaLJcbKmQ+S1rOK68g3aDa
         hR/qmSOCpv32FT+fmsC3Nb1UVwRNbPZehCEqG3g8DMKi+Hf4yOECdxyxCaMCikorWRMo
         BYcA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790338814; x=1790943614; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=voQ2O/Dzz6AWd22TDESfkLRIvWXyYSS44IiGTAccKHQ=;
        b=OjAn4js9kT9kpsnkFXVb2c4OwA50X8bmuuO/MWdrO9/9h/p1O9Kt0cNtdlQNUJ0YpF
         oTxTJcDijlk5crOIq5msI7SdC7q5qizRocb9G/9eU5YlkTjBuSM+U4aAdLPmn3bLbRzh
         oys/vzHVc8DkZtFO4lWwsHulMSC/SXa+xiM0Im/y+X09v/mFvkKg9WvN5Ldfj+cmEvnB
         3LAvsO6Cc6Do+xht+Zs8zAmZUcvObIIjQ/ipX0QNrH+ghkjC25GjjBVDbKIXg1i3x1m/
         FG9gGysGGX0N/r0LIb4yKC1UfvTJBoREeoCN9An5y9/J6QtHcE0VrK5UX/Q2ebyClzAm
         bjPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790338814; x=1790943614;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=voQ2O/Dzz6AWd22TDESfkLRIvWXyYSS44IiGTAccKHQ=;
        b=mxfAkhboRRXjnVABzyBWB6R6X9BBfjTG5xZndMB0GMpqdg1GzKHPh9mwi3MKOXm2Wa
         +DmZGuGawvKB+3H16aa1wkemDY3OSIJa5hl4R08ew0nhgH+ho+jZQPVWXIxyFw3dhNgu
         54VrvkRurjT/PRBvGR0XqfpCghlwlSc3UChQqSLRhbulcsqlkapbiEQEbwMchLozR0ss
         HM80mpMP7OoxuFdorx59RNFESwUJlOF3blXUANI1l4+H+fhicTMWhwNqTAy+2MaZOhyk
         mg8XQKjpurtZOwPKsy/FKjAP0uCIOlGLW8uQjMQLe3p5E7LYl8tHZSKx2kIAm4ba3LO6
         OKYw==
X-Forwarded-Encrypted: i=1; AKwUvBy3o1qY0VDGyuyr5CPWQMYuPu6/rD+kzj3FaKOONTD2v26RetsD4sTwnXUXX7B0WS5c1WpKnFOZI4QHWOSJIg==@lists.infradead.org
X-Gm-Message-State: AFuF++nefscF7yWThRRHCLXqJB7FwkZS9PeRuawsilwnJlKrG/eK210M
	8GoMnOtQX2u+qkf6hnbwM9axeNGrDDaQpgxWQ2eJ8O6vKHEHoqFgGIWRgrzvny8sTymsYf0BwIW
	qHlaNynvEI0CfyqZfsmdMBkmv9SpCCZ+20HKDY6eYds2VfQ2V66FZCQqoVO9AUhQr2MgIRsNJ25
	eqxiPRo5Vcv4BVoRCweLKNxOBFOeGHeUQdAy92D8XPXIb/PwKCPA==
X-Gm-Gg: AYBFou156R2+0G1zPTmJL/HwKDD5qhnV+g8ajjo3cQrSQcw5e7Bem2d1IVokQUEhVm9
	FG9YjHlGYHGJKgzu9Zv0I7RQtUWvHy3YPvS/7wVSgF2KbdQWJHAEidTF5D9W18BlWPoVV5SaqYp
	Xux6OCY92gpTjngnSzif4x+QWiUFoV92IiDfcUdvm7ERSTk+28azxt0sw=
X-Received: by 2002:a05:690c:7011:b0:8a8:6fac:1525 with SMTP id 00721157ae682-8a86fac15dfmr9506927b3.46.1790338814072;
        Fri, 25 Sep 2026 05:20:14 -0700 (PDT)
X-Received: by 2002:a05:690c:7011:b0:8a8:6fac:1525 with SMTP id
 00721157ae682-8a86fac15dfmr9506707b3.46.1790338813586; Fri, 25 Sep 2026
 05:20:13 -0700 (PDT)
MIME-Version: 1.0
References: <20260918101113.6699-1-shf.chen@mediatek.com>
In-Reply-To: <20260918101113.6699-1-shf.chen@mediatek.com>
From: Jens Wiklander <jens.wiklander@oss.qualcomm.com>
Date: Fri, 25 Sep 2026 14:20:02 +0200
X-Gm-Features: AclHuK-ouBDE3NP5KllgzizL8nzI00TGFeoDBfSmluIKyV7R7AT2q-LaOcyCY5Y
Message-ID: <CAGgiveUPixvTF9vJ2Xo4zTSL3OBND=FgWpNth7F6PuqcidLmVA@mail.gmail.com>
Subject: Re: [PATCH] optee: register TEE devices only once fully initialized
To: Shao-Fu Chen <shf.chen@mediatek.com>
Cc: Jens Wiklander <jenswi@kernel.org>, Sumit Garg <sumit.garg@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        Project_Global_Chrome_Upstream_Group@mediatek.com,
        tadd.kao@mediatek.com, jarried.lin@mediatek.com,
        vince-wl.liu@mediatek.com, justin.yeh@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: OC_oOw9lc0cQOq_arkwzh2ScHxIrw-_u
X-Authority-Analysis: v=2.4 cv=QYnzLcbv c=1 sm=1 tr=0 ts=6ab666ff cx=c_pps
 a=72HoHk1woDtn7btP4rdmlg==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=mpaa-ttXAAAA:8 a=oFcAipZnX4TCZRIg_scA:9
 a=QEXdDO2ut3YA:10 a=kA6IBgd4cpdPkAWqgNAz:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA0OSBTYWx0ZWRfX4ekPsjPXsmg+
 e5h6V4ZZm0hA+0YoeiSAmUwKzTGEIPjaP+3/mwFbOhltrzY5u9SGVzqxkeeREdIpIq6I2rvH7YO
 1NhABpDAIdM8lLkjz+RRhpI8CPR5xcvL0hZLfsXHXf6hyTAUXJ5qZvj7jGNm0giD0sXkfxI9r0M
 DFBm9nLSnHLlUSge6HuT6dP/JXezdSXij0uQXIuZwA6iLflQ5OKw5zUR7LrKTPFWxFgVMl9D70c
 kI/ucsTPXssFCGPjgMteuU01umh/88YCS+9uUvZ7BKt5lFYNZxCuyI6RyDqE6JpRWjDZQpWYvGY
 eoHcMjPI+fokwJHzEL2MiAjk/QjKxYiV+Fo/9DlrHo106nmTiOJ5Q6+6Bcs0e/uVkeX4c00sXnw
 PxwfN5nHm0Pu60Du41aqNge4viIfme7M61r1yWrQ1zIzFQ9mQyaDwBPJOsWuwkS1vBMl9Ea32Wf
 7hL+h0sLAv6SVg/ii0w==
X-Proofpoint-ORIG-GUID: OC_oOw9lc0cQOq_arkwzh2ScHxIrw-_u
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA0OSBTYWx0ZWRfXx9GglUsQVXmS
 y+yjWKlr3ASTenwpnDLpaclAnCAruvUqJMoOL2tCKAh84O32zc8N6gIkaEXPt12fIcwkB6Id50Y
 V+JYyGDpvXs7Zs5fd66tN37JamR8IhI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 impostorscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250049
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_052015_694141_17DAAB70 
X-CRM114-Status: GOOD (  20.90  )
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

Hi,

On Fri, Sep 18, 2026 at 12:12=E2=80=AFPM Shao-Fu Chen <shf.chen@mediatek.co=
m> wrote:
>
> optee_probe() called tee_device_register() on both the client and the
> supplicant device before the rest of struct optee had been initialized.
>
> tee_device_register() calls cdev_device_add(), which does two things at
> once: it creates /dev/tee0 and /dev/teepriv0, and it links the device
> into the tee class so that class_find_device() can find it. From that
> moment on the device is reachable both from user space via tee_open()
> and from kernel space via tee_client_open_context(). The only gate in
> teedev_open() is tee_device_get(), which merely checks that
> teedev->desc is non-NULL, which was already set by tee_device_alloc().
> Therefore, there is effectively no gate at all.
>
> A context opened in that window can run against a struct optee where
>
>   - optee->call_queue.mutex is not initialized by optee_cq_init()
>   - optee->supp mutex and completions is not initialized by
>     optee_supp_init()
>   - optee->rpmb_dev_mutex is not initialized yet,
>   - the message argument cache is not initialized by
>     optee_shm_arg_cache_init()
>   - optee->ctx is still NULL
>
> Any open session or invoke during this window takes uninitialized
> mutexes and dereferences a NULL pointer.
>
> Fix it by moving both tee_device_register() calls down to the point
> where all of struct optee is set up.
>
> Signed-off-by: Shao-Fu Chen <shf.chen@mediatek.com>
> ---
>  drivers/tee/optee/ffa_abi.c | 16 ++++++++--------
>  drivers/tee/optee/smc_abi.c | 17 ++++++++---------
>  2 files changed, 16 insertions(+), 17 deletions(-)

Looks good, I'm picking this up.

Cheers,
Jens

