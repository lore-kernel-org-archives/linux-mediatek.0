Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79553C88E7D
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Sep 2026 06:33:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NEDuoyj+bbfKHUr7NtnD+RcWnSQNK9mropFxBLNvlWY=; b=v9+L9iudhLKRMPVaNWj6HuuheW
	76IG8GfR599u9n29ghdve8WosHlXAr9O1qcMVqLHoEsKb3q7SmbOf8meGnm1myf6DzJvtwnuoSOZk
	ZOdMwZaf0ijtquDiu1ohfFWkRoBGtkeDiYc6WlK3gKzOl4lj8YpKWJZ2z73EeGN042mGhNg8AyMuN
	GWD4Od52xKMCefMZeTrbpopTKh5IUvG4l2fpTRlrltgzP3DLu6AlxjY8+sL92mJG9lxaJ+6dpLGJ0
	f980vrZHOZfrg6HgSkQc591X8p7RZvNdEsvo0X0464ac9ziIFEs0VkEoKbpzw7+G4kPGW1aAZhVHX
	3dJau5NQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Mjk-00000005M8U-0s8B;
	Tue, 15 Sep 2026 06:33:48 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Mji-00000005M7u-46fy
	for linux-mediatek@bombadil.infradead.org;
	Tue, 15 Sep 2026 06:33:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=NEDuoyj+bbfKHUr7NtnD+RcWnSQNK9mropFxBLNvlWY=; b=o/bCoKh372tmO/Uo5Q5sddB/tG
	qLkpSU6ca546MrnKYsMxW21ONiRYbxrr95HPPxZkb4stWMAf4yC/TPdEH8c3zhIIrVNCgqv9Pyl/3
	ou8nuCEZBGL63Y/xt1hc6OtaRhetGONL7wMJGaGIWK5u3vrseio6jsXeTN6w4VaOu2OdU/Qo9QBd8
	DrIT+SQHRnPeGdGnmI4mhHe0PrhpfyKJZKwouZvUolLx+s+bD2PQgUptH2vMoZsK1ZgfgoU6gZ/SP
	gWnnZS80vJ3dRurun1XwJVdaJSZoV9IC8GWhUUwNX4e+siZWvU59PdQujuJK07XyfOvV6g2R2gsxn
	Ah8JrWLw==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x6MjW-00000006KTc-3oJ8
	for linux-mediatek@lists.infradead.org;
	Tue, 15 Sep 2026 06:33:44 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F2nR9E2623209
	for <linux-mediatek@lists.infradead.org>; Tue, 15 Sep 2026 06:33:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=NEDuoyj+bbfKHUr7NtnD+RcWnSQNK9mropF
	xBLNvlWY=; b=Yol4/8HZkdcSmSmF5cMii9y1hlVuehcD1ubmWEV0kp1ofv5Oxim
	APNDRm1eFUIPneoCI+tsb1+Rx/G2rfxdXEsZ5xL5KzZzUYU/PHKmW8qIQ8oTqDAs
	r2ZnXrGslOBO90jakuSNF634Rz4f9GaWNXwuANu2GfFMDZZqlB/EK8ub08acYTJj
	3vFUFu0nQCs6lOnSa9lfNa4ghPEiMwbYh7zAaUsnVsGhYvdrIeMmq/s2vC0AoU0A
	gmJUuZD/4DIUTu6ZFCQ0GvoSVP6QCkTlmKwbNU7+R2Tua5dQ8dyJkfLj+6zaLknU
	eD2bs911J1bs+BJNfgAfuS9NjdtqaXdNuTQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpmx9tuam-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Tue, 15 Sep 2026 06:33:32 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9394ad7f64aso676174885a.3
        for <linux-mediatek@lists.infradead.org>; Mon, 14 Sep 2026 23:33:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789454012; x=1790058812; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NEDuoyj+bbfKHUr7NtnD+RcWnSQNK9mropFxBLNvlWY=;
        b=kW2p5qRDoAyXd9UTCui/QyAh2TAWXNwpKmMr1ShG0C7OGOsjG01SUxG31MAXm7r3LT
         tXeCj2YuxH0wCqKiHlyf48CWJtFnQfL2drUSzKgpW+/N+yX6KCQJxeqt6vw2uFLbve8u
         2+i4TuvBZw3OAHAi0gyvoSqwyDWMGiEBwSYsR/MWqlnMtl0q+VMuiCu7gqmxm43FpTQ5
         8iKDPchJlth4w/IR9KasFXoNm7md4p8MKBeN65TXZCGtwtQryWeFAI5/YSBj7i8mWFGN
         WsH9sbog5QvbP6ClWp6dWBCs+UZgJr4fAbIghb2Cd+fCcKVUhzuq1fZHqfNhsd8NC7Q/
         diNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789454012; x=1790058812;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NEDuoyj+bbfKHUr7NtnD+RcWnSQNK9mropFxBLNvlWY=;
        b=yoVRLNBdmiXxSFd6s5pBembWgpY8OMX5wTEOC8D1s2vF+VnhhaqFJ/R5D6n8ztdNvz
         PI1C85bUMzEovk60Qdg3gHYV+8sxo/0141q11J2DxD2M3W40LvSed8QTwOszZCq5Es5k
         eg3iXgdOxZ1lz1kt09ZR+9Dtsco5iWT5+uko4iT7nRolt1kIC03YK3UCx8a4oViQ/to1
         eO8G222ACc5C7Y9zzn20pdXWp5C/u5W0XI/dV6l52U3G21ICr5NKYr+IxV76DaQ+deN9
         XevV9rNNJE/Zc+cO5OPc1CABcPwmm2/3nMYv8FKpgIdN40ZEky69i/2OC5hlwaSNZj4L
         ChBg==
X-Forwarded-Encrypted: i=1; AKwUvBwnHQMI1ErmxXThKqJHIAtuKtEQDiC5Og7tx2ngPH7z0XB51IfjEhVE+dElsXZ9dVJ18XM5zLL4lp4EOb1LGw==@lists.infradead.org
X-Gm-Message-State: AFuF++lYc/lckxRPprKtXomCvpX/tWLBWsNkCgqLmGx2LoL70fm0BnlR
	pjyavjzPlmU2UJwL6Nnnhwbguj+dDevVJgd3ZHS7gzg6b/j6OlPFAe+D1tjIQqSYFVolMHO6P3D
	OKYeav12KA35kd7oCmYgT6YOXMNZ7ELY87JfrlZpbRKMsqw8e3TdSukvcW3ufcQhdcQZVFaUXlz
	g=
X-Gm-Gg: AYBFou3kZFJJZM7aMlPcHdk2JGlnMGxZtFWPbrCi6OBM7+MZQX0LVK/KfysQaXj0KSx
	r2nX7hQPOeTKi3wgaymYb7+YGYwP3Z4ztmK0jBOF2s4R65rwZFUd3uu70EEISL/FZdGL0r5H6yZ
	ZSjCOtsYtRuWCg/iE7LvDU0GqVfqfjZiR865D2F5LASnGaF4PQau76HDFuxSbilrAxgiR0n0F+c
	mTuTk9JEtS9o8ptGbBwvZ/YdnJA2xpg1V2AGfEoRtuFCl2cuvg20lNMWYQN4Ob6xMzPUQWx8xCL
	K3n/Y72oi0EVD7oACe4CSGbU0GyPW8WmtOlQ66JrkwO57dsMrYHYT94ZpySH7blPRHB1j4ZOlyF
	MDnbkrFLIYdK//Lk=
X-Received: by 2002:a05:620a:6413:b0:939:6dfa:4975 with SMTP id af79cd13be357-93a29bf51a6mr975712685a.52.1789454011559;
        Mon, 14 Sep 2026 23:33:31 -0700 (PDT)
X-Received: by 2002:a05:620a:6413:b0:939:6dfa:4975 with SMTP id af79cd13be357-93a29bf51a6mr975705385a.52.1789454010874;
        Mon, 14 Sep 2026 23:33:30 -0700 (PDT)
Received: from quoll ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb33ea4fsm33676206f8f.21.2026.09.14.23.33.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 23:33:29 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Lars-Peter Clausen <lars@metafoo.de>,
        =?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jerome Brunet <jbrunet@baylibre.com>,
        David Rhodes <david.rhodes@cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        =?UTF-8?q?Martin=20Povi=C5=A1er?= <povik+lin@cutebit.org>,
        Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Binbin Zhou <zhoubinbin@loongson.cn>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
        Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Khanh Le <khanh.le.xr@renesas.com>,
        Ricardo Rivera-Matos <rriveram@opensource.cirrus.com>,
        patches@opensource.cirrus.com,
        David Rau <David.Rau.opensource@dm.renesas.com>,
        Shawn Guo <shawnguo@kernel.org>, Shengjiu Wang <shengjiu.wang@nxp.com>,
        Oleksij Rempel <o.rempel@pengutronix.de>,
        Yingkun Meng <mengyingkun@loongson.cn>,
        Trevor Wu <trevor.wu@mediatek.com>,
        Julien Massot <jmassot@collabora.com>,
        Jiaxin Yu <jiaxin.yu@mediatek.com>,
        Shane Chien <shane.chien@mediatek.com>,
        Daniel Beer <daniel.beer@igorinstitute.com>,
        Sebastian Reichel <sre@kernel.org>, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        asahi@lists.linux.dev, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Charles Keepax <ckeepax@opensource.cirrus.com>
Subject: [PATCH v3] ASoC: dt-bindings: Use consistent indentation in the example
Date: Tue, 15 Sep 2026 08:33:18 +0200
Message-ID: <20260915063317.28971-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=41363; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=Nwfl1lJ6LgN5GbRBXVIIkkJ4VOlzNtk7aM9Gt1tTU7c=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqqOaudIs74jnkW110Jpx3oX8spca1+m15x27Ni
 jO7DYKCKmuJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaqjmrgAKCRDBN2bmhouD
 1zZqD/4k/sF4OjErkDtqZKhWk1CgTOCrI57Zm2NmN+ExZcUHDvAPU+QGtPDyonKEY94KOT2xkmM
 SAO7llTV6xjd4rV+uojrWVK+4PmJZoZRw2sKvKv604uPi/EZNsOmfbr+DRhiqDInaudngBpb9je
 jg2gpfjm0j2CCmpveUblgeZG54FBU5pVD2duncCYMtuQ8I8g8i1tyyeFNmFbNsfi9NeHGKf3CG+
 IBh60Y4ryWXAWplF2C1mPpx33C7zPAOq1vFafaarv/xTi5FyMHxmWH1bIHugp1G82f4adwAaI3l
 v3v/lQuBiUaUeZVgb/NQYcE8QEqaS3B42dUjSCNTc16+Saqy1Snu6MjbuF9NyGuFvfn5orquX8w
 CyGLoM0SCqNzbnjxUc6ZUr0jgFsWVtTYePfRuEsLCB3CjcK61mL/1YoNWOI+i3YfdbtfeoR96zM
 idewJ8xXCHi91g5u2h+0yzPUZiB0NBGCM7cgj0VKQTzlDOPFO0yt6OSjIeRbs9y8bTlINbotNeB
 tA9i4pFA6LFffVyO2Eh/Du5cWPoS1CxA9jB/GxmwiIfzDsSX1zdl4HL6Ja9tl2Fcmx5d6lc49es
 fYyDyvWYsObt3JMF0CZG0ooSVMjh4qSMaQ9jw9BujBumy826KL3z5wDdELAYX/kpNS+XIdWtJL6 OVPX6PPo3QxK0Sg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=G+KJgNk5 c=1 sm=1 tr=0 ts=6aa8e6bc cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=w1d2syhTAAAA:8
 a=EUspDBNiAAAA:8 a=7p_UE0clmVTtnVJhTuAA:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDA5MSBTYWx0ZWRfX3vtXar4x3t3k
 BSW2DYgaAa+CBNoiw0HpKNfj0Fcu3hd6C0QQwKpzP7lUcUj2tpHzS8m5nuzQ/vNUZVSRdxCjT25
 3cVOHWdXmjHha2c6WOKbAdQV9VQnkvxHuKVoDMIK2TVwH2WlsNaHWap+2QCN19JmbcWdsjTVPI8
 KTizRjBh//4znHf63kCwv5voUHtUd+HHmnM/ag56hKzAO4OgcAV3PDEqgQR4w1INJlSJZSi5NCx
 TuvUmRLM/S6zqAwCv/M0Y0ImcdCCoFQGmRtS98sIaNZNHC7gwJgNveRWoBK4IOoZ9806lB0gDL0
 bSiEPEvSyvka8BEyUB8Dpu5oRsRcgz31eXXQtXiVMoTlldcDYxUWWzsYRHZOl59kKywZeiyuK/y
 Mc1iMyR8e+lYqMn1DH06e54/Vg6YHVaH8T76EPWBSM2wZ7rgAXvFp+t4uoJTnjlviEx8OXFwlqB
 ksX5nScpkTYd1TgCLtw==
X-Proofpoint-GUID: QfETM3hz0ZfiRk-6ZXhm1egV8QM8snJw
X-Proofpoint-ORIG-GUID: QfETM3hz0ZfiRk-6ZXhm1egV8QM8snJw
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDA5MSBTYWx0ZWRfX510jsrjpssTJ
 L5h6Vjuhq2yL32cibIUIf9rfjyVANHf2alVtGn/F5oOJujqGZPmXG+F8AQfJ/mmeHoBJenjBXmk
 A8RIvr7Co2Z7NF3fXPQ2Pj3yGmvzmjk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_01,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 adultscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150091
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_073342_913167_128FAD2E 
X-CRM114-Status: GOOD (  18.08  )
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

Correct indentation in the examples to consistent 2- or 4-spaces
indentation to fix dt-check-style warnings ("example 0
[indent-consistent] indent mismatch ...").  Preferred is 4-spaces, but
re-indenting entire example just for that is too much churn.

While changing the lines, correct also node name to be generic in
cirrus,cs35l45.yaml, cirrus,cs42l42.yaml and dialog,da7219.yaml.

Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Changes in v3:
1. Rebase, changes in cirrus,cs35l45.yaml due to new properties.
2. Tags

Changes in v2:
1. Change node name also in cirrus,cs35l45.yaml.
2. Mention all changed node names in commit msg.
---
 .../bindings/sound/adi,adau1372.yaml          | 10 +--
 .../bindings/sound/adi,adau7118.yaml          | 22 ++---
 .../bindings/sound/amlogic,gx-sound-card.yaml | 20 ++---
 .../bindings/sound/asahi-kasei,ak4619.yaml    |  6 +-
 .../bindings/sound/cirrus,cs35l45.yaml        | 44 +++++-----
 .../bindings/sound/cirrus,cs4270.yaml         | 12 +--
 .../bindings/sound/cirrus,cs42l42.yaml        | 42 +++++-----
 .../bindings/sound/cirrus,cs42l84.yaml        | 18 ++--
 .../bindings/sound/cirrus,cs42xx8.yaml        | 56 ++++++-------
 .../bindings/sound/dialog,da7219.yaml         | 62 +++++++-------
 .../bindings/sound/fsl,imx-asrc.yaml          |  2 +-
 .../devicetree/bindings/sound/fsl,sai.yaml    | 14 ++--
 .../bindings/sound/imx-audio-card.yaml        |  4 +-
 .../bindings/sound/invensense,ics43432.yaml   |  8 +-
 .../sound/loongson,ls-audio-card.yaml         |  4 +-
 .../sound/mediatek,mt8173-afe-pcm.yaml        | 22 ++---
 .../bindings/sound/mediatek,mt8183-audio.yaml | 82 +++++++++----------
 .../sound/mt8186-mt6366-da7219-max98357.yaml  | 36 ++++----
 .../sound/mt8186-mt6366-rt1019-rt5682s.yaml   | 36 ++++----
 .../sound/mt8192-mt6359-rt1015-rt5682.yaml    | 46 +++++------
 .../bindings/sound/mt8195-mt6359.yaml         | 50 +++++------
 .../bindings/sound/qcom,q6apm-lpass-dais.yaml | 12 +--
 .../bindings/sound/renesas,rsnd.yaml          | 16 ++--
 .../bindings/sound/renesas,rz-ssi.yaml        | 32 ++++----
 .../bindings/sound/ti,tas5805m.yaml           | 10 +--
 .../bindings/sound/ti,tlv320dac3100.yaml      |  2 +-
 .../bindings/sound/ti,tpa6130a2.yaml          |  2 +-
 27 files changed, 335 insertions(+), 335 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/adi,adau1372.yaml b/Documentation/devicetree/bindings/sound/adi,adau1372.yaml
index 9a7ff50a0a22..532550de62d7 100644
--- a/Documentation/devicetree/bindings/sound/adi,adau1372.yaml
+++ b/Documentation/devicetree/bindings/sound/adi,adau1372.yaml
@@ -52,11 +52,11 @@ examples:
         #address-cells = <1>;
         #size-cells = <0>;
         audio-codec@3c {
-                compatible = "adi,adau1372";
-                reg = <0x3c>;
-                #sound-dai-cells = <0>;
-                clock-names = "mclk";
-                clocks = <&adau1372z_xtal>;
+            compatible = "adi,adau1372";
+            reg = <0x3c>;
+            #sound-dai-cells = <0>;
+            clock-names = "mclk";
+            clocks = <&adau1372z_xtal>;
         };
     };
 
diff --git a/Documentation/devicetree/bindings/sound/adi,adau7118.yaml b/Documentation/devicetree/bindings/sound/adi,adau7118.yaml
index 11f59c29b575..8272cdaf66a8 100644
--- a/Documentation/devicetree/bindings/sound/adi,adau7118.yaml
+++ b/Documentation/devicetree/bindings/sound/adi,adau7118.yaml
@@ -68,20 +68,20 @@ examples:
         #address-cells = <1>;
         #size-cells = <0>;
         adau7118_codec: audio-codec@14 {
-                compatible = "adi,adau7118";
-                reg = <0x14>;
-                #sound-dai-cells = <0>;
-                iovdd-supply = <&supply>;
-                dvdd-supply = <&supply>;
-                adi,pdm-clk-map = <1 1 0 0>;
-                adi,decimation-ratio = <16>;
+            compatible = "adi,adau7118";
+            reg = <0x14>;
+            #sound-dai-cells = <0>;
+            iovdd-supply = <&supply>;
+            dvdd-supply = <&supply>;
+            adi,pdm-clk-map = <1 1 0 0>;
+            adi,decimation-ratio = <16>;
         };
     };
 
     /* example with hw standalone mode */
     adau7118_codec_hw: adau7118-codec-hw {
-            compatible = "adi,adau7118";
-            #sound-dai-cells = <0>;
-            iovdd-supply = <&supply>;
-            dvdd-supply = <&supply>;
+        compatible = "adi,adau7118";
+        #sound-dai-cells = <0>;
+        iovdd-supply = <&supply>;
+        dvdd-supply = <&supply>;
     };
diff --git a/Documentation/devicetree/bindings/sound/amlogic,gx-sound-card.yaml b/Documentation/devicetree/bindings/sound/amlogic,gx-sound-card.yaml
index 6fdf605ad59c..2be3b34e4f5f 100644
--- a/Documentation/devicetree/bindings/sound/amlogic,gx-sound-card.yaml
+++ b/Documentation/devicetree/bindings/sound/amlogic,gx-sound-card.yaml
@@ -94,20 +94,20 @@ examples:
         audio-routing = "I2S ENCODER I2S IN", "I2S FIFO Playback";
 
         dai-link-0 {
-               sound-dai = <&i2s_fifo>;
+            sound-dai = <&i2s_fifo>;
         };
 
         dai-link-1 {
-                sound-dai = <&i2s_encoder>;
-                dai-format = "i2s";
-                mclk-fs = <256>;
+            sound-dai = <&i2s_encoder>;
+            dai-format = "i2s";
+            mclk-fs = <256>;
 
-                codec-0 {
-                        sound-dai = <&codec0>;
-                };
+            codec-0 {
+                sound-dai = <&codec0>;
+            };
 
-                codec-1 {
-                        sound-dai = <&codec1>;
-                };
+            codec-1 {
+                sound-dai = <&codec1>;
+            };
         };
     };
diff --git a/Documentation/devicetree/bindings/sound/asahi-kasei,ak4619.yaml b/Documentation/devicetree/bindings/sound/asahi-kasei,ak4619.yaml
index d412531ef9a2..2e81947bb8dd 100644
--- a/Documentation/devicetree/bindings/sound/asahi-kasei,ak4619.yaml
+++ b/Documentation/devicetree/bindings/sound/asahi-kasei,ak4619.yaml
@@ -54,9 +54,9 @@ examples:
 
             #sound-dai-cells = <0>;
             port {
-                 ak4619_endpoint: endpoint {
-                       remote-endpoint = <&rsnd_endpoint>;
-                  };
+                ak4619_endpoint: endpoint {
+                    remote-endpoint = <&rsnd_endpoint>;
+                };
             };
         };
     };
diff --git a/Documentation/devicetree/bindings/sound/cirrus,cs35l45.yaml b/Documentation/devicetree/bindings/sound/cirrus,cs35l45.yaml
index fd0646b609f9..1ba809888a88 100644
--- a/Documentation/devicetree/bindings/sound/cirrus,cs35l45.yaml
+++ b/Documentation/devicetree/bindings/sound/cirrus,cs35l45.yaml
@@ -153,27 +153,27 @@ examples:
         #address-cells = <1>;
         #size-cells = <0>;
 
-        cs35l45: cs35l45@2 {
-          #sound-dai-cells = <1>;
-          compatible = "cirrus,cs35l45";
-          reg = <2>;
-          spi-max-frequency = <5000000>;
-          vdd-a-supply = <&dummy_vreg>;
-          vdd-batt-supply = <&dummy_vreg>;
-          reset-gpios = <&gpio 110 0>;
-          cirrus,asp-sdout-hiz-ctrl = <(CS35L45_ASP_TX_HIZ_UNUSED |
-                                        CS35L45_ASP_TX_HIZ_DISABLED)>;
-          cirrus,sync-lsw-txid = <0x1>;
-          cirrus,sync-sw-txid = <0x1>;
-          cirrus,gpio-ctrl1 {
-             gpio-ctrl = <0x2>;
-          };
-          cirrus,gpio-ctrl2 {
-             gpio-ctrl = <0x2>;
-          };
-          cirrus,gpio-ctrl3 {
-             gpio-ctrl = <0x1>;
-             gpio-dir = <0x1>;
-          };
+        cs35l45: audio-codec@2 {
+            #sound-dai-cells = <1>;
+            compatible = "cirrus,cs35l45";
+            reg = <2>;
+            spi-max-frequency = <5000000>;
+            vdd-a-supply = <&dummy_vreg>;
+            vdd-batt-supply = <&dummy_vreg>;
+            reset-gpios = <&gpio 110 0>;
+            cirrus,asp-sdout-hiz-ctrl = <(CS35L45_ASP_TX_HIZ_UNUSED |
+                                          CS35L45_ASP_TX_HIZ_DISABLED)>;
+            cirrus,sync-lsw-txid = <0x1>;
+            cirrus,sync-sw-txid = <0x1>;
+            cirrus,gpio-ctrl1 {
+                gpio-ctrl = <0x2>;
+            };
+            cirrus,gpio-ctrl2 {
+                gpio-ctrl = <0x2>;
+            };
+            cirrus,gpio-ctrl3 {
+                gpio-ctrl = <0x1>;
+                gpio-dir = <0x1>;
+            };
         };
     };
diff --git a/Documentation/devicetree/bindings/sound/cirrus,cs4270.yaml b/Documentation/devicetree/bindings/sound/cirrus,cs4270.yaml
index 336e11773694..61106294a1d5 100644
--- a/Documentation/devicetree/bindings/sound/cirrus,cs4270.yaml
+++ b/Documentation/devicetree/bindings/sound/cirrus,cs4270.yaml
@@ -49,11 +49,11 @@ unevaluatedProperties: false
 examples:
   - |
     i2c {
-      #address-cells = <1>;
-      #size-cells = <0>;
+        #address-cells = <1>;
+        #size-cells = <0>;
 
-      codec@48 {
-          compatible = "cirrus,cs4270";
-          reg = <0x48>;
-      };
+        codec@48 {
+            compatible = "cirrus,cs4270";
+            reg = <0x48>;
+        };
     };
diff --git a/Documentation/devicetree/bindings/sound/cirrus,cs42l42.yaml b/Documentation/devicetree/bindings/sound/cirrus,cs42l42.yaml
index af599d8735e2..ab4c7d22dc0e 100644
--- a/Documentation/devicetree/bindings/sound/cirrus,cs42l42.yaml
+++ b/Documentation/devicetree/bindings/sound/cirrus,cs42l42.yaml
@@ -199,28 +199,28 @@ examples:
   - |
     #include <dt-bindings/sound/cs42l42.h>
     i2c {
-      #address-cells = <1>;
-      #size-cells = <0>;
+        #address-cells = <1>;
+        #size-cells = <0>;
 
-      cs42l42: cs42l42@48 {
-          compatible = "cirrus,cs42l42";
-          reg = <0x48>;
-          VA-supply = <&dummy_vreg>;
-          VP-supply = <&dummy_vreg>;
-          VCP-supply = <&dummy_vreg>;
-          VD_FILT-supply = <&dummy_vreg>;
-          VL-supply = <&dummy_vreg>;
+        audio-codec@48 {
+            compatible = "cirrus,cs42l42";
+            reg = <0x48>;
+            VA-supply = <&dummy_vreg>;
+            VP-supply = <&dummy_vreg>;
+            VCP-supply = <&dummy_vreg>;
+            VD_FILT-supply = <&dummy_vreg>;
+            VL-supply = <&dummy_vreg>;
 
-          reset-gpios = <&axi_gpio_0 1 0>;
-          interrupt-parent = <&gpio0>;
-          interrupts = <55 8>;
+            reset-gpios = <&axi_gpio_0 1 0>;
+            interrupt-parent = <&gpio0>;
+            interrupts = <55 8>;
 
-          cirrus,ts-inv = <CS42L42_TS_INV_DIS>;
-          cirrus,ts-dbnc-rise = <CS42L42_TS_DBNCE_1000>;
-          cirrus,ts-dbnc-fall = <CS42L42_TS_DBNCE_0>;
-          cirrus,btn-det-init-dbnce = <100>;
-          cirrus,btn-det-event-dbnce = <10>;
-          cirrus,bias-lvls = <0x0F 0x08 0x04 0x01>;
-          cirrus,hs-bias-ramp-rate = <CS42L42_HSBIAS_RAMP_SLOW>;
-      };
+            cirrus,ts-inv = <CS42L42_TS_INV_DIS>;
+            cirrus,ts-dbnc-rise = <CS42L42_TS_DBNCE_1000>;
+            cirrus,ts-dbnc-fall = <CS42L42_TS_DBNCE_0>;
+            cirrus,btn-det-init-dbnce = <100>;
+            cirrus,btn-det-event-dbnce = <10>;
+            cirrus,bias-lvls = <0x0F 0x08 0x04 0x01>;
+            cirrus,hs-bias-ramp-rate = <CS42L42_HSBIAS_RAMP_SLOW>;
+        };
     };
diff --git a/Documentation/devicetree/bindings/sound/cirrus,cs42l84.yaml b/Documentation/devicetree/bindings/sound/cirrus,cs42l84.yaml
index 7f8338e8ae36..94062c1d9d45 100644
--- a/Documentation/devicetree/bindings/sound/cirrus,cs42l84.yaml
+++ b/Documentation/devicetree/bindings/sound/cirrus,cs42l84.yaml
@@ -43,14 +43,14 @@ examples:
     #include <dt-bindings/gpio/gpio.h>
     #include <dt-bindings/interrupt-controller/irq.h>
     i2c {
-      #address-cells = <1>;
-      #size-cells = <0>;
+        #address-cells = <1>;
+        #size-cells = <0>;
 
-      jack_codec: codec@4b {
-          compatible = "cirrus,cs42l84";
-          reg = <0x4b>;
-          reset-gpios = <&pinctrl_nub 4 GPIO_ACTIVE_LOW>;
-          interrupts-extended = <&pinctrl_ap 180 IRQ_TYPE_LEVEL_LOW>;
-          #sound-dai-cells = <0>;
-      };
+        jack_codec: codec@4b {
+            compatible = "cirrus,cs42l84";
+            reg = <0x4b>;
+            reset-gpios = <&pinctrl_nub 4 GPIO_ACTIVE_LOW>;
+            interrupts-extended = <&pinctrl_ap 180 IRQ_TYPE_LEVEL_LOW>;
+            #sound-dai-cells = <0>;
+        };
     };
diff --git a/Documentation/devicetree/bindings/sound/cirrus,cs42xx8.yaml b/Documentation/devicetree/bindings/sound/cirrus,cs42xx8.yaml
index a1ae548c4b7b..b5cdc7e537f8 100644
--- a/Documentation/devicetree/bindings/sound/cirrus,cs42xx8.yaml
+++ b/Documentation/devicetree/bindings/sound/cirrus,cs42xx8.yaml
@@ -75,37 +75,37 @@ unevaluatedProperties: false
 examples:
   - |
     i2c {
-      #address-cells = <1>;
-      #size-cells = <0>;
+        #address-cells = <1>;
+        #size-cells = <0>;
 
-      codec@48 {
-          compatible = "cirrus,cs42888";
-          reg = <0x48>;
-          clocks = <&codec_mclk 0>;
-          clock-names = "mclk";
-          VA-supply = <&reg_audio>;
-          VD-supply = <&reg_audio>;
-          VLS-supply = <&reg_audio>;
-          VLC-supply = <&reg_audio>;
-          reset-gpios = <&gpio 1>;
-      };
+        codec@48 {
+            compatible = "cirrus,cs42888";
+            reg = <0x48>;
+            clocks = <&codec_mclk 0>;
+            clock-names = "mclk";
+            VA-supply = <&reg_audio>;
+            VD-supply = <&reg_audio>;
+            VLS-supply = <&reg_audio>;
+            VLC-supply = <&reg_audio>;
+            reset-gpios = <&gpio 1>;
+        };
     };
 
     spi {
-      #address-cells = <1>;
-      #size-cells = <0>;
-      cs-gpios = <&gpio 8 0>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+        cs-gpios = <&gpio 8 0>;
 
-      codec@0 {
-          compatible = "cirrus,cs42888";
-          reg = <0>;
-          spi-max-frequency = <6000000>;
-          clocks = <&codec_mclk 0>;
-          clock-names = "mclk";
-          VA-supply = <&reg_audio>;
-          VD-supply = <&reg_audio>;
-          VLS-supply = <&reg_audio>;
-          VLC-supply = <&reg_audio>;
-          reset-gpios = <&gpio 1>;
-      };
+        codec@0 {
+            compatible = "cirrus,cs42888";
+            reg = <0>;
+            spi-max-frequency = <6000000>;
+            clocks = <&codec_mclk 0>;
+            clock-names = "mclk";
+            VA-supply = <&reg_audio>;
+            VD-supply = <&reg_audio>;
+            VLS-supply = <&reg_audio>;
+            VLC-supply = <&reg_audio>;
+            reset-gpios = <&gpio 1>;
+        };
     };
diff --git a/Documentation/devicetree/bindings/sound/dialog,da7219.yaml b/Documentation/devicetree/bindings/sound/dialog,da7219.yaml
index 19137abdba3e..852f27e9dffe 100644
--- a/Documentation/devicetree/bindings/sound/dialog,da7219.yaml
+++ b/Documentation/devicetree/bindings/sound/dialog,da7219.yaml
@@ -195,44 +195,44 @@ examples:
   - |
     #include <dt-bindings/interrupt-controller/irq.h>
     i2c {
-      #address-cells = <1>;
-      #size-cells = <0>;
+        #address-cells = <1>;
+        #size-cells = <0>;
 
-      codec: da7219@1a {
-          compatible = "dlg,da7219";
-          reg = <0x1a>;
+        codec: audio-codec@1a {
+            compatible = "dlg,da7219";
+            reg = <0x1a>;
 
-          interrupt-parent = <&gpio6>;
-          interrupts = <11 IRQ_TYPE_LEVEL_LOW>;
+            interrupt-parent = <&gpio6>;
+            interrupts = <11 IRQ_TYPE_LEVEL_LOW>;
 
-          VDD-supply = <&vdd_reg>;
-          VDDMIC-supply = <&vddmic_reg>;
-          VDDIO-supply = <&vddio_reg>;
+            VDD-supply = <&vdd_reg>;
+            VDDMIC-supply = <&vddmic_reg>;
+            VDDIO-supply = <&vddio_reg>;
 
-          #clock-cells = <1>;
-          clock-output-names = "da7219-dai-wclk", "da7219-dai-bclk";
+            #clock-cells = <1>;
+            clock-output-names = "da7219-dai-wclk", "da7219-dai-bclk";
 
-          clocks = <&clks 201>;
-          clock-names = "mclk";
+            clocks = <&clks 201>;
+            clock-names = "mclk";
 
-          dlg,micbias-lvl = <2600>;
-          dlg,mic-amp-in-sel = "diff";
+            dlg,micbias-lvl = <2600>;
+            dlg,mic-amp-in-sel = "diff";
 
-          da7219_aad {
-              dlg,btn-cfg = <50>;
-              dlg,mic-det-thr = <500>;
-              dlg,jack-ins-deb = <20>;
-              dlg,jack-ins-det-pty = "low";
-              dlg,jack-det-rate = "32_64";
-              dlg,jack-rem-deb = <1>;
+            da7219_aad {
+                dlg,btn-cfg = <50>;
+                dlg,mic-det-thr = <500>;
+                dlg,jack-ins-deb = <20>;
+                dlg,jack-ins-det-pty = "low";
+                dlg,jack-det-rate = "32_64";
+                dlg,jack-rem-deb = <1>;
 
-              dlg,a-d-btn-thr = <0xa>;
-              dlg,d-b-btn-thr = <0x16>;
-              dlg,b-c-btn-thr = <0x21>;
-              dlg,c-mic-btn-thr = <0x3E>;
+                dlg,a-d-btn-thr = <0xa>;
+                dlg,d-b-btn-thr = <0x16>;
+                dlg,b-c-btn-thr = <0x21>;
+                dlg,c-mic-btn-thr = <0x3E>;
 
-              dlg,btn-avg = <4>;
-              dlg,adc-1bit-rpt = <1>;
-          };
-      };
+                dlg,btn-avg = <4>;
+                dlg,adc-1bit-rpt = <1>;
+            };
+        };
     };
diff --git a/Documentation/devicetree/bindings/sound/fsl,imx-asrc.yaml b/Documentation/devicetree/bindings/sound/fsl,imx-asrc.yaml
index 608defc93c1e..cd69bad107c7 100644
--- a/Documentation/devicetree/bindings/sound/fsl,imx-asrc.yaml
+++ b/Documentation/devicetree/bindings/sound/fsl,imx-asrc.yaml
@@ -186,5 +186,5 @@ examples:
             asrc_endpoint: endpoint {
                 remote-endpoint = <&fe00_ep>;
             };
-       };
+        };
     };
diff --git a/Documentation/devicetree/bindings/sound/fsl,sai.yaml b/Documentation/devicetree/bindings/sound/fsl,sai.yaml
index ba65b3f3d066..eb0b9d8d907f 100644
--- a/Documentation/devicetree/bindings/sound/fsl,sai.yaml
+++ b/Documentation/devicetree/bindings/sound/fsl,sai.yaml
@@ -260,13 +260,13 @@ examples:
                 playback-only;
 
                 sai1_endpoint0: endpoint {
-                   dai-tdm-slot-num = <8>;
-                   dai-tdm-slot-width = <32>;
-                   dai-tdm-slot-width-map = <32 8 32>;
-                   dai-format = "dsp_a";
-                   bitclock-master;
-                   frame-master;
-                   remote-endpoint = <&mcodec01_ep>;
+                    dai-tdm-slot-num = <8>;
+                    dai-tdm-slot-width = <32>;
+                    dai-tdm-slot-width-map = <32 8 32>;
+                    dai-format = "dsp_a";
+                    bitclock-master;
+                    frame-master;
+                    remote-endpoint = <&mcodec01_ep>;
                 };
             };
 
diff --git a/Documentation/devicetree/bindings/sound/imx-audio-card.yaml b/Documentation/devicetree/bindings/sound/imx-audio-card.yaml
index 950e3eab2942..27636466ba63 100644
--- a/Documentation/devicetree/bindings/sound/imx-audio-card.yaml
+++ b/Documentation/devicetree/bindings/sound/imx-audio-card.yaml
@@ -105,10 +105,10 @@ examples:
             format = "i2s";
             fsl,mclk-equal-bclk;
             cpu {
-                 sound-dai = <&sai1>;
+                sound-dai = <&sai1>;
             };
             codec {
-                 sound-dai = <&ak4458_1>, <&ak4458_2>;
+                sound-dai = <&ak4458_1>, <&ak4458_2>;
             };
         };
         fe-dai-link {
diff --git a/Documentation/devicetree/bindings/sound/invensense,ics43432.yaml b/Documentation/devicetree/bindings/sound/invensense,ics43432.yaml
index 7bd984817aa9..054f80390b8d 100644
--- a/Documentation/devicetree/bindings/sound/invensense,ics43432.yaml
+++ b/Documentation/devicetree/bindings/sound/invensense,ics43432.yaml
@@ -42,10 +42,10 @@ examples:
         compatible = "invensense,ics43432";
 
         port {
-          endpoint {
-            remote-endpoint = <&i2s1_endpoint>;
-            dai-format = "i2s";
-          };
+            endpoint {
+                remote-endpoint = <&i2s1_endpoint>;
+                dai-format = "i2s";
+            };
         };
 
     };
diff --git a/Documentation/devicetree/bindings/sound/loongson,ls-audio-card.yaml b/Documentation/devicetree/bindings/sound/loongson,ls-audio-card.yaml
index dc7f4afbb777..69ea611d4250 100644
--- a/Documentation/devicetree/bindings/sound/loongson,ls-audio-card.yaml
+++ b/Documentation/devicetree/bindings/sound/loongson,ls-audio-card.yaml
@@ -79,7 +79,7 @@ examples:
             sound-dai = <&i2s>;
         };
         codec {
-             sound-dai = <&es8323>;
+            sound-dai = <&es8323>;
         };
     };
 
@@ -104,6 +104,6 @@ examples:
         };
 
         codec {
-             sound-dai = <&es8388>;
+            sound-dai = <&es8388>;
         };
     };
diff --git a/Documentation/devicetree/bindings/sound/mediatek,mt8173-afe-pcm.yaml b/Documentation/devicetree/bindings/sound/mediatek,mt8173-afe-pcm.yaml
index d8993b5d457a..4c66160e9e1b 100644
--- a/Documentation/devicetree/bindings/sound/mediatek,mt8173-afe-pcm.yaml
+++ b/Documentation/devicetree/bindings/sound/mediatek,mt8173-afe-pcm.yaml
@@ -84,15 +84,15 @@ examples:
                  <&topckgen CLK_TOP_I2S2_M_SEL>,
                  <&topckgen CLK_TOP_I2S3_M_SEL>,
                  <&topckgen CLK_TOP_I2S3_B_SEL>;
-         clock-names = "infra_sys_audio_clk",
-                       "top_pdn_audio",
-                       "top_pdn_aud_intbus",
-                       "bck0",
-                       "bck1",
-                       "i2s0_m",
-                       "i2s1_m",
-                       "i2s2_m",
-                       "i2s3_m",
-                       "i2s3_b";
-          memory-region = <&afe_dma_mem>;
+        clock-names = "infra_sys_audio_clk",
+                      "top_pdn_audio",
+                      "top_pdn_aud_intbus",
+                      "bck0",
+                      "bck1",
+                      "i2s0_m",
+                      "i2s1_m",
+                      "i2s2_m",
+                      "i2s3_m",
+                      "i2s3_b";
+        memory-region = <&afe_dma_mem>;
     };
diff --git a/Documentation/devicetree/bindings/sound/mediatek,mt8183-audio.yaml b/Documentation/devicetree/bindings/sound/mediatek,mt8183-audio.yaml
index 031b0fa7b4dc..261247ca2c87 100644
--- a/Documentation/devicetree/bindings/sound/mediatek,mt8183-audio.yaml
+++ b/Documentation/devicetree/bindings/sound/mediatek,mt8183-audio.yaml
@@ -182,47 +182,47 @@ examples:
                  <&topckgen CLK_TOP_APLL12_DIV4>,
                  <&topckgen CLK_TOP_APLL12_DIVB>,
                  <&clk26m>;
-      clock-names = "aud_afe_clk",
-                    "aud_dac_clk",
-                    "aud_dac_predis_clk",
-                    "aud_adc_clk",
-                    "aud_adc_adda6_clk",
-                    "aud_apll22m_clk",
-                    "aud_apll24m_clk",
-                    "aud_apll1_tuner_clk",
-                    "aud_apll2_tuner_clk",
-                    "aud_i2s1_bclk_sw",
-                    "aud_i2s2_bclk_sw",
-                    "aud_i2s3_bclk_sw",
-                    "aud_i2s4_bclk_sw",
-                    "aud_tdm_clk",
-                    "aud_tml_clk",
-                    "aud_infra_clk",
-                    "mtkaif_26m_clk",
-                    "top_mux_audio",
-                    "top_mux_aud_intbus",
-                    "top_syspll_d2_d4",
-                    "top_mux_aud_1",
-                    "top_apll1_ck",
-                    "top_mux_aud_2",
-                    "top_apll2_ck",
-                    "top_mux_aud_eng1",
-                    "top_apll1_d8",
-                    "top_mux_aud_eng2",
-                    "top_apll2_d8",
-                    "top_i2s0_m_sel",
-                    "top_i2s1_m_sel",
-                    "top_i2s2_m_sel",
-                    "top_i2s3_m_sel",
-                    "top_i2s4_m_sel",
-                    "top_i2s5_m_sel",
-                    "top_apll12_div0",
-                    "top_apll12_div1",
-                    "top_apll12_div2",
-                    "top_apll12_div3",
-                    "top_apll12_div4",
-                    "top_apll12_divb",
-                    "top_clk26m_clk";
+        clock-names = "aud_afe_clk",
+                      "aud_dac_clk",
+                      "aud_dac_predis_clk",
+                      "aud_adc_clk",
+                      "aud_adc_adda6_clk",
+                      "aud_apll22m_clk",
+                      "aud_apll24m_clk",
+                      "aud_apll1_tuner_clk",
+                      "aud_apll2_tuner_clk",
+                      "aud_i2s1_bclk_sw",
+                      "aud_i2s2_bclk_sw",
+                      "aud_i2s3_bclk_sw",
+                      "aud_i2s4_bclk_sw",
+                      "aud_tdm_clk",
+                      "aud_tml_clk",
+                      "aud_infra_clk",
+                      "mtkaif_26m_clk",
+                      "top_mux_audio",
+                      "top_mux_aud_intbus",
+                      "top_syspll_d2_d4",
+                      "top_mux_aud_1",
+                      "top_apll1_ck",
+                      "top_mux_aud_2",
+                      "top_apll2_ck",
+                      "top_mux_aud_eng1",
+                      "top_apll1_d8",
+                      "top_mux_aud_eng2",
+                      "top_apll2_d8",
+                      "top_i2s0_m_sel",
+                      "top_i2s1_m_sel",
+                      "top_i2s2_m_sel",
+                      "top_i2s3_m_sel",
+                      "top_i2s4_m_sel",
+                      "top_i2s5_m_sel",
+                      "top_apll12_div0",
+                      "top_apll12_div1",
+                      "top_apll12_div2",
+                      "top_apll12_div3",
+                      "top_apll12_div4",
+                      "top_apll12_divb",
+                      "top_clk26m_clk";
     };
 
 ...
diff --git a/Documentation/devicetree/bindings/sound/mt8186-mt6366-da7219-max98357.yaml b/Documentation/devicetree/bindings/sound/mt8186-mt6366-da7219-max98357.yaml
index 037f21443ad1..d5b358838e2a 100644
--- a/Documentation/devicetree/bindings/sound/mt8186-mt6366-da7219-max98357.yaml
+++ b/Documentation/devicetree/bindings/sound/mt8186-mt6366-da7219-max98357.yaml
@@ -167,30 +167,30 @@ examples:
                 "HDMI1", "TX";
 
         hs-playback-dai-link {
-                link-name = "I2S0";
-                dai-format = "i2s";
-                mediatek,clk-provider = "cpu";
-                codec {
-                        sound-dai = <&da7219>;
-                };
+            link-name = "I2S0";
+            dai-format = "i2s";
+            mediatek,clk-provider = "cpu";
+            codec {
+                sound-dai = <&da7219>;
+            };
         };
 
         hs-capture-dai-link {
-                link-name = "I2S1";
-                dai-format = "i2s";
-                mediatek,clk-provider = "cpu";
-                codec {
-                        sound-dai = <&da7219>;
-                };
+            link-name = "I2S1";
+            dai-format = "i2s";
+            mediatek,clk-provider = "cpu";
+            codec {
+                sound-dai = <&da7219>;
+            };
         };
 
         spk-dp-playback-dai-link {
-                link-name = "I2S3";
-                dai-format = "i2s";
-                mediatek,clk-provider = "cpu";
-                codec {
-                        sound-dai = <&anx_bridge_dp>, <&max98357a>;
-                };
+            link-name = "I2S3";
+            dai-format = "i2s";
+            mediatek,clk-provider = "cpu";
+            codec {
+                sound-dai = <&anx_bridge_dp>, <&max98357a>;
+            };
         };
     };
 
diff --git a/Documentation/devicetree/bindings/sound/mt8186-mt6366-rt1019-rt5682s.yaml b/Documentation/devicetree/bindings/sound/mt8186-mt6366-rt1019-rt5682s.yaml
index ed93f18ef985..7f553575c73d 100644
--- a/Documentation/devicetree/bindings/sound/mt8186-mt6366-rt1019-rt5682s.yaml
+++ b/Documentation/devicetree/bindings/sound/mt8186-mt6366-rt1019-rt5682s.yaml
@@ -171,30 +171,30 @@ examples:
                 "HDMI1", "TX";
 
         hs-playback-dai-link {
-                link-name = "I2S0";
-                dai-format = "i2s";
-                mediatek,clk-provider = "cpu";
-                codec {
-                        sound-dai = <&rt5682s 0>;
-                };
+            link-name = "I2S0";
+            dai-format = "i2s";
+            mediatek,clk-provider = "cpu";
+            codec {
+                sound-dai = <&rt5682s 0>;
+            };
         };
 
         hs-capture-dai-link {
-                link-name = "I2S1";
-                dai-format = "i2s";
-                mediatek,clk-provider = "cpu";
-                codec {
-                        sound-dai = <&rt5682s 0>;
-                };
+            link-name = "I2S1";
+            dai-format = "i2s";
+            mediatek,clk-provider = "cpu";
+            codec {
+                sound-dai = <&rt5682s 0>;
+            };
         };
 
         spk-hdmi-playback-dai-link {
-                link-name = "I2S3";
-                dai-format = "i2s";
-                mediatek,clk-provider = "cpu";
-                codec {
-                        sound-dai = <&it6505dptx>, <&rt1019p>;
-                };
+            link-name = "I2S3";
+            dai-format = "i2s";
+            mediatek,clk-provider = "cpu";
+            codec {
+                sound-dai = <&it6505dptx>, <&rt1019p>;
+            };
         };
     };
 
diff --git a/Documentation/devicetree/bindings/sound/mt8192-mt6359-rt1015-rt5682.yaml b/Documentation/devicetree/bindings/sound/mt8192-mt6359-rt1015-rt5682.yaml
index c4e68f31aaab..841aab0178e3 100644
--- a/Documentation/devicetree/bindings/sound/mt8192-mt6359-rt1015-rt5682.yaml
+++ b/Documentation/devicetree/bindings/sound/mt8192-mt6359-rt1015-rt5682.yaml
@@ -165,38 +165,38 @@ examples:
                 "Speakers", "Speaker";
 
         spk-playback-dai-link {
-                link-name = "I2S3";
-                dai-format = "i2s";
-                mediatek,clk-provider = "cpu";
-                codec {
-                        sound-dai = <&rt1015p>;
-                };
+            link-name = "I2S3";
+            dai-format = "i2s";
+            mediatek,clk-provider = "cpu";
+            codec {
+                sound-dai = <&rt1015p>;
+            };
         };
 
         hs-playback-dai-link {
-                link-name = "I2S8";
-                dai-format = "i2s";
-                mediatek,clk-provider = "cpu";
-                codec {
-                        sound-dai = <&rt5682 0>;
-                };
+            link-name = "I2S8";
+            dai-format = "i2s";
+            mediatek,clk-provider = "cpu";
+            codec {
+                sound-dai = <&rt5682 0>;
+            };
         };
 
         hs-capture-dai-link {
-                link-name = "I2S9";
-                dai-format = "i2s";
-                mediatek,clk-provider = "cpu";
-                codec {
-                        sound-dai = <&rt5682 0>;
-                };
+            link-name = "I2S9";
+            dai-format = "i2s";
+            mediatek,clk-provider = "cpu";
+            codec {
+                sound-dai = <&rt5682 0>;
+            };
         };
 
         displayport-dai-link {
-                link-name = "TDM";
-                dai-format = "dsp_a";
-                codec {
-                        sound-dai = <&anx_bridge_dp>;
-                };
+            link-name = "TDM";
+            dai-format = "dsp_a";
+            codec {
+                sound-dai = <&anx_bridge_dp>;
+            };
         };
     };
 
diff --git a/Documentation/devicetree/bindings/sound/mt8195-mt6359.yaml b/Documentation/devicetree/bindings/sound/mt8195-mt6359.yaml
index 356e1feee962..c6bd286780c9 100644
--- a/Documentation/devicetree/bindings/sound/mt8195-mt6359.yaml
+++ b/Documentation/devicetree/bindings/sound/mt8195-mt6359.yaml
@@ -156,46 +156,46 @@ examples:
                 "Ext Spk", "Speaker";
 
         mm-dai-link {
-                link-name = "ETDM1_IN_BE";
-                mediatek,clk-provider = "cpu";
+            link-name = "ETDM1_IN_BE";
+            mediatek,clk-provider = "cpu";
         };
 
         hs-playback-dai-link {
-                link-name = "ETDM1_OUT_BE";
-                mediatek,clk-provider = "cpu";
-                codec {
-                        sound-dai = <&headset_codec>;
-                };
+            link-name = "ETDM1_OUT_BE";
+            mediatek,clk-provider = "cpu";
+            codec {
+                sound-dai = <&headset_codec>;
+            };
         };
 
         hs-capture-dai-link {
-                link-name = "ETDM2_IN_BE";
-                mediatek,clk-provider = "cpu";
-                codec {
-                        sound-dai = <&headset_codec>;
-                };
+            link-name = "ETDM2_IN_BE";
+            mediatek,clk-provider = "cpu";
+            codec {
+                sound-dai = <&headset_codec>;
+            };
         };
 
         spk-playback-dai-link {
-                link-name = "ETDM2_OUT_BE";
-                mediatek,clk-provider = "cpu";
-                codec {
-                        sound-dai = <&spk_amplifier>;
-                };
+            link-name = "ETDM2_OUT_BE";
+            mediatek,clk-provider = "cpu";
+            codec {
+                sound-dai = <&spk_amplifier>;
+            };
         };
 
         hdmi-dai-link {
-                link-name = "ETDM3_OUT_BE";
-                codec {
-                        sound-dai = <&hdmi_tx>;
-                };
+            link-name = "ETDM3_OUT_BE";
+            codec {
+                sound-dai = <&hdmi_tx>;
+            };
         };
 
         displayport-dai-link {
-                link-name = "DPTX_BE";
-                codec {
-                        sound-dai = <&dp_tx>;
-                };
+            link-name = "DPTX_BE";
+            codec {
+                sound-dai = <&dp_tx>;
+            };
         };
     };
 
diff --git a/Documentation/devicetree/bindings/sound/qcom,q6apm-lpass-dais.yaml b/Documentation/devicetree/bindings/sound/qcom,q6apm-lpass-dais.yaml
index 4878c424ef03..78587139f155 100644
--- a/Documentation/devicetree/bindings/sound/qcom,q6apm-lpass-dais.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,q6apm-lpass-dais.yaml
@@ -75,11 +75,11 @@ examples:
         #size-cells = <0>;
 
         dai@10 {
-           reg = <PRIMARY_MI2S_RX>;
-           clocks = <&q6prmcc LPASS_CLK_ID_PRI_MI2S_IBIT
-                              LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
-                    <&q6prmcc LPASS_CLK_ID_MCLK_1
-                              LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
-           clock-names = "bclk", "mclk";
+            reg = <PRIMARY_MI2S_RX>;
+            clocks = <&q6prmcc LPASS_CLK_ID_PRI_MI2S_IBIT
+                               LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+                     <&q6prmcc LPASS_CLK_ID_MCLK_1
+                               LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+            clock-names = "bclk", "mclk";
         };
     };
diff --git a/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml b/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
index e8a2acb92646..d3516fb1b130 100644
--- a/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
+++ b/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
@@ -432,14 +432,14 @@ examples:
                       "ssi.1", "ssi.0";
 
         rcar_sound,dvc {
-               dvc0: dvc-0 {
-                    dmas = <&audma0 0xbc>;
-                    dma-names = "tx";
-               };
-               dvc1: dvc-1 {
-                    dmas = <&audma0 0xbe>;
-                    dma-names = "tx";
-               };
+            dvc0: dvc-0 {
+                dmas = <&audma0 0xbc>;
+                dma-names = "tx";
+            };
+            dvc1: dvc-1 {
+                dmas = <&audma0 0xbe>;
+                dma-names = "tx";
+            };
         };
 
         rcar_sound,mix {
diff --git a/Documentation/devicetree/bindings/sound/renesas,rz-ssi.yaml b/Documentation/devicetree/bindings/sound/renesas,rz-ssi.yaml
index 1394f78281fc..d696fb33d9b8 100644
--- a/Documentation/devicetree/bindings/sound/renesas,rz-ssi.yaml
+++ b/Documentation/devicetree/bindings/sound/renesas,rz-ssi.yaml
@@ -95,20 +95,20 @@ examples:
     ssi0: ssi@10049c00 {
         compatible = "renesas,r9a07g044-ssi",
                      "renesas,rz-ssi";
-            reg = <0x10049c00 0x400>;
-            interrupts = <GIC_SPI 326 IRQ_TYPE_LEVEL_HIGH>,
-                         <GIC_SPI 327 IRQ_TYPE_EDGE_RISING>,
-                         <GIC_SPI 328 IRQ_TYPE_EDGE_RISING>;
-            interrupt-names = "int_req", "dma_rx", "dma_tx";
-            clocks = <&cpg CPG_MOD R9A07G044_SSI0_PCLK2>,
-                     <&cpg CPG_MOD R9A07G044_SSI0_PCLK_SFR>,
-                     <&audio_clk1>,
-                     <&audio_clk2>;
-            clock-names = "ssi", "ssi_sfr", "audio_clk1", "audio_clk2";
-            power-domains = <&cpg>;
-            resets = <&cpg R9A07G044_SSI0_RST_M2_REG>;
-            dmas = <&dmac 0x2655>,
-                   <&dmac 0x2656>;
-            dma-names = "tx", "rx";
-            #sound-dai-cells = <0>;
+        reg = <0x10049c00 0x400>;
+        interrupts = <GIC_SPI 326 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 327 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 328 IRQ_TYPE_EDGE_RISING>;
+        interrupt-names = "int_req", "dma_rx", "dma_tx";
+        clocks = <&cpg CPG_MOD R9A07G044_SSI0_PCLK2>,
+                 <&cpg CPG_MOD R9A07G044_SSI0_PCLK_SFR>,
+                 <&audio_clk1>,
+                 <&audio_clk2>;
+        clock-names = "ssi", "ssi_sfr", "audio_clk1", "audio_clk2";
+        power-domains = <&cpg>;
+        resets = <&cpg R9A07G044_SSI0_RST_M2_REG>;
+        dmas = <&dmac 0x2655>,
+               <&dmac 0x2656>;
+        dma-names = "tx", "rx";
+        #sound-dai-cells = <0>;
     };
diff --git a/Documentation/devicetree/bindings/sound/ti,tas5805m.yaml b/Documentation/devicetree/bindings/sound/ti,tas5805m.yaml
index c2c2835a9e1d..f2ab274b02cd 100644
--- a/Documentation/devicetree/bindings/sound/ti,tas5805m.yaml
+++ b/Documentation/devicetree/bindings/sound/ti,tas5805m.yaml
@@ -45,13 +45,13 @@ examples:
         #address-cells = <1>;
         #size-cells = <0>;
         tas5805m: tas5805m@2c {
-                reg = <0x2c>;
-                compatible = "ti,tas5805m";
+            reg = <0x2c>;
+            compatible = "ti,tas5805m";
 
-                pvdd-supply = <&audiopwr>;
-                pdn-gpios = <&tlmm 160 0>;
+            pvdd-supply = <&audiopwr>;
+            pdn-gpios = <&tlmm 160 0>;
 
-                ti,dsp-config-name = "mono_pbtl_48khz";
+            ti,dsp-config-name = "mono_pbtl_48khz";
         };
     };
 ...
diff --git a/Documentation/devicetree/bindings/sound/ti,tlv320dac3100.yaml b/Documentation/devicetree/bindings/sound/ti,tlv320dac3100.yaml
index 10299064cbc6..3bdaab1e5084 100644
--- a/Documentation/devicetree/bindings/sound/ti,tlv320dac3100.yaml
+++ b/Documentation/devicetree/bindings/sound/ti,tlv320dac3100.yaml
@@ -121,6 +121,6 @@ examples:
             AVDD-supply = <&regulator>;
             IOVDD-supply = <&regulator>;
             DVDD-supply = <&regulator>;
-       };
+        };
     };
 
diff --git a/Documentation/devicetree/bindings/sound/ti,tpa6130a2.yaml b/Documentation/devicetree/bindings/sound/ti,tpa6130a2.yaml
index a42bf9bde694..5634b601ce65 100644
--- a/Documentation/devicetree/bindings/sound/ti,tpa6130a2.yaml
+++ b/Documentation/devicetree/bindings/sound/ti,tpa6130a2.yaml
@@ -50,6 +50,6 @@ examples:
             reg = <0x60>;
             Vdd-supply = <&vmmc2>;
             power-gpio = <&gpio4 2 GPIO_ACTIVE_HIGH>;
-       };
+        };
     };
 
-- 
2.53.0


