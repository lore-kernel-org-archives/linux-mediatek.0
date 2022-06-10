Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F25AC43334
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Jun 2022 10:36:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nnW9xERJW4VPXR/fbcVclGQ9Ge1aDIRvTFrwIDllfX4=; b=YZvhMrBOJRuYJP
	Jz7pulKSo7Rga53LUZjex3YPWbloZtrDhqWbuitQAyIao8tKKDnHocQ+4RoEoKjyttmuJPRk+2wUU
	wKa6by+/lY/1CBGdfKkiW+YueQ9dq3jKe8iUUcLAKO5Z3sFCTT4ObJ3xwaIlwoX1kBU+yC/gQfVLM
	+zasqCZSL/MknO3jORbOfP9nolQlLJ+u1arC7WIotz3xUa61ZK8HTtD4aIkKvTRdZc6VLfq7z/5r7
	I6pzFOnXyYMSVlxQ+klS3UWpOfqS1EoZoF0QLxCre3hG7NzfxqwiT50nUJrrYdyOKonBT41m4UdXV
	6qv6Se0gcR6xt1PtDDVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzc0E-007cLH-H5; Fri, 10 Jun 2022 10:36:30 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzbzw-007cIT-DO; Fri, 10 Jun 2022 10:36:13 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id B5164660173B;
	Fri, 10 Jun 2022 11:36:10 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1654857371;
	bh=6OggYDKQ1eAP67H4OaNuo5vXemfJO8Li0A8ayz8MhX8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=TSe8jo/qy0zUN37jJh7l259Bj3VizHyPXPNUzkSKwE50FhoDDH7hDyg9kB1/qTnhL
	 rA1sE2He+54HrI2SVqxWN1JqtprCbAvrj24uBkBlCDkXKs4m7Bc8UV3V7+6x6mDdyD
	 EMSBU6IbRyPp4G2Eefnj+W6Yf9BoToupwmV7m9d5v1uUNvo9Cy6fVT80z/Gb1b4i7g
	 BE4F+RvAKY1/qIAhYKZUu69bnOClN0fTXq82AjdD634nyt5z/C+jaXQjSaGt/Wczst
	 glpo4A0yKPb/yqOBhVSDZM3MgBJjAc9gs8ZKC7gFO0+4WqPvIchQZtz1pAv8NqZEli
	 mzEyZ9eTYL0Dg==
Message-ID: <95c186fe-3d23-f1db-a468-e51bfc27d046@collabora.com>
Date: Fri, 10 Jun 2022 12:36:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH 2/3] usb: mtu3: implement udc_async_callbacks of gadget
 operation
Content-Language: en-US
To: Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, linux-usb@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, Eddie Hung <eddie.hung@mediatek.com>
References: <20220609074233.15532-1-chunfeng.yun@mediatek.com>
 <20220609074233.15532-2-chunfeng.yun@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220609074233.15532-2-chunfeng.yun@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220610_033612_653027_483D3123 
X-CRM114-Status: UNSURE (   6.44  )
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

Il 09/06/22 09:42, Chunfeng Yun ha scritto:
> Implement udc_async_callbacks hook function to avoid a race when unnbinding
> gadget drivers, refer to:
> 7dc0c55e9f30 ('USB: UDC core: Add udc_async_callbacks gadget op')
> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
