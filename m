Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D96BEC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Feb 2022 14:34:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=idBkbgrjzDLtDa93LjYv+u3Iu4xXnRYo2BfFkOQayeg=; b=bB3v3P8VVxqxuU
	GtR+zYEPqyD5GHebZB+uji6I2C+ZNIU/cyeinl6mB7oIf0LnkBVphVFOeaCf+YpPExk7TvNZMYJQT
	SfKln50+J1JLuTgYkpe2ESEBu0LsqKGI26wDmlUoi38FaWzGIhKWDosr0BoT3+wIeMq2fqU5YvyyQ
	GsbXHYwUdXOFx0Vde4HDL6CCf15G4EPu62S3PApd0zh+7cyqvzalxXzrDd0eQI5wOYZBX3RzY5qKu
	WmDjZxHTszvjFLE4/zUaEPLXAFtqMZjoyX9I7XUR6//gjuh+L7vL9akNWbVPXlyalsapjQpPpjKl6
	snldCltTSzY0r3oLJ/sA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nM9lN-006Eqh-UG; Mon, 21 Feb 2022 14:34:05 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nM9j8-006DNO-AU; Mon, 21 Feb 2022 14:31:48 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 191C71F437D2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1645453905;
 bh=0SdpPEauXNzY5/p2lCtGwuIBpqYbTUZXIlAfLEn2H20=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=dwhAGcIrYwHLj0j0xu6MvCu30Tnyt3JYge5EP4xZoyrn6izgiia8wQrpnA+m5Jc8I
 kPg/yirq1lvyOhJkalksEhZHi3il/1BZ/nwdD15pSLRn7ZPBYAODhd5xwE31AoHyKJ
 sePObvbqtuuc/PUVfVsbUpifKz+wbaHl11CvVNfJ/rtfBU16adDpDxjSBcfHLLWRoX
 NaFMfFtPckk3WZAk6d8EncAyVvHG6Pttms1rk89qvYsTCBfEo/1gr5BHD+zvUxg7Bk
 eBoWg9Ja3Zf6W4/KN7slrYi9FGdBsmnrefigJCgWgtcdK1FykWXsWgExfQFdbKLqHM
 ++rFpHTPe4nlg==
Message-ID: <609deedf-df56-ee9e-42a8-1ccc178de074@collabora.com>
Date: Mon, 21 Feb 2022 15:31:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v8 12/19] drm/mediatek: dpi: move the csc_enable bit to
 board config
Content-Language: en-US
To: Guillaume Ranquet <granquet@baylibre.com>, chunkuang.hu@kernel.org,
 p.zabel@pengutronix.de, airlied@linux.ie, daniel@ffwll.ch,
 robh+dt@kernel.org, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, matthias.bgg@gmail.com, chunfeng.yun@mediatek.com,
 kishon@ti.com, vkoul@kernel.org, deller@gmx.de, ck.hu@mediatek.com,
 jitao.shi@mediatek.com
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
 linux-fbdev@vger.kernel.org
References: <20220218145437.18563-1-granquet@baylibre.com>
 <20220218145437.18563-13-granquet@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220218145437.18563-13-granquet@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220221_063146_528539_05C6513E 
X-CRM114-Status: UNSURE (   5.47  )
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

Il 18/02/22 15:54, Guillaume Ranquet ha scritto:
> Add flexibility by moving the csc_enable bit to board config
> 

s/board/SoC/g

After the change,
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> ---


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
