Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4484C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Feb 2022 15:21:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j7yhpMLCxVXniRJ6hLskg9VaTtZVl8vvg9gvmuRI4VE=; b=1LrLJBfLd2t0fy
	p9W5zDPCh/AivsstiSA7DGg40SZt5zl03BFFEVybkS6A6wUhHpzcK7AxFVusvYvudYa+u4xnYvmkQ
	qVHxF3hPe/ixYNxpq3mWRyk169vd9HtLQ8M3BZ675o3lQFTCE+mpeKwRUZF5+B5t0aru983v69pz/
	lLKnmRR+1aNXFZ3dQGH35XZg+oIR/BhYydBtE3dMC9MKIlA5n0SrwZuwCur8yfhJwQMByUnEvF2/8
	j7vsclo/mvGo0Y1yOcR6HoL0+M2gs7vn4CdhreSaC4hFR3PfR9YhgZdQPclpf9f6UJ7N04vVUbLNY
	YFrOGFXqboyrXCTIl+wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nFdvH-001ofq-Pi; Thu, 03 Feb 2022 15:21:23 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nFdv2-001oYQ-FQ; Thu, 03 Feb 2022 15:21:10 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 56F011F45DD5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1643901667;
 bh=iV1sqiQOtKFpu0HhrXC3X2rfQtdmuKUeRmBVzyqKu0I=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=J+mpjeD7bci9vv0bH96Og16BmYCzyreKPjr3Y6HPlSRJz//zz4FNDho5jeRTabd6L
 BLZAopmgAguskvL0BKTuSVCYRZKC2lw1wqbg/PVZF8Nd7kCVk3j19AahmCs/qm8r24
 TqTmRSoQbLsEPRq+9QHpjUFd+1+RO/BOanvYxMEWXOvJf6YHnBcWQ/VgGD9J4DfVZd
 o+FxTngvDtwyxhKAKeXCMD9SRM+m/RgOgd1SJkFVUdXuISgnQNNmh+zh+o5o6eBYu+
 xv2zErDYc7Fphlo3xBM+1mBf2vG4qlaVsxM1rpF7b7w2ldmxnjxYXL2ovy/uXQqFzg
 RX9uZV0Obz49g==
Message-ID: <d40ab2d8-14ec-ca7b-b182-bcd750ff24a1@collabora.com>
Date: Thu, 3 Feb 2022 16:21:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [V11,PATCH 15/19] regulator: mediatek: add support for mt8195
Content-Language: en-US
To: Dawei Chien <dawei.chien@mediatek.com>,
 Georgi Djakov <georgi.djakov@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Stephen Boyd
 <swboyd@chromium.org>, Ryan Case <ryandcase@chromium.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Nicolas Boichat
 <drinkcat@google.com>, devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Fan Chen <fan.chen@mediatek.com>,
 Arvin Wang <arvin.wang@mediatek.com>, James Liao <jamesjj.liao@mediatek.com>
References: <20210812085846.2628-1-dawei.chien@mediatek.com>
 <20210812085846.2628-16-dawei.chien@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20210812085846.2628-16-dawei.chien@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220203_072108_719808_22C49616 
X-CRM114-Status: UNSURE (   6.25  )
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

Il 12/08/21 10:58, Dawei Chien ha scritto:
> add platform data on mt8195
> 
> Signed-off-by: Dawei Chien <dawei.chien@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
