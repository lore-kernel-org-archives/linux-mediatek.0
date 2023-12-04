Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ADA9C4167B
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Dec 2023 11:43:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VtozD9jbkOTZDmK0kbhw/DHtU9YUAQDxClyMq3Lzj9Y=; b=4KKKyNHI37UBXrXGPjzmPl4zBk
	MtR+nHBsPMe6ZQyAi5Isa8RmrcMaobIkNIpxaeh2D4FiXqLv/P3CdlopQkna9VLwsYoIZYEY3H78Q
	rRrA8FTxBWrLVxmls7i5rOy9sl++5qouIEkGIE2qvnR6cjeknBURln2vdzAn3uTKcgKulQFYDf/gQ
	SwP4cAGGZu5kkdRyaybJs2TwFU4VlrEpHSP58z54G0b402m6fKeyJsjyQi1bMCC/1veF8UlTX2vJL
	5rx8HhvrF3MNq2oQqrNAmAMkCh3hYNetupAouVEIxA3Ntso6NfilfyE083A6IX9otse6Z8PS2s7iU
	1pPhW/Ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rA7MU-003fb5-2U;
	Mon, 04 Dec 2023 11:43:43 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rA7MM-003fZj-31;
	Mon, 04 Dec 2023 11:43:39 +0000
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 1F4D866022D1;
	Mon,  4 Dec 2023 11:43:28 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1701690208;
	bh=4/mLg+jbxiWpmg5kaUHJzIz8SeJLCb9j392/hDq409k=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=jYdSvrDKYgKcvvp9hg1ZcaGvctutpiWr+LUtpUQrt4ByDsgGYGLLBU7nR36h45R95
	 uH5NDUZFLW6ueHxR0djUBnZgP2+NyOW+bLpCXXjO7AaDJiPYdiEQRSGda/wS3C7lfP
	 huGdmuxzhw7v5bIrlF4AFYUaosx2w3JmoCQUFpBln/9bbVhFss6DTltknZhfoWWyH1
	 YjQNKwfE3APk+NBxwbgTAMScf96UUlWYajAjCJLqLgITZxvfMNjUEKN+KtgESh1k0r
	 Z+4TryXltO90QN7sqp5pjo9P0vNMDJSFKTmXLB8JEQVlNhq6iZiNIEsOWLXo1996Rp
	 DKHQ0VGerCl/g==
Message-ID: <73a0847d-09e0-4587-bd76-164b2b4d8aa7@collabora.com>
Date: Mon, 4 Dec 2023 12:43:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] mmc: mtk-sd: Increase the verbosity of
 msdc_track_cmd_data
Content-Language: en-US
To: Pin-yen Lin <treapking@chromium.org>,
 Chaotian Jing <chaotian.jing@mediatek.com>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 ot_shunxi.zhang@mediatek.corp-partner.google.com,
 linux-mediatek@lists.infradead.org, Chen-Yu Tsai <wenst@chromium.org>,
 linux-mmc@vger.kernel.org
References: <20231201102747.3854573-1-treapking@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231201102747.3854573-1-treapking@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231204_034335_228324_F8490356 
X-CRM114-Status: UNSURE (   6.20  )
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

Il 01/12/23 11:26, Pin-yen Lin ha scritto:
> This log message is necessary for debugging, so enable it by default to
> debug issues that are hard to reproduce locally.
> 
> Signed-off-by: Pin-yen Lin <treapking@chromium.org>
> 

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



