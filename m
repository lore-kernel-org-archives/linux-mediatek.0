Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E335C25B41
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Oct 2023 08:57:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vv7CNNZElDUGq5lc/gMW20ZzUGoz/eePWYmczMpcxAA=; b=2c4RT1mUMFC+mFTIYG2SeQXgWU
	Mw70XSmIhGGwIArp32Pzu+z0qWpU+THDGI9/Hx8nkEgT2xsfTZpt5rKiaczzsGrWquiH9Ad86UfAO
	+trTyse+7ToJQJ+atjQDClAY9d3bICgaJsyrNGxlJf11y/xAMR/3yOOaiP0hgHve9s4T0qXaqC48f
	dQsqX3QC90VKbTe0K2c2p+FG5Llvi2mjMiE7vAi668iba8ggRDrKiuxlniJ7PVz6EyCKu93b4Xwl3
	/1GSTuI/SukeIGETdgqBFC51Dz9ykNp878QJGKqfDE3bjV59erfan5aRei7w+iKYuu8LHHvkOg6mX
	ah8YKrLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1quqkG-006pV5-1H;
	Mon, 23 Oct 2023 08:57:08 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1quqk2-006pNb-0M;
	Mon, 23 Oct 2023 08:56:56 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 3892C66072A2;
	Mon, 23 Oct 2023 09:56:51 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1698051412;
	bh=73sRuZmQxbkYgI/4r83wPGCzqiWrtHLQxHIubnREqm8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=dscdZZ28NlD6H5TrE75QjE3qRh6WLg5frlDnZ1IIVqqlmzJQu/zyODtqo/UF6joMo
	 TXaYk5oMG2rCdVFzR/VnXNs8JF7/pm9lmQqwN5ldwGXeoKzwjjbHbPX97+r8H9RVen
	 YFBwEoGYy+eTxmwGTIH3ktT6xlCigtgkAKREAqkAIyFeTY/YIeyIMOAIWvd8XUjisK
	 0i5GpgQQc/LqeOOIiYTAZ1iBsXj98NcIxo9wBQrIbjd34+Whmj0MvBCiXQXmRzfECP
	 S+XSWWo/c0rsVNzgA5q9xhl0SoQzoktSln7pnoy3+tI0QZsH5P/ELiNp6lCNnUZfkH
	 sj4vp8KkCd6NA==
Message-ID: <18af4161-ce36-4254-a617-3f29ccb84c07@collabora.com>
Date: Mon, 23 Oct 2023 10:56:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2,6/7] media: mediatek: vcodec: Set the supported vp9
 level for each platform
Content-Language: en-US
To: Yunfei Dong <yunfei.dong@mediatek.com>,
 Sebastian Fricke <sebastian.fricke@collabora.com>,
 =?UTF-8?Q?N=C3=ADcolas_F_=2E_R_=2E_A_=2E_Prado?= <nfraprado@collabora.com>,
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
References: <20231023030640.16393-1-yunfei.dong@mediatek.com>
 <20231023030640.16393-7-yunfei.dong@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231023030640.16393-7-yunfei.dong@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231023_015654_280503_4A6B8805 
X-CRM114-Status: UNSURE (   6.91  )
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

Il 23/10/23 05:06, Yunfei Dong ha scritto:
> Set the maximum VP9 codec level for each platform.
> The various mediatek platforms support different levels for decoding, the
> level of the codec limits among others the maximum resolution, bit rate,
> frame rate and compression rate for the decoder.
> 
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> Reviewed-by: Sebastian Fricke <sebastian.fricke@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


