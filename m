Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E09E5CCA473
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Jul 2022 10:45:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F1Wh6MbofPDcjdJvO5IFaKO/tiY/mOSAXYz5Qaq5dP8=; b=wHI0AYjDkQ2mCxfCuo87PNv0Fq
	0cVRlWAYt+jVtXAuHh19vbOrhL3C2aKUgmwLjXGnmQet8R8zQT0bQ7R6qmPOCFwIYQAqobKO1Fx7D
	q0VDqoaO0YpIyllAc7br3jn4MiO9227iASm23dJsf9ltpMCR7q1rHMwsliZl8IxCnZMoPL7bt4Iyk
	ncBK1iezNg2HI2LRD8a3W13Ss3ymWnZBxz65iIofwlyA+s+iT1F2syv1qdjujktRWZeTCaNyP1jnE
	uMHBOIXBVkHhihJBnDjqEEK1J0oK2y7nZw1HqtMskq6n9ro+nxgEP5kUuC8a3Vtf6sm6Y9vbWHFK8
	XKnnnYIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFva3-008P8o-L1; Mon, 25 Jul 2022 10:44:55 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFva1-008P5t-AP
	for linux-mediatek@lists.infradead.org; Mon, 25 Jul 2022 10:44:54 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 9A1886601ABA;
	Mon, 25 Jul 2022 11:44:50 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1658745891;
	bh=fOWPnsIMKc3cDjDnNmAoOPpcjVUIo0Nn5r1oaX8r5HA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=cNv7NE9Nyps8hTGkGbK8I5oDY2lg+ueWA/aVOx2E389XIk6How3h426jqjgpKXIgq
	 HRbU3sN16lhDvUYfzSeac/ePi5GufH8AC56lkokjUFULVj2SLUq1tLdBDHeAx/m/Yt
	 W1DlX5xEAmWZF/o6ovXLYFem6vGgSu12luYyWQ/AQSOhRI6jxf7LO3W8qcUWe69JKP
	 N0dy8/6JZ/MImMAVB3P1lmLCnE6Gv8jKh7eUUR2elZz+oyydWdmRmvw1RVtI89cjwK
	 P+mjXCZNOulA1ugdq0oI56dHKeCMQNYNX1t4eiRNLk8OHQMRfrj9CdvIlDkFp7Q53r
	 PNtDwz5QA/r+w==
Message-ID: <03bf9014-e47f-32fc-4ee1-5fc4a4d381e4@collabora.com>
Date: Mon, 25 Jul 2022 12:44:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 1/2] mt76: mt7921: add mt7921_mutex_acquire at
 mt7921_[start, stop]_ap
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
References: <acb86f6ecd2f446e4102a2ef2e7a9c0003ae8b46.1658641200.git.objelf@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <acb86f6ecd2f446e4102a2ef2e7a9c0003ae8b46.1658641200.git.objelf@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220725_034453_525539_9B5ED858 
X-CRM114-Status: UNSURE (   8.13  )
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

Il 24/07/22 10:58, sean.wang@mediatek.com ha scritto:
> From: Sean Wang <sean.wang@mediatek.com>
> 
> Add mt7921_mutex_acquire at mt7921_[start, stop]_ap to fix the race
> with the context holding dev->muxtex and the driver might access the
> device in low power state.
> 
> Fixes: 9d958b60ebc2 ("mt76: mt7921: fix command timeout in AP stop period")
> Signed-off-by: Sean Wang <sean.wang@mediatek.com>

Tested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

(P.S.: I agree with Lorenzo's nits.)

