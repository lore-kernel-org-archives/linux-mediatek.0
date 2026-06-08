Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22C6FCD8CA8
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Jun 2026 20:44:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=JZcc6TPeUx/2ww8Z8bbTx4r6S+aoLRf/jpoC61OzVbc=; b=p3urMkvIey79hb
	BpWcRTbOnDJj5adWjoFVH2J8qK/5eck9MdScZZZczMp5K7JsZCjHGA+WnZrHWAmXuCN4nYExb4b8A
	Uh2gZHopdL09i705Qmsa7/ntnbPSMFLFeWkV8sWMZCxJkwnBsM28LAYSwIxd91YFVrF72A0Fu7nTP
	uYGk0OCrX5lKKD5pvqaujVLuSbuZAtVFtHnYlxrTt4aRoCehaeQlsavyprF7GQ/vCW75Evg/SYI+T
	FphphdzBd4PivpWGrUKL6zEBgwArNO5tDZyYmc7fYQOpwYtJgsjcLBwV8mHr63wS6/m7aWVvbFUHR
	oak1C7A9YYPQEQ0ZqnjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWgpv-00000004NHu-05WF;
	Mon, 08 Jun 2026 20:44:43 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWgpq-00000004NEx-25D8
	for linux-mediatek@lists.infradead.org;
	Mon, 08 Jun 2026 20:44:41 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 658Ix7BJ314991
	for <linux-mediatek@lists.infradead.org>; Mon, 8 Jun 2026 20:44:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=JZcc6TPeUx/2ww8Z8bbTx4
	r6S+aoLRf/jpoC61OzVbc=; b=MGT7HmAOHcVdj0yATV7HMAwbU5uk4J313+T5nm
	84kICFmcHfToU9Lqm9Zj1W8my/y4+rF2I1dGopuun62rFv8Fw2trVIkKDB3yKySW
	qydpBOtZnfMRszANz62Pt50+mwOEp0Ujx4Zp18DgPJCVsRwORM4Er5MujfDwelpy
	ptJDMUpbk/tCmC6s1na0lS+aQUhoepuuYyFJBT0tP7qg8AZABd46rd0j/jD4sGWe
	Pih62qqCqyu29l++9QOUW7MKDU7kcjJF5AxMJXi8jD4J37DBGonSUMg6w0aopY6s
	ItlzeTEe2ujWvVOt4J54RBTMEjcYrpwJuSquw8sPHnljJNCg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4entr0k59q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Mon, 08 Jun 2026 20:44:37 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5174a23afcbso58696261cf.3
        for <linux-mediatek@lists.infradead.org>; Mon, 08 Jun 2026 13:44:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780951477; x=1781556277; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JZcc6TPeUx/2ww8Z8bbTx4r6S+aoLRf/jpoC61OzVbc=;
        b=DHpabBgWq1vgimyfWBJm5tXUsueHfHjMvTWRA5eICygaBK4KtIGrU0X8xxFWF9ew3r
         Zuln2eUxPHW3/dcQks6nsaZuvS5Qhc7c9vP/eLK2+dR4fJNG6B4PyruhLQtLMrk1sEO4
         NJst35ym74K45uT5r5zQywUtEdX+noZwoOcB3kzXP5GPt2WnGRN2irNmufMpOlYhWqbe
         twq83t6o44iWbmsXehv0k9mHVHmntuDmZQHkhz0JaYtbGw+N6fCfipzmK9fOhbZHpeFx
         sf2DOgqcYL1vj8Atph+h6Tx3DNG0ivEkv7fbgbYeU8n4b875AYpbpe/CSe1GJDh6ptdK
         kMLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780951477; x=1781556277;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JZcc6TPeUx/2ww8Z8bbTx4r6S+aoLRf/jpoC61OzVbc=;
        b=CALjNnULSMZaBZMK55KjJtFfuYYwVZ4IYwUohEXsDwec0u68kOXOPnm4MGDt9jW5RO
         ryRdfah403JfgSbUkH15FaTFyriG1d5JJF5mf5jdKet6TQH936V6lWb82JiED7Qz88Bi
         twl0l4aHIVzQ5pWveb77H5Ywh/yEKImo7/4dYkzg88G/bZUMWtq7TPtIp4YO6JLiTSe7
         Nq5yDjKtSOnf6R+fMDQVAukYo3hZb7q0Bma8ZxPnD7XFsdKCZBuCrWzS8zk86yOaEDPh
         IVpV/BawdwcJ6tW9dCNLBfR3H4IcYSdw8EgXfuiMQS5IavBii9C8CbO0F2e6xN0Vjrsn
         V1/A==
X-Forwarded-Encrypted: i=1; AFNElJ9AYZ4C8mF0utXw0hkzD8M4/16Afif5Mf5L8dnVruhk84U2CuzLbe0WHEiq2BheaplQyUfamt3ahFaTHGQw0A==@lists.infradead.org
X-Gm-Message-State: AOJu0YzZtTy/7NTApfV+/SP3fwLAQnRRBVA+9ff7QS+LJYEbsWl+1xZp
	69MnwOiUzn9xrHtqsalEiHrMrX0FQW+J3wm7Z1z02/yJlFYjHrQ3x2A7A8jlBGjC3Z7IIlffviF
	V6VTYqjoLsF9KVl7Y4D9PtxBraMx6adQ2ShZFvnUvXmuG57qxmMUlDxweL67h1QdhqM/wlsD9Bl
	M=
X-Gm-Gg: Acq92OHlevZ4TUFKDL8Q3IzX6lHifhEApry6GtgTzAUfrVX5DebAHaVJx3LG35LYT1l
	AHmFelv3N57hodYwNhYxTGkc7HtZakVLQUE8IF8+FTQC2ij7pYYOF3vM2/IscLO0Ci7rYfIqPmD
	Z4GpYQXV/7ZLs7cC4LQHka7/8rXh5d/u1d395cW89Qjob2Q23C8rZNZXevZfiRnjjj/0bn74o7X
	LWraRxPsXxpgMwvElQlvhTmBn0bnO3Wdklcj+EzXt5t14llu9jCLlr/LHlu44YIEcOfNsVKm/cy
	l3djHoS4B6FvUn907joLV2lZMzRB/ZoYRxQU0CeJ1/1W1Ze/eBag3KdIkqy2LHt82HUOG0APcC3
	lr8kVliz+MOJvCJNshX7bygxQMm1l8BjC/zkIa29HVOX8LFLhVsQYQmM=
X-Received: by 2002:a05:622a:1f90:b0:517:75d8:b95d with SMTP id d75a77b69052e-51795c0cf7bmr247057431cf.40.1780951476672;
        Mon, 08 Jun 2026 13:44:36 -0700 (PDT)
X-Received: by 2002:a05:622a:1f90:b0:517:75d8:b95d with SMTP id d75a77b69052e-51795c0cf7bmr247056621cf.40.1780951475888;
        Mon, 08 Jun 2026 13:44:35 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4602cda3651sm44018439f8f.32.2026.06.08.13.44.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 13:44:35 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v3 0/3] dt-bindings: mfd: syscon: Tighten checks
Date: Mon, 08 Jun 2026 22:44:23 +0200
Message-Id: <20260608-n-dt-bindings-simple-bus-syscon-v3-0-4eba9ec1212a@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/42OwQqDMBBEf0Vy7soSRbSn/kfxoMmqWzSxrkpF/
 PdG+wO9DPNgmJldCU1Mou7RriZaWdi7AMktUqarXEvANrDSqDPMMAcHdoaanWXXCggPY09QL8F
 uYrwDSgrbpJhXqK0KLeNEDX+uhWf5Y1nqF5n5rD0THcvsp+26sOoz9//aqgEBNSaUGZ0W1jy8S
 Pxeqt74YYiDqPI4ji9iGIV15wAAAA==
X-Change-ID: 20260608-n-dt-bindings-simple-bus-syscon-e39df408a02d
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Jacky Huang <ychuang3@nuvoton.com>,
        Shan-Chun Hung <schung@nuvoton.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>, Heiko Stuebner <heiko@sntech.de>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Andreas Kemnade <andreas@kemnade.info>,
        Kevin Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>,
        Tony Lindgren <tony@atomide.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-renesas-soc@vger.kernel.org,
        linux-rockchip@lists.infradead.org, linux-omap@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1955;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=5Xa72kw9Ltgd7CByB7B5latAUb0JYhrgHD01OqlPHas=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqJymqXzctnjCZTlgfqtTkKkReZfSxm69dcth3s
 +3KPVCaK/qJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaicpqgAKCRDBN2bmhouD
 12o+D/9dEqmiBDrunvPNTigrYZ65joY0Y404B5kMuUHwxnjcIcSDy0bYTIMZus92hnmDEYvpC9U
 i2tw9EoYNrO1EeZYBOWcj+FJKTG5wLwU8EqAG5w3fIa2zQ5rVTe+zDoNtqRzLgckMUTIEZVoWSl
 xx/h49ZbzgXV9CJzte6U0Fp3ycwf0J/HUsNBQqNpdja+HyIoWu5Qd4HWIFShKkueEUH8KcNSwnJ
 1TC2Rn4T9MbSDCBS/0klhPlGPyYvR1WG42P3wjHdLDH8pUHPHYBBPrRNq85x/OK1BKmigWgYkam
 7ZIy5F0wlV+4bECVkaIfnFpsg2p78TeS9WWPQgGmIdmfb0GPbMkK9PkDozcrjmLEJk/QRny2IS2
 79lvO18dQiOU738h5JoKCuWKzvLCoBtiw627Gbqo21BHDrLWo8oF3ZWR3kXm5RUPVnRTQ8EVr7x
 F07R0Zx2p4W1tYV4zFk1IV+3EbHBSbfAJQle3zzH24lTJr8rOPXXbnu+2F2CbirwcO++zy7xoTb
 dXOxD+QhaGr6V/LYklyLnTx9IdHl0LJsEnzLdfpfUal5h6SuMSxFInElOpARadLe8wgkHeegyap
 mybKDxrB8IWZUlFjKaqVHhruAjaUBKUEjuTpgmBT44Z5ACshQzaraQj4ifeRN4qFcde73irdf/H
 QC7QfMmQpvt0MRg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDE4OCBTYWx0ZWRfX27SHFH1cX1aO
 Z54eDNhWyLhcLQ2hXgBcCEwRyjchMj3wV3cjiLP3R0DnQADsYpCS7kUE9xruC8G3GsEknRfX3Jb
 IuqeYu1P2x586+ElwY6EnlJl3NCCv8zzKSmYWxO1eui3y+wZjqAxkl/1k7lNKiO82pNR9j55OFK
 +PQHwLohfkZJFUw6NGL1Qo++CZvv2D0ng12aOClt8lqoGaVjKpT1qr45MdM5gFAsnD5ClIj2a3d
 RsB/typOYKPH4TMgcz/MTukjPMFYvCioXKGvcBYdydNyVdq6laJfhWy17wN9bsoL/Vp5IU29kf0
 xFeyBNM9B/y94CJale7cK/LSF+NmDtoO4Gp1HUGm0ssaUnbeYM6GNN/DnXR+lUT13vVAGNmQGY7
 snKZde1+vgluG4w/k7J8jS8sQIRYWzPF2g4s5UqwPq7Xh8uWjK1tuAv59Y3Gfr0FvUEoR7M7xSE
 WI8NUWhgE1DR24VKLbw==
X-Proofpoint-ORIG-GUID: Cu-6OPR2dpZ-So3xQR55N9udhXc5ARxW
X-Proofpoint-GUID: Cu-6OPR2dpZ-So3xQR55N9udhXc5ARxW
X-Authority-Analysis: v=2.4 cv=VowTxe2n c=1 sm=1 tr=0 ts=6a2729b5 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=s4keiGDSzyMyFUzW_nEA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_05,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 suspectscore=0 bulkscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606080188
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_134438_659288_CA68AE9B 
X-CRM114-Status: GOOD (  11.73  )
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

Changes in v3:
- Drop patch #2:
  dt-bindings: mfd: syscon: Drop unneeded case for syscon + simple-mfd
- Bump dtschema requirement
- Link to v2: https://patch.msgid.link/20260608-n-dt-bindings-simple-bus-syscon-v2-0-0203e6c249dc@oss.qualcomm.com

Changes in v2:
1. New patches #2 and #3
1. Add missing part of patch #1, thus not adding Rob's Ack.
https://lore.kernel.org/all/20260531110404.12768-3-krzysztof.kozlowski@oss.qualcomm.com/

I tested dt_binding_check and dtbs_check for arm, arm64 and riscv and I
think I did not introduce new dtbs_check warnings. Old code anyway has
multiple abuses of syscon, thus tricky to judge for arm at least.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (3):
      dt-bindings: mfd: syscon: Disallow simple-bus with syscon
      dt-bindings: mfd: syscon: Drop custom select for older dtschema
      ARM: dts: ti: Add specific compatibles for SCM conf nodes

 Documentation/devicetree/bindings/Makefile         |   2 +-
 .../devicetree/bindings/mfd/syscon-common.yaml     |  34 ++++++
 Documentation/devicetree/bindings/mfd/syscon.yaml  | 116 ---------------------
 arch/arm/boot/dts/ti/omap/am33xx-l4.dtsi           |   2 +-
 arch/arm/boot/dts/ti/omap/am437x-l4.dtsi           |   2 +-
 arch/arm/boot/dts/ti/omap/dm814x.dtsi              |   2 +-
 arch/arm/boot/dts/ti/omap/dm816x.dtsi              |   2 +-
 arch/arm/boot/dts/ti/omap/dra7-l4.dtsi             |   2 +-
 arch/arm/boot/dts/ti/omap/omap2430.dtsi            |   2 +-
 arch/arm/boot/dts/ti/omap/omap3.dtsi               |   2 +-
 arch/arm/boot/dts/ti/omap/omap4-l4.dtsi            |   2 +-
 arch/arm/boot/dts/ti/omap/omap5-l4.dtsi            |   6 +-
 12 files changed, 46 insertions(+), 128 deletions(-)
---
base-commit: 78f5e68a8d0a1123dd1b007688ccf0e6876a5c15
change-id: 20260608-n-dt-bindings-simple-bus-syscon-e39df408a02d

Best regards,
--  
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>


