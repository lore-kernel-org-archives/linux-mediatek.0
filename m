Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F351BC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Jan 2022 15:59:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qAbyonxVyg7XiRvAonAYc4ruGbxbz2SnWQ3X46x53NM=; b=QljFt2zJyWeWSZ0OvlHB6LyTRc
	W+9gfGq26Ihaag97TqU9XxGAcxei50+hkwlfafjk4swCEX0xlMjAu7bFFtoBHg7sWsWfxL+Ji6roZ
	1X5sfnqDwqz2HjPUdMOIFI9qmjlXvjcWxJbCN1jLs9VlSNHXM6IphiG148Habs0LD6dPiT/dsuT7n
	cNwyn7DS4Sv+uGSm3VeaDP8ojNh+YP/4nwNylqoimd3tvrEivtf7lb3q3M8oWrxpLo83REKkUfBt+
	OxjG8A0/qe3l/IAxjjJCmK0L105Jkn70SMjjw/wLpCEG2bwKQZPv+R+91unaC+ch44F5FTGjSPr+S
	lBfpr4HA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n6x4U-00CEOW-DK; Mon, 10 Jan 2022 15:58:58 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n6wyI-00CAqP-Gz; Mon, 10 Jan 2022 15:52:36 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id A31E21F43333
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1641829953;
 bh=FD4OrOm4vEUu599uP6rN4wBZHxBx3syC9RwGD2S/KAk=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=LNSUbKQhjYkrgyJWNjXxgjJWH6iEnodHeDN3Lgsa8vZ9AoZ6DcjQ8MwS9BwF7BwxT
 fs7SRDq6wKfK2f7H/kEziA2X8NZqkqH5tYQWo6JaZUD7ap1/kpwQKK/NY1UKtJo7cN
 2pvMq5P17FhCEBdjeO0jB0X8K3hN8bnUD7WZEvUERrpGgQ/SyrVcL61H/Fat+YbUpa
 nmJbtqx+G4wkQS8RDulTUecqPUVW03OsNqhMSBnfsv9l68pYSmIj4r21Ri6ox/nxK7
 wAQrVweoifjJV6YDJe67TaEpANuAObJmiFrt5WPBJvjx5RRv9shrTS2tELyYfDIYkh
 WVnvc4GPkASQw==
Subject: Re: [v1 02/16] clk: mediatek: Add dt-bindings of MT8186 clocks
To: Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Stephen Boyd <sboyd@kernel.org>,
 Nicolas Boichat <drinkcat@chromium.org>, Rob Herring <robh+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220110134416.5191-1-chun-jie.chen@mediatek.com>
 <20220110134416.5191-3-chun-jie.chen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <1254b48a-8aca-b791-a352-3aad9135d0b0@collabora.com>
Date: Mon, 10 Jan 2022 16:52:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20220110134416.5191-3-chun-jie.chen@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220110_075234_790984_B3010516 
X-CRM114-Status: UNSURE (   9.71  )
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
> Add MT8186 clock dt-bindings, includes topckgen, apmixedsys,
> infracfg_ao, mcusys and subsystem clocks.
> 
> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>

Hello Chun-Jie,

I think that this patch should be squashed with patch 01/16, as this
is dt-bindings as much as the yaml that you're introducing.

Regards,
- Angelo

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
