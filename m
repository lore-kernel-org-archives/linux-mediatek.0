Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3867C4345F
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Apr 2024 07:51:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZgpZDD9AyaELbbXBFXiUFk3BOpH7b5/lrEo6ZZCotnQ=; b=tlD9BE3wAvKH8DwgFcERabobcL
	ZrIeLOyOQ/aFSX/cH6FTqqQ/yHDqNVZrF+EvNi164A2u1xdwo1P0QnF4lOKnAAZGJSHRq2Bv64duE
	3Q7CPPKZ/SnDeuejjByxNxDD7slu5zbFfx5d0hCTER4tPKwNSl3E4Tg10L9tYUx+Q8ed8ffca0mrQ
	eioq9NL4WLUpnaOrgTiVMUXhRs7fPcQtDoMW9lSXJgiUGD61GzAq17MgzRCdcsS5cFeMhaZBki7M0
	1xuLRHfa2vKJtwxgG5JLQ3pqOZFqQWmTH/21R3SWA+VjltVrCsZ5Dz3/B2Aqz8T1KWxr4D7StPe3J
	fIT+stcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1LnT-00000001sV1-3pe2;
	Mon, 29 Apr 2024 07:51:35 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1LnQ-00000001sRc-3dPT;
	Mon, 29 Apr 2024 07:51:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1714377087;
	bh=BWyVfoj+iRD2BnNonBeIbbnRWHTLN/2uky74f6rSTMw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=eIcN00AcO1/ueDSjKGy87DThfsuMl5E5GNHL0dRxWRtsy3V36PwaGFbPx7fvJYv2l
	 yJ3fUmYM7wPdbNfweFEsZdl0MHzL0PzgWMSN8KHL/AuBXHCZRA7UpMocxP5wJVG3j4
	 Te/Bay7g2F9lMl3PbDaUL3uVkuR6K/Pe6zSArOPzqz4RscaGmv/8u81PnEZu7pIbLc
	 KGiTgCzYlWz5TD5YUae9xbd1FC2fJEn9SVOeglEJdxPnMNsFBq1W8gmo8s5RwetOtP
	 O1NBeBpFXdMf3OHaOnVzPqKNm61XPuNPY5nolcTc1el7TOvwLeuHs25xGM4BaZ7uAp
	 4KnUgN7FaaOHw==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 24F77378203F;
	Mon, 29 Apr 2024 07:51:26 +0000 (UTC)
Message-ID: <16ae9734-3c02-446b-9b9e-93c531c91f5e@collabora.com>
Date: Mon, 29 Apr 2024 09:51:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mailbox: mtk-cmdq: Fix pm_runtime_get_sync() warning in
 mbox shutdown
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>,
 Jassi Brar <jassisinghbrar@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Jason-ch Chen <jason-ch.chen@mediatek.com>,
 Singo Chang <singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
 Shawn Sung <shawn.sung@mediatek.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20240426020121.5273-1-jason-jh.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240426020121.5273-1-jason-jh.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240429_005133_174334_7115D30A 
X-CRM114-Status: UNSURE (   7.75  )
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

Il 26/04/24 04:01, Jason-JH.Lin ha scritto:
> The return value of pm_runtime_get_sync() in cmdq_mbox_shutdown()
> will return 1 when pm runtime state is active, and we don't want to
> get the warning message in this case.
> 
> So we change the return value < 0 for WARN_ON().
> 
> Fixes: 8afe816b0c99 ("mailbox: mtk-cmdq-mailbox: Implement Runtime PM with autosuspend")
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



