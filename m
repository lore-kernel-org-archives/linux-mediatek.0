Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 796D9C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Jan 2022 09:31:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ta9YSiUg6z73s5s2LiitBNFCji7sBSAGv8jmPy7eOxw=; b=wmwfySbI7ydQrxgdbCzg1G1NGH
	SVTfcmkxaPKsEKyGt8uKJn4QqSgYxityluOIf+3wdfN9NC9cnayVX64MZNWDr0pIntc3wW65MQ2Ot
	imXsQlx9hSJ8i/9xKevZm6GUD+FT/dNcLMaxHZ6x5Gv7ms9v9Nb2SPe+4Pqt30+gXV9qyJbk/U8ze
	Js7Nr0x0Ytt/u2+KHETwT2k+i9nZZup9V/PhwXrgpGhsaJdzMPo3oN+vK6NAZyJ84hLmVcKSZZFjF
	CpR9gLSHSamYaA3k9lX+A0SnNWGxh53VMmjq3Ii5SWSnuxdC38mlh6t5Nb1kWUBEFLmVQ5i7FtwaN
	jRN7mehA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n4gAA-00B11z-LI; Tue, 04 Jan 2022 09:31:26 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n4g9v-00B0wY-AP; Tue, 04 Jan 2022 09:31:12 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id E825C1F42D84
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1641288670;
 bh=9/T8aEfuY7T8xMS1IhnS76wUW+9atSI7kjJyu/iRtDU=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=dFXEJQPWjXn1LKtamRetcBoBxRdVPu8oc4kUftd9Jg8pxfB1z5Nlxqgo0iB57ZeMn
 uSB2UZEVCQCVlX1C5Ck3Q5lXMr+l9gt15TPjuli6afS/0Zik95yU670XU4vxwASCiF
 LJ7A9681XBMjtLi47dhYvVE/VNDZCOvWT83HBJAczqYntBcGrOfSYmFVXz0fTgUPag
 sXprSVYS6AzsPbL7K/owK40/PXH5Yn3Oxxed1pJDh60jhacnYjNrKVnq5TVJ2i5+FO
 AZA4ePF4eovMo7dq30wXdzWDrHmhWHONLUl6fN7ihMqmTE6agiMgSLvykrIvQymVui
 roAHPRuB4e5lg==
Subject: Re: [PATCH v3, 02/13] media: mtk-vcodec: Using firmware type to
 separate different firmware architecture
To: Yunfei Dong <yunfei.dong@mediatek.com>,
 Alexandre Courbot <acourbot@chromium.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Tzung-Bi Shih
 <tzungbi@chromium.org>, Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Tomasz Figa <tfiga@google.com>
Cc: Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>, 
 Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel
 <dri-devel@lists.freedesktop.org>, Irui Wang <irui.wang@mediatek.com>,
 Steve Cho <stevecho@chromium.org>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, srv_heupstream@mediatek.com,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220104080138.7472-1-yunfei.dong@mediatek.com>
 <20220104080138.7472-3-yunfei.dong@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <94e51db2-c44a-b2fe-36af-d58c9e5ca29c@collabora.com>
Date: Tue, 4 Jan 2022 10:31:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20220104080138.7472-3-yunfei.dong@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220104_013111_528323_6CBE0C57 
X-CRM114-Status: GOOD (  12.69  )
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

Il 04/01/22 09:01, Yunfei Dong ha scritto:
> MT8173 platform use vpu firmware, mt8183/mt8192 will use scp
> firmware instead, using chip name is not reasonable to separate
> different firmware architecture. Using firmware type is much better.
> 
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> Reviewed-by: Tzung-Bi Shih<tzungbi@google.com>

Hello Yunfei,

I agree with this change, it looks better as it separates behaviors in
a more generic way.

Anyway, it looks like you're removing all users of `enum mtk_chip` but, in
this case, you forgot to also remove the declaration of this enumeration
from mtk_vcodec_drv.h! :)

Can you please send a v4 with the requested removal?

so, for v4...
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
