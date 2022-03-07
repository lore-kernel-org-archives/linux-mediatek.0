Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4CD5C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Mar 2022 18:36:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:MIME-Version:Message-ID:Date
	:Subject:In-Reply-To:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=60t7xFDXXAkkQJs2SqRBEYsUKqGNk9Fg9WMM3jSd+9I=; b=XfyP8K7pbn6MSJ
	V4Q5mxWeSXUPJDyO1cdQRLgNeATT1ZErXXm2PjjyiEbqiawehynJTU1yfoAexQeC42SsZaCSnVXU9
	cG6D/yfakgtZ2o9Rl3TUpr2Kj0cZqSHGqM5XrFEMcVnu2GNqsP3xqD0m57x/6xSQdQNX5Q9Z/ZGCy
	qD8V2KJAjdSEbjJLFwEXJCRWHWK+ngNivWJ95ZVyHev8o7I9pCGN7TVsFNupNRu5JXHHenlCUoFB/
	T3+UThqZpeTdd3rJzxFlwOIwbuS54rzRVa62kGVHhLW7FlgZycb72nzhf6kv+9gNZqwXpDS4alIcc
	OV4FdTdrEj2rrdFwIa5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nRIDq-001BZ7-No; Mon, 07 Mar 2022 18:36:42 +0000
Received: from mailout2.samsung.com ([203.254.224.25])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nRIDm-001BXl-SN
 for linux-mediatek@lists.infradead.org; Mon, 07 Mar 2022 18:36:41 +0000
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
 by mailout2.samsung.com (KnoxPortal) with ESMTP id
 20220307183635epoutp02b7d0a37e8358924a200a13d8cc56405f~aLRglAS011166411664epoutp02R
 for <linux-mediatek@lists.infradead.org>; Mon,  7 Mar 2022 18:36:35 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com
 20220307183635epoutp02b7d0a37e8358924a200a13d8cc56405f~aLRglAS011166411664epoutp02R
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1646678195;
 bh=ExIE3wrKwqaUgqLiMKVI3cp5vvGy/x6hBKXpIM49F4w=;
 h=From:To:In-Reply-To:Subject:Date:References:From;
 b=taJuHdKHcgKz0PL8993KfntkWOF2ghDnnzse5urDxYvG1wAe2mWDZw7p+Gm6q6wGQ
 7NHHyHNeCX4zxyvsuE3C++bK4HIiUeSlOpF8X/0PzbmJaehxHTcuzATx0oPjfVsJWo
 e8u2Yqw7AyqhPNS+LG7hh2RmOQ/G+y9zgK21L1jo=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
 epcas5p2.samsung.com (KnoxPortal) with ESMTP id
 20220307183634epcas5p233b80f6bea41db7d43a57139f13a32e3~aLRfzWVh_1079210792epcas5p2a;
 Mon,  7 Mar 2022 18:36:34 +0000 (GMT)
Received: from epsmges5p3new.samsung.com (unknown [182.195.38.175]) by
 epsnrtp1.localdomain (Postfix) with ESMTP id 4KC6cF4BWXz4x9Pr; Mon,  7 Mar
 2022 18:36:29 +0000 (GMT)
Received: from epcas5p1.samsung.com ( [182.195.41.39]) by
 epsmges5p3new.samsung.com (Symantec Messaging Gateway) with SMTP id
 97.F0.05590.DA056226; Tue,  8 Mar 2022 03:36:29 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
 20220307183628epcas5p427d45efb6584bc887ff0af0b8123e56b~aLRZ75e9O1486114861epcas5p4_;
 Mon,  7 Mar 2022 18:36:28 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20220307183628epsmtrp2a5e9246039e346d85bb08b3ed6df6063~aLRZ67Lrc1234212342epsmtrp2l;
 Mon,  7 Mar 2022 18:36:28 +0000 (GMT)
X-AuditID: b6c32a4b-739ff700000015d6-9b-622650ada1d3
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 0A.32.29871.CA056226; Tue,  8 Mar 2022 03:36:28 +0900 (KST)
Received: from alimakhtar03 (unknown [107.122.12.5]) by epsmtip2.samsung.com
 (KnoxPortal) with ESMTPA id
 20220307183625epsmtip257cc95cc6f4a379d8a1668c8e8c86794~aLRXiEswm2556225562epsmtip2X;
 Mon,  7 Mar 2022 18:36:25 +0000 (GMT)
From: "Alim Akhtar" <alim.akhtar@samsung.com>
To: "'Krzysztof Kozlowski'" <krzysztof.kozlowski@canonical.com>, "'Avri
 Altman'" <avri.altman@wdc.com>, "'Rob Herring'" <robh+dt@kernel.org>, "'Andy
 Gross'" <agross@kernel.org>, "'Bjorn	Andersson'"
 <bjorn.andersson@linaro.org>, "'Wei Xu'" <xuwei5@hisilicon.com>, "'Matthias
 Brugger'" <matthias.bgg@gmail.com>, "'Jan Kotas'" <jank@cadence.com>, "'Li
 Wei'" <liwei213@huawei.com>, "'Stanley Chu'" <stanley.chu@mediatek.com>,
 "'Vignesh	Raghavendra'" <vigneshr@ti.com>, <linux-scsi@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-samsung-soc@vger.kernel.org>, <linux-mediatek@lists.infradead.org>
In-Reply-To: <20220306111125.116455-2-krzysztof.kozlowski@canonical.com>
Subject: RE: [PATCH v3 01/12] dt-bindings: ufs: add common platform bindings
Date: Tue, 8 Mar 2022 00:06:24 +0530
Message-ID: <000401d83252$41d5fe40$c581fac0$@samsung.com>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQHMSLK+HcMgkjgstDaV74uAa2rDeQH5avYoAUFFeK2ssjx4YA==
Content-Language: en-us
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrHJsWRmVeSWpSXmKPExsWy7bCmuu7aALUkgycPJC3OPf7NYvHy51U2
 i9P737FYzD9yjtWi+3imxca3P5gsNj2+xmoxcf9ZdovLu+awWVxuvshoMeP8PiaL7us72Cz+
 zjnCaNHUYmzRuvcIu8XSrTcZLf6f/cBu8eToFGYHIY81na+ZPGY19LJ57Jx1l93j8dyN7B4t
 R96yemxa1cnmcefaHjaPzUvqPVpO7mfxOH5jO5PH501yHu0HupkCeKKybTJSE1NSixRS85Lz
 UzLz0m2VvIPjneNNzQwMdQ0tLcyVFPISc1NtlVx8AnTdMnOAvlNSKEvMKQUKBSQWFyvp29kU
 5ZeWpCpk5BeX2CqlFqTkFJgU6BUn5haX5qXr5aWWWBkaGBiZAhUmZGcsbNvFVPBPrWLbsQvs
 DYw/5LsYOTgkBEwkjr5072Lk4hAS2M0oMfH/HGYI5xOjxLbdXewQzjdGid6ZS5i6GDnBOla2
 XWKDSOxllJjwso0VwnnJKLFi4wF2kCo2AV2JHYvb2EBsEYGLrBL3TuqD2JwCHhJXF69jBdkt
 LOAj8XtOOEiYRUBFYtv1U+wgYV4BS4mbr0JBwrwCghInZz5hAbGZBeQltr8FuQ7kBgWJn0+X
 sUJMd5J43N7CDFEjLvHy6BGwoyUE+jklpvftZYNocJF4dWwxVLOwxKvjW9ghbCmJz+9AakBB
 kS3Rs8sYIlwjsXTeMRYI217iwJU5LCAlzAKaEut36UOs4pPo/f2ECaKTV6KjTQiiWlWi+d1V
 qE5piYnd3awQJR4S034EQsLpJqPEx5bJjBMYFWYheXIWkidnIXlmFsLiBYwsqxglUwuKc9NT
 i00LjPNSy+GRnZyfu4kRnPC1vHcwPnrwQe8QIxMH4yFGCQ5mJRHe++dVkoR4UxIrq1KL8uOL
 SnNSiw8xmgIDfiKzlGhyPjDn5JXEG5pYGpiYmZmZWBqbGSqJ855K35AoJJCeWJKanZpakFoE
 08fEwSnVwHS5xdTOxIjBuozn+pa4nCOWjm8sX6ydIcl8g69Dn+/UtZ1KjW3qP8RWu1QvKNrd
 LHfw7K+9kScaLVLZD5zONsl+8lJQ/UNXFuOfXNu5WxdO8MxdnB72oyR3XbWRxSE/sTX+By7f
 9XK2dfKclGJlNIWxbuJHL5eGFSrc1pPfa0310lrX9Yk5zDCmXX7yzekqh2WqavvuJ4tYs+lN
 tdZwT5jY8OnX4XjVDbvLF7Zvn5JwY4X8j3lsXtxePkprXOYdP/hZlOtpzTVGxYubD0713r4x
 KWfmaW13pcffnReGLTghW+1t4jFZ/5Jmev3JTtYp85g5vqwLe+ZRu99y76aHMo8WlLkuKfd+
 OFu55tLnZCWW4oxEQy3mouJEAIXYBmGBBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA02Ra0hTYRjHe8/OzjmKi+Oy9qaUtUzJ0hQ1XmGUWsIhrAy0oj7ozJNJ7sKO
 pt1FbelEUrCyaZRp0cyirZyXLiudmZVpiZpgZWiNZZuWiA7JYq7Ib39+/wsPPBRP+Br3ptLl
 maxKLs0QE+64sU3sG1Qf758SUj8nQG9GZnFkdfQR6JXJjqOr5jd8VNyRjvS2GQwZRvr5qMzU
 RaLelioC9ea/Baii+wmGigeaCPSrygxQXkEYOvvYTKIbDYMA/e6aINFoezkvSsjUF41hjDa3
 hGCatR9IZuSKnmQKzDY+Y6grIpih/kcEc7/2DFPQacKZjveNGDNpWMmce1qMxXvsd5ekshnp
 R1nVxs3J7oer1S2Ycs4/x/i8h8wFM74a4EZBOhzq1O8IDXCnhPRDAF//rOG5DB84oC8lXXoJ
 1M1ZSFfIAqBueBx3GgQdBJtq1PNtL/ozH+r6tLgr1Qdg7ff2+ZQbzcC+mrt8DaCoJXQcnK3a
 68Q47QeNAy9JJxbQkXDwW6ITC2hP2Hl5FHdiHh0M1XrgxDzaFzbaqv7etgo6vtzkO7UXHQNH
 zhXwXBkRtLabyVIg1C5Y0v5f0i5Y0i5oXAN4HVjOKjlZmowLVYbK2exgTirjsuRpwQcVMgOY
 f3jguibQWDcR3AowCrQCSPHEXoJP3X4pQkGq9NhxVqVIUmVlsFwr8KFwsUjQo+lMEtJp0kz2
 CMsqWdU/F6PcvHOxi79KHFNplETLmo3Lw9s++t/OFI21CaqFiy95XLdv2LMm7OG4MS4u2RKQ
 nL/hJGcfniyy7S4feCELfLvdsOmO5FmC6f6ENVleCDzfLyt8pIgYT4h2mCqnjPbTYq8X3he3
 pvpOf6v0qziw+k7CUK9I3I9vsUWy8T550dEnehuuZzdMqxVl+84HjRsnz9yjO6JjclpzlnbX
 JMX/YJWJjlvSHTM/rOW71j+oyOXvOxuSbg0Zw+SN3LbjU6c8LE8VPyMrbx19uTM0ovuZ7pA9
 EF5g9ZaoiGsaSSJnT7j5tXlo96QEb3sFYrMBvSJgS+xGiaG2ZFHPamrtjpmULlIU0izGucPS
 0ECeipP+AZkLVZpfAwAA
X-CMS-MailID: 20220307183628epcas5p427d45efb6584bc887ff0af0b8123e56b
X-Msg-Generator: CA
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20220306111138epcas5p4adf7ac809dee20082ccb754767c8f61f
References: <20220306111125.116455-1-krzysztof.kozlowski@canonical.com>
 <CGME20220306111138epcas5p4adf7ac809dee20082ccb754767c8f61f@epcas5p4.samsung.com>
 <20220306111125.116455-2-krzysztof.kozlowski@canonical.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220307_103639_382083_34C99EAD 
X-CRM114-Status: GOOD (  14.74  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


Hi Krzysztof

>-----Original Message-----
>From: Krzysztof Kozlowski [mailto:krzysztof.kozlowski@canonical.com]
>Sent: Sunday, March 6, 2022 4:41 PM
>To: Alim Akhtar <alim.akhtar@samsung.com>; Avri Altman
><avri.altman@wdc.com>; Rob Herring <robh+dt@kernel.org>; Krzysztof
>Kozlowski <krzysztof.kozlowski@canonical.com>; Andy Gross
><agross@kernel.org>; Bjorn Andersson <bjorn.andersson@linaro.org>; Wei
>Xu <xuwei5@hisilicon.com>; Matthias Brugger <matthias.bgg@gmail.com>;
>Jan Kotas <jank@cadence.com>; Li Wei <liwei213@huawei.com>; Stanley Chu
><stanley.chu@mediatek.com>; Vignesh Raghavendra <vigneshr@ti.com>;
>linux-scsi@vger.kernel.org; devicetree@vger.kernel.org; linux-
>kernel@vger.kernel.org; linux-arm-msm@vger.kernel.org; linux-arm-
>kernel@lists.infradead.org; linux-samsung-soc@vger.kernel.org; linux-
>mediatek@lists.infradead.org
>Subject: [PATCH v3 01/12] dt-bindings: ufs: add common platform bindings
>
>Add bindings for common parts (platform) of Universal Flash Storage
>(UFS) Host Controllers in dtschema format.
>
>Include also the bindings directory in the UFS maintainers entry.
>
>Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
>---

Reviewed-by: Alim Akhtar <alim.akhtar@samsung.com>


> .../devicetree/bindings/ufs/ufs-common.yaml   | 82 +++++++++++++++++++
> MAINTAINERS                                   |  1 +
> 2 files changed, 83 insertions(+)
> create mode 100644 Documentation/devicetree/bindings/ufs/ufs-
>common.yaml
>
>diff --git a/Documentation/devicetree/bindings/ufs/ufs-common.yaml
>b/Documentation/devicetree/bindings/ufs/ufs-common.yaml
>new file mode 100644
>index 000000000000..47a4e9e1a775
>--- /dev/null
>+++ b/Documentation/devicetree/bindings/ufs/ufs-common.yaml
>@@ -0,0 +1,82 @@
>+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause %YAML 1.2
>+---
>+$id:
>+https://protect2.fireeye.com/v1/url?k=1c5f8d40-43c4b442-1c5e060f-0cc47a
>+31381a-044442c4c340dc87&q=1&e=f6b89910-3420-4a58-a18d-
>4ca02e079c2b&u=ht
>+tp%3A%2F%2Fdevicetree.org%2Fschemas%2Fufs%2Fufs-common.yaml%23
>+$schema:
>+https://protect2.fireeye.com/v1/url?k=bc24c591-e3bffc93-bc254ede-0cc47a
>+31381a-e9aaf10c3795a198&q=1&e=f6b89910-3420-4a58-a18d-
>4ca02e079c2b&u=ht
>+tp%3A%2F%2Fdevicetree.org%2Fmeta-schemas%2Fcore.yaml%23
>+
>+title: Common properties for Universal Flash Storage (UFS) Host
>+Controllers
>+
>+maintainers:
>+  - Alim Akhtar <alim.akhtar@samsung.com>
>+  - Avri Altman <avri.altman@wdc.com>
>+
>+properties:
>+  clocks: true
>+
>+  clock-names: true
>+
>+  freq-table-hz:
>+    items:
>+      items:
>+        - description: Minimum frequency for given clock in Hz
>+        - description: Maximum frequency for given clock in Hz
>+    description: |
>+      Array of <min max> operating frequencies in Hz stored in the same
order
>+      as the clocks property. If this property is not defined or a value
in the
>+      array is "0" then it is assumed that the frequency is set by the
parent
>+      clock or a fixed rate clock source.
>+
>+  interrupts:
>+    maxItems: 1
>+
>+  lanes-per-direction:
>+    $ref: /schemas/types.yaml#/definitions/uint32
>+    enum: [1, 2]
>+    default: 2
>+    description:
>+      Number of lanes available per direction.  Note that it is assume
same
>+      number of lanes is used both directions at once.
>+
>+  vdd-hba-supply:
>+    description:
>+      Phandle to UFS host controller supply regulator node.
>+
>+  vcc-supply:
>+    description:
>+      Phandle to VCC supply regulator node.
>+
>+  vccq-supply:
>+    description:
>+      Phandle to VCCQ supply regulator node.
>+
>+  vccq2-supply:
>+    description:
>+      Phandle to VCCQ2 supply regulator node.
>+
>+  vcc-supply-1p8:
>+    type: boolean
>+    description:
>+      For embedded UFS devices, valid VCC range is 1.7-1.95V or 2.7-3.6V.
This
>+      boolean property when set, specifies to use low voltage range of
>+      1.7-1.95V. Note for external UFS cards this property is invalid and
valid
>+      VCC range is always 2.7-3.6V.
>+
>+  vcc-max-microamp:
>+    description:
>+      Specifies max. load that can be drawn from VCC supply.
>+
>+  vccq-max-microamp:
>+    description:
>+      Specifies max. load that can be drawn from VCCQ supply.
>+
>+  vccq2-max-microamp:
>+    description:
>+      Specifies max. load that can be drawn from VCCQ2 supply.
>+
>+dependencies:
>+  freq-table-hz: [ 'clocks' ]
>+
>+required:
>+  - interrupts
>+
>+additionalProperties: true
>diff --git a/MAINTAINERS b/MAINTAINERS
>index d7ea92ce1b1d..ef16268b6ca6 100644
>--- a/MAINTAINERS
>+++ b/MAINTAINERS
>@@ -20100,6 +20100,7 @@ R:	Alim Akhtar <alim.akhtar@samsung.com>
> R:	Avri Altman <avri.altman@wdc.com>
> L:	linux-scsi@vger.kernel.org
> S:	Supported
>+F:	Documentation/devicetree/bindings/ufs/
> F:	Documentation/scsi/ufs.rst
> F:	drivers/scsi/ufs/
>
>--
>2.32.0



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
