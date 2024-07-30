Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D755C3DA70
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Jul 2024 15:01:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:Subject:References:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fzQR8FFAK3t7+2p17buzYuiThMVwwBizpzlOP3GSlj8=; b=XXnIx7bLmbocf3rLVwqkYu/kHS
	EblGlZ3bE6KHAeM55KtF++H3LLZXPsge1K9QzRDcHd5nU5N10pBBNPjfWsOk9J3PVS7+kGFl+4QPZ
	GqnKeTv/R8eXO+DwbwljcQ1hPg2R9cLTGOBX/dKz1BUpv4azXPOtT3qpVmiww1oHohzX5E2O2UY7P
	T6VaYHOl4kDqhPcufN6SaaE6sGSX3Gz79x/lDu1q34DyZKcCaByK/O4AJanh4kdHEcq4CetBxqVqg
	8JT6DebSrHRuOi7s7q8WbHBwdchqTtRVu2nMB5lirwmOXJb9HCfMX7uC9OEczpCi9og9ZidkvwNVw
	gBSgDROQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYoLn-0000000FZ5B-3cT1;
	Tue, 30 Jul 2024 15:01:19 +0000
Received: from mout.web.de ([212.227.15.4])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYoKx-0000000FYpz-1XQJ;
	Tue, 30 Jul 2024 15:00:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1722351619; x=1722956419; i=markus.elfring@web.de;
	bh=fzQR8FFAK3t7+2p17buzYuiThMVwwBizpzlOP3GSlj8=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=SZ33MQPcPzwuLTVOaAuIFcUXcJ/beaQl8rUgcEJZSQ5g6wEB/pg5XVTiKNkT/NPP
	 LxTt9N5eJhGyqskFL/xQzclyRO6ZC63gLCfRHpZVmu1yDs8IGERT8yUZTRzB7ENsS
	 mj9X/Kh978YrttoI7vqhdy5BjzztdIXWVzGnCReC6eD3Kw6aVNvpsudMBYRxGSGhI
	 L/QLEdPFhZlC2V9z10GpKi0zOGXKVkRY3ClhMeAebY5j80ZyGGbtJtYBxONv7qi7J
	 0HljMTJh7mDJwyxLa8rhdGYU6I67l0LbbUihAjcDzkvNasg2WfR3d92DZUJ2ZxSVW
	 SEsSDe7p9Pi2y3luiA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.90.95]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MFJnh-1sRzvG16PR-00BmDG; Tue, 30
 Jul 2024 17:00:19 +0200
Message-ID: <f88557ca-536f-4ea4-ac13-e20fb296195c@web.de>
Date: Tue, 30 Jul 2024 17:00:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Florian Sylvestre <fsylvestre@baylibre.com>,
 Julien Stephan <jstephan@baylibre.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Paul Elder <paul.elder@ideasonboard.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Andy Hsieh <andy.hsieh@mediatek.com>,
 Angelo Gioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>
References: <20240729-add-mtk-isp-3-0-support-v6-4-c374c9e0c672@baylibre.com>
Subject: Re: [PATCH v6 4/5] media: platform: mediatek: isp_30: add mediatek
 ISP3.0 camsv
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20240729-add-mtk-isp-3-0-support-v6-4-c374c9e0c672@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:4Zb/x/JAgneBRKvvPm7xyrFIbDn22ofBuCL90y77rx2Jfy2Zbi2
 RJ6KHcqJfBXMxBGJWCexAO8OMDdoKFRK0ClzvdKoTH97oQgYRBc9P7FLWwOrTuRJtNCkuIA
 bLSAeCcxrEr5KQt/mJ33MA2xFGWiFIVU96M6cIcgW0f9M8b0eYeD+itSGxBveAzdkk2xagE
 c3CinLYom+6K7w6U8YTOg==
UI-OutboundReport: notjunk:1;M01:P0:bHM4AXgBl7w=;lD6T+yVR3keWuF801q7VmAjs13/
 gwxHaMPiF66h5qf0tryLq2OfzWDbHh6meIwbYdkSypjLUV3BOnLeorO4UwYI2iWQsx4YHs7Rv
 /P4mnaDQZFDRCDr+Vywxzz5PalF1juvLXQEXXHrnoKvFNPA3DDcqX+cXZsn/Jx228jKPMbjoe
 GWqRDT61JvCoa2lqF5iMciRoIlvyVVH+pxxbw/olVwe/tLgsbz7EGgBXhXnbm97nO7ZnoAay3
 6mufhXoq7vynQNx1Whg50Iuv5c4tIPxJrLACcH3pjaLxFFHyNl6/+BpDqtdPIHjaMFAuoViju
 USpyhAY6LiryeON9/rh3j8fARMaccC/sMtxDf/B4DB2Rdd4OArxvffZnwA7U9BVaj/nRTt2ei
 TVWCftEzH2BaKLq50VZSAfMm3NBpCD6RVUs8TpLaLgTuKQSoqXdZEUCjREHL2dGzA9k7vybml
 4pHlZxYv3XA1Mz+R0AERoK54ESzsBXT27YMflMGGKHAXS/stlgNJ9X1HyQmm3hr/9zIOHdDzM
 y1PcCglz0zdAyVE1apYyqAMjdjXFhoM3n9p4ltiewazV2tMc4ZMnreQxSaNaNTzN0M5e4jXJ9
 YyB8nK6+zoSdXpXC9dXdGbyGLW8vjcTzn+cY9oAi2Ff53WIbbe9iHAEcf0dmoD3gZECjTwDez
 m4duuqDqN9KFcx6/nGDGWD0MFz4MNY/iVYTkkx0IVulRQxOF45P0EapBtEdq4tfgh+9WCLfbc
 8b26+A1XqGrHiCaGZuFavo3brp94dq/aX724fQSMBdsgAu3ukpuZHbYbFgPEBMgPZfZu09GrI
 8jdThC2m+7BJIeO7fBQD4M9w==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240730_080027_714727_8AC33205 
X-CRM114-Status: UNSURE (   5.60  )
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

=E2=80=A6
> +++ b/drivers/media/platform/mediatek/isp/isp_30/camsv/mtk_camsv30_hw.c
> @@ -0,0 +1,413 @@
=E2=80=A6
> +static int mtk_camsv30_runtime_resume(struct device *dev)
> +{
=E2=80=A6
> +		mtk_camsv30_setup(cam_dev, fmt->width, fmt->height,
> +				  fmt->plane_fmt[0].bytesperline, vdev->fmtinfo->code);
> +
> +		spin_lock_irqsave(&cam_dev->buf_list_lock, flags);
=E2=80=A6
> +		mtk_camsv30_cmos_vf_hw_enable(cam_dev);
> +
> +		spin_unlock_irqrestore(&cam_dev->buf_list_lock, flags);
=E2=80=A6

Under which circumstances would you become interested to apply a statement
like =E2=80=9Cguard(spinlock_irqsave)(&cam_dev->buf_list_lock);=E2=80=9D?
https://elixir.bootlin.com/linux/v6.11-rc1/source/include/linux/spinlock.h=
#L572

Regards,
Markus

