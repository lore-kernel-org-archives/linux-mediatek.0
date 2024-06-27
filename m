Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81971C3064D
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Jun 2024 10:09:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VwL3V2d4rsj9qoM6ANFILNJZQSM2ASsms3/6ZWl24mc=; b=j8cFj/Y3uTRobUFa5/3bTm7Rii
	gEbR/nk6/TKctspfGtIaNrVxINGJ98D3wnkil5zwvXHLkXbOWkHtdUsn8z6QFom1U4UC4mLnRm9by
	jbzjjQppyWTj1ysVzqR9+hfdg4NIMv11n9kx2bASp9mnrzt76RpMqh79Xy4KhNQUNG9HzTyahDFgg
	qObbJmV2pq58fqJE0l5e1YalKDc0nXYeLk0YWeykyGo4xgpt5uhIozXZOnWdhN6Nx32Jmn6xTQJXL
	t1u8QJYzMo2wGsoFsHskqWKiLTWEwxPTI+vQaZUYrCq4F5ZYjm765lU5xyzMu7hpEzNdMjrNL+irb
	BrzFsvYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMm3q-00000009spi-2q4u;
	Thu, 27 Jun 2024 10:09:02 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMm3a-00000009smx-2Gib;
	Thu, 27 Jun 2024 10:08:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=VwL3V2d4rsj9qoM6ANFILNJZQSM2ASsms3/6ZWl24mc=; b=plSSKIjlnZsbshuV1jCYrjlllM
	rj4ykEed4sGpcrkaI6Yhvm6CZ24DDJ8a2anriLp3xGJCiah35549OZRLhoWc05tp8nwdMHfPPlDtN
	GA2flW4wrPtaGx30jSIRtGgsjGUAQO1UOcv3kzmcy3D5vMJEhs821HCORBEApHk2tAIyt1RSaeZnS
	QuQMNB8JcxKhilMod3qgDt/rhHFwhkfZtHD7VxZNeH3DlPYMf0NoQD0zBRhJ82BgWM0xjIUS+Atsj
	dQ/rP22csTaLrGqWdySsmZHki3U0sxLuzwNxP6Oy1X6n0VGc0VK+Fk72foj/8BQ1jgay7GXcRiSE3
	TeltPIXg==;
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by casper.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMle7-0000000DOgR-2uRy;
	Thu, 27 Jun 2024 09:42:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1719481324;
	bh=tZr32JHQklyrO/9FeqwAvSJq70aIA76d1jSLaHhjQuE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=JpnRge+RBdRcIE+ZfC/9DC81jJry0CQlpqbFofktI2uNRxO4UW1PJkPiFUPcqOQmZ
	 oegpF5/O9EWQKd+FvIR1xzpQI1oE2K3Sm2bMh+u+iiUFgE4SBM8ouyb7VXe+oaH3p9
	 OZZbFj14roY0AQLrgealstIWkFROOJhKKuBBo2YThOjyjQs+yHE6aDqt/mAK6O8Ota
	 QxN2lVrYJ2ke8YJzImgdUyHvMpNHGCY71sA7V3G198mrOXbhZ8DijhGRM19WdQaBQj
	 1nafRFnDnTlAGdcw/YY2dgUvjUk/uelixm88ooiLF3RIqxNAqDDEJC5HxSlrr9LKIU
	 opPQfkWF4QHoQ==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id E5BB0378211B;
	Thu, 27 Jun 2024 09:42:03 +0000 (UTC)
Message-ID: <f6f0a4d4-3455-49a3-8e61-8e11ba186ac1@collabora.com>
Date: Thu, 27 Jun 2024 11:42:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] PCI: mediatek-gen3: Rely on reset_bulk APIs for
 PHY reset lines
To: Lorenzo Bianconi <lorenzo@kernel.org>, linux-pci@vger.kernel.org
Cc: ryder.lee@mediatek.com, jianjun.wang@mediatek.com, lpieralisi@kernel.org,
 kw@linux.com, robh@kernel.org, bhelgaas@google.com,
 linux-mediatek@lists.infradead.org, lorenzo.bianconi83@gmail.com,
 linux-arm-kernel@lists.infradead.org, krzysztof.kozlowski+dt@linaro.org,
 devicetree@vger.kernel.org, nbd@nbd.name, dd@embedd.com, upstream@airoha.com
References: <cover.1719475568.git.lorenzo@kernel.org>
 <b4603cb7c259d94de5a69508dd2aea46b25e385b.1719475568.git.lorenzo@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <b4603cb7c259d94de5a69508dd2aea46b25e385b.1719475568.git.lorenzo@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240627_104227_754832_0A63DA69 
X-CRM114-Status: UNSURE (   4.28  )
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

Il 27/06/24 10:12, Lorenzo Bianconi ha scritto:
> Use reset_bulk APIs to manage PHY reset lines. This is a preliminary
> patch in order to add Airoha EN7581 PCIe support.
> 
> Tested-by: Zhengping Zhang <zhengping.zhang@airoha.com>
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



