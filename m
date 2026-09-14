Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE723C88E50
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Sep 2026 13:28:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pAKmUE9iU+ENqp9+EsxIpb1BWLNnd50973ucnIlYosg=; b=r1bW81EAjJIKPtqOelUiNFd2+q
	Qx+TMaf5kNrLBi6W/sHJ5fSZB8+mQhPrRBKelL0/in0NEvGGRQExiczjNkH86itI+0F6Asfdpp8RT
	siG7FTZTvu2AYm0BR+1ItkMnu/lwatuwA/Wskxam7JdyEAq2tVf24r4DYFoEYl3BfVAc8FfFpLDAm
	rkegWxLEl3JgHUQamfoNhYa7rOXujxwg2x8RK0YTN9KYr/7oBS6DbqSSOxvOEiOTzigpWATyTZhXb
	LN7MvXVZ+UB+f2xFiN05PfDR35+cMXq0fawFZEgj5E3VPXNu84i4BlFha7THn2LyR18AaBk7tEjuq
	Adb7YAJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x66jg-00000003lfa-2xHp;
	Mon, 14 Sep 2026 13:28:40 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x66jX-00000003lZ1-3rtf;
	Mon, 14 Sep 2026 13:28:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789392510;
	bh=YphF5hhPQGlAuPhEBbNU9Ky2p6aYoj0ev82XKFf9Mqs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=QGFfLeqQtPEsoHecPPd6TT4T8kkjNPr7cpZlNXkVpsTNPMOLXKq8zlLv3y9LKBr5E
	 Q2z/eXUhsHJUt+Mw/hhUZCfqFiWHa8YCIq31uj/n1NJ/+k75w21nsjzWDM+CuhrAAr
	 PLTePy+Q3PMPNvlutgW0qRTq9xpmDkoe3BTqmosRHN4M2FIAFdr5kV2OULGGT3PJ2l
	 oUHrdJBW5KVS/E50DvgRIZR9m7TbfluzkRiQtx1yOhi2mwVVvewt+EWdFVzsDHOp/Q
	 UNaQIcDTWATq2w/G07Nq5fWn/FF0nKpfXuK5+eRIHH2JWPqLt0kpfaNq4jW9QeABJx
	 21nSTmtn1HgRA==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6A23517E05D3;
	Mon, 14 Sep 2026 15:28:29 +0200 (CEST)
Message-ID: <c8c6c9d8-624b-4543-9c88-1265f16fd492@collabora.com>
Date: Mon, 14 Sep 2026 15:28:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/13] ASoC: mediatek: mt8189: Remove redundant error
 message
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
 <20260914072842.24420-9-phucduc.bui@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260914072842.24420-9-phucduc.bui@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_062832_144933_EF14EF8B 
X-CRM114-Status: UNSURE (   7.59  )
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
> The errors handled here are already reported by the called functions,
> either directly or deeper in the call chain. Therefore, the additional
> dev_err() and dev_err_probe() call is redundant and can be removed.
> 
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


