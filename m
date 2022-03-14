Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFC68C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Mar 2022 10:26:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qXWqlpXc9dipqTAyNlDIUVQmPYbm0AhFfXxwuyjNpGQ=; b=W6Mlcy5LRbNP8l
	jYha+M2rBfSU/x648YrpL0QBPfL8rLK+XVN2j9HWDRIA5KyFsms/ZVcjcMrmbMiD/0eMcPlBdWZOh
	SXrwNawEPaSBRYtPmWpc1rzhVuE7hNbWcohd8F4b3qqAxMDw/oCNlkMNzaupM+3laGz2Kai8cD4Dg
	wgYrSJdo+dNph09GwpcuaYoxjj8ynUlw594YRXw1ZTLqa2MqGeGJ+U1r+iSw34F6KPoHfI6htY3Dn
	O5XzhCkFs4iS17h/5JVIvQSdSPGZzUUXeq7eLs2lji/hrmKv113anr94Vq1kIVk2OKzFXWhxty51E
	3ziZDVutUloLIatjK52g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nThu8-004wb6-4X; Mon, 14 Mar 2022 10:26:20 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nThtF-004wCW-3m; Mon, 14 Mar 2022 10:25:26 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 489EC1F43511
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1647253524;
 bh=tyJL5hF65QyMph+7DtjWZYFL2Qzea5pUr0xp38Yx7bo=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=V5Yw7/epWa0vrRb9G9PpmchU0FQS3UJZEMSFlkQ7E00UWWSNLN4lPorRW9TM2ocGN
 uVREdeLNVzGlQ/4jcIgogV0YLO1c7Gq0P/Sop1BW+tj2o6ChKUh3P3IuMxRQziIMcw
 2JuhmTnipYck0SlM4Lqxyj21lmX/Hkz66nk5TeYulwWV0E6U7CCkts6hQw2g5geiaW
 XlY7XEAyoqXVCNBy9aoH+rTUqHf/zIvBJE/cszbI32FtWdVxqog3eqJgCorgfNQ84M
 d2UdP7OmBTFGOyaTxt6pMHGORHjmNuFz15VmVMLdqbl0ykfRxyoSWmJY4iejHGiqAU
 XLJHe/VM9FhEQ==
Message-ID: <aaa158d8-767b-8a6e-b708-4bfe60dcb67b@collabora.com>
Date: Mon, 14 Mar 2022 11:25:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [v3 14/19] dt-bindings: mediatek: mt8186: add audio afe document
Content-Language: en-US
To: Jiaxin Yu <jiaxin.yu@mediatek.com>, broonie@kernel.org, robh+dt@kernel.org
Cc: aaronyu@google.com, matthias.bgg@gmail.com, trevor.wu@mediatek.com,
 tzungbi@google.com, julianbraha@gmail.com, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Rob Herring <robh@kernel.org>
References: <20220313151023.21229-1-jiaxin.yu@mediatek.com>
 <20220313151023.21229-15-jiaxin.yu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220313151023.21229-15-jiaxin.yu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220314_032525_339732_ED4E2972 
X-CRM114-Status: UNSURE (   7.19  )
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

Il 13/03/22 16:10, Jiaxin Yu ha scritto:
> Add mt8186 audio afe document.
> 
> Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>
> Reviewed-by: Rob Herring <robh@kernel.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
>   .../bindings/sound/mt8186-afe-pcm.yaml        | 175 ++++++++++++++++++
>   1 file changed, 175 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/sound/mt8186-afe-pcm.yaml
> 



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
