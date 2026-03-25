Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41BB3103A9AA
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Mar 2026 11:09:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1AfWKzTwtokdQrtj1TKAYLz/GFoKGs0JY+001MItkFQ=; b=1JEk2+gYQgaa7CMYSPzOH+p9Zo
	AHDkBfY1WAfPmvkA6fDhTddvP2D+WGfm/UDMrUQXNWXdppikRMzL77gRP31nBVESxs+HMDnZ4J/Xi
	ITu/MiA4ufMaUqQ/9FfljxQAN3SYkrI4EohhEozxN/QGJojB2brlzXF9ykO+yBliPqP29dg2QPHfg
	dsXZu5Bix1y0uGqMB0PQ198EGzhxkUGb+erMdALA9MVW7/oXgGbC0fszG6jtVpzXW/idvXocdsidj
	7YWa7NMoHowzOojN5HEzbZs5sEl9ppZbIs56NUuimLhDvr2dB3f0L9nQHOfHgibWYYRhuqVqcryMM
	6XjTTVbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5M6k-00000003Dh4-0Sgw;
	Wed, 25 Mar 2026 11:09:06 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5M6g-00000003Df9-2tEE
	for linux-mediatek@lists.infradead.org;
	Wed, 25 Mar 2026 11:09:03 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62PAl6T23110463
	for <linux-mediatek@lists.infradead.org>; Wed, 25 Mar 2026 11:09:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=1AfWKzTwtok
	dQrtj1TKAYLz/GFoKGs0JY+001MItkFQ=; b=SdnTDT3ctcNcmQk3ma/BCd5+BJU
	AAGXaCFMIAgsSSIvbePj2oeG5CQHxMwTfYEVW8waM28g+P5X+lgl8me0bMgDk+vf
	WkpWSWsPT3yhZPfsi1s6agEDUFI+5/gMFQwK+1jD/3GJG0efqzey0XwhT4ZQUDgH
	G0Tn8rOutM8pDZe00LhM/8L04QoIv5iL3VRR8V6xjgedV8+JN+zgCslQjjH4d8g5
	mBpQHAr75hwr6Q8qlk+8rz4WTd24HoQ+dUQXZkCGsWNGaO0xj/1mFFKcd3RqRXwH
	tq6DlCBk4rKzAFnvl8rdWtB9VejZpiqB56W6ygxBuvpjS5YIOS5RuVrEmyQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3vhvv4uu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Wed, 25 Mar 2026 11:09:02 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b4b81c632so86771901cf.1
        for <linux-mediatek@lists.infradead.org>; Wed, 25 Mar 2026 04:09:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774436941; x=1775041741; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1AfWKzTwtokdQrtj1TKAYLz/GFoKGs0JY+001MItkFQ=;
        b=AXQGiGpGusPr1NY2XxHwm0GbcMPWDDpR0uMiTLHVhtseN7wTRgUZPV0f5ksUYuQQiA
         5xYz3vEZWMKfsbZuX+PwTB9D5gnI4vBOXhFwIVzT5GO4LFkgW4iVysk6EpcOwWa9bumM
         CPAND12raplJA2fnQJbncfa29eMz3KHzFduDhuEwmkRgEdUvpbSH2g3bwVblO6EV+5T8
         a+HCZ6dLoGPHNnQc5yXPytUvxaEGQAy777JQE68pTEECu8IV6jF1DtWGlwr610KUW7k3
         ksZKP8KLkLuKZ+OJ9qurk2WWN1/Vy4FseE6mjzu8JoUStIdHZs5YkWFbPeU4ukMBs0mk
         bcKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774436941; x=1775041741;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1AfWKzTwtokdQrtj1TKAYLz/GFoKGs0JY+001MItkFQ=;
        b=G5rq0nMmtxAw0nSmSfoxU224Lq16iPbGpxZmX+Edub8Uh0aQAunJdK1hIwAWeeBmhv
         k1N5UFZLZKf3UlNR3SgbmwCHas1rZRKE906zoa4uoy9JWXQlBvW/MaiIHpMgy/Ix+qao
         d899R1asRijwas57MujlmUDjs3iaPgrRm61xxzAWYohcV7pwf+qQwQunyGgdMz8xrXAt
         +PhLWRBgoco003mYlgee5JH9/Jrz7CLWtmBRD7lcPe/ocYwQLJKn7EPhASXV4cLvevnQ
         lkHiHSigRWbhPSSI6fDfF6RYwpE2mi88KvGbBl0BeyhdoBO26GnaKGsQg8ymQ0qrAK9n
         ml0w==
X-Forwarded-Encrypted: i=1; AJvYcCV8sFZMOBhew0ELlenfU+zxni/ojR/FqePFp3YWwTf83vCfJDTAmbi/Cv6kqirTB7L/ZJvaLLeF6X273HEfHw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzNP/Vi1DsUcB6SPFa2JdXBdmH80uOJmOlRD2LHPnPfJBrWIfjV
	+QjFw68F8xNKgBqkiYls0sb/dYi4X9K0kZ1zYgEWWR5A7cC2vEQLYsbSlr9caartikzWN8kg+83
	PWukpcMaNsY11SxMN2JW88hVdOjUOobqqS0ySdt5VEtS2N6leCq11wC+fX9N8ciVBgV/j/7IeDm
	k=
X-Gm-Gg: ATEYQzyotNQevZWNyXqGnANynQdlQRv0hob3tZF68gv0mpXE4GbVa5Xs7M1ZmijvjHE
	dngXRjqrpeHTYYLNMnZn2hqFACx3XzxJxuZgGWHL6uPORmHTIabl2KJ+no0FSlUuXQgiVyDY9dT
	9KSNstKtbYKUymP0caH3g2j1zPxEHJeiFk5B8p9snT8pJSCW47Cx5VIuwk3Tc4BXhDII/gVakIH
	/LO1tN8IFJaVxA0OgsSebmfHPGhT7dT86URzk4PL9B38E+o5jQjCij+J4erXE8j9pLRKvSUVh0y
	YwnJ7BcxvJpIjqDfj0OsZniKEW58RxFIXNKhdvCdkLYT4wgZOQpY8cxtgw5S2s8/gSCF8dCjEHH
	e6sEVZmM8VSRE5Ht4RiG85pIe6T7dn+Rpzibo
X-Received: by 2002:a05:622a:41c6:b0:509:764:2efa with SMTP id d75a77b69052e-50b80e6a7d3mr29556301cf.59.1774436941351;
        Wed, 25 Mar 2026 04:09:01 -0700 (PDT)
X-Received: by 2002:a05:622a:41c6:b0:509:764:2efa with SMTP id d75a77b69052e-50b80e6a7d3mr29555851cf.59.1774436940763;
        Wed, 25 Mar 2026 04:09:00 -0700 (PDT)
Received: from quoll ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b644addfbsm47619447f8f.3.2026.03.25.04.08.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 04:08:59 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Kartik Agarwala <agarwala.kartik@gmail.com>,
        Maso Huang <maso.huang@mediatek.com>,
        Trevor Wu <trevor.wu@mediatek.com>, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 2/2] ASoC: dt-bindings: mediatek: Adjust style of blocks placement
Date: Wed, 25 Mar 2026 12:08:51 +0100
Message-ID: <20260325110849.127051-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260325110849.127051-3-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260325110849.127051-3-krzysztof.kozlowski@oss.qualcomm.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1603; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=wdkRrMQejqveISkL2MxzQ/V+fR3t7RIyzxSBQp7r+1w=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpw8JEXkxKeo16S0aSwyAQP21odbjBYOyBed8EY
 /h19F+MUMiJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCacPCRAAKCRDBN2bmhouD
 125vD/oD9fXoiFRcGa1yPFEthz/pVBn7++KkN8GbruINBqIbRX2H5ZSWD7m7hMqzWZiFRdm4Ebo
 My9Wgdv2M0Mubtm6RgMVDdaa9t2y9c+4n8Qz1q0B9KyNxwxBuQuBQYvdezYOHRDYXBSsCKeC7Xi
 qq5usz5cTNVfxKtVwnf85rpOClcYfTk7PxH4o+SxU3LePJdHF0KCTPlrGlx9hbb3Q/9lDArQWec
 qnanyJhBFCkRrTa2cHx6V1K8lhPjIMUk8yG9s/vq5chVpXR4kq1lmj2rk+Ht/GnwaA+qXfTnwkr
 7p0E0HZvC1/Qhmman/avtqrYPq/GxfcscilC3lRdoGGDH38YmIpv88Cj4hA2giLwdZzCbVd8U6M
 oSkyKv4QfC6CTwiKXes8tsm/0tvyaeynYqtQ+VKtqA5SEWPPdAtczvYBiwWL5zn8/efJ2oB9dqc
 hIjLglg2mTLHHhq63ykYm058FLWqAdAWSkkGu7jQJ0kRWRU5U4XV0l7F6MasgM26P8KNIXL2r33
 4/NzFv/cmQMalF3qKYPJrmEkrS5R8AYO9HW0Y561DZ6eo+tyHziEgr6HegIr2THB+1x9lAx8JF5
 n8HyTvh9ik5npRr2cEOFbCjAHiGARgyxFUqguGqB1X+4bQBwCCs/DhXSloC2xBm4KLfg6xd5enD 0mP0EzORS6NhEtA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDA3OSBTYWx0ZWRfX0/SfsPeaa2M/
 EZJqCd5F0k+7nM0ef50sxSU/INCnr8QD7kC50+zR1bw7lTd7Uf1fqBAy/zWiONH9aKAb5odsK9v
 2ZNvuqyxH0OFNxuaGwBaHZifVP/uCYScbLX5gK11X3ii3COuICxV41+uxGm/J6b+90b90Lhu9Ky
 P4/QXoBBhps+aeOQqi62E9keBM0WBUc2LcbItN2GhDH3RGhbgp7HIkpctQ8Ar9D2NpjR52V7hfO
 BYoh1Up9M0CqoeHUl/jWTSuHs/R0f8YTPoHLnO2CFzXuDDdF/6si0+NvTCs94RfeH/dZ6oGfU/N
 6mW8ADLBCIarwJkO5+ZnMuh8AlnvAb/zbSwTaJrUS4K8RqHSW8VyHJNpGs5OyYV6W09tN4SItD6
 XTw3K1EFEHEt3pMjHmiEkyt0+kZxhQ1Oq8XRDc9x2iyX2GxwjCwxl+uHlCer799EZBuj35Y4T6J
 P0RiXx802pcm9P5DVeA==
X-Authority-Analysis: v=2.4 cv=P5M3RyAu c=1 sm=1 tr=0 ts=69c3c24e cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=tdU0VRo1b7d2wqM4LDkA:9 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: eXaOtF1hEpgBvJE6HWAKTiN-lFqaSJGl
X-Proofpoint-GUID: eXaOtF1hEpgBvJE6HWAKTiN-lFqaSJGl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_03,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603250079
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_040902_730826_751CD8F4 
X-CRM114-Status: GOOD (  13.30  )
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

Convention expressed in example-schema.yaml is to place
"unevaluatedProperties" part just before example.  No functional change.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../devicetree/bindings/sound/mediatek,mt7986-wm8960.yaml     | 4 ++--
 .../devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml     | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/mediatek,mt7986-wm8960.yaml b/Documentation/devicetree/bindings/sound/mediatek,mt7986-wm8960.yaml
index 09247ceea3f7..f21cad4bae15 100644
--- a/Documentation/devicetree/bindings/sound/mediatek,mt7986-wm8960.yaml
+++ b/Documentation/devicetree/bindings/sound/mediatek,mt7986-wm8960.yaml
@@ -36,14 +36,14 @@ properties:
     required:
       - sound-dai
 
-unevaluatedProperties: false
-
 required:
   - compatible
   - audio-routing
   - platform
   - codec
 
+unevaluatedProperties: false
+
 examples:
   - |
     sound {
diff --git a/Documentation/devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml b/Documentation/devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml
index 7ba2ea2dfa0b..539de75eb20d 100644
--- a/Documentation/devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml
+++ b/Documentation/devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml
@@ -105,12 +105,12 @@ patternProperties:
     required:
       - link-name
 
-unevaluatedProperties: false
-
 required:
   - compatible
   - mediatek,platform
 
+unevaluatedProperties: false
+
 examples:
   - |
     sound {
-- 
2.51.0


