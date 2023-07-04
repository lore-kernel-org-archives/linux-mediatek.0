Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A11EEB64DA
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Jul 2023 12:12:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QB8Q9QWo/UY2SL5TO3SDdTn1W5VnKoSSP5l4Zg3ubUk=; b=ZVEeynRHqitwW2quIpBtFr3InP
	EUNZNPnlX6pytdmC5ED+0feKmcjzluAjoLvUAyJrE8JWDGtA188ZumgTSVpTJ1ZgbXjQKEHx6H2je
	t0ZyQnVb1Fiy2oLjGnqfajdRxhXxclq9TGU4Z8J1C55XRD9ED+esNAdrObwOic6youGtjmY9WXTf6
	klogJWQt5nrk5Ahhi7vFW6wQ1qQMNDBzPt4MxUpoGrSBxI0A0N0xUHvgtL59/mwAXqiiAh3wuKI45
	h4F5BDJuZZsGKXUVC1aQwEBB24UFg86sd+aLj9o3x7QGydPFKWMRLHSQcYahqwgmcD45XO1SGZIz0
	Sy5KR3Rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGetP-00DCsp-0X;
	Tue, 04 Jul 2023 12:12:27 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGetJ-00DCo5-0n;
	Tue, 04 Jul 2023 12:12:22 +0000
Received: from [IPV6:2001:b07:2ed:14ed:c5f8:7372:f042:90a2] (unknown [IPv6:2001:b07:2ed:14ed:c5f8:7372:f042:90a2])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 318256606FA4;
	Tue,  4 Jul 2023 13:12:19 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1688472740;
	bh=nRd3q7ZVfh7Hxg8WYNaItpvGKjBVPg8fE1J0lRQiSqs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=m+w5QFX+D4TtK2tWfjiX1X1uL5JxiTpCqaRTWbQvXGff3aOm/qtW9X2sLkOG3XE9D
	 KcLeNWJd2RJw0KjyshbS1yrfS48HeB0+1xuDqAsNfFPEuU+mQLuB5wxw5V7iHot2Kb
	 LmffoL2Q55SW7ZmFxqQ7OVXGmBGJ/6wAjVcv+rKFebcbL9Jv5m38JW9+ySn8bPOOd7
	 JZfTkrrKk9cvR31lZFJUrwMRIKfqwzUgtnQwsSuOX8wvMPWBj8Dl7Od3wNQpXGClBm
	 u8PInyV2fyAgbylGRIesT4+MM/DsRmt6LEkTc1sZy4UCjuN0yL4iGsVbsKCpd0CqtS
	 ounW4lPu3AA6A==
Message-ID: <5d7e1103-b9be-63fe-e974-269873850051@collabora.com>
Date: Tue, 4 Jul 2023 14:12:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v5,08/11] media: mediatek: vcodec: separate struct
 mtk_vcodec_dev
Content-Language: en-US
To: Yunfei Dong <yunfei.dong@mediatek.com>,
 =?UTF-8?Q?N=c3=adcolas_F_=2e_R_=2e_A_=2e_Prado?= <nfraprado@collabora.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Nathan Hebert <nhebert@chromium.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Fritz Koenig <frkoenig@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 Steve Cho <stevecho@chromium.org>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20230704111327.7140-1-yunfei.dong@mediatek.com>
 <20230704111327.7140-9-yunfei.dong@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230704111327.7140-9-yunfei.dong@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230704_051221_415024_F1B371A6 
X-CRM114-Status: UNSURE (   6.87  )
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

Il 04/07/23 13:13, Yunfei Dong ha scritto:
> Adding different dev struct for encoder and decoder, remove
> 'struct mtk_vcodec_dev'.
> 
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



