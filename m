Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25895C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Apr 2022 12:38:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Subject:To:
	MIME-Version:From:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sPCMtFFGDKKNCruLtiTD7uR+mvICLMT3tH2uuFf6g3Q=; b=KvRwUdyLl5TIa/
	3JLYRhN92W/tWes5D4A+5YvPyKTYOBibwV+7V/Vv5cKYGEs+0eT+35mW9WB57Qizwqy48uJE55/Ni
	tfY494Nxt0SRZZ6lXmUml+JaVpX8OujudWWPi3SQfhP7kFMGdOI+Snq3kX/s1xefym/nZqHwZtUKy
	os2m7GCf+bz+S39fXbGIOz2jhwZz5ZocWPuhuQ3xj6ELHZnYtakBmmhSaFLoX9tuWGcNMT+kYuHim
	L4eT3Nlr82C8cEf3FbU9U31DqCkzju4dtdwEVr0f7cHu3dxwhK07FyZIHj/B4+TvWY07hEvnp41sK
	AI9xOr/HwWMwl+i19Jxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ngn84-003YIo-Q4; Tue, 19 Apr 2022 12:38:48 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ngm8X-003AH3-QV; Tue, 19 Apr 2022 11:35:15 +0000
Received: from kwepemi500011.china.huawei.com (unknown [172.30.72.54])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4KjM9K12jxzFqS9;
 Tue, 19 Apr 2022 19:32:37 +0800 (CST)
Received: from [127.0.0.1] (10.67.102.125) by kwepemi500011.china.huawei.com
 (7.221.188.124) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Tue, 19 Apr
 2022 19:35:06 +0800
Message-ID: <625E9E69.2060008@hisilicon.com>
Date: Tue, 19 Apr 2022 19:35:05 +0800
From: Wei Xu <xuwei5@hisilicon.com>
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64;
 rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Stanley Chu
 <stanley.chu@mediatek.com>, Alim Akhtar <alim.akhtar@samsung.com>, Andy Gross
 <agross@kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, Jan Kotas <jank@cadence.com>, Rob
 Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski@canonical.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Li Wei <liwei213@huawei.com>, Avri Altman
 <avri.altman@wdc.com>, <devicetree@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, Vignesh Raghavendra <vigneshr@ti.com>,
 <linux-arm-msm@vger.kernel.org>, <linux-samsung-soc@vger.kernel.org>,
 <linux-scsi@vger.kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: (subset) [PATCH v3 09/12] arm64: dts: hisilicon: align
 'freq-table-hz' with dtschema in UFS
References: <20220306111125.116455-1-krzysztof.kozlowski@canonical.com>
 <20220306111125.116455-10-krzysztof.kozlowski@canonical.com>
 <165036314214.180327.9388318751451146287.b4-ty@linaro.org>
In-Reply-To: <165036314214.180327.9388318751451146287.b4-ty@linaro.org>
X-Originating-IP: [10.67.102.125]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemi500011.china.huawei.com (7.221.188.124)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220419_043514_133029_B69CCAA5 
X-CRM114-Status: UNSURE (   5.47  )
X-CRM114-Notice: Please train this message.
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

Hi Krzysztof,

On 2022/4/19 18:12, Krzysztof Kozlowski wrote:
> On Sun, 6 Mar 2022 12:11:22 +0100, Krzysztof Kozlowski wrote:
>> The DT schema expects 'freq-table-hz' property to be an uint32-matrix,
>> which is also easier to read.
>>
>>
> 
> Applied, thanks!
> 
> [09/12] arm64: dts: hisilicon: align 'freq-table-hz' with dtschema in UFS
>         commit: 65b96377bf9130617ced41f317f3ec387d3e0dc3
> 

Thanks!

Best Regards,
Wei

> Best regards,
> 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
