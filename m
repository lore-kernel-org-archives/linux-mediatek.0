Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22CF4C77B78
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Apr 2023 09:36:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2dhkFMtEgbv1YyjhhA/IlP4o0TCsb74Fq1hPNph8NtM=; b=AmnzyV7F0SdD8hXkyQ58kZCxSk
	Fg8NLhFCgVNmu968qxfucQ0bKAAppHMR7OcZ9HF7PiU9VgCNJYe5NLgIoBz5CZzuugVEvmZuYjY6s
	VskzYGxd6tcYKJuCPhHxATmF4mxfvppmicnjynykagS5xAz8xx/op0nm4z7DQBE+w9iHgwCYPQ5SU
	xY0pyV4wug56AjLLIl2iIFvOwpCZWFEfbnzxWf3zC+Ms2Tv8SqKaIFxBGOZIvOdXu5xNI0+IMoBmh
	B70CrCTgzV86K4xZF1QDSAegp/qH9pgjmgVdfTawYJ1bzOAgkGLcEqCt/0NM19/Mo0/OvSZAQ4cw2
	YiQnQBnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1poLHD-00Fanf-1G;
	Mon, 17 Apr 2023 09:35:59 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1poLHA-00FamR-0B;
	Mon, 17 Apr 2023 09:35:57 +0000
Received: from [IPV6:2001:b07:2ed:14ed:c5f8:7372:f042:90a2] (unknown [IPv6:2001:b07:2ed:14ed:c5f8:7372:f042:90a2])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id D032F66030BF;
	Mon, 17 Apr 2023 10:35:53 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1681724154;
	bh=2ela0OE3EzNbVcej6d6Wb6FQs6kE2UzvgK4k9tO5HZE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=gKKxXKWq2YTjMOxBZqZoQVdZ6AYtfX6HoOa/p48i2UL9jPXOpqrB2mX2F/wq8FWWU
	 PsaAK0O1E0SPtQ9kP+NppDYxglNsUgSw1VcIdyfS/BmF/oyifBP39g86P1gNyGMNsF
	 Wf17/y0+0sKLIP5ZErZrXgycCe7XKQ+G0lbWEp8G5ykF8kwkIrPy+SV3WZplJ9iHGP
	 WW8EeZHPHDRL4fyOb1F8Nh+zmcFtg2R+E5e1CbZIuBJVJXgzcbPopUv+CGEu/tHeZl
	 rk53Kqoi2CCPMii78chkcps4iq91BrEYfKV5hep1DJh1dKwTKDsYrq3gw879OoC2fq
	 UgH+4Fcj1HCfA==
Message-ID: <4b58c2a9-0861-e79a-c740-954cdc193599@collabora.com>
Date: Mon, 17 Apr 2023 11:35:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 4/6] media: mediatek: vcodec: add one empty lat buffer as
 the last one to decode
Content-Language: en-US
To: Yunfei Dong <yunfei.dong@mediatek.com>, Chen-Yu Tsai
 <wenst@chromium.org>, Nicolas Dufresne <nicolas@ndufresne.ca>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 =?UTF-8?Q?N=c3=adcolas_F_=2e_R_=2e_A_=2e_Prado?= <nfraprado@collabora.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>,
 Daniel Vetter <daniel@ffwll.ch>, Steve Cho <stevecho@chromium.org>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20230417054816.17097-1-yunfei.dong@mediatek.com>
 <20230417054816.17097-5-yunfei.dong@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230417054816.17097-5-yunfei.dong@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230417_023556_225129_6AA4F4DE 
X-CRM114-Status: UNSURE (   8.43  )
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

Il 17/04/23 07:48, Yunfei Dong ha scritto:
> Adding one empty lat buffer with the parameter 'is_empty_flag = true' used
> to flush core work queue decode.
> 
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>

Since commit [6/6] depends on this one, you should either squash this with [6/6]
or add the same Fixes tag to this.

I think that the most sensible option is to squash it.


Regards,
Angelo

