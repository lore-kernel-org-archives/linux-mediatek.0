Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AB4CC61DA4
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Feb 2023 10:15:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l0pdh128uin0yI8p+NWmqgHE0m1SYwTxtVx2OIsVqnY=; b=UDmWZgXVgqFDAk75iVPf8BGr9R
	iH28kwCGx1td5HdvUZp5MG3j5H8oZBwAkdnDfy4OKZmC2gT+6rPKsitecPBtGju03HEEfBunDsszu
	GXIZR+SRdGWRYX0zWWBJaB/EAco8yvFQ+Hyrl4jnGcD0Png5o/aRAdmKx7zd/mBkw44sbr/nvIpA9
	EOU4tBhpNXoYyHArx0fo8OCS6+4AZDmjS4W7AOmm5Y22YcC8sJQYt1rcFb8iKn67gZke6H0/uPjn9
	QiNNCbpT5jbRaOYdWUiB6lE29b5ZmP13lA1I2D1KaYCI8oZo0xi9waQTnne2D3f4aU78Z43996WVX
	gudtO/Ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUmA1-00BpEK-UM; Wed, 22 Feb 2023 10:15:41 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUlTe-00BSlF-5o; Wed, 22 Feb 2023 09:31:55 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 05EF2660215E;
	Wed, 22 Feb 2023 09:31:50 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1677058312;
	bh=1lE1OslcJ9wYx7+VSxskvVNIYTnaQOYKkobjRYQj4dU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=fNqS92UtTTmnYL44uUoVOXGdbFhawrBTSQwnwKyKZ09UEG7V4dFp6jMil/WtZ6ahq
	 hc4KWcvlNnLOM+opaWBThffBDaRw0ywF66FK4qbN+DNWo4ABvqab1qq4JbUFeXqZfP
	 rid3K50NzV9nVVxRHyu9rw+q/ldFNm5GMM1FTA42SDS6TdSPSh933vmQv8TSjn9lvP
	 mmURzlSOCZGhEVI1V2t4oO9ebr/Y0dfuDKyMWu+ZsYzImYozCz6yDwfYJBJg+1+X4V
	 8nRALLTkyQ89KDYQwLmrcq5sZUsWvLjbPIkuZ9/nE5H5HLt5mwtfVUFSny9Nlhexkc
	 LuB1bOv1DTrlg==
Message-ID: <11c4f142-793c-3ad4-bb58-1df5b0c5fc3c@collabora.com>
Date: Wed, 22 Feb 2023 10:31:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 09/16] thermal: Do not access 'type' field, use the tz
 id instead
Content-Language: en-US
To: Daniel Lezcano <daniel.lezcano@linaro.org>, rafael@kernel.org
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Ido Schimmel <idosch@nvidia.com>, Zhang Rui <rui.zhang@intel.com>,
 Len Brown <lenb@kernel.org>, Petr Machata <petrm@nvidia.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Amit Kucheria <amitk@kernel.org>, Eduardo Valentin <edubezval@gmail.com>,
 Keerthy <j-keerthy@ti.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Balsam CHIHI <bchihi@baylibre.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 "open list:ACPI THERMAL DRIVER" <linux-acpi@vger.kernel.org>,
 "open list:MELLANOX ETHERNET SWITCH DRIVERS" <netdev@vger.kernel.org>,
 "open list:TI BANDGAP AND THERMAL DRIVER" <linux-omap@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>
References: <20230221180710.2781027-1-daniel.lezcano@linaro.org>
 <20230221180710.2781027-10-daniel.lezcano@linaro.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230221180710.2781027-10-daniel.lezcano@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230222_013154_410194_82367D12 
X-CRM114-Status: GOOD (  12.29  )
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

Il 21/02/23 19:07, Daniel Lezcano ha scritto:
> The 'type' field is used as a name in the message. However we can have
> multiple thermal zone with the same type. The information is not
> accurate.
> 
> Moreover, the thermal zone device structure is directly accessed while
> we want to improve the self-encapsulation of the code.
> 
> Replace the 'type' in the message by the thermal zone id.
> 
> Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
> Reviewed-by: Ido Schimmel <idosch@nvidia.com> #mlxsw

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com> 
#MediaTek LVTS




