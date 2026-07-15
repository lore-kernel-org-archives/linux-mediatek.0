Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C15AC44507
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Jul 2026 12:16:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4xAzEXbpzsfN0W9pJf/x1CRXBQ/6tp9oQ7JRTKhYAFk=; b=5ELklNJ8yPxEbLZS4AOVreJFMJ
	IHvDL2VYCLmFj8DojNFgnGdPEMomluvcR1UQTEslG0Mv66FzkaHG7nZKMDS1NsyS5hgl0/91q2ryr
	TloyfJk+sRXfOAjvGBri+C+ktD8ExPfchKBfFa0DJZXi+D+c8476RDishdT2sYROJSCcwpdXNt38x
	D4vKMjxL6X7EToSRRaSmmuTNu/iZ85atntTrhvV2Txu4ZDttHN0BZsDsCNhiigvpIr4yAq7FRyNX7
	/+kOvTvng7wR0UC7EM/I1wu1QXRUxV1SRGJPOoAHSKxuR4nJkQQjE8p4ujacAIRzUACvAQUjzD9uO
	ID0/KjeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjyXN-0000000EkcA-0HmK;
	Wed, 15 Jul 2026 12:16:29 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjyXH-0000000EkTn-1y12
	for linux-mediatek@lists.infradead.org;
	Wed, 15 Jul 2026 12:16:27 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66FBcd1U3479987
	for <linux-mediatek@lists.infradead.org>; Wed, 15 Jul 2026 12:16:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4xAzEXbpzsfN0W9pJf/x1CRXBQ/6tp9oQ7JRTKhYAFk=; b=CmZ7BBxWHNVIiE7b
	9K5FHG5xi11tYAg6Pz3uhz4my7oUvjcWXl4PmgKDnAXWxzL2YxIuDxV/ReM+bbKa
	2cydCZkDYBl9ZiWSNAvRG7wToFurk3xmONkySWWIy0zyQZ2r6VNZXt29gk8/XRs0
	oY3Zgd/VcHam5DI4T7YD96kxET6QvI2SqvW0ilWo38MOj0mfJIUPGPNlMSbW5ebx
	RgmD4T2oqIx7gZALqFl5wl6aXQEhIc31ND/r8iKfO/HyF2ZfDRJS00zNfLEBLyjA
	uiAB6m+ZvnbUijQ6g0CSZ83AX+vW+RFPgh8+Gv/8kCFNnhUbtKqjelEhe4GLtJhz
	9RUN6g==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fe56h997w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Wed, 15 Jul 2026 12:16:19 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51e4ba1cfabso20717531cf.1
        for <linux-mediatek@lists.infradead.org>; Wed, 15 Jul 2026 05:16:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784117778; x=1784722578; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4xAzEXbpzsfN0W9pJf/x1CRXBQ/6tp9oQ7JRTKhYAFk=;
        b=dGO9jR8v6cl4Zz6Ofvvdaxzch/Q1oq3VMFJSxdKk5gMM2xzKJNs+084RWvCupmxZXI
         0+fRdJgvzgymHth2BmBLvFroCW7xiTuBsabkGSCZeKg9jNuSOobRvYRM6tbvtVqSDlbt
         0je2PhPuHoWic37eVx4WVR+0n2ODb6rro0mS0BvjiOogmufALdGIqRovjPiTCnUji/00
         tB/jxO+P5Azy5sXM0pgsZH7MqL8/Z4oUITDBkylSKQlS1Jg5XiEIEMCi9J9y4VXG8Bj/
         PON1dPT552Bkm7n+X0UCS91bTYxfSpfqEFmbdaqwHuIj6mxm1lSSgR5vkS7to0cUTXDD
         YUDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784117778; x=1784722578;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4xAzEXbpzsfN0W9pJf/x1CRXBQ/6tp9oQ7JRTKhYAFk=;
        b=IKNA8jq/wuD9HcMzBDOz7eMTaCGlpCyYDrVCGu5yYCFdOqlbeKO4ulT5HovIaOnEKr
         feFmnDbwSzTXxaZw0VgB7yGbi2HWH3t5dAtqmof8w+hFt2k0vi4ALURjHbKTwKM8bDOM
         GRL5MoeX88QcVTJO0WkQuVjlkfiRQ+J07rHFvFRmp7DXvW23LKs+Dc3X/j2Z6PVSxUiY
         LzibCmbagSaVRJJDLDyXjH10zjxFYi9f011s5PNxEyCY5tHEIs565Wxk2yUgL0lI5GaI
         k8+RCZkE1E7C7CHyBjWJ+Yrqpkezlsm81qZ/5EGF6867xl/Gy5hcWsTpXD6iKXctCszI
         mbiQ==
X-Forwarded-Encrypted: i=1; AHgh+RrHbhStXR/KiL3cUAELTYzQKRs1/eoKkIh5MPj5K6OA5/V+0Q8244TJmhW2YJVSCJqvRs9384I5yYfhGXJTsw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzDs0vv77rJxqYH6qDejPAq5tsC3wPVZy3sReJKeAgDwh9Gf9U+
	vTtKzE5xK56wAngt/MljdcsGpC6tfJ4OH083ExQ9/NpLor63OJ6PhrzEYxyJB/TEaJtvLDcQmKQ
	Fo7Rgo2PIqvuxynoOAsS1ulw4h4DfELEuTE/pbMrADOotdWVJB32xFtKpFFMttKsjwAOa+XIWHL
	o=
X-Gm-Gg: AfdE7ckqeNxRpZkEvaXYrPNuGqXdEC46n1ekFdFPdF9utDmUe8gGB7RHoXbh7Geleha
	6H1xkz3x+uFMc5MtRMlHrQO8sQeGp3hP6tLz3gdHjZtE4nFAAMneSwbA5lZgsFZXtI85f1sm9+m
	pPkR6LDvXu2qBOjl2Va18ubjJ4nGqqn0sANsWEevr/NPKbRjTFKVVJ5bXGe6T1vwfZvXgAsjdRV
	dFtw7+Xsm7Y2mr9Y2uNoomC4GYk6lmlk6hmYdJhsHnVolxljzDb4m2aVTpaOiXi7FN1NBqmqm3H
	cqv4RhsC/GFj4wNMqVqF+uKeIv8OvyWIGuPo5zsN1O1R8iwPZnBToSG9vsKCFhEA+3Pf0bOveZV
	YhU/nEd5kIe2W7MbfFtix7l0W2U77fdPMkvYWzfk=
X-Received: by 2002:ac8:7e84:0:b0:51a:8c97:9391 with SMTP id d75a77b69052e-51e4f12e7admr23055311cf.72.1784117778369;
        Wed, 15 Jul 2026 05:16:18 -0700 (PDT)
X-Received: by 2002:ac8:7e84:0:b0:51a:8c97:9391 with SMTP id d75a77b69052e-51e4f12e7admr23054651cf.72.1784117777741;
        Wed, 15 Jul 2026 05:16:17 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:1716:4a80:ed58:2ab3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f464caeffsm14947235f8f.36.2026.07.15.05.16.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 05:16:16 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Frank Wunderlich <frank-w@public-files.de>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        Daniel Golle <daniel@makrotopia.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH] gpiolib: tolerate gpio-hogs lacking a hogging state
Date: Wed, 15 Jul 2026 14:16:15 +0200
Message-ID: <178411777251.18877.15051361128846466144.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <4c67cf0839ccf57db35a826df6d8fc779531509a.1783974733.git.daniel@makrotopia.org>
References: <4c67cf0839ccf57db35a826df6d8fc779531509a.1783974733.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDEyMSBTYWx0ZWRfXwCQCnwT54FaS
 Eu/bzUtplo8Zfw59zAq9nW1tUzNh0SMYUprC6P0F7h41RKg35ChTi+EckDCF5xo1bIEAIlsc/G8
 zp/ZYe/Ujn/w2IM8q1ppsHh4APFwX/I=
X-Proofpoint-ORIG-GUID: YN273oyf0skHk_9lnUOt0Z0MRGGn8uz8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDEyMSBTYWx0ZWRfX6smq2cKC+D+H
 u2ba+iZjBwwlRiMB7f8ykiJSAn86oNEYcZV4o42lZQ+Up075nQ8WmvmLsCdbFUgn+3xNTBRDxEH
 1yj8yRnWo97Nh6aQ7j4qUMQfZ1PmnVbT3NUcct0bfhfnwcSvAHGQ4ie4wjFC4eC9BxZJGXe3uhy
 GB1yR9ES9OTyESndZUStx1G0obdqJGdgo6ZD+Uk8a2HQolx108Yvzm9FqWA7CVcB0BfFVg6S9MZ
 sovsbBMWDuksJaDIekzUOGuZ4PD6Y/nt8XYBTV7q2KSM2xcx+vot0mg7zoyBKyVryFvfFmLItl8
 mRG7XEeHSVVsRX1cBe4vSJdL8a1kQ6mJlY7N/yFI5qCcFqiv2jxHmAh/c4TI1O2GRjPAAWCJpGw
 FOmCAN9+ZR41opO3iX6+o0c74AtwD8ykpuOyKxpQ5I/EI5XIGz8ReN8khJcBllkUZnrwyDEkx89
 d5XufzHdK12CWCD1zDA==
X-Authority-Analysis: v=2.4 cv=LpKiDHdc c=1 sm=1 tr=0 ts=6a577a13 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=LCXYudziaqtIdDzv8-QA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: YN273oyf0skHk_9lnUOt0Z0MRGGn8uz8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 adultscore=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607150121
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_051623_526765_09DE2103 
X-CRM114-Status: GOOD (  10.75  )
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


On Tue, 14 Jul 2026 00:30:53 +0100, Daniel Golle wrote:
> Commit d1d564ec4992 ("gpio: move hogs into GPIO core") made
> gpiochip_add_hog() return -EINVAL for hog nodes lacking any of the
> 'input', 'output-low' or 'output-high' properties. The error is
> propagated by gpiochip_hog_lines() and fails registration of the
> whole GPIO chip.
> 
> The previous OF-specific implementation tolerated such nodes:
> of_parse_own_gpio() warned "no hogging state specified, bailing out"
> and of_gpiochip_add_hog() stopped processing the node without failing
> chip registration.
> 
> [...]

Applied, thanks!

[1/1] gpiolib: tolerate gpio-hogs lacking a hogging state
      https://git.kernel.org/brgl/c/e1cc8fa0fb9e5112d15f2c310b68ac316981c06c

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

