Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5722DC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Nov 2021 09:54:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=46CZ+GSkRrnWi4Zu5xCNrblUHR171FIRyvSlsyZeqRo=; b=swIT6G0G4/yn9jbK3qJwxTuioG
	EY5dNkV3PvWRYorVdBWQo/tGLAQgAmz4K7iD23WXaOlbdB9VMK4LjttJ4hJaqX8baGmktwFd8VvNE
	TpdM+axOXUlPhjlb5e7J3KLHOyNNfiC21hpM/mzSulTl6ieO4zRvrqzh9dS3rf2KEYRbwNcfMz22G
	viXUDTQvSGKVYEhyQHWRw641N4n9FPwW2O9aJydItdrpGMghgke//+8PnjWqOII2g8FrPztLWAZji
	ZRqmIMX3JNe1H9nLkHsj608c2D4kURcIh19bpgYi0FxqYkcsUagYBEKzW46qFWmMDZvwvRE1iKj6h
	NtaBZtyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mqXvX-009oQj-4Q; Fri, 26 Nov 2021 09:53:55 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mqXuP-009nuh-7k; Fri, 26 Nov 2021 09:52:46 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 7AEC41F467A0
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=collabora.com; s=mail;
 t=1637920364; bh=rVOstqiVmOsKMfWEUSvwqUjE3oNqTc8x3v1FWlLX+Z4=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=FDgBPLPD0nXzVR6W3alw6qetAhJNcx4e2owuUkbCUZuZ55Y41SQF/bq2zPfrOVrYX
 Oii6a4hQl12UEYfLbjbhQu2psmE7CGah7VFRY7lQnNXlYH9lMVokExY/howpToA3RP
 RpjPYiVOfVC54t0SVFSLTAjZ8D6zpX6ULRaIozlSFRNm7Z4ZVlMFDr9T/PWpRLhV2Y
 GzCs8o4wlmolDQPSEj0DEYd/Ijk4pOUkXYluc/yHwQ1lncjXiKMDBikjQhJZPFzCER
 4KK8DUyAU6rhWHVj8Gx06PtNUC+QZxnGbAnczEhZghuwk366G7UZLYmHhBpjvoIuAN
 3DDQMYibBg0fA==
Subject: Re: [v6 5/5] soc: mediatek: pm-domains: Add support for mt8195
To: Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Enric Balletbo Serra <eballetbo@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Nicolas Boichat <drinkcat@chromium.org>, Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 srv_heupstream@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20211116025045.5401-1-chun-jie.chen@mediatek.com>
 <20211116025045.5401-6-chun-jie.chen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <41c192ff-0b37-653a-f43d-2ca6c804077e@collabora.com>
Date: Fri, 26 Nov 2021 10:52:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211116025045.5401-6-chun-jie.chen@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211126_015245_490759_50841E16 
X-CRM114-Status: UNSURE (   8.94  )
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

Il 16/11/21 03:50, Chun-Jie Chen ha scritto:
> Add domain control data including bus protection data size
> change due to more protection steps in mt8195.
> 
> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
