Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D230C43458
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Jul 2026 10:19:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fQ2GFA5H86orDwNKMXkzV5nogt+smM0zeKlkT6MOaUU=; b=lkP2+PeJjpExbSXhHUR5zXZlSf
	4Dni2o0zufzxRPDIDceEyvrQtcsZ0yKgyUYF8TaVuo7jaMhfJ/Z5MmEOXtF1PLBeHWvOJdstu3nNo
	KAc8I1/Kvw0qhir8lpjqo23nGDX8ACP1l6vobIwCoXzUuQi52d44MyaVI2rHStI2GHSJCJFHqN5cj
	eDNRKjgxviRSSqFXIM/V2rKn/z2PAhLtc0OvhPmVbQ/M0LtHHCx3Ht8AW8Nichj87D4rY2F6FXbip
	lVfRVyv7TIDhmRVE3gZmwkd5Q8jwZpcdDZInEInaW60NYZe6ovvaBpGfRYhAbR/TVf5P/prDV8J1D
	b9QdMKLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wggPs-0000000CBMr-0goD;
	Mon, 06 Jul 2026 10:19:08 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wggPg-0000000CBFW-3Zsx
	for linux-mediatek@lists.infradead.org;
	Mon, 06 Jul 2026 10:19:03 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666A3KfT121508
	for <linux-mediatek@lists.infradead.org>; Mon, 6 Jul 2026 10:18:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=fQ2GFA5H86orDwNKMXkzV5nogt+smM0zeKl
	kT6MOaUU=; b=V9rMRWYcMcbqH+HkNJQnTwp7b4MIoOcJFOk8xJoe/jil3p2ww24
	4Ptl/tjYeblfnrd74NllchoEut1UN8jqK2VNZYrKMejweZ7UcbSW9/SvJ3aZ3f18
	Lz1EUapryrl3z4KX1ILGEud4U5NN7k8eIoL5MW6t3/GDGc5O6KefE34Fcd6V35Z6
	Ypr6F7JgOYvtL+OnZtXx9c21b4e6va0Nwg7oyNyukHLdXBbsYwrzRa8wVN2h+fHL
	M1SOtnvVFPiIJL8CxwyrZKK7CiCL1w1gm3Diy+l1Dzl2mMdEIzBoXOaR0E+C+Jvt
	GdVmHBmn8fTPB2vnRE3MgkW0WhXzLssXf6A==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8a98g217-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Mon, 06 Jul 2026 10:18:56 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8f113592bf3so55627646d6.2
        for <linux-mediatek@lists.infradead.org>; Mon, 06 Jul 2026 03:18:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783333135; x=1783937935; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fQ2GFA5H86orDwNKMXkzV5nogt+smM0zeKlkT6MOaUU=;
        b=FSwV0KSTzO7Vg8zw+OMHpKY1PSZpsLoCCPiFt2ZRcXiZ4COlO2bod8AHcQaKf4KAOX
         tBrMM3r/5oR/VkNbqYUY0v82FWsMFqv7WlxMEPSPIm9/ZZq1pLH53V6ibHK5skLlMuKH
         rutewhGSH9rFwD+am7USc4qiEIhamy63zc5uZ1S+koOAC1VFDhyIBGJbpawjc11BsTN9
         YyDm0RQjeG8R8TH1LBv5MZwtEE7CxUtMTanH+knuY71UADCtqrsML3ZJBMfDHVfZ3vWp
         RomzgYtSGQNiNkbzoSGs8jwq8SLeAFdgcDtZ+2GBTm9rz9KL0X+6i1snU02mkK/C5aYN
         2dcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783333135; x=1783937935;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fQ2GFA5H86orDwNKMXkzV5nogt+smM0zeKlkT6MOaUU=;
        b=K5aWuIpbdntekYlFkVrSRgVzlEQt48ejMemzJI8bVgkDJtggZHydiZM4gqMAPMldp1
         fpuMHlTwSd4q8i7RyyR8FrWjVpYoXYXwU04+q8huzEenYqN0DT3VjJ8ZfQm4qymiZ32B
         cAaoF722BTfYjGb0wqhf9/hY5iqsZ7Ij3S143OSy1hlpgKSWgVxtjOHCw4k2k0xlO6Lw
         Z6CEnf8owdMLp0TqqHfsgA+eyas1msrWpuxPCtGbgFf1VL2EXhDIksvrH81iiw4USaU3
         j5K+DBbo2cTCReyrpU/wn4h8xGaQAhF+p8gx3JTWngkRma9lEvSt4Yxwpn3iaT65Uw8Q
         IyMw==
X-Forwarded-Encrypted: i=1; AHgh+RrTvCrlCydBt4dURwC1cteRyTA5iLfAPta5rOqXxL4zQhygK8vbgB1K2HMvE0rEeAAVlCT9TIP/GkSQdSgZKA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxlMFNtT7GyiAIl9YVgrWf8LvEmK6m8FEkLyLyQLnc6KtxjW1pK
	yocEGrM3GIbuFbcK1nRcW51Ajkgye0rZogrGZ74TtIHN2Hx3tbXr2Cmd0aK/U2awaEigvfcF+cN
	t5FRtevbB0RzfYCKoXv74RK6oZ72QrgU3jYCzaWZlM9J4+t2r4Mr+2itkNA/yYknyr0aGkEJVF3
	k=
X-Gm-Gg: AfdE7cnOpt6RycYf3GuEtNi0OjES6DtNPNDJOX6bP98quLlyPAKvswFEG2bxJ9TE+PQ
	f6E17TFgvM/W6YBmn8T/PUBOjc9GytNaQ8eZ6AVbeLaJXnL4CHpGQXuKaSgW5XUQU02ia8zpLDq
	2bLhDUYWFUVuZ/mm2Aa6eCCVv6kb8Kvpe0sjROG5yz34/YokNlE0hzm6zxC+0Rp+9F2U2BFBm4E
	Xb9gCv0KozfY3b4rRwot3okYsWiKs9hwyg5InUvFEUneG8mgkLKsVpvmhfsy5gusgmVz9HwJwy5
	iGNlR7Oi9+1QGGeMrGT9hWUrISKf5WhuJ8J2GQCZeFE7bsGpeWCpHFHkGKLmMjPO/ZJFt8um505
	dNm/6gWUvU5QOUSfNoOFdvR4VJ+w=
X-Received: by 2002:a05:620a:a716:b0:92e:9b26:a6a3 with SMTP id af79cd13be357-92e9b26a79cmr1281415185a.49.1783333135418;
        Mon, 06 Jul 2026 03:18:55 -0700 (PDT)
X-Received: by 2002:a05:620a:a716:b0:92e:9b26:a6a3 with SMTP id af79cd13be357-92e9b26a79cmr1281412985a.49.1783333135008;
        Mon, 06 Jul 2026 03:18:55 -0700 (PDT)
Received: from quoll ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa039ae4fsm24346278f8f.18.2026.07.06.03.18.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 03:18:54 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] ARM: dts: mediatek: mt8127: Correct indentation
Date: Mon,  6 Jul 2026 12:18:51 +0200
Message-ID: <20260706101850.341418-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=800; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=rzcrfrWML2BJ0gMsXtqo1FhFnO4Eq87xgKLk2Ue4Dwg=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqS4EKPXfF4cSZKIyPI4Wt9GH830e6lFwLMhVX4
 6zacyVv1zyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCakuBCgAKCRDBN2bmhouD
 18MqD/9JXuzO5R2siOtzFdqAIN7aZe7fxoM9vJFYVLpPbetTusw4uV4kFaRJzus7ny/Ap/PbaIF
 m0obUJn2cutl5muritFapFA/AJrhllMhiqjPqa3uyDLz6lJ/gqwlxcNR6+d4pgNN+N+6Tozhv2M
 hEO3MFdliaca3XuzT845zY/W3FI2OAz2z/fj052/0DAY+AizmTcqMzakTaYbu69oTp3t0iyDG98
 aAXWnHHEq589hUbgqL74ttJsG2QhqGbNwpwvsgT0HaEyNp3S+ue4kq8r9f7V9BtqQkr4MXktJ5L
 1fWFXjEOXNaITrACWrh2oDSeMLWRWyvd6eGA2aT0J+6XgYSKAtgY3cUqOSpfy7wUZpo0Xy/+8AR
 iuWGR9PtGy+OQtBgLBtp6+y1oqBlqQhnN/72jdVIkMHRXdbUK17VJLeiZIJk7c3eS0GAeZBXTA5
 a/4MXtr+SiZHQmL+QJe2YE8Xu39se/3igEQEw+GzRiICV6dWCFpAK/TbzTCN9RHUmdy1c4MftME
 uo3I6jbkqid4vEytvsvuC6AoxfyPWfqekyALgL52LSgucn47FWKIMF5I10p0qpQCRl4Uzt39jYe
 pnX+GhJ6OakCia4A7tZK0mTA3ntMsHef5hiiDelYRrnZPiBhb/wFcwvfrdULOnXTW/wA3X9Kszk VlBMXavxoTrRHHw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=SpigLvO0 c=1 sm=1 tr=0 ts=6a4b8110 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=tLFoKwMCRvoQtr3NvW8A:9 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDEwNCBTYWx0ZWRfX0F/G9AKew7Kp
 onwEqjDl78fSkS0hycIJvIdCbNIIZNp591ex50ASIJGt31APagc8NO+E8Ot024oCpHjU/mBQ4SF
 vSfm7ze0+Rok16DUdA1Wb8P2YVNT4r52dyfEHGYVROFdj6h0b5RCfxNK2DevGMEnuPK5w/ve3TW
 6idAQZzsHegcIvEpoXE5Dg6xlzxGOF574DckuA87Yugb8b7nPJvEpgx+G+h5PMZ9iYcrzJkkTkE
 /iTSg4TScjJ8tFfl+ExcQz+tEbjKnd3rnpMqWRxQUwUdsBqt1qDR6RPliTR2HInviDtLjW1eR1N
 +ucwkfrzUmU9W09sP+5D4GCJtTLT8rydVAvm7sRx+NXM7cbM6haFDg3S1fOv2wmaVyAcQku6yMn
 toR7OXg6RP9MucL3zWs41ZkHbFk/5MxYtEdi3Wqx3INVjoI3qDFuf8eTwic7SfEMf2A1yJSQXai
 Ldjh6n1z7qvhCkKoeuA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDEwNCBTYWx0ZWRfX8C74+FLGTc9O
 Ph7F7Rj6H9P82bLw4o4fxyYRKBBadBZKx/G3lP8PHUFAIwNdb1iMJS/x4Bl16GTpRWOi0JRxCUC
 66wc+/8DPACPwWZXnYff9oPHNzxlsdY=
X-Proofpoint-GUID: amiiNDec8Cy79FXFlFqIqcDjZScgKDwz
X-Proofpoint-ORIG-GUID: amiiNDec8Cy79FXFlFqIqcDjZScgKDwz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 spamscore=0 clxscore=1015 phishscore=0
 bulkscore=0 adultscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060104
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_031856_900987_F59BA259 
X-CRM114-Status: GOOD (  13.43  )
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

Correct spaces or mix of tabs+spaces into proper tab-indented lines.
No functional impact (same DTB).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Ongoing bigger work for all bindings and DTS with built-in checker (dt-check-style).
---
 arch/arm/boot/dts/mediatek/mt8127.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/mediatek/mt8127.dtsi b/arch/arm/boot/dts/mediatek/mt8127.dtsi
index aced173c2a52..bd61ec7e70c0 100644
--- a/arch/arm/boot/dts/mediatek/mt8127.dtsi
+++ b/arch/arm/boot/dts/mediatek/mt8127.dtsi
@@ -75,7 +75,7 @@ uart_clk: dummy26m {
 			compatible = "fixed-clock";
 			clock-frequency = <26000000>;
 			#clock-cells = <0>;
-                };
+		};
 	};
 
 	timer {
-- 
2.53.0


