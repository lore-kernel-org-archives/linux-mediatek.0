Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0A0BCDB465
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Oct 2023 07:55:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5M8O1zNeRanGoSoTtH3IDw66Lx/GztB1CuLKWBrRnTs=; b=x7kodNrlucQ+7WHFrVHjEgxIEp
	82jUrhe8KP3ZOdzRSx4zDWordnNpWkwRx69S7oZ6PBI6LikLf4Ibgm7xvgkxS0hHoNYwYVYFmYvaR
	uYL2c7eba0bMC+ZBwGhO2ws/O9FRBzQtLEmt7zKCgwf0wNuh6ePHl2+yyObTraO5V6VT/KPQCcMNf
	zJWI96azlDESB7IBKF1e9aOwgPA4hNJT0JZ3gpc2EtkwAsBjSFaz/MAbsgvDxhAQnGZz2M17lMYCA
	eTSAYeJJ6S7QJDDmD3WNPR3QHkKHi4AaFeSMmz0c+kqTnCy0qcAJw0Mjzi80u3ET4fsQKil0KWeYM
	+ynonyjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsIRa-008j86-1t;
	Mon, 16 Oct 2023 07:55:18 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qsIRU-008j3t-3C;
	Mon, 16 Oct 2023 07:55:17 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 7F7A56607285;
	Mon, 16 Oct 2023 08:55:06 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1697442907;
	bh=Hw/1U1YBl+D02Eq2vlklAKGEowzhCs7qY+uoAbH7NQY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=mGufDXs98MhuhzR+u3zf2PtniyqEwDciCV/Nzd2JHBNs/vsRNZrcECmmpYdiUoEk0
	 ml0xwaR2Y7J9Y5B90BokwGr4JxbJxZvc/cE6vkdcJ5Iuy/OsUvEUN/qzYyPpx4S9RD
	 W3716ERYdtNQ6iucVEyDbS1V62+/m2GAEMtPjMfdDS82aBz9WCrSpMYWXcbVTbMX96
	 PPqdS7Xz3gupbI0Tg8SoIc66Brbe6nmhrJQtDgCc3MBqtqOtPXHd53209EmTf3jJjl
	 VZO3wFrAoxcP+6t7eP1PwRCmulTmLhNp89j940cHO93H56J1+307T8s/JkmsG0NoZu
	 zaJzLdZQxL2QA==
Message-ID: <5b843706-8ec3-6de6-de24-ddde5349db57@collabora.com>
Date: Mon, 16 Oct 2023 09:55:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v11 06/16] drm/mediatek: gamma: Use bitfield macros
Content-Language: en-US
To: =?UTF-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "wenst@chromium.org" <wenst@chromium.org>,
 =?UTF-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>,
 "kernel@collabora.com" <kernel@collabora.com>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amergnat@baylibre.com" <amergnat@baylibre.com>,
 "airlied@gmail.com" <airlied@gmail.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "ehristev@collabora.com" <ehristev@collabora.com>,
 "nfraprado@collabora.com" <nfraprado@collabora.com>
References: <20231012095736.100784-1-angelogioacchino.delregno@collabora.com>
 <20231012095736.100784-7-angelogioacchino.delregno@collabora.com>
 <3399bf15a6e3d3d4ed5228c858b06c7b28b40aea.camel@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <3399bf15a6e3d3d4ed5228c858b06c7b28b40aea.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231016_005513_238108_67548953 
X-CRM114-Status: GOOD (  11.03  )
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

Il 13/10/23 06:00, CK Hu (胡俊光) ha scritto:
> Hi, Angelo:
> 
> On Thu, 2023-10-12 at 11:57 +0200, AngeloGioacchino Del Regno wrote:
>> Make the code more robust and improve readability by using bitfield
>> macros instead of open coding bit operations.
>> While at it, also add a definition for LUT_BITS_DEFAULT.
> 
> When I apply, I would remove the description of LUT_BITS_DEFAULT.
> 
> Reviewed-by: CK Hu <ck.hu@mediatek.com>

Sorry for forgetting about removing that from the commit description after
removing it from the code.

Thanks for removing it while applying, that simplifies my workflow.

Cheers,
Angelo


