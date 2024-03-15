Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A42B9C54E60
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Mar 2024 02:41:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AV/KB8asYXTQ5aL5cGfwpczprSp3C033KzHYtpnu3xQ=; b=Kj9HyRjIzXO91cnwz10sH/jcVr
	xEi6erk/NUOi4O16J4YqnT/VnvzsZo5PcILePuyIxJqsVy/qxPZenCtncN8g3bu6lI0Q7MY2VBapo
	WWdZN738OSVcuwU3yHgr2BtHA1M5+riZSQFJ1rfrzy1B0zs2a/NFALcYJZDQHDMMqZ3li46jaZUHd
	zqYeMnoqlY9qVPhfAE05mV1ZCNYwPSr4LKiE7KMOZ/ETpHb6YnD+PalV2QKIsfygV21BtuEUvvRzz
	PvLA/A1NFNubb+7T54mFKJAIr5mqW/ZmMaCuTvIhB2/oZEVzt12ucynm9XhE8v9SWlzJW+wH/MMTf
	4czAGVqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkxVK-0000000GRm5-47gE;
	Fri, 15 Mar 2024 02:41:06 +0000
Received: from 009.lax.mailroute.net ([199.89.1.12])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkxVI-0000000GRlR-0Jzf
	for linux-mediatek@lists.infradead.org;
	Fri, 15 Mar 2024 02:41:05 +0000
Received: from localhost (localhost [127.0.0.1])
	by 009.lax.mailroute.net (Postfix) with ESMTP id 4TwpQl49NJzlgVnf;
	Fri, 15 Mar 2024 02:41:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:references:content-language:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1710470459; x=1713062460; bh=AV/KB8asYXTQ5aL5cGfwpczp
	rSp3C033KzHYtpnu3xQ=; b=Sg83dDfmlxGtZWx1rN7jjUUDSzTKOpp73MZG8bG7
	jWNqWlDC3HDy4+ElMZHSSt5qPfqsakmydsr6JLQ2TJjIedwswnUCKBQh25UHf1S+
	Iww+s4/nEIYG0aeX2fbmjWCW1PSUPSyt8Exdwg51DowEQYwpxO00jb4KdaVmaYfx
	x4tALt4Kidvg7Ha/sLv+1qh5DHSCVRUsLjSrgNbvBBn4/DF5N8Dbp/Yp4/aYgawJ
	5rYGrtEIcrC3vJ35OY/EEQztHu9hm2BpJ4cupB4VVwscqhBJMRpcLlx/0ixmPU16
	5Gj9cKg6KZ0Fz2VpIJOVDUnYCA3uIkBO283jF4bioiBLTQ==
X-Virus-Scanned: by MailRoute
Received: from 009.lax.mailroute.net ([127.0.0.1])
 by localhost (009.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id jPI_V_cXvcRZ; Fri, 15 Mar 2024 02:40:59 +0000 (UTC)
Received: from [192.168.51.14] (c-73-231-117-72.hsd1.ca.comcast.net [73.231.117.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 009.lax.mailroute.net (Postfix) with ESMTPSA id 4TwpQY47fbzlgVnW;
	Fri, 15 Mar 2024 02:40:53 +0000 (UTC)
Message-ID: <8b63a194-e4c8-41df-90f4-869c39636467@acm.org>
Date: Thu, 14 Mar 2024 19:40:51 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 5/7] ufs: host: mediatek: rename host power control API
Content-Language: en-US
To: peter.wang@mediatek.com, linux-scsi@vger.kernel.org,
 martin.petersen@oracle.com, avri.altman@wdc.com, alim.akhtar@samsung.com,
 jejb@linux.ibm.com
Cc: wsd_upstream@mediatek.com, linux-mediatek@lists.infradead.org,
 chun-hung.wu@mediatek.com, alice.chao@mediatek.com, cc.chou@mediatek.com,
 chaotian.jing@mediatek.com, jiajie.hao@mediatek.com, powen.kao@mediatek.com,
 qilin.tan@mediatek.com, lin.gui@mediatek.com, tun-yu.yu@mediatek.com,
 eddie.huang@mediatek.com, naomi.chu@mediatek.com, chu.stanley@gmail.com
References: <20240308070241.9163-1-peter.wang@mediatek.com>
 <20240308070241.9163-6-peter.wang@mediatek.com>
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20240308070241.9163-6-peter.wang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240314_194104_169190_6D6B5151 
X-CRM114-Status: UNSURE (   4.30  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 3/7/24 23:02, peter.wang@mediatek.com wrote:
> Host power control is control crypto sram power.

The above sentence is incomprehensible to me.

Thanks,

Bart.

