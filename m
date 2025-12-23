Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46837E6F093
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Dec 2025 15:25:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1OJbf7anBDIRc8m/HN/xjUDx01xgE4rVa2h45S22LCg=; b=DX3hfKQXXXrvs/Z+jkV4RfDB7X
	fMcUlRKgoOm+l5X3IqgNPzlSx4KzwTAc0OYoN3V/pevkqNQv8DZY7hTREaX7JAU0208y+/XLeNNh9
	deIBgyuV0pkiTkDyS7Fh9pf/etC6U3uFMrjqPAC819DUVSasIDSVtgaIz/h3guVq/XtXcDcSiuYjE
	29G9eMqW4smLR7zFRUD4RAzLJ+d9ouWyYT/xr4A6wZyT0KZU/MUPaIvm0S8KSC7Am+FJvgyKDkMgd
	xBkbcopOLuSYPIytRr6HCwOzRRxVZok6oVD6ku7LKnxSe9dWagr2E9yMTs1TpTzs2pjNQ98/fyNd8
	PkiTU26A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY4GV-0000000FgGh-3R1Y;
	Tue, 23 Dec 2025 15:25:35 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY4GR-0000000FgDd-31fv
	for linux-mediatek@lists.infradead.org;
	Tue, 23 Dec 2025 15:25:34 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BNAwt341357349
	for <linux-mediatek@lists.infradead.org>; Tue, 23 Dec 2025 15:25:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=1OJbf7anBDIRc8m/HN/xjUDx01xgE4rVa2h
	45S22LCg=; b=kbKzobqv6m80zOhSKn8lVvS1nRaqX31bQPhnsn3VI6Jhc5E3DAa
	IgpIg4li8mTtbQgiewz/q6CkSoDwyH5Q9hcUp8gvSz9pBQVHFK07iAhoRsZHrR/T
	yyP0JiRL+iJvC7WNmxUOlvgA62wCljmMncxm59Eph7Ew4zp6Gj0+BE+uYtoSh0w/
	/Rr1IfAAMJXkN6bXgo+HfuPkQhoIOftxErSza67VawK6XNHmUdhF6dsCEyPAW1Tb
	wSFRjRXAgN7MR6YVX9pZr6r0JGSU844ppd2fjryHsPsbR2N9hyTrtLPPzulYr7/O
	tOJgAUJ19C3YsriUUvIttVL1wQy8nNBONnw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b78xc3nmg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Tue, 23 Dec 2025 15:25:30 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4edaf9e48ecso133793401cf.0
        for <linux-mediatek@lists.infradead.org>; Tue, 23 Dec 2025 07:25:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766503530; x=1767108330; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1OJbf7anBDIRc8m/HN/xjUDx01xgE4rVa2h45S22LCg=;
        b=IlX0gBN/SgAOU37JjliGs6Crgzpq5JoQak34aohi7aIIEFLX53hqrE6U5XRSTWa5Ve
         pRceSd42Em/4Q/ziUvf2eV7ruwfEgKHi76hM4XK3GqHkuvOb+5a805BP8HbUaFuaJlcI
         17ERRLcjtIjMQdSF9hy93dAqj+sGulL+1ZBrz8Eoau8LPQoI6Gcb7RIWE2Mqmlj40mh0
         bhzda2x1OI7yKbKVg2UyqolOehLFWRw28MAEJqUDE09DOfwounXdFYL8soZ4zEDB8Pz8
         L3LSK2PHqC5BV1pHI8e1VIFCtUWXhvrqYtNtD2ksik1KMRVmLEiqId2pCfU/GpY009qK
         KbJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766503530; x=1767108330;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1OJbf7anBDIRc8m/HN/xjUDx01xgE4rVa2h45S22LCg=;
        b=ipi969HOg9A/230YIYUxPf46TXnsaZqSGA8WJyXfY5DQthme3NTc5YZ4lMb8YZcr6n
         D9S/gqtXC1HLDEJyWTbGqhuKnshaJRrxyvd1q3GO8OCNyEyq326/4HXUU/UADTGv9+cG
         sRFkOooNWMMlphEJTDrSbc9AXPRezkqjN7evVXYjsMoDpOQAZg6XV1x/Y+tOrSM2GYuA
         XOe1lw5X4rlrCpJevA0d64BYGP1q6gDt+olDqC60y+4uPp/cSq2gDWvGJxzxyoZTUJvs
         RrwAsELYJDV/G1AoxZDf+p2lx98NjGff56kVTrdSuxHVGb7U9hKBdEwJds66x6gjMsv0
         /9JQ==
X-Forwarded-Encrypted: i=1; AJvYcCWwRPXivrCDaVtmQeoiCfm704cp8BH7hMvpBU4T8LFYvS2V5x1IRX6ceb73JBU3vdNDzWS2CEp1NiWcR6WOXw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx78xp0k8OzYM9Hnb+3h/EhR2vHUQgg/aJDb01HaspFW6+yg7kL
	lySqHrSJ0StdeeRw6MMmdgwOuBlDzsDXwaYXkNX9Z39Ga6Ric6zDXwP3O/SQl0c+qkxJs1mghtB
	wF+HlhbRYfsVDV0R4WJJA/Iq/y9oj1qfpRiH/DcNnvtQI8Ey8sRCxxbIwWmxoDoRRIfPDZ7F5AI
	g=
X-Gm-Gg: AY/fxX69BzzeI5zY6dIEeBKReGplNwX0b2IqzxqHqS/bi6AlTfTdrlSRKLFb/LYWEcV
	WSTKruMBrBfMYnG/bfKYt1GsBFA5Gi4U3+r+CNyn04rf4V6Vpj1Iv1y6L4EQSd6E/5n61Hlc4tp
	81HspzYVmaCpyaGpbF5kOBvfTiEknzAaTXLVFOFwDf6tq7Y6t8DFBdD9zM6j86cNNEhf5a8hRUf
	cTPw3M/AlfBMJvEM/gEmyKK5PJvR1Em1s40I44d6tzZEQB7XCXrpr7D/wUoXoHJ/bGt3ewbiHTD
	dqJPEgB81iv0txQcTp/xJRWJM3nPaClKkBcimK1NpjARQTwUa4inG4fdJkQdCj6E1sbGc7H6EE4
	6NBx4aUnOkS1rHuP1X00h5ljDlmWmlSe5pWqniLgRR5lxq40SWs5xiMCGUyNSCOzFN7s=
X-Received: by 2002:ac8:5ccf:0:b0:4ee:28b8:f110 with SMTP id d75a77b69052e-4f4abceb823mr236615341cf.29.1766503529825;
        Tue, 23 Dec 2025 07:25:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHrnbsE+HWAwXiurBOJEEg2dgpe8DH83RknRyujky9Aogq1yQjJIOb1156ORxCZVJMxYuqyKA==
X-Received: by 2002:ac8:5ccf:0:b0:4ee:28b8:f110 with SMTP id d75a77b69052e-4f4abceb823mr236614771cf.29.1766503529284;
        Tue, 23 Dec 2025 07:25:29 -0800 (PST)
Received: from quoll.home (83.31.98.88.ipv4.supernova.orange.pl. [83.31.98.88])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b914949bbsm14003705a12.19.2025.12.23.07.25.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 07:25:27 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] arm64: dts: airoha: Use hyphen in node names
Date: Tue, 23 Dec 2025 16:25:24 +0100
Message-ID: <20251223152523.155523-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1152; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=xIfSJeo589SRPKtJSO6CrC0N3gnqFdUQkQTQqQAKRdo=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpSrRj68U/p+elB+9N3aoYvdhSDC7YOFbGLSNfp
 KbMubyRsamJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaUq0YwAKCRDBN2bmhouD
 177ND/sFOW/pfKDGyrzEKDFDw4TNKaSol0k/GvNREWzwA9tDVlKKyA7l2iLMNUKQ4Jq2Rdf9EBs
 lCtUbyx0EUBQ5xSWj/njjEJm9B5tmRpu6NTPjLIOp0cWcsJwOGMMvSt2ElIqfntgLYI+wqqSH1x
 /qk1IQu8064YWBlT7cfCEi/jidblqiSnL0pr71x6M8Bn51ixnZnyldlK+52SzcsOW3m82KKDWo1
 rqmLmbRIZYySdloozUSjth4gCs8IddBCFVstDKrm9Ea3kEomLg8bX3T4FJ78PN1dlVrufKncWnf
 ylTrxooWg98IQNljiOrSvwV4Pb8cbC85dTManad+AwqjVMf70fq/y8pluJjAjPq9MqT5nlbakR6
 OwnqMiD5xnOuUs6F2dQdyhl9wga/aTM5Eqx1c1j9GLK+csvhoAQQcbBlkcZBjy2/A0jAYqTVjs7
 hbu6xmEG5kbPNkXSUMidn3Q05QatrWTW3iDz8z0K1JzSd/+OVDNxCIr0LcM51FrgbM2a8PU+Voz
 aPWuCNeeHJb6tAcUqwrEKwb8wIEpXH0+KW2K2hRQjWQkHKkHkncC6EgnJSIrAMypMzA1x+Yol/7
 sSi/12RRuR4dUtUjie3q9hK7aGQ/Z4tH61E9mbH5cp5IYGLgQR88+Ht88Kb5yQkyxNxsQMjja2j RpC7F93WJ5KG2ew==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: DkMekZLxQwJTiv4F8A2uTgt-rXgiOCks
X-Proofpoint-ORIG-GUID: DkMekZLxQwJTiv4F8A2uTgt-rXgiOCks
X-Authority-Analysis: v=2.4 cv=cuKWUl4i c=1 sm=1 tr=0 ts=694ab46a cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=qe4J/qXhiWkb1JZGYKbLYA==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=ZcZdOxe6BgGqELRYw9UA:9 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDEyNyBTYWx0ZWRfXwG313xXGcsVC
 XF9XOM8n7Ut0Dv10eWVQDruEQ2me/mOBfLDsDcrHSwyH6KjcZwZXzt+7yOJZcgllhnn7IUWUHeS
 C7FQhraYygl+VWNFM+JLU7t46PJqknvtOlv+8pLOkr2h/T2KCWWTJ5ikNmLNXkudB574lFQk0q3
 rD8jL4xf8ba3ggCsOGjPrtnPYEjcEWzD6PYNs4HbPkV/9sq66hstZPyiTIQFEGIahn8FIyPHr+n
 4oKLx2Tr4OhkiFxY9Bko+3ajZBAiHiHkW56e9FnNtSm/3rxOYC/mahvG3WtaHC7S9D4vWSvYMwV
 te6QVvFhHe+i/HZK540aeJwcWA20117SeJFJEQU0zqlSjBfLexPMcy5Ldq33Hg4wEZxC/JW8iNc
 olUqnCL/PR/nfcJzHbctkgJQydFaDu6T5d+VMf/miNb6CsUmnw7hSJ4/AgoW1hZntvFbQR1uEXi
 dTmy3U0uOksbXYtDSAg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_03,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 lowpriorityscore=0 adultscore=0
 phishscore=0 clxscore=1015 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512230127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_072533_734964_E5714416 
X-CRM114-Status: GOOD (  12.13  )
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

DTS coding style prefers hyphens instead of underscores in the node
names.  Change should be safe, because node names are not considered an
ABI.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Patches done with sed, verified with comparing unflattened DTB and
dtx_diff.
---
 arch/arm64/boot/dts/airoha/en7581-evb.dts | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/airoha/en7581-evb.dts b/arch/arm64/boot/dts/airoha/en7581-evb.dts
index dae9968a4ff6..886e2e4b5f64 100644
--- a/arch/arm64/boot/dts/airoha/en7581-evb.dts
+++ b/arch/arm64/boot/dts/airoha/en7581-evb.dts
@@ -47,17 +47,17 @@ tclinux@600000 {
 			reg = <0x00600000 0x03200000>;
 		};
 
-		tclinux_slave@3800000 {
+		tclinux-slave@3800000 {
 			label = "tclinux_alt";
 			reg = <0x03800000 0x03200000>;
 		};
 
-		rootfs_data@6a00000 {
+		rootfs-data@6a00000 {
 			label = "rootfs_data";
 			reg = <0x06a00000 0x01400000>;
 		};
 
-		reserved_bmt@7e00000 {
+		reserved-bmt@7e00000 {
 			label = "reserved_bmt";
 			reg = <0x07e00000 0x00200000>;
 			read-only;
-- 
2.51.0


