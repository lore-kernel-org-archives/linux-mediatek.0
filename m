Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07ADDCD4F3C
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 May 2026 14:27:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zEjqKkH3DhRxJE8KbXYEAt37DhNV09bfllpxwdO6tRQ=; b=TC9hdKtVRkyzkMtuL5RJ00uMKm
	spgofdsty7ZT/awqe31Sn5jrzgwrgmKex5NhSRRIHDantjt1usuziybFjTgBHE35dhN3xuh+QGC+6
	jstGAApAMPxqPmPP4lyQyjkuVNidptw7XNRXry2KHASd9tjagO/O582nq6gA0H1GjlpjCND1bwRFb
	ze2msAadCcBKYprfXoEFtmbbVY5C7OkP1WQQTs+zT00qFS/4PcBJ+kQPZQRAJ+KKA4zXkO30gAYUK
	FeRNN/Wfs5pn/M6Pf2tfRKbSRthJupOIvL1y7P5WfGP6oC23C6ebPOLe/QgJoRHPrEn/YP5We2uV2
	O7LWqPUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPLPo-00000001pQy-3A4F;
	Tue, 19 May 2026 14:27:24 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPLPm-00000001pQT-2K8c
	for linux-mediatek@lists.infradead.org;
	Tue, 19 May 2026 14:27:23 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64J9LrNB4063015
	for <linux-mediatek@lists.infradead.org>; Tue, 19 May 2026 14:27:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zEjqKkH3DhRxJE8KbXYEAt37DhNV09bfllpxwdO6tRQ=; b=c1Xj7Qj+y951pKcH
	uJ+Yl/3DY/8BXEx+ZlTKrXTGbbvrzmwMIyoBGeH3lFeMseGuIZS0/wiGe+r6J/X6
	ilx6hDAzNUbj7AjoUK9VnoQ6PX6yhMU3S1RzzEfs2Y0AXYRiRA8T4bC9eG/UgVxw
	/VfBzwmDKSM6DdE1WQtv2a1+mUYBouFwKHWY2n+2NHp/PDYjD6nRzGctUjCQf9Ip
	I/erEXcBAXT5nI64Zio4hTX0y3pyxfcfswOrUMl2FczqNb4yle30+FbL47UfcePA
	YjwqMYYVUdk4vV3H2W3unntEOlO8KaN1y7NpyJoaacoEcNTw3b8YLdjZLQ2YXhqn
	RD5gYg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8n5u16f4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Tue, 19 May 2026 14:27:21 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-82fa5ecd760so2044554b3a.0
        for <linux-mediatek@lists.infradead.org>; Tue, 19 May 2026 07:27:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779200841; x=1779805641; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zEjqKkH3DhRxJE8KbXYEAt37DhNV09bfllpxwdO6tRQ=;
        b=WZBn1ctT5TQ0SbMbM8m/lNaKkt6ukrhD43Lg5a5v29KF7GOv48jd0C83XDfTcO7tpO
         zsSI98fg44F1RIj1zFGCPE/IGucYo68quEPwlw73kIRP261DZGuk2Y2faoUe5SxtZoFx
         zBh0wd09Hu5uo3QTcSbNLwQwOSICJXHfJ11bFGRF1ikSgOcH/g4QnobnK/TuS3mZSxfU
         5NdO47OhuKdv7xgXTnsdGPbM+ZSEEZT1PfyOSwD9FCkaSCwqr1nrtB0MRfwyMOp5OVhU
         nZz+3wRCM87FkOYoX/BFHGoZsb6mWDxbw8aPsZAz5v7V6gQdbI+E6uU9Gj8VL08C4p9X
         jJvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779200841; x=1779805641;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zEjqKkH3DhRxJE8KbXYEAt37DhNV09bfllpxwdO6tRQ=;
        b=grB6vJZRGn/2cy6sD55I617pmLNDB4uN89cKKSyskYPIFWLnCxgrAymBHpUgHTaKV5
         RVP+DHleuzGEL4lvSc7viQXyoQ/GHhqA/DltvbPe2lSBYNBxG7D3JZ4d5wN7imXC/nK8
         KmeU3qcofNVL58jxZwxR4FBMVa/xZioBcT/yiXFp2XySTCfYnVZIxJAFlILGyduIqzkq
         /hiigapqD0Fh6sjLgiiR3jhtxmUl4iftXUv8Qd30eY6iyJ80p+IuAvkusuJEaQ5bXPvm
         krhqyBHrixa7hFxVEhg4rxCbwC5u+Pa8IRXQGrOqGzyxoDMOlQOy49/gmgEeKfaDFLb3
         xwSg==
X-Forwarded-Encrypted: i=1; AFNElJ+RPiQR1tyfy2oXQ8UlMgdYECz3FcWhPH05TAbe0JA0ZYBGPsKK2bMkpxn7ohwqrp3gsVwi3UKIAN602+/pUg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyrD2M0coX0FVr/VMLg2eJ7LfFyzskHeKdp//JvT8JlMoQCeV2F
	aGmgY8hCbez5yQzYW9djwNoe1zUYVoz/kv5lSqUUAoWLwGes35lCysez5nCRWXZ9WaowS2MlJSN
	XUUbu6HTgq3GQ/REez5hdX/PG1vlPLB3FmqF6Dp59JwZ6WhTHDRZtzI9B9k7JoJDjagXPEWRH5l
	A=
X-Gm-Gg: Acq92OGENcHX/7vtpabCmFNg0HxYcD92oAwmx4hj1xb/sdEInYmdaeY2B96Dd00KM8w
	XBlrqhLoryKctw4drtouHavwWG82LEK+dK+ThQsIBLs5kHgs9LXk5EPMGP8E/rjAVDBhydGjmPj
	PFytR+tEyjARKLstBx3D7Ajv7Q61FCsJAg0RD4s8dFJ6gHUZ4P29NSXeRVpS6EvPJtqB0hwuV/p
	IoXVXYGAlBtd4Fx494AmgWoEjW4ltpTs7uIABORRdpwgWPBWoO2ZrIpVQtWJzLkTLGNqSBUI0Ml
	PUBJa8S0vYzffbyDYbFitoo4dPYzoK0WKBPToD4fPPoqkJSMTGVMQjw18uWtga/NjsTG1buDmJZ
	JR9JH8WUu7QWiPFJxtgoo
X-Received: by 2002:a05:6a00:2e89:b0:837:80a:5ac7 with SMTP id d2e1a72fcca58-83f33f0fde7mr20707743b3a.45.1779200840892;
        Tue, 19 May 2026 07:27:20 -0700 (PDT)
X-Received: by 2002:a05:6a00:2e89:b0:837:80a:5ac7 with SMTP id d2e1a72fcca58-83f33f0fde7mr20707691b3a.45.1779200840172;
        Tue, 19 May 2026 07:27:20 -0700 (PDT)
Received: from [192.168.1.11] ([120.56.207.212])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f67eff284sm7640033b3a.8.2026.05.19.07.27.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 07:27:19 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Google-Original-From: Manivannan Sadhasivam <mani@kernel.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Ryder Lee <ryder.lee@mediatek.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wenst@chromium.org>
Cc: devicetree@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        Dan Carpenter <error27@gmail.com>
In-Reply-To: <20260512103347.1751080-1-wenst@chromium.org>
References: <20260512103347.1751080-1-wenst@chromium.org>
Subject: Re: [PATCH] PCI: mediatek-gen3: fix incorrectly skipped pwrctrl
 error message
Message-Id: <177920083522.97175.591150691760691771.b4-ty@kernel.org>
Date: Tue, 19 May 2026 19:57:15 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=MfBcfZ/f c=1 sm=1 tr=0 ts=6a0c7349 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=1gRTTRxgmbTSdBvl+srOOw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=bpYmCipijB_Evp6s3csA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: q3PKPwGUOceWc-DpskUqLn2bKX0s2vkb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDE0MyBTYWx0ZWRfX1tf9xOS+Y7eh
 lbKGkIfJzuE8PPTxQSq7DSKQTLiHILOu/+4IqTe1x7fYetWsfp47kQWH9xx0EnxUisCI07Vp05H
 O0XC48k2Nu0LR5uUU91WbHhbUQudyXTeZzg7PIOkbWB//REBWV7HIQhikrKJjSDo8/Jd6Q6Rn0D
 pHma4PChGKazxCs6hCox1pTTGKdFe6Ftuuj+6nFVKGwLmRawSWHcQU3CVPTSrJbUG0biiT7TFKG
 Cmk6oC4jXXrRgeQ52X3CObY3xT4XfiqywzgTI1e6rCdgxCtaIBcBHnIANBsZCK41HiA7+qKzTiO
 ZKghb1NQW2bV8vLtXbZx+IuF+UP8IF9deiWGR4IUq0ZoA78F6n0XMbXy4b2a0QK/z9SUtaiBPAH
 yIr+pkvKA3398dfHkt3p32h+HZpDsn7wV1ntUqRWZDFaMkQagqmAiWLjgHZ9/CLD79KCl5sbHcy
 PHPjeAYCLhuXSZbcBRQ==
X-Proofpoint-ORIG-GUID: q3PKPwGUOceWc-DpskUqLn2bKX0s2vkb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 malwarescore=0 bulkscore=0
 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190143
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_072722_599730_44EDF2C2 
X-CRM114-Status: GOOD (  11.11  )
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


On Tue, 12 May 2026 18:33:45 +0800, Chen-Yu Tsai wrote:
> When pwrctrl integration was added, the error message for when
> pci_pwrctrl_create_devices() fails was incorrectly put after the error
> goto statement, causing it to be skipped.
> 
> Move the goto statement after the dev_err_probe() call so that the
> error message actually gets printed (or saved if probe is deferred).
> 
> [...]

Applied, thanks!

[1/1] PCI: mediatek-gen3: fix incorrectly skipped pwrctrl error message
      commit: 8ba433753d9b131c2e43b1ff7ba8c5730cef8231

Best regards,
-- 
Manivannan Sadhasivam <mani@kernel.org>


