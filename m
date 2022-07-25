Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF875C43334
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Jul 2022 10:45:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gwOxnEb0mO92BFmbJ6U3v1DHz3VRUJlvrqRqfd6Vlj0=; b=WXZ/YdvouLCAsZisZgd5eDlF02
	9LBEJazeFgrvUcZErL87SgT0MYVhohm7CbpDbUcAPNa7hTbaFuwO1xYyERujjyYaqgyZwIMjvsbDN
	M5q85pS9Hh+UthAHIYCC8hy1EtQvV791xXIalA+F3Y/T+9QQSx8550JBObE+er0n8jP1115caPobx
	xb81viVBriPViiYxD0HzOVFqci332TI9Gek6pVvFolnM5NUl9aJVUA+qV8PIfThIZPGQhsWmxF0VT
	bDXWu82F9Mxt8KFrXCbndA+DdJrgz/0mDGmspbn74Bdxf1CKTkT4+U+OyyFi5bePKxZiwN4unjROE
	pehrCJxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFvaa-008PgW-FT; Mon, 25 Jul 2022 10:45:28 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFvaK-008PQ3-Ks
	for linux-mediatek@lists.infradead.org; Mon, 25 Jul 2022 10:45:14 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 491EF6601AD9;
	Mon, 25 Jul 2022 11:45:09 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1658745911;
	bh=8jqDRz7pmMCFgF9l2ImU8VeeQTeNrBDh76+ym1NgW+A=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=LaKHIvkhyLjcACgIe2Q1iGCENgeoUGrDw6wFlzCkYsfFv+tNPmm/hRdyFqfalSWko
	 h39EGl8V97qYdNIJXfzhl+e20USyc/GK9zR6ofa3MDxfBBSj2+V+VuUkF6ocOdaR6G
	 M16IdHYSVuWnT2ydUV6J7mZVKxSThvWIdLaa8pTkgumtZyMWrgXGha/EfcQpTjA/Oh
	 X9a+6IwZfy46ShwOqtVgN2fLTm7Q1/7gT1TlcXNfxSDDubHq+FxmWvbOFm4Qq2CoXj
	 uhCMPQo/SP3wf06gLpkY6cLH66MbM+OGCA2CSY0DL6b0nkhEbyrzCkBDYaFmxTV/Tq
	 paCMnsYCKHGdg==
Message-ID: <42747f5b-cd51-6a42-c793-db5f410b3bcc@collabora.com>
Date: Mon, 25 Jul 2022 12:45:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 2/2] mt76: mt7921: add mt7921_mutex_acquire at
 mt7921_sta_set_decap_offload
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
 <02ef9b9464024d2375caf598ae7c6b1e8e8e20de.1658641200.git.objelf@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <02ef9b9464024d2375caf598ae7c6b1e8e8e20de.1658641200.git.objelf@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220725_034512_895557_51415D02 
X-CRM114-Status: UNSURE (   7.94  )
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
> Fixes: 24299fc869f7 ("mt76: mt7921: enable rx header traslation offload")
> Signed-off-by: Sean Wang <sean.wang@mediatek.com>
> Acked-by: Lorenzo Bianconi <lorenzo@kernel.org>

Tested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


