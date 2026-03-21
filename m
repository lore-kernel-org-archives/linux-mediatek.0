Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 781E11094472
	for <linux-mediatek@archiver.kernel.org>; Sat, 21 Mar 2026 12:25:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AhRJ0xP2d1r09SQ2I1AfF4h8fEo6qUqwvCbUvSQT8Fs=; b=hGTORqTAmODVZoba/Zvx5Zi8d3
	h5nzdLU4ljNXirj3wJ5Z4dvNpXLPTJXEQDhiB6vqR1c4ga0RfUsE69HMp07UcXp6h2aSslyWFnCH2
	/ZyO7jkt7QMhiYhK/yt0xZBkSdQAVH4XyqOsWogowShB1TVv+aoPdRi7H/j7WXnVipHmJd6Hq3waj
	Czou0pfeAozXn0Symqowc18dTojt1sSTHYJr3HsmW+lGGJ5ZECdZOrPp95p/Tp/FqW+2hxVB7ziF7
	A0cwM27zZhMNqyfErWiueQwb+CnK7FI3RetbYWqDJnpNkrb7swUrfGI2d2S4tyJ3u/d9rZanE61dX
	Ki2DgCew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3vOA-0000000ERlF-2B1o;
	Sat, 21 Mar 2026 12:25:10 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3vO7-0000000ERkw-1aiB
	for linux-mediatek@lists.infradead.org;
	Sat, 21 Mar 2026 12:25:08 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62L4muHV1788139
	for <linux-mediatek@lists.infradead.org>; Sat, 21 Mar 2026 12:25:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AhRJ0xP2d1r09SQ2I1AfF4h8fEo6qUqwvCbUvSQT8Fs=; b=D6R0jnJulrKcNUt9
	VCpl327Ed1QajXuNvwWSpp8T6UA4r8peFdn0W8LAtGyzHE8U4f9Yahhwi4oqx2Zh
	Ilqy2/SrwdDWAasgihLns7D63mf3+4wE8MOQ/rG/Wr77wVnpjFfPEI3sGVAvN8Sl
	QYNgJvxkNCH7cMNU9uEM/jilVXekHlPncO8mtC43Up+TpBfnpbF4jMCtQplj/rb5
	hdYA4x8t2ndwFEkBSL3dxf5WKFngRCFEzvF8zHsZ6+smZQaBTA55esrxVhNZVGR2
	ew5+MNK9BN7JiRT3zqW9kXSY5tVsEJwpBo0CegdwwbnRRwnm6XOMmJs7NL4zT2Hl
	yCLdWA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d1jb5gr3f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Sat, 21 Mar 2026 12:25:04 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-358e95e81aeso19103091a91.0
        for <linux-mediatek@lists.infradead.org>; Sat, 21 Mar 2026 05:25:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774095903; x=1774700703; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AhRJ0xP2d1r09SQ2I1AfF4h8fEo6qUqwvCbUvSQT8Fs=;
        b=Y28lEw+UyW+sDKyRhEFgy/WHaUTvTgrZiscysZLiG49oKJZPV7TK5RChrPiIOuSwXs
         kIDWIPJ/79XaQcxxFo2Zi3OEdadenSnW6OwmV6sAaPqtwlBupO22U5CENLm4Q/PC3BXi
         5seRIS3eGq0jKwPQMi17kQUjOZfc34yo0aj/cKT0w4z9Kqtm2uhNccFBJKCxpGiB94iG
         PD3OKkHD7E7I3i4wFv63XmmSJWgyzt3ur4/syIZR0T2HVVxkS6TSMo2tqtvTo8iB6Zci
         E7OdxJwSC2j8iEDkdweOLoaJppr0JaXiUH3KwbnwWitpczrQSDFCfQB/0MqPh7J+8ny4
         Ydmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774095903; x=1774700703;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AhRJ0xP2d1r09SQ2I1AfF4h8fEo6qUqwvCbUvSQT8Fs=;
        b=m38cRtXx4wdN/yxkXRyPcVPzFkq2Gkp0qSqNN2VKhAA3yXinVIjwvgHJP22XLQumAw
         SMKQ3QmRKyT85MW6HBDTrbn5SYPWrkTv8xvDK/vvM6loO+MerKMC2QHpBP1e3hoY9uM6
         11YYueRGvyIbZ8sntMYp/hIFBnwJt47/2rgFDE3TVMOla2sW+XwSWcvVRI4ylBCR2Mdk
         uAi1LlXxOn7air7zS2ht1jIEuZSWdyoOw6lh1p0IJkz4LE8H+mX3lk9bp6qQNvyqWnQ3
         QaMeQHiZen2JzyrIQAx7x+3v6sfnLxEHpzXAjhDFvUPKRH29uhHKI3/ujRpR8tES54/Z
         Tf1Q==
X-Forwarded-Encrypted: i=1; AJvYcCWA2ej8r7Pyd7w9bJXLx6ezW/g9r+PCpU6DmCc10YWDkXa2qQ7wL8fDzvZ2HZbtrdkEz/K+3ELx7haSemRLBA==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywdx/wTg848O/2t/OPD6GgaL5zgmrZjKCv3mtPPLTa/An9b8i7f
	cBj+lNbqpBAV0R3mTpPKlKhzBejifJz3WNsopARIBFp6CNpty2FWKTYSB8O+rSLOuCa9RivcIQg
	pb9K58nOFr1iC0MZLrcz7PUuTy/uDw9hLagmRRGKF805PwzLMdhCrNPrJKIsIxY20iFFXB4Eql3
	fRW9kF25Y=
X-Gm-Gg: ATEYQzyGjuAm5Zgc5cNxvNueuA5gZAaCXV1J0eQrHE2i6jT6/eCoOwYiJX4Q05/HVuR
	Xt4eM4w8oso65Zs0x1dA1116R800MzuXgPln81y+6VfrJngo2jLVjwO8lPbVKn4kBQG1YSLvtyH
	3bgKF+a338ARe+p1Rk72xUR3A/sZblwPYtXKSxwbf/UcgG//9yj4zd2i9f0vMRuU41Wih5CB7Sk
	VhTD5pBIeaYmjOri3kH2gW+sbZQQgvF/Q2iXOi7JxkRaAQPZ9d9QEmk6XkK6UysG16JNfWNMiGm
	LYThe3Ubi1vPbMe9dRS1gQ1DZ3xA4jRrIeKdwbfqEVgQ/0Swox7y5XhTpsDYiiYlYBejnV8jbo8
	Zz0rNlLzqs4UFDX0j
X-Received: by 2002:a05:6a20:9146:b0:398:8bd7:4f80 with SMTP id adf61e73a8af0-39bcec0692amr5686547637.46.1774095902359;
        Sat, 21 Mar 2026 05:25:02 -0700 (PDT)
X-Received: by 2002:a05:6a20:9146:b0:398:8bd7:4f80 with SMTP id adf61e73a8af0-39bcec0692amr5686524637.46.1774095901758;
        Sat, 21 Mar 2026 05:25:01 -0700 (PDT)
Received: from work.lan ([2409:4091:a0f4:6806:624d:fb0a:8444:1ee3])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c74665ca206sm4391960a12.18.2026.03.21.05.24.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Mar 2026 05:25:01 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Google-Original-From: Manivannan Sadhasivam <mani@kernel.org>
To: Bjorn Helgaas <bhelgaas@google.com>, Rob Herring <robh@kernel.org>,
        Ryder Lee <ryder.lee@mediatek.com>
Cc: Jianjun Wang <jianjun.wang@mediatek.com>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        linux-mediatek@lists.infradead.org, linux-pci@vger.kernel.org
In-Reply-To: <b835e360b42c5e0994f9301a34dbdf140a8d3ef5.1772493898.git.ryder.lee@mediatek.com>
References: <b835e360b42c5e0994f9301a34dbdf140a8d3ef5.1772493898.git.ryder.lee@mediatek.com>
Subject: Re: [PATCH] PCI: mediatek: fix W=1 snpringf warnings
Message-Id: <177409589820.12459.14613770488604261704.b4-ty@kernel.org>
Date: Sat, 21 Mar 2026 17:54:58 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=aJv9aL9m c=1 sm=1 tr=0 ts=69be8e20 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=p3aDHK_ZBxqdTpKZ4NQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: 3SHrriEBZa3JGt6F-qABpA7RHEhN5aSa
X-Proofpoint-ORIG-GUID: 3SHrriEBZa3JGt6F-qABpA7RHEhN5aSa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIxMDEwMSBTYWx0ZWRfX94R3EHJb2amX
 EyB5cRTrLwWzPqwFArY0Q+MU4AWky6Gr48MR9ap1iCCo3B9LqnW9cWYC3UDmIwHu1BQIvoaMMP+
 Ncc8lzRq6Bv/7PoVyFXXZCIh+vs+kvfwKMpICVzyolMJ/68i1CcfLX6K7Y7hxHWYMh3hCkeSOVD
 u5DTftW0Sb0tOa+eGJTzaEi0fRvJkwJOLGw029JCABaHyvehYBTIHPNqaIsXIkw+9VtogUW43tQ
 adizO+PaCGtEe8knkyWzZCXjso7p66n5tX0MAE6Qwlf9d8KgbPr8eGppw0JUGpBzhDIJXrL3ifF
 xWzDLsnETxgqAiFp9EhBVQ4d62l6h1vVMHWEIGBT0ba0WXoDn1+0520lGEs7U0rUsvhTe2KSx61
 ob+xrTukAkZXUpMJR+BNWDC6l5/Jf0v47UA2PfnND4rYxcx2RAzQYeL2gFRf7TFs/Mw/mPv4vHb
 QbUXmoUv7UP5xqA+KEQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-21_04,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 priorityscore=1501 spamscore=0
 impostorscore=0 clxscore=1015 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603210101
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260321_052507_578064_3C6FFA60 
X-CRM114-Status: UNSURE (   8.44  )
X-CRM114-Notice: Please train this message.
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


On Mon, 02 Mar 2026 17:46:48 -0800, Ryder Lee wrote:
> Fix the following errors in W=1 builds.
> 
>   $ make W=1 drivers/pci/controller/pcie-mediatek.o
>     CALL    scripts/checksyscalls.sh
>     DESCEND objtool
>     INSTALL libsubcmd_headers
>     CC      drivers/pci/controller/pcie-mediatek.o
>   drivers/pci/controller/pcie-mediatek.c: In function ‘mtk_pcie_parse_port’:
>   drivers/pci/controller/pcie-mediatek.c:963:43: error: ‘%d’ directive output may be truncated writing between 1 and 10 bytes into a region of size 6 [-Werror=format-truncation=]
>     963 |         snprintf(name, sizeof(name), "port%d", slot);
> 	|                                           ^~
>   drivers/pci/controller/pcie-mediatek.c:963:38: note: directive argument in the range [0, 2147483647]
>     963 |         snprintf(name, sizeof(name), "port%d", slot);
> 	|                                      ^~~~~~~~
>   drivers/pci/controller/pcie-mediatek.c:963:9: note: ‘snprintf’ output between 6 and 15 bytes into a destination of size 10
>     963 |         snprintf(name, sizeof(name), "port%d", slot);
> 	|         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> [...]

Applied, thanks!

[1/1] PCI: mediatek: fix W=1 snpringf warnings
      commit: ab4a4043db1fcc4fd4c5745c5be8caf053502e29

Best regards,
-- 
Manivannan Sadhasivam <mani@kernel.org>


