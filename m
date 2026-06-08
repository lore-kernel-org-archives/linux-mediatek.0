Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94D6FCD8C9F
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Jun 2026 13:55:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z+q54AYUt4cvMAgQNkC220cQ0wa4ldXeQa80/giwooQ=; b=uduX3iHsTqc5hoReo1hcRoYq6T
	lrY+LkPDpCm5MzFrnMRrf3zYBzMnFw91T39Pmur5u+sodARK2JgFjb5PvAKt7RDVVJsdbMfuIFvqf
	UieakmByuQYZCYWcwOjMFQULzgdKAsUdSKOxayf66AdHYKTLTdmOqtxFLnrtc78f60aV2C3f/yEHc
	Cxs4jtOzFf9Yxdl3nO2om5+SQVF7Ttna0VY/AcJTYsE4KKQ6QSkP/unLjecA18mNyq3xg7132QGtZ
	KuEwaNSN8DIuO+Cmit8Zmer6bueNxIPqzFOyKAlJErd0VAleUNlGK4Vqp7ce83Aqrvl9xi8VnN3fb
	YcSBB6/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWaRa-00000003fPl-3I4y;
	Mon, 08 Jun 2026 13:55:10 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWaRX-00000003fKC-3zeq
	for linux-mediatek@lists.infradead.org;
	Mon, 08 Jun 2026 13:55:09 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 658DRIJE3758673
	for <linux-mediatek@lists.infradead.org>; Mon, 8 Jun 2026 13:55:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	z+q54AYUt4cvMAgQNkC220cQ0wa4ldXeQa80/giwooQ=; b=HdTMgbz2z5FgTqoL
	IfF56+idyL8eAcP8L6hXXn36m1WesYiTSoIIV33hhmXCc7Hlv1ZtLGhUk7EtnFKK
	H34ZGU4hXYs3zmFWAtfKObOliuNBwwkYNfeGJZeoT/R9R1e0V7bI6cq/EOHg/xi/
	/vmzCmOjypKO/DzYmTY58o+tbGsjMzZoxoFPGl2J4QlPpGNPrZGHLtMk2aBFErBN
	vBFTx4Lt0dGiAaBzc6xFt0nL833sR5dFPz0KghgP3N9zsn3ozbkqAFOx1+2n/aP9
	B1Y0vl/COLI0LN9Ep3/qH+i8pStCLeENyWIwSGd7OiBcmULPTnmnlTIU3EAhfTOB
	5y1fOQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4entr0ha1a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Mon, 08 Jun 2026 13:55:06 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5176d5d7222so82901061cf.0
        for <linux-mediatek@lists.infradead.org>; Mon, 08 Jun 2026 06:55:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780926906; x=1781531706; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z+q54AYUt4cvMAgQNkC220cQ0wa4ldXeQa80/giwooQ=;
        b=UlOo7BfnYYZP4E+xYVYD7ccbJGUM6knHm059lYA+hbX+hzzr7BBSca7159YlX9VxyS
         T111D168XjaeyT9N/CyYN3Jij0PErO5PMuvOrVQ/l+nYRRedYwIGg5i3KLh/lyfpH6xQ
         286fE/SUqko1z07aZsAcFuHZo8Fe/Gj4QRF3eUwVAL8j00JeT8wQx0V71ePqz8o2kBtR
         jstbYm20VGtdjsaNidXDhGTPp7ch2AmxJu56s1rkusn4bIrIihfETq76leQEO+Txoz5h
         rE7WiT3WEt/k+4nLXuiEoY9C7p9vucUxHmsyb2HQXX6gUjKLbocSaWl1fgoT4a9UKEBg
         E6Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780926906; x=1781531706;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=z+q54AYUt4cvMAgQNkC220cQ0wa4ldXeQa80/giwooQ=;
        b=ax1lzFNZ9Pb2XYIB5oCBA/504cWCFZWX797i6XnNQYmgdx+g0wFSZPwNlFJpQna/ki
         sSt9nOM81eWfZo8eK4ArLdvN8D+T0JDUYDXw9z6nu+Tw62d5kNyZbK/0f6sPhPzFgEku
         zDbhVkelF2Bt3frYIVOJ30AMIMnJOl8l809q+TKCAl5N6oqJEBGUxyNT9ZDkbLPcDpOd
         9ourxeZwk9UP4ETzxAa7qT3o6ZP+ZlcQCNFCAaXL4qbvU99gDyzbPM+x0TLukgzsRTS4
         DzNIGDMRzsKEtsK46aL/yDrfGQ83U+OG/6tj5cr+XxC2/NHY2CBHXKxH7EnjjqyOM0fi
         dyaw==
X-Forwarded-Encrypted: i=1; AFNElJ+LWy7t8u8xlIsI5PTgIvMQuhtMHU63xvdRcRcTQIR97n4kOc9PB74jKImjpCY9Y0CeFASBG33UgV0F0Dm+Jw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzZJkia3Ta5YdVAMLDk+xVLs9Tzz5x6wVbIYOnFE5/35BGEA5V4
	tG9COT7wTBY0G9hn4pdwqxRtIOaS/UQnqj5lM+QoPE0qzJRGdJVdn7I0rLJ+6JyH11QUiTV2rI+
	doVTtPd+rrSGUHyNwJ2rslx9L3YuXPhYW+3KBPtA7hBBN9F1IyfLhkPkELpt7lMvpR8OifTA02A
	g=
X-Gm-Gg: Acq92OGaulgv9fcHXAstqEevcBzcs1x18A1B/6xAsSQiO7IrFRq6q9pQBuFxIRwVVEW
	C3hjkr5AB7Uos+YbPWdzX7z03lsNaiY3Ji7m/ZCPzK+X7tllWIgpTnUpfhOqbvNR34sfRf5r3Ni
	ODUDHZNkp9bis3Xuhkj2Of7b6zu25FinVJ03xVCqCM14ZJfx3RvkI7sCaO9C3+mY7MB245ucl2k
	K35dINyJN7w5+NYgqsjzMJqHyMVFimuA0cjuqP0rifexf9L/rVM/m4m5glzFLo/ZYKu+/7YUgZ0
	+cJL60tOSyiMMUqXUVxihgPHjrNxMo1nR1B7Htk5UOKwUUJ/lqC52ZpXekcOwKkpodUeNGXPkcb
	ykeljTsMmcOuZk0bSAMuhMM5oC2U5UbaCVkoVeJigogyFuO5/iUtD3M8=
X-Received: by 2002:a05:622a:a593:b0:517:8d40:7c7d with SMTP id d75a77b69052e-51795bcc230mr212098401cf.29.1780926906334;
        Mon, 08 Jun 2026 06:55:06 -0700 (PDT)
X-Received: by 2002:a05:622a:a593:b0:517:8d40:7c7d with SMTP id d75a77b69052e-51795bcc230mr212097701cf.29.1780926905723;
        Mon, 08 Jun 2026 06:55:05 -0700 (PDT)
Received: from [127.0.1.1] ([213.55.209.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc39def5sm385972925e9.5.2026.06.08.06.55.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 06:55:04 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Mon, 08 Jun 2026 15:54:16 +0200
Subject: [PATCH v2 3/4] dt-bindings: mfd: syscon: Drop custom select for
 older dtschema
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260608-n-dt-bindings-simple-bus-syscon-v2-3-0203e6c249dc@oss.qualcomm.com>
References: <20260608-n-dt-bindings-simple-bus-syscon-v2-0-0203e6c249dc@oss.qualcomm.com>
In-Reply-To: <20260608-n-dt-bindings-simple-bus-syscon-v2-0-0203e6c249dc@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5410;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=NcitNjSkfQ4OyFqHaqu6E2atNqkTv+Y4lzGwlPttZho=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqJsmqbJ7tPK1z7PP4+30wTCt9SdFWwHN6Wg/IE
 0IMZKMvJXKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaibJqgAKCRDBN2bmhouD
 1xXiD/0bvAbsMwgDv/iH4GOjsfgkjcx7enoDg0cJsvLNFtBsZd4xhalxTE6gj4uWHVG+J3bMnDY
 /SuVoxEhMQKQSzDGj8dNgPWN3QvZNloqownDIyQ72QsFUyRDfneqMVNay3LZ6woDjSievDd1/k3
 4STlk1kmydDgVDcFZrgNl/tGsqrHHceTIzSM04tqPfWfwqMZ/EFfSCVuUAQGHTDYu0lpmt//Nbz
 yO+9k+ou4/Q1AhLWrk7Iy+JE9A9NPktJXArYdBZ2F2OoG7o+2/VNrsxzUe8/cD2sMnhv112NmKF
 TPBfMTpHN4dSEg31hysiwDat4nyJnm6QE6+4KcxOGYs8BC7UsnWIHYyTqdTrGchS0M3ZL3MefH9
 hczo4x1VTv5VauSXHhxYdsFlZQWljOy1QyoqYPNxsT5VedI4hsNtkRH9O6cUOmupz30R7dmlMs0
 HByZAmTh1qZoMpCIyPoYHEDIyuSeAJxG+9NyuwEI/eXF7+O9U24puo3V7hJ5s5i0Ssl1Wn0G4yt
 oFpCdCzNYW9B/zNdPq0CdBqEjId67pCGUXTpoHvatrv3/2pkB1jzjd7x/5/RdqgX/A6VLB9aFhN
 xT8WWq33fnRaaankrv6cL7orUBusK3e4Z6H2baOMbH1Su4jSwVwUhVkHIAYCBv6NEtBqdohMpLj
 i7QkXmR6twBaQsg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDEzMiBTYWx0ZWRfX8Tr8qtWeug0g
 izpvpaF45I4QB9/qWe81CxRx/51SPSmQiLK1w0H65aoJbJgSUn/QUmauh5PmLWXLtQtZXPQnJN+
 JVGvlf7lxyjN52JTI/Hvnnb5lQfiZAciuAC5JE8X3+gT8xbOM5w2PSXkwJyXbQQTsDzB9NUxG2+
 VAjKdvOiJT2UvIwSsMP+Nz/VrSj31X576VJFDgboxA67KF7PgIECyMqPvCXzzrirAK/JnpVSbr+
 BxXZAapEmCSXAZPdIH2wGkOWWZdgBFe7PGYLkwfE+aOhP/VaCGsdHRMPb+6vO+xnecwj6qN6my1
 osmPHW4AqyXIbeRFLtUTf/wVGzby3vI2Eq+hyP8BcgJyZE1g/SpXaHUSBJFJbrWy2kHIiTa6Yd/
 U5ZVr7SZ8zmPeo6N0tJzRC70iGaGwbTwxqzj02rKQMSZmjuS8i1Ep4Jk8bOOvZ3u3MJ7BvfLfNG
 xnWZYSAWr3GiqiQV2xQ==
X-Proofpoint-ORIG-GUID: Y9wgnnRYTHNS4w-crf_HEhNf7kO5avia
X-Proofpoint-GUID: Y9wgnnRYTHNS4w-crf_HEhNf7kO5avia
X-Authority-Analysis: v=2.4 cv=VowTxe2n c=1 sm=1 tr=0 ts=6a26c9ba cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=bD1TNsHgvEXzglPpcYW9rQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=ADPNn3lZBn-UiSoLXagA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_03,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 suspectscore=0 bulkscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606080132
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_065508_129195_E87FB8DA 
X-CRM114-Status: GOOD (  12.63  )
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

Older dtschema <2024.02 required custom select to avoid applying this
binding to anything having "syscon" compatible.  That's not the case
anymore and this additional select has two headaches:

1. Duplicates all the compatibles listed in the schema.

2. Is error-prone, because it requires contributor to add the compatible
   in two places, otherwise the schema will be silently ignored.
   The select list already misses mentioning compatibles:
   mediatek,mt8365-infracfg-nao and renesas,r9a08g046-lvds-cmn (with the
   latter being reverted for different reasons).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Changes in v2:
1. New patch
---
 Documentation/devicetree/bindings/mfd/syscon.yaml | 116 ----------------------
 1 file changed, 116 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/syscon.yaml b/Documentation/devicetree/bindings/mfd/syscon.yaml
index 9c81010d5a74..b70018bf1bcf 100644
--- a/Documentation/devicetree/bindings/mfd/syscon.yaml
+++ b/Documentation/devicetree/bindings/mfd/syscon.yaml
@@ -19,122 +19,6 @@ description: |
 maintainers:
   - Lee Jones <lee@kernel.org>
 
-# Need a select with all compatibles listed for compatibility with older
-# dtschema (<2024.02), so this will not be selected for other schemas having
-# syscon fallback.
-select:
-  properties:
-    compatible:
-      contains:
-        enum:
-          - airoha,en7581-pbus-csr
-          - al,alpine-sysfabric-service
-          - allwinner,sun8i-a83t-system-controller
-          - allwinner,sun8i-h3-system-controller
-          - allwinner,sun8i-v3s-system-controller
-          - allwinner,sun50i-a64-system-controller
-          - altr,l3regs
-          - altr,sdr-ctl
-          - amd,pensando-elba-syscon
-          - amlogic,meson-mx-assist
-          - amlogic,meson-mx-bootrom
-          - amlogic,meson8-analog-top
-          - amlogic,meson8b-analog-top
-          - amlogic,meson8-pmu
-          - amlogic,meson8b-pmu
-          - apm,merlin-poweroff-mailbox
-          - apm,mustang-poweroff-mailbox
-          - apm,xgene-csw
-          - apm,xgene-efuse
-          - apm,xgene-mcb
-          - apm,xgene-rb
-          - apm,xgene-scu
-          - atmel,sama5d2-sfrbu
-          - atmel,sama5d3-nfc-io
-          - atmel,sama5d3-sfrbu
-          - atmel,sama5d4-sfrbu
-          - axis,artpec6-syscon
-          - brcm,cru-clkset
-          - brcm,sr-cdru
-          - brcm,sr-mhb
-          - cirrus,ep7209-syscon1
-          - cirrus,ep7209-syscon2
-          - cirrus,ep7209-syscon3
-          - cnxt,cx92755-uc
-          - econet,en751221-chip-scu
-          - freecom,fsg-cs2-system-controller
-          - fsl,imx93-aonmix-ns-syscfg
-          - fsl,imx93-wakeupmix-syscfg
-          - fsl,ls1088a-reset
-          - fsl,vf610-anatop
-          - fsl,vf610-mscm-cpucfg
-          - hisilicon,dsa-subctrl
-          - hisilicon,hi6220-sramctrl
-          - hisilicon,hip04-ppe
-          - hisilicon,pcie-sas-subctrl
-          - hisilicon,peri-subctrl
-          - hpe,gxp-sysreg
-          - loongson,ls1b-syscon
-          - loongson,ls1c-syscon
-          - lsi,axxia-syscon
-          - marvell,armada-3700-cpu-misc
-          - marvell,armada-3700-nb-pm
-          - marvell,armada-3700-avs
-          - marvell,armada-3700-usb2-host-device-misc
-          - marvell,armada-3700-usb2-host-misc
-          - marvell,dove-global-config
-          - mediatek,mt2701-pctl-a-syscfg
-          - mediatek,mt2712-pctl-a-syscfg
-          - mediatek,mt6397-pctl-pmic-syscfg
-          - mediatek,mt7981-topmisc
-          - mediatek,mt7988-topmisc
-          - mediatek,mt8135-pctl-a-syscfg
-          - mediatek,mt8135-pctl-b-syscfg
-          - mediatek,mt8173-pctl-a-syscfg
-          - mediatek,mt8365-syscfg
-          - microchip,lan966x-cpu-syscon
-          - microchip,mpfs-control-scb
-          - microchip,mpfs-sysreg-scb
-          - microchip,sam9x60-sfr
-          - microchip,sama7d65-ddr3phy
-          - microchip,sama7d65-sfrbu
-          - microchip,sama7g5-ddr3phy
-          - mscc,ocelot-cpu-syscon
-          - mstar,msc313-pmsleep
-          - nuvoton,ma35d1-sys
-          - nuvoton,wpcm450-shm
-          - nxp,s32g2-gpr
-          - nxp,s32g3-gpr
-          - qcom,apq8064-mmss-sfpb
-          - qcom,apq8064-sps-sic
-          - rockchip,px30-qos
-          - rockchip,rk3036-qos
-          - rockchip,rk3066-qos
-          - rockchip,rk3128-qos
-          - rockchip,rk3228-qos
-          - rockchip,rk3288-qos
-          - rockchip,rk3368-qos
-          - rockchip,rk3399-qos
-          - rockchip,rk3528-qos
-          - rockchip,rk3562-qos
-          - rockchip,rk3568-qos
-          - rockchip,rk3576-qos
-          - rockchip,rk3588-qos
-          - rockchip,rv1126-qos
-          - st,spear1340-misc
-          - stericsson,nomadik-pmu
-          - starfive,jh7100-sysmain
-          - ti,am62-opp-efuse-table
-          - ti,am62-usb-phy-ctrl
-          - ti,am625-dss-oldi-io-ctrl
-          - ti,am62p-cpsw-mac-efuse
-          - ti,am654-dss-oldi-io-ctrl
-          - ti,j784s4-acspcie-proxy-ctrl
-          - ti,j784s4-pcie-ctrl
-          - ti,keystone-pllctrl
-  required:
-    - compatible
-
 properties:
   compatible:
     oneOf:

-- 
2.53.0


