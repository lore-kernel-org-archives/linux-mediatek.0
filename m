Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67EAFC433FE
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Nov 2022 09:30:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cWWrnCghHhT1J5494E/yPmCufkWzY1wtbH5FVR/RWjg=; b=vo96kwmnnl6zQkLDclXUPFQqgL
	snXOtK2lsn+Fqv+lGVyskKI9xyo2kJO86SzTV1M8dRl0brUVpPCyilMa0PcB+Js0ykZAeR5/DvD0N
	Igf1fGrwIhwYl1gM5A+1qv4yVRgsW7fuY9PCkg28oKOM7GuoF+G8MbCkeKewDFcu6bYwnNrKL4SJP
	eMjOKhclItu/EzraZU5IMPVw7I++DagFZVg9A43jxWe04S4uCmnIO83Lf+gg1tVpRGDIa9Fpb2ZEp
	MltwkM8UHbwDQ3SfGhPlT3QxC8CdhcDiH24VolUTJX4J3sgUP3N3Csv7iToWK/xCUL4JY0aHTpNZO
	1WeoJd/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1orySc-00DK7l-10; Mon, 07 Nov 2022 09:30:30 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oryNg-00DGLu-6q; Mon, 07 Nov 2022 09:25:25 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 1526C660038D;
	Mon,  7 Nov 2022 09:25:22 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1667813122;
	bh=L4BTOxf8EfVaRtVRyQKbIwvN9SelwSbZ8rXFeZJu18A=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=GURCp/A1yH2u7bMEodbIIFDg0K3VHuubl9Cz1zC0gSwnny2rh9jqAOkSQmNeio6XQ
	 oQfvG6I3M1KvG41nWytHse547+qzXMe2Ag1Sio4Ur7LjKrjUmMoXCsxmdotVeZkBHs
	 3TuA2ahYAdDEGQlPWiVwGdxZyoZIDG28LEpZYPV516oxzKRdV2KlidFLEA0fmOcNQ4
	 EWEkJNd2mDzVXgp6/L+wf3B4/lL8F+7RG/w2d2sfBdpwyZfiyxK4avexx0/Vdg7YRI
	 DQbBlsQI68TVzV8Y7+Y2kXrQeaGTDsiers1fneAFDkEg2QbFpn+qx4MqqOvh4+72Qi
	 cyd9YSMBuKXYg==
Message-ID: <053b4e08-d6d5-26ec-9713-981f03458442@collabora.com>
Date: Mon, 7 Nov 2022 10:25:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [RESEND v2 2/2] dt-bindings: mmc: mtk-sd: add Inline Crypto
 Engine clock
Content-Language: en-US
To: Mengqi Zhang <mengqi.zhang@mediatek.com>, chaotian.jing@mediatek.com,
 ulf.hansson@linaro.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 wenbin.mei@mediatek.com
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20221106033924.9854-1-mengqi.zhang@mediatek.com>
 <20221106033924.9854-3-mengqi.zhang@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221106033924.9854-3-mengqi.zhang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221107_012524_436018_2573F137 
X-CRM114-Status: UNSURE (   6.01  )
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

Il 06/11/22 04:39, Mengqi Zhang ha scritto:
> Add optional crypto clock of the Inline Crypto Engine of Mediatek SoCs.
> 
> Signed-off-by: Mengqi Zhang <mengqi.zhang@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



