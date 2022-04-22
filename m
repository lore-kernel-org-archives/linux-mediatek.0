Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97F37C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Apr 2022 08:22:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vi5jMmS9Ufyn2NT1gy3n4c/u6jsh2I39Nr05BoG2+aw=; b=Edw4AZyaIT7o5D
	Gzhwxkh7cIcumpk5rakotVh0c5uFvvZdCc8ImwVjjSBq6bROvnq3xaIKcGOt5o/lQ215J/puQuOJY
	ljzSTRIAqBuYnBHf2xj4MU6V6bYGCXyzG/D9aYlWy+Hbrw5Rd0Kp+2n4bpkc1Nv0miLi1Ok45y3yc
	H5diTwrQJ+wm9KUK14CzBsMBDwX7JKaEDvsgB4GJAdb/5OEE02HlQ1ymKV8syjIJ6rm2pQBu6vet8
	cJVfIyvIe++bj66hiM+OU04JiB+hT+YCXXK9Uf54VbNukoc3gLZG/or0cRIfGnInlXi6i3sPnh5XX
	CI4MSaAJdvFZN1NutJxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhoYL-00HDdP-B9; Fri, 22 Apr 2022 08:22:09 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhoXK-00HD70-FA; Fri, 22 Apr 2022 08:21:07 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 059A61F46406
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1650615665;
 bh=QIm54JIClVLjKCBEEPy9YMxc/Ac5Y2PjXq4q3B6M4GQ=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=l8FDs786vwy0HCJQBNttfdqS+Ym4yYcIa22IKSkcG9eu7svyigwd1mtH6/YuZVnsE
 k8XBxf6VVg1PiN/iVdBBdwD3jTHdi9w51Q2QKkA9JJKMiGDte5+odyCea3LDqsYt+o
 14YQ80FKfJeouxikY7l0c3jJANQeF3/mToYr0lChhXmghpD44OvoRwEsJdR0ZqOd+J
 AIDENiilBWE7RbWzQdOAGnqIOquDqkbnBjHnAeRM2Ey2QmfnpwS6M+dqMrohquV7gn
 WYAiTE0kkeegEFP9cG1iCfHgcfSq37D2fqyJqBXmLyAkvHCBeS+jUhR4FcMP5DwnOa
 joYuTsFH/MVxg==
Message-ID: <f8f9bfa4-8591-0399-73a9-6e4b7261df07@collabora.com>
Date: Fri, 22 Apr 2022 10:21:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH V4 04/14] cpufreq: mediatek: Record previous target vproc
 value
Content-Language: en-US
To: Rex-BC Chen <rex-bc.chen@mediatek.com>, rafael@kernel.org,
 viresh.kumar@linaro.org, robh+dt@kernel.org, krzk+dt@kernel.org,
 matthias.bgg@gmail.com
Cc: jia-wei.chang@mediatek.com, roger.lu@mediatek.com, hsinyi@google.com,
 khilman@baylibre.com, linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 "Andrew-sh . Cheng" <andrew-sh.cheng@mediatek.com>
References: <20220422075239.16437-1-rex-bc.chen@mediatek.com>
 <20220422075239.16437-5-rex-bc.chen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220422075239.16437-5-rex-bc.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220422_012106_713068_AF09DA1B 
X-CRM114-Status: UNSURE (   8.26  )
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
> We found the buck voltage may not be exactly the same with what we set
> because CPU may share the same buck with other module.
> Therefore, we need to record the previous desired value instead of reading
> it from regulators.
> 
> Signed-off-by: Andrew-sh.Cheng <andrew-sh.cheng@mediatek.com>
> Signed-off-by: Jia-Wei Chang <jia-wei.chang@mediatek.com>
> Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
