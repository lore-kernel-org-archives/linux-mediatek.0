Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D7ECC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Apr 2022 13:44:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:From:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JSfNUwVz/FMyFQaQkq7R+9KWhZDVM2n6sjrVNqL6/YU=; b=K5fm/c/zc+4j0P
	bRUFbYC31cJ/NXGneM7XmlpjfTS0fOWz+vKW1p9cruS+GipjtJQKsFghMCgx8yHR2eLiAVeyjRhb8
	q+4I6/XID5tKrs3lGQfTzFaqcwbbEwsUubUpGFV9WAcAhNAWo2U4s35YgYurz3hDzmabzgbFqdIaP
	1poWvKOP2UvDRCzR84l4MSFF8fbXVxbF9+3U7bRWu6w1DNo2wtxqVBt17c/SbDhJZuunjL4BZaPkJ
	ci1XQ6lPFMnwGOwcO4Db7o557RaZ4KtDpb/iUXHQN6yRPEryF56HVDLjImudKqPUhD02ojot4eToZ
	KtnFgKNxa91P4SNORMPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ncou9-00HST4-Dx; Fri, 08 Apr 2022 13:44:01 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nconc-00HOmQ-JF; Fri, 08 Apr 2022 13:37:18 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 537431F47188
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1649425035;
 bh=Oofbdw+DqrbQDCnknn+6kDsqU6P4e3dcJAg3gndJN9Q=;
 h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
 b=W22+8vnwBDWrzaF/WLy1PPevdxj9XGdow2NL4TsRviA2vGMD7rvxeFZ5I7/1DwxhB
 3pXABJDAIr1lQMDYhUEHOb8ME1wQOZGwyprmTlCTze/UUNeQFEr7xlKeeGbF+ZXgP7
 +amN+o/dLOLK1dbC3XIdE9S3XSoTv0h9eR2MFy7H5vD9X5J2z0t1/8HSVVY7lgrbYg
 otp9zER/Ivs9C4qYcMg6t9MqEn52vORP2hWGxjy2WnlQj9lCRlWBLANKNvUxconRci
 e7TlfQyl5Pq//4LMjDdmP0zX4zlk8wm2etSTKYlhcQun4c090Ux4ccKlXhAwdkE53w
 0D+NxRns4X9RQ==
Message-ID: <88fac11e-e8a2-743f-41af-7b7e9e0fdfd3@collabora.com>
Date: Fri, 8 Apr 2022 15:37:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH V2 15/15] cpufreq: mediatek: Use device print to show logs
To: Rex-BC Chen <rex-bc.chen@mediatek.com>, rafael@kernel.org,
 viresh.kumar@linaro.org, robh+dt@kernel.org, krzk+dt@kernel.org
Cc: matthias.bgg@gmail.com, jia-wei.chang@mediatek.com,
 roger.lu@mediatek.com, hsinyi@google.com, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220408045908.21671-1-rex-bc.chen@mediatek.com>
 <20220408045908.21671-16-rex-bc.chen@mediatek.com>
Content-Language: en-US
In-Reply-To: <20220408045908.21671-16-rex-bc.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220408_063716_833214_A53203FA 
X-CRM114-Status: UNSURE (   4.80  )
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

Il 08/04/22 06:59, Rex-BC Chen ha scritto:
> Replace pr_* with dev_* to show logs.
> 
> Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>

That's very appreciated.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
