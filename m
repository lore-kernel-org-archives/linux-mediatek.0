Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE17AC25B75
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 May 2024 13:23:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s3gOCpfBrhzTq1OT9XWjvIOrPRoa34NwbUK1Pv56I/4=; b=x5BoRDw10mnbIcLVlO8ASrOnKu
	9+5EEmjo/MySqfo8Wqa/11U1vZ9eFFLxCP84zKrWfbqQVUwU2yVpg9IMtxGAhb2D/jeCdsowj5v7h
	/+/vkzA7nbaMtmnsRXLoUOr1wE0O1zmgAzPmv7ws6UWJNrWvRkMkp4fOU3IaiuBxswtH/JlkwSZs8
	CGb3JhmUi5EmNMd/S4clEyl9ZeU/+zPktK3nWZQqRo03dQDo4P9adQWgcfhZuB0qqrxdIFMeLaXzO
	G2b5kMn8lN410gYaIJN8y+CKN4eZa9TyQkWD9vlCJytJAbC6cZKNLWc9GGf+2vIYhTwO9CBnD3wFz
	x/LQ9l0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6VeK-0000000Cz6B-3jSK;
	Mon, 13 May 2024 13:23:28 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6VeH-0000000Cz4J-1bPD
	for linux-mediatek@lists.infradead.org;
	Mon, 13 May 2024 13:23:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1715606603;
	bh=t1H7HAV/m+hR/GfN+DOdTuWAsHyeaN+y7Y2Agzg+V3g=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=LMMcKOQ3nlPAVjMUrM1mld35tSehSr7BGfqtvdlQKDFpi6n4rxqWcS9xLZmVOUvJ1
	 I7O+uXDfjLyDUrSjcsKOrPp8SbJX3S4IWdSDkOr433V0PWMwORrZizwJw5KVGv+GFI
	 y7u2GhIZt09nZaPkZD3USVNuE9/oohZqsnrnck46YWQRSraK0uOTdqk+g7xPkY6xG6
	 WJmVw5657EyAnvdSXi0RrO12zwDbj4sEhrWSRgr1CSBpZLz3dine/oL0O7XEpuM5Uv
	 Zqxbou4d8phP41CaVoENSNBhfRRzqt2gXCDcczfPNXSYxgMNzxChJb7P4Mr/ILMcdj
	 7d8D9spaLz8kA==
Received: from [IPV6:fd00::2a:39ce] (cola.collaboradmins.com [IPv6:2a01:4f8:1c1c:5717::1])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 2CE553782017;
	Mon, 13 May 2024 13:23:23 +0000 (UTC)
Message-ID: <dd997ba8-3d66-422a-b5df-ff2c0e6b96d1@collabora.com>
Date: Mon, 13 May 2024 15:23:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] wifi: mt76: mt7615: fix null pointer dereference bug
To: Sicong Huang <congei42@163.com>, nbd@nbd.name, ryder.lee@mediatek.com,
 shayne.chen@mediatek.com, sean.wang@mediatek.com, kvalo@kernel.org,
 matthias.bgg@gmail.com
Cc: linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <20240513122329.170380-1-congei42@163.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240513122329.170380-1-congei42@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240513_062325_865269_6359C877 
X-CRM114-Status: UNSURE (   6.25  )
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

Il 13/05/24 14:23, Sicong Huang ha scritto:
> Function mt7615_coredump_work will call vzalloc to allocate a large amount
> of memory space, the size of which is 1300KB. There should be a null
> pointer check after vzalloc. Otherwise, when the memory allocation fails

Otherwise, if the memory allocation fails ...

> and returns NULL, the function will cause a Kernel crash.
>  > Signed-off-by: Sicong Huang <congei42@163.com>

Please add the relevant Fixes tag and resend.

Cheers,
Angelo


