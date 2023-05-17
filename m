Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DEBCC77B7F
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 May 2023 13:35:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:Date:
	Content-Type:Subject:Cc:To:From:Message-ID:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H2eszAyur7OFqZ2pzsk7HhbR0lXfV8LZ3reUmipy0B4=; b=0ELdbTzbJkjmxlyPR8dpWnX30x
	E6sTfHBi2h6J0MJAVl7zDYTQb1y4Fq+5QQLu6Fdv2J4aOgFX12MTUZhCR/i4oZcrV8oquVOqnxqLA
	FlbGULbcerKgPuwRSitNuewNYVu2e47IrgRxNBM7DZKi6YEbLhw6bajq43YFc8KaQjM8lEOigjHII
	bs+qrSxERyrGSmoxS/DtdALQAd1MzSSHONGE8pso+PfApO/tXYxEFs4muNlqlxtNCCRsh1WoFN/5o
	1MR+4tt8eIz0nGy7ko/2BWt75brdQuGpln93VfCG/hGpJ7ldS+MIwXT/g6hWSX1hNVWXrsalGWLJR
	PoYDQ/jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzHIw-00A0Bs-0A;
	Wed, 17 May 2023 13:34:58 +0000
Received: from mout.gmx.net ([212.227.15.19])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzHIs-00A08L-01;
	Wed, 17 May 2023 13:34:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=public-files.de;
	s=s31663417; t=1684330472; i=frank-w@public-files.de;
	bh=H2eszAyur7OFqZ2pzsk7HhbR0lXfV8LZ3reUmipy0B4=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
	b=VH0KENZht12vdsiyi3H/WBCPDDbvdNwgaQnr9jclo18R+LrKqoHEwDhfYi8OtywgJ
	 s4GAM9d5D/gx7bV7t0WEKgk9J1wMgGV7kcYb+NMf6HYl208qBWVb4LtemEa/JNwimd
	 5lZhqAFg3OPniht7zmyjq8ljuIs1ikegfrxIltLOJ2vk80l6alRSsTULeZlN2Pq8iH
	 x0jtJG3/vnn89625G1EE4Ba5TXdFF5ISf24Xt7rflJu2qZl6CvOeO+JCGKgRPp9k/b
	 nUSur1tB5dXQFhWHJ+78GhfFCjG28GvxGavXpLD7OE3b3bBvKV6Mp1xCyaAx/rRvkN
	 XH0TlqbCw1D3Q==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [80.245.72.243] ([80.245.72.243]) by web-mail.gmx.net
 (3c-app-gmx-bs48.server.lan [172.19.170.101]) (via HTTP); Wed, 17 May 2023
 15:34:32 +0200
MIME-Version: 1.0
Message-ID: <trinity-cf0185d3-81d6-4dfe-a1a3-2b091350d724-1684330472806@3c-app-gmx-bs48>
From: Frank Wunderlich <frank-w@public-files.de>
To: Frank Wunderlich <linux@fw-web.de>
Cc: linux-mediatek@lists.infradead.org, Jonathan Cameron <jic23@kernel.org>,
 Lars-Peter Clausen <lars@metafoo.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Srinivas Kandagatla
 <srinivas.kandagatla@linaro.org>, "Hui.Liu" <hui.liu@mediatek.com>, Zhiyong
 Tao <zhiyong.tao@mediatek.com>, Andrew-CT Chen
 <andrew-ct.chen@mediatek.com>, Lala Lin <lala.lin@mediatek.com>,
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Daniel
 Golle <daniel@makrotopia.org>
Subject: Aw: [PATCH v1 1/7] dt-bindings: nvmem: mediatek: efuse: add support
 for mt7986
Content-Type: text/plain; charset=UTF-8
Date: Wed, 17 May 2023 15:34:32 +0200
Importance: normal
Sensitivity: Normal
In-Reply-To: <20230421132047.42166-2-linux@fw-web.de>
References: <20230421132047.42166-1-linux@fw-web.de>
 <20230421132047.42166-2-linux@fw-web.de>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:+PriwoFuQ9abIMZuLjXiUflCoFiizPjfCrYouiPIvkfEKwb8FeC3a3oGc0qOF0DGHXWXO
 PUsxuPO4DpTtMuUBWYXoPqjzUPNfjWcm3auHPZGfODybilSjmBZULSX3YfnEKD/hsG/HElg5m4g9
 ukCFtztoUlVk7uSplewtpy4CzSVq0kAgPxzJNNkmHRb+J0X35KLEascX7qFpp6u8K4mhYN1vwqUr
 78AbCQf7ib1a3sAa+7zeXH0QMDQ+uDA3ecfFeMirKlqWQ8ku1UhjBmm/weaOxAUJ08UNcAgJc47N
 so=
UI-OutboundReport: notjunk:1;M01:P0:dEZsTW6b7+Y=;5hLcd+GMclPrdW8q7trNgwhEwVY
 tpf7IGTVHcy6+k98XiI+ZUS7ST4eds6sI6ZgppahC4le+74rtOAGZCNL0g1HO4ZG+4NIr7OnR
 5CLWXgCx6NCitDGKOkH+2tHqtcJh3BtC6c7EWrlCNRJXAMQmqtCNFOGNixtDGlvlotPTVpNX/
 v6gB8ZIjOH8MCmtfaozGR5pGevmC9CBvarDNVpy7+gN4QlJIJa+MngQyoop14rtBm8woOPHlb
 Ud6/LPbFerg6fwOmfuzhYb01w+fuRy008SV1BhLPmeW7KpW5lj4uRw4Ke/VIY11rQcRy2iZLk
 Hc+DFrQFDvWPXsMve+zZzzu+z7XtOKzDoWDCZKLTfH9hR1bONqkR9jwbSXTSAU1tLxHyRDqca
 h9+F3Y+yx/Sgty+NwooK/VnB9SF+PQkvx3tmey8bsVootCePGajTJub0KRuQTxGNkNlrVPdQ9
 xG2UlBoxOZTn3QKSQumb0LLUePU7EcHbNWJXRgXFJNdPWgySx2wGdfXv5mvXQ7imI0I21eb6F
 wlcKeYcSceNGYWeiRvuvuRwmrYwg8/BXEOB+y+DTwND7cKHQ3Dtkqiid4tNCpDOKNvnMwYsKK
 J6Zr1wIbSgbccYvCzw4/2zgdtKeV2zecNZo7766T4A6RBP9l20sauep3Zo7sCU6ldNW846yrD
 CtegCevAAaXIOPzmi4br6XjxvdvJ0qjdD6U2HZdk+5/8EkNl0/se0PyYBlqnfvZMshS9wBGsn
 4yQIyNyHEXMDPvm7bOaix+N0lQVvtuN9e+oPWBg098soC4GcNJ6g2E/rznBmuJkYilDMqvErr
 s7hidyOM4d+J7NmfpnG7Nrjw==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230517_063454_447511_23F19D32 
X-CRM114-Status: UNSURE (   6.35  )
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

Hi,

just a ping, can this be picked up?

regards Frank

