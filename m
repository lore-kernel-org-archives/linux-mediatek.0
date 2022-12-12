Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C996C4332F
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Dec 2022 11:15:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hYJgyEKIWG/gNZvNGxsqtm8ivTYbBVrtRGz3RBiHLKE=; b=EJEQDVQHXBfYcnuGyr1m+b31aS
	5ChoQ4pNe0NsE5b6qfRiN42V+ZWMqS6t50D2CToKPOBXMoQTkJYSfHn4VF/ARTVHypcafbuDfiMOt
	3mLPSmJ/1TIWTxZ1vsx0utBD0BezYn1QuCurLDPIbOIwN7/ZnysJBNXsbv5Z3h6YFYtPu+whBdlFM
	OKmMJPKazRl/F0nQNg3wR5xmwZ7ZusngicSQG7cWyJRqMnlG33KZQp0Xf1mEjAEtmyyvSJXsi8Prz
	wHIUwIQOVIt4A0qzoECVaqS9ONd4CgWcMGXWc0+YeeND8voIa01V3Of8+bMKNRJy1VWhzoC2XBG78
	PJyJVYEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4gmi-00EFah-HB; Mon, 12 Dec 2022 11:15:48 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4gmf-00EFQ3-9L
	for linux-mediatek@lists.infradead.org; Mon, 12 Dec 2022 11:15:46 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 33CAD6600363;
	Mon, 12 Dec 2022 11:15:37 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1670843738;
	bh=ChOKXmAMcKCTWwH41gASrLbQANZal4s0KXhEMEBDovI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=cqW3WJq+SfyziEYqn5tNeHwMhbNc1nnJJ5fydymWwK527QiMIzeQtPLkweOUijE+3
	 pNLFwmJ5/yQF0NSpc8ENsmpP/co6C5UdL93SQxPLY4ojTEZg8B/rXpUC6liDzknCzT
	 TxNwXKxW3zNNq98Alo3MtDBBsYFYsfLSU87UfWZ4AsQp7C7YG2QCB6UHeJ8Ib9oM7E
	 gptJLhfj7j9GJsQKBR70AEvJl5GdKqG+D/U7LWK01gNQ2tzVKuMtCnavOQpv7scFsv
	 HjYvmXtZnAV4ZZrzo8UysjXwKvJwmNEmS8e/2Z7drb6WhTv4wNqaM9lOKuGHHv6KQ4
	 8BvyKXIWxqj6A==
Message-ID: <c2c71a7c-065a-2720-ac1d-8f27af2a723f@collabora.com>
Date: Mon, 12 Dec 2022 12:15:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH] wifi: mt76: mt7921: resource leaks at
 mt7921_check_offload_capability()
Content-Language: en-US
To: sean.wang@mediatek.com, nbd@nbd.name, lorenzo.bianconi@redhat.com
Cc: Soul.Huang@mediatek.com, YN.Chen@mediatek.com, Leon.Yen@mediatek.com,
 Eric-SY.Chang@mediatek.com, Deren.Wu@mediatek.com, km.lin@mediatek.com,
 jenhao.yang@mediatek.com, robin.chiu@mediatek.com, Eddie.Chen@mediatek.com,
 ch.yeh@mediatek.com, posh.sun@mediatek.com, ted.huang@mediatek.com,
 Stella.Chang@mediatek.com, Tom.Chou@mediatek.com, steve.lee@mediatek.com,
 jsiuda@google.com, frankgor@google.com, kuabhs@google.com, druth@google.com,
 abhishekpandit@google.com, shawnku@google.com,
 linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <1670540517-21517-1-git-send-email-sean.wang@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <1670540517-21517-1-git-send-email-sean.wang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221212_031545_565313_E0278DA8 
X-CRM114-Status: UNSURE (   5.23  )
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

Il 09/12/22 00:01, sean.wang@mediatek.com ha scritto:
> From: Sean Wang <sean.wang@mediatek.com>
> 
> Fixed coverity issue with resource leaks at variable "fw" going out of
> scope leaks the storage it points to mt7921_check_offload_capability().
> 
> Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
> Addresses-Coverity-ID: 1527806 ("Resource leaks")
> Fixes: 034ae28b56f1 ("wifi: mt76: mt7921: introduce remain_on_channel support")
> Signed-off-by: Sean Wang <sean.wang@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



