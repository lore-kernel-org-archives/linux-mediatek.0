Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40557C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Dec 2021 10:31:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sjhUWvwagoilgje8Fcf+LmZrAlgqzVkEtFRuBkbH12I=; b=sLTXxkl3Vb7RJfyARvdg0wWmNv
	r7ijj4dmaVNrbQeGTB4PRA+sGMuyH0REkuhWyFZ0CeFqs0WKb8LUqHJOiSiPsCOB6AaXMxWprjadu
	4k5T0tH4SahlWZ3RsNG4Tub2nVwU0PzvqQBG4MyH5/qKVwecyK4rZC0NsXcxrRwr2dquVI1Cdfocx
	fDOFr7I5n5Z4Fqf+o0qWsWsn1pYpw56I3Nd9Fe5vQJaYbBdPnsfp3niQX6NL2LybO1USI2R+WilaB
	6pkdCd+GWhbqsryCKTAWOZQe47LjgpQTRYGk54wOovxQ5fiX3EMTFRkVeh8CV/M4lN6LcxYNqkyKQ
	R1HEAECA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1msMtU-0086kv-DC; Wed, 01 Dec 2021 10:31:20 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1msMtG-0086gs-Jy; Wed, 01 Dec 2021 10:31:08 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 93EB31F457F4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=collabora.com; s=mail;
 t=1638354662; bh=KpiF5kNZXa2da2rHqBoWn0wRV+C0nTxU6BvDIk3QM9Y=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=V4vuuOvBuzjRtD9HTwPCtWmSOpJC+/Ag5NWFS2aMev33XPKAeHrSQ+HrN9mtTEjS+
 hkq0TamSGFWyU9ui/FaAoidg6/gNOpN58jSDUoVPATyN74YQY9ie7BynEDq3m5afFy
 Wr/Pv/Z2nLc7bkhNaNyp8v7xrKIvhYN7jqg7IPlAQ62kOnr39IsKc/KC7/I9jpjLtN
 OiITcs3DNNgopKC8WakJYkikFpXNmDvMI+fdlM5ItCUdmKmm5cfZQzXmkfSiXTLo+e
 aBnyjQHaXskYjC0pnvRXCcJ0CXIj6a6DQyhqEPtoyJWpLv1YQO/zmYNkiBjxTVDVP9
 LbEbwcqP0oiHg==
Subject: Re: [PATCH v9 4/7] soc: mediatek: mutex: add functions that operate
 registers by CMDQ
To: Moudy Ho <moudy.ho@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Jernej Skrabec <jernej.skrabec@siol.net>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Rob Landley <rob@landley.net>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, Alexandre Courbot <acourbot@chromium.org>,
 tfiga@chromium.org, drinkcat@chromium.org, pihsun@chromium.org,
 hsinyi@google.com, Maoguang Meng <maoguang.meng@mediatek.com>,
 daoyuan huang <daoyuan.huang@mediatek.com>,
 Ping-Hsun Wu <ping-hsun.wu@mediatek.com>, menghui.lin@mediatek.com,
 sj.huang@mediatek.com, allen-kh.cheng@mediatek.com, randy.wu@mediatek.com,
 jason-jh.lin@mediatek.com, roy-cw.yeh@mediatek.com,
 river.cheng@mediatek.com, srv_heupstream@mediatek.com
References: <20211201095031.31606-1-moudy.ho@mediatek.com>
 <20211201095031.31606-5-moudy.ho@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <24a5672f-7d7b-c67a-3650-dbc228835074@collabora.com>
Date: Wed, 1 Dec 2021 11:30:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211201095031.31606-5-moudy.ho@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211201_023106_955280_1F1C4D07 
X-CRM114-Status: GOOD (  12.70  )
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

Il 01/12/21 10:50, Moudy Ho ha scritto:
> Considering that some functions have timing requirements
> in specific situation, this patch adds several interface that
> operate registers by CMDQ.
> 
> Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
> ---
>   drivers/soc/mediatek/mtk-mutex.c       | 65 +++++++++++++++++++++++++-
>   include/linux/soc/mediatek/mtk-mutex.h |  6 +++
>   2 files changed, 70 insertions(+), 1 deletion(-)
> 

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
