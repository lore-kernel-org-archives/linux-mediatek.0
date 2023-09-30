Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9DB0E77361
	for <linux-mediatek@archiver.kernel.org>; Sat, 30 Sep 2023 07:55:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:CC:To:From:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QzUTGFm+fyQlDNRotteAOBG/4ebGcwE5l/KdrOTlHGc=; b=wiZ4RZkv7vBgki
	Im8gunCqepqsRyRFXF8909SMM+Xko9dWkh8+9a1SP7jqlvoxxgxRIas6313lMlzJWsTSyjpdo6Pt5
	mdpxty7ylUNLiaCApJSYUfyyuv8cZng4/UXSo66IU0opfrlX5bhyXebbx8/Ch02tWP+g5jPO7uNUY
	mlj35tlT6SLLwNPeL9sauhJhnRiKT0wBeN+VVIm94qugE+jE9HhKUyI+KnCAx4BFiVTGlliO1+5zw
	TxGp6vODh61KfU6kPMbnQLRlt1INfTxNoq3n2TXBuidmAxV+68Pd2ZB/pGQIC8XxKdkcf0inbdUi+
	GvuCgGZiDSC4xqWlHTPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qmUom-0098El-31;
	Sat, 30 Sep 2023 07:55:16 +0000
Received: from mout.gmx.net ([212.227.15.15])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qmUoj-0098EK-2e
	for linux-mediatek@lists.infradead.org;
	Sat, 30 Sep 2023 07:55:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=public-files.de;
 s=s31663417; t=1696060500; x=1696665300; i=frank-w@public-files.de;
 bh=QzUTGFm+fyQlDNRotteAOBG/4ebGcwE5l/KdrOTlHGc=;
 h=X-UI-Sender-Class:Date:From:To:CC:Subject:Reply-to:In-Reply-To:References;
 b=R/s+fzvfQDb4tPOoWn/f0yZz3fsstVxeoSPAsiwiLDIYK9ifVbUA7KzrtkHFlbWtLNc0CEB5007
 +d1eP8Mz3Ys3uFa7f5sfnZiJnu1zEDDpst7MoHjtIVuLDLR18+ddop3MoIq14RcDaoEccBCl+0nSQ
 PCY152SPf+1FJwYFSH50W7MEihpEZ6EDLKiePX4vVAlLDxPiKHrQDzC06SveR7xrVrhk+txFwnt+8
 i0YcRS6jjAsJaud8Mo+KEMHGRT8hPW93F0NhPaqkRLcBqN2mYUHWYStfTdH1nvzP4y0XVv9Uti/Od
 NbxxeUtt9rTuNR9QnhcPXc2I05UEIypFLZQA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [127.0.0.1] ([217.61.152.33]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MTiU3-1rDgqn1Bkb-00U0nP; Sat, 30
 Sep 2023 09:55:00 +0200
Date: Sat, 30 Sep 2023 09:55:00 +0200
From: Frank Wunderlich <frank-w@public-files.de>
To: linux-mediatek@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-kernel@vger.kernel.org
CC: nfraprado@collabora.com, wenst@chromium.org, matthias.bgg@gmail.com,
 robh@kernel.org, amergnat@baylibre.com, arnd@arndb.de
Subject: Re: [PATCH] MAINTAINERS: Add Angelo as MediaTek SoC co-maintainer
User-Agent: K-9 Mail for Android
In-Reply-To: <20230929082009.71843-1-angelogioacchino.delregno@collabora.com>
References: <20230929082009.71843-1-angelogioacchino.delregno@collabora.com>
Message-ID: <52BBF3AC-ED0B-4B5B-8773-E7C3E0DBED73@public-files.de>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:o1G3x05zu0TFCCHbeK2KUw2yl4D8cXVN/J+/B7vxO/P/6N6GEb5
 U//iwjR4kxM0qCnorj0L2dp/gOxfPAUhV5lJlOMeY1dnbqcQpDrIHcUTPU71td+NIta+4f3
 vY1cgCa5Kfgtk/90nJBpLPmh6JC7wXBrUmpKPliPMUjPCneWLd1YBDCBiHzEstVBVnC+YTu
 ggoDZM3WQThhQAvmD0vAw==
UI-OutboundReport: notjunk:1;M01:P0:lGucr4hleHI=;9wQfcWL9wonTfudhTxZlEUX55B1
 PGRwYMwhY13kB5wLTlpgSDHIIGTc8OPlba1e2u4TrgsGwDaIrO9Tag0f4aLLtvEGXc9Z+67l1
 KehNm6OQWdrOZvhn13GgqLh485hchpyT9eJszpHZMhBJB/e7AlnzfXOzzii6TKMSyOnJYFQdY
 KT0wZUQIfpKJv2OO5gal2+5lh3oBGVZznryyrRA3lEywBHz7j+s7sM21nQJysWlsuZ8oOIaTY
 4aSPvxrdMg4qRUsNV91Wumd41bapmrDDstfuFz0z+j4sO5KXPDd/bGOBcRCnKXpYLMmwnvf6r
 38jNHMyImUzrpfkhVPHVPKAA4bgLJH6LK4w7cldKy2zMyxmzBScaXmXgGToI0azU+ZuHsV64f
 TbswwBR4KMrNu7fErTMdHjf5koLZrPxtJlo14m4wvz5TgkeG76hbdzKlo4C7Scfp1fIH+7Ljp
 wNBb1VGr9wxuK+vU9OlFR4ApSTVCskZ3k1KNj8fevnziTZzpy8ShCbo8i80W+yyTXOKUa+Kdp
 gQZVQZ7BhdEt+DCPoFmE8sziXKt2iAvBS7t4IeIqi2cKzWVubLk1cBmO+o6e0pZmV794QgwfK
 TBzx9YPqEteJrmEeuwBYzt9ZzMVEbq7utw8wPa2f+ZyBYXvp7D6sCtt4e7vupt7bAsrckekke
 WSxD2+kQEn942byDmirbUOldqc7YXf+xLIw7zYzbr8HIrRmHP3scr27CIqkQN9QMvDhpEmejM
 QqwSyALk6SzxqPz7OkGcj5ac+uHXSsxzVHFPUzGc15MzlTPxXiT6kSOSZhp5brX57derSkr9R
 eYb8PwlWcEHIZcv0HMYKz0XmOq3kJNKhEEhwgEgWIbxyTziabP9usBoL3xDq9zFw+O0vj0WW1
 pixvwkArc4WfKqqEjKx7ufYWZ5Z17QW1R/kEOE7MCXSF9X5xjO415ljC2iVBi8rmt894GaoS6
 /kjVAju6/XZNqBodXDqOAfMHw+8=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230930_005514_247258_05E665E4 
X-CRM114-Status: UNSURE (   9.28  )
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
Reply-To: frank-w@public-files.de
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Am 29=2E September 2023 10:20:09 MESZ schrieb AngeloGioacchino Del Regno <a=
ngelogioacchino=2Edelregno@collabora=2Ecom>:
>I am a top reviewer mainly for MediaTek SoC related patches in most
>subsystems and I've also been upstreaming both improvements, fixes
>and new drivers and devicetrees when required=2E
>
>The MediaTek scene saw a generous increase in number of patches that
>are sent to the lists every week, increasing the amount of required
>efforts to maintain the MTK bits overall, and we will possibly see
>even more of that=2E
>
>For this reason, and also because of suggestions and encouragement
>coming from the community, I'm stepping up to be a co-maintainer of
>MediaTek SoCs support=2E
>
>Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino=2Edelregno@co=
llabora=2Ecom>
>---
>
>P=2ES=2E: I tried to reach to Matthias for almost two months, but I could=
n't
>find any way to talk to him and he has been unresponsive on the mailing
>lists as well=2E
>
>P=2EP=2ES=2E: This also comes after Rob Herring's suggestion to have myse=
lf as
>a MediaTek SoC co-maintainer [1] and support from other people=2E
>
>[1]: https://lore=2Ekernel=2Eorg/all/20230804225813=2E12493-1-robh@kernel=
=2Eorg/
>

Hi,

Thank you Angelo for supporting Matthias here=2E I also have no informatio=
n why his tree is stale for more than 2 months and also got no response on =
direct contact=2E I hope he is still ok and do only need some free time=2E

I waiting for these to be merged:
 https://patchwork=2Ekernel=2Eorg/project/linux-mediatek/list/?series=3D76=
1293 =C2=A0 https://patchwork=2Ekernel=2Eorg/project/linux-mediatek/list/?s=
eries=3D777712

Do you have created an own tree from matthias' one or can you directly wor=
k on it? If working on own tree please send me the link,so that i can track=
 when changes (also from others) are merged=2E
regards Frank

