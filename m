Return-Path: <SRS0=lKUU=7K=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78033C433DF
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 May 2020 07:32:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4DCE8208E4
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 May 2020 07:32:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="M42yS5Xz";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="OD4rcbst"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4DCE8208E4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=samsung.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:MIME-Version:
	Date:Message-ID:From:To:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3LDeWq2ntT74A7p5PTQMZtZkRhrlZ1IYy/zuTXYsb1A=; b=M42yS5XzjwbIxu
	KnvnGlrxGSb3zjV7p1rUKkrztvM5fVaDZ5MAtTN+gXdv06ZNzBhgnfJuLJzAKeay44PVQwxbj4PwS
	lprCRJOaFAWb32o6iXrud4ypRABEND5hcadonSIW325pjqBw9bDHK5U12pf/hVSIkiS49YRkFahuL
	XpLQSwxPm1P0QkEPE6iz9uXRzANr9A2UnsGPf2cCAqlhpbfip0UHtY9+unVTuy0kZEgXZOkM1TVid
	++9pIKAVxDXb/rQJx3cpDqVfLFQU+oicDvjpR7L0C5i96IAhcb/NZVMyUrIz/UIR+j80oR6yKhGNo
	0lBABquA9m0VPxqGC20Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jeD1K-0007p6-20; Thu, 28 May 2020 07:32:06 +0000
Received: from mailout2.samsung.com ([203.254.224.25])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jeD1G-0007oM-Jt
 for linux-mediatek@lists.infradead.org; Thu, 28 May 2020 07:32:04 +0000
Received: from epcas1p2.samsung.com (unknown [182.195.41.46])
 by mailout2.samsung.com (KnoxPortal) with ESMTP id
 20200528073159epoutp02f389ba0309832b19e2f7569b0eaec5f1~TIMQWjbEe0756707567epoutp02Z
 for <linux-mediatek@lists.infradead.org>; Thu, 28 May 2020 07:31:59 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com
 20200528073159epoutp02f389ba0309832b19e2f7569b0eaec5f1~TIMQWjbEe0756707567epoutp02Z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1590651119;
 bh=1u5f9mHjA455o1d+uNuMnxBAjVQOMkQ7sV8wA55+hdc=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=OD4rcbstpxXZN4LAOYAvp5AkO2A8/kJZ5dUu8aYu8s8+FG08CWOtbMWYx/R3QLAEM
 9bNh7W0JToXF/Vl0A7SwtrXl/UrV+FFRr20aI3RuTQHkaYWSr+FKSvTmpFS2gF98SX
 uta9Yc51I/yRd2Lq+Uasp0ShK6nCMH14kKvvvqs8=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
 epcas1p3.samsung.com (KnoxPortal) with ESMTP id
 20200528073159epcas1p32ba7986a21e8bfa2d9cb8d1082e062c2~TIMP1w7Wl0579705797epcas1p3G;
 Thu, 28 May 2020 07:31:59 +0000 (GMT)
Received: from epsmges1p2.samsung.com (unknown [182.195.40.158]) by
 epsnrtp1.localdomain (Postfix) with ESMTP id 49XfXX29f9zMqYlv; Thu, 28 May
 2020 07:31:56 +0000 (GMT)
Received: from epcas1p3.samsung.com ( [182.195.41.47]) by
 epsmges1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 51.06.04645.CE86FCE5; Thu, 28 May 2020 16:31:56 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas1p4.samsung.com (KnoxPortal) with ESMTPA id
 20200528073155epcas1p430317922f66de75d7f3c3b87db1a951b~TIMMaD4rx3273632736epcas1p4F;
 Thu, 28 May 2020 07:31:55 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200528073155epsmtrp15b0474f5c8070c83fc6cf3a7c243d14c~TIMMYktc42350823508epsmtrp1g;
 Thu, 28 May 2020 07:31:55 +0000 (GMT)
X-AuditID: b6c32a36-f67ff70000001225-c6-5ecf68ec6a25
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 92.A5.08382.BE86FCE5; Thu, 28 May 2020 16:31:55 +0900 (KST)
Received: from [10.113.221.102] (unknown [10.113.221.102]) by
 epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200528073155epsmtip28024469710e4156a1c97c4f61e342f3e~TIML9YcXC1131011310epsmtip2c;
 Thu, 28 May 2020 07:31:55 +0000 (GMT)
Subject: Re: [PATCH 08/12] dt-bindings: devfreq: add compatible for mt8183
 cci devfreq
To: "Andrew-sh.Cheng" <andrew-sh.cheng@mediatek.com>, MyungJoo Ham
 <myungjoo.ham@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Rob
 Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Matthias
 Brugger <matthias.bgg@gmail.com>, "Rafael J . Wysocki" <rjw@rjwysocki.net>,
 Viresh Kumar <viresh.kumar@linaro.org>, Nishanth Menon <nm@ti.com>, Stephen
 Boyd <sboyd@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
 <broonie@kernel.org>
From: Chanwoo Choi <cw00.choi@samsung.com>
Organization: Samsung Electronics
Message-ID: <4087bcdb-a247-3d2d-96b2-16f965e8ba5c@samsung.com>
Date: Thu, 28 May 2020 16:42:16 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:59.0) Gecko/20100101
 Thunderbird/59.0
MIME-Version: 1.0
In-Reply-To: <20200520034307.20435-9-andrew-sh.cheng@mediatek.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrAJsWRmVeSWpSXmKPExsWy7bCmvu6bjPNxBlNf81tsX/+C1WLqwyds
 FvOPnGO1ONv0ht3i25UOJotNj6+xWlzeNYfN4nLzRUaLz71HGC2WXr/IZNHUYmxxu3EFm8Wb
 H2eZLM6cvsRq0br3CLvFv2sbWSym3xWy2PjVw0HIY828NYweO2fdZffYtKqTzePOtT1sHpuX
 1Hu0nNzP4rHlajuLR9+WVYwex29sZ/L4vEkugCsq2yYjNTEltUghNS85PyUzL91WyTs43jne
 1MzAUNfQ0sJcSSEvMTfVVsnFJ0DXLTMH6CUlhbLEnFKgUEBicbGSvp1NUX5pSapCRn5xia1S
 akFKToFlgV5xYm5xaV66XnJ+rpWhgYGRKVBhQnbG82WmBW3CFVNXPmRvYNzN38XIySEhYCJx
 6cp99i5GLg4hgR2MEpvmb2KBcD4xSqxp+sEG4XxjlFhy7y0bTMu5LdMYIRJ7GSUOn9vNDOG8
 Z5SYfGU1UxcjB4ewQITEvWUaIA0iAreZJSbMDgGpYRY4yCgx/dJFJpAEm4CWxP4XN8Cm8gso
 Slz98ZgRxOYVsJOYOfMPC8gcFgFViR3v7EHCogJhEie3tUCVCEqcnPmEBcTmFHCSeHOtGcxm
 FhCXuPVkPhOELS+x/e0csNskBCZzSny7sQHqAxeJx71f2SFsYYlXx7dA2VISL/vboOxqiZUn
 j7BBNHcwSmzZf4EVImEssX/pZLAnmQU0Jdbv0ocIK0rs/D2XEWIxn8S7rz2sICUSArwSHW1C
 ECXKEpcf3GWCsCUlFrd3sk1gVJqF5J1ZSF6YheSFWQjLFjCyrGIUSy0ozk1PLTYsMEKO7E2M
 4NSuZbaDcdE5n0OMAhyMSjy8HV7n4oRYE8uKK3MPMUpwMCuJ8DqdPR0nxJuSWFmVWpQfX1Sa
 k1p8iNEUGNgTmaVEk/OBeSevJN7Q1MjY2NjCxNDM1NBQSZx3/o8zcUIC6YklqdmpqQWpRTB9
 TBycUg2MEi844j+f0PA5veK+YAbnqcaVZ78ZqarWxid5bKlTnsR2t/iMlV2ML3flfd2ivmN6
 YTtfy71+7BfhfW35vSVc+qmLfI7s2Lxm06eJvT++buENCZJoXJntnPbs+7Kbb1avveRYq6v9
 R1DButiqZKfphZW7/4RXiCiGzS+R9L2h2LI5SWP1PR5FJZbijERDLeai4kQAkLRX9gMEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrPIsWRmVeSWpSXmKPExsWy7bCSvO7rjPNxBhdblCy2r3/BajH14RM2
 i/lHzrFanG16w27x7UoHk8Wmx9dYLS7vmsNmcbn5IqPF594jjBZLr19ksmhqMba43biCzeLN
 j7NMFmdOX2K1aN17hN3i37WNLBbT7wpZbPzq4SDksWbeGkaPnbPusntsWtXJ5nHn2h42j81L
 6j1aTu5n8dhytZ3Fo2/LKkaP4ze2M3l83iQXwBXFZZOSmpNZllqkb5fAlfF8mWlBm3DF1JUP
 2RsYd/N3MXJySAiYSJzbMo2xi5GLQ0hgN6NE44wXTBAJSYlpF48ydzFyANnCEocPF0PUvGWU
 2HriNTtIjbBAhMSRX4dYQBIiAveZJZbfvcoG4jALHGSUeNb9hx2i5SyjxO+lE1lBWtgEtCT2
 v7jBBmLzCyhKXP3xmBHE5hWwk5g58w8LyDoWAVWJHe/sQcKiAmESO5c8ZoIoEZQ4OfMJC4jN
 KeAk8eZaM5jNLKAu8WfeJWYIW1zi1pP5TBC2vMT2t3OYJzAKz0LSPgtJyywkLbOQtCxgZFnF
 KJlaUJybnltsWGCYl1quV5yYW1yal66XnJ+7iREc51qaOxi3r/qgd4iRiYPxEKMEB7OSCK/T
 2dNxQrwpiZVVqUX58UWlOanFhxilOViUxHlvFC6MExJITyxJzU5NLUgtgskycXBKNTAp7HQM
 YhDNmXKlxTg/9fBhIbmtKTomYus3/F7tHp/VP3Pvh3BnFs1jdpeur3RatYRhP2fVwoVan9o1
 DVe9b67huhtcULO1k+8zZ0Ny0PbqO996TRwt93/fwXEzlk1nT99E5g2nX+sed5KWfSPv+2rJ
 76Iy52g7FZvSDLZbS1+VqfH+5hdyXvT2eY8r33Venmvz8zML97fffPUt4so8hgtbvB6xSXAf
 qb271ULr/8WnbieOffc58fhXsGmmidMCReH/P+Zccwhb0popKqvVeL6+RzLm36wqdzXGTTLc
 6mwpmxWmbRGKevfTt05J/bzTf8sUdja/qQri27YHOESX7L93nuXu4S2LwtvCe46XRiqxFGck
 GmoxFxUnAgDII881YgMAAA==
X-CMS-MailID: 20200528073155epcas1p430317922f66de75d7f3c3b87db1a951b
X-Msg-Generator: CA
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20200520034339epcas1p1524dea2d7089cb3492384bbe917dcffe
References: <20200520034307.20435-1-andrew-sh.cheng@mediatek.com>
 <CGME20200520034339epcas1p1524dea2d7089cb3492384bbe917dcffe@epcas1p1.samsung.com>
 <20200520034307.20435-9-andrew-sh.cheng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200528_003202_895330_147FCEF4 
X-CRM114-Status: GOOD (  22.85  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi,

On 5/20/20 12:43 PM, Andrew-sh.Cheng wrote:
> This adds dt-binding documentation of cci devfreq
> for Mediatek MT8183 SoC platform.
> 
> Signed-off-by: Andrew-sh.Cheng <andrew-sh.cheng@mediatek.com>
> ---
>  .../devicetree/bindings/devfreq/mt8183-cci.yaml    | 51 ++++++++++++++++++++++
>  1 file changed, 51 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/devfreq/mt8183-cci.yaml
> 
> diff --git a/Documentation/devicetree/bindings/devfreq/mt8183-cci.yaml b/Documentation/devicetree/bindings/devfreq/mt8183-cci.yaml
> new file mode 100644
> index 000000000000..a7341fd94097
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/devfreq/mt8183-cci.yaml
> @@ -0,0 +1,51 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: https://protect2.fireeye.com/url?k=33f1f15d-6e23ea05-33f07a12-0cc47a31c8b4-91b3f8aeecce95dc&q=1&u=http%3A%2F%2Fdevicetree.org%2Fschemas%2Fdevfreq%2Fmt8183-cci.yaml%23
> +$schema: https://protect2.fireeye.com/url?k=fc7d9089-a1af8bd1-fc7c1bc6-0cc47a31c8b4-b46f5afc59faf86d&q=1&u=http%3A%2F%2Fdevicetree.org%2Fmeta-schemas%2Fcore.yaml%23
> +
> +title: CCI_DEVFREQ driver for MT8183.
> +
> +maintainers:
> +  - Andrew-sh.Cheng <andrew-sh.cheng@mediatek.com>
> +
> +description: |
> +  This module is used to create CCI DEVFREQ.
> +  The performance will depend on both CCI frequency and CPU frequency.
> +  For MT8183, CCI co-buck with Little core.
> +  Contain CCI opp table for voltage and frequency scaling.
> +
> +properties:
> +  compatible:
> +    const: "mediatek,mt8183-cci"
> +
> +  clocks:
> +    maxItems: 1
> +
> +  clock-names:
> +    const: "cci"
> +
> +  operating-points-v2: true
> +  opp-table: true
> +
> +  proc-supply:
> +    description:
> +      Phandle of the regulator that provides the supply voltage.
> +
> +required:
> +  - compatible
> +  - clocks
> +  - clock-names
> +  - proc-supply
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/mt8183-clk.h>
> +    cci: cci {
> +      compatible = "mediatek,mt8183-cci";
> +      clocks = <&apmixedsys CLK_APMIXED_CCIPLL>;
> +      clock-names = "cci";
> +      operating-points-v2 = <&cci_opp>;
> +      proc-supply = <&mt6358_vproc12_reg>;
> +    };
> +
> 

I recommend that add the more detailed example
with OPP table with CPU node.


-- 
Best Regards,
Chanwoo Choi
Samsung Electronics

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
