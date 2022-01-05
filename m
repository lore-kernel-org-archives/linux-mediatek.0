Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EC3DC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Jan 2022 09:20:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vvzMUIio+2YUVovUT/n10BC1PgRhvNYplw/yrvZcoMU=; b=ileHtDfvjsszApvoTbJfIhX772
	ocbyADOKWzffGh6MUZCDpe2ptA+Y6mx9cvcBPjxgA4CUYucNZpg4++V7y4/7+d7kMOZIDAWt2zBRP
	ezlPFvy37A3wEaLcXrMhl/MkTfmt1EPYS0suDiUe6Y4QvfyI5yzhuhkURKRO74Nxq8D2g9YkrWENt
	NRFhREx/8LGfLg+jZMupl0745d+bzhzbVjHkcaL9JWXwLlVb0J2jWktB9GphXXSpgGaE1ygkPT4gg
	i2TbgKEgZezDE9mTUFnYyKxA0QkJJuMU6LvO6tqKtp4+J+nSnQG/ODdyzXPlYNH8SF3RgCP91H8wO
	HlfgDZzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n52Sg-00EJvW-Bo; Wed, 05 Jan 2022 09:20:02 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n52ST-00EJsW-M2; Wed, 05 Jan 2022 09:19:51 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 94B421F4418B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1641374380;
 bh=LtPln65A6ei52Ra5ZjIGNfl8BDcMmtmHYl7VlsiP1xg=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=WeCznSwpIMye2KpsUdvAVVZNyalPfXKzOTWEV1f9p2m5MTBnUQpbcTbNoekHCpHHM
 maA+JfSIrPNCU6lJwoiaOeFaADAkUuKf4JmcsHWk1zNSQaimunp7ih5W7fC4fzdiAo
 Jbyac8O5RNycRom9gONqtTWkkI1307pWNXGAmhdoQHkBfDi2tLRcVNXIp6q00D7koP
 65Hs6Xz10Jm3hBcxbGk/FnjErk7WEvqyfVFqzqoX1E4zqik6Ir6kjQtAY3mzXxMKHm
 2MpYcYS7WF0fgawmnBeyTWCQeyBY0k7MZCoTuM1SyLJkEzAbbNtgNOIwP9EpiP/mvw
 1qaz/05d5OO/A==
Subject: Re: [PATCH 2/2] remoteproc: mediatek: Support mt8186 scp
To: "allen-kh.cheng" <allen-kh.cheng@mediatek.com>,
 Ohad Ben-Cohen <ohad@wizery.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Tinghan Shen <tinghan.shen@mediatek.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-remoteproc@vger.kernel.org
References: <20220104114706.27461-1-allen-kh.cheng@mediatek.com>
 <20220104114706.27461-3-allen-kh.cheng@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <5722750a-dc1a-3242-6371-90236b98d07b@collabora.com>
Date: Wed, 5 Jan 2022 10:19:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20220104114706.27461-3-allen-kh.cheng@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220105_011949_922565_3CC5A889 
X-CRM114-Status: UNSURE (   8.92  )
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

Il 04/01/22 12:47, allen-kh.cheng ha scritto:
> Add SCP support for mt8186
> 
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>

Reviewed-By: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
