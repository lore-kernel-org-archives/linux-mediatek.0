Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0553FC3DA6E
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Jan 2024 10:14:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LxWgKhCDAXC6fRntjujECaPHgDRT1c5S9YGojA3+QN4=; b=jee2DiVJJh39OAGAgMihTYT/AV
	mZuZZvhQ97piV6yb7oa+SuMzwp0VZebcSNH8XuiSK3+XuB1x+Rk70/aoSEZfysZLzRQZvhbjFfvlm
	BsINDW9i48xvEDRlCyhP3+iqcWI7DVxy55N1aN3Y3WxGUvr4jvwTwyL2SRNvRzKkEgS2JIudEtJxd
	n0/wrcT6EI6/QGwQRYa8CJQpPos/VDHN1eYsO+STUbWbYmSYqSr7vbiVXO6ccr2hxsYEGQdcF377b
	JUkTJs3StYJ2o8Ssv4v7FaHKuTlYzDmJuA6MwoGiAGnqkx/UWre/Mn8fBSizNJs6i7B1m0TLGUtWS
	u19v04pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rMmec-004Zti-0I;
	Mon, 08 Jan 2024 10:14:46 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rMmeY-004Zrh-2u;
	Mon, 08 Jan 2024 10:14:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1704708881;
	bh=v3YxdNrdSgkWoqnPochuFDi/fDkCFuaCUTCM/mFHb+o=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Uug89SLGrs671PvYYyqHZyKC4fITITj8cRDPQbcmt7Lxsr89yS001FrIIsSmsCK7l
	 meZoCx2urIhIUNWtLf8mAKJFvrjYoh5S2xadnIslVpRXZ138MfElyhqaUshgqNqKoH
	 0w9xHCfDLUprJS9xXI6+lPg+RQssAGmrFWk+ZxyjHmTq56hg10QlyvlO9qY1k/a0YW
	 4DMX3G4ay5lrfBR1NRvvnqjyUKUZc7CLHLiUIbDbD6GGnbdb9MgVXTLJxzvun9BvuO
	 W2IYrRnP+wFLgCxx4rbJ74mtG/+4xr4jHWItWeJadzP/VtyU2uSYiXdvAbQWRc8BmR
	 999ufQxTpZrqg==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 169F93780625;
	Mon,  8 Jan 2024 10:14:41 +0000 (UTC)
Message-ID: <5edf0558-7d31-4ccb-9635-dee64b026cbc@collabora.com>
Date: Mon, 8 Jan 2024 11:14:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: mediatek: mt7622-apmixedsys: Fix an error handling
 path in clk_mt8135_apmixed_probe()
Content-Language: en-US
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Chen-Yu Tsai <wenst@chromium.org>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <2c553c2a5077757e4f7af0bb895acc43881cf62c.1704616152.git.christophe.jaillet@wanadoo.fr>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <2c553c2a5077757e4f7af0bb895acc43881cf62c.1704616152.git.christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240108_021443_067577_D129E813 
X-CRM114-Status: UNSURE (   7.73  )
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

Il 07/01/24 09:29, Christophe JAILLET ha scritto:
> 'clk_data' is allocated with mtk_devm_alloc_clk_data(). So calling
> mtk_free_clk_data() explicitly in the remove function would lead to a
> double-free.
> 
> Remove the redundant call.
> 
> Fixes: c50e2ea6507b ("clk: mediatek: mt7622-apmixedsys: Add .remove() callback for module build")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



