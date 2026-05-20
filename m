Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7DCFCD4F3C
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 May 2026 13:29:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2izcNj1xZ0p1yofZU7zInuq1w3gym7l3w+3PyLHbXUQ=; b=PFLmRIAymfKvgufQVP6dTdgt+w
	8redysnVWeGuUbJKJWUTHaBliF/ycrLX3wdQ++qSZWPq+xMTGiGj6xFb/u2K9fQjmeAhRYHvkniTU
	7LKCAJ6IniIIquI8VmjgkvENtKK497vKDsD4Q1s+yjZhvBx8EBFdRWT3S0Cl+zicuQ3dJhyMRUIsn
	wabAedkcmGPFzrCT7kKn/NYs1upQaw/+XQW9MJEc3743jqGfQJcLONxOpSvRloGqOlNtvvfE8jcgY
	DKCKQF6VYJGZP8TtL1jIC8Z0zVn7u2gtYcljnkw+BcNS86MDOzRTvUY72yZlC1cMm1jnPLLFGHtWM
	WXEsea6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPgza-00000004g3q-3dgl;
	Wed, 20 May 2026 13:29:46 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPgzX-00000004g1i-2zwo
	for linux-mediatek@lists.infradead.org;
	Wed, 20 May 2026 13:29:45 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64KCctuU1725327
	for <linux-mediatek@lists.infradead.org>; Wed, 20 May 2026 13:29:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=2izcNj1xZ0p1yofZU7zInuq1w3gym7l3w+3
	PyLHbXUQ=; b=H35p5m4srJzotebwEjdTTpkORh0ew8BMgzEnh21axS9lwJfw7Ky
	Ri85jmdalPuP0d+0lzR9mfz0fdPQDnOfD8AXIu70nk4ljzltIQFfK9tMPyVdUlcF
	Roz1j+9k/Y20cH3HmrJuLhalvOxIOB8n/MFEoka0MI0UcNSwnjdwg6vTPWbUrFBX
	yTrgT3MSsZ0WIwGEP/c0SZA9vs2ZuqERIstey1veFV3C6Q8YQ3RUQBj/PmG7AWKs
	DS8ahnIZnmqpinzBb82IRhDPqDx2R920H7eFKI5Y7rRhggA27n+JHB5m+CzFxuMO
	O95M3RJzxDyarHIZOEIbRkX2xReVcN8Yy3Q==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8t3qmx17-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Wed, 20 May 2026 13:29:42 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-956732444ffso9259510241.1
        for <linux-mediatek@lists.infradead.org>; Wed, 20 May 2026 06:29:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779283782; x=1779888582; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2izcNj1xZ0p1yofZU7zInuq1w3gym7l3w+3PyLHbXUQ=;
        b=EtvRWgaWAQxOabFOvJgyZfs9mnIpEXdbM/vIhkZsRBtdQpJxhs1hub9sfcbK68sEll
         2EKzzMV9SDW8+ItSlgo3qQsjpkpEmXkjUj0Mmx5bhyBKJExTOY8urZf3nzOhKJln7tiY
         xFYw2CadbmSugVMdrwU83mcppV0Ey1LKM6QkE+JeRRlSbTnXXLC/YjAriMrk+E0yIq5v
         gIjYWZsCe1inox4W4hQFcGjGAWXrrRBEF53dE5XEk+dBIQSFo9DOqRQQcZInDKUuYNcQ
         O+0WjOmVeKI+vqk8hmtTGaPKUI5dZR8ueXrJlTyqfq/xxeqJrvhN3u2dqwDjyL2r5BRd
         YNlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779283782; x=1779888582;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2izcNj1xZ0p1yofZU7zInuq1w3gym7l3w+3PyLHbXUQ=;
        b=R2c2zn071ZPKgok1+sEVAyAfsgpjeMiZeooLhMsdaCwT2gxULOzVzDN34Nji9L4yr0
         w7AJCJJyUqYVKGbUJhNz1oDom4aZa/TEM8xNlHV8/zdpPX6GesJhges4kJM8CCCf7PUQ
         plddTfyb1yAVnPjSqKCXXSuVLzO1HAjZD2itJqES3YJi4UF5wlGxHfCGYLqAeYoCkz7M
         ss2Pv8aDp8V1EmAV+Avz8YniilmHuxRo9IHCST+qpiuX852wFXvHT2dUJXqjkxUFG1XJ
         tFy6v1Rd3x1qLpAaJpleUc0Akcbb84yO1YG9/J8AR44ABbIcE6+q8Fd1JmbNHywMyGyY
         llfg==
X-Forwarded-Encrypted: i=1; AFNElJ/5rrGxdEI8DA1nJrmNlstAtGWncg65tSXcq8rc8cXAtwLNeOBSet0ZmMAUXWuxGjPWaRzVdHphIHkZfdhx2A==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx8esda3ijaq5djhS80hQ64/f6ZYz2m1bnYBdt8Ma/xlXQTkxxo
	LyS3oEj928ooimVqjjdkeo4N42sJNBWzficD1jH1drNCW3cu+nvz5swbbj0i/KXB2p+KCU78viD
	IopKMKoO05Kt3wZGtM2YfxDGvBr8cZ7opQt9s9fWgMhusCaSq+JluNA8inQ+VZmKZXzq/ooLx+Q
	I=
X-Gm-Gg: Acq92OHJ1Buxm0mpHChvCCW+6+0iVIr0thjEYFP88FgSkgjGRHOWFYJ/UUFABhlgtFT
	uoTKqyf9sGSDolwISij1dHDXgvmkkDk2LiSqc9I7b7nSocqPKxysn/uaVrni9SCJ7YlESeEqFT/
	xpUBT3t23S8UR79cBcE8PbufsfUMK4vDV1narcwVUnV7CfnOPjY56CqgCRRG5aak2NKaERon8Gt
	SXsvPHFEDTjgc65nWvnPh7RvO0vEWt8ycHEsQ4OfZt51eznR4VvWK64UgGvwdFN7zivqguy/MQ3
	CWfKfriCgWSqPtW7U40VIa8C5Pxv6y7Lvnyko3yH6kdt2cT7o5PLJQNJhYrmwpvR9bN2U5HghvY
	p9e72MIE+62BWAJylvywew+CUCFjL5ozcVoSkpI56528TxdNvKq6hQ8c=
X-Received: by 2002:a05:6102:8644:20b0:650:9174:f0 with SMTP id ada2fe7eead31-650917426bbmr5562516137.19.1779283781943;
        Wed, 20 May 2026 06:29:41 -0700 (PDT)
X-Received: by 2002:a05:6102:8644:20b0:650:9174:f0 with SMTP id ada2fe7eead31-650917426bbmr5562477137.19.1779283781572;
        Wed, 20 May 2026 06:29:41 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4900c16c62dsm223771535e9.11.2026.05.20.06.29.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 06:29:40 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
        matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
        sharq0406@gmail.com, kuninori.morimoto.gx@renesas.com,
        ckeepax@opensource.cirrus.com, srinivas.kandagatla@oss.qualcomm.com,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Subject: [PATCH 0/2] ASoC: codecs: max98090: switch to standard set_jack callback
Date: Wed, 20 May 2026 13:29:28 +0000
Message-ID: <20260520132930.54333-1-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDEzMCBTYWx0ZWRfX3co6O5idVV+B
 T+Xsv+ZTqbHp37yulkoMFux/dXJQFOuC8Kk5pa9A2ZKdBKvneKVSutfSdm61BuUYIy2l4DUstlF
 daQnsGjwyAeA+0ZACBhDPL7b2G8YniXhdX1CfboOFK/Pu8qiVAOyOoOqoy5wWwxQOz6EfKbqvIe
 QAFa6LtWT8WBPYpAQjnr0+iUG0r8aokoyDXr5N4xlxTzQghs3DJ9+Mqr4btEleIClrmiK/dNtOP
 ARGXR03EW+JXdq9VaKDibVw/IxYlLNkSV6drL04Bic/tWve0Cx36dddFUpfku8ofchsev03tqZZ
 5zhyAMbuPNq8JAb5UgCJlugTwgJT4mktMSY63h6EBw2rE69jCtVtpc/CL/Ul6robGC9oVcrfUF/
 VH3ouWiTxd+GSpiQWY24kFYLHaMdDAd/FoNFYpsmS8sMGGKTOyIUfuVmw5HqKuKphK8uPIuP/vn
 xWA9MGFBU/7vKj/E6Zg==
X-Authority-Analysis: v=2.4 cv=N9cZ0W9B c=1 sm=1 tr=0 ts=6a0db747 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=pfRRIDRPQivS3abtoGoA:9
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-GUID: AjF8jL6QbFWGgGyfTUbADVxDzLiKpgWE
X-Proofpoint-ORIG-GUID: AjF8jL6QbFWGgGyfTUbADVxDzLiKpgWE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 lowpriorityscore=0
 suspectscore=0 malwarescore=0 spamscore=0 phishscore=0 clxscore=1011
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605200130
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_062944_218393_FB615A39 
X-CRM114-Status: GOOD (  12.26  )
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

The MAX98090 codec driver currently exposes a custom
max98090_mic_detect() helper for machine drivers to register a headset
jack.

This series converts the driver to use the standard component
.set_jack callback and updates the mt8173-max98090 machine driver to use
snd_soc_component_set_jack() instead of the codec-specific helper.

Using the standard callback removes the need for a custom exported
symbol and allows machine drivers to use the common ASoC jack
registration interface. This also improves compatibility with machine
drivers, such as Qualcomm platforms, that already rely on
snd_soc_component_set_jack().


Srinivas Kandagatla (2):
  ASoC: codecs: max98090: use component set_jack callback
  ASoC: mt8173-max98090: use standard callback to set jack

 sound/soc/codecs/max98090.c                 | 10 +++++-----
 sound/soc/codecs/max98090.h                 |  3 ---
 sound/soc/mediatek/mt8173/mt8173-max98090.c |  3 +--
 3 files changed, 6 insertions(+), 10 deletions(-)

-- 
2.47.3


