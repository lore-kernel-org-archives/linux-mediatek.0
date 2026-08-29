Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBD7AC61DCB
	for <linux-mediatek@archiver.kernel.org>; Sat, 29 Aug 2026 19:39:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MG4HiwRAfo4nKnx8mRL+C2bMS7+F3i5QnNncb03Lprk=; b=HGF7JUtb7Pwpda2710htSFgmXA
	uDqqA1X8vfDbz6uaJX57i5dQEuWUAMRFPFMs+n4wnb/glnLM+XDCRHH9lw2CUEooBJobtNSFtk0Gt
	/13i0Um7ic8Ac8CyPdUu0tEAUOBmGumKSL8GuwrO4WlyIsSJLwgneTOMYA3BBOPjusuOSIAq8L9M6
	WuF61b/Ke9HYuKSyoFxhzBOmfhtHr9KVuse6uejDFUm1HfB2VgsmKn2Yiu3V5nRsrhFZkkezdueIO
	RQHyPK8QO03RlpT+SPuS4IZ7+89LbJOx9wjjDVbbZEIxZOlNqhh5mD/QgAqkYXMWcRMyWD2voFg50
	Hay40otw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0Otd-00000007Frq-1zld;
	Sat, 29 Aug 2026 19:39:21 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0Otb-00000007Fr7-1ZBz
	for linux-mediatek@lists.infradead.org;
	Sat, 29 Aug 2026 19:39:20 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67TH01e23456593
	for <linux-mediatek@lists.infradead.org>; Sat, 29 Aug 2026 19:39:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=MG4HiwRAfo4nKnx8mRL+C2bMS7+F3i5QnNn
	cb03Lprk=; b=X1C29SI3DG6AfSyUc8eSWJxCrwOq2ijIiIAOi7yP/sIV0wxQRLJ
	Je6fTeLxeCvSjbhHLkNcKsgWh5BIZdhqwP3qU786gzDoJV6JePIXWh9OVoNy4a2/
	ufvxlGxt3rep4+tkpbTbkhmFXSvfcQxSsPzd/GJgclnCFLjV/Za1+9n5MhA6aqFf
	vdimDCUC0rMClMq7T79QAK9K8DYkF0aE2aJGFRY3vy4k5GQv6iG5iH0Jg7KIfrbh
	2nlcxZL7cjQIisnxiBC9OyJyXknJQqy6ZdjdYmBaKrodmSiFs7q0Ex6D4uabd8sL
	uhHtnjHqnJuL7cfjcGFuHih58gKkySiQgqw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbqhmsn6p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Sat, 29 Aug 2026 19:39:18 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-52ce64c41efso48967631cf.3
        for <linux-mediatek@lists.infradead.org>; Sat, 29 Aug 2026 12:39:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788032357; x=1788637157; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MG4HiwRAfo4nKnx8mRL+C2bMS7+F3i5QnNncb03Lprk=;
        b=GRF8XJT6e8QZXbpcZ+rM1P+kCOBEZukC6/eoF2lw3Is0dgWrJ55/xH2uYuefbMQEmC
         WjdPvgd1KSOZYRoFAMMwp4EMZCIM/tXexw/Yw6PMpiy0quGBrXnpdW6+pFMYxmyH8PkP
         O8p3DQqyTKxIB0jg8/LakyWJDL/bzyQV7oo6z9GFvDv2X7baYlEDdnd4tqyMfeGqmVhv
         Ac7nQcivPDmfMBL6+8njDLqb4YMEJ7XSnj9mZfM8LEoxBrvXZIZG1yOKQp4MqNdMlOcH
         IaodwoGGohiJGy0nKXLo2PKEuQISFEcNPZ1cPFVjc6zp5sYFP4baQ1TWassXxEMoTNr9
         nFdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788032357; x=1788637157;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MG4HiwRAfo4nKnx8mRL+C2bMS7+F3i5QnNncb03Lprk=;
        b=ekNiV1x2/SNE8E2rQNRhXq0y++6WwtNp6zKfU14SpUt3JaOBH8qRzQt6wY/u93Kixy
         xYl3u/vOY3kRCWITmv23zfRdp/CWDrNQmuM9Ld4CiIwOgVHGUuNSNEWfqWS9FbwIxeZG
         yfhzeyapRJRgzh0m6hZ6THrV5jhEHXH754u8+qUyeHjtvmMPqKlQ69AD2Rn+zv11F4M8
         5hk9Z3Ifu/FLQWIyaTDSMR+TMdq89M4G8vbAUrbKUh1jgxvbV0DXy2Nd7Z6UuFu0DOzE
         Tg1FjIIkgPhaOv/tL1YOJ8sehjdr/63UzaLO2BdJvchO5L4RNsBLiaB3ZxnT75O2BWHY
         gA1Q==
X-Forwarded-Encrypted: i=1; AHgh+RrbHtkZfGeNbN+sResNx46QE2exki71wospa+qz0VFpS8z75lu0ukpcLGju1hx5V+A3We9rccowYubOcEAjxw==@lists.infradead.org
X-Gm-Message-State: AFuF++lAyMaYbHsO0Fzzyeo4i3yr6l9BrdPFUqliaDHTNFFy56kIfR8C
	ajasBC0zmOoHUAoQWSV42JsdSeDPB5ydKME6WHzKz2q1lL/Ifi81VLCyyZJILcOpgmR7eOLqL4H
	1XnVW3ssI8hDDGJEI/NA1wyVAq8f9zhhHcH2QRmVeT5dmizYXPYaT3WHSl6WmSvMs4wQYZRSLqv
	4=
X-Gm-Gg: AR+sD10hpRiOpyIYNTOP+dDHMzn5u/+/VB90pNU1fvMzVt+n/ocpOuDka4TjwHoVk+u
	2QfryAT1QR4zNuEp/dLNP9vE5eXOreDn6MIWYPjVzr5MZRBo0DCFLN9unsHu5DmbdXEqWqEjwfa
	+oaXEOlJFmyyb0os0gaVVc0BH2Fan5vUSHRaFAVLXj8ThyZ14H0h/Dndv+sF4soBExgJF/Cb2i3
	ogO73mYP/x5+5W4lFTuAKQY+7didIPfRc20AvL5FfweUVSeG1jOkr8g/7sR1+WKD7tLn/06DG4R
	pIuM7ZIoIP0htfKzvSspkdJ4/9GlFg5sIG8dsNSu6aGhsSFp4wrvuZWUtyT7dRzm/7OEkBkA7YC
	Q/cVJK56i47twkGk=
X-Received: by 2002:a05:622a:e490:20b0:52f:bdbf:4086 with SMTP id d75a77b69052e-52fbdbf4745mr111562511cf.23.1788032357485;
        Sat, 29 Aug 2026 12:39:17 -0700 (PDT)
X-Received: by 2002:a05:622a:e490:20b0:52f:bdbf:4086 with SMTP id d75a77b69052e-52fbdbf4745mr111562341cf.23.1788032357099;
        Sat, 29 Aug 2026 12:39:17 -0700 (PDT)
Received: from quoll ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b497fa9c5sm221100935e9.4.2026.08.29.12.39.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 12:39:16 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] arm64: dts: mediatek: mt8173: Replace spaces indentation with tabs
Date: Sat, 29 Aug 2026 21:39:11 +0200
Message-ID: <20260829193910.107418-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=984; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=sTguRb7ZzQpQAAqmHNbVH8fJafv+ZQqtpDncDKi8RyU=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqkzVemZt0DvfAr/vLICEjLQkCnCMztHioVx/9D
 6bi+sDnTy2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCapM1XgAKCRDBN2bmhouD
 14q3D/9+DYXiJdw8FRE5dDuxkc+cX29OgqezepRXiMivbAtVx0PhwCEgsithchxNRzjNurDPlIX
 ZxnP1FbvRxgSicU31k0Dg5+89go3KWez7OSCawgQVGEId+rF8EkaTZbmncUc5IWRjpVfhjNQAuQ
 uduXLoc7n+e/ZxjkafituTQ1ZiGfXGLtWVLJp9WFx47H+Di4WruoJJLpzOS7GQc0H2vwaGm/9BL
 yoa67EC6v5v45Ko09MBS88o2EsnIh96rBNqezvcc9n9Xsy36WdMz2DmJcw3NxvziKvRuzpM9ljb
 l96/m48UzWE5n8wOxCZEbuu9VDdriLXeRNaHVDEbIOzRAwgGl7W0PxGJE3r7JUmj+I76Oqqf/5/
 d0kenyrmvc72sifpwgB+VtDKEWkluiJMyH+zm8U0ubX10u/QlT93uU+FXvSvcGyGxEcwpnBxiAY
 VrgEefSGBnptWz1TX7QzvPBvwTsmd/UoQpu4+9I950ejJzjs4E+lOCu4YlmPqWEGjXmUnMiLCkW
 yQW250nEWL02FWJu8t9fxDpIyxLSERkYopITxl6NJXw2+nGVzBBb99QdSplvjNHShIaVmQ2FdeJ
 IUwqF+Deb32gC8p7P1WCp1wdq2n7AJkSin21gMk46+jLVZH6TO3KxoTkqcInsTrjxJF/5fKWCOK iKJcSuZjOE8v2SA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI5MDE3MCBTYWx0ZWRfX4fQi05AM6myk
 Uit7E8kqAePHCaohbUvVpHd8em/g/JUSw4HB4VBrsn/4yw6bdXm6zxKkoKOC6Y2OoNa7h4YAnea
 vfdoRe9UegzeWdAymvKSpCo8mjszhsMSb6ojwoXWjdCkKzPcYOAsS3jOuWsnBslLX7GcqzUbIs2
 Luy0o9jfCPPHbqGJQtbbTt4rt4peqrMeeeICW01vNHCOfgJU9Ix0vu5T+lca+2a4xENQL87AHXF
 GIb3A9l/JQHgQs7N7YjAYIs/dmKgWJ4Urp6w9buj5C7/LAw4VE8MlSt0DMP+AcmToiCEYv6gtBT
 cTMR3a2oe4jTxtlFXlt2tB5AWM4CoJhYR/vVwqJXcLaItDhPZEqLiWCTA0YW03YsFeuvorGh+im
 8IGJjIl34nhIqnIGWNhd5Z0jAyNFPbkCf1XTwC9YY/388medUuseu3lzrCENaQMLURRBjRyIw8u
 hZjPTPtKRUo7l8neO1g==
X-Proofpoint-ORIG-GUID: oHMXPtB8hB_bxVetGbMZw8iY0nsIyLoW
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI5MDE3MCBTYWx0ZWRfX21TCAr5tYedR
 Ei3FFlXsl9S8xx+vbsq+he9GBh6df+yvk5rhtBBye2CiVgp3kvz6T7EKKvLGEi0Lx5bbi1gzUgg
 S+Cdu3Vbdrb6+YEPjZA2cQ/lFSn7slg=
X-Proofpoint-GUID: oHMXPtB8hB_bxVetGbMZw8iY0nsIyLoW
X-Authority-Analysis: v=2.4 cv=bpl8wkai c=1 sm=1 tr=0 ts=6a933566 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=JjGN2f0IYHD0VWcqIQwA:9 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-29_05,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 suspectscore=0 bulkscore=0 impostorscore=0
 adultscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608290170
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260829_123919_440259_CEA8BE82 
X-CRM114-Status: GOOD (  13.14  )
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

Replace excessive spaces for aligning indentation into tabs.  This will
be reported by dt-style-check ("[mixed-indent-chars] too many space
characters in indent (more than 7)").

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/mediatek/mt8173.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
index 8346f0207134..d1faf84b431b 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
@@ -1291,7 +1291,7 @@ mutex: mutex@14020000 {
 			clocks = <&mmsys CLK_MM_MUTEX_32K>;
 			mediatek,gce-client-reg = <&gce SUBSYS_1402XXXX 0 0x1000>;
 			mediatek,gce-events = <CMDQ_EVENT_MUTEX0_STREAM_EOF>,
-                                              <CMDQ_EVENT_MUTEX1_STREAM_EOF>;
+					      <CMDQ_EVENT_MUTEX1_STREAM_EOF>;
 		};
 
 		larb0: larb@14021000 {
-- 
2.53.0


