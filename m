Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BC1CC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Feb 2022 09:25:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:From:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q1OId2hck8Z2q6UA8opwzaEaxtZzyruqlGM7FKJh468=; b=cergO59AftNkpb
	LNZnp+5jGDsjR/6IeGR4abwqlbss8toksZQTBLXNEpUoZJxXLgfAa0O9JWJH/Wju3joeMKEQSFCbx
	JN90h2cR0BWnsVGciM0XW7tuwXjXXKJVzBpSq5iGtndiMw7TUmq/UCNh6X+GsXtUVbXoMytvvyvYj
	X9WV+bUYske2BKViiZGvcThcvPSCN0OI6lbaQdUCwObGOiOCvPMNyXyLsuLXO80NMVXMbal1pZ7Kr
	2KwoHBN+8TVhcdCTBOZq9JXv8IzKGla26QaMzKC7Ua8UGysQFdcUxD8Wi4U73dC2ed62H6bom9yWE
	UOFRHFjHjqsRLDtlNMvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nNWr8-0049GB-4P; Fri, 25 Feb 2022 09:25:42 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nNWpl-0048ch-EO; Fri, 25 Feb 2022 09:24:20 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id D2D471F45AF1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1645781056;
 bh=I+K+WOpJ+r6DzLexypzmkpiWw1dTAUKgNSN2s8sEiy8=;
 h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
 b=WfURaTEDQnEej5+Sudz4lL8wPrk+0kg3IGFSRQ3tbw7TpHioE70OscGnCSm7DjSRL
 M9Ho4VtG97o6cHpF7p74pMpWfd7b8dt1SxAOUBIMmXiEBwNJFe6uk6eONZMryVJgoo
 SyqHKMrAJqUmRhJVQcvcZXvvsTAfYTPCWFlLU8zrr3f0mVchjPUKyo0iR//RMdTpwk
 kx4Fxcd57anWEYyotX1EiaSIM9zBRXYK5wN/vqpKrwzRc4BztyMlUb/b6kR49l2bLd
 GP6DJ2v7dH6qK4NEyhSZaREYRr/a06x0yKP+gcnNmAEKEYg8TWKJ5UeHIUHnmqPr8W
 NVr2lMjeR3bMQ==
Message-ID: <cd5cb589-9e3e-eb3a-4adf-9f57f3d22359@collabora.com>
Date: Fri, 25 Feb 2022 10:24:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v7, 08/15] media: mtk-vcodec: Add format to support MT21C
To: Yunfei Dong <yunfei.dong@mediatek.com>,
 Alexandre Courbot <acourbot@chromium.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Tzung-Bi Shih
 <tzungbi@chromium.org>, Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Tomasz Figa <tfiga@google.com>
Cc: George Sun <george.sun@mediatek.com>,
 Xiaoyong Lu <xiaoyong.lu@mediatek.com>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Fritz Koenig <frkoenig@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Irui Wang <irui.wang@mediatek.com>, Steve Cho <stevecho@chromium.org>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 srv_heupstream@mediatek.com, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220223034008.15781-1-yunfei.dong@mediatek.com>
 <20220223034008.15781-9-yunfei.dong@mediatek.com>
Content-Language: en-US
In-Reply-To: <20220223034008.15781-9-yunfei.dong@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220225_012417_695301_65F3CE38 
X-CRM114-Status: UNSURE (   6.59  )
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

Il 23/02/22 04:40, Yunfei Dong ha scritto:
> Needs to use mediatek compressed mode for mt8192 decoder.
> 
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
