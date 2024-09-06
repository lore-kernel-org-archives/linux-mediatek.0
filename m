Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E546CCE7AE6
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Sep 2024 08:28:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UKrKQ6yNH03PcVJ7Khtyx7BtEPnNtK9NfpXH/VDEpNM=; b=0XIOiBjSnx3LgtkRMWChhnN3K7
	AvM2qL1pdeTCJ4tvsO63QyCQiAraUjO+xyZyuZ/Rd2G586/kWhtAewHRA04O2dyK++HWlA0MDGWhF
	IT5MOXNzq08R2bhsAQLBGTNnmfQxutuQPjOvZ/NRoHrTGO5hLK23cRfIgYKhXvx84WUoiGWyvxVEc
	MIqHtIJF4IOXOenUE6V3JRXEGE/ZtWC+QjM0blRfg5shU+PjvMWeFAAJ1x9iK+1+fXvu0nN4v5ALT
	6+ITBBW31mJOZW98q9M55vh5668KizmK/DZQBy5Mg47WgcFSGNaWm5KTRc1ioa46jcf0QstAcllr+
	GhAh1lyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smUKK-0000000BJtM-2ZZ4;
	Fri, 06 Sep 2024 08:28:20 +0000
Received: from a7-31.smtp-out.eu-west-1.amazonses.com ([54.240.7.31])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smUA0-0000000BGvU-2o1l;
	Fri, 06 Sep 2024 08:17:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=4232tfv5ebdrjdwkr5zzm7kytdkokgug; d=collabora.com; t=1725610656;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=5Wb8fP1SEMFE6J1hco629bsm8w9ZG7Mlhn8OcjaJNVo=;
	b=RcHa/+l+DOBAVoa5TU8sKEbZ2RoOrayZl6FYJIZpncFsGRSW6hkVqo8X0X5pbg/c
	ySnV1UBHh71xdIlqyh+C1ZpotRBts8tbHFwD3Z0T+UZeAcFCMdatoJG1BBrHmOOSLnW
	UKmp1gD5Z6NdMmpZhjjKU5bnTMK17twPYiZY+HmY5gJy0Lbgng9lqFnLtrZt81J0MrH
	ZQDQsLIguCzeS7E8mJBNi7bh96LLLSa7XIQ5C3VM/sibaWjSQhAiP7ZRiWrWohwPb9k
	Imk8Adthfr/s/egcEx7iPaPN97ZCW/uoWF/TtsO+heNo7EH3A7ySj58bsd0TkZiU6SN
	dnD8pPNtmQ==
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=uku4taia5b5tsbglxyj6zym32efj7xqv; d=amazonses.com; t=1725610656;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Feedback-ID;
	bh=5Wb8fP1SEMFE6J1hco629bsm8w9ZG7Mlhn8OcjaJNVo=;
	b=VTzYYLNuMnj343jmhvymhUF3UBDLYeg0IHWy/sjm2BenIgksQrOOtJ7rXr8A5LON
	pn0/0SDI8fGzrMP87AZ1WscwGB7B96cneacJ2giOcf6v71S9RNqeYJ/368NJHIKvVg7
	9hgxLLKYn1AKxHZd7YqGlB+IzrzG+L/FmTIW9VDw=
Message-ID: <01020191c669040b-0320e5c0-d4b2-4241-a403-09ec32f7ef35-000000@eu-west-1.amazonses.com>
Date: Fri, 6 Sep 2024 08:17:36 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] soc: mediatek: cmdq: Remove cmdq_pkt_finalize()
 helper function
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Moudy Ho <moudy.ho@mediatek.com>, 
	"Jason-JH . Lin" <jason-jh.lin@mediatek.com>, 
	linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
References: <20240901143259.16849-1-chunkuang.hu@kernel.org>
 <20240901143259.16849-4-chunkuang.hu@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240901143259.16849-4-chunkuang.hu@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Feedback-ID: ::1.eu-west-1.YpP9ZbxnARFfy3Cb5pfsLd/pdsXBCNK0KEM7HforL4k=:AmazonSES
X-SES-Outgoing: 2024.09.06-54.240.7.31
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240906_011740_912930_B6E7D94D 
X-CRM114-Status: UNSURE (   4.74  )
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

Il 01/09/24 16:32, Chun-Kuang Hu ha scritto:
> In order to have fine-grained control, use cmdq_pkt_eoc() and
> cmdq_pkt_jump_rel() to replace cmdq_pkt_finalize().
> 
> Signed-off-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>

I'll pick this one after the media patches will be mainlined to avoid issues.

In the meanwhile, mainly as a self-reminder:
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



