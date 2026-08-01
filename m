Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D88B4C55173
	for <linux-mediatek@archiver.kernel.org>; Sat,  1 Aug 2026 19:55:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=C5p2600pg+Z3tWajzP5jli4uFm4ZoIvDyv9DErP7pB8=; b=3lxRoErviDAymh2VZN1X3zV1QK
	TZmv9VuD5EAGswG7FsIynxmBvyVcLl/cPDph0U5iNyVSInjMp6vxGwv/JTI0YGgpOFBQ/3iszDmRR
	vVlvF3djBaAOiMYadL77Gpd5EY62l45NCGwSKUu9PBNuuQZF8wUC2jhZ/i9UCFbBWzmtdqR/vEeiK
	qsqt4/ehsQ9Rk9BZSiyhu+xETt8unia8e1OhjkDEWzeogrwBY7QeK5GAgxNuuj9+sf7itdrNpPQvG
	h4oD4VwjGY9ygBgSHzu4A+DuQP4MUNpjBmYfVQEfeQF5zK5rEfh1jGwXgFNgtkjwlWwCTRC07Hl2+
	8d2JGl/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqFoF-0000000F0ww-39UE;
	Sat, 01 Aug 2026 19:55:51 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqFoC-0000000F0th-2Mnf
	for linux-mediatek@lists.infradead.org;
	Sat, 01 Aug 2026 19:55:50 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 671Ixg0M4032316
	for <linux-mediatek@lists.infradead.org>; Sat, 1 Aug 2026 19:55:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=C5p2600pg+Z3tWajzP5jli4uFm4ZoIvDyv9
	DErP7pB8=; b=ZNiojN4H2XHO7lIlDJIJmZbcqzPuJGpS1503/JgylnHWteNsDmV
	hLGi41kk2Eeu54rLbSePkYdfJFHFVWMBKOfJFthESXEhEtzBbIcQuxdiyDyXOkow
	p20ECEKVUjKLIaN6WcKQADuhXuIgD1FIoG0lvUcbzWRkn2vb7jgyKXdVoAqhk1St
	ufPDhg6v6X+FSZ8VH398RTKsoz76JCDvH6p9rUA95ZDcPpoMlTnTykAGMWrs8XVU
	K4pSiljr1BhTbRzir2K9GJy9ZC4Rh3ew4UQNq4x8Ya/hI+pSGcRgG2cJ1Rp/Ri3c
	MEqw7NKHz4lCJcJAqSITAG8g2AEPAuaokIQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fs8q51mqw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Sat, 01 Aug 2026 19:55:47 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c07f25de2so15342401cf.3
        for <linux-mediatek@lists.infradead.org>; Sat, 01 Aug 2026 12:55:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785614147; x=1786218947; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=C5p2600pg+Z3tWajzP5jli4uFm4ZoIvDyv9DErP7pB8=;
        b=eW48r36L9PxOaGs6QlflAx7eLZSJC3uP+1Mu1WnNB4HWsz3TL6jN1bseI4/IuDegqI
         nIlf/Qo9q+gIEl/fjq/reycW4/y7G9eSWrr5HbY4jJHwQnFN11UR/sIkXKL820QPoruN
         M2uFKpcXp7qEAzoZde70hEM3FnIIABcZwVwBa5dGjU+GN4pePOWpnt31yeEtCPIUmTZt
         KOE4qgimK/lyMXdFy7zOv2XhWN4UqdA4VE0E8oQ6M53f+At64J2NvJYbSGebPv0YxZ3/
         FlChafWj+FOyDtiet2ETh9j7J4O09VFbDL5cO+XLtvxJ8f4K1f1uuDtbmE18o/3jDM9o
         2AVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785614147; x=1786218947;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C5p2600pg+Z3tWajzP5jli4uFm4ZoIvDyv9DErP7pB8=;
        b=JxyytEKiiuS5pfYOJYRN11qIUUI2cmgSa49kSGhfCUubE4ZIF/2JahIh0mEwuuvg1T
         ilm+Etc7P7772AqnZyCDLFTGAEAIsa/YKlPZwHyNdZSpAbhng3/qot8aWiE1DIoPPL9U
         Uk85zsT1FSKhiy6DW2OPy2C0R4uHGDzJFQDymfRJ8mkHDYsLEzvgDhQzvMjtWzhOTbOn
         w/zxw/1x3uk4qzuz8kPR+/lHLIWlvBmF56BxcHjL0geY+AIFXba0UlEYszUhvo04UWNi
         /S7KxBUVOh69u+km91fGi+gN9D6Tm7z8TzFhgOCx5uoNf2lgSdXiqkxVNnLy7JWVsic8
         Cu6w==
X-Forwarded-Encrypted: i=1; AHgh+RoqweOZzugbFyaRhlVdGLBBDQFKku6iQ8dWEdFjzWT3w1yVBCn0nyVW2ydtlMPB9j7Pci+VYsFOo9FT3jGq6g==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw4kTuAos196Z5wLTk7Lz6GFqLfOm4S67S7jHYE0912ZOxNnHMu
	9gLQOTbnFx3ihC97jNYfeePa/JJWtkRkXsZbREU6DDs0XmbWJNO6BF9mOxo2/4YC6awxvOnvoaI
	ce+ekOcSlSWoFiC5e4GmZZYnPz9oADX9pW1zEeTCQFisNQmbiE9jkOWVGkVd9tasva2r2Eqn/fP
	pWyH6doAI=
X-Gm-Gg: AR+sD10+NwBeLJftF6X0OTsYIAtURyknHFgaWMdHTX3Ut1P7oOF1vlpQC/JyRbzHHsH
	3ApBXGq2G+JNiNIdVVG3YO8hn4tinBeHu8vCoeDAtUV9+9//VefKeD3O8GqgI91ZZjGu9N4RajP
	bbk0j/PaHQqyxECpWY/JDZ2yCu/5SV7wGLPY7e6fK5rW2HOMVv+mAjV7LDC6uX1xK7uVRdVOpRf
	4sjgdOwoWPcbwqJzSwo7WU3diXH1nXf/Xrami3B6IpoR2mQDdcj9TVdST6o4CORrzDTHdcUX1kd
	lkrckCauAY99oH7t/k82ldP87N/VmZRV2zxSmcvjnhTQ21uH1HtpX7OnTbODOmLsjn1aC2ropyX
	lqhBey+e6hdQf0gV+
X-Received: by 2002:a05:622a:83:b0:51a:89db:95a4 with SMTP id d75a77b69052e-52b56673d6cmr78414851cf.6.1785614146885;
        Sat, 01 Aug 2026 12:55:46 -0700 (PDT)
X-Received: by 2002:a05:622a:83:b0:51a:89db:95a4 with SMTP id d75a77b69052e-52b56673d6cmr78414531cf.6.1785614146453;
        Sat, 01 Aug 2026 12:55:46 -0700 (PDT)
Received: from quoll ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49808199a5csm111576985e9.4.2026.08.01.12.55.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 12:55:45 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
        Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] dt-bindings: clock: Correct white-space style
Date: Sat,  1 Aug 2026 21:55:41 +0200
Message-ID: <20260801195540.235298-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=17894; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=YZ/Vv2zEU6mZyirx3TDiVm9nLZJrYi5Hr9L0/t9260M=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqbk88ksgxIhZHrFdphci55sYYXkZDI0qtofyjQ
 VVkfva5YViJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCam5PPAAKCRDBN2bmhouD
 1wn5EACOIdGkcCdLATpYr5SfTKrLTqLr9zX/7zeeWkFpsmViJjxOrpk/+Z9sdc4mO6oD4Zq2b2J
 y/d9ET/a2gXhuhAyUMO5e3wftvxgqs0pQe96sWdKeNq5dw/jlHfBf0MDQ1txqAm7qwAjmfY2KuH
 om+zFRWiSQNIa/tQu+XUTq/lmriWkpqj9rGu3p1JmkW4BB20rzkp/x9nlc48QMhurivxfR78M/N
 QwHZXc3CsHCPwFpwd6mwLh9ev9C76PhJX94pe/moOdw3fWJC5BrZvBlKKKzXd5iusrZsxDY6tsL
 5F+KA7OIIzZ2AZU7dGEfirdi20pdyvs3LFotVyxErofbpdpNHO4Avg0Lhsx9ETch+HIbJWw5E7/
 EPckX2a/eYqXUTsbjI0UVi+CA5AERPoWc43ExfPpnkXnJDgX1TZ2/ee0zPWDoQpH43fu6sR9kEq
 oM+fQALJs4HWbZ60xbfPewrP1bIf9L+NxwXgQU+6fuKMhj5yxngsAPEmFpGDiWkJDUGUQyFwwhf
 ADbtYpL6LC/VcynI9IsPVg47h28gDLElmTeAWX4YA5Bwq3QsqDGIWzACh105SsoKQPVmv9aeELV
 b/k89tfJWPGOcMMyV3/+EdcfYCMJXG/5rhPpmWNxIt9cL4tqTrksLO1HbPyCVAVkfUBV7iTsPE+ cwMNi9EqB6Eo3ew==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAxMDE2MCBTYWx0ZWRfX3mo9Skt1B3A6
 9UFIbYXLP8mvjbg3MxuF2eZZvOjQLX52CcNXPcG5yReUJ7ayE1Nalqo8ctQkb38oBvskaO5hiR0
 K38+24wfnIXn3aHQjhaG1owOApGPUbo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAxMDE2MCBTYWx0ZWRfX5iHcnShSnbc6
 g8rNYBRm4vQWpoSivhnlMwUm1AcSryDal/uQyvTEyTOhQjneEtuqBQwDpEOSUBMjT9A1aZRJuYs
 b7ZwU21bj9PkZWj259BoDKfYi0iKpRRycK3+lTvJEQquwo1tgHxK8IZ0QTR4KgeqqCabxKf9qKN
 5Le3bN22O+mZS5dGUIavpCwhWkC80fkMBDC7RNAzUVTsLDWwI21ryWCzTYrU99o99UrrNZnhf7e
 EnBxd65QzyWWdousgppxSjrXaVJR6egGQCPNZ4H8gTBrOhYXyLljYcZifjrPshKGbobBot+r3FU
 0VQA72Fv7oV+jBsSzgCqwN615LTrU+yqJFCR+xDtpEPiMv1UQlaiEShJdCpVJXxrYoyUs88DM1d
 9MxwFuL/vTqlYpw98fL4ftxUvj5or6Llcjl5mPff5ATGMd+7efcU3bRDb893/N/vY5Qm0mX5IRA
 SAnGCwOLkiAfTya4s3Q==
X-Proofpoint-GUID: 0KKjWk01z-PSkzza6r88zg9KhskejDLQ
X-Authority-Analysis: v=2.4 cv=IYC3n2qa c=1 sm=1 tr=0 ts=6a6e4f43 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=iQL6gULKA_Fa5ViYYU0A:9 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: 0KKjWk01z-PSkzza6r88zg9KhskejDLQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-01_03,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 phishscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 malwarescore=0 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608010160
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260801_125548_763849_65BC7E8F 
X-CRM114-Status: GOOD (  12.02  )
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

Correct a few white-space issues, like double space after '=' or before
bracket '{' characters, which will be flagged by dt-check-style.  No
functional changes.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../bindings/clock/mediatek,pericfg.yaml      |   2 +-
 .../bindings/clock/st,stm32mp21-rcc.yaml      | 140 +++++++--------
 .../bindings/clock/st,stm32mp25-rcc.yaml      | 160 +++++++++---------
 .../bindings/clock/xlnx,clocking-wizard.yaml  |   2 +-
 4 files changed, 152 insertions(+), 152 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/mediatek,pericfg.yaml b/Documentation/devicetree/bindings/clock/mediatek,pericfg.yaml
index b98cf45efe2f..f0c8df4d10c8 100644
--- a/Documentation/devicetree/bindings/clock/mediatek,pericfg.yaml
+++ b/Documentation/devicetree/bindings/clock/mediatek,pericfg.yaml
@@ -65,7 +65,7 @@ examples:
 
   - |
     pericfg@10003000 {
-        compatible =  "mediatek,mt7623-pericfg", "mediatek,mt2701-pericfg", "syscon";
+        compatible = "mediatek,mt7623-pericfg", "mediatek,mt2701-pericfg", "syscon";
         reg = <0x10003000 0x1000>;
         #clock-cells = <1>;
         #reset-cells = <1>;
diff --git a/Documentation/devicetree/bindings/clock/st,stm32mp21-rcc.yaml b/Documentation/devicetree/bindings/clock/st,stm32mp21-rcc.yaml
index 4368063c6709..e4d64d4b63c6 100644
--- a/Documentation/devicetree/bindings/clock/st,stm32mp21-rcc.yaml
+++ b/Documentation/devicetree/bindings/clock/st,stm32mp21-rcc.yaml
@@ -125,75 +125,75 @@ examples:
         reg = <0x44200000 0x10000>;
         #clock-cells = <1>;
         #reset-cells = <1>;
-        clocks =  <&scmi_clk CK_SCMI_HSE>,
-                  <&scmi_clk CK_SCMI_HSI>,
-                  <&scmi_clk CK_SCMI_MSI>,
-                  <&scmi_clk CK_SCMI_LSE>,
-                  <&scmi_clk CK_SCMI_LSI>,
-                  <&scmi_clk CK_SCMI_HSE_DIV2>,
-                  <&scmi_clk CK_SCMI_ICN_HS_MCU>,
-                  <&scmi_clk CK_SCMI_ICN_LS_MCU>,
-                  <&scmi_clk CK_SCMI_ICN_SDMMC>,
-                  <&scmi_clk CK_SCMI_ICN_DDR>,
-                  <&scmi_clk CK_SCMI_ICN_DISPLAY>,
-                  <&scmi_clk CK_SCMI_ICN_HSL>,
-                  <&scmi_clk CK_SCMI_ICN_NIC>,
-                  <&scmi_clk CK_SCMI_FLEXGEN_07>,
-                  <&scmi_clk CK_SCMI_FLEXGEN_08>,
-                  <&scmi_clk CK_SCMI_FLEXGEN_09>,
-                  <&scmi_clk CK_SCMI_FLEXGEN_10>,
-                  <&scmi_clk CK_SCMI_FLEXGEN_11>,
-                  <&scmi_clk CK_SCMI_FLEXGEN_12>,
-                  <&scmi_clk CK_SCMI_FLEXGEN_13>,
-                  <&scmi_clk CK_SCMI_FLEXGEN_14>,
-                  <&scmi_clk CK_SCMI_FLEXGEN_16>,
-                  <&scmi_clk CK_SCMI_FLEXGEN_17>,
-                  <&scmi_clk CK_SCMI_FLEXGEN_18>,
-                  <&scmi_clk CK_SCMI_FLEXGEN_19>,
-                  <&scmi_clk CK_SCMI_FLEXGEN_20>,
-                  <&scmi_clk CK_SCMI_FLEXGEN_21>,
-                  <&scmi_clk CK_SCMI_FLEXGEN_22>,
-                  <&scmi_clk CK_SCMI_FLEXGEN_23>,
-                  <&scmi_clk CK_SCMI_FLEXGEN_24>,
-                  <&scmi_clk CK_SCMI_FLEXGEN_25>,
-                  <&scmi_clk CK_SCMI_FLEXGEN_26>,
-                  <&scmi_clk CK_SCMI_FLEXGEN_27>,
-                  <&scmi_clk CK_SCMI_FLEXGEN_29>,
-                  <&scmi_clk CK_SCMI_FLEXGEN_30>,
-                  <&scmi_clk CK_SCMI_FLEXGEN_31>,
-                  <&scmi_clk CK_SCMI_FLEXGEN_33>,
-                  <&scmi_clk CK_SCMI_FLEXGEN_36>,
-                  <&scmi_clk CK_SCMI_FLEXGEN_37>,
-                  <&scmi_clk CK_SCMI_FLEXGEN_38>,
-                  <&scmi_clk CK_SCMI_FLEXGEN_39>,
-                  <&scmi_clk CK_SCMI_FLEXGEN_40>,
-                  <&scmi_clk CK_SCMI_FLEXGEN_41>,
-                  <&scmi_clk CK_SCMI_FLEXGEN_42>,
-                  <&scmi_clk CK_SCMI_FLEXGEN_43>,
-                  <&scmi_clk CK_SCMI_FLEXGEN_44>,
-                  <&scmi_clk CK_SCMI_FLEXGEN_45>,
-                  <&scmi_clk CK_SCMI_FLEXGEN_46>,
-                  <&scmi_clk CK_SCMI_FLEXGEN_47>,
-                  <&scmi_clk CK_SCMI_FLEXGEN_48>,
-                  <&scmi_clk CK_SCMI_FLEXGEN_50>,
-                  <&scmi_clk CK_SCMI_FLEXGEN_51>,
-                  <&scmi_clk CK_SCMI_FLEXGEN_52>,
-                  <&scmi_clk CK_SCMI_FLEXGEN_53>,
-                  <&scmi_clk CK_SCMI_FLEXGEN_54>,
-                  <&scmi_clk CK_SCMI_FLEXGEN_55>,
-                  <&scmi_clk CK_SCMI_FLEXGEN_56>,
-                  <&scmi_clk CK_SCMI_FLEXGEN_57>,
-                  <&scmi_clk CK_SCMI_FLEXGEN_58>,
-                  <&scmi_clk CK_SCMI_FLEXGEN_61>,
-                  <&scmi_clk CK_SCMI_FLEXGEN_62>,
-                  <&scmi_clk CK_SCMI_FLEXGEN_63>,
-                  <&scmi_clk CK_SCMI_ICN_APB1>,
-                  <&scmi_clk CK_SCMI_ICN_APB2>,
-                  <&scmi_clk CK_SCMI_ICN_APB3>,
-                  <&scmi_clk CK_SCMI_ICN_APB4>,
-                  <&scmi_clk CK_SCMI_ICN_APB5>,
-                  <&scmi_clk CK_SCMI_ICN_APBDBG>,
-                  <&scmi_clk CK_SCMI_TIMG1>,
-                  <&scmi_clk CK_SCMI_TIMG2>;
+        clocks = <&scmi_clk CK_SCMI_HSE>,
+                 <&scmi_clk CK_SCMI_HSI>,
+                 <&scmi_clk CK_SCMI_MSI>,
+                 <&scmi_clk CK_SCMI_LSE>,
+                 <&scmi_clk CK_SCMI_LSI>,
+                 <&scmi_clk CK_SCMI_HSE_DIV2>,
+                 <&scmi_clk CK_SCMI_ICN_HS_MCU>,
+                 <&scmi_clk CK_SCMI_ICN_LS_MCU>,
+                 <&scmi_clk CK_SCMI_ICN_SDMMC>,
+                 <&scmi_clk CK_SCMI_ICN_DDR>,
+                 <&scmi_clk CK_SCMI_ICN_DISPLAY>,
+                 <&scmi_clk CK_SCMI_ICN_HSL>,
+                 <&scmi_clk CK_SCMI_ICN_NIC>,
+                 <&scmi_clk CK_SCMI_FLEXGEN_07>,
+                 <&scmi_clk CK_SCMI_FLEXGEN_08>,
+                 <&scmi_clk CK_SCMI_FLEXGEN_09>,
+                 <&scmi_clk CK_SCMI_FLEXGEN_10>,
+                 <&scmi_clk CK_SCMI_FLEXGEN_11>,
+                 <&scmi_clk CK_SCMI_FLEXGEN_12>,
+                 <&scmi_clk CK_SCMI_FLEXGEN_13>,
+                 <&scmi_clk CK_SCMI_FLEXGEN_14>,
+                 <&scmi_clk CK_SCMI_FLEXGEN_16>,
+                 <&scmi_clk CK_SCMI_FLEXGEN_17>,
+                 <&scmi_clk CK_SCMI_FLEXGEN_18>,
+                 <&scmi_clk CK_SCMI_FLEXGEN_19>,
+                 <&scmi_clk CK_SCMI_FLEXGEN_20>,
+                 <&scmi_clk CK_SCMI_FLEXGEN_21>,
+                 <&scmi_clk CK_SCMI_FLEXGEN_22>,
+                 <&scmi_clk CK_SCMI_FLEXGEN_23>,
+                 <&scmi_clk CK_SCMI_FLEXGEN_24>,
+                 <&scmi_clk CK_SCMI_FLEXGEN_25>,
+                 <&scmi_clk CK_SCMI_FLEXGEN_26>,
+                 <&scmi_clk CK_SCMI_FLEXGEN_27>,
+                 <&scmi_clk CK_SCMI_FLEXGEN_29>,
+                 <&scmi_clk CK_SCMI_FLEXGEN_30>,
+                 <&scmi_clk CK_SCMI_FLEXGEN_31>,
+                 <&scmi_clk CK_SCMI_FLEXGEN_33>,
+                 <&scmi_clk CK_SCMI_FLEXGEN_36>,
+                 <&scmi_clk CK_SCMI_FLEXGEN_37>,
+                 <&scmi_clk CK_SCMI_FLEXGEN_38>,
+                 <&scmi_clk CK_SCMI_FLEXGEN_39>,
+                 <&scmi_clk CK_SCMI_FLEXGEN_40>,
+                 <&scmi_clk CK_SCMI_FLEXGEN_41>,
+                 <&scmi_clk CK_SCMI_FLEXGEN_42>,
+                 <&scmi_clk CK_SCMI_FLEXGEN_43>,
+                 <&scmi_clk CK_SCMI_FLEXGEN_44>,
+                 <&scmi_clk CK_SCMI_FLEXGEN_45>,
+                 <&scmi_clk CK_SCMI_FLEXGEN_46>,
+                 <&scmi_clk CK_SCMI_FLEXGEN_47>,
+                 <&scmi_clk CK_SCMI_FLEXGEN_48>,
+                 <&scmi_clk CK_SCMI_FLEXGEN_50>,
+                 <&scmi_clk CK_SCMI_FLEXGEN_51>,
+                 <&scmi_clk CK_SCMI_FLEXGEN_52>,
+                 <&scmi_clk CK_SCMI_FLEXGEN_53>,
+                 <&scmi_clk CK_SCMI_FLEXGEN_54>,
+                 <&scmi_clk CK_SCMI_FLEXGEN_55>,
+                 <&scmi_clk CK_SCMI_FLEXGEN_56>,
+                 <&scmi_clk CK_SCMI_FLEXGEN_57>,
+                 <&scmi_clk CK_SCMI_FLEXGEN_58>,
+                 <&scmi_clk CK_SCMI_FLEXGEN_61>,
+                 <&scmi_clk CK_SCMI_FLEXGEN_62>,
+                 <&scmi_clk CK_SCMI_FLEXGEN_63>,
+                 <&scmi_clk CK_SCMI_ICN_APB1>,
+                 <&scmi_clk CK_SCMI_ICN_APB2>,
+                 <&scmi_clk CK_SCMI_ICN_APB3>,
+                 <&scmi_clk CK_SCMI_ICN_APB4>,
+                 <&scmi_clk CK_SCMI_ICN_APB5>,
+                 <&scmi_clk CK_SCMI_ICN_APBDBG>,
+                 <&scmi_clk CK_SCMI_TIMG1>,
+                 <&scmi_clk CK_SCMI_TIMG2>;
     };
 ...
diff --git a/Documentation/devicetree/bindings/clock/st,stm32mp25-rcc.yaml b/Documentation/devicetree/bindings/clock/st,stm32mp25-rcc.yaml
index 1e3b5d218bb0..3b7925d2c175 100644
--- a/Documentation/devicetree/bindings/clock/st,stm32mp25-rcc.yaml
+++ b/Documentation/devicetree/bindings/clock/st,stm32mp25-rcc.yaml
@@ -135,85 +135,85 @@ examples:
         reg = <0x44200000 0x10000>;
         #clock-cells = <1>;
         #reset-cells = <1>;
-        clocks =  <&scmi_clk CK_SCMI_HSE>,
-                  <&scmi_clk CK_SCMI_HSI>,
-                  <&scmi_clk CK_SCMI_MSI>,
-                  <&scmi_clk CK_SCMI_LSE>,
-                  <&scmi_clk CK_SCMI_LSI>,
-                  <&scmi_clk CK_SCMI_HSE_DIV2>,
-                  <&scmi_clk CK_SCMI_ICN_HS_MCU>,
-                  <&scmi_clk CK_SCMI_ICN_LS_MCU>,
-                  <&scmi_clk CK_SCMI_ICN_SDMMC>,
-                  <&scmi_clk CK_SCMI_ICN_DDR>,
-                  <&scmi_clk CK_SCMI_ICN_DISPLAY>,
-                  <&scmi_clk CK_SCMI_ICN_HSL>,
-                  <&scmi_clk CK_SCMI_ICN_NIC>,
-                  <&scmi_clk CK_SCMI_ICN_VID>,
-                  <&scmi_clk CK_SCMI_FLEXGEN_07>,
-                  <&scmi_clk CK_SCMI_FLEXGEN_08>,
-                  <&scmi_clk CK_SCMI_FLEXGEN_09>,
-                  <&scmi_clk CK_SCMI_FLEXGEN_10>,
-                  <&scmi_clk CK_SCMI_FLEXGEN_11>,
-                  <&scmi_clk CK_SCMI_FLEXGEN_12>,
-                  <&scmi_clk CK_SCMI_FLEXGEN_13>,
-                  <&scmi_clk CK_SCMI_FLEXGEN_14>,
-                  <&scmi_clk CK_SCMI_FLEXGEN_15>,
-                  <&scmi_clk CK_SCMI_FLEXGEN_16>,
-                  <&scmi_clk CK_SCMI_FLEXGEN_17>,
-                  <&scmi_clk CK_SCMI_FLEXGEN_18>,
-                  <&scmi_clk CK_SCMI_FLEXGEN_19>,
-                  <&scmi_clk CK_SCMI_FLEXGEN_20>,
-                  <&scmi_clk CK_SCMI_FLEXGEN_21>,
-                  <&scmi_clk CK_SCMI_FLEXGEN_22>,
-                  <&scmi_clk CK_SCMI_FLEXGEN_23>,
-                  <&scmi_clk CK_SCMI_FLEXGEN_24>,
-                  <&scmi_clk CK_SCMI_FLEXGEN_25>,
-                  <&scmi_clk CK_SCMI_FLEXGEN_26>,
-                  <&scmi_clk CK_SCMI_FLEXGEN_27>,
-                  <&scmi_clk CK_SCMI_FLEXGEN_28>,
-                  <&scmi_clk CK_SCMI_FLEXGEN_29>,
-                  <&scmi_clk CK_SCMI_FLEXGEN_30>,
-                  <&scmi_clk CK_SCMI_FLEXGEN_31>,
-                  <&scmi_clk CK_SCMI_FLEXGEN_32>,
-                  <&scmi_clk CK_SCMI_FLEXGEN_33>,
-                  <&scmi_clk CK_SCMI_FLEXGEN_34>,
-                  <&scmi_clk CK_SCMI_FLEXGEN_35>,
-                  <&scmi_clk CK_SCMI_FLEXGEN_36>,
-                  <&scmi_clk CK_SCMI_FLEXGEN_37>,
-                  <&scmi_clk CK_SCMI_FLEXGEN_38>,
-                  <&scmi_clk CK_SCMI_FLEXGEN_39>,
-                  <&scmi_clk CK_SCMI_FLEXGEN_40>,
-                  <&scmi_clk CK_SCMI_FLEXGEN_41>,
-                  <&scmi_clk CK_SCMI_FLEXGEN_42>,
-                  <&scmi_clk CK_SCMI_FLEXGEN_43>,
-                  <&scmi_clk CK_SCMI_FLEXGEN_44>,
-                  <&scmi_clk CK_SCMI_FLEXGEN_45>,
-                  <&scmi_clk CK_SCMI_FLEXGEN_46>,
-                  <&scmi_clk CK_SCMI_FLEXGEN_47>,
-                  <&scmi_clk CK_SCMI_FLEXGEN_48>,
-                  <&scmi_clk CK_SCMI_FLEXGEN_49>,
-                  <&scmi_clk CK_SCMI_FLEXGEN_50>,
-                  <&scmi_clk CK_SCMI_FLEXGEN_51>,
-                  <&scmi_clk CK_SCMI_FLEXGEN_52>,
-                  <&scmi_clk CK_SCMI_FLEXGEN_53>,
-                  <&scmi_clk CK_SCMI_FLEXGEN_54>,
-                  <&scmi_clk CK_SCMI_FLEXGEN_55>,
-                  <&scmi_clk CK_SCMI_FLEXGEN_56>,
-                  <&scmi_clk CK_SCMI_FLEXGEN_57>,
-                  <&scmi_clk CK_SCMI_FLEXGEN_58>,
-                  <&scmi_clk CK_SCMI_FLEXGEN_59>,
-                  <&scmi_clk CK_SCMI_FLEXGEN_60>,
-                  <&scmi_clk CK_SCMI_FLEXGEN_61>,
-                  <&scmi_clk CK_SCMI_FLEXGEN_62>,
-                  <&scmi_clk CK_SCMI_FLEXGEN_63>,
-                  <&scmi_clk CK_SCMI_ICN_APB1>,
-                  <&scmi_clk CK_SCMI_ICN_APB2>,
-                  <&scmi_clk CK_SCMI_ICN_APB3>,
-                  <&scmi_clk CK_SCMI_ICN_APB4>,
-                  <&scmi_clk CK_SCMI_ICN_APBDBG>,
-                  <&scmi_clk CK_SCMI_TIMG1>,
-                  <&scmi_clk CK_SCMI_TIMG2>,
-                  <&scmi_clk CK_SCMI_PLL3>,
-                  <&clk_dsi_txbyte>;
+        clocks = <&scmi_clk CK_SCMI_HSE>,
+                 <&scmi_clk CK_SCMI_HSI>,
+                 <&scmi_clk CK_SCMI_MSI>,
+                 <&scmi_clk CK_SCMI_LSE>,
+                 <&scmi_clk CK_SCMI_LSI>,
+                 <&scmi_clk CK_SCMI_HSE_DIV2>,
+                 <&scmi_clk CK_SCMI_ICN_HS_MCU>,
+                 <&scmi_clk CK_SCMI_ICN_LS_MCU>,
+                 <&scmi_clk CK_SCMI_ICN_SDMMC>,
+                 <&scmi_clk CK_SCMI_ICN_DDR>,
+                 <&scmi_clk CK_SCMI_ICN_DISPLAY>,
+                 <&scmi_clk CK_SCMI_ICN_HSL>,
+                 <&scmi_clk CK_SCMI_ICN_NIC>,
+                 <&scmi_clk CK_SCMI_ICN_VID>,
+                 <&scmi_clk CK_SCMI_FLEXGEN_07>,
+                 <&scmi_clk CK_SCMI_FLEXGEN_08>,
+                 <&scmi_clk CK_SCMI_FLEXGEN_09>,
+                 <&scmi_clk CK_SCMI_FLEXGEN_10>,
+                 <&scmi_clk CK_SCMI_FLEXGEN_11>,
+                 <&scmi_clk CK_SCMI_FLEXGEN_12>,
+                 <&scmi_clk CK_SCMI_FLEXGEN_13>,
+                 <&scmi_clk CK_SCMI_FLEXGEN_14>,
+                 <&scmi_clk CK_SCMI_FLEXGEN_15>,
+                 <&scmi_clk CK_SCMI_FLEXGEN_16>,
+                 <&scmi_clk CK_SCMI_FLEXGEN_17>,
+                 <&scmi_clk CK_SCMI_FLEXGEN_18>,
+                 <&scmi_clk CK_SCMI_FLEXGEN_19>,
+                 <&scmi_clk CK_SCMI_FLEXGEN_20>,
+                 <&scmi_clk CK_SCMI_FLEXGEN_21>,
+                 <&scmi_clk CK_SCMI_FLEXGEN_22>,
+                 <&scmi_clk CK_SCMI_FLEXGEN_23>,
+                 <&scmi_clk CK_SCMI_FLEXGEN_24>,
+                 <&scmi_clk CK_SCMI_FLEXGEN_25>,
+                 <&scmi_clk CK_SCMI_FLEXGEN_26>,
+                 <&scmi_clk CK_SCMI_FLEXGEN_27>,
+                 <&scmi_clk CK_SCMI_FLEXGEN_28>,
+                 <&scmi_clk CK_SCMI_FLEXGEN_29>,
+                 <&scmi_clk CK_SCMI_FLEXGEN_30>,
+                 <&scmi_clk CK_SCMI_FLEXGEN_31>,
+                 <&scmi_clk CK_SCMI_FLEXGEN_32>,
+                 <&scmi_clk CK_SCMI_FLEXGEN_33>,
+                 <&scmi_clk CK_SCMI_FLEXGEN_34>,
+                 <&scmi_clk CK_SCMI_FLEXGEN_35>,
+                 <&scmi_clk CK_SCMI_FLEXGEN_36>,
+                 <&scmi_clk CK_SCMI_FLEXGEN_37>,
+                 <&scmi_clk CK_SCMI_FLEXGEN_38>,
+                 <&scmi_clk CK_SCMI_FLEXGEN_39>,
+                 <&scmi_clk CK_SCMI_FLEXGEN_40>,
+                 <&scmi_clk CK_SCMI_FLEXGEN_41>,
+                 <&scmi_clk CK_SCMI_FLEXGEN_42>,
+                 <&scmi_clk CK_SCMI_FLEXGEN_43>,
+                 <&scmi_clk CK_SCMI_FLEXGEN_44>,
+                 <&scmi_clk CK_SCMI_FLEXGEN_45>,
+                 <&scmi_clk CK_SCMI_FLEXGEN_46>,
+                 <&scmi_clk CK_SCMI_FLEXGEN_47>,
+                 <&scmi_clk CK_SCMI_FLEXGEN_48>,
+                 <&scmi_clk CK_SCMI_FLEXGEN_49>,
+                 <&scmi_clk CK_SCMI_FLEXGEN_50>,
+                 <&scmi_clk CK_SCMI_FLEXGEN_51>,
+                 <&scmi_clk CK_SCMI_FLEXGEN_52>,
+                 <&scmi_clk CK_SCMI_FLEXGEN_53>,
+                 <&scmi_clk CK_SCMI_FLEXGEN_54>,
+                 <&scmi_clk CK_SCMI_FLEXGEN_55>,
+                 <&scmi_clk CK_SCMI_FLEXGEN_56>,
+                 <&scmi_clk CK_SCMI_FLEXGEN_57>,
+                 <&scmi_clk CK_SCMI_FLEXGEN_58>,
+                 <&scmi_clk CK_SCMI_FLEXGEN_59>,
+                 <&scmi_clk CK_SCMI_FLEXGEN_60>,
+                 <&scmi_clk CK_SCMI_FLEXGEN_61>,
+                 <&scmi_clk CK_SCMI_FLEXGEN_62>,
+                 <&scmi_clk CK_SCMI_FLEXGEN_63>,
+                 <&scmi_clk CK_SCMI_ICN_APB1>,
+                 <&scmi_clk CK_SCMI_ICN_APB2>,
+                 <&scmi_clk CK_SCMI_ICN_APB3>,
+                 <&scmi_clk CK_SCMI_ICN_APB4>,
+                 <&scmi_clk CK_SCMI_ICN_APBDBG>,
+                 <&scmi_clk CK_SCMI_TIMG1>,
+                 <&scmi_clk CK_SCMI_TIMG2>,
+                 <&scmi_clk CK_SCMI_PLL3>,
+                 <&clk_dsi_txbyte>;
     };
 ...
diff --git a/Documentation/devicetree/bindings/clock/xlnx,clocking-wizard.yaml b/Documentation/devicetree/bindings/clock/xlnx,clocking-wizard.yaml
index b497c28e8094..3f311f90294e 100644
--- a/Documentation/devicetree/bindings/clock/xlnx,clocking-wizard.yaml
+++ b/Documentation/devicetree/bindings/clock/xlnx,clocking-wizard.yaml
@@ -70,7 +70,7 @@ additionalProperties: false
 
 examples:
   - |
-    clock-controller@b0000000  {
+    clock-controller@b0000000 {
         compatible = "xlnx,clocking-wizard";
         reg = <0xb0000000 0x10000>;
         #clock-cells = <1>;
-- 
2.53.0


