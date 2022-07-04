Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AA8CC43334
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Jul 2022 11:13:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rTuutB3TqNv2qgHicaoP2DHdPwe206DACTZ63agfvvk=; b=FG0nx7qeFVoP6O6PGxip6Qk74S
	UuMA7Qf8vZvjWXNVG57ZvClvSk8qpfGbd4tAY81yJxXvgify9oQz+couapUHZxa4DZBzrOeMIl+kO
	n60FDLaI44MwliEcsEDGN2c+dFliYN4hktdqCAzf+oLWq12nHqwrgryuD8rBd5w1bG3jBGRvxZ9D8
	AzjAErpMD0UITGISopng4onUXycjS7SFObp8j/xi6g1zv2HrZJhIREKq/9EnVkD4CsLALhO+vd78H
	eWQzqidjFQOo5QyzkFmrJGfj4nMYtUX0zS8+MLn5OQlh6Q3NSOszHY3hUUGHd/rOE7i+d2Ift1Wlo
	cjiKY3Nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8K1U-007Y9g-FL; Mon, 04 Jul 2022 11:13:48 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8JVk-0077VG-Pb; Mon, 04 Jul 2022 10:41:03 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 3F9906601986;
	Mon,  4 Jul 2022 11:40:58 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1656931259;
	bh=rmhVt28JlLrhxg1ooe6+1Xf8AiQTFXSryp/Ah8yePv4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=FbDWAOEEZ6V1CRTFNZp58f0d0KUcs8o/h+qbAvLh9jhRphuY8QAB5nrqUF8cFUUEy
	 lbTB5EJ1ZM2N91LLX9Jw+kte89CQ0iOjEgpXIxv1CbmaxivJPpEr1qLGdQ03RwbP6k
	 9LENoBb4gM3xVY3NfFSC9mGbvdGI00Ii3LFBANYkIa3ZTpIYJDxyAI0+18oNluvE51
	 GltIFE7Y8j4S5OMPGr3km/lT5DBo3g1QogDvAlvyjhFMsiY/ntyNfYKRT4vRogyctQ
	 F7YfvOLDsUU9mV8jRt44x+FaiR7yZ1xBPyADW+1RBs3X4HKzpqeZkzDqpwaHMfjmn+
	 bG39NvuTv01WQ==
Message-ID: <282c69f4-53c9-e883-be94-e57872482f08@collabora.com>
Date: Mon, 4 Jul 2022 12:40:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v1 13/16] arm64: dts: mt8195: Specify audio reset
 controller
Content-Language: en-US
To: Tinghan Shen <tinghan.shen@mediatek.com>, Yong Wu <yong.wu@mediatek.com>,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>, Weiyi Lu <weiyi.lu@mediatek.com>
Cc: iommu@lists.linux-foundation.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Trevor Wu <trevor.wu@mediatek.com>
References: <20220704100028.19932-1-tinghan.shen@mediatek.com>
 <20220704100028.19932-14-tinghan.shen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220704100028.19932-14-tinghan.shen@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220704_034101_021881_77E07990 
X-CRM114-Status: UNSURE (   7.81  )
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

Il 04/07/22 12:00, Tinghan Shen ha scritto:
> From: Trevor Wu <trevor.wu@mediatek.com>
> 
> Specify audio reset controller for audio hardware resetting.
> 
> Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>
> Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


