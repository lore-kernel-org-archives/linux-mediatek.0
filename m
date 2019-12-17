Return-Path: <SRS0=Z+8g=2H=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E05C0C43603
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Dec 2019 02:32:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B1B30218AC
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Dec 2019 02:32:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="O7bM8iEP";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="qFYMvuRy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B1B30218AC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=samsung.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:MIME-Version:
	Date:Message-ID:From:To:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7Y1+yaF6I3QM711rFl4Ecy8bBiXjSTTbgv8JyemE5us=; b=O7bM8iEP1NgHky
	Qz5r3KgeESvtUbKPPV6n5wFxrGd+03wlxrMN7LgrfjU8qxyQirvnGADLZfcJDz4tV+E5mZ4/lV7ZB
	fRIhg/aiDpGJ2Vw97wUMGrbwV8eTHzyLtjCMGkVKrOmJZ1Y0pF5m4GKuCF0HX8N9cgW4JCsldwi6S
	AfI9H7C9O+eDPEkRqpNjEXOd4w68UcklWKSRtoC8kYZwYVqki9scpVWsDws442Vt3S7UgfFAtKdeW
	GaTHu0rtnsQMf/lbX4FBp6wDbPgPbHo9jO7OV+3+prS73pimMEGSLe2U7KgLbyt1u9QW7GnC7d2SA
	yfqvCcfx3ErSkfPxx1AA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ih2ep-0004Ly-M8; Tue, 17 Dec 2019 02:32:19 +0000
Received: from mailout1.samsung.com ([203.254.224.24])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ih2em-0004Kd-IV
 for linux-mediatek@lists.infradead.org; Tue, 17 Dec 2019 02:32:18 +0000
Received: from epcas1p3.samsung.com (unknown [182.195.41.47])
 by mailout1.samsung.com (KnoxPortal) with ESMTP id
 20191217023212epoutp015e5c31377d035d17df56a6bfe6ec9153~hB8_HMu_c1557915579epoutp01N
 for <linux-mediatek@lists.infradead.org>; Tue, 17 Dec 2019 02:32:12 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com
 20191217023212epoutp015e5c31377d035d17df56a6bfe6ec9153~hB8_HMu_c1557915579epoutp01N
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1576549932;
 bh=mMgaBAjJ5TOxfqNYEjY0AzqFRyeAhiQmYb1750iLmJY=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=qFYMvuRyoT3erZtiyejMkF6SAlNXrIghNEfq15mk6Io2Y1XQInU+7DNBeZziaTHKc
 xTr+mHuPS0HZUzh9pNt9SSbfIHBG7jZARx22rQUVXXr6Gyciwk+7hbKMxUwlIugo7X
 pED8qMKNBOCh+7q69fLt+ovWqgP43l5s5Cohk8pc=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
 epcas1p2.samsung.com (KnoxPortal) with ESMTP id
 20191217023211epcas1p29255cdf63c8f0d1fdbaca5c7f1d571d5~hB89fCwCJ2705127051epcas1p2r;
 Tue, 17 Dec 2019 02:32:11 +0000 (GMT)
Received: from epsmges1p5.samsung.com (unknown [182.195.40.158]) by
 epsnrtp1.localdomain (Postfix) with ESMTP id 47cMbr2j3gzMqYlx; Tue, 17 Dec
 2019 02:32:08 +0000 (GMT)
Received: from epcas1p4.samsung.com ( [182.195.41.48]) by
 epsmges1p5.samsung.com (Symantec Messaging Gateway) with SMTP id
 37.62.51241.52E38FD5; Tue, 17 Dec 2019 11:32:05 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20191217023205epcas1p22da079575ecabcd27216985c27dacbb4~hB83U5Rm-2929129291epcas1p2G;
 Tue, 17 Dec 2019 02:32:05 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20191217023205epsmtrp2042d1da9ef4380ac08eae62d2f1fe5ef~hB83T_kAa2622726227epsmtrp2C;
 Tue, 17 Dec 2019 02:32:05 +0000 (GMT)
X-AuditID: b6c32a39-14bff7000001c829-14-5df83e2553f4
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 75.6C.10238.42E38FD5; Tue, 17 Dec 2019 11:32:05 +0900 (KST)
Received: from [10.113.221.102] (unknown [10.113.221.102]) by
 epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20191217023204epsmtip236f0b41761dc42ae328c48f973093a02~hB82_kLk_2632626326epsmtip2S;
 Tue, 17 Dec 2019 02:32:04 +0000 (GMT)
Subject: Re: [v5, PATCH 2/5] dt-bindings: devfreq: add compatible for mt8183
 cci devfreq
To: "Andrew-sh.Cheng" <andrew-sh.cheng@mediatek.com>, MyungJoo Ham
 <myungjoo.ham@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Rob
 Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Matthias
 Brugger <matthias.bgg@gmail.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 Viresh Kumar <viresh.kumar@linaro.org>, Nishanth Menon <nm@ti.com>, Stephen
 Boyd <sboyd@kernel.org>
From: Chanwoo Choi <cw00.choi@samsung.com>
Organization: Samsung Electronics
Message-ID: <2c875e5e-bd57-3d67-5995-8a450735dbda@samsung.com>
Date: Tue, 17 Dec 2019 11:38:39 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:59.0) Gecko/20100101
 Thunderbird/59.0
MIME-Version: 1.0
In-Reply-To: <1574769046-28449-3-git-send-email-andrew-sh.cheng@mediatek.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrDJsWRmVeSWpSXmKPExsWy7bCmga6q3Y9Yg4btehbb179gtZh/5Byr
 xbc7v5kszja9YbfY9Pgaq8XlXXPYLC43X2S0+Nx7hNFi6fWLTBZNLcYWtxtXsFm8+XGWyeLM
 6UusFq17j7Bb/Lu2kcVi+l0hi41fPRwEPdbMW8PosXPWXXaPTas62TzuXNvD5rF5Sb1Hy8n9
 LB5brrazePRtWcXocfzGdiaPz5vkAriism0yUhNTUosUUvOS81My89JtlbyD453jTc0MDHUN
 LS3MlRTyEnNTbZVcfAJ03TJzgL5RUihLzCkFCgUkFhcr6dvZFOWXlqQqZOQXl9gqpRak5BRY
 FugVJ+YWl+al6yXn51oZGhgYmQIVJmRnPLm6gqmgT6Di3aSFLA2Mq3i7GDk4JARMJOa2FXcx
 cnIICexglFi7urCLkQvI/sQosbrhCCuE841R4vHGj6wgVWAN5/tZIBJ7GSW2HbgH5bxnlLjx
 9DEzSJWwQJTEnjOLGEESIgKTmCUmbH7ACJJgFrjFKPF6PxuIzSagJbH/xQ0wm19AUeLqj8dg
 NbwCdhKfeuawgNgsAqoSV193g9miAmESJ7e1QNUISpyc+QQszingK7F83Rc2iPniEreezGeC
 sOUltr+dwwxyhITALXaJXcdfskP84CLxueUoC4QtLPHq+BaouJTE53d72SDsaomVJ4+wQTR3
 MEps2X8BGgDGEvuXTmYChR6zgKbE+l36EGFFiZ2/50I9ySfx7msPKySAeSU62oQgSpQlLj+4
 ywRhS0osbu9km8CoNAvJO7OQvDALyQuzEJYtYGRZxSiWWlCcm55abFhgihzbmxjBKV3Lcgfj
 sXM+hxgFOBiVeHglSr7HCrEmlhVX5h5ilOBgVhLh3aEAFOJNSaysSi3Kjy8qzUktPsRoCgzt
 icxSosn5wHyTVxJvaGpkbGxsYWJoZmpoqCTOy/HjYqyQQHpiSWp2ampBahFMHxMHp1QDo4Rk
 1oukyb7iMXw/qyynHDAqaZr0erpB7r0dymY1RzX/Z1kE3zVdxLjrv/S57ld5m2Wq+JS2z7on
 vvEws4a8ediZMKXVJs5hBa7sm//O3t2qWTmtKTZ7pkXQ19/W0RFFycXTnRmS/fXdW388eN2o
 NP+hVw/D8YdZffUMM2f63Lx/UNihp99WiaU4I9FQi7moOBEADvC/vv8DAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrBIsWRmVeSWpSXmKPExsWy7bCSvK6q3Y9YgwUTmC22r3/BajH/yDlW
 i293fjNZnG16w26x6fE1VovLu+awWVxuvsho8bn3CKPF0usXmSyaWowtbjeuYLN48+Msk8WZ
 05dYLVr3HmG3+HdtI4vF9LtCFhu/ejgIeqyZt4bRY+esu+wem1Z1snncubaHzWPzknqPlpP7
 WTy2XG1n8ejbsorR4/iN7UwenzfJBXBFcdmkpOZklqUW6dslcGU8ubqCqaBPoOLdpIUsDYyr
 eLsYOTkkBEwk5p7vZwGxhQR2M0rMXscFEZeUmHbxKHMXIweQLSxx+HBxFyMXUMlbRon3TZNY
 QWqEBaIk9pxZxAiSEBGYxizx9N9rNhCHWeAWo8Sm5iPsEC2PGSVm/XrCCNLCJqAlsf/FDTYQ
 m19AUeLqj8dgcV4BO4lPPXPAzmARUJW4+robzBYVCJPYueQxE0SNoMTJmU/A4pwCvhLL130B
 m8MsoC7xZ94lZghbXOLWk/lMELa8xPa3c5gnMArPQtI+C0nLLCQts5C0LGBkWcUomVpQnJue
 W2xYYJiXWq5XnJhbXJqXrpecn7uJERzfWpo7GC8viT/EKMDBqMTDK1HyPVaINbGsuDL3EKME
 B7OSCO8OBaAQb0piZVVqUX58UWlOavEhRmkOFiVx3qd5xyKFBNITS1KzU1MLUotgskwcnFIN
 jBbX55vUrH7S/c1o94KH6exT/B6aql46KCHhJDBjb8JC51S5Ws3DmlH3FffVJKx5uDXYraDk
 /5mHD77+09z6ZPqZLbyf1PoT+je+jLxoJKA4bY4db1ZyHif3hXKrlXkH1ya+SnB8c2adyuem
 HVocmiZ7D2jNWtL9bZ7SpDT1+sh0Du3zPkxzfJRYijMSDbWYi4oTAUP8nyHrAgAA
X-CMS-MailID: 20191217023205epcas1p22da079575ecabcd27216985c27dacbb4
X-Msg-Generator: CA
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20191126115134epcas5p43ec69b25093165dad94f95e9213804cb
References: <1574769046-28449-1-git-send-email-andrew-sh.cheng@mediatek.com>
 <CGME20191126115134epcas5p43ec69b25093165dad94f95e9213804cb@epcas5p4.samsung.com>
 <1574769046-28449-3-git-send-email-andrew-sh.cheng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191216_183216_859165_475BF117 
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
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, fan.chen@mediatek.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi,

On 11/26/19 8:50 PM, Andrew-sh.Cheng wrote:
> From: "Andrew-sh.Cheng" <andrew-sh.cheng@mediatek.com>
> 
> This adds dt-binding documentation of cci devfreq
> for Mediatek MT8183 SoC platform.
> 
> Signed-off-by: Andrew-sh.Cheng <andrew-sh.cheng@mediatek.com>
> ---
>  .../bindings/devfreq/mt8183-cci-devfreq.txt          | 20 ++++++++++++++++++++

mt8183-cci.txt is better without 'devfreq' word.

I recommend to make the binding document with yaml.
You can refer to the example[1]
[1] https://git.kernel.org/pub/scm/linux/kernel/git/chanwoo/linux.git/commit/?h=devfreq-next&id=6ad0b4fb960c3bc32034d8f3ec7609c8bcb8d9a4

>  1 file changed, 20 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/devfreq/mt8183-cci-devfreq.txt
> 
> diff --git a/Documentation/devicetree/bindings/devfreq/mt8183-cci-devfreq.txt b/Documentation/devicetree/bindings/devfreq/mt8183-cci-devfreq.txt
> new file mode 100644
> index 000000000000..a65a70bb9f09
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/devfreq/mt8183-cci-devfreq.txt
> @@ -0,0 +1,20 @@
> +* Mediatek Cache Coherent Interconnect(CCI) frequency device

recommend to add the more detailed description 
of what is the role of this driver.

> +
> +Required properties:
> +- compatible: should contain "mediatek,mt8183-cci" for frequency scaling of CCI
> +- clocks: for frequency scaling of CCI
> +- clock-names: for frequency scaling of CCI driver to reference

	

> +- regulator: for voltage scaling of CCI
> +- operating-points-v2: for frequency scaling of CCI opp table
> +
> +Example:
> +	cci: cci {
> +		compatible = "mediatek,mt8183-cci";
> +		clocks = <&apmixedsys CLK_APMIXED_CCIPLL>;
> +		clock-names = "cci_clock";

Recommend to use 'cci' without '_clock' because we can
know that it's clock name event if '_clock'.

> +		operating-points-v2 = <&cci_opp>;
> +	};
> +
> +	&cci {
> +		proc-supply = <&mt6358_vproc12_reg>;
> +	};
> \ No newline at end of file
> 


-- 
Best Regards,
Chanwoo Choi
Samsung Electronics

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
