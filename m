Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4FB1C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Apr 2022 08:21:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9dZygo8s58OwRWMemO8nUzwX/VWHBvV5sDN7Mkl066M=; b=xDEHve2TMx6q4U
	2JO5I9yzaxT5UiHFUbPE8egvhkDl8sGvU0c6TryzG0LDeLHvBZCKoc0eAPppytn2GWzjGrYguP27t
	cIAWSc8A5xZ8vmK248nlVwOobJZEeFUpedS/KPJL6ic5HWcOaHE3tXqmByeSupMtt/sQlnqtq2qeD
	suS+uILtX0YvsyhHLWPNpywlC1UzQqWboc89VF69PKAnRR+mTX4zxFufZYn5rtIZTnJrejoVDyZle
	qjwBMQAqO2gIMzeuepffaxQRGP9UpNlbIIQWvGypxZDq4Y6mdLpr5V1FwsOjjVz6jQ4O6xl9frt5k
	1juxfl2XM2N3mNw1CLnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhoY0-00HDRZ-Ra; Fri, 22 Apr 2022 08:21:48 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhoXJ-00HD5z-1Z; Fri, 22 Apr 2022 08:21:06 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id EE91B1F46408
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1650615663;
 bh=6GDE5GL5KCBI5XfEVRdtC/piNEJkhyMxk2/3f9Ecc8E=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=KL2qVbH/rQ2F1j1SK9HSKegv6K5JwRTxwXUwWmbiEyXdVY8n89NVTaWZEyHYxStX/
 dDy51YxgEtnMis3zEY3+whSDInWvP+j1CxPgOql8cRJcaJ8biK5vwhD/DXk5SwRonr
 kl+vA/weEx8GrZhwX6nf+y/Aj/zVvCX67IJ5y+5BL0EY+IMARmzHuW0Y1d+pq128JM
 ZJqloQ5q/z410s8JW//+Yvk62ulMQyKYHepAHqdgIIAT887I2PtLwG1F5uQcQz/Hh6
 e/z1Axtzz3ncBEEhNxVxqepGJrjC2bS8C1pl+LbfWFhwsU4ya41M2KMNSWm+YgtG/6
 MPTWez6SJDJ6g==
Message-ID: <0b246114-e200-8866-748b-2d04f507d292@collabora.com>
Date: Fri, 22 Apr 2022 10:21:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH V4 07/14] cpufreq: mediatek: Add .get function
Content-Language: en-US
To: Rex-BC Chen <rex-bc.chen@mediatek.com>, rafael@kernel.org,
 viresh.kumar@linaro.org, robh+dt@kernel.org, krzk+dt@kernel.org,
 matthias.bgg@gmail.com
Cc: jia-wei.chang@mediatek.com, roger.lu@mediatek.com, hsinyi@google.com,
 khilman@baylibre.com, linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220422075239.16437-1-rex-bc.chen@mediatek.com>
 <20220422075239.16437-8-rex-bc.chen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220422075239.16437-8-rex-bc.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220422_012105_268396_3C384C98 
X-CRM114-Status: UNSURE (   7.18  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 22/04/22 09:52, Rex-BC Chen ha scritto:
> From: Jia-Wei Chang <jia-wei.chang@mediatek.com>
> 
> We want to get opp frequency via opp table. Therefore, we add the function
> "mtk_cpufreq_get()" to do this.
> 
> Signed-off-by: Jia-Wei Chang <jia-wei.chang@mediatek.com>
> Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
