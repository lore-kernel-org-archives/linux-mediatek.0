Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11ABEC43217
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Jan 2022 15:50:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2G8T/mvi7icPlGH/7N2lVemGteIFZfLk2/JoAG47JbA=; b=FivjZktEThPC0aTgCIJ3ITjgZg
	eoMiQmMQlsSAYyWGQw1c8TKUGc2gVvKwrDjbIlkgu/d0wdaYYRiGYgFzBc/3asb3ahEK9WMR4XEGh
	xlg1y6+hNpPWQ1Dwf2mG9CC9mwNB1enj+uAgdhL45ngvPumtXreELcXL0uXM7JKnmOl9VM/13vWVz
	qHP+oB2HIX2U7I5biEkRyuXoHUroG0TUvja5d1UZ4dJuDFbdJFh252R+wamn1Q97TaQGHahXNt2he
	gE4sG8WaL+mG7vi886CJoB3yfebrEtBNX4s9BED+ZF6ooOEpzFI5UBm5o+ftBPEGIyIP+hkhR8lMu
	5xs4yO/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n6wwG-00C9Kt-PF; Mon, 10 Jan 2022 15:50:28 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n6wvW-00C8qk-4x; Mon, 10 Jan 2022 15:49:43 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 7104E1F431E9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1641829781;
 bh=bQtHtp6rQ3lVrczXWSfJ3TrGuKi2AAQoQjw5XoFAl9Y=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=Qb/IblBJ37oy+oFi+9M7w6TDLsIQuzDgY3q8EWfxk2ERM4a8wJyO2loIPa27Bvu24
 fieqJflCOndRwtCPOINxvS+GSSdbDElTkwm6F85z4/+QXCQX3k9PMD+1JMvX3Cu6sM
 tBvkhKKD6FiFSmmL7r67balrdPXOBbfNnWiWSuy+QzJAZWI98uhkaKqvsY0dyWhe40
 DjjsUFR9dp4OvyU2cHaOpqDQZcZL/4cFgVF2R2YfaqOjuFvkVfDs07UZ/atoCTl+r/
 oTccaoursygsC6dJKDcLLr9wwwyQlm788athdTZ3TUBRhsdJfjUKhU2u2ZF40zRnut
 PE1qX+vFZNOvw==
Subject: Re: [v1 12/16] clk: mediatek: Add MT8186 vdecsys clock support
To: Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Stephen Boyd <sboyd@kernel.org>,
 Nicolas Boichat <drinkcat@chromium.org>, Rob Herring <robh+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220110134416.5191-1-chun-jie.chen@mediatek.com>
 <20220110134416.5191-13-chun-jie.chen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <1d2d5aed-1b4d-2800-85ff-d9a0887d3263@collabora.com>
Date: Mon, 10 Jan 2022 16:49:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20220110134416.5191-13-chun-jie.chen@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220110_074942_365559_B2AD8EDC 
X-CRM114-Status: UNSURE (   8.65  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 10/01/22 14:44, Chun-Jie Chen ha scritto:
> Add MT8186 vdec clock controller which provide clock gate
> control for video decoder.
> 
> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>

Acked-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
