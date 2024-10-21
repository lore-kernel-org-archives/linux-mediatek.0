Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8F65D15D89
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Oct 2024 12:45:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yIBvd2KtPlvLqHaJPCo6JbVPfm/oy378soeW9dKsOnY=; b=KRXA/trp79FVHbrbHnCusIuR1M
	ZEPq75W3mvUdqrpxwe+M2HTNYq/SUUvmkOqyHCh//uKHz8BMcRtg0jBNfL2eBH2EvRdvffj3HKRv3
	DCusM/eIoV1SscnRwluMD7Wq+F3NrsT2uyeusmpBWoiaONz0UcYzu/iedNsP/rdpOwLJ7xsembCUS
	GcRZo+GyuHRXSCeupMj7kdvf46E0Kdmnu+0kKecroSkVgE4sVgO5HpFjhUc39haS7YDH0ylAqKw32
	rHJKWqPDG+TsrGXhi0rbLuJb6YUk6I5y+adXuiC8wSP+CAHRBoEs5ZEZ2LxbPpSCwJF3dYOeh8I4L
	JuX5aKEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t2rmo-00000007JGW-3G7U;
	Mon, 21 Oct 2024 12:45:26 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t2rYN-00000007FfP-0565;
	Mon, 21 Oct 2024 12:30:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=yIBvd2KtPlvLqHaJPCo6JbVPfm/oy378soeW9dKsOnY=; b=d3GhYn16ub3+yM8TTyFB2488lK
	MzA02kIFKhHoenbxAY+PTPIPwmFFQRLjS7dp7/vextvnw2E2RsEFYknvmciXbG1MP8QnYCJVha32i
	8RKKhCNP41Ko8qkbLW6uxUACTJkpdL4nfZHEEZXm41j3pt65K3h0+fYGPg+QWElwjOT5CJtR5Bchc
	Q4uSKBhv5tPF/sICXL0hudodNZ1s/Ee7e47HH1NbpNhahK8XcIy//WlniZPTRHvE5+DiFoRyIkdsF
	gx7ea7SFWMi/au9nDeD2bWh3OcQEd0CIYKifmU/qr7GzrzopnUg8YwX67cnsZAlGpRBPVo/Z9dCF0
	55XMRXKQ==;
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t2rYJ-00000007v0T-3wDz;
	Mon, 21 Oct 2024 12:30:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1729513821;
	bh=KmPP3ODrgm6S4oV5Bx8ZJrii0qhuvczppRYWff07974=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=h3dM2UN3KXOOPD4dEZnVVQPxHoe/wCjYFs84Sonpkk3+f9NjgkkL/oKVeWYvfwzc5
	 x3PW2/yumjsP7rurbYu5tO1tXZaEoyPZw+8YHx5rJs0gP7DTzP06tTZ8n7QfgkOcRE
	 fXJx7w6IZcj243nbAzcqIB2NbjNR0eDz3rSCM4ycCf/nlRTEn4VrUWFBFMI4YxvNFA
	 AQZRfidxXc4lxuzA2Op2tDXvQKCt3T6wWDCHl+oyv4GMbuJGjPUiaQZLx9xa7hpiEf
	 X3KtSrOjfARHm1ck3oVzJ+eFl5HbUfu6jjlmDN3zlTuLrY0R9lSoRGU63yeZrTHO4u
	 tkVbCZUGCagfA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3BA4517E3600;
	Mon, 21 Oct 2024 14:30:21 +0200 (CEST)
Message-ID: <427feed3-f51b-40d1-8609-4534a2815fc1@collabora.com>
Date: Mon, 21 Oct 2024 14:30:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: platform: mtk-mdp3: cmdq: Remove duplicated
 platforms checks
To: Mohammed Anees <pvmohammedanees2003@gmail.com>,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Sebastian Fricke <sebastian.fricke@collabora.com>,
 Moudy Ho <moudy.ho@mediatek.com>, Ricardo Ribalda <ribalda@chromium.org>
References: <20241017201612.2607-1-pvmohammedanees2003@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241017201612.2607-1-pvmohammedanees2003@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241021_133028_301925_AF6EC7F0 
X-CRM114-Status: GOOD (  10.44  )
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

Il 17/10/24 22:16, Mohammed Anees ha scritto:
> The platform compatibility checks for MT8183 and
> MT8195 in mdp_cmdq_prepare() are redundant as they are
> done in __get_config_offset() itself. Furthermore
> there are two if-else branch in __get_config_offset()
> which have similar conditions and are redundant.
> To address this, remove the check in mdp_cmdq_prepare()
> and combine the two if-else branch into one in
> __get_config_offset().
> 
> Signed-off-by: Mohammed Anees <pvmohammedanees2003@gmail.com>

This should've been [PATCH v2], because this *is* a version 2: even if you
have changed the title a bit, it's still "the same" patch ;-)

Next time, please version your patches correctly.

Anyway, apart from this not being declared as v2, this time I'll let you
get my

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

...because the patch is good, and because it's only the first time that I warn
you about this :-)

Keep up the good work!

Cheers,
Angelo

