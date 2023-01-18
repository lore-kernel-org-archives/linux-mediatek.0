Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C72DC32793
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Jan 2023 12:32:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IHkREo9x6/aCDHKqilsnNsM+kux+37Vi6qoCk3IdHbU=; b=KpMxQZkPRFR8gK+sxcgC1OPQlh
	pxa/lSdMryNtZ0azdqKh+wND0w0xRlukeANz7EETsrx0RkdywvLsa0a73C3QMpW71CMzdbMdbfDbv
	Gu0O+xy3mobbenHJPOJriraZ/1zKbwY+aE3ENmeLr1RDT7f2DTYR7YjFIJst417YLY1jSHm4CbntO
	mh9sXt+/MrQ+sJ0KgJdpMrChoAqRHlfT8riySQ0PIcg+NH5FbvlY7ShCsnSgEcIHCEroM3Vgjj1Q3
	Gg4pWVHs6M7y/r8CWfqMWnjbTzr+SrhhqjWXtIUlN4sz25qve7TQMcDANO8jMUjjDI38kY3f21PZ8
	YrXoo1Rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pI7bw-000qXe-Fj; Wed, 18 Jan 2023 12:32:12 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pI7Zo-000pWx-GP; Wed, 18 Jan 2023 12:30:01 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id A1C716602E0C;
	Wed, 18 Jan 2023 12:29:58 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1674044999;
	bh=6p/64nw8PXl+X9QJy4hTb/VBdr6sXx/MwSeGLFalBW8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=WRHLelcE7uuAQ38Ksr/IUc7kpuAes0PTTFqQnHzN15ZN2qedk18yUh+rHZ6P7TdGC
	 QnhNgbsXDQOTpKlCFaRIVjC84jH2DW6a1i4kbsLfgLg+ap/RlXYZx1kG1BQBbvRb9d
	 VTSmBFGx708x7+HIZ6dz6NKirJk++PMpq9aYGVoYueflJ3VQEG8glCC3hj13Y3S9T+
	 RlsKDHvTuJm0bBuNqdf72wshfCBfvgS1r8EobYzpzxt+GagVbqmYBP+iebZPBeN92C
	 JL1G7om9yY7jnTKYf3GBffwgTYFp9mBE3eT/mysn0y9If+atO1RZLzVNmNo5Xrn1Yj
	 l1mjPSumwHoMA==
Message-ID: <2b349501-7a13-b4b2-7479-210440e0dda7@collabora.com>
Date: Wed, 18 Jan 2023 13:29:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v7 2/3] phy: core: add debugfs root
Content-Language: en-US
To: Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>
Cc: Kishon Vijay Abraham I <kishon@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev, Eddie Hung <eddie.hung@mediatek.com>
References: <20230118084343.26913-1-chunfeng.yun@mediatek.com>
 <20230118084343.26913-2-chunfeng.yun@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230118084343.26913-2-chunfeng.yun@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230118_043000_719374_35468773 
X-CRM114-Status: UNSURE (   6.18  )
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

Il 18/01/23 09:43, Chunfeng Yun ha scritto:
> Add a debugfs root for phy class, then phy drivers can add debugfs files
> under this folder.
> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



