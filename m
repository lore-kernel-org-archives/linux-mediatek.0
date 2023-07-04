Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4840EEB64D9
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Jul 2023 12:12:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6/NLUzZOrvphBSM0CGiNJItc+WumqMfLJ05++z22SuQ=; b=vrwvKuNvSsjPaVc26yl9pW61kc
	x2XVKFGyQ+QMgL81JbItqDxy++wS5UCbxvDDrGTlFBQVMtO68Nj8daiSuwnLCZGFAHDzH8yZX+OsS
	h8CHXbCpBfT6DPazUPXxROAauWxsj9LFOiZfQHxdYASRUDZNtTo8MQatmLOE2RWrGSGRRcO0elzPv
	s67ifLpsTTxr0OcRYZTSLPrlRNKZygR6Z0kiUA8dWn6NbcqMiIsbMfmuIB9SAM4JAJD83GdVWSJny
	NJ0o0c7sy02YyeQahxtKzJI13ZrOW6elOE6UaYRNpz+sSjfd2FAjP0mK8XAiB4uWn8MoqlaKgsuQG
	iehOIfiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGetU-00DCwT-0o;
	Tue, 04 Jul 2023 12:12:32 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGetR-00DCtZ-0u;
	Tue, 04 Jul 2023 12:12:30 +0000
Received: from [IPV6:2001:b07:2ed:14ed:c5f8:7372:f042:90a2] (unknown [IPv6:2001:b07:2ed:14ed:c5f8:7372:f042:90a2])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 1E3BF6606F8B;
	Tue,  4 Jul 2023 13:12:27 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1688472748;
	bh=mN8qypJRIFbd3Kesz4lPo40wSVIs6bQ5nGg3PNEh0Es=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=TWgC58eTs6oZA7ZEYYX4Jy6iRrUATyE+Mf8PohuGsnWKJzD5P+6FQBSVq55XZgxzj
	 tjnF0biSjx988Fl7AcytyQiabX2CHLqZw4A7sKIiFF3u8qyKfW96dbsXN09eoQx/rx
	 usXL4+EF/k4o8R5+eDvstgt8YDTDjEeChMZ+/54K7lxd6kfi0M0Zca1q52+YDGwAXW
	 4k3vE4r0ys2t6ibSAZtgcVnhFhxZopQRCEkOsqtWFzCFVTNefiFPfI4x6hezUt6z4p
	 RztDoE8Rg8kmXvC0pfxNb4flQcrin/3rIRwxYt5lctbpoQSGv+HvzZ1gmLlKUG80R1
	 Q7bXK2YlGLhqw==
Message-ID: <d0679fb7-6856-a19e-6a36-69a834d23ade@collabora.com>
Date: Tue, 4 Jul 2023 14:12:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v5,05/11] media: mediatek: vcodec: remove the dependency
 of vcodec debug log
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
 <20230704111327.7140-6-yunfei.dong@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230704111327.7140-6-yunfei.dong@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230704_051229_450274_4DAC94A4 
X-CRM114-Status: UNSURE (   9.92  )
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
> 'mtk_vcodec_debug' and 'mtk_vcodec_err' depends on 'mtk_vcodec_ctx'
> to get the index of each instance. Define two different macro
> mtk_vdec_debug and mtk_venc_debug for decoder and encoder, and re-write
> macro mtk_vcodec_debug as the common interface which is called
> by mtk_vdec_debug and mtk_venc_debug. The vcodec debug log can be
> separeated by encoder and decoder.
> 
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



