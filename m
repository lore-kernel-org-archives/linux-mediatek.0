Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2716CC3DA4A
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Aug 2024 09:15:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cyyK8P7xqHJUF8z07vus4JJ5JCB+JwR5L2KEMc+NZ4U=; b=ji1vvyVD49DB/HbuI8WNF+HnRp
	2M3Q0ElZ4pvinbCzBZhjhpscTDwM8Yi+OhCFPLW68ZR+4aBp99bwQ8PagaKfu+8NsZiQq11/eQgQz
	/ug0VavY/p23XVdc9J/UagReRrhZGHTAzWVTI7MEBNkYyW4GPNWvyP63LmQe/G1ySGAEjvSwwp96s
	aJBaxw5pqz21YKSuu9elti1RmAl/CjcP+/obm58xwoaT3WKK+Rr0k3G/uGq2nxwVE16/7/eT3UFfw
	J0FPU6sJ4C8qMrL7Bz1cHOmUtdWcUSxa2qLqspl+ptOA7xdycOfEJTV+uaH/TjaVWE5woOs4tdHQz
	qfNM4ZTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZRuc-00000004VMi-0ITL;
	Thu, 01 Aug 2024 09:15:54 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZQxN-00000004Ig8-3zjB;
	Thu, 01 Aug 2024 08:15:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1722500079;
	bh=lJpczff7Dl4zEd5TZagIVzH+sb71OGv7h5on9gbAmfs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=WP0JsSDMLpo0f0M9XD3jZIkGH90CClO4MBNLf+P2iohMKPHDy4WToPlJ+Q8aMu2Xx
	 trPK7s/4jr71gOjadyTRei8/MC/vZkwbw90p3CwFWvxriH24qn/a+k3Mcd01v8pdMo
	 XUmbLeJHVyH4n1UZMoxmsyMydWFjcL/8iKAbAYhfO9f0MKnzDemsVz1GszCnVCDngF
	 lawKbSMvR4274pwaZUhp64xJU+AGbLk18fvAeOT1yLRSSlj09Tnbqe8UdKNw8QQ/h6
	 qJFjMnk8TkqKKbJu6lcSC6C8y4cV4JNcvO+tUMm3SeJj3P16QFaVug6J2uNXti2rUW
	 +dK5u/JQ1nx2Q==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id EE54E3781139;
	Thu,  1 Aug 2024 08:14:37 +0000 (UTC)
Message-ID: <89237e84-c52c-4338-a36f-022102382c5f@collabora.com>
Date: Thu, 1 Aug 2024 10:14:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] media: mediatek: vcodec: fix vp8 stateless decoder
 smatch warning
To: Yunfei Dong <yunfei.dong@mediatek.com>,
 =?UTF-8?Q?N=C3=ADcolas_F_=2E_R_=2E_A_=2E_Prado?= <nfraprado@collabora.com>,
 Sebastian Fricke <sebastian.fricke@collabora.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Nathan Hebert <nhebert@chromium.org>,
 Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Cc: Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>,
 Daniel Vetter <daniel@ffwll.ch>, Steve Cho <stevecho@chromium.org>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20240613093357.583-1-yunfei.dong@mediatek.com>
 <20240613093357.583-3-yunfei.dong@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240613093357.583-3-yunfei.dong@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240801_011442_168885_686C9A54 
X-CRM114-Status: UNSURE (   5.73  )
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

Il 13/06/24 11:33, Yunfei Dong ha scritto:
> Fix smatch static checker warning for vdec_vp8_req_if.c. Leading
> to kernel crash when fb is NULL.
> 
> Fixes: 7a7ae26fd458 ("media: mediatek: vcodec: support stateless VP8 decoding")
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



