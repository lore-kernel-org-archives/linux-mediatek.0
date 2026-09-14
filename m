Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFF9CC88E50
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Sep 2026 13:29:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HR/xTOK3DWvtlBt6cOUJIkB/rnCbPm/FXD+Rqwvmbgc=; b=gRDWWvf1wHdQAQybfLoDx1I7ot
	1P+wKA3K3REu4Nxr+6Su2rwUqIIZoZnIiCZp8cvXnH0/vN9LQi05Xb1JgUCe+ikqLDTCs6SFpYay0
	CIyW+8UvpBYNdGDRt/hjPYgyl2DyAcxlpj26EP2FuWNgBgJlKHL91hj0apuLQLD+HanIr9ijSvWyg
	Id3Q4sWi+xxPFLHtVoZ+DAx9hIQj/XcA4G9dy53qzKoBEv9aEb7iNFDQWBlo6OkPBsn4/A5ELfKM+
	JLseUIz0j5ofTDTtuJYb94mCiwh4CrqRgni5BhRK/py3W4sRqo5LijoQIafW0YVUmd1ewDz0CKbw4
	wmVYKlZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x66kK-00000003lxh-0io3;
	Mon, 14 Sep 2026 13:29:20 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x66kG-00000003lvi-2gF8;
	Mon, 14 Sep 2026 13:29:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789392554;
	bh=GgGymzblsZCPMXzy+QK5Y9StjfPGnQ8fCisPzLXNDnM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=jZPo0jMYNF62ZeQ7FooTLrLgk3DHmromNKEBvnuXucdL4eMG6ZV1RiVf6Fmo8uRGt
	 Je4k5b2LOY4UUgqZE92Of1FlVQTSbijm+o1XLUlWAgpNexezB2AdJTx92Can0lwBi6
	 cbpTz4Lruar4KMYkoCVflhGExjHuydf0wfmTq7eyIh/QCXjX83Lno3d8w98VwNruh3
	 Ak4kO8lH3WcOyzhrIHpeq6DX2e6RkcILe2qUesoIm9BHiriciaA61lKcYpnEHR1ocE
	 NtqUkeW6dB5beBEpXEYuzKb8sQgPlJZ1D6PPDaNT8y7R/uFJDWSjLgzvl2sxxcU0//
	 0EDbVDM0p+BKQ==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2F53617E031C;
	Mon, 14 Sep 2026 15:29:14 +0200 (CEST)
Message-ID: <048ac753-535a-4883-b13c-ec524deac252@collabora.com>
Date: Mon, 14 Sep 2026 15:29:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 13/13] ASoC: mediatek: mt8189: Validate TDM MCLK
 frequency
To: phucduc.bui@gmail.com, Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Cezary Rojewski <cezary.rojewski@intel.com>,
 Cyril Chao <Cyril.Chao@mediatek.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Dan Carpenter <error27@gmail.com>, cassiogabrielcontato@gmail.com,
 linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260914072842.24420-1-phucduc.bui@gmail.com>
 <20260914072842.24420-14-phucduc.bui@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260914072842.24420-14-phucduc.bui@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_062916_833296_C517B8F4 
X-CRM114-Status: UNSURE (   5.85  )
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

On 9/14/26 09:28, phucduc.bui@gmail.com wrote:
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> mtk_dai_tdm_cal_mclk() accepts zero or negative frequencies.
> Reject invalid frequencies before configuring the TDM clock.
> 
> Fixes: 9f202872ba04 ("ASoC: mediatek: mt8189: support TDM in platform driver")
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


