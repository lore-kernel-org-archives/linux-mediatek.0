Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8239C0015E
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Jul 2023 12:12:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pH4SicVv66w0q0LvUE8YsekzdjBwCuaUeyrUSHSFQYM=; b=uFdE9Osm62M5rCSiQrOMzoKsI+
	S+73aFlsHroJwrt7bu45TPT0vwc96e24dqHtEWTSTUe+5y9ZzfDizb9QIWu7K1DjU7TEcfgrbh7qC
	Z6p93HXvE+GPjIvtt5sq/QKnlAlz79F+lPd//fjrz5797QHtwsm+Sh0xVyj3bCb8u6P0qdTNUDwSr
	/ineBCiyJIM0W8qLWcWlA4iiVZAxCjfPIqXcg5NiPB7AiQ6LdTO2YWaOqnOiCD0xEqtIaXFXarn/4
	0mrOUqd+bPUs/IKALfV7gZm5/1D+IoKnuwBWqeAQxDWkPzFOWFo93qJgEx9vQ07VFM2OXcnEyLQQH
	06uIIs7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGetL-00DCqm-2c;
	Tue, 04 Jul 2023 12:12:23 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGetI-00DCnd-0e;
	Tue, 04 Jul 2023 12:12:21 +0000
Received: from [IPV6:2001:b07:2ed:14ed:c5f8:7372:f042:90a2] (unknown [IPv6:2001:b07:2ed:14ed:c5f8:7372:f042:90a2])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id C94D66606FA2;
	Tue,  4 Jul 2023 13:12:17 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1688472738;
	bh=8Kfwo4V4j2E/0ZBCw0RoFmNCz0Epafw0U5bZEYoyg8s=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=gZri3fYxkZ5l2oRY0V6sS3kJVsE/zA6B5I7t4jdkROfJ0W5XicpKPb4uWd0ghSUyl
	 tZmvyDHWFEhKLufOLNKMPekVn488RJUUhMjTxlnAW6hCw3kQnLq9Yak8IN7B0jGNI5
	 hFJwK4GvPnLuGdwv59c8rIm2lNJotQnc7LmfxtPl0j3GYVhAOltcwYXLBIMSugeR2t
	 67L590Ew/C2h9waEiVntzNpBgXqJ4238jm8TYKwM7+N/+kU49FDvVVbiZ9sJuC3JkK
	 2BOqBPMt6bkKN4lU2kbIZci252nbktH7mH23D7hvvhJI65fCJsBYSidkgz+vJbLIZj
	 nt7RZ0tfjujmw==
Message-ID: <e9ebe3c8-f8ed-43e4-d481-f975e025a474@collabora.com>
Date: Tue, 4 Jul 2023 14:12:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v5,10/11] media: mediatek: vcodec: remove unused include
 header
Content-Language: en-US
To: Yunfei Dong <yunfei.dong@mediatek.com>,
 =?UTF-8?Q?N=c3=adcolas_F_=2e_R_=2e_A_=2e_Prado?= <nfraprado@collabora.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Nathan Hebert <nhebert@chromium.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Fritz Koenig <frkoenig@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 Steve Cho <stevecho@chromium.org>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20230704111327.7140-1-yunfei.dong@mediatek.com>
 <20230704111327.7140-11-yunfei.dong@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230704111327.7140-11-yunfei.dong@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230704_051220_399055_C8FCA0FA 
X-CRM114-Status: UNSURE (   6.97  )
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

Il 04/07/23 13:13, Yunfei Dong ha scritto:
> remove unused include header for .c files
> 
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

Good job!

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


