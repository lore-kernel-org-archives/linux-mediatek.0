Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 633DEC433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Jan 2022 15:54:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lCvEJVm555rx0fTQfms22GylRN3mZ7MnxjheCgsvvHU=; b=HEC5hzTgqClkV8KW8At0u21NRM
	tT2+GWdsILQSfcdVaTtuodJlqMBW+F2Io+9XTLOIHOn3XSvCf7+Zn28DK3p2JakViYk4S01AlWiWT
	02Svx29QHxwn36zuS4DYtNYpzwItbdhh2S1hk2uuNoEyOtSjEyY+bAZOQ2/EqrbnjGjDTnDXAovvg
	26Fr++FsRwWAQJGVDFPanYnWXSd3BHXe9YU/5yXa/e8uhxihzR8ZhMbyCkYNZXR5dGbjoLYhiVe3C
	t64joEdV7RKIoBR3olSzHcwAoKrpe+YS+4qmIIVsJ2/t5+8IyaDdKb/d82pqec6mnXLqwKyW6ejbS
	5vCACfWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n6wzf-00CBhz-L2; Mon, 10 Jan 2022 15:53:59 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n6wwU-00C9Vg-FG; Mon, 10 Jan 2022 15:50:43 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id B3FE91F43321
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1641829841;
 bh=6/zAzRnOeziEg/t5fiEim35KaWTuX68SxoEub32prlI=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=GW3Dg4Rw20Hg99jcjFlDX54Ot1QMlbkQrEFbUjMG/t9RtxJySOh0ukk+h+5dfStGq
 scqaQ9FCp5AeUbe8tp5UCEijojFV193Bijw385i2iWw0fLdcxdf2tiS+rSCb3xO4eh
 UOBU6YPwl+lpB77MDoRH4NVXJhrQXAsAtw3CVcuwPo8MHilBc7ptr4NFbmF11iCp7Z
 OIXkwWy2zEfw6ztJDREhkj/ywpau/chRiMEwONxoWDZa3rif5dt04OfQ6Ae7lfKind
 mA0fHYJ8G8YIaNndzkA1iygNUZwLqWfr52mIvKnVGxH7E3i7zYLJHOqmf6pBUN5++f
 OS4MoSbn6Hq2Q==
Subject: Re: [v1 06/16] clk: mediatek: Add MT8186 apmixedsys clock support
To: Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Stephen Boyd <sboyd@kernel.org>,
 Nicolas Boichat <drinkcat@chromium.org>, Rob Herring <robh+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220110134416.5191-1-chun-jie.chen@mediatek.com>
 <20220110134416.5191-7-chun-jie.chen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <9f15a4ea-9a45-9c8c-92c8-401144bab929@collabora.com>
Date: Mon, 10 Jan 2022 16:50:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20220110134416.5191-7-chun-jie.chen@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220110_075042_704240_D3EEE71D 
X-CRM114-Status: UNSURE (   8.89  )
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
> Add MT8186 apmixedsys clock controller which provides Plls
> generated from SoC.
> 
> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>

Acked-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
