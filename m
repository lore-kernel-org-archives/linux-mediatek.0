Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A01A0CA1013
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Aug 2024 20:33:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wtH+mW+wAkQFb3IQqj8YoDuuK+2ax6RlRyuPU4DotiM=; b=X8d11ZFg6cKmfwyAKYhFxfeEnK
	h6MSvN2dSZAmGkOK3qJw1tAx2Iy7oUdFjngT8G29Bs0CczT6OcmWwPBSEtNQ/EHixFftvd2e+ou8t
	1EYlU5Vt5xMMIIj7UVdCbcFAKO0CFvBmCbETlDp7Ot5v5N+AG38igHOWUy9p4yEy6cAvfbS/5lkpH
	imAju9Zfd1NXvvCaELIg0FUo6B+yYNcVeYSzYx96CAJeWfusvqYp8IcI4WoHezrEsEUBSz13fflNJ
	mVqMYFw/FwNJf0NZYjG/SdQj++qA++lxOw6rKGsjthFVGwrkenESJKwzKy+P3ybbcswyyYEbB7tyx
	oT7WYOUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sk8J7-00000007by7-1DzE;
	Fri, 30 Aug 2024 20:33:21 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sk8ID-00000007bre-3ECr;
	Fri, 30 Aug 2024 20:32:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1725049943;
	bh=rOtkussEVvEtJaYYLqRR1742JXpbhS+YhqlnswW9ZG0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=l1gTFH/043LrvIs3MAkQBN3SS90BvwS3PZwIsSVvAt841aCoqoEpMc7aFPtO7AW1d
	 EwxHd+cBGOUuHl25xHzE4Uy2jzmDNPTulvRK8mo/gCrEhiI77vuu4MwDakXCPXzY9y
	 hCw4Tshns0hj6Xy+Tw+XkZwSlCxGK/PJH4Go/aX1Y9C0tQh6hMmNMDSIJKlvk2fi47
	 4HnFcMCjhwwH4eQFuqP3b2giom53ZFykytaVA+7vRtkMxs9tdKSYaCEtXzdU1MYXRb
	 IZ1dhBVg2qePGDmC4EshaD8jMQ/ARgcSmf28iNda3Jfj+Bw7j0cQ0z2rAmbuaCSeWL
	 JWUNJaSINFxqg==
Received: from notapiano (pool-100-2-116-133.nycmny.fios.verizon.net [100.2.116.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 34D2D17E121B;
	Fri, 30 Aug 2024 22:32:22 +0200 (CEST)
Date: Fri, 30 Aug 2024 16:32:20 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Moudy Ho <moudy.ho@mediatek.com>,
	"Jason-JH . Lin" <jason-jh.lin@mediatek.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH v3 5/5] soc: mediatek: cmdq: Remove cmdq_pkt_finalize()
 helper function
Message-ID: <7a5a4d9f-f22f-433a-87a3-7df7ae4f8cd3@notapiano>
References: <20240810090918.7457-1-chunkuang.hu@kernel.org>
 <20240810090918.7457-6-chunkuang.hu@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240810090918.7457-6-chunkuang.hu@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240830_133225_977185_EDC36FA3 
X-CRM114-Status: UNSURE (   7.71  )
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

On Sat, Aug 10, 2024 at 09:09:18AM +0000, Chun-Kuang Hu wrote:
> In order to have fine-grained control, use cmdq_pkt_eoc() and
> cmdq_pkt_jump_rel() to replace cmdq_pkt_finalize().

This commit description doesn't match what you're doing. What about

Now that all occurrences of cmdq_pkt_finalize() have been switched to
cmdq_pkt_eoc() and cmdq_pkt_jump_rel() for more fine-grained control, remove
cmdq_pkt_finalize().

> 
> Signed-off-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>

Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Thanks,
Nícolas

