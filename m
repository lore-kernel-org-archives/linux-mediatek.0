Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD131C88E64
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Sep 2026 13:27:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xlYErWPJA4+MekotArMzBhdk+FoZRe+OJ0jGNbN2MWU=; b=GhZm3DpXFFPp3n0hcD8qMbRPfQ
	gt08xRIB1NX4/FoBCF8bbul5u8TKye0J8Mp24MfYA0pP6+PY8S0cqyql/hdI3BaZCYUbgGwGXoAoN
	5Z0RqOSjHog+uz2ezppFXMScLi+xG+/ykadC4HMPwIx7l2Md9xnkUFny5IXohF7zdVJ7WzpOrJjPe
	wpwSNQZnhoYdnJxhr9ugRf4HYea3zXOZ3orGtK8wq9qNTS6SjI43JqJ0bTt8HHZmfDBFUtqDRZR15
	y4ELrxpqi94Z/F0nWCf6szRMZml2Nz6mizWcnA9+q/urxxmQH0ipQM1Chk8h5S+LO/u1ahUHTfpN/
	AHKtQkbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x66iM-00000003l7Y-0ymF;
	Mon, 14 Sep 2026 13:27:18 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x66i7-00000003kyE-2QHN;
	Mon, 14 Sep 2026 13:27:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789392421;
	bh=ZLWzRh/4EYz3n1+8RCQ7p4cc+9o5k5IIHVgaaSPdljQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ZpGoEPdzYuU6oWBq1ZafzslhKtbnIzWMr+xuk8LJ1OutWYuPWY8QU8iccmd1u1M3b
	 PK620bJerk6XkAvmhOOWAUdnjlC0fGs4tAjSOyI1rOIKCEDWeSjQIMi5Ib1icOHPy2
	 7hj+/peXskv5Hd6V8+jALBwHsdEzLoD9n2TjOzp5ch+5Jyv8mCTZBt+HPBcUESpiLg
	 PyjtSot2+P87VRH35klcD0I1QXEPEkykovxFZlGfLb2deZLqDmoIfhKTkkqGru7EVS
	 YPmCQbH/I4NyPM75pWRoPMNmZXIqd2Ayp/Bc0OKSzvyMUGzN43VaLItRAK/Lf4w2gC
	 BXZOYKoKxFjZA==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 40EB717E0A27;
	Mon, 14 Sep 2026 15:27:01 +0200 (CEST)
Message-ID: <5b150f7a-0e40-468f-b8c9-18c5b3035928@collabora.com>
Date: Mon, 14 Sep 2026 15:27:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 04/13] ASoC: mediatek: mt8189: Validate MCK ID
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
 <20260914072842.24420-5-phucduc.bui@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260914072842.24420-5-phucduc.bui@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_062703_810019_8C410BD4 
X-CRM114-Status: UNSURE (   6.07  )
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
> mt8189_mck_disable() only checks for negative MCK IDs.
> Reject IDs outside the valid MCK range as well.
> 
> Fixes: dc637ffeed6c ("ASoC: mediatek: mt8189: support audio clock control")
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


