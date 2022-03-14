Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD35CC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Mar 2022 10:25:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ORqjAdmPx4OIS3WBgsTTsXlfkjXoL1Im3M14na/BVps=; b=o6NnVl3wXgtA4S
	qUF2Sqcl6o+OZSXk7F8zvgsIEM21fm2ibI4QfzSy+0mb/KOtqqvnUS+6vMykK1M5urFg+ELIRPiVp
	c5Ggru/XkN59DMhRTm26P/orirOaCP09VSXOZDTDfXJImUe3uR9A6Skkj9KBJcVP7Mvpm7f+htZwk
	iHe8+IVLW2s6CDWM9cdndN0zHe8ycLEw4gdqsZcAqIXR2YAE5qG4ylWPPS7KQMrgpimo7QNIId106
	9jOBGeheb6wR5wvXYEyKTtDHuZ0z0jsoZn+eNdnNX+2KO16c0Qmp/SWP+J76ItSzLPpN9fZnTGWsW
	Y0FCfN2++aqGVw2oHUcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nThtd-004wK5-1e; Mon, 14 Mar 2022 10:25:49 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nThtB-004wB0-Nn; Mon, 14 Mar 2022 10:25:23 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id CFA991F43502
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1647253520;
 bh=yIg0sOPQ7n3pZ3uL8omVK+Yinivb2f5C8PjuJhAz0ag=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=VVz+omXpnFBWYJtO9Kbp8aAHf1WMdAbBbYkF+/cZGalGFONJI07ZqnaFuEXHVx2L4
 k+SDs+MR6jppolMcSbNdzPzNzpVswWVBWJQZbEBjNNLsUW1Z9WD9GDK5QberBMu/y0
 +nEZF0PvEhfemowgypatod4dDtPX7YCEwjvikdWWQLnsWSUGgC78zFhgEhzggGv9bP
 sEHD2RCzY/p+ONffLaUusXH0uYc/4XaPiahdgnH6hQ7xLQy7eJ+VfC+iE7FKHF2UHS
 Tj2vkiYym73NU/+dSoA5XaFPJAJKVitmd3O3TRNmSAWjoiNb1idzv+FWI4WvK/NzK5
 zsapokAOiiIKA==
Message-ID: <eecc3d4c-c259-878c-bc0c-145ef8ab48df@collabora.com>
Date: Mon, 14 Mar 2022 11:25:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [v3 06/19] ASoC: mediatek: mt8186: support hw gain in platform
 driver
Content-Language: en-US
To: Jiaxin Yu <jiaxin.yu@mediatek.com>, broonie@kernel.org, robh+dt@kernel.org
Cc: aaronyu@google.com, matthias.bgg@gmail.com, trevor.wu@mediatek.com,
 tzungbi@google.com, julianbraha@gmail.com, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220313151023.21229-1-jiaxin.yu@mediatek.com>
 <20220313151023.21229-7-jiaxin.yu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220313151023.21229-7-jiaxin.yu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220314_032521_937448_7162A72E 
X-CRM114-Status: UNSURE (   7.57  )
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
> Add mt8186 hw gain dai driver.
> 
> Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
>   .../soc/mediatek/mt8186/mt8186-dai-hw-gain.c  | 236 ++++++++++++++++++
>   1 file changed, 236 insertions(+)
>   create mode 100644 sound/soc/mediatek/mt8186/mt8186-dai-hw-gain.c
> 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
